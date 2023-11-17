# Make the script executable
# chmod +x IAC_script.sh  
# ./IAC_script.sh create_network  
# ./IAC_script.sh create_app 
# ./IAC_script.sh delete__network
# ./IAC_script.sh delete_app  

NETWORK_STACK_NAME=udagramnetwork
APP_STACK_NAME=udagramapp
NETWORK_TEMPLATE_FILE=network.yml
APP_TEMPLATE_FILE=udagram.yml
NETWORK_PARAMETERS_FILE=network-parameters.json
APP_PARAMETERS_FILE=udagram-parameters.json
REGION=eu-central-1

create_stack() {
    local stack_name=$1
    local template_file=$2
    local parameters_file=$3

    echo "Creating stack: $stack_name"
    aws cloudformation create-stack \
        --stack-name $stack_name \
        --template-body file://$template_file \
        --parameters file://$parameters_file \
        --region $REGION \
        --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
    echo "Stack creation initiated for $stack_name..."
}

delete_stack() {
    local stack_name=$1

    echo "Deleting stack: $stack_name"
    aws cloudformation delete-stack --stack-name $stack_name
    echo "Stack deletion initiated for $stack_name..."
}

if [ "$1" == "create_network" ]; then
    create_stack $NETWORK_STACK_NAME $NETWORK_TEMPLATE_FILE $NETWORK_PARAMETERS_FILE
elif [ "$1" == "create_app" ]; then
    create_stack $APP_STACK_NAME $APP_TEMPLATE_FILE $APP_PARAMETERS_FILE
elif [ "$1" == "delete_network" ]; then
    delete_stack $NETWORK_STACK_NAME
elif [ "$1" == "delete_app" ]; then
    delete_stack $APP_STACK_NAME
else
    echo "Invalid argument. Please use 'create' or 'delete'."
fi
