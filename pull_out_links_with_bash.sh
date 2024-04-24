#!/bin/bash

rooturl="<insert_your_link_here>" # Insert the URL here

# Pull links for .zip files
links=$(curl -s "$rooturl" | grep -oP 'href="\K[^"]*\.zip(?=")')
if [ $? -ne 0 ]; then
    echo "Failed to fetch data from $rooturl"
    exit 1
fi

desktop="$HOME/Desktop" # Directory where the file is saved
savefile="$desktop/<insert_filename>" # Insert filename here

> "$savefile"

for link in $links; do
    if [[ $link != http* ]]; then
        link="$rooturl$link"
    fi
    echo $link >> "$savefile"
done

echo "Links have been saved to $savefile"

