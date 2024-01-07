export WEB_APPLICATION_VERSION=$1
export BACK_APPLICATION_VERSION=$2
docker-compose --file docker/docker-compose.yml down --rmi local
git reset --hard
git checkout master
git pull --rebase
docker pull eternalwanderer/docker-web
docker pull eternalwanderer/docker-back
docker-compose --file docker/docker-compose.yml up -d
docker system prune --all --force