<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--}%
		%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%
        <r:require modules="bootstrap"/>
    <style type="text/css">
        /*将页脚压低*/

    #wrap{
        min-height: 100%;
        height: auto !important;
        height: 100%;

        margin: 0 auto -60px;
    }

    #row{
        padding-top: 60px;
    }

    @media(max-width: 767px){
        #row{
            padding-top: 0px;
        }
    }

    #push{
        padding-top: 40px;
    }


    </style>
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
    <nav class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="brand" href="${createLink(uri: '/')}">
                    Grails Twitter Bootstrap</a>
                <div class="nav-collapse">
                    <p class="navbar-text pull-right">Logoed in as<a href="#"
                        class="navbar-link">Username</a> </p>
                    <ul class="nav">
                        <li <%= request.forwardURI == "${createLink(uri: "/")}" ? 'class="active' : '' %> >
                        <a href="${createLink(uri: '/')}">Home</a>
                        </li>
                        
                        <g:each var="c" in="${grailsApplication.controllerClasses.sort{it.fullName} }">
                            <li class="controller">
                                <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                            </li>


                        </g:each>

                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div id="push"></div>

    <div id="wrap" class="container-fluid">
        <div id="row" class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <ul class="nav nav-list">
                        <li class="nav-header">Application Status</li>
                        <li>App version: <g:meta name="app.version"/></li>
                        <li>Grails version:<g:meta name="app.grails.version"/></li>
                        <li>Groovy version:${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version:${java.lang.System.getProperty("java.version")}</li>
                        <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>

                    <ul class="nav nav-list">
                        <li class="nav-header">Plugins List</li>
                        <g:each in="${applicationContext.getBean("pluginManager").allPlugins}" var="plugin">
                             <li>${plugin.name} - ${plugin.version}</li>

                        </g:each>
                    </ul>
                </div>
            </div>
            <div class="span9">
                <g:layoutBody/>
            </div>
        </div>
    </div>

    <hr/>

    <div id="footer">
        <div class="container-fluid">
            <p>&copy; Company  2013</p>
        </div>
    </div>



		%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>--}%
		%{--<g:layoutBody/>--}%
		%{--<div class="footer" role="contentinfo"></div>--}%
		%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>