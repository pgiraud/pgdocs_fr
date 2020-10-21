<?xml version="1.0" encoding="iso8859-15"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0" xmlns:ng="http://docbook.org/docbook-ng" xmlns:db="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="exsl cf ng db">

  <xsl:template name="chunk-element-content">
    <xsl:param name="prev"/>
    <xsl:param name="next"/>
    <xsl:param name="nav.context"/>
    <xsl:param name="content">
      <xsl:apply-imports/>
    </xsl:param>

    <xsl:call-template name="user.preroot"/>

<html>
  <xsl:call-template name="html.head">
    <xsl:with-param name="prev" select="$prev"/>
    <xsl:with-param name="next" select="$next"/>
  </xsl:call-template>

  <body>
    <xsl:call-template name="body.attributes"/>
	<xsl:if test="$website.stylesheet = 1">
    <div id="top">
      <div id="pgHeader">
        <span id="pgHeaderLogoLeft">
          <a href="/" title="PostgreSQL">
		  <img src="http://docs.postgresql.fr/theme/img/hdr_left.png"
		       width="230"
			   height="80"
			   alt="PostgreSQL" />
		  </a>
        </span>
        <span id="pgHeaderLogoRight">
          <a href="/" title="La base de donn�es la plus sophistiqu�e au monde.">
		  <img src="http://docs.postgresql.fr/theme/img/hdr_right.png"
		       width="210"
			   height="80"
			   alt="La base de donn�es la plus sophistiqu�e au monde." />
		  </a>
        </span>
      </div>
    </div>
    <div class="pgTopNav">
      <div class="pgTopNavLeft"> 
        <img src="http://docs.postgresql.fr/theme/img/nav_lft.png" width="7" height="23" alt="" />
      </div>
      <div class="pgTopNavRight">
        <img src="http://docs.postgresql.fr/theme/img/nav_rgt.png" width="7" height="23" alt="" />
      </div>
      <ul class="pgTopNavList">
        <li>
		  <a href="http://www.postgresql.fr/" title="Accueil">Accueil</a>
		</li>
        <li>
		  <a href="http://blog.postgresql.fr/" title="Lire les actualit�s">Actualit�s</a>
		</li>
        <li>
		  <a href="http://docs.postgresql.fr/" title="Lire la documentation officielle">Documentation</a>
		</li>
        <li>
		  <a href="http://forums.postgresql.fr/" title="Pour poser des questions">Forums</a>
		</li>
        <li>
		  <a href="http://asso.postgresql.fr/" title="La vie de l'association">Association</a>
		</li>
        <li>
		  <a href="http://www.postgresql.fr/devel:accueil"
		     title="Informations pour les d�veloppeurs/traducteurs">D�veloppeurs</a>
		</li>
        <li>
		  <a href="http://planete.postgresql.fr" title="La plan�te francophone sur PostgreSQL">Plan�te</a>
		</li>
        <li>
		  <a href="http://support.postgresql.fr" title="Support sur PostgreSQL">Support</a>
		</li>
      </ul>
    </div>
	</xsl:if>
    <div class="pgContent">
	  <xsl:call-template name="breadcrumbs"/>
      <xsl:call-template name="footer.navigation">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
        <xsl:with-param name="nav.context" select="$nav.context"/>
      </xsl:call-template>
      <xsl:copy-of select="$content"/>
    </div>
  </body>
</html>
    <xsl:value-of select="$chunk.append"/>
  </xsl:template>

  <xsl:template name="breadcrumbs">
    <xsl:param name="this.node" select="."/>
    <xsl:for-each select="$this.node/ancestor::*">
      <span class="breadcrumb-link">
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="."/>
              <xsl:with-param name="context" select="$this.node"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:apply-templates select="." mode="title.markup"/>
        </a>
      </span>
      <xsl:text> � </xsl:text>
    </xsl:for-each>
    <!-- And display the current node, but not as a link -->
    <span class="breadcrumb-node">
      <xsl:apply-templates select="$this.node" mode="title.markup"/>
    </span>
  </xsl:template>

</xsl:stylesheet>
