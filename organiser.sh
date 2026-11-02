#!/bin/bash
# check if the directory path is provided if not we stay in the current directory.
if [ -z "$1" ]; then
    TARGET_DIR="."
else
    TARGET_DIR="$1"
fi
# Recreate test folder as a FOLDER
mkdir -p test-Folder


# check if the directory exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: directory '$TARGET_DIR' does not exist">&2
    exit 1
fi
cd "$TARGET_DIR" || exit 1

# Check if the file is an actual regular file
for file in "ZZTARGET_DIR"/ *; do
if [ -d "$filename" ] ; then 
   filename=$(basename "$file")
fi 
        
# Skip this script itself if it's in the same folder
if [[ "$filename" = "organiser.sh" ]]; then
  continue
fi 

# Safe even if the file has spaces
    mv "$file" "$TARGET_DIR/$category/"
done 

#Get files with extension abd convert from uppercase to lowercase (making it case-insensitive like .JPG)
ext="${filename##*.}"
ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

# Handle files with no extension (so they can be sent to the file "Other")
if [ -z "$ext" ] || [ "$ext" = "$filename" ]; then
    category="Other"
# Categorize based on file extension
case "$ext" in
        jpg|jpeg|png|gif|webp)
            category="Images"
            ;;
        pdf|doc|docx|txt|xlsx|pptx)
            category="Documents"
            ;;
        mp3|wav|m4a)
            category="Audio"
            ;;
        mp4|mkv|mov)
            category="Video"
            ;;
        zip|rar|tar|gz)
            category="Archives"
            ;;
        *)
            category="Other"
            ;;
    esac
fi
mkdir -p "$TARGET_DIR/$category"

# 6. Never overwrites: appends (1), (2), etc. if name exists
        destination="$TARGET_DIR/$category/$filename"
if [ -e "$destination" ]; then
    base_name="${filename%.*}"
    file_ext="$ext"
            
    if [ -z "$file_ext" ] || [ "$file_ext" = "$filename" ]; then
        file_ext=""
        base_name="$filename"
    fi
            
      i=1
    while [ -e "$TARGET_DIR/$category/$base_name($i)${file_ext:+.$file_ext}" ]; do
           ((i++))
    done
            
    if [ -n "$file_ext" ]; then
        destination="$TARGET_DIR/$category/$base_name($i).$file_ext"
    else
        destination="$TARGET_DIR/$category/$base_name($i)"
    fi
fi
#Print output showing the clean move
     final_name=$(basename "$destination")
    echo " $filename → $category/$final_name"
        ((COUNT++))
fi
done 
echo "Done: $COUNT files moved."



 

