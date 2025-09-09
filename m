Return-Path: <linux-arm-msm+bounces-72842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCE3B50159
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D030188F632
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A5F3680AC;
	Tue,  9 Sep 2025 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AUP8vyUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B4B3629BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431685; cv=none; b=C15ii6oOFBBF3ywOmtn7SQ6hpuGSQpmYeTsubn2eCruV2XhrWYHllgaPiQqEG1FkENeHLbQQPBdLmjRmDymPkHWLrb9Bc5FHciPnLblnkk3pcCULXNk7445avXjqguOGpBQEZYMeO5UQy5jM6x2OLJ8AgUdH9AtfBfz87CYR8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431685; c=relaxed/simple;
	bh=DIu91AlIyqj5udBVoL4nNPIt2pY4kXiU4bsH713Nkas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3IuD19E8QKWWOunP/2v5KTXSV1171oVnnhlN4JUBg1MmIe5ULL1pIC5GsI/q7gu3Hvisz7rZr/vRzmyQCGT3hIqbT4eLbMufLnqUVZXVJK0g6B4TQk977feWWbrDbDIvOVNe8Uw8g5o7ldLQSyzR17yGhkHOPm05kp2qKg9awE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AUP8vyUI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D5AEC6B39E;
	Tue,  9 Sep 2025 15:27:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD3F460630;
	Tue,  9 Sep 2025 15:28:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3CA1102F2866;
	Tue,  9 Sep 2025 17:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757431680; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HV/VBaz1cbuMI4PiuxG3jTVqnp+frC6Ei9d5ndVdoBE=;
	b=AUP8vyUIT7E8WXK1jQjZhUjWrpjSJSsThxQ6nHiOkQXiyibFgLF36Xzm0+Xf3WQQbEsDRt
	UVn2gAf2cN18HL0wscQsW3JYSuLJLkFDK4CHMRZU6sBQcTUl1JryJxEn2rDqL9fR/tJ0/9
	U5PYs/FrrRuP4aY6Ba2eNHgYgdwYNljgHssM0j6pTT0otpzzTGAUKj23JbSlUiSVi8BGGk
	edqMl/AsPv4ULSMs46g+wpay/zMfwiFjdZh5/Rl11H9NJb33VrYQyYddoPTh1LTCKwr6JK
	C4uGhqth/009nVhMZTbaHWSMZ6QpJiWo4vd7ghoUaqLnJefvL0Xui3ZTUoTbHQ==
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
Subject: [PATCH net-next v12 13/18] net: phy: marvell10g: Support SFP through phy_port
Date: Tue,  9 Sep 2025 17:26:09 +0200
Message-ID: <20250909152617.119554-14-maxime.chevallier@bootlin.com>
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

Convert the Marvell10G driver to use the generic SFP handling, through a
dedicated .attach_port() handler to populate the port's supported
interfaces.

As the 88x3310 supports multiple MDI, the .attach_port() logic handles
both SFP attach with 10GBaseR support, and support for the "regular"
port that usually is a BaseT port.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell10g.c | 54 ++++++++++++++++++++++--------------
 drivers/net/phy/phy_port.c   | 44 +++++++++++++++++++++++++++++
 include/linux/phy_port.h     |  1 +
 3 files changed, 78 insertions(+), 21 deletions(-)

diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 13e81dff42c1..833ea0c0dc22 100644
--- a/drivers/net/phy/marvell10g.c
+++ b/drivers/net/phy/marvell10g.c
@@ -28,7 +28,7 @@
 #include <linux/hwmon.h>
 #include <linux/marvell_phy.h>
 #include <linux/phy.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 
 #define MV_PHY_ALASKA_NBT_QUIRK_MASK	0xfffffffe
@@ -463,36 +463,36 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
 	return err;
 }
 
-static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int mv3310_attach_mii_port(struct phy_device *phydev,
+				  struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	phy_interface_t iface;
-
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
 
-	if (iface != PHY_INTERFACE_MODE_10GBASER) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
-	}
 	return 0;
 }
 
-static const struct sfp_upstream_ops mv3310_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-	.module_insert = mv3310_sfp_insert,
-};
+static int mv3310_attach_mdi_port(struct phy_device *phydev,
+				  struct phy_port *port)
+{
+	/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
+	 * of them going to an SFP and the other one to a RJ45
+	 * connector. If we don't have any representation for the port
+	 * in DT, and we are dealing with a non-SFP port, then we
+	 * mask the port's capabilities to report BaseT-only modes
+	 */
+	if (port->not_described)
+		return phy_port_restrict_mediums(port,
+						 BIT(ETHTOOL_LINK_MEDIUM_BASET));
+
+	return 0;
+}
 
 static int mv3310_probe(struct phy_device *phydev)
 {
 	const struct mv3310_chip *chip = to_mv3310_chip(phydev);
 	struct mv3310_priv *priv;
 	u32 mmd_mask = MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
 	int ret;
 
 	if (!phydev->is_c45 ||
@@ -543,9 +543,13 @@ static int mv3310_probe(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, interfaces);
+
 	chip->init_supported_interfaces(priv->supported_interfaces);
 
-	return phy_sfp_probe(phydev, &mv3310_sfp_ops);
+	phydev->max_n_ports = 2;
+
+	return 0;
 }
 
 static void mv3310_remove(struct phy_device *phydev)
@@ -1406,6 +1410,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88X3310,
@@ -1425,6 +1431,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1445,6 +1453,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1463,6 +1473,8 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_mii_port = mv3310_attach_mii_port,
+		.attach_mdi_port = mv3310_attach_mdi_port,
 	},
 };
 
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index 6fecaa68350e..b1ba3e56c28d 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -131,6 +131,50 @@ void phy_port_update_supported(struct phy_port *port)
 }
 EXPORT_SYMBOL_GPL(phy_port_update_supported);
 
+/**
+ * phy_port_filter_supported() - Make sure that port->supported match port->mediums
+ * @port: The port to filter
+ *
+ * After updating a port's mediums to a more restricted subset, this helper will
+ * make sure that port->supported only contains linkmodes that are compatible
+ * with port->mediums.
+ */
+static void phy_port_filter_supported(struct phy_port *port)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0 };
+	int i;
+
+	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
+		phy_caps_medium_get_supported(supported, i, port->lanes);
+
+	linkmode_and(port->supported, port->supported, supported);
+}
+
+/**
+ * phy_port_restrict_mediums - Mask away some of the port's supported mediums
+ * @port: The port to act upon
+ * @mediums: A mask of mediums to support on the port
+ *
+ * This helper allows removing some mediums from a port's list of supported
+ * mediums, which occurs once we have enough information about the port to
+ * know its nature.
+ *
+ * Returns 0 if the change was donne correctly, a negative value otherwise.
+ */
+int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums)
+{
+	/* We forbid ending-up with a port with empty mediums */
+	if (!(port->mediums & mediums))
+		return -EINVAL;
+
+	port->mediums &= mediums;
+
+	phy_port_filter_supported(port);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phy_port_restrict_mediums);
+
 /**
  * phy_port_get_type() - get the PORT_* attribute for that port.
  * @port: The port we want the information from
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
index 053c35c70071..82f1992d2395 100644
--- a/include/linux/phy_port.h
+++ b/include/linux/phy_port.h
@@ -92,6 +92,7 @@ static inline bool phy_port_is_fiber(struct phy_port *port)
 }
 
 void phy_port_update_supported(struct phy_port *port);
+int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums);
 
 int phy_port_get_type(struct phy_port *port);
 
-- 
2.49.0


