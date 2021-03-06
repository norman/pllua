-- $Id: pllua.sql.in,v 1.2 2008/02/24 15:41:02 carvalho Exp $

CREATE FUNCTION pllua_call_handler()
  RETURNS language_handler AS '$libdir/pllua'
  LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION pllua_validator(oid)
  RETURNS VOID AS '$libdir/pllua'
  LANGUAGE C IMMUTABLE STRICT;

CREATE TRUSTED LANGUAGE pllua
  HANDLER pllua_call_handler
  VALIDATOR pllua_validator;

CREATE FUNCTION plluau_call_handler()
  RETURNS language_handler AS '$libdir/pllua'
  LANGUAGE C IMMUTABLE STRICT;

CREATE FUNCTION plluau_validator(oid)
  RETURNS VOID AS '$libdir/pllua'
  LANGUAGE C IMMUTABLE STRICT;

CREATE LANGUAGE plluau
  HANDLER plluau_call_handler
  VALIDATOR plluau_validator;

-- Optional:

--CREATE SCHEMA pllua
--  CREATE TABLE init (module text);

-- PL template installation:

-- INSERT INTO pg_catalog.pg_pltemplate
--        (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl)
--        VALUES ('pllua', TRUE, TRUE, 'pllua_call_handler', NULL, 'pllua_validator', '$libdir/pllua', NULL);

-- INSERT INTO pg_catalog.pg_pltemplate
--        (tmplname, tmpltrusted, tmpldbacreate, tmplhandler, tmplinline, tmplvalidator, tmpllibrary, tmplacl)
--       VALUES ('plluau', FALSE, FALSE, 'plluau_call_handler', NULL, 'plluau_validator', '$libdir/pllua', NULL);

-- vim: set syn=sql:
