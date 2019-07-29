echo " AWS CLI Installation"

sudo apt install python-pip

pip install awscli

export PATH=$PATH:~/.local/bin


echo "Installing aws-iam-authenticator "

curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator


chmod +x ./aws-iam-authenticator

sudo mv aws-iam-authenticator /usr/local/bin/

aws-iam-authenticator version

echo "Install kubectl "

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl



echo "aws-eksctl-installation "

echo "Download and extract the latest release of eksctl with the following command "

curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

eksctl version

kubectl version


