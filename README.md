# docker-laravel

Docker image composing of requirements to run Laravel

## Images used
- php:7.1-apache
- mysql:5.7.21
- phpmyadmin/phpmyadmin:4.7

## Installation
0. Install docker CE and ensure it works by running
```bash
$ docker -v
$ docker-compose -v
```

1. Clone this repo
```bash
$ git clone https://github.com/adwinying/docker-laravel
```

2. Set up the docker image
```bash
# -d to run containers in detached mode
$ docker-compose up -d
```

3. SSH? (More like launch a bash shell) into the web container and create a new project using laravel installer
```bash
$ docker-compose exec web bash
$ laravel new
```

4. Open [http://localhost](http://localhost) and if the Laravel start page appears then you're good to go!

## Usage
- Accessing phpmyadmin: [http://localhost:8080](http://localhost:8080)
- Accessing mysql: http://localhost:3306

## Configuration

### Remapping Ports
In `docker-compose.yml` the ports for each service can be changed. Eg: `mysql` service:

```yaml
db:
  image: mysql:5.7.21
  ports:
    - [your_local_machine_port_here]:3306
```

Other configurations in `docker-compose.yml` are pretty self-explanatory I think...

## Coming Soon
A blog post on creating this from scratch (maybe)