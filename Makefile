.PHONY: server
server:
	hugo server

.PHONY: public
public:
	hugo --baseUrl="https://kubeclipper.io"

module-check:
	@git submodule status --recursive | awk '/^[+-]/ {printf "\033[31mWARNING\033[0m Submodule not initialized: \033[34m%s\033[0m\n",$$2}' 1>&2

setup:
	bash -x ./scripts/setup.sh

setup-upstream:
	bash -x ./scripts/setup-upstream.sh

build:
	./scripts/build.py \
		--host=https://www.cloudpods.org \
		--edition=ce \
		--multi-versions