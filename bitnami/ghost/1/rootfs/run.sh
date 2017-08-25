#!/bin/bash
. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

USER=ghost
START_COMMAND="ghost start && tail -f /opt/bitnami/ghost/logs/ghost.log"
export NODE_ENV=production

# If container is started as `root` user
if [ $EUID -eq 0 ]; then
    exec gosu ${USER} bash -c "${START_COMMAND}"
else
    exec bash -c "$START_COMMAND"
fi
