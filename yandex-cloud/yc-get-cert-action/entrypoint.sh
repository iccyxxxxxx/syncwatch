#!/bin/sh -l

YC_SA_JSON_CREDENTIALS=$1
YC_FOLDER_ID=$2
YC_CERTIFICATE_ID=$3

echo "Setting Service Account JSON credentials..."
echo $YC_SA_JSON_CREDENTIALS > key.json

echo "Installing GitHub CLI..."
mkdir -p opt/gh
curl -Lo tmp/ghlinux.tar.gz \
  --create-dirs \
  https://github.com/cli/cli/releases/download/v2.23.0/gh_2.23.0_linux_amd64.tar.gz \
  && tar --strip-components=1 -xf tmp/ghlinux.tar.gz -C opt/gh \
  && rm tmp/ghlinux.tar.gz

PATH=$PATH:/opt/gh/bin/gh
gh --help

# echo "Installing Yandex Cloud CLI..."
# curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | \
#     bash -s -- -i /opt/yandex-cloud -n
# PATH=$PATH:/opt/yandex-cloud/bin/

# echo "Creating Service Account profile..."
# yc config profile create sa-profile
# yc config set service-account-key key.json
# yc config set folder-id $YC_FOLDER_ID

# echo "Getting certificate..."
# yc certificate-manager certificate content --id $YC_CERTIFICATE_ID --chain certificate_full_chain.pem --key private_key.pem > /dev/null
# CERTIFICATE_FULL_CHAIN=`cat certificate_full_chain.pem`
# PRIVATE_KEY=`cat private_key.pem`

# echo "Converting certificate to a single string..."
# CERTIFICATE_FULL_CHAIN=$(echo "$CERTIFICATE_FULL_CHAIN" | tr '\n' ';')
# PRIVATE_KEY=$(echo "$PRIVATE_KEY" | tr '\n' ';')

# echo "Sending certificate to Github Output..."
# echo "certificate-full-chain<<EOF" >> $GITHUB_OUTPUT
# echo "$CERTIFICATE_FULL_CHAIN" >> $GITHUB_OUTPUT
# echo "EOF" >> $GITHUB_OUTPUT

# echo "private-key<<EOF" >> $GITHUB_OUTPUT
# echo "$PRIVATE_KEY" >> $GITHUB_OUTPUT
# echo "EOF" >> $GITHUB_OUTPUT

# echo "Done!"