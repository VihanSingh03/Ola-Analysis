Create database Ola;
use Ola;

#All success full bookings 
Create View Successfull_Bookings As
select * from bookings
WHERE Booking_Status = 'Success';

#Find the AVG ride Distance for each vehicle
Create View AVG_ride_Distance_for_each_vehicle As
SELECT Vehicle_Type,avg(Ride_Distance)
as avg_distance FROM bookings
group by Vehicle_Type;

#Get total number of cancled ride by customer 
create View number_of_cancled_ride_by_customer as 
select count(*)
From bookings
where Booking_Status = 'Canceled by Customer';

#List the top 5 customers who books the highest number of rides 
create View top_5_customers_who_books_the_highest_number_of_rides as 
select Customer_ID,count(Booking_ID) as total_rides
From bookings
group by Customer_ID
order by total_rides desc LIMIT 5;

#Get tthe numbers of rides cancled by driver due to personal and car related issue 
create view rides_cancled_by_driver_due_to_P_C_related_issue as
select count(*)
From bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#find the maximum and minimum driver rating for prime sadan bookings
create view MAX_MIN_RATING_FOR_SADAN AS
select Vehicle_Type,max(Driver_Ratings) as max_rating,min(Driver_Ratings) as min_rating
From bookings
where Vehicle_Type = 'Prime Sedan'
group by Vehicle_Type;

#retrive all the rides where payment was made using UPI
create view UPI_PAYMENT AS
select *
from bookings
where Payment_Method = 'UPI';

#AVG Customer rating per vehicle type
create view AVG_CUST_RATING AS
select Vehicle_Type,avg(Customer_Rating)
from bookings
group by Vehicle_Type;

#calculate the total booking value of rides complete successfully 
create view total_successful_ride_value as 
select sum(Booking_Value) as total_successful_ride_value
from bookings
where Booking_Status = 'Success';

#List all incomplete rides along with the reasons
create view Incomplete_rides as
select Incomplete_Rides,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';