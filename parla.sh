#!/bin/bash

if [ $# -ge 1 ]
then
    espeak -v it -p 1 -s 1 "$1" &> /dev/null
fi
