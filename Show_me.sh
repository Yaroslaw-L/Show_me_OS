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

echo "***"

echo "Users with Bash shell:"
awk -F: '/\/bin\/bash$/ {print $1}' /etc/passwd

echo "***"

echo "Use Socket Statistics for show the open ports:"

if command -v ss &> /dev/null
then
	sudo ss -tuln | awk 'NR>1 {split($5, a, ":"); print a[2]}'
else
	pass
	exit 1
fi