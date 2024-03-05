#!/bin/bash

### This script pulls the current state from main branches for each git repository located in specific directory.

declare -r REPOS_DIR="/home/ekrem/Documents/gitrepos"
declare -r GREEN='\033[0;32m'
declare -r NOCOLOR='\033[0m'

for dir in "${REPOS_DIR}"/*; do
  if [ -d "${dir}/.git" ]; then
    repo_name="${GREEN}$(basename "${dir}")${NOCOLOR}"

    echo ""
    echo ""
    echo -e "================================================================================> Updating ${repo_name}"
    echo ""
    echo ""

    cd "${dir}" || exit
    git checkout main 2> /dev/null && git pull --rebase
  fi
done
