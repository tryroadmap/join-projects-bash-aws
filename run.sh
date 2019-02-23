chmod +x snapshot.sh

# read task by SQS with 2 parameters ( key_of_source_pdf , key_of_dest_s3_folder )

# download pdf and other test assets @README.md
aws s3 sync  s3://star227/in/ .

sudo ./snapshot.sh
