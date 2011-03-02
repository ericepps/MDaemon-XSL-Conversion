<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="Tasklist">
BEGIN:VCALENDAR
VERSION:2.0
<xsl:apply-templates select="Task"/>
END:VCALENDAR
</xsl:template>
<xsl:template match="Task">
BEGIN:VTODO
UID:<xsl:value-of select="@ID"/><xsl:value-of select="Creator"/>
<xsl:if test="DueDate">
DUE:<xsl:value-of select="substring-before(substring-before(DueDate,' '),'-')"/><xsl:value-of select="substring-before(substring-after(substring-before(DueDate,' '),'-'),'-')"/><xsl:value-of select="substring-after(substring-after(substring-before(DueDate,' '),'-'),'-')"/>T<xsl:value-of select="substring-before(substring-after(DueDate,' '),':')"/><xsl:value-of select="substring-after(substring-after(DueDate,' '),':')"/>00
</xsl:if>
<xsl:if test="Modified">
LAST-MODIFIED:<xsl:value-of select="substring-before(substring-before(Modified,' '),'-')"/><xsl:value-of select="substring-before(substring-after(substring-before(Modified,' '),'-'),'-')"/><xsl:value-of select="substring-after(substring-after(substring-before(Modified,' '),'-'),'-')"/>T<xsl:value-of select="substring-before(substring-after(Modified,' '),':')"/><xsl:value-of select="substring-before(substring-after(substring-after(Modified,' '),':'),':')"/><xsl:value-of select="substring-after(substring-after(substring-after(Modified,' '),':'),':')"/>Z
</xsl:if>
<xsl:if test="Creator">
ORGANIZER:MAILTO:<xsl:value-of select="Creator"/>
</xsl:if>
<xsl:if test="Subject">
SUMMARY:<xsl:value-of select="Subject"/>
</xsl:if>
<xsl:if test="@Priority">
PRIORITY:<xsl:value-of select="@Priority"/>
</xsl:if>
<xsl:if test="Comment">
DESCRIPTION:<xsl:value-of select="Comment"/>
</xsl:if>
END:VTODO
</xsl:template>
</xsl:stylesheet>