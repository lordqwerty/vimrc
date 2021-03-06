.PHONY: install update default colors
.PHONY: pathogen-install pathogen-update submodule-update
.PHONY: snippets tamarin-syntax 

default: install

install: pathogen-install get-colors
	@ln -s ./vimrc ${HOME}/.vimrc
	@git submodule init
	@git submodule update
	@cd ${HOME}/.vim/bundle/vimproc.vim && make

submodule-update:
	@git submodule update --init --force --remote

get-colors:
	@mkdir -p ~/.vim/colors 
	@curl -k -LSso ~/.vim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim

update: pathogen-update
	@echo "Checking for updates in ./bundle..."
	@git submodule update 

pathogen-install:
	@mkdir -p ~/.vim/autoload ~/.vim/bundle
	@curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

pathogen-update:
	@echo "Updating tpope Pathogen..."
	@curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

tamarin-syntax:
	@echo "Installing TAMARIN and SAPIC syntaxes..."
	@mkdir -p ~/.vim/syntax
	@curl -k -LSso ~/.vim/filetype.vim https://raw.githubusercontent.com/tamarin-prover/tamarin-prover/develop/etc/filetype.vim
	@curl -k -LSso ~/.vim/syntax/sapic.vim https://raw.githubusercontent.com/tamarin-prover/tamarin-prover/develop/etc/sapic.vim
	@curl -k -LSso ~/.vim/syntax/spthy.vim https://raw.githubusercontent.com/tamarin-prover/tamarin-prover/develop/etc/spthy.vim
