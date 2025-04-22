/* Average income, number of customers, amount spent per category and number of purchases per category, by country*/
SELECT country,
  count(*),
  round(AVG(REGEXP_REPLACE(income::text, '[$,]', '', 'g')::numeric),2) AS average_income,
  round(avg(mntwines),2) as wine,
  round(avg(mntfruits),2) as fruit,
  round(avg(mntmeatproducts),2) as meat,
  round(avg(mntfishproducts),2) as fish,
  round(avg(mntsweetproducts),2) as sweet,
  round(avg(mntgoldprods),2) as gold,
  round(avg(numdealspurchases),2) as deal_pur,
  round(avg(numwebpurchases),2) as web_pur,
  round(avg(numcatalogpurchases),2) as catalogue_pur,
  round(avg(numstorepurchases),2) as store_pur,
  round(avg(numwebvisitsmonth),2) as web_visit
FROM marketing_data
group by 1
order by 3 desc;

/* Average income, number of customers, amount spent per category and number of purchases per category, by graduation status*/
SELECT graduation,
  count(*),
  round(AVG(REGEXP_REPLACE(income::text, '[$,]', '', 'g')::numeric),2) AS average_income,
  round(avg(mntwines),2) as wine,
  round(avg(mntfruits),2) as fruit,
  round(avg(mntmeatproducts),2) as meat,
  round(avg(mntfishproducts),2) as fish,
  round(avg(mntsweetproducts),2) as sweet,
  round(avg(mntgoldprods),2) as gold,
  round(avg(numdealspurchases),2) as deal_pur,
  round(avg(numwebpurchases),2) as web_pur,
  round(avg(numcatalogpurchases),2) as catalogue_pur,
  round(avg(numstorepurchases),2) as store_pur,
  round(avg(numwebvisitsmonth),2) as web_visit
FROM marketing_data
group by 1
order by 3 desc;

/* Average income, number of customers, amount spent per category and number of purchases per category, by marital status*/
SELECT marital_status,
  count(*),
  round(AVG(REGEXP_REPLACE(income::text, '[$,]', '', 'g')::numeric),2) AS average_income,
  round(avg(mntwines),2) as wine,
  round(avg(mntfruits),2) as fruit,
  round(avg(mntmeatproducts),2) as meat,
  round(avg(mntfishproducts),2) as fish,
  round(avg(mntsweetproducts),2) as sweet,
  round(avg(mntgoldprods),2) as gold,
  round(avg(numdealspurchases),2) as deal_pur,
  round(avg(numwebpurchases),2) as web_pur,
  round(avg(numcatalogpurchases),2) as catalogue_pur,
  round(avg(numstorepurchases),2) as store_pur,
  round(avg(numwebvisitsmonth),2) as web_visit
FROM marketing_data
group by 1
order by 3 desc;

/*Total amount spent per category*/
SELECT
  sum(mntwines) as wine,
  sum(mntfruits) as fruit,
  sum(mntmeatproducts) as meat,
 	sum(mntfishproducts) as fish,
  sum(mntsweetproducts) as sweet,
  sum(mntgoldprods) as gold,
  sum(numdealspurchases) as deal_pur,
  sum(numwebpurchases) as web_pur,
  sum(numcatalogpurchases) as catalogue_pur,
  sum(numstorepurchases)  as store_pur,
  sum(numwebvisitsmonth) as web_visit
FROM marketing_data;
