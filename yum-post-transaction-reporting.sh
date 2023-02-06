#!/bin/bash

# these need to be filled in
SPLUNK_URL="https://splunk.example.com/services/collector/event"
SPLUNK_AUTHORIZATION="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

PATH=/usr/sbin:/usr/bin:/sbin:/bin

if [[ $# -ne 7 ]]; then
	echo "This script is meant to be run via yum-plugins." >&2
	exit 1
fi
timestamp=$( date '+%s.%3N' )
STATE=$1
NAME=$2
EPOCH=$3
VERSION=$4
RELEASE=$5
ARCH=$6
REPOID=$7

json=$( printf '{"time":"%s","host":"%s","source":"yum-plugins","event":{"state":"%s","name":"%s","epoch":"%s","version":"%s","release":"%s","arch":"%s","repoid":"%s"}}' "$timestamp" "$HOSTNAME"   "$STATE" "$NAME" "$EPOCH" "$VERSION" "$RELEASE" "$ARCH" "$REPOID" )

response=$( \
	curl "$SPLUNK_URL" \
	-s \
    --max-time 5 \
    -H "Authorization: Splunk $SPLUNK_AUTHORIZATION" \
    -d "$json" \
)

if echo "$response" | grep -qE '"code"\s*:\s*0'; then
	exit 0
else
	printf 'Error sending transaction to event collector. Response = %s\n' "$response" >&2
	exit 1
fi

