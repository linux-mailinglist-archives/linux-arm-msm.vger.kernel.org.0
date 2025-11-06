Return-Path: <linux-arm-msm+bounces-80560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C52FC39F06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 10:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10DB74FE47B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 09:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88587313281;
	Thu,  6 Nov 2025 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D5BjeyX6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B2313269;
	Thu,  6 Nov 2025 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422524; cv=none; b=H3jKN+FJDDfS0gG4yi+RH3Ybh1wrWY2hT3BfOdlaF9HSHNy0I7AXcKLhzV25hq+in7/U6oXTddQyHOg0zYFrn2QhK4QFN/2nMBqCKd3RDPSm2COEbUFrQqnsUy9g7Wk37T8iXSmpaYd+7pp1wtSU3XoI8TgYEc4K1qnxNzYW/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422524; c=relaxed/simple;
	bh=q/6I0Dwjis9C5lIve/0mlp1GR6WUcfVC0/+gkXvxB/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=noLaaird5yKMW3QEGkYXNJPwDI/JI4VemI60GzqjyOoP9JSYVa5u7+eq9U8t3dnnoSKL5Fs0d2V8eLYHR9MHzcdGOllalFjQIM8xQpX+Fd7Xyo1/Hyc681nsckfOEblqv9uNdy4fM89Y9m9ZILnrI96HygIyEitiAa7CxDfHHDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D5BjeyX6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55760C0FA83;
	Thu,  6 Nov 2025 09:48:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60F8F6068C;
	Thu,  6 Nov 2025 09:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A19811850816;
	Thu,  6 Nov 2025 10:48:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422520; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MZDAHrbs/RCStqwk9HB+2IcviAluZ9XY97XUFqypRI8=;
	b=D5BjeyX6VUvLvLCF7ZVrDmPTHTPXFIR7WHPLcpwqp4ZC27Dp7oY5SGmO6M1KjleipqDciQ
	3STFPZnq9PABJZtkvwx/buZ0b9eZ5ATHF+og5edSlluZwIlxDcCdqE7Yf6vaTAlUF7hxgk
	G+XRXynRUYebYHcurhL3O2Bu/ZOhzoFKhGcCA8IOzJsyoX35Xuya7FoUuBcJ16DI0rijxT
	ZOhjQ6qtMVfKjr/4BPOATqlXrYfemiHa4nZn4vPBxSuc5ySH1hyEM1RbjqAKNNc9kkeV+D
	z0nUYdP0K/9Aw0yHaLdttMvet0IyF4pcAV45WZA/RH99OFb86cHewQAFfFF9SQ==
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v15 12/15] net: phy: qca807x: Support SFP through phy_port interface
Date: Thu,  6 Nov 2025 10:47:37 +0100
Message-ID: <20251106094742.2104099-13-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
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
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/qcom/qca807x.c | 72 ++++++++++++++--------------------
 1 file changed, 30 insertions(+), 42 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 1be8295a95cb..d8f1ce5a7128 100644
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
@@ -643,67 +643,54 @@ static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 	return ret;
 }
 
-static int qca807x_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int qca807x_configure_serdes(struct phy_port *port, bool enable,
+				    phy_interface_t interface)
 {
-	struct phy_device *phydev = upstream;
-	const struct sfp_module_caps *caps;
-	phy_interface_t iface;
+	struct phy_device *phydev = port_phydev(port);
 	int ret;
 
-	caps = sfp_get_module_caps(phydev->sfp_bus);
-	iface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
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
@@ -744,9 +731,8 @@ static int qca807x_probe(struct phy_device *phydev)
 
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
@@ -824,6 +810,7 @@ static struct phy_driver qca807x_drivers[] = {
 		.get_phy_stats		= qca807x_get_phy_stats,
 		.set_wol		= at8031_set_wol,
 		.get_wol		= at803x_get_wol,
+		.attach_mii_port	= qca807x_attach_mii_port,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -851,6 +838,7 @@ static struct phy_driver qca807x_drivers[] = {
 		.get_phy_stats		= qca807x_get_phy_stats,
 		.set_wol		= at8031_set_wol,
 		.get_wol		= at803x_get_wol,
+		.attach_mii_port	= qca807x_attach_mii_port,
 	},
 };
 module_phy_driver(qca807x_drivers);
-- 
2.49.0


