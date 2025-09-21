Return-Path: <linux-arm-msm+bounces-74366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4468B8DEC5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 18:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9E1E1899CDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 16:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D2C212F89;
	Sun, 21 Sep 2025 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OpmM+Rzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4614221FCC;
	Sun, 21 Sep 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758470897; cv=none; b=YuY38Jn/LdZeb28kSfgIjam2vJkiDp+uhyEexkO1LhrMWPckwtXZaqnMQDqakmHM4o289WFtW/BpMX47CTmWUps0wxxIh1lcsXz+DkRwuU84jxkcyinWhPz5ldjUBcNsYGp3yn4PkjdYtdM3MrLLBJuLBDrydzk5t0faYo+k4og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758470897; c=relaxed/simple;
	bh=lqBsV5rJ4GRAORc2LO7yZTV1GDYB/mpDfZ4pxfnEzxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5Ds5WIk7wJjClm/kqbGGxsUm9rEXP4VOGGs1umHGKU8wmqw4icHhrf7oi8howynYOsg3XdypwpVqxLbIjhTlhbnYGDlUtlk3YQaOUpkQg4rHRo0k4XCs6tz376TXzyFFFnjHBGVY/xHn/L2w5UTLZC5R13q6Q/B+zKcTeNEyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OpmM+Rzi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2A3F1A0EF0;
	Sun, 21 Sep 2025 16:08:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8728A60634;
	Sun, 21 Sep 2025 16:08:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FACC102F17CA;
	Sun, 21 Sep 2025 18:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758470893; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=f0D4AopAvKtHgjLNU0PptCAlLmN/VeNzlHrW4MNKC6w=;
	b=OpmM+Rzigd42eYRhNOtD8+GQemjKwF8tfz+fK+mrrbCYt3PsK4u4BU1sdsulNxjOLn0Xpb
	24nZLNo5nuWMJRpknugHOPff7ddBqmvuzXgpTUQ+X60Km2PQXBNUX/Zzvmt/zMU8p7LuUx
	Y4BiwkA7rcGMld56Nj1L/84XbMbiTTOdGUR/hhYmNjCwzcCYUluVVjq5z92WrA+X4/0Hxn
	ATWps+t4KakRiRED4nm8f8/GNU/3LFU/ojC+wocnfQY/BihO2oEBPT2d8CtWXAV2TCPDBM
	GbnQDHQg6fdlAK4shkOCg9ihscrwry+3QTLG10I3A8Tysgw9tMMIy9y8dABo6A==
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
Subject: [PATCH net-next v13 15/18] net: phy: qca807x: Support SFP through phy_port interface
Date: Sun, 21 Sep 2025 21:34:13 +0530
Message-ID: <20250921160419.333427-16-maxime.chevallier@bootlin.com>
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

QCA8072/8075 may be used as combo-port PHYs, with Serdes (100/1000BaseX)
 and Copper interfaces. The PHY has the ability to read the configuration
it's in.  If the configuration indicates the PHY is in combo mode, allow
registering up to 2 ports.

Register a dedicated set of port ops to handle the serdes port, and rely
on generic phylib SFP support for the SFP handling.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/qcom/qca807x.c | 73 ++++++++++++++--------------------
 1 file changed, 30 insertions(+), 43 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 070dc8c00835..d8f1ce5a7128 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -13,7 +13,7 @@
 #include <linux/phy.h>
 #include <linux/bitfield.h>
 #include <linux/gpio/driver.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 
 #include "../phylib.h"
 #include "qcom.h"
@@ -643,68 +643,54 @@ static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 	return ret;
 }
 
-static int qca807x_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int qca807x_configure_serdes(struct phy_port *port, bool enable,
+				    phy_interface_t interface)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
-	phy_interface_t iface;
+	struct phy_device *phydev = port_phydev(port);
 	int ret;
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
 
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
+	if (!phydev)
+		return -ENODEV;
 
-	dev_info(&phydev->mdio.dev, "%s SFP module inserted\n", phy_modes(iface));
-
-	switch (iface) {
-	case PHY_INTERFACE_MODE_1000BASEX:
-	case PHY_INTERFACE_MODE_100BASEX:
+	if (enable) {
 		/* Set PHY mode to PSGMII combo (1/4 copper + combo ports) mode */
 		ret = phy_modify(phydev,
 				 QCA807X_CHIP_CONFIGURATION,
 				 QCA807X_CHIP_CONFIGURATION_MODE_CFG_MASK,
 				 QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_FIBER);
+		if (ret)
+			return ret;
 		/* Enable fiber mode autodection (1000Base-X or 100Base-FX) */
 		ret = phy_set_bits_mmd(phydev,
 				       MDIO_MMD_AN,
 				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION,
 				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION_EN);
-		/* Select fiber page */
-		ret = phy_clear_bits(phydev,
-				     QCA807X_CHIP_CONFIGURATION,
-				     QCA807X_BT_BX_REG_SEL);
-
-		phydev->port = PORT_FIBRE;
-		break;
-	default:
-		dev_err(&phydev->mdio.dev, "Incompatible SFP module inserted\n");
-		return -EINVAL;
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	phydev->port = enable ? PORT_FIBRE : PORT_TP;
+
+	return phy_modify(phydev, QCA807X_CHIP_CONFIGURATION,
+			  QCA807X_BT_BX_REG_SEL,
+			  enable ? 0 : QCA807X_BT_BX_REG_SEL);
 }
 
-static void qca807x_sfp_remove(void *upstream)
+static const struct phy_port_ops qca807x_serdes_port_ops = {
+	.configure_mii = qca807x_configure_serdes,
+};
+
+static int qca807x_attach_mii_port(struct phy_device *phydev,
+				   struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
 
-	/* Select copper page */
-	phy_set_bits(phydev,
-		     QCA807X_CHIP_CONFIGURATION,
-		     QCA807X_BT_BX_REG_SEL);
+	port->ops = &qca807x_serdes_port_ops;
 
-	phydev->port = PORT_TP;
+	return 0;
 }
 
-static const struct sfp_upstream_ops qca807x_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.module_insert = qca807x_sfp_insert,
-	.module_remove = qca807x_sfp_remove,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-};
-
 static int qca807x_probe(struct phy_device *phydev)
 {
 	struct device_node *node = phydev->mdio.dev.of_node;
@@ -745,9 +731,8 @@ static int qca807x_probe(struct phy_device *phydev)
 
 	/* Attach SFP bus on combo port*/
 	if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
-		ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
-		if (ret)
-			return ret;
+		phydev->max_n_ports = 2;
+
 		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported);
 		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->advertising);
 	}
@@ -825,6 +810,7 @@ static struct phy_driver qca807x_drivers[] = {
 		.get_phy_stats		= qca807x_get_phy_stats,
 		.set_wol		= at8031_set_wol,
 		.get_wol		= at803x_get_wol,
+		.attach_mii_port	= qca807x_attach_mii_port,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -852,6 +838,7 @@ static struct phy_driver qca807x_drivers[] = {
 		.get_phy_stats		= qca807x_get_phy_stats,
 		.set_wol		= at8031_set_wol,
 		.get_wol		= at803x_get_wol,
+		.attach_mii_port	= qca807x_attach_mii_port,
 	},
 };
 module_phy_driver(qca807x_drivers);
-- 
2.49.0


