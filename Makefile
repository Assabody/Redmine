all:
	@echo "Makefile Commands: \n  - install\n"

install:
	sudo docker-compose up --build -d --remove-orphans
