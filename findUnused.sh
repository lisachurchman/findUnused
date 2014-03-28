# Creates a list of text files in current directory
fileList=$(find . | grep -E ".+(txt|json|xml)")
# Creates a list of image files in current directory
imageFilelist=$(find . | grep -E ".+(jpg|png|gif|jpeg)")

# Looks through list of images
for image in $imageFilelist;
do
    # For each image, finds if the image is also in
    # the list of files in current directory
    grep -R -q $image $fileList;
    # If the current image is not found and false (returns
    # 1), then the path of the image is printed.
    if [ $? -eq 1 ]; then
        echo $image
    fi
done
