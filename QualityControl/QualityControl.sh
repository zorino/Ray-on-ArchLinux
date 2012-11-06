#!/bin/bash

run(){
	echo "TestForArchLinux"
	command=$1
	echo "$(date)) $command"
	$command
	echo ""
}

(
run "namcap PKGBUILD"
run "makepkg -f PKGBUILD"
run "ls *.xz"
run "namcap *.xz"

) &> QualityControl-$(date +%Y-%m-%d-%H-%M-%S-%s).txt
