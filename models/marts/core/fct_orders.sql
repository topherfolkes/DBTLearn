with 
 customers as (

    select * from {{ref ('stg_customers')}}
),
orders as (

    select * from {{ref ('stg_orders')}}
),
payments as (
    select * from {{ ref ('stg_payments')}}
),

final as (

    select
        order_id,
        customer_id,
        customers.first_name,
        amount

    from customers

    left join orders using (customer_id) 
    left join payments on payments.orderid = orders.order_id
)

select * from final