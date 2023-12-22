#!/usr/bin/env bash

echo -e "====================
VirtualBox Run FIX
====================\n"

function load_modules(){
	modprobe vboxdrv
	modprobe vboxnetflt
}

if [[ $UID -ne 0 ]]; then
	echo -e "\e[1;31m[-] Root apenas.\e[0m"
	exit 1
else
	echo -e "\e[1;33m[*] Carregando modulos...\e[0m"

	## Load modules on kernel
	load_modules

	if [[ $? -eq 0 ]]; then
		echo -e "\e[1;32m[+] Modulos carregados!\e[0m"
	else
		echo "\e[1;31m[-] Houve um erro ao tentar carregar os modulos!\e[0m"
		exit 1
	fi
fi
