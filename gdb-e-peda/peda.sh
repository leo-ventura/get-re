#!/usr/bin/env bash

# baixando peda do github se já não estiver instalado
peda_path=$(find / -iname "peda.py" 2> /dev/null)

if [[ $peda_path = "" ]]; then
    git clone https://github.com/longld/peda.git && $peda_path="$(pwd)/peda/peda.py"
fi

if [[ $1 = "-att" ]] || [[ $2 = "-att" ]]; then
    # substitui a sintaxe intel por att na linha 756 do arquivo peda.py
    sed -i '756s/intel/att/' $peda_path
fi

echo "source $peda_path" > $HOME/.gdbinit
echo "set disassembly-flavor att" >> $HOME/.gdbinit
