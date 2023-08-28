create database HiCounselor;
select * from patients;

-- Q1) How many values are there in the given dataset?
select count(*) from patients;

-- Q2) Count the number of appointments for each day in the given dataset
select appointmentday,count(*) from patients group by appointmentday;

-- Q3) Calculate the average number of appointments(Set to nearest whole number) per day in the given dataset.
select round(avg(appointment_per_day)) as avg_appointment_per_day from (select appointmentday,count(*) as appointment_per_day from patients group by appointmentday) as daily_appointment;

-- Q4) Find the day with the highest number of appointments in the given dataset.
select appointmentday,count(appointmentday) as appointment_count from patients group by appointmentday order by appointment_count desc limit 1 ;

-- Q5) Calculate the monthly average number of appointments in the given dataset.
select DATE_FORMAT(appointmentday,'%Y-%m') as month,round(avg(appointment_per_month)) as avg_appointment_per_month from 
(select appointmentday,count(*) as appointment_per_month from patients group by date_format(appointmentday,'%Y-%m')) as monthly_appointments
group by DATE_FORMAT(AppointmentDay, '%Y-%m');

-- Q6) Find the month with the highest number of appointments in the given dataset.
select DATE_FORMAT(appointmentday,'%Y-%m') as month,round(avg(appointment_per_month)) as appointments_count from 
(select appointmentday,count(*) as appointment_per_month from patients group by date_format(appointmentday,'%Y-%m')) as monthly_appointments
group by month order by appointments_count desc limit 1;

-- Q7) Calculate the weekly average number of appointments in the given dataset.
select YEAR(AppointmentDay) AS year,WEEK(AppointmentDay) AS week, ROUND(AVG(appointment_per_week)) AS average_appointments_per_week from 
(select appointmentday,count(*) as appointment_per_week from patients group by 
YEAR(appointmentday),WEEK(appointmentday)) as weekly_appointments
group by year,week;

-- Q8) Find the week with the highest number of appointments in the given dataset.
select YEAR(AppointmentDay) AS year,WEEK(AppointmentDay) AS week, ROUND(AVG(appointment_per_week)) AS average_appointments_per_week from 
(select appointmentday,count(*) as appointment_per_week from patients group by 
YEAR(appointmentday),WEEK(appointmentday)) as weekly_appointments
group by year,week ORDER BY average_appointments_per_week desc limit 1;

-- Q9) What is the distribution of appointments based on gender in the dataset?
select gender,count(*) from patients group by gender;

-- Q10) Calculate the number of appointments per weekday in the given dataset. Order the appointment counts in descending.  Hint : Use 'DAYNAME()' function.
select DAYNAME(appointmentday) as weekday,count(*) as appointment_count from patients group by weekday order by appointment_count desc;

-- Q11) Calculate the average time between scheduling and the appointment day in the given dataset. Set to nearest whole number
select  round(avg(datediff(appointmentday,scheduledday))) from patients 


