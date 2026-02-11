select *
from nashville_housing;

Select saledate,saledate::date as standard_date
from nashville_housing;

--standardizing the saledate column itself
update nashville_housing
set saledate = saledate::date;

--That will convert saledate (timestamp/text) into a date and store it in saledate_converted.
alter table nashville_housing
add saledate_converted date;

update nashville_housing
set saledate_converted = saledate;

select * FROM nashville_housing;

--populate propertyaddress 
select *
from nashville_housing;




select a.parcelid , a.propertyaddress,b.parcelid, b.propertyaddress
from nashville_housing a
join nashville_housing b
on a.parcelid = b.parcelid
and a.uniqueid <> b.uniqueid
where a.parcelid = b.parcelid ;

select a.parcelid , a.propertyaddress,b.parcelid, b.propertyaddress,COALESCE(a.propertyaddress,b.propertyaddress) 
from nashville_housing a
join nashville_housing b
on a.parcelid = b.parcelid
and a.uniqueid <> b.uniqueid
where a.propertyaddress is null;

update nashville_housing
set propertyaddress = COALESCE(a.propertyaddress,b.propertyaddress)
from nashville_housing a
join nashville_housing b
on a.parcelid = b.parcelid
and a.uniqueid <> b.uniqueid
where a.propertyaddress is null;

select a.parcelid , a.propertyaddress,b.parcelid, b.propertyaddress
from nashville_housing a
join nashville_housing b
on a.parcelid = b.parcelid
and a.uniqueid <> b.uniqueid
where b.propertyaddress is null;

select *
from nashville_housing;

select propertyaddress
from nashville_housing;

select propertyaddress,substring(propertyaddress,1,position(',' in propertyaddress)-1) as street_address
from nashville_housing;

select substring(propertyaddress,position(',' in propertyaddress)+1,length(propertyaddress)) as city_state_zip
from nashville_housing


alter table nashville_housing
add street_address text;

update nashville_housing
set street_address = substring(propertyaddress,1,position(',' in propertyaddress)-1);

alter table nashville_housing
add stree_city text;

update nashville_housing
set stree_city = substring(propertyaddress,position(',' in propertyaddress)+1,length(propertyaddress)) ;

select *
from nashville_housing;


alter table nashville_housing
rename column stree_city to street_city;


select owneraddress
from nashville_housing;

select owneraddress,split_part(owneraddress,',',1) as owner_streett,
split_part(owneraddress,',',2)as owner_city ,
split_part(owneraddress,',',3)as owner_state
from nashville_housing;



alter table nashville_housing
add owner_street text;

alter table nashville_housing
add owner_city text;

alter table nashville_housing
add owner_state text;

update nashville_housing
set owner_street = split_part(owneraddress,',',1);

update nashville_housing
set owner_city = split_part(owneraddress,',',2);


update nashville_housing
set owner_state = split_part(owneraddress,',',3);


select *
from nashville_housing;


select DISTINCT(soldasvacant)
from nashville_housing;


--counting unique values in soldasvacant
select DISTINCT(soldasvacant),count(soldasvacant)
from nashville_housing
group by soldasvacant
order by 2 desc;


--standardizing Y/N values
select case when soldasvacant ='N' then 'NO'
            when soldasvacant ='Y' then 'YES'
            else soldasvacant end as sold_as_vacant , soldasvacant
from nashville_housing;

update nashville_housing
set soldasvacant = case when soldasvacant ='N' then 'NO'
            when soldasvacant ='Y' then 'YES'
            else soldasvacant 
            end;


--standardizing Yes/No values
update nashville_housing
set soldasvacant = case when soldasvacant ='No' then 'NO'
            when soldasvacant ='Yes' then 'YES'
            else soldasvacant 
            end;

select * 
from nashville_housing;

--Identify duplicates

select row_number()over(PARTITION BY parcelid,legalreference,saledate ,saleprice ,propertyaddress order by uniqueid) as rn
from nashville_housing
;

--Identify duplicates
select *
from(
  select *,row_number()over(PARTITION BY parcelid,legalreference,saledate ,saleprice ,propertyaddress order by uniqueid) as rn
from nashville_housing
)as rn_table 
order by parcelid;


select *
from(
  select *,row_number()over(PARTITION BY parcelid,legalreference,saledate ,saleprice ,propertyaddress order by uniqueid) as rn
from nashville_housing
)as rn_table ;



--with cte
with rownum_cte as(
   select *,row_number()over(PARTITION BY parcelid,legalreference,saledate ,saleprice ,propertyaddress order by uniqueid) as rn
from nashville_housing
)
select *,rn
from rownum_cte
where rn >1;


--delete duplicates
with rownum_cte as(
   select *,row_number()over(PARTITION BY parcelid,legalreference,saledate ,saleprice ,propertyaddress order by uniqueid) as rn
from nashville_housing
)
Delete 
from nashville_housing
using rownum_cte
where nashville_housing.uniqueid = rownum_cte.uniqueid and 
 rn >1;

select *
from nashville_housing;

alter table nashville_housing
drop column propertyaddress,
drop column taxdistrict, 
drop column owneraddress;


alter table nashville_housing
drop column

  



