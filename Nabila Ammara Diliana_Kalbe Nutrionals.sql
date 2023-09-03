select AVG(age),"Marital Status"  from customer group by "Marital Status" ;

select AVG(age),gender from customer group by gender ;

select MAX(total_qty) as total_qty,storeid, storename from (
	select SUM(transaction.qty)as total_qty, transaction.storeid as storeid, 
	store.storename as storename from transaction join store on store.storeid = transaction.storeid 
	group by store.storename, transaction.storeid
)as total group by storeid, storename order by total_qty desc limit 1;


SELECT product.productid as productid, product."Product Name", SUM(transaction.totalamount) as amount
FROM product
JOIN transaction ON transaction.productid = product.productid
GROUP BY product.productid, product."Product Name" order by amount desc limit 1;