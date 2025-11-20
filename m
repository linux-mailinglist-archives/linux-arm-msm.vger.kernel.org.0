Return-Path: <linux-arm-msm+bounces-82745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2AC76460
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 21:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 667B32C2BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 20:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905EF371DF1;
	Thu, 20 Nov 2025 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WHyH9w+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1434FF7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672160; cv=none; b=KzemjjeiKF3hoLG7s7/8s098RI6ts6hcFxPlKA2h3aPje6Q2p1BTpWrWK+R+Jyyu0Y4BhFsDA6tTCj4sTm0s6QePCp0zcZngktRvdTnSQP/Pziqd2dch98gpJ5XrrQ9VwLvlAw1qMsukdDLS90e1UXQ5GH1JIYlIo1FyIRqWGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672160; c=relaxed/simple;
	bh=MQurAbVAKyKsLw2Mye1uGTxhsgFGOYYFNL3jQh/5tjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kuc1Zfoo6Z6TdtzgTeB5F0GdsqhTnu2/2G79RUbeCN+ZVaXS8JfpYA3sEJ3mC8dRnzMsJaY0JKbnOaBhgMUxWdHdf4ZlicJzEsuFPcuAESmyI0LPaXjlf62QgJ2sGx5NQH3RUSNGF2BPqZsmHRK9kb07xo2QC26MaxaUQhyOekQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WHyH9w+t; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24235C111AC;
	Thu, 20 Nov 2025 20:55:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73778606F6;
	Thu, 20 Nov 2025 20:55:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DF2A10371BD5;
	Thu, 20 Nov 2025 21:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763672154; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tJEx6X7jTirj87wA7LztjO6u7T36oh+3CaAe0KvSpGE=;
	b=WHyH9w+tLF2OFYIjCdr8i8sXTQOfhmrIb27wzXjXr3iF0x4pBFRQO6ltWAczZ3XaeP8ubv
	eE+oAkVDtrbRm1BVWq8jTQOyoWuMjx96oh2klmccxeMfVh8B2TaCoS0y53KhWESuGMwstL
	P5x46eI8ftwEm8+T8yFT/nhcqcXlRXf6SdfnuWkWXYHE22cLWEM09SRpqGHePIhjaDX1cY
	rRGP8TA2xlVL+wi14TLg9xrnYPb2aeV0Wsmc2K1YiVdhROl41RG9DzeGr9Ph6V7G8LXIG4
	xl7RZo/7yOO7O4lT3C/tGwl/bVfFapcO2YTa0NstxqHHc659/w2sA5v4dbsExw==
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
	Tariq Toukan <tariqt@nvidia.com>
Subject: [PATCH net-next v18 09/15] net: phy: marvell: Support SFP through phy_port interface
Date: Thu, 20 Nov 2025 21:54:59 +0100
Message-ID: <20251120205508.553909-10-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120205508.553909-1-maxime.chevallier@bootlin.com>
References: <20251120205508.553909-1-maxime.chevallier@bootlin.com>
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell.c | 92 ++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 59 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index c248c90510ae..542166cfcb23 100644
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
@@ -3598,11 +3598,10 @@ static int marvell_probe(struct phy_device *phydev)
 	return marvell_hwmon_probe(phydev);
 }
 
-static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
+					  phy_interface_t interface)
 {
-	struct phy_device *phydev = upstream;
-	const struct sfp_module_caps *caps;
-	phy_interface_t interface;
+	struct phy_device *phydev = port_phydev(port);
 	struct device *dev;
 	int oldpage;
 	int ret = 0;
@@ -3610,28 +3609,27 @@ static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 
 	dev = &phydev->mdio.dev;
 
-	caps = sfp_get_module_caps(phydev->sfp_bus);
-	interface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
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
-
-		break;
-	case PHY_INTERFACE_MODE_SGMII:
-		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
+			break;
+		default:
+			dev_err(dev, "Incompatible SFP module inserted\n");
 
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
@@ -3648,49 +3646,24 @@ static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 
 error:
 	return phy_restore_page(phydev, oldpage, ret);
-}
-
-static void m88e1510_sfp_remove(void *upstream)
-{
-	struct phy_device *phydev = upstream;
-	int oldpage;
-	int ret = 0;
 
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
-
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
@@ -3950,7 +3923,7 @@ static struct phy_driver marvell_drivers[] = {
 		.driver_data = DEF_MARVELL_HWMON_OPS(m88e1510_hwmon_ops),
 		.features = PHY_GBIT_FIBRE_FEATURES,
 		.flags = PHY_POLL_CABLE_TEST,
-		.probe = m88e1510_probe,
+		.probe = marvell_probe,
 		.config_init = m88e1510_config_init,
 		.config_aneg = m88e1510_config_aneg,
 		.read_status = marvell_read_status,
@@ -3976,6 +3949,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.attach_mii_port = m88e1510_attach_mii_port,
 	},
 	{
 		.phy_id = MARVELL_PHY_ID_88E1540,
-- 
2.49.0


