CC_SRC_PATH=github.com/mysacc2
CHANNEL_NAME=mychannel
CCNAME=mysacc
VERSION=1.0


docker exec cli peer chaincode install -n $CCNAME -v $VERSION -p $CC_SRC_PATH

docker exec cli peer chaincode instantiate -C $CHANNEL_NAME -n $CCNAME -v $VERSION -c '{"Args":[]}' -P 'OR ("Org1MSP.member","Org2MSP.member","Org3MSP.member")'


docker exec cli peer chaincode invoke -C $CHANNEL_NAME -n $CCNAME -c '{"Args":["set","a","100"]}'

sleep 3

docker exec cli peer chaincode invoke -C $CHANNEL_NAME -n $CCNAME -c '{"Args":["set","b","200"]}'

sleep 3

docker exec cli peer chaincode query -C $CHANNEL_NAME -n $CCNAME -c '{"Args":["get","a"]}'

docker exec cli peer chaincode query -C $CHANNEL_NAME -n $CCNAME -c '{"Args":["get","b"]}'


docker exec cli peer chaincode query -C $CHANNEL_NAME -n $CCNAME -c '{"Args":["getAllKeys"]}'