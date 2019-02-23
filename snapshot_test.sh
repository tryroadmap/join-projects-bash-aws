#!/bin/bash
# Volume list file will have volume-id:Volume-name format
DATE=`date +%Y-%m-%d`

# Sending the mail Update
echo "Sending the mail Update"
echo "$DATE" | mailx support@xphilly.com --subject "ubuntu"

echo "Exporting to s3://out"
aws s3 cp date.txt s3://star227/out/

echo "Sending SNS"
aws sns create-topic --name uploaded_to_out

SUBSCRIBE_TO=arn:aws:sns:us-east-1:613778720632:uploaded_to_out
EMAIL_TO_=support@xphilly.com

aws sns subscribe --topic-arn $SUBSCRIBE_TO --protocol email --notification-endpoint $EMAIL_TO_


