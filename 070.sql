DROP FUNCTION IF EXISTS response;
CREATE FUNCTION response(name VARCHAR(40)) RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
    SELECT REGEXP_SUBSTR(name, '^[^ ]+'), REGEXP_SUBSTR(name, '[^ ]+$')
    INTO @fname, @lname;
    RETURN CONCAT('Dear ', CONCAT(UPPER(SUBSTRING(@fname FROM 1 FOR 1)),LOWER(SUBSTRING(@fname FROM 2))), ' ', CONCAT(UPPER(SUBSTRING(@lname FROM 1 FOR 1)),LOWER(SUBSTRING(@lname FROM 2))) , '! We received your message and will process it as soon as possible. Thanks for using our service. FooBar On! - FooBarIO team.');
END;

CREATE PROCEDURE customerMessages()
BEGIN
    SELECT id, name, response(name) AS response
    FROM customers;
END;
