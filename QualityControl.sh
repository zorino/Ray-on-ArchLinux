#!/bin/bash

run(){
	command=$1
	echo "$(date)) $command"
	$command
	echo ""
}

run "namcap PKGBUILD"
run "makepkg -f PKGBUILD"
run "namcap *.xz"


