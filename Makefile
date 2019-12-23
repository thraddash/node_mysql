# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

APP_HOME=$(shell pwd)
src_service=${APP_HOME}/back-end
src_node=${APP_HOME}/front-end

help: ## This help.

	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

echo:   ## show current directory path
	echo ${APP_HOME}

#node_env: ## create front-end .env
#	ifconfig en0 |awk '/inet / {printf "%s%s:3000 \nPORT=5000\n", "REACT_APP_ROOT_URL=http://", $$2}' > ${APP_HOME}/${src_node}/.env
#	echo "version: '3'\n\nservices:\n  service:\n    build: ./service\n    ports:\n      - \"9191:3000\"\n  node:\n    build: ./node\n    ports:\n      - \"9090:5000\"" | tee > docker-compose.yml

build:  ## build
	docker-compose build

rebuild:  ## rebuild
	docker-compose down
	docker-compose build --no-cache

up:     ## docker-compose up container
	docker-compose up -d

down:   ## docker-compose down container
	docker-compose down

ps:	## docker-compose ps
	docker-compose ps
