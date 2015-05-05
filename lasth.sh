#!/bin/bash

if [ "$1" == "" ]; then
   echo "This script search for history entries with a regular expression."
   echo "Usage: $0 \"^somecommand\""
   exit 1
fi

echo "Welcome to lasth. Checking for history entries that match \"$1\""
echo

# Find connections
HISTFILE=~/.bash_history
set -o history
CONNECTIONS="$(history | cut -c 8- | grep -E "$1" | sort | uniq)"
unset HISTFILE
set +o history

# Matches?
if [ "$(echo -n "$CONNECTIONS" | grep -c '^')" -lt 1 ]; then
   echo "No matching entries found. Abort."
   exit 1;
fi

# Print connection
CTNR=0
while IFS= read -r line
do
   CTNR=$[$CTNR+1]
   echo "[$(printf %03d $CTNR)] $line"
done <<< "$CONNECTIONS"


# Select connection
echo
read -p "Please choose [1-$CTNR]: " selection
echo


# You idiot...
if [ $selection -lt 1 ] || [ $selection -gt $CTNR ]; then
   echo "Invalid selection. Abort.";
   exit 1;
fi

# Get command
CMD=$(echo "$CONNECTIONS" | sed -n "$selection"p)

# Add selected command to history
HISTFILE=~/.bash_history
set -o history
echo "$CMD" >> $HISTFILE
unset HISTFILE
set +o history

# Execute
echo "Run \`$CMD\`..."
echo
$CMD

# EOF
