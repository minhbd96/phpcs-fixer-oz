.PHONY: test
test:
	docker compose up -d && docker exec -it phpcs sh -c "./test_runner.sh"

.PHONY: down
down:
	docker stop phpcs

.PHONY: rm
rm:
	docker rm phpcs

.PHONY: destroy
destroy: down rm
