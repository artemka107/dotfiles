# ANSIBLE_PREFIX := docker run -v $(HOME):/host/home -v $(CURDIR):/dotfiles -w /dotfiles williamyeh/ansible:ubuntu18.04 ansible-playbook -i local -vv
#
ANSIBLE_PREFIX := ansible-playbook -i local -vv -K

all: nvim-install dotfiles-install

TAGS := all

install-ansible:
	sudo apt update
	sudo apt install software-properties-common
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	sudo apt install ansible

home-app-install:
	$(ANSIBLE_PREFIX) home-apps.yml

dotfiles-install:
	$(ANSIBLE_PREFIX) dotfiles.yml

nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/vimrc ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json | true


prepare: install-ansible

# .PHONY:
