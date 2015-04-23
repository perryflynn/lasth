
This script finds commands in bash history by a regular expression.

## Basic usage
```sh
$ lasth.sh "^ssh "
Welcome to lasth. Checking for history entries that match "^ssh "

[001] ssh root@localhost -i test.key
[002] ssh perryflynn@192.168.1.1
[003] ssh root@google.com
[004] ssh proxy@192.168.42.171 -L 8080:localhost:8080
[005] ssh test@example.com -p 2180
[006] ssh -i /cygdrive/d/private/uberspace_blechert blog@example.com
[007] ssh admin@verysecretserver.com

Please choose [1-7]: 7

Run `ssh admin@verysecretserver.com`...

Verification code:
Password:
```

## Installation

```sh

```
