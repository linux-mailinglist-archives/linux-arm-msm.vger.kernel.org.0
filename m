Return-Path: <linux-arm-msm+bounces-72841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C1B5016F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 513657BC37B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AD636209A;
	Tue,  9 Sep 2025 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fbTbXn/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718236207D;
	Tue,  9 Sep 2025 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431682; cv=none; b=pkW3S9pv+ak/OQmIp1KjuPB3NG9jKIFTnYjygAV4+ZzE48IaubB7zXstA8RD5kt/ZFTw4qvr9oxkP7BpAKra38Z/49e2rJgzTedAKQ1AgANivRRcpO/2wc8DSSI/SiITkEdT4clFtPZ1GFjYSzQiIsxJlZS/dcauDP/a8ON1wVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431682; c=relaxed/simple;
	bh=9MvuyOwOfLcc/LlUsmG2AeWiysYlc5iMjW4iaMuWfkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5YEBtFNajg67NMertkyfCAwyjR8g8IutmMv/nkdl6GqTBzd15PrwxRiYLHiwAAy/4yus7Umj07sioJo6ztrN26WfFn5AWTof5Duk3x7yFiD9abFvN+HvDORqRcMnFk31pkJHRG5OJMjA/wlBaDe3nEBO30LjNrlMx+ZpcDLWbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fbTbXn/Q; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01E8FC6B394;
	Tue,  9 Sep 2025 15:27:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC0F660630;
	Tue,  9 Sep 2025 15:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3834102F08F6;
	Tue,  9 Sep 2025 17:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757431677; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KWWG4hKYYlA02bsgRIuvB2vwBhYTHk9kJhB5edwHNWs=;
	b=fbTbXn/QQaV88SW+7kX6FLekXvHPRFVfLvBFd+k3cQ6PuYSvWPRRtD2XyTkXcrRYQtohoY
	8UYnQU2wQIg6fAshJloEkO4rB8zM6ZvairrLQGxQeKzqXLJr1V1YV6bPbrtzO+Bvblqsyq
	FYQyTomqMvxAcbqtef4Hy67plKp19jjLDXamzF2yoptE/xt2Bq59zXrdZutUa5yh4STfkj
	W1P8TeCjaMkezUw4CLBxD6tzChMYoA8g2veXRaD7x0zn9m+MqD7pEwzz/vpH9WkmUb/YFu
	rVhcKfg5PSUppwck2VxeZT2PqqlY1W/1Gr9MTiuDR9Vcp9k6rsFvXPA3iE70AA==
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
Subject: [PATCH net-next v12 12/18] net: phy: marvell: Support SFP through phy_port interface
Date: Tue,  9 Sep 2025 17:26:08 +0200
Message-ID: <20250909152617.119554-13-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Convert the Marvell driver (especially the 88e1512 driver) to use the
phy_port interface to handle SFPs. This means registering a
.attach_port() handler to detect when a serdes line interface is used
(most likely, and SFP module).

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell.c | 94 ++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 623292948fa7..467cf94e2d7f 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -29,10 +29,10 @@
 #include <linux/ethtool.h>
 #include <linux/ethtool_netlink.h>
 #include <linux/phy.h>
+#include <linux/phy_port.h>
 #include <linux/marvell_phy.h>
 #include <linux/bitfield.h>
 #include <linux/of.h>
-#include <linux/sfp.h>
 
 #include <linux/io.h>
 #include <asm/irq.h>
@@ -3561,42 +3561,38 @@ static int marvell_probe(struct phy_device *phydev)
 	return marvell_hwmon_probe(phydev);
 }
 
-static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
+					  phy_interface_t interface)
 {
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	struct phy_device *phydev = upstream;
-	phy_interface_t interface;
+	struct phy_device *phydev = port_phydev(port);
 	struct device *dev;
 	int oldpage;
 	int ret = 0;
 	u16 mode;
 
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0, };
-
 	dev = &phydev->mdio.dev;
 
-	sfp_parse_support(phydev->sfp_bus, id, supported, interfaces);
-	interface = sfp_select_interface(phydev->sfp_bus, supported);
+	if (enable) {
+		switch (interface) {
+		case PHY_INTERFACE_MODE_1000BASEX:
+			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
 
-	dev_info(dev, "%s SFP module inserted\n", phy_modes(interface));
+			break;
+		case PHY_INTERFACE_MODE_100BASEX:
+			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
 
-	switch (interface) {
-	case PHY_INTERFACE_MODE_1000BASEX:
-		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
+			break;
+		case PHY_INTERFACE_MODE_SGMII:
+			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
 
-		break;
-	case PHY_INTERFACE_MODE_100BASEX:
-		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
+			break;
+		default:
+			dev_err(dev, "Incompatible SFP module inserted\n");
 
-		break;
-	case PHY_INTERFACE_MODE_SGMII:
-		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
-
-		break;
-	default:
-		dev_err(dev, "Incompatible SFP module inserted\n");
-
-		return -EINVAL;
+			return -EINVAL;
+		}
+	} else {
+		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII;
 	}
 
 	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
@@ -3613,49 +3609,24 @@ static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 
 error:
 	return phy_restore_page(phydev, oldpage, ret);
-}
-
-static void m88e1510_sfp_remove(void *upstream)
-{
-	struct phy_device *phydev = upstream;
-	int oldpage;
-	int ret = 0;
-
-	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
-	if (oldpage < 0)
-		goto error;
-
-	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK,
-			   MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);
-	if (ret < 0)
-		goto error;
-
-	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			     MII_88E1510_GEN_CTRL_REG_1_RESET);
 
-error:
-	phy_restore_page(phydev, oldpage, ret);
+	return 0;
 }
 
-static const struct sfp_upstream_ops m88e1510_sfp_ops = {
-	.module_insert = m88e1510_sfp_insert,
-	.module_remove = m88e1510_sfp_remove,
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
+static const struct phy_port_ops m88e1510_serdes_port_ops = {
+	.configure_mii = m88e1510_port_configure_serdes,
 };
 
-static int m88e1510_probe(struct phy_device *phydev)
+static int m88e1510_attach_mii_port(struct phy_device *phy_device,
+				    struct phy_port *port)
 {
-	int err;
+	port->ops = &m88e1510_serdes_port_ops;
 
-	err = marvell_probe(phydev);
-	if (err)
-		return err;
+	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
 
-	return phy_sfp_probe(phydev, &m88e1510_sfp_ops);
+	return 0;
 }
 
 static struct phy_driver marvell_drivers[] = {
@@ -3915,7 +3886,7 @@ static struct phy_driver marvell_drivers[] = {
 		.driver_data = DEF_MARVELL_HWMON_OPS(m88e1510_hwmon_ops),
 		.features = PHY_GBIT_FIBRE_FEATURES,
 		.flags = PHY_POLL_CABLE_TEST,
-		.probe = m88e1510_probe,
+		.probe = marvell_probe,
 		.config_init = m88e1510_config_init,
 		.config_aneg = m88e1510_config_aneg,
 		.read_status = marvell_read_status,
@@ -3941,6 +3912,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.attach_mii_port = m88e1510_attach_mii_port,
 	},
 	{
 		.phy_id = MARVELL_PHY_ID_88E1540,
-- 
2.49.0


