.PHONY: install update default colors
.PHONY: pathogen-install pathogen-update 
.PHONY: snippets haskell-syntax tamarin-syntax 

default: install

install: pathogen-install get-colors haskell-syntax snippets
	@ln -s ./vimrc ${HOME}/.vimrc
	@git submodule init
	@git submodule update
	@cd ${HOME}/.vim/bundle/vimproc.vim && make

get-colors:
	@mkdir -p ~/.vim/colors 
	@curl -k -LSso ~/.vim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
	@curl -k -LSso ~/.vim/colors/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
	@curl -k -LSso ~/.vim/autoload/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim

update: pathogen-update
	@echo "Checking for updates in ./bundle..."
	@git submodule update 

pathogen-install:
	@mkdir -p ~/.vim/autoload ~/.vim/bundle
	@curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

pathogen-update:
	@echo "Updating tpope Pathogen..."
	@curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

snippets:
	@mkdir snippets
	@curl -k -LSso ~/.vim/snippets/haskell.snippet https://raw.githubusercontent.com/sdiehl/haskell-vim-proto/master/vim/snippets/haskell.snippets

haskell-syntax:
	@echo "Installing Haskell syntaxes..."
	@curl -k -LSso ~/.vim/syntax/haskell.vim https://raw.githubusercontent.com/sdiehl/haskell-vim-proto/master/vim/syntax/haskell.vim
	@curl -k -LSso ~/.vim/syntax/cabal.vim https://raw.githubusercontent.com/sdiehl/haskell-vim-proto/master/vim/syntax/cabal.vim

tamarin-syntax:
	@echo "Installing TAMARIN and SAPIC syntaxes..."
	@mkdir -p ~/.vim/syntax
	@curl -k -LSso ~/.vim/filetype.vim https://raw.githubusercontent.com/tamarin-prover/tamarin-prover/develop/etc/filetype.vim
	@curl -k -LSso ~/.vim/syntax/sapic.vim https://raw.githubusercontent.com/tamarin-prover/tamarin-prover/develop/etc/sapic.vim
	@curl -k -LSso ~/.vim/syntax/spthy.vim https://raw.githubusercontent.com/tamarin-prover/tamarin-prover/develop/etc/spthy.vim
