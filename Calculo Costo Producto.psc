Algoritmo calculoCostoProducto
	//Se solicita ingresar el precio original hasta que ingrese valor mayor a 0.
	Definir precio_original Como Real;
	precio_original <- 0
	Mientras precio_original < 1 Hacer
		Escribir "Por favor, ingrese el precio original del producto en números: $";
		Leer precio_original;
	FinMientras
	
	//Se solicita digitar cupón de descuento
	Escribir "Si tiene un cupon de descuento que inicie con A10 o A5 digítelo, por favor. Sino digite 0.";
	Definir cuponDescuento Como Caracter;
	Leer cuponDescuento;
	
	//Se valida el cupón de descuento en el arreglo de cupones
	Definir DESCUENTO_C Como Real;
	Definir validado Como Entero;
	validado <- validarCupon(cuponDescuento);
	si validado = 10 Entonces
		DESCUENTO_C <- 0.9;
	SiNo
		si validado = 5 Entonces
			DESCUENTO_C <- 0.95;
		SiNo
			DESCUENTO_C <- 1;
		FinSi
	FinSi
	
	//Se define y declara el IVA
	Definir IVA Como Real;
	IVA <- 1.12;
	
	//Se solicita cantidad mayor o igual a 1
	Definir cantidad Como Entero;
	Mientras cantidad < 1 Hacer
		Escribir "Por favor, ingrese la cantidad de productos en números: #";
		Leer cantidad;
	FinMientras
	//Se calcula descuento por cantidad
	Definir DESCUENTO_Q Como Real;
	Si cantidad > 1 Entonces
		DESCUENTO_Q <- 0.95;
	SiNo
		DESCUENTO_Q <- 1;
	FinSi
	
	//Se solicita peso del producto.
	Definir peso Como Real;
	Mientras peso <= 0 Hacer
		Escribir "Ingrese el peso del producto en kilogramos, por favor, en números: ";
		Leer peso;
	FinMientras
	//Se solicita destino.
	Definir destino Como Caracter;
	Repetir
		Escribir "Ingrese la ciudad de destino del producto: ";
		Leer destino;
	Hasta Que destino <> ""
	
	//Se calcula precio original por cupón de descuento.
	Definir costo Como Real;
	costo <- precio_original * DESCUENTO_C;
	Escribir "Precio Original:         ", precio_original
	//Se imprime descuento
	Si costo < precio_original Entonces
		Escribir "Cupón de Descuento       -", (precio_original - costo)
	SiNo
		Escribir "Cupón de Descuento        -", "0"
	FinSi
	
	//Se calcula IVA y se multiplica costo por el IVA.
	Definir subtotal Como Real;
	subtotal <- (costo * (IVA - 1));
	costo <- (costo * IVA);
	//Se imprime el IVA.
	Escribir "IVA                       ", subtotal
	
	//Se aplica descuento por cantidad cuando aplica.
	subtotal <- (costo * (1 - DESCUENTO_Q));
	costo <- (costo * DESCUENTO_Q);
	//Se imprime descuento por cantidad
	Si cantidad > 1
		Escribir "Descuento por cantidad    -", subtotal
	SiNo
		Escribir "Descuento por cantidad    -", "0"
	FinSi
	
	Escribir "                        ________";
	Escribir cantidad " x ", costo, "                " Sin Saltar
	
	//Se multiplica costo por cantidad deseada y se imprime subtotal
	costo <- (costo * cantidad);
	Escribir costo
	
	//Se llama la función que calcula el costo de envío y se imprime.
	Definir costoEnvio Como Real;
	costoEnvio <- calcularCostoEnvio(peso, destino);
	Escribir "Costo de envío            ", costoEnvio
	
	//Se calcula costo total sumando costo + costo de envío
	costo <- costo + costoEnvio;
	Escribir "                        ________";
	Escribir "Costo total:             ", costo;
FinAlgoritmo


Funcion valido <- validarCupon(cupon)
	//Valida el cupón ingresado por el usuario.
	Definir cupones Como Caracter;
	Dimension cupones[10];
	Definir i Como Entero;
	//Se llena el arreglo de cupones, 5 cupones de 10% y 5 cupones de 5%
	Para i <- 0 Hasta 4 Con Paso 1 Hacer
		cupones[i] <- Concatenar("A10", ConvertirATexto(i));
	FinPara
	Para i <- 5 Hasta 9 Con Paso 1 Hacer
		cupones[i] <- Concatenar("A5", ConvertirATexto(i-5));
	FinPara
	
	//Se busca en el arreglo si el cupón ingresado existe
	Definir valido Como Entero;
	valido <- 0;
	Para i <- 0 Hasta 9 Con Paso 1 Hacer
		Si cupones[i] = cupon Entonces
			si i < 5 Entonces
				valido <- 10;
			SiNo
				valido <- 5;
			FinSi
		FinSi
	FinPara
FinFuncion


Funcion calculoEnvio <- calcularCostoEnvio(peso, destino)
	//Calcula el costo de envío
	Definir calculoEnvio Como Real;
	Definir COSTO_FIJO Como Real;
	COSTO_FIJO <- 10;
	
	//Se calcula costo variable
	Definir costoVariable Como Real;
	costoVariable <- (2 * peso);
	
	//Se suma costo fijo + costo variable
	calculoEnvio <- COSTO_FIJO + costoVariable;
FinFuncion