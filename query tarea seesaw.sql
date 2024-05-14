use bdsistemacostosproduccion;
describe compras;
CREATE TABLE PruebaCrear (Id_Prueba int Not Null, Nombre_Prueba
Varchar(20));

alter table compras change descuento descuento_compra decimal(10,2);

alter table compras add comentarios varchar(30);
alter table compras drop comentarios;

Insert Into materia_prima (Id_MateriaPrima,Nombre_Mp,Id_TipoMP,CostoMP) VALUES
 (15, 'Harina debanano', 1, 3500), 
 (16,'Almendras',2, 5500);
 
 select * from materia_prima;
 describe materia_prima;
 
  select * from proveedores;
 
INSERT INTO proveedores (IdProveedores, NombreProveedor, Telefono_Proveedor) 
VALUES 
    (13, 'Agroindustria Verde S.A', 123235),
    (14, 'Productos del Campo S.A', 134786),
    (15, 'Tierra Fértil Distribuidora', 343);

update proveedores set NombreProveedor="Tierra verde S.A" where idProveedores=3;
 #Cambie el código del proveedor a 3 en aquellas compras con descuentos igual o mayores a 5000.

update proveedores set idProveedores=3 where descuentos>=5000;

#3. Cuando un registro es agregado a la tabla productos, se requiere actualizar el valor del producto agregándole el 
# 13% del impuesto, pero únicamente a aquellos con precios mayores a 3000. 

select * from producto;

set sql_safe_updates=0;
update producto set PrecioProducto=PrecioProducto*(1+0.13) where PrecioProducto>3000;

#Se requiere aplicar un aumento del 5% al costo de la materia prima sin ninguna excepción.
 
select * from materia_prima;

update materia_prima set CostoMP=CostoMP*1.5;

delete from compras where Fecha= '2020-03-15';

select * from tipo_materiaprima;

delete from materia_prima where Id_TipoMP=4;

Select * from Proveedores;
Select Fecha,Monto_Compra From Proveedores Where Descuento>=3000;

# Se requiere ver todos los datos de todos los productos que pertenecen a la  categoría de “Panadería”. 
select * from tipo_materiaprima;

select * from tipo_producto;
select * from producto;
select * from tipo_materiaprima;

select producto.*,tipo_producto.idTipo_Producto, 
tipo_producto.Nombre_TipoProducto from producto
join  tipo_producto on producto.Id_TipoProducto=tipo_producto.idTipo_Producto 
where Nombre_TipoProducto='Panaderia';

# A partir de la tabla “Detalle_Compra”, muestre las cantidades de materia prima compradas y de la compra número 2.
select * from detalle_compra;
select CantidadMP from detalle_compra where IdCompra=2;

SELECT Nombre_Mp, CostoMP FROM Materia_Prima ORDER BY CostoMP DESC;

#Se necesita elaborar un informe que muestre una lista ordenada del nombre y precio de los productos que ofrece su empresa, mostrándolos del más barato al más caro.
select producto.NombreProducto, producto.PrecioProducto from producto order by  PrecioProducto desc;

select count(*) from materia_prima;

select count(*) from materia_prima where Id_TipoMP=3;

select Id_tipoMP, count(*) from materia_prima group by Id_TipoMP;

select * from compras;
# ¿Cuántas compras se han realizado hasta el momento?

select count(*) from compras;

#Cuántas compras de fresas ha realizado la empresa? Use la tabla detalle_compras

select * from materia_prima;

#id_MateriaPrima 1-->Nombre_Mp Fresas 

select * from tipo_materiaprima;


select * from detalle_compra;

select count(*) from detalle_compra where id_MateriaPrima=1;

# Muestre la cantidad de compras que se han realizado según materia prima

 select * from materia_prima;
 
 select * from compras;
 select Id_MateriaPrima, count(*) as 'cantidad de compras' from detalle_compra  group by Id_MateriaPrima ;

select * from detalle_compra;

select sum(Subtotal) from detalle_compra;

select (sum(Subtotal)*20) from detalle_compra;

select sum(Subtotal) from detalle_compra where Id_MateriaPrima=7;

# ¿Cuál es el monto total de las compras realizadas?

select sum(Monto_Compra)  from compras;

# ¿Qué pasa con las compras si el monto total aumenta en 200.000?

select * from compras where Monto_Compra>200.000;

 #¿Cuál es el monto total de las compras agrupadas por fecha?

