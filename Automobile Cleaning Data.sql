-- histrical data of the automobile data

select *
from ['automobile_data (1)$']

-- inspect the length column
-- in this result their is only 2 types of fuel diesel and gas based on the result
-- there is no electricity fuel
select distinct fuel_type
from ['automobile_data (1)$']

-- I want to see the length column
-- it should contain the measurement of the cars
-- so I want to see the min and max length
-- after I run the query the answer was 141.1 for mininum
-- and maximum is 208.1
select min(length) as min_length, max(length) as max_length
from ['automobile_data (1)$']

-- now I want to fill the missing data
-- I want to make the empty cell to null for the all the data
select *
from ['automobile_data (1)$']
where num_of_doors is null

-- so in order to fill the missing value, I should check the sales manger
-- who states that all dodge gas sedans and all mazda diesel sedans sold had four doors.

UPDATE ['automobile_data (1)$']
set num_of_doors = 'four'
where make = 'dodge'
and fuel_type = 'gas'
and body_style = 'sedan'
-- now there are 3 rows modified in the table based on the previous query

-- lets run the null query again 
select *
from ['automobile_data (1)$']
where num_of_doors is null
-- Now, you only have one row with a NULL value for num_of_doors. 



-- now there are no missing value in the data 
-- want to check for other potential errors

select distinct num_of_cylinders
from ['automobile_data (1)$']
-- this for removing the dublicate data in the num of the cylinders colums

-- now I want to correct the missspelling for all rows
update ['automobile_data (1)$']
set num_of_cylinders = 'two'
where num_of_cylinders='two'

-- now 3 rows modified after runing the query above

-- like before, I want to check what is the min and max but this time in the compression ratio
select min(compression_ratio) as min_compression_ratio,
max(compression_ratio) as max_compression_ratio
from ['automobile_data (1)$']
-- minimum compression ratio is 7
--maximum compression ratio is 70

-- as you can see now the maximum is 70 but know this sis an error because maximum value in this column should be 23, not 70. 
-- I think 70 mostly likely a 7.0. 
-- so let's run the query again without the raw of 70 to make sure that the values will fall within 7 to 23
select min(compression_ratio) as min_compression_ratio,
max(compression_ratio) as max_compression_ratio
from ['automobile_data (1)$']
where compression_ratio != 70

-- as I can see I got the max_compression_ratio as 23


-- I want to correct the value of 70 
-- we want to the sales manager again who says that this row was made in error and should be removed.
-- first I want to see how many rows contain this errorneous value as a precaution so that you don't end up deleting 50% of your data
-- I would want to check back in with the sales manager to inquire if these should be deleted or if the 70 should be updated to another value

select count(*) as num_of_rows_to_delete
from ['automobile_data (1)$']
where compression_ratio=70

-- there is only one rows with the erronus 70 value. so you can delete that row ysing this query:
delete ['automobile_data (1)$']
where compression_ratio=70;

-- now we modified the raw whereby I delete the error.


-- now I want to check the drive wheels column for ensuring the consistency 
select distinct drive_wheels 
from ['automobile_data (1)$']

-- it apears that it is consistentcy 

