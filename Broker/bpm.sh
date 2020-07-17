#!/bin/sh
#Script realizado por jpinto para verificar la conexión a un server
DIR=/home/jpinto/SOMA/Broker
PATH=/bin
PATH1=/usr/bin
# desde mi Linux es importante verificar si estoy dentro de la Red de SM (verificado primero la conexión al DP, en caso contrario no hacer nada
if ! nc -vz dpqroprod.smnyl.com.mx 9090 2>/dev/null
then
  $PATH/echo "Estoy fuera de la Red de SM"
    
  exit 1
else
	#confirmado que estoy dentro de la Red de SM verificar el server indicado
	if ! nc -vz bpm.smnyl.com.mx 443 2>/dev/null
	then
		$PATH/echo "existe, Mandar correo"
		$PATH/echo "Down Balanceador-BPM-bpm.smnyl.com.mx" | $PATH1/mail -s Balanceador-BPM jpinto@mnyl.com.mx,jpinto@interware.com.mx
    
		exit 1
	fi
	if ! nc -vz pqliib01.smnyl.com.mx 9401 2>/dev/null
	then
		$PATH/echo "existe, Mandar correo"
		$PATH/echo "Down pqliib01.smnyl.com.mx port 9401" | $PATH1/mail -s Broker01-Donw-Port9401 jpinto@mnyl.com.mx,jpinto@interware.com.mx
    
		exit 1
	fi
	if ! nc -vz pqliib01.smnyl.com.mx 9402 2>/dev/null
	then
		$PATH/echo "existe, Mandar correo"
		$PATH/echo "Down pqliib01.smnyl.com.mx port 9402" | $PATH1/mail -s Broker01-Donw-Port9402 jpinto@mnyl.com.mx,jpinto@interware.com.mx
    
		exit 1
	fi
	if ! nc -vz pqliib01.smnyl.com.mx 9403 2>/dev/null
	then
		$PATH/echo "existe, Mandar correo"
		$PATH/echo "Down pqliib01.smnyl.com.mx port 9403" | $PATH1/mail -s Broker01-Donw-Port9403 jpinto@mnyl.com.mx,jpinto@interware.com.mx
    
		exit 1
	fi
	if ! nc -vz pqliib01.smnyl.com.mx 9703 2>/dev/null
	then
		$PATH/echo "existe, Mandar correo"
		$PATH/echo "Down pqliib01.smnyl.com.mx port 9703" | $PATH1/mail -s Broker01-Donw-Port9703 jpinto@mnyl.com.mx,jpinto@interware.com.mx
    
		exit 1
	fi
	if ! nc -vz pqliib01.smnyl.com.mx 9904 2>/dev/null
	then
		$PATH/echo "existe, Mandar correo"
		$PATH/echo "Down pqliib01.smnyl.com.mx port 9904" | $PATH1/mail -s Broker01-Donw-Port9904 jpinto@mnyl.com.mx,jpinto@interware.com.mx
    
		exit 1
	fi
fi

