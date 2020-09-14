-- Author: Christoph Stoettner
-- Mail:   christoph.stoettner@stoeps.de
--
-- run with 
-- db2 -td@ -vf xcc-appGrants.sql

-- Connect to database
connect to xcc@

-- Remove rights from official script
REVOKE CONNECT ON DATABASE FROM USER LCUSER@
REVOKE BINDADD ON DATABASE FROM USER LCUSER@
REVOKE CREATETAB ON DATABASE FROM USER LCUSER@
REVOKE CREATE_EXTERNAL_ROUTINE ON DATABASE FROM USER LCUSER@
REVOKE CREATE_NOT_FENCED_ROUTINE ON DATABASE FROM USER LCUSER@
REVOKE IMPLICIT_SCHEMA ON DATABASE FROM USER LCUSER@
REVOKE DBADM ON DATABASE FROM USER LCUSER@
REVOKE LOAD ON DATABASE FROM USER LCUSER@
REVOKE QUIESCE_CONNECT ON DATABASE FROM USER LCUSER@
REVOKE SECADM ON DATABASE FROM USER LCUSER@
REVOKE ACCESSCTRL ON DATABASE FROM USER LCUSER@
REVOKE DATAACCESS ON DATABASE FROM USER LCUSER@
REVOKE EXPLAIN ON DATABASE FROM USER LCUSER@
REVOKE SQLADM ON DATABASE FROM USER LCUSER@
REVOKE WLMADM ON DATABASE FROM USER LCUSER@

-- Allow connect to database
grant connect on database to user lcuser@

-- Allow delete, insert, select and update on tables
grant delete, insert, select, update on XCC.CLIENT to user lcuser@
grant delete, insert, select, update on XCC.CONTAINER to user lcuser@
grant delete, insert, select, update on XCC.CONTAINER_WIDGET to user lcuser@
grant delete, insert, select, update on XCC.CONTAINER_XCCPROPERTY to user lcuser@
grant delete, insert, select, update on XCC.CONTAINER_XCCUSER to user lcuser@
grant delete, insert, select, update on XCC.CONTENTSTREAM to user lcuser@
grant delete, insert, select, update on XCC.CONTENTSTREAM_ENTRY to user lcuser@
grant delete, insert, select, update on XCC.ENDPOINT to user lcuser@
grant delete, insert, select, update on XCC.ENTRY to user lcuser@
grant delete, insert, select, update on XCC.ENTRY_ENTRY to user lcuser@
grant delete, insert, select, update on XCC.ENTRY_ITEM to user lcuser@
grant delete, insert, select, update on XCC.INTEGRATION to user lcuser@
grant delete, insert, select, update on XCC.INTEGRATION_SERVICES to user lcuser@
grant delete, insert, select, update on XCC.ITEM to user lcuser@
grant delete, insert, select, update on XCC.OPENJPA_SEQUENCE_TABLE to user lcuser@
grant delete, insert, select, update on XCC.TEMPLATE to user lcuser@
grant delete, insert, select, update on XCC.WEBTOKENSTORAGE to user lcuser@
grant delete, insert, select, update on XCC.WIDGET to user lcuser@
grant delete, insert, select, update on XCC.WIDGETOAUTH2REGISTRATION to user lcuser@
grant delete, insert, select, update on XCC.WIDGET_CONTENTSTREAM to user lcuser@
grant delete, insert, select, update on XCC.WIDGET_XCCFILESTORAGE to user lcuser@
grant delete, insert, select, update on XCC.WIDGET_XCCPROPERTY to user lcuser@
grant delete, insert, select, update on XCC.XCCFILESTORAGE to user lcuser@
grant delete, insert, select, update on XCC.XCCPROPERTY to user lcuser@
grant delete, insert, select, update on XCC.XCCUSER to user lcuser@
grant delete, insert, select, update on XCC.DATABASECHANGELOGLOCK to user lcuser@
grant delete, insert, select, update on XCC.DATABASECHANGELOG to user lcuser@

commit@

connect reset@