select sum(Monto_Compra) from compras where Fecha='2020-02-01';

Select AVG(PrecioProducto) from Producto;
Select AVG(PrecioProducto) from Producto where Id_TipoProducto=1;

select Id_TipoMP, avg(CostoMP) from materia_prima order by Id_TipoMP;

Select Id_TipoMP, AVG(CostoMP) from Materia_Prima Group by 
Id_TipoMP;

#Cuál es en promedio el costo de la materia prima que utiliza la empresa?

select avg(CostoMP) from Materia_Prima;

#• ¿Cuál es en promedio el costo de los productos relacionados a “Granos y Semillas? 

select * from materia_prima;
#No entendí esta porque en Materia prima no existe “Granos y Semillas"

 #Muestre el precio promedio de los productos que ofrece la empresa organizados por tipo de producto

select avg(producto.PrecioProducto) from producto order by producto.IdProducto;

alter table producto modify column PrecioProducto decimal (10,2) ;

describe producto;

select producto.NombreProducto, max(producto.PrecioProducto) from producto;

Select NombreProducto, MIN(PrecioProducto) from Producto;

Select Nombre_Mp, CostoMP, Max(CostoMP) from Materia_Prima where 
Id_TipoMP=2;

#• ¿Cuál es el nombre y costo de la materia prima en la que incurre más gastos para la empresa?

select materia_prima.Nombre_Mp, materia_prima.CostoMP, max( CostoMP) from Materia_Prima ;

# ¿En qué fecha se realizó la compra con el menor monto?

select compras.Fecha, min(compras.Monto_Compra) from compras;

#• Por tipo de producto, ¿Cuál es el nombre y precio del producto más caro

select producto.NombreProducto, max(PrecioProducto) from producto;

#• Para la compra número 2, obtenga la cantidad comprada del menor monto de subtotal registrado en detalle_Compra.

select detalle_compra.CantidadMP, min(detalle_compra.Subtotal) from detalle_compra where detalle_compra.IdCompra=2;

Select NombreProducto from Producto Where PrecioProducto>2000 
AND Id_TipoProducto=1;

Select Nombre_Mp from Materia_Prima where Id_TipoMp=2 OR 
CostoMP<=5000;

#• Muestre la fecha y el monto de las compras que se encuentren entre los 15 mil a los 20 mil. 

select compras.Fecha, Monto_Compra from compras where compras.Monto_Compra>15000 and compras.Monto_Compra<20000;
#• Muestre el nombre de la materia prima cuyo costo se encuentra entre los 2100 a los 4000 y pertenezca al tipo “Granos y semillas”


select materia_prima.Nombre_Mp from materia_prima where materia_prima.CostoMP>2100 and materia_prima.CostoMP< 4000 and materia_prima.Id_TipoMP=7;

select Id_Producto,Nombre_Producto,Precio_Producto, 
Nombre_Categoria from Producto Inner Join Categoria_Producto Where 
Producto.Id_TipoProducto=Categoria_Producto.Id_TipoProducto;

Select Nombre_MP,Cantidad_Usada From Detalle_MP Inner Join 
Producto ON Detalle_MP.Id_Producto=Producto.Id_Producto Inner Join 
Materia_Prima ON 
Detalle_MP.Id_MateriaPrima=MateriaPrima.Id_MateriaPrima Where 
Id_Producto =1;

#• Se requiere un informe que muestre todos los datos de las compras realizadas incluyendo: 
#Número de compra, fecha de compra, el nombre del proveedor, el descuento y monto de la compra. 
select compras.Id_Compra, compras.Fecha, compras.descuento_compra, compras.Monto_Compra, compras.Id_Proveedor 
from compras 
inner join compras on compras.Id_Proveedor=proveedores.IdProveedores;

#• Muestre el detalle de la compra realizada el 15 de marzo del 2020, incluyendo el nombre de la 
#materia prima, la cantidad comprada y el subtotal.

SELECT detalle_compra.IdCompra, detalle_compra.CantidadMP, detalle_compra.Subtotal, materia_prima.Nombre_Mp
FROM detalle_compra
INNER JOIN compras ON detalle_compra.IdCompra = compras.Id_Compra
INNER JOIN materia_prima ON detalle_compra.Id_MateriaPrima = materia_prima.Id_MateriaPrima
WHERE compras.Fecha = '2020-03-15';
