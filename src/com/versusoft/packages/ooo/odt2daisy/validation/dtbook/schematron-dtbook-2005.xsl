<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!-- precompiled schematron -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch="http://www.ascc.net/xml/schematron"
                xmlns:dtbk="http://www.daisy.org/z3986/2005/dtbook/"
                version="1.0"
                dtbk:dummy-for-xmlns="">
   <xsl:output method="text"/>
   <xsl:template match="*|@*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:if test="count(. | ../@*) = count(../@*)">@</xsl:if>
      <xsl:value-of select="name()"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+count(preceding-sibling::*[name()=name(current())])"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:key match="dtbk:note[@id]" name="notes" use="@id"/>
   <xsl:key match="dtbk:annotation[@id]" name="annotations" use="@id"/>
   <xsl:template match="/">
      <xsl:apply-templates select="/" mode="M3"/>
      <xsl:apply-templates select="/" mode="M4"/>
      <xsl:apply-templates select="/" mode="M5"/>
      <xsl:apply-templates select="/" mode="M6"/>
      <xsl:apply-templates select="/" mode="M7"/>
      <xsl:apply-templates select="/" mode="M8"/>
      <xsl:apply-templates select="/" mode="M9"/>
      <xsl:apply-templates select="/" mode="M10"/>
      <xsl:apply-templates select="/" mode="M11"/>
      <xsl:apply-templates select="/" mode="M12"/>
      <xsl:apply-templates select="/" mode="M13"/>
      <xsl:apply-templates select="/" mode="M14"/>
      <xsl:apply-templates select="/" mode="M15"/>
      <xsl:apply-templates select="/" mode="M16"/>
      <xsl:apply-templates select="/" mode="M17"/>
      <xsl:apply-templates select="/" mode="M18"/>
   </xsl:template>
   <xsl:template match="dtbk:head" priority="4000" mode="M3">
      <xsl:choose>
         <xsl:when test="count(dtbk:meta[@name='dtb:uid'])=1"/>
         <xsl:otherwise>In pattern count(dtbk:meta[@name='dtb:uid'])=1:
   dtb:uid metadata does not exist
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M3"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M3"/>
   <xsl:template match="dtbk:head" priority="4000" mode="M4">
      <xsl:choose>
         <xsl:when test="count(dtbk:meta[@name='dc:Title'])=1"/>
         <xsl:otherwise>In pattern count(dtbk:meta[@name='dc:Title'])=1:
   dc:Title metadata does not exist
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M4"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M4"/>
   <xsl:template match="dtbk:noteref" priority="4000" mode="M5">
      <xsl:choose>
         <xsl:when test="contains(@idref, '#')"/>
         <xsl:otherwise>In pattern contains(@idref, '#'):
   noteref URI value does not contain a fragment identifier
</xsl:otherwise>
      </xsl:choose>
      <xsl:if test="contains(@idref, '#') and string-length(substring-before(@idref, '#'))=0 and count(key('notes',substring(current()/@idref,2)))!=1">In pattern contains(@idref, '#') and string-length(substring-before(@idref, '#'))=0 and count(key('notes',substring(current()/@idref,2)))!=1:
   noteref URI value does not resolve to a note element
</xsl:if>
      <xsl:apply-templates mode="M5"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M5"/>
   <xsl:template match="dtbk:annoref" priority="4000" mode="M6">
      <xsl:choose>
         <xsl:when test="contains(@idref, '#')"/>
         <xsl:otherwise>In pattern contains(@idref, '#'):
   annoref URI value does not contain a fragment identifier
</xsl:otherwise>
      </xsl:choose>
      <xsl:if test="contains(@idref, '#') and string-length(substring-before(@idref, '#'))=0 and count(key('annotations',substring(current()/@idref,2)))!=1">In pattern contains(@idref, '#') and string-length(substring-before(@idref, '#'))=0 and count(key('annotations',substring(current()/@idref,2)))!=1:
   annoref URI value does not resolve to a annotation element
