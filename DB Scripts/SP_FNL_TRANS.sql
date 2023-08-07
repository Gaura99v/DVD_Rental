CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FNL_TRANS`()
BEGIN

insert into tbl_fnl_actor
 (select actor_id ,
 Name from tbl_trans_actor_hop1);

insert into tbl_fnl_address
 (select address_id,
  address ,
  district,
  city_id ,
  postal_code,
  phone
  from tbl_trans_address_hop1);
  
insert into tbl_fnl_customer
  (select customer_id,
  store_id ,
  Name,
  email ,
  address_id ,
  active from tbl_trans_customer_hop1);
 

insert into tbl_fnl_film
(select film_id,
  title ,
  description ,
  release_year,
  language_id ,
  rental_duration ,
  rental_rate ,
  length ,
  replacement_cost ,
  rating ,
  special_features
  from tbl_trans_film_hop1);


insert into tbl_fnl_city
 (select city_id,
  city ,
  country_id from tbl_trans_city_hop1);
  
  
 insert into  tbl_fnl_film_actor 
  (select actor_id,
  film_id from tbl_trans_film_actor_hop1);

  
insert into tbl_fnl_film_category
(select film_id ,
  category_id from tbl_trans_film_category_hop1 y);
  
insert into tbl_fnl_payment 
  (select payment_id ,
  customer_id ,
  staff_id ,
  rental_id,
  amount ,
  payment_date from tbl_trans_payment_hop1);


insert into tbl_fnl_store 
(select store_id ,
  manager_staff_id ,
  address_id from tbl_trans_store_hop1);


insert into tbl_fnl_inventory
( select inventory_id ,
  film_id ,
  store_id from tbl_trans_inventory_hop1);

insert into tbl_fnl_film_text
( select film_id ,
  title ,
  description from tbl_trans_film_text_hop1);

insert into tbl_fnl_rental
( select rental_id,
  rental_date ,
  inventory_id,
  customer_id ,
  return_date ,
  staff_id from tbl_trans_rental_hop1);


insert into tbl_fnl_staff 
( select staff_id ,
  first_name ,
  last_name ,
  address_id ,
  email ,
  store_id,
  active ,
  username ,
  password from tbl_trans_staff_hop1);


insert into tbl_fnl_film_actor 
( select actor_id ,
  film_id from tbl_trans_film_actor_hop1);


insert into tbl_fnl_languages 
(select language_id,
  name from tbl_trans_languages_hop1);
  
  
insert into tbl_fnl_store
(select store_id ,
  manager_staff_id ,
  address_id from tbl_trans_store_hop1);

insert into tbl_fnl_country (
    select country_id ,
    country from tbl_trans_country_hop1);
	
insert into tbl_fnl_category (
  select category_id,
  name from tbl_trans_category_hop1);
    
END