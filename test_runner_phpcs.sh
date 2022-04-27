#!/bin/sh
read -p "Enter repo name  (woodstock): " repo
read -p "Enter base branch(feature/VDxxx): " base
read -p "Enter dest branch(feature/VDxxx): " dest

[[ -z "$repo" ]] || [[ -z "$base" ]] || [[ -z "$dest" ]] && echo "Missing input" && exit;
list_files_change=$(git -C /data/${repo} diff "${base}..${dest}" --line-prefix="/data/${repo}/" --name-only)
[[ -z "$list_files_change" ]] && echo "Don't have any change with base branch" && exit;
phpcs --standard=PSR2 $list_files_change
