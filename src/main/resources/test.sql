
INSERT INTO orders (
    user_id,
    destination,
    package_weight_lbs,
    price,
    time,
    vehicle,
    station_id,
    status
)
VALUES
    -- 订单1：待取件（默认状态） | 机器人 | 一号站 (37.7749, -122.4194)
    (
        (SELECT id FROM users WHERE username = 'laioffer'),
        '123 Market Street, San Francisco, CA 94103',
        5.5,
        15.99,
        12.5,
        'ROBOT',
        (SELECT station_id FROM stations WHERE coord_x = 37.7749 AND coord_y = -122.4194),
        'PENDING_DROPOFF'
    ),

    -- 订单2：已到达站点 | 无人机 | 二号站 (37.7561, -122.4476)
    (
        (SELECT id FROM users WHERE username = 'laioffer'),
        '456 Mission Boulevard, San Francisco, CA 94105',
        2.0,
        8.50,
        5.0,
        'DRONE',
        (SELECT station_id FROM stations WHERE coord_x = 37.7561 AND coord_y = -122.4476),
        'AT_STATION'
    ),

    -- 订单3：未过半程 | 机器人 | 三号站 (37.7123, -122.4000)
    (
        (SELECT id FROM users WHERE username = 'laioffer'),
        '789 Howard Avenue, San Francisco, CA 94107',
        12.0,
        28.75,
        20.0,
        'ROBOT',
        (SELECT station_id FROM stations WHERE coord_x = 37.7123 AND coord_y = -122.4000),
        'BEFORE_HALF_WAY'
    ),

    -- 订单4：已过半程 | 无人机 | 一号站
    (
        (SELECT id FROM users WHERE username = 'laioffer'),
        '101 2nd Street, San Francisco, CA 94105',
        3.5,
        10.25,
        8.0,
        'DRONE',
        (SELECT station_id FROM stations WHERE coord_x = 37.7749 AND coord_y = -122.4194),
        'MORE_THAN_HALF_WAY'
    ),

    -- 订单5：已送达 | 机器人 | 二号站
    (
        (SELECT id FROM users WHERE username = 'laioffer'),
        '202 3rd Street, San Francisco, CA 94107',
        8.0,
        22.00,
        18.0,
        'ROBOT',
        (SELECT station_id FROM stations WHERE coord_x = 37.7561 AND coord_y = -122.4476),
        'DELIVERED'
    ),

    -- 订单6：已取消 | 无人机 | 三号站
    (
        (SELECT id FROM users WHERE username = 'laioffer'),
        '303 4th Street, San Francisco, CA 94103',
        1.0,
        4.99,
        1.5,
        'DRONE',
        (SELECT station_id FROM stations WHERE coord_x = 37.7123 AND coord_y = -122.4000),
        'CANCELLED'
    ),

    -- 订单7：正好半程（用于边界测试）| 机器人 | 一号站
    (
        (SELECT id FROM users WHERE username = 'laioffer'),
        '404 5th Street, San Francisco, CA 94103',
        6.0,
        18.50,
        15.0,
        'ROBOT',
        (SELECT station_id FROM stations WHERE coord_x = 37.7749 AND coord_y = -122.4194),
        'HALF_WAY'
    );


INSERT INTO stations (coord_x, coord_y, radius, robot_count, drone_count)
VALUES
    (37.7749, -122.4194, 5.0, 3, 2),
    (37.7561, -122.4476, 4.5, 2, 3),
    (37.7123, -122.4000, 6.0, 4, 3);