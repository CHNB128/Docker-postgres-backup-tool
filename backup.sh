#!/bin/bash
POSTGRES_DOCKER_NAME_OR_ID=$1

if [ -z $POSTGRES_DOCKER_NAME_OR_ID ]; then 
  POSTGRES_DOCKER_NAME_OR_ID=postgres
fi

docker run \
  --rm \
  --interactive \
  -v $(pwd)/backups:/data/tmp \
  --link $POSTGRES_DOCKER_NAME_OR_ID \
  postgres \
  bash -c 'exec /data/tmp/pg_backup_rotated.sh'