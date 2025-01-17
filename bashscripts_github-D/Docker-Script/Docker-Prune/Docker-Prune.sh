#!/bin/bash

# bash $HOME/bashscripts_github/bashscripts_github-D/Docker-Script/Docker-Prune/Docker-Prune.sh

# AUTHOR: PREETPAL BASSON
# PURPOSE: Docker Prune Command executed to Remove all unused Images, Containers and Networks etc. PLEASE USE WITH CAUTION
# PREREQUISITE: Execute from Anywhere 

function header(){
    echo "-----------------------------"
    echo "# Script - $1"
    echo
}

function entry_select() {
    echo "Select?"
    select list in Prune-All Prune-System Prune-Images Exit
    do
        case $list in
                Prune-All)
                    echo && echo "$list Has Been Selected "
                    docker-system
                    docker-image
                    break
                ;;
             
                Prune-System)
                    echo && echo "$list Has Been Selected "
                    docker-system
                    break
                ;;
             
                Prune-Images)
                    echo && echo "$list Has Been Selected "
                    docker-image
                    break
                ;;
             
                Exit)
                    echo && echo "Script will now exit"
                    exit
                    break
                ;;
                *)
                    echo "Invalid Option"
                ;;
        esac
    done
}

function initialize() {
    echo "!!! WARNING: Docker Container/s and Image/s will be Removed. PLEASE USE WITH CAUTION"
    echo 
}

function docker-system() {
    docker system prune
    echo 
    docker ps -a
    echo 
}

function docker-image() {
    docker image prune
    echo 
    docker image ls
    echo 
}


header 'START' && echo

initialize

entry_select

echo && header 'END'
