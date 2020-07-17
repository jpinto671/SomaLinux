#!/bin/sh
#Script realizado por jpinto para verificar si existen errores en la generación de PDF
DIR=/home/jpinto/SOMA/BPM-Services
PATH=/bin
PATH1=/usr/bin
# desde mi Linux es importante verificar si estoy dentro de la Red de SM (verificado primero la conexión al DP, en caso contrario no hacer nada
if ! nc -vz dpqroprod.smnyl.com.mx 9090 2>/dev/null
then
  $PATH/echo "Estoy fuera de la Red de SM"
    
  exit 1
else
#Script Verificar Server prodqrowpapdf04
	cd $DIR
	$PATH1/curl -H "Content-Type: text/xml" -m 120 -d @pdf.xml -X POST http://prodqrowpapdf04.smnyl.com.mx/WSImpresion/ServicioImpresion.asmx > prodqrowpapdf04.log
	vari=`$PATH/cat $DIR/prodqrowpapdf04.log | $PATH1/wc -c`
	i=1

	if [ "$i" -le "$vari" ]; then
		$PATH/echo "no existe"
	else
		$PATH/echo "existe, Mandar correo"
		##$PATH/echo Time-Out Server prodqrowpapdf04.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com,icruz@mnyl.com.mx,jhernandezc@mnyl.com.mx,ggarciam@mnyl.com.mx,amartinezr@mnyl.com.mx
		$PATH/echo Time-Out Server prodqrowpapdf04.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com
	fi

	#Script Verificar Server prodqrowpapdf03
	$PATH1/curl -H "Content-Type: text/xml" -m 120 -d @pdf.xml -X POST http://prodqrowpapdf03.smnyl.com.mx/WSImpresion/ServicioImpresion.asmx > prodqrowpapdf03.log
	var1=`$PATH/cat $DIR/prodqrowpapdf03.log | $PATH1/wc -c`

	if [ "$i" -le "$var1" ]; then
		$PATH/echo "no existe"
	else
		$PATH/echo "existe, Mandar correo"
		##$PATH/echo Time-Out Server prodqrowpapdf03.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com,icruz@mnyl.com.mx,jhernandezc@mnyl.com.mx,ggarciam@mnyl.com.mx,amartinezr@mnyl.com.mx
		$PATH/echo Time-Out Server prodqrowpapdf03.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com
	fi


	#Script Verificar Server impresiondigital2012.smnyl.com.mx
	$PATH1/curl -H "Content-Type: text/xml" -m 120 -d @pdf.xml -X POST http://impresiondigital2012.smnyl.com.mx/WSImpresion/ServicioImpresion.asmx > impresiondigital2012.log
	var2=`$PATH/cat $DIR/impresiondigital2012.log | $PATH1/wc -c`	
	if [ "$i" -le "$var2" ]; then
		$PATH/echo "no existe"
	else
		$PATH/echo "existe, Mandar correo"
		##$PATH/echo Time-Out Server impresiondigital2012.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com,icruz@mnyl.com.mx,jhernandezc@mnyl.com.mx,ggarciam@mnyl.com.mx,amartinezr@mnyl.com.mx
		$PATH/echo Time-Out Server impresiondigital2012.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com
	fi

	#Script Verificar Server impresiondigitalbpm.smnyl.com.mx
	$PATH1/curl -H "Content-Type: text/xml" -m 120 -d @pdf.xml -X POST http://impresiondigitalbpm.smnyl.com.mx/WSImpresion/ServicioImpresion.asmx > impresiondigitalbpm.log
	var3=`$PATH/cat $DIR/impresiondigitalbpm.log | $PATH1/wc -c`
	if [ "$i" -le "$var3" ]; then
		$PATH/echo "no existe"
	else
		$PATH/echo "existe, Mandar correo"
		##$PATH/echo Time-Out Server impresiondigitalbpm.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com,icruz@mnyl.com.mx,jhernandezc@mnyl.com.mx,ggarciam@mnyl.com.mx,amartinezr@mnyl.com.mx
		$PATH/echo Time-Out Server impresiondigitalbpm.smnyl.com.mx | $PATH1/mail -s Time-Out-ServicioImpresion-BPM jpinto@mnyl.com.mx,jpinto671@gmail.com
	fi
fi
