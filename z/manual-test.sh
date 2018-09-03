# Test cases
# This will catch any exit
done=0

trap cleanup SIGINT SIGTERM EXIT

cleanup() {
    echo cleanup
    if [ !done ]; then
        kill -s SIGHUP "${BGJOB}"
    fi
    # write out the reloop file
    echo Exit
    exit 0
}

NODE="${NODE:D}"

mosquitto_sub -v -t 'home/test/#' > results-1.txt &
BGJOB="${!}"
ps

# Get the job number 
# Node B is set to 10/5
mosquitto_pub -t "home/test/countdown" -m '                                                                                                                                                                                                                                                                '
mosquitto_pub -t "home/test/countdown" -m '                                                                                                                                                                                                                                                                '
mosquitto_pub -t "home/test/countdown" -m ''
mosquitto_pub -t "home/test/countdown" -m ''
mosquitto_pub -t "home/test/countdown" -m '=[ start ]======================================================================'

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### 1'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '1'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### off'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'OFF'
sleep 5

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### 0'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '0'
sleep 5

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### stop'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'STOP'
sleep 5

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### cancel'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'CANCEL'
sleep 5

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### junk'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'JUNK'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/on'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/off'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'off'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### 1/0'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '1'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '0'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/stop'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'stop'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/cancel'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'cancel'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/on'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"on","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/off'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"on","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'off'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/stop'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"on","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'stop'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/cancel'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"on","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'cancel'
sleep 35

#
mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/on & on'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"on","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'
sleep 35
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'on'
sleep 35

# This will change the time from 6/3 to 7/4
mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/on with new timeout'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"on","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"on","timeout":7,"warning":4}'
sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/junk'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"ON","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m 'junk'
sleep 35

#mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
#mosquitto_pub -t "home/test/countdown" -m '### on/on'
#mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"ON","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{"notpayload":"junk"}'
#sleep 35

#mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
#mosquitto_pub -t "home/test/countdown" -m '### on/on'
#mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"ON","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{"notpayload":"junk"}'
#sleep 35

mosquitto_pub -t "home/test/countdown" -m '-------------------------------------------------------------------------------'
mosquitto_pub -t "home/test/countdown" -m '### on/off'
mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload":"ON","timeout":6,"warning":3}'; sleep 5 ; mosquitto_pub -t "home/test/countdown-in-${NODE}" -m '{ "payload": 0}'
sleep 35
#
# ==============================================================================
# Some odds and ends

# Okay so I need to handle special case
# Handle String and handle an object
# handle normal
# msg = {
#   payload: "on",
#   timeout: 10,
#   warning: 5
# }
#
# msg.payload = {
#   payload: "on",
#   timeout: 10,
#   warning: 5
# }
#
mosquitto_pub -t "home/test/countdown" -m '=[ Done ]======================================================================'

# I nned to add in test  support for
# - "TypeError: node.warn is not a function"
#
# - Junk input testing (example not string, not json but buffer)
#   And by extension the msg.payload.payload should also check this
# - Timer does not stop for FLOAT timeout values (must be an int)
#
# - payloads
#   msg = {
#       payload: "on",
#       timeout: 10,
#       warning: 5
#  }
#  and
#  msg.payload = {
#       payload: "on",
#       timeout: 10,
#       warning: 5
#  }
#
# - case sensitive input
#
mosquitto_pub -t "home/test/countdown" -m '                                                                                                                                                                                                                                                                '
mosquitto_pub -t "home/test/countdown" -m '                                                                                                                                                                                                                                                                '
mosquitto_pub -t "home/test/countdown" -m ''
mosquitto_pub -t "home/test/countdown" -m ''
mosquitto_pub -t "home/test/countdown" -m ''

done=1
ps
kill -s SIGHUP "${BGJOB}"
ps

egrep home/test/countdown results-1.txt | sed -e "s/--$/--\n/g" > results.txt

echo -e "\n###\n### Done\n###\n"

jobs
ps
