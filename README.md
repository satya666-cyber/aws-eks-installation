###############################          scipt process        ###################################

# Below link for eksctl,kubctl and aws-iam-authenticator

bash <(curl -Ls https://raw.githubusercontent.com/ypmn/aws-eks-installation/master/iam_authen-kubectl-eksctl-install.sh)




###############################        Below the manual Process     ############################

# Installing aws-iam-authenticator

curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator

curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator.sha256

openssl sha1 -sha256 aws-iam-authenticator

chmod +x ./aws-iam-authenticator

mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH

echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

aws-iam-authenticator version

# Install kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version

# aws-eksctl-installation

# Download and extract the latest release of eksctl with the following command.

curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

eksctl version

# To know more option related to cluster info use below command

eksctl help

# Now Create an IAM-Role with mentioned requirement
# Select the ec2 service and select the administrator access policy and attch this role to running ec2 instance 

# 2 Create your Amazon EKS cluster and worker nodes with the following command

eksctl create cluster \
--name nethaji-cluster \
--region us-east-2
--version 1.13 \
--nodegroup-name standard-workers \
--node-type t3.medium \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--node-ami auto

# Expected output 

    [ℹ]  using region us-west-2
    [ℹ]  setting availability zones to [us-west-2b us-west-2c us-west-2d]
    [ℹ]  subnets for us-west-2b - public:192.168.0.0/19 private:192.168.96.0/19
    [ℹ]  subnets for us-west-2c - public:192.168.32.0/19 private:192.168.128.0/19
    [ℹ]  subnets for us-west-2d - public:192.168.64.0/19 private:192.168.160.0/19
    [ℹ]  nodegroup "standard-workers" will use "ami-0923e4b35a30a5f53" [AmazonLinux2/1.12]
    [ℹ]  creating EKS cluster "prod" in "us-west-2" region
    [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial nodegroup
    [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-west-2 --name=prod'
    [ℹ]  building cluster stack "eksctl-prod-cluster"
    [ℹ]  creating nodegroup stack "eksctl-prod-nodegroup-standard-workers"
    [✔]  all EKS cluster resource for "prod" had been created
    [✔]  saved kubeconfig as "/Users/ericn/.kube/config"
    [ℹ]  adding role "arn:aws:iam::111122223333:role/eksctl-prod-nodegroup-standard-wo-NodeInstanceRole-IJP4S12W3020" to auth ConfigMap
    [ℹ]  nodegroup "standard-workers" has 0 node(s)
    [ℹ]  waiting for at least 1 node(s) to become ready in "standard-workers"
    [ℹ]  nodegroup "standard-workers" has 2 node(s)
    [ℹ]  node "ip-192-168-22-17.us-west-2.compute.internal" is not ready
    [ℹ]  node "ip-192-168-32-184.us-west-2.compute.internal" is ready
    [ℹ]  kubectl command should work with "/Users/ericn/.kube/config", try 'kubectl get nodes'
    [✔]  EKS cluster "prod" in "us-west-2" region is ready


# To know more info about cluster use below command

eksctl help

# Get cluster info by using below command

eksctl get cluster

# Delete the eks-cluster 

eksctl delete cluster --name ttprod --region us-east-2










