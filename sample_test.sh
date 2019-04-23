#!/usr/bin/env bash
# use port 65499
HOST="localhost"
PORT=${1}

# colors
green=$"\e[92m"
red=$"\e[91m"
yellow=$"\e[93m"
color_off=$"\e[0m"

# TEST 1 - check for redirect to /applications when requesting $HOST:$PORT
RES=$(curl -s http://$HOST:$PORT)
echo -e "${yellow}GET $HOST:$PORT ${color_off}"
if echo $RES | grep -i -q 'Found. Redirecting to /applications'; then
    echo -e "${green}PASS ${color_off}"
else
    echo -e "${red}FAIL ${color_off}"
    # verbose print of bad response
    curl -v http://$HOST:$PORT
fi

# TEST 2 - ...
RES=$(curl -s http://$HOST:$PORT/applications)
echo -e "${yellow}GET $HOST:$PORT ${color_off}"
if echo $RES | grep -i -q 'cuphead'; then
    echo -e "${green}PASS ${color_off}"
else
    echo -e "${red}FAIL ${color_off}"
    echo "Failed to get http://$HOST:$PORT/applications"
fi


# TEST 3 - ...

