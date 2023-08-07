CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRANS_HOP1`()
BEGIN

insert into tbl_trans_actor_hop1
select actor_id ,
concat(first_name, ' ', last_name) Name
from tbl_stg_actor;

insert into tbl_trans_address_hop1
select address_id,
  address ,
  district,
  city_id ,
  ifnull(postal_code,0) postal_code,
  ifnull(phone, 0000000000) phone
  from tbl_stg_address;
  
insert into tbl_trans_customer_hop1
  select customer_id, 
  store_id ,
  concat(first_name, ' ' ,last_name) Name,
  email ,
  address_id ,
  active from tbl_stg_customer;
  
  update tbl_trans_customer_hop1
  set email = replace(email, 'sakilacustomer.org', 'blueboxdvd.com')
  where email LIKE '%@sakilacustomer.org';

insert into tbl_trans_film_hop1
select film_id,
  title ,
  description ,
  release_year,
  language_id ,
  rental_duration ,
  rental_rate ,
  length ,
  replacement_cost ,
  case
  when rating = 'G' then 'General Audience' 
  when rating = 'PG' then 'Parental Guidance'
  when rating = 'PG-13' then 'Parents Strongly Cautioned'
  when rating = 'R' then 'Restricted'
  when rating = 'NC-17' then 'Adults only'
  else rating end
  rating ,
  special_features 
  from tbl_stg_film;


insert into tbl_trans_city_hop1
 (select city_id,
  city ,
  country_id from tbl_stg_city);
  
  
 insert into  tbl_trans_film_actor_hop1 
  (select actor_id,
  film_id from tbl_stg_film_actor);

  
insert into tbl_trans_film_category_hop1 
(select film_id ,
  category_id from tbl_stg_film_category);
  
insert into tbl_trans_payment_hop1 
  (select payment_id ,
  customer_id ,
  staff_id ,
  rental_id,
  amount ,
  payment_date from tbl_stg_payment);


insert into tbl_trans_store_hop1 
(select store_id ,
  manager_staff_id ,
  address_id from tbl_stg_store);


insert into tbl_trans_inventory_hop1 
( select inventory_id ,
  film_id ,
  store_id from tbl_stg_inventory);

insert into tbl_trans_film_text_hop1 
( select film_id ,
  title ,
  description from tbl_stg_film_text);

insert into tbl_trans_rental_hop1 
( select rental_id,
  rental_date ,
  inventory_id,
  customer_id ,
  return_date ,
  staff_id from tbl_stg_rental);


insert into tbl_trans_staff_hop1 
( select staff_id ,
  first_name ,
  last_name ,
  address_id ,
  email ,
  store_id,
  active ,
  username ,
  password from tbl_stg_staff);


insert into tbl_trans_film_actor_hop1 
( select actor_id ,
  film_id from tbl_stg_film_actor);


insert into tbl_trans_languages_hop1 
(select language_id,
  name from tbl_stg_languages);
  
  
insert into tbl_trans_store_hop1 
(select store_id ,
  manager_staff_id ,
  address_id from tbl_stg_store);

insert into tbl_trans_country_hop1 (
    select country_id ,
    country from tbl_stg_country);
    
insert into tbl_fnl_category (
  select category_id,
  name from tbl_trans_category_hop1);
  
END