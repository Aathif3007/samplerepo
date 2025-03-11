select e.*, rank() over(partition by department_id order by salary desc) rnkk
from employees e
qualify rnkk = 1;


show stages;
drop stage parquet;

show tables;

drop table parquet_update


show stages;

select * from @parquet_stage;

create or replace table parquet_new as 
select COl:"__index_level_0__" as index_value,
col:"cat_id"::string as category_id,
COL:"d" as D,
date(COL:"date"::integer) as date,
COL:"dept_id"::string as dept_id,
COL:"id"::string as id,
COL:"item_id"::string as item_id,
COL:"store_id"::string as store_id,
col:"value" as value
from parquet_update;

create or replace table parquet_update(col variant);

select * from parquet_new;

copy into parquet_update
from @parquet_stage;

select * from parquet_update;
