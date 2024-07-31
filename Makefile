build:
	docker compose -f local.yml up --build -d --remove-orphans

up:
	docker compose -f local.yml up -d

down:
	docker compose -f local.yml down

show-logs:
	docker composse -f local.yml logs

show-logs-api:
	docker compose -f local.yml logs api

makemigrations:
	docker compose -f local.yml run --rm api python manage.py makemigrations

migrate:
	docker compose -f local.yml run --rm api python manage.py migrate

collectstatic:
	docker compose -f local.yml run --rm api python manage.py collectstatic

superuser:
	docker compose -f local.yml run --rm api python manage.py createsuperuser

down-v:
	docker compose -f local.yml down -v

volume:
	docker volume inspect src_local_progres_data

authors-db:
	docker compose -f local.yml exec postgres psql --username=alphaogilo --dbname=authors-live

flake8:
	docker compose -f local.yml exec api flake8 .

black-check:
	docker compose -f local.yml exec api black --check --exlude=migrations .

black-diff:
	docker compose -f local.ymll exec api black --diff --exlude=migrations .

black:
	docker compose -f local.yml exec api blakc --exlude=migrations .

isort-check:
	docker compose -f local.yml exec api isort . --check-only --skip venv

isort-diff:
	docker compose -f local.yml exec api isort . --diff --skip venv --skip

isort:
	docker compose -f local.yml exec api isort . --skip venv --skip migrations