</xsl:if>
      <xsl:apply-templates mode="M6"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M6"/>
   <xsl:template match="dtbk:a[starts-with(@href, '#')]" priority="4000" mode="M7">
      <xsl:choose>
         <xsl:when test="count(//dtbk:*[@id=substring(current()/@href, 2)])=1"/>
         <xsl:otherwise>In pattern count(//dtbk:*[@id=substring(current()/@href, 2)])=1:
   internal link does not resolve
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M7"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M7"/>
   <xsl:template match="dtbk:list" priority="4000" mode="M8">
      <xsl:if test="@enum and @type!='ol'">In pattern @enum and @type!='ol':
   The enum attribute is only allowed in numbered lists
</xsl:if>
      <xsl:apply-templates mode="M8"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M8"/>
   <xsl:template match="dtbk:list" priority="4000" mode="M9">
      <xsl:if test="@depth and @depth!=count(ancestor-or-self::dtbk:list)">In pattern @depth and @depth!=count(ancestor-or-self::dtbk:list):
   The depth attribute on list element does not contain the list wrapping level
</xsl:if>
      <xsl:apply-templates mode="M9"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M9"/>
   <xsl:template match="dtbk:meta" priority="4000" mode="M10">
      <xsl:if test="starts-with(@name, 'dc:') and not(@name='dc:Title' or @name='dc:Subject' or @name='dc:Description' or                                                          @name='dc:Type' or @name='dc:Source' or @name='dc:Relation' or                                                           @name='dc:Coverage' or @name='dc:Creator' or @name='dc:Publisher' or                                                           @name='dc:Contributor' or @name='dc:Rights' or @name='dc:Date' or                                                           @name='dc:Format' or @name='dc:Identifier' or @name='dc:Language')">In pattern starts-with(@name, 'dc:') and not(@name='dc:Title' or @name='dc:Subject' or @name='dc:Description' or @name='dc:Type' or @name='dc:Source' or @name='dc:Relation' or @name='dc:Coverage' or @name='dc:Creator' or @name='dc:Publisher' or @name='dc:Contributor' or @name='dc:Rights' or @name='dc:Date' or @name='dc:Format' or @name='dc:Identifier' or @name='dc:Language'):
   Incorrect Dublin Core metadata name
</xsl:if>
      <xsl:if test="starts-with(@name, 'DC:') or starts-with(@name, 'Dc:') or starts-with(@name, 'dC:')">In pattern starts-with(@name, 'DC:') or starts-with(@name, 'Dc:') or starts-with(@name, 'dC:'):
   Incorrect Dublin Core metadata prefix
</xsl:if>
      <xsl:apply-templates mode="M10"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M10"/>
   <xsl:template match="dtbk:level[@depth]" priority="4000" mode="M11">
      <xsl:choose>
         <xsl:when test="@depth=count(ancestor-or-self::dtbk:level)"/>
         <xsl:otherwise>In pattern @depth=count(ancestor-or-self::dtbk:level):
   The value of the depth attribute on the level element does not correspond to actual nesting level
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M11"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M11"/>
   <xsl:template match="dtbk:list" priority="4000" mode="M12">
      <xsl:if test="@start and @type!='ol'">In pattern @start and @type!='ol':
   A start attribute occurs in a non-numbered list
</xsl:if>
      <xsl:if test="@start='' or string-length(translate(@start,'0123456789',''))!=0">In pattern @start='' or string-length(translate(@start,'0123456789',''))!=0:
   The list start attribute is not a non negative number
</xsl:if>
      <xsl:apply-templates mode="M12"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M12"/>
   <xsl:template match="dtbk:*[@headers and (self::dtbk:th or self::dtbk:td)]" priority="4000"
                 mode="M13">
      <xsl:choose>
         <xsl:when test="     count(      ancestor::dtbk:table//dtbk:th/@id[contains( concat(' ',current()/@headers,' '), concat(' ',normalize-space(),' ') )]     ) =      string-length(normalize-space(@headers)) - string-length(translate(normalize-space(@headers), ' ','')) + 1    "/>
         <xsl:otherwise>In pattern count( ancestor::dtbk:table//dtbk:th/@id[contains( concat(' ',current()/@headers,' '), concat(' ',normalize-space(),' ') )] ) = string-length(normalize-space(@headers)) - string-length(translate(normalize-space(@headers), ' ','')) + 1:
   Not all the tokens in the headers attribute match the id attributes of 'th' elements in this or a parent table
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M13"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="dtbk:prodnote[@imgref]" priority="4000" mode="M14">
      <xsl:choose>
         <xsl:when test="     count(      //dtbk:img/@id[contains( concat(' ',current()/@imgref,' '), concat(' ',normalize-space(),' ') )]     ) =      string-length(normalize-space(@imgref)) - string-length(translate(normalize-space(@imgref), ' ','')) + 1    "/>
         <xsl:otherwise>In pattern count( //dtbk:img/@id[contains( concat(' ',current()/@imgref,' '), concat(' ',normalize-space(),' ') )] ) = string-length(normalize-space(@imgref)) - string-length(translate(normalize-space(@imgref), ' ','')) + 1:
   Not all the tokens in the imgref attribute match the id attributes of 'img' elements
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M14"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M14"/>
   <xsl:template match="dtbk:caption[@imgref]" priority="4000" mode="M15">
      <xsl:choose>
         <xsl:when test="     count(      //dtbk:img/@id[contains( concat(' ',current()/@imgref,' '), concat(' ',normalize-space(),' ') )]     ) =      string-length(normalize-space(@imgref)) - string-length(translate(normalize-space(@imgref), ' ','')) + 1    "/>
         <xsl:otherwise>In pattern count( //dtbk:img/@id[contains( concat(' ',current()/@imgref,' '), concat(' ',normalize-space(),' ') )] ) = string-length(normalize-space(@imgref)) - string-length(translate(normalize-space(@imgref), ' ','')) + 1:
   Not all the tokens in the imgref attribute match the id attributes of 'img' elements
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M15"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M15"/>
   <xsl:template match="dtbk:img" priority="4000" mode="M16">
      <xsl:choose>
         <xsl:when test="not(@width) or                         string-length(translate(@width,'0123456789',''))=0 or                        (contains(@width,'%') and substring-after(@width,'%')='' and translate(@width,'%0123456789','')='' and string-length(@width)&gt;=2)"/>
         <xsl:otherwise>In pattern not(@width) or string-length(translate(@width,'0123456789',''))=0 or (contains(@width,'%') and substring-after(@width,'%')='' and translate(@width,'%0123456789','')='' and string-length(@width)&gt;=2):
   The image width is not expressed in integer pixels or percentage
</xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
         <xsl:when test="not(@height) or                         string-length(translate(@height,'0123456789',''))=0 or                        (contains(@height,'%') and substring-after(@height,'%')='' and translate(@height,'%0123456789','')='' and string-length(@height)&gt;=2)"/>
         <xsl:otherwise>In pattern not(@height) or string-length(translate(@height,'0123456789',''))=0 or (contains(@height,'%') and substring-after(@height,'%')='' and translate(@height,'%0123456789','')='' and string-length(@height)&gt;=2):
   The image height is not expressed in integer pixels or percentage
</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates mode="M16"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M16"/>
   <xsl:template match="dtbk:*[self::dtbk:col or self::dtbk:colgroup]" priority="4000"
                 mode="M17">
      <xsl:if test="@span and (translate(@span,'0123456789','')!='' or starts-with(@span,'0'))">In pattern @span and (translate(@span,'0123456789','')!='' or starts-with(@span,'0')):
   column span attribute is not a positive integer
</xsl:if>
      <xsl:apply-templates mode="M17"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M17"/>
   <xsl:template match="dtbk:*[self::dtbk:td or self::dtbk:th]" priority="4000" mode="M18">
      <xsl:if test="@rowspan and (translate(@rowspan,'0123456789','')!='' or starts-with(@rowspan,'0'))">In pattern @rowspan and (translate(@rowspan,'0123456789','')!='' or starts-with(@rowspan,'0')):
   The rowspan attribute value is not a positive integer
</xsl:if>
      <xsl:if test="@colspan and (translate(@colspan,'0123456789','')!='' or starts-with(@colspan,'0'))">In pattern @colspan and (translate(@colspan,'0123456789','')!='' or starts-with(@colspan,'0')):
   The colspan attribute value is not a positive integer
</xsl:if>
      <xsl:if test="@rowspan and number(@rowspan) &gt; count(parent::dtbk:tr/following-sibling::dtbk:tr)+1">In pattern @rowspan and number(@rowspan) &gt; count(parent::dtbk:tr/following-sibling::dtbk:tr)+1:
   The rowspan attribute value is larger than the number of rows left in the table
</xsl:if>
      <xsl:apply-templates mode="M18"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M18"/>
   <xsl:template match="text()" priority="-1"/>
</xsl:stylesheet>