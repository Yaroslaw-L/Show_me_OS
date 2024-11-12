#!/bin/bash
echo "Operating System Version:"
if [ -f /etc/os-release ]; then
	. /etc/os-release
	echo "Name: $NAME"
    echo "Version: $VERSION"
else
	echo "Error. Rewrite script"
fi

if [ -f /etc/upstream-release/lsb-release ]; then
    . /etc/upstream-release/lsb-release
    echo "Ubuntu based: $DISTRIB_DESCRIPTION"
else
	pass
fi