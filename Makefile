# Project: zapakatel worker with docker.io
# Author: AoJ <aoj@n13.cz>
# Date: 2013
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- debug run already created image by tag
#	make try	- build and run in debug mode
#	make $REV	- deploy in background repo revision


NAME=aooj/riakcs
VERSION=1.0


build:
	docker build -t $(NAME):$(VERSION) .

run:
	docker run -t -i -d -p 22 -p 8000 -p 8080 -name riak-cs $(NAME):$(VERSION)

debug:
	docker run -entrypoint="/bin/bash" -t -i $(NAME):$(VERSION) -c /bin/bash


try: build debug


.PHONY: build debug try
