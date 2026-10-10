-- 1.For each membership plan, display:
-- Plan name
-- Plan description
-- Plan price
-- Plan duration

select * from plan
order by price;

-- =========================================================================================================================================================
-- 2. For each trainer specializing in either Pilates or Yoga, display:
-- First name
-- Last name
-- Email
-- Price per session


select 
	first_name,
    last_name,
    email,
    specialty,
   session_price
   from trainer 
   where specialty in('Pilates','Yoga');
   
   -- =========================================================================================================================================================
-- 3. For each member with a currently active plan, display:
-- First name
-- Last name
-- Plan name
-- Start date
-- End date

   select 
   m.first_name,
   m.last_name,
   p.plan_name,
   s.start_date,
   s.end_date
   from member_plan s
   inner join member m
   on s.member_id=m.id
	inner join plan p
    on s.plan_id=p.id;
   
   
      -- =========================================================================================================================================================
-- 4. Display the average price of a training session. Name the column avg_price.
select round(avg(price),2)as avg_price
from plan;
      -- =========================================================================================================================================================
-- 5. For each trainer, display:
-- Trainer ID
-- First name
-- Last name
-- Total earnings from personal training sessions

select 
count(ts.trainer_id) trainer_session,
count(ts.trainer_id) * t.session_price as total_earning,
trainer_id
from training_session ts
inner join trainer t
on t.id=ts.trainer_id
group by trainer_id;


      -- =========================================================================================================================================================
-- 6. For each trainer, display:
-- First name
-- Last name
-- Total sessions booked with the trainer
-- Sort all trainers by the number of training sessions, showing even those without any sessions. Display the trainer with the greatest number of sessions first.
    
    select
    t.first_name,
    t.last_name,
    s.trainer_id,
    count(s.trainer_id) as sessions
    from training_session s
    inner join trainer t
    on s.trainer_id=t.id
    group by s.trainer_id
    order by sessions desc;
    
          -- =========================================================================================================================================================

  --   7. For each member, display:
-- Member ID
-- First name
-- Last name
-- Email
-- Number of sessions booked
-- Show only members who have booked more than 10 sessions.

select m.id,
m.first_name,
m.last_name,
m.email,
count(*) as "session booked"
from member m
inner join member_plan mp
on m.id=mp.member_id
group by m.id;


      -- =========================================================================================================================================================


-- 8. Consider only members who have purchased the most expensive plan. For each trainer who has booked sessions with them, display:
-- First name
-- Last name
-- Phone number
-- Email
-- Price per session
-- Display each trainer just once.

select 
m.first_name,
m.last_name,
m.phone,
m.email,
t.id,
t.first_name,
t.session_price
from member m
inner join trainer t

