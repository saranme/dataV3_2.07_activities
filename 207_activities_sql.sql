-- Activity 1 solution:

alter table bank.loan
add status_desc varchar(30);

update bank.loan set status_desc =
  case
  when status = 'A' then 'Good - Contract Finished'
  when status = 'B' then 'Defaulter - Contract Finished'
  when status = 'C' then 'Good - Contract Running'
  else 'In Debt - Contract Running'
  end;

-- Activity 2 solution:

-- Insert Anomaly
-- Delete Anomaly
-- Update Anomaly

select min(amount) as Minimum, status from bank.loan
group by Status
order by avg(amount) asc;

select max(amount) as Maximum, status from bank.loan
group by Status
order by avg(amount) asc;

-- Activity 3 solution:
/*Find out how many cards of each type have been issued.*/
SELECT COUNT(*) n_cards, type
FROM card
GROUP BY type;

/*Find out how many customers there are by the district.*/
SELECT COUNT(*) n_customers, district_id
FROM account
GROUP BY district_id
ORDER BY district_id ASC;

/*Find out average transaction value by type.*/
SELECT AVG(amount) avg_trans, type
FROM trans
GROUP BY type;

/* As you might have seen in the query shown below, 
there are 19 rows returned by this query. 
But there a few places where the column k_symbol is an empty string. 
Your task it to use a filter to remove those rows of data. 
After the filter gets applied, you would see that the number of rows have reduced.*/
select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
group by type, operation, k_symbol
having k_symbol <> ' ' and k_symbol <> ''
order by type, operation, k_symbol;