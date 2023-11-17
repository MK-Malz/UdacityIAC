# CD12352 - Infrastructure as Code Project Solution
# Malte Klane

## Spin up instructions

# Use the IAC_script.sh
# chmod +x IAC_script.sh  
# ./IAC_script.sh create_network  
# ./IAC_script.sh create_app 
 
# Use AWS CLI Commands
# aws cloudformation create-stack --stack-name udagramnetwork --template-body file://network.yml --parameters file://network-parameters.json --region=eu-central-1 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"
# aws cloudformation create-stack --stack-name udagramapp --template-body file://udagram.yml --parameters file://udagram-parameters.json --region=eu-central-1 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"

## Tear down instructions

# Use the IAC_script.sh
# chmod +x IAC_script.sh 
# ./IAC_script.sh delete__network
# ./IAC_script.sh delete_app

# Use AWS CLI Commands
# aws cloudformation delete-stack --stack-name udagramnetwork
# aws cloudformation delete-stack --stack-name udagramnapp

## Other considerations
http://udagra-loadb-iqooxqscvez0-1118666438.eu-central-1.elb.amazonaws.com/