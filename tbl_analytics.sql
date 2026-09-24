CREATE OR REPLACE TABLE uber-data-analytics-509202.uber_data_analytics_project.tbl_analytics AS (
SELECT 
f.trip_id,
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
pc.passenger_count,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 
uber-data-analytics-509202.uber_data_analytics_project.fact_table f
JOIN uber-data-analytics-509202.uber_data_analytics_project.datetime_dim d  ON f.datetime_id = d.datetime_id
JOIN uber-data-analytics-509202.uber_data_analytics_project.trip_distance_dim td ON td.trip_distance_id = f.trip_distance_id
JOIN uber-data-analytics-509202.uber_data_analytics_project.dropoff_location_dim dl ON dl.dropoff_location_id = f.dropoff_location_id
JOIN uber-data-analytics-509202.uber_data_analytics_project.passenger_count_dim pc  ON pc.passenger_count_id = f.passenger_count_id
JOIN uber-data-analytics-509202.uber_data_analytics_project.pickup_location_dim pl ON pl.pickup_location_id = f.pickup_location_id
JOIN uber-data-analytics-509202.uber_data_analytics_project.rate_code_dim rc ON rc.rate_code_id = f.rate_code_id
JOIN uber-data-analytics-509202.uber_data_analytics_project.payment_type_dim pt ON pt.payment_type_id = f.payment_type_id
);