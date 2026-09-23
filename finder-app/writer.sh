#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Must specify both arguments: writefile and writestring"
    echo "Example: ./writer.sh <writefile> <writestring>"
    exit 1
fi

writeFile=$1
writeString=$2

# Detemine directory path of file
fileDir=$(dirname $writeFile)
if [ $? -ne 0 ]; then
    echo "Failed to determine directory name of file"
    exit 1
fi

# Create path for file
mkdir -p $fileDir
if [ $? -ne 0 ]; then
    echo "Failed to create directory for file"
    exit 1
fi

# Write contents to file
echo "$writeString" > $writeFile
if [ $? -ne 0 ]; then
    echo "Failed to write file"
    exit 1
fi

echo "Successfully wrote \"$writeString\" to file $writeFile"
