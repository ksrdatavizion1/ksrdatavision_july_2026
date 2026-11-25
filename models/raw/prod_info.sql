{{
    config(
        materialized='view',
        query_tag = 'dbt'
    )
}}

SELECT
    c.CUSTOMER_ID,
    c.FIRST_NAME,
    c.LAST_NAME,
    c.EMAIL,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    p.PURCHASE_DATE
from {{ source('raw_data', 'Cust') }} c
join {{ source('raw_data2', 'prod') }} p
on c.CUSTOMER_ID = p.CUSTOMER_ID
