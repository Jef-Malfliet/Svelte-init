#!/bin/bash
set -o errexit
set -o nounset

checkDirectory(){
    #check if directory exists
    if [ ! -d $1 ]
        then
        #make directory
        mkdir $1
    fi
    #cd to directory
    cd $1
}

installSvelte(){
    #get svelte setup
    npx degit sveltejs/template $1

    #cd to directory of project
    cd $1

    #install all dependecies
    npm install
    code .
}

#check for correct input
if [ $# -gt 2 ] || [ $# -lt 1 ]
    then
    echo "intended use: \"svelte-init project-name [directory]\""
    exit
else
    #check if directory is passed as parameter
    if [ $# -eq 2 ]
        then
        checkDirectory $2
    fi
    
    installSvelte $1
fi