#!/bin/bash

#To change path to website edit the path to website variable.

path_to_website=~/Programming/basic-website-generator/
files=("$path_to_website"*)

web_gen_for_file() {
	cat "$path_to_website"header.html > "$1".html
	markdown "$1".md >> "$1".html
	cat "$path_to_website"footer.html >> "$1".html
}


for f in "${files[@]}"
do
	extension=$(echo "$f" | cut -d'.' -f2)
	file_without_extension=$(echo "$f" | cut -d '.' -f1)

	if [ "$extension" == md ]
	then
		web_gen_for_file "$file_without_extension"
	fi
done
