set -eu

# save temporaly
MESSAGEFILE=$(mktemp -t webhooksXXXX)
# after finish remove 
trap "rm ${MESSAGEFILE}" 0

# with or not pipe
if [ -p /dev/stdin ]; then
    # exchange new line code and save
    cat - | tr '\n' '\\' | sed 's/\\/\\n/g' > ${MESSAGEFILE}
else
    echo "nothing stdin"
    exit 1
fi

# URL of Web hook
URL='hogehoge.piyopiyo.com'
# channel to export
CHANNEL=${CHANNEL:-'minecraft'}
# name of bot
BOTNAME=${BOTNAME:-'mcserver'}
# emoji
EMOJI=${EMOJI:-':hoge:'}
# head tittle
HEAD=${HEAD:-"[server message]\n"}

# get message with sintax highlight
MESSAGE='```'`cat ${MESSAGEFILE}`'```'

# make json
payload="payload={
      \"text\": \"${HEAD}${MESSAGE}\"
}"

# export 
curl -s -S -X POST --data-urlencode "${payload}" ${URL} > /dev/null