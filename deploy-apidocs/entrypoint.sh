#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials


# Global config deployed on project subdir
aws s3 cp apidoc/conf-admin s3://${AWS_S3_BUCKET}/${API_NAME}/conf-admin --recursive --region ${AWS_REGION}


# Commons definitions deployed on commons subdirs
aws s3 cp apidoc/schemas s3://${AWS_S3_BUCKET}/schemas --recursive --region ${AWS_REGION}
aws s3 cp apidoc/parameters s3://${AWS_S3_BUCKET}/parameters --recursive --region ${AWS_REGION}

rm -rf ~/.aws