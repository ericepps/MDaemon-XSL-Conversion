<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="Tasklist">
****************************************************************
*                         TASK LIST                            *
****************************************************************
<xsl:apply-templates select="Task"/>
</xsl:template>
<xsl:template match="Task">

----------------------------------------------------------------
*TASK #<xsl:value-of select="@ID"/>
*SUBJECT: <xsl:if test="Subject"><xsl:value-of select="Subject"/>
</xsl:if>
<xsl:if test="@Priority">
*PRIORITY: <xsl:value-of select="@Priority"/>
</xsl:if>
<xsl:if test="DueDate">
*DUE: <xsl:value-of select="DueDate"/>
</xsl:if>
<xsl:if test="Comment">
*COMMENTS: 
---
<xsl:value-of select="Comment"/>
---
</xsl:if>
<xsl:if test="Creator">
*CREATED BY: <xsl:value-of select="Creator"/>
</xsl:if>
<xsl:if test="Modified">
*LAST-MODIFIED:<xsl:value-of select="Modified"/>
</xsl:if>
----------------------------------------------------------------

</xsl:template>
</xsl:stylesheet>