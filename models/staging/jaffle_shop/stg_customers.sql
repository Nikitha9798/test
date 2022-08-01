with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    --from raw.jaffle_shop.customers  // If we write like this we have to use ref function 
                                    --// To avoid ref function we use sources
       from {{ source('jaffle_shop','customers')}}

)

select * from customers