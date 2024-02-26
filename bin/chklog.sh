#!/bin/bash

if [ $# -ne 1 ] ; then
	echo "Usage: $0 <Log filename>"
	exit 1
fi

RE1=$(date +'%b')
RE2=$(date +'%d')
if [ $RE2 -le 9 ] ; then
	RE2=$(echo $RE2 | cut -c2-)
	RE2=" $RE2"
fi
cat $1 | egrep "$RE1 $RE2" | egrep -n -i --color 'warn|errror|fail|crit|alert|emerg'
