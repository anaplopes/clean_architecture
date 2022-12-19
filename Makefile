.PHONY: config
config:
	python -m venv venv


.PHONY: pre-commit
pre-commit:
	pre-commit install
	pre-commit run --all-files
