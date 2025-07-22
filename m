Return-Path: <linux-arm-msm+bounces-66074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B1CB0D950
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4149917B164
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5AC2EB5C6;
	Tue, 22 Jul 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NhNqjR4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B22EAD09;
	Tue, 22 Jul 2025 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186614; cv=none; b=Bcj+QSlemtpZGF4/6RdHDVth3tHoe8w7uVpaFTdtwj+P2LnPUx4KcYP84m4Hh8JPVwUkun9NvhlRGMTE3MVqxW9W04D4b+Vq0OAYkFz8bLc9vcZluxMnHlpkYVtBLFxciJlJcYvVcN6IMoEREvxZYzeeEgTRvTmrk9bp2AiuitU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186614; c=relaxed/simple;
	bh=QGpeKkORnkBUAEDEjPL2tD+LiuOm8hekczYfbAscack=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAPNURE2c58loJOlyQTK/iLiBrw93xF/bi3ZJtamFgoQjamqb5TwcK7+xbQZKVz7mLCl7TVZQfCjT/T3HrcYVVfV5khaB3Rm0ZJx3pGZ3F5I/RSZWcLZ6FRoGI3tTrTrHYBEkS3SA9TkjmPsL5ykTBbJna8LVSn+E3JHTuC0b+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NhNqjR4e; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6682843A0A;
	Tue, 22 Jul 2025 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753186610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1lvHgGXoefJrOxJoNqCV4fzMnf4EP0IuMFuO3tY8bow=;
	b=NhNqjR4epFi8jJuHe9CUM5hQi19fqYyF2cBxdUD8jS92uk4TsMoavLDnqHJMpnkd6wfowH
	W2UJCBveHkyOTiOBe7z/CEUYZuxKbQZVaOCy6edAvmq7XDY4IpWhQCUu6ZJfBN0qVOoOJN
	1sYU2EInhoR/DOtVmTyi/4ycy5pWN4uGTOzr0lUdEvGJSngvA6g11ZBcMZr/2Nlgk0Z496
	cnSzNgufJyvjqRRjslpV49GUPxGiXsb5EuTtnQOQwvfKT+FsY94+WZZAmKO+QCL60hCIfz
	267/H5lFSZVLcy08Q9WwUQGkDF3wjXg8HUFKaZ7l/m2NCuMd/Nzfzp7r2JDSfg==
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
Subject: [PATCH net-next v10 10/15] net: phy: marvell10g: Support SFP through phy_port
Date: Tue, 22 Jul 2025 14:16:15 +0200
Message-ID: <20250722121623.609732-11-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepledtrdejiedriedvrddujedunecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepledtrdejiedriedvrddujedupdhhvghlohepfhgvughorhgrrddrpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhug
 idqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Convert the Marvell10G driver to use the generic SFP handling, through a
dedicated .attach_port() handler to populate the port's supported
interfaces.

As the 88x3310 supports multiple MDI, the .attach_port() logic handles
both SFP attach with 10GBaseR support, and support for the "regular"
port that usually is a BaseT port.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell10g.c | 47 +++++++++++++++++++-----------------
 drivers/net/phy/phy_port.c   | 20 +++++++++++++++
 include/linux/phy_port.h     |  1 +
 3 files changed, 46 insertions(+), 22 deletions(-)

diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 13e81dff42c1..7cb638804a3f 100644
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
@@ -463,36 +463,31 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
 	return err;
 }
 
-static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int mv3310_attach_port(struct phy_device *phydev, struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	phy_interface_t iface;
-
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
-
-	if (iface != PHY_INTERFACE_MODE_10GBASER) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
+	if (port->is_mii) {
+		__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
+	} else if (port->not_described) {
+		/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
+		 * of them going to an SFP and the other one to a RJ45
+		 * connector. If we don't have any representation for the port
+		 * in DT, and we are dealing with a non-SFP port, then we
+		 * mask the port's capabilities to report BaseT-only modes
+		 */
+		port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
+
+		phy_port_filter_supported(port);
 	}
+
 	return 0;
 }
 
-static const struct sfp_upstream_ops mv3310_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-	.module_insert = mv3310_sfp_insert,
-};
-
 static int mv3310_probe(struct phy_device *phydev)
 {
 	const struct mv3310_chip *chip = to_mv3310_chip(phydev);
 	struct mv3310_priv *priv;
 	u32 mmd_mask = MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
 	int ret;
 
 	if (!phydev->is_c45 ||
@@ -543,9 +538,13 @@ static int mv3310_probe(struct phy_device *phydev)
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
@@ -1406,6 +1405,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_port	= mv3310_attach_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88X3310,
@@ -1425,6 +1425,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_port	= mv3310_attach_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1445,6 +1446,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_loopback	= genphy_c45_loopback,
 		.get_wol	= mv3110_get_wol,
 		.set_wol	= mv3110_set_wol,
+		.attach_port	= mv3310_attach_port,
 	},
 	{
 		.phy_id		= MARVELL_PHY_ID_88E2110,
@@ -1463,6 +1465,7 @@ static struct phy_driver mv3310_drivers[] = {
 		.set_tunable	= mv3310_set_tunable,
 		.remove		= mv3310_remove,
 		.set_loopback	= genphy_c45_loopback,
+		.attach_port	= mv3310_attach_port,
 	},
 };
 
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index 36de8c5c9ad5..cd7ace64ed4b 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -131,6 +131,26 @@ void phy_port_update_supported(struct phy_port *port)
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
+void phy_port_filter_supported(struct phy_port *port)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0 };
+	int i;
+
+	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
+		phy_caps_medium_get_supported(supported, i, port->lanes);
+
+	linkmode_and(port->supported, port->supported, supported);
+}
+EXPORT_SYMBOL_GPL(phy_port_filter_supported);
+
 /**
  * phy_port_get_type() - get the PORT_* attribut for that port.
  * @port: The port we want the information from
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
index f47ac5f5ef9e..ce735d81bcd0 100644
--- a/include/linux/phy_port.h
+++ b/include/linux/phy_port.h
@@ -90,6 +90,7 @@ static inline bool phy_port_is_fiber(struct phy_port *port)
 }
 
 void phy_port_update_supported(struct phy_port *port);
+void phy_port_filter_supported(struct phy_port *port);
 
 int phy_port_get_type(struct phy_port *port);
 
-- 
2.49.0


