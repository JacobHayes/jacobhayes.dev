#!/bin/bash

set -e

for file in "$@"; do
  if [[ "$file" =~ \.(jpg|jpeg|png|tiff|tif)$ ]]; then
    echo "Stripping metadata from $file"
    exiftool -all= "$file"

    # Remove the _original file created by exiftool
    original_file="${file}_original"
    if [[ -f "$original_file" ]]; then
      rm "$original_file"
    fi
  fi
done
