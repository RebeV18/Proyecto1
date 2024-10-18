

# Proyecto1 Algoritmo de sistema de costos 

 
En este proyecto, encontrarás una propuesta para resolver el planteamiento indicado abajo usando pseudocódigo. A continuación, detallo el planteamiento, los requerimientos y la solución paso a paso. 
 
## Planteamiento
Construirás un algoritmo en pseudocódigo que simule un sistema para calcular el costo de un producto con base en su precio original y el porcentaje de descuento aplicado. 
 
## Requerimientos
Leer el precio original del producto. 
Aplicar un descuento al producto si es aplicable (por ejemplo, si el cliente tiene un cupón de descuento). 
Aplicar impuestos al producto (por ejemplo, el IVA u otros impuestos). 
Si el cliente compra más de un artículo, aplicar un descuento por cantidad. 
Calcular el costo de envío basado en el destino y el peso del paquete. 
Calcular el costo final del producto sumando el precio con descuento, impuestos, descuento por cantidad y costo de envío. 
Mostrar el costo final del producto, desglosando los diferentes componentes (descuentos, impuestos, descuento por cantidad y costo de envío). 
 
 
## Solución paso a paso
Nota: Las variables se declararán justo antes de ocuparlas por recomendación de nuestro Coach para que no ocupen memoria desde el inicio. 
 
Primero, se declaran las variables y contantes y se asignan valores correspondientes.
Se declara variable precio_original número real para almacenar el precio original del producto. 
Se inicializa en 0 el precio original del producto.
Se usa un bucle Mientras para repetir la solicitud de ingresar el precio original hasta que el valor sea un precio mayor a $1.
 
	Definir precio_original Como Real;
	precio_original <- 0;
	Mientras precio_original < 1 Hacer
		Escribir "Por favor, ingrese el precio original del producto: “;
		Leer precio_original;
	FinMientras 


Se definen y se asignan valores a las variables y constantes que usaremos para hacer el descuento por cupón cuando aplique.
Se solicita al usuario que digite un cupón de descuento válido, en caso de tener alguno, este debe iniciar con A10 para aplicar 10% de descuento o A5 para aplicar 5% de descuento, si no tiene un cupón se solicita ingresar 0.
DESCUENTO_C número real que guarda el descuento que se aplicará por concepto de cupón de descuento.
validado número entero que almacena el valor que retorna la función validarCupon que puede ser 5 o 10.
Se usa la estrutura de control condicional Si/Entonces para asignar el valor correspondiente al descuento por cupón.
 
	Escribir "Si tiene un cupon de descuento que inicie con D10 o D5 				digítelo, por favor. Sino digite 0."; 
	Definir cuponDescuento Como Caracter; 
	Leer cuponDescuento; 
	 
	Definir DESCUENTO_C Como Real; 
	Definir validado Como Entero; 
	validado <- validarCupon(cuponDescuento); 
	si validado = 10 Entonces 
		DESCUENTO_C <- 0.9; 
	SiNo 
		Si validado = 5 Entonces 
			DESCUENTO_C <- 0.95; 
		SiNo 
			DESCUENTO_C <- 1; 
		FinSi 
	FinSi 


Se llama la función validarCupon que recibe la cadena del cupón de descuento como parámetro y valida si el cupón ingresado existe. En caso que sea válido se devuelve el valor del descuento, sea 5% o 10% que se ocupará para asignar el valor a DESCUENTO_C.
cupones arreglo de cadenas de texto donde se almacenarán los cupones de descuento para después validar el ingresado por el usuario.
i número entero que funciona como índice para controlar los bucles.

		Definir cupones Como Caracter;
		Dimension cupones[10];
		Definir i Como Entero;


Se utilizan 2 bucles Para para llenar el arreglo de cupones. El primer Para se ejecuta 5 veces llenando los primeros 5 espacios del arreglo con 5 cupones de 10%. El segundo Para se ejecuta 5 veces llenando los siguientes 5 espacios con 5 cupones de 5%.

	Para i <- 0 Hasta 4 Con Paso 1 Hacer
		cupones[i] <- Concatenar("D10", ConvertirATexto(i));
	FinPara
	Para i <- 5 Hasta 9 Con Paso 1 Hacer
		cupones[i] <- Concatenar("D5", ConvertirATexto(i-5));
	FinPara
	
    
valido número entero que guarda el valor de descuento que la función retornará y se inicializa en 0.

	Definir valido Como Entero;
	valido <- 0;


Se busca en el arreglo si el cupón ingresado por el usuario existe usando un bucle Para, este bucle se ejecuta 10 veces buscando en el arreglo una cadena que sea igual a la cadena ingresada como cupón.
		
	Para i <- 0 Hasta 9 Con Paso 1 Hacer
		Si cupones[i] = cupon Entonces
			si i < 5 Entonces
				valido <- 10;
			SiNo
				valido <- 5;
		    FinSi
		FinSi
	FinPara

 
Se define la constante IVA como número real para guardar el valor ‘1.12’ a fin de calcular y sumar el 12% del costo posteriormente.

	Definir IVA Como Real;
	IVA <- 1.12;
 

