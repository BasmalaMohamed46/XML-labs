<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    exclude-result-prefixes="array fn map math xhtml xs err"
    version="3.0">
    <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Employees Data</title>
            </head>
            <body>
                <h2>Employees Data</h2>
                <table border="1">
                    <tr bgcolor="#F9EDFC">
                        <th>Name</th>
                        <th>Home Phone</th>
                        <th>Work Phone</th>
                        <th>Mobile Phone</th>
                        <th>Email</th>
                        <th colspan="5">Address</th>
                    </tr>
                    <xsl:for-each select="employees/employee">
                        <xsl:variable name="employee" select="." />
                        <xsl:variable name="addressCount" select="count(addresses/address)" />
                        <xsl:for-each select="addresses/address">
                            <tr>
                                <xsl:if test="position() = 1">
                                    <td rowspan="{$addressCount}">
                                        <xsl:value-of select="$employee/name" />
                                    </td>
                                    <td rowspan="{$addressCount}">
                                        <xsl:value-of select="$employee/phones/phone[@Type = 'home']" />
                                    </td>
                                    <td rowspan="{$addressCount}">
                                        <xsl:value-of select="$employee/phones/phone[@Type = 'work']" />
                                    </td>
                                    <td rowspan="{$addressCount}">
                                        <xsl:value-of select="$employee/phones/phone[@Type = 'mobile']" />
                                    </td>
                                    <td rowspan="{$addressCount}">
                                        <xsl:value-of select="$employee/email" />
                                    </td>
                                </xsl:if>
                                <td>
                                    <xsl:value-of select="Street" />
                                </td>
                                <td>
                                    <xsl:value-of select="BuildingNumber" />
                                </td>
                                <td>
                                    <xsl:value-of select="Region" />
                                </td>
                                <td>
                                    <xsl:value-of select="City" />
                                </td>
                                <td>
                                    <xsl:value-of select="Country" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
