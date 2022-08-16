select
  orders.id,
  orders.status,
  sum(case when payments.payment_method = 'bank_transfer' then payments.amount else 0 end) as bank_transfer_amount,
  sum(case when payments.payment_method = 'credit_card' then payments.amount else 0 end) as credit_card_amount,
  sum(case when payments.payment_method = 'gift_card' then payments.amount else 0 end) as gift_card_amount,
  sum(amount) as total_amount

from {{ ref('base_orders') }} as orders
left join {{ ref('base_payments') }} as payments on payments.order_id = orders.id