Se declaran las variables para registrar el descuento por calidad cuando aplique. 
Se solicita al usuario que ingrese la cantidad del producto la cual se guarda en la variable cantidad.
Se hace uso del bucle Mientras para repetir la solicitud hasta que ingrese una cantidad igual o mayor a 1.

	Definir cantidad Como Entero;
	Mientras cantidad < 1 Hacer
		Escribir "Por favor, ingrese la cantidad de productos: ";
		Leer cantidad;
	FinMientras


Se calcula el descuento por cantidad. Si la cantidad es mayor a 1 se aplicará el descuento de 5%.
Por medio de la estrutura de control condicional Si/Entonces para asignar el valor correcto a la constante DESCUENTO_Q.

	Definir DESCUENTO_Q Como Real;
	Si cantidad > 1 Entonces
		DESCUENTO_Q <- 0.95;
	SiNo
		DESCUENTO_Q <- 1;
	FinSi


Se declaran variables que se usarán para calcular el costo de envío.
Se define la variable peso y se inicializa en 0. Se utiliza el bucle Mientras para solicitar el peso al usuario y que se repita hasta que ingrese un valor mayor a 0.

	Definir peso Como Real;
	Mientras peso <= 0 Hacer
		Escribir "Ingrese el peso del producto en kilogramos, 
		por favor: ";
		Leer peso;
	FinMientras


Se define la variable destino, como cadena y se solicita al usuario que ingrese un estado. Se ocupa el bucle Repetir la solicitud hasta que ingrese un valor válido.
	
	Definir destino Como Caracter;
	Repetir
		Escribir "Ingrese la ciudad de destino del producto: ";
		Leer destino;
	Hasta Que destino <> “"
 

Se declara variable costo para almacenar el costo total.
Se aplica descuento por cupón de descuento usando la constante DESCUENTO_C
Se multiplica el precio original del producto por el descuento por cupón y se guarda en la variable costo.
Se utiliza la estructura de control condicional Si/Entonces para imprimir el descuento aplicado en pantalla.

	Definir costo Como Real;
 	costo <- precio_original * DESCUENTO_C;
	Escribir "Precio Original:         ", precio_original
	//Se imprime descuento
	Si costo < precio_original Entonces
		Escribir "Cupón de Descuento       -", (precio_original - costo)
	SiNo
		Escribir "Cupón de Descuento        -", "0"
	FinSi


Se calcula y se suma el IVA al costo, ademas se imprime usando la variable subtotal para almacenar solo el valor del IVA sumado.

	Definir subtotal Como Real;
	subtotal <- (costo * (IVA - 1));
	costo <- (costo * IVA);
	//Se imprime el IVA.
	Escribir "IVA                       ", subtotal


Se aplica descuento por cantidad multiplicando el costo sumado hasta ahora por el descuento por cantidad.
Se reutiliza la variable subtotal para almacenar solo el descuento que se restará a fin de imprimirlo.
Se usa una estructura de control condicional Si/Entonces para imprimir el descuento aplicado.

	subtotal <- (costo * (1 - DESCUENTO_Q));
	costo <- (costo * DESCUENTO_Q);
	//Se imprime descuento por cantidad
	Si cantidad > 1
		Escribir "Descuento por cantidad    -", subtotal
	SiNo
		Escribir "Descuento por cantidad    -", "0"
	FinSi
	
	Escribir "                        ________";


Se calcula el costo multiplicando el costo por la cantidad de productos y se imprime el total actual.

	Escribir cantidad " x ", costo, "                " Sin Saltar
	
	costo <- (costo * cantidad);
	Escribir costo


Se calcula el costo de envío llamando la función calculoEnvio y se imprime: 
Se llama a la función calculoEnvio que calcula el costo de envío del producto. Recibe el peso del producto y el destino como parámetros y devuelve el costo de envío total sumando el costo fijo + el costo variable.
Se declara la variable calculoEnvio como número real para guardar el valor total del envío, se inicializa en 0.
Se declara la constante COSTO_FIJO y se le asigna el valor fijo de envío 10. 

	Definir calculoEnvio Como Real;
	calculoEnvio <- 0;
	Definir COSTO_FIJO Como Real;
	COSTO_FIJO <- 10;

	
Se define la variable costoVariable y se calcula el costo variable multiplicando el peso por el valor provisto para envíos a la ciudad seleccionada y se almacena en la variable costoVariable. 

	Definir costoVariable Como Real;
	costoVariable <- (2 * peso);


Finalmente se suman el costo fijo y el costo variable para determinar el total del costo de envío y se guardan en la variable  calculoEnvio. 
	
	calculoEnvio <- COSTO_FIJO + costoVariable;


Se define la variable costoEnvio como real para que almacene el costo de envío total después de calcularlo y lo imprime.
	
	Definir costoEnvio Como Real;
	costoEnvio <- calcularCostoEnvio(peso, destino);
	Escribir "Costo de envío            ", costoEnvio
	

Se calcula el costo total sumando al costo total actual el costo de envío y se almacena en la variable costo y se imprime.
	
	costo <- costo + costoEnvio;
	Escribir "                        ________";
	Escribir "Costo total:             ", costo;


