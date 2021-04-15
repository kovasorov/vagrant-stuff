# Vagrant box with Docker and docker-compose

base box - generic/debian10

provider - virtualbox

provision - shell

Install Docker and docker-compose, map ~/_prj folder inside box.

## Usage

```Shell
vagrant up --provider virtualbox
vagrant ssh
vagrant halt
vagrant destroy
vagrant box update
```