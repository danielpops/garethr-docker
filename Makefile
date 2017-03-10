SHELL := /bin/bash

TAG=${whoami}-puppet-docker

whoami    := $(shell who | awk '{print $$1}')

test: docker_build
	docker run --rm --entrypoint /bin/bash $(TAG) -c "bundle exec rake test"

docker_run: docker_build
	docker run --rm -it --entrypoint /bin/bash --name $(TAG) $(TAG)

docker_build:
	docker build -t $(TAG) .
