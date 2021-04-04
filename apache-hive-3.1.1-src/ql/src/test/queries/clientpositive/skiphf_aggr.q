SET hive.vectorized.execution.enabled=false;
DROP TABLE IF EXISTS skipHTbl;

CREATE TABLE skipHTbl (a int) 
PARTITIONED BY (b int) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
TBLPROPERTIES('skip.header.line.count'='1');

INSERT OVERWRITE TABLE skipHTbl PARTITION (b = 1) VALUES (1), (2), (3), (4);
INSERT OVERWRITE TABLE skipHTbl PARTITION (b = 2) VALUES (1), (2), (3), (4);

SELECT * FROM skipHTbl;

SELECT DISTINCT b FROM skipHTbl;
SELECT MAX(b) FROM skipHTbl;
SELECT DISTINCT a FROM skipHTbl;

INSERT OVERWRITE TABLE skipHTbl PARTITION (b = 1) VALUES (1);
INSERT OVERWRITE TABLE skipHTbl PARTITION (b = 2) VALUES (1), (2), (3), (4);

SELECT DISTINCT b FROM skipHTbl;
SELECT MIN(b) FROM skipHTbl;
SELECT DISTINCT a FROM skipHTbl;

DROP TABLE IF EXISTS skipFTbl;

CREATE TABLE skipFTbl (a int) 
PARTITIONED BY (b int) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
TBLPROPERTIES('skip.footer.line.count'='1');

INSERT OVERWRITE TABLE skipFTbl PARTITION (b = 1) VALUES (1), (2), (3), (4);
INSERT OVERWRITE TABLE skipFTbl PARTITION (b = 2) VALUES (1), (2), (3), (4);

SELECT * FROM skipFTbl;

SELECT DISTINCT b FROM skipFTbl;
SELECT MAX(b) FROM skipFTbl;
SELECT DISTINCT a FROM skipFTbl;

DROP TABLE skipHTbl;
DROP TABLE skipFTbl;

