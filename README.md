## Build service to receive and handle SNMP traps using Docker

#### Build docker image
`docker build -t snmptrap-service .`

### Run docker container
`docker run --cap-add=NET_ADMIN --name snmtrap_receive_and_handle -dp 162:162/udp snmptrap-service`