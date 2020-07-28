CC_SRC_PATH=github.com/teamate
CHANNEL_NAME=mychannel
CCNAME=teamate
VERSION=1.0

docker exec cli peer chaincode install -n $CCNAME -v $VERSION -p $CC_SRC_PATH

docker exec cli peer chaincode instantiate -o orderer.example.com:7050 -C $CHANNEL_NAME -n $CCNAME -v $VERSION -c '{"Args":["addUser","user1"]}' -P 'OR ("Org1MSP.member","Org2MSP.member","Org3MSP.member")'

sleep 3

docker exec cli peer chaincode invoke -C $CHANNEL_NAME -n $CCNAME -c '{"Args":["readRating","user1"]}'