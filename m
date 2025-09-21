Return-Path: <linux-arm-msm+bounces-74365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA86B8DEBC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 18:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3507D189CFE1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B105239E9A;
	Sun, 21 Sep 2025 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pgl9mZ0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB6E239E65;
	Sun, 21 Sep 2025 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758470886; cv=none; b=OP10bjsksdzoBGD4hJ8sMLYajQ6zijIglAOGDETCg9XPhJWK0b2s/1x8u7X/NKdIpL/t298LHu/wjK9nibtulve2g983ryIPIWt+Tn0JX8WP+FYCz9x2D86qyc1nL7FmI0YANUSwFQca0EnvSacMSsY85CA977YGiSApbNMMTVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758470886; c=relaxed/simple;
	bh=VJBwv5bPnD+4GOFcxAfuJQwUYKZj2Lyi2f3d34ud0/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFOHQ9WYhA2FwBHFDu+my0LP11GEFz2fhzFb2GawB/2Gxi/Ut/VdXdGXATx3gEEf8P7l5DIqSbc2B/WvLyh+2+zbEVrjT7TftGMtEy2/fWDchg9KGbP9k7JDtrmYacmQxCfOCdBt3MZ8L0dTrPCyNFF0t/LwqU4CpFAy0UfCH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pgl9mZ0/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D7CDB1A0EF0;
	Sun, 21 Sep 2025 16:08:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC0EF60634;
	Sun, 21 Sep 2025 16:08:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C8C8102F17CC;
	Sun, 21 Sep 2025 18:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758470881; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JuZsow16o1dUyAuol0ggf5iVn8iEIexeIUZyM3czgm8=;
	b=pgl9mZ0/Fj8/CqLXW0p/V/PiAY8hohnUYZker2adrZuTPzpCVG44UOyEIxcOADUox7Mfog
	HuCPTGZYNLzmBpFHh+P/Wvn9BUw97i4oEs4FTxcmUl1EkEcfyM/r+iGa0u9EmJyGmethWl
	0p8Ki9So63SpPHXg11jU6kEIsW/pt5kgEhAAhGyBa1wqSLPc2D39Yvi5p0qHlLngpHwPgt
	nlXiNrGsPEpa+1cZ7Fw5v3RfIAG7e+zdYLC3m+XYwUFHIzg7Ji81qT4zxqTK0+HutNuOEL
	eFscC51m/xMitaNLPlXmu7tJc7+TJOO0fnpjYjIawRzTfm5z1T8E//UTnOde5w==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v13 14/18] net: phy: at803x: Support SFP through phy_port interface
Date: Sun, 21 Sep 2025 21:34:12 +0530
Message-ID: <20250921160419.333427-15-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
References: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Convert the at803x driver to use the generic phylib SFP handling, via a
dedicated .attach_port() callback, populating the supported interfaces.

As these devices are limited to 1000BaseX, a workaround is used to also
support, in a very limited way, copper modules. This is done by
supporting SGMII but limiting it to 1G full duplex (in which case it's
somewhat compatible with 1000BaseX).

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/qcom/at803x.c | 78 ++++++++++++++---------------------
 1 file changed, 32 insertions(+), 46 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 51a132242462..2995b08bac96 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -20,7 +20,7 @@
 #include <linux/of.h>
 #include <linux/phylink.h>
 #include <linux/reset.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 #include <dt-bindings/net/qca-ar803x.h>
 
 #include "qcom.h"
@@ -769,58 +769,44 @@ static int at8031_register_regulators(struct phy_device *phydev)
 	return 0;
 }
 
-static int at8031_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int at803x_configure_mii(struct phy_port *port, bool enable,
+				phy_interface_t interface)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_support);
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	phy_interface_t iface;
-
-	linkmode_zero(phy_support);
-	phylink_set(phy_support, 1000baseX_Full);
-	phylink_set(phy_support, 1000baseT_Full);
-	phylink_set(phy_support, Autoneg);
-	phylink_set(phy_support, Pause);
-	phylink_set(phy_support, Asym_Pause);
-
-	linkmode_zero(sfp_support);
-	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
-	/* Some modules support 10G modes as well as others we support.
-	 * Mask out non-supported modes so the correct interface is picked.
-	 */
-	linkmode_and(sfp_support, phy_support, sfp_support);
+	struct phy_device *phydev = port_phydev(port);
 
-	if (linkmode_empty(sfp_support)) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
-	}
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		dev_warn(&phydev->mdio.dev,
+			 "module may not function if 1000Base-X not supported\n");
+
+	return 0;
+}
 
-	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
+static const struct phy_port_ops at803x_port_ops = {
+	.configure_mii = at803x_configure_mii,
+};
 
-	/* Only 1000Base-X is supported by AR8031/8033 as the downstream SerDes
-	 * interface for use with SFP modules.
-	 * However, some copper modules detected as having a preferred SGMII
-	 * interface do default to and function in 1000Base-X mode, so just
-	 * print a warning and allow such modules, as they may have some chance
-	 * of working.
+static int at8031_attach_mii_port(struct phy_device *phydev,
+				  struct phy_port *port)
+{
+	linkmode_zero(port->supported);
+	phylink_set(port->supported, 1000baseX_Full);
+	phylink_set(port->supported, 1000baseT_Full);
+	phylink_set(port->supported, Autoneg);
+	phylink_set(port->supported, Pause);
+	phylink_set(port->supported, Asym_Pause);
+
+	/* This device doesn't really support SGMII. However, do our best
+	 * to be compatible with copper modules (that usually require SGMII),
+	 * in a degraded mode as we only allow 1000BaseT Full
 	 */
-	if (iface == PHY_INTERFACE_MODE_SGMII)
-		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");
-	else if (iface != PHY_INTERFACE_MODE_1000BASEX)
-		return -EINVAL;
+	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+
+	port->ops = &at803x_port_ops;
 
 	return 0;
 }
 
-static const struct sfp_upstream_ops at8031_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.module_insert = at8031_sfp_insert,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-};
-
 static int at8031_parse_dt(struct phy_device *phydev)
 {
 	struct device_node *node = phydev->mdio.dev.of_node;
@@ -841,8 +827,7 @@ static int at8031_parse_dt(struct phy_device *phydev)
 		return ret;
 	}
 
-	/* Only AR8031/8033 support 1000Base-X for SFP modules */
-	return phy_sfp_probe(phydev, &at8031_sfp_ops);
+	return 0;
 }
 
 static int at8031_probe(struct phy_device *phydev)
@@ -1173,6 +1158,7 @@ static struct phy_driver at803x_driver[] = {
 	.set_tunable		= at803x_set_tunable,
 	.cable_test_start	= at8031_cable_test_start,
 	.cable_test_get_status	= at8031_cable_test_get_status,
+	.attach_mii_port	= at8031_attach_mii_port,
 }, {
 	/* Qualcomm Atheros AR8032 */
 	PHY_ID_MATCH_EXACT(ATH8032_PHY_ID),
-- 
2.49.0


