# Docker Environment ![build status](https://gitlab.com/CarizyGroup/Docker/badges/master/build.svg)

## Create following containers: 
| **Container Name** | **Use** |
|:-:|:--|
|site|Data-only container|
|mariadb|Docker image: [MariaDB](https://hub.docker.com/_/mariadb/)<br>Uses ./databases folder to store MariaDB's databases|
|apache|Docker image: [Debian](https://hub.docker.com/_/debian/)|
|builder|Docker image: [Ubuntu 16.04](https://hub.docker.com/_/ubuntu/)<br>Main container used to prepare website and install Symfony's dependencies for apache<br>Contains: <br><ul><li>Compass</li><li>Node JS</li><li>Composer</li></ul>|
|smtp|Docker image: [djfarrelly/maildev](https://hub.docker.com/r/djfarrelly/maildev/)<br>Container with Maildev to catch mails sent by Symfony to a webpage.<br>Access the MailDev webpage with host:1080.|
|memcached|Docker image: [Memcached](https://hub.docker.com/_/memcached/)|


## Logs
The logs are saved in `logs` folder.
- `logs/apache/` : Logs for apache2

___

## Website folder
The website folder is `site`.

___

## Database folder
The database folder is `databases`.

___

## Config files
In order to configure containers properly, you must:
- Edit file `site/app/config/parameters.yml.dist` line 4, replace `127.0.0.1` by `mariadb`;
- Edit file `site/app/config/parameters.yml.dist` line 13, replace `127.0.0.1` by `smtp`;
- Edit file `site/app/config/config.yml` line 150, replace `localhost` by `"%mailer_host%"`;
- Edit file `site/app/config/parameters.yml.dist` line 16, replace `587` by `25` if you would like to use MailDev.

___

## Ports
Ports configuration:

| **Host port** | **Container port** | **Container** |
|:-:|:-:|:--|
|80|80|apache|
|3306|3306|mariadb|
|1080|80|maildev|
|11211|11211|memcached|

___

## Makefile
 - If you want to launch container's creation, execute `make install`;
 - If you want to import a database dump, copy the carizy.sql file to the `site` folder. Then launch  `make import-database`;
 - If you want to execute a command in the environment launch, launch `make execute` to access the container.