lint:
	ansible-lint
osx:
	brew install ansible ansible-lint
ping:
	ansible -i inventory.yaml all -m ping
uptime:
	ansible -i inventory.yaml all -a "uptime"

# https://galaxy.ansible.com/yatesr/timezone
timezone_init:
	git submodule add https://github.com/yatesr/ansible-timezone roles/yatesr.timezone
# ansible-galaxy install --force --roles-path ./roles yatesr.timezone
timezone:
	ansible -i inventory.yaml all -a "date"
	ansible-playbook -i inventory.yaml timezone.yaml
	ansible -i inventory.yaml all -a "date"

site:
	ansible-playbook -i inventory.yaml site.yaml

tasks:
	ansible-playbook -i inventory.yaml site.yaml --list-tasks
tags:
	ansible-playbook -i inventory.yaml site.yaml --list-tags
# user:
# 	ansible-playbook -u noreck -i inventory.yaml test.yml