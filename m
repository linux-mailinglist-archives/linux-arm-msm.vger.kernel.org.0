Return-Path: <linux-arm-msm+bounces-47883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D5A33C66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 11:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F612169C7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 10:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D7F21507F;
	Thu, 13 Feb 2025 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NUBi7aMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4EA213E7F;
	Thu, 13 Feb 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441787; cv=none; b=Lp1VUXfkpl41ljzBgTDtX5QRwoQaSvI3QSerYSJ+Tp8qatahJw9q27EuY6R5xLNfJ0YPzuN97ITQWJHXVAVlYa3y8RxX3lWJV+YPfqTxoaCYHNMt68PLttyvGxl406OcX7FSC+YHdwLS1EePdbaeFkZBvu8Nc1fosVNH58j4fZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441787; c=relaxed/simple;
	bh=JhVJZUWwBEjHKU7k0dRq+RizN7yXfSifiMi3xGUxtDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lR+jw8lPw0qv4tWoA2Xs3HI/Hk/rxGz6Ft2rw/+7zwuw7sMJqDphi9C6Q0SUVbJbPQx6/Udiq+WD2s19rCTR38haZodH8haX8wKIcdTMdSuwQiwgbOeIbhujcLubsV30LoXU8HwjK5elD7o2kVuZWyYj1ZCM+vVJdr4Lgm22ZuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NUBi7aMK; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 763F5441CC;
	Thu, 13 Feb 2025 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739441783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvOx+iygKShKeUYlFt9MdhjVPtT8lWB3qFpXeuu1A/Y=;
	b=NUBi7aMKlKuMr1YJI96Ue7qaxu+DKDgzQcAq4p6cXXj6Q7MZXbBOE0pmNDGdILxJZkk/xE
	qY93uHas1KBX7OulmIpjcWncb1+8ZqNurTcMx8+kfSuol3iW/PUuHuaL7/oavY+aXgT9jl
	+n9wtheFTS4QHjPtvftqT+pYCBInXisZQksuU1ogzlO0YfBrICOjqMALVO65uVl5kj4X8+
	/b42Bxelg8UYGSPAYHG9NBvK2Q/pJWCCmO+4hvyHZw3aeW95Vq7+xqe2J60ZMxttj//bwm
	uUoCuc3JvBUn/g2KUiX9EwTquKwQqKozhRs5Ii4I6qgs3Rc1xQrDfI+/71M2Bg==
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
	Sean Anderson <seanga2@gmail.com>
Subject: [PATCH net-next v4 07/15] net: phy: marvell-88x2222: Support SFP through phy_port interface
Date: Thu, 13 Feb 2025 11:15:55 +0100
Message-ID: <20250213101606.1154014-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

The 88x2222 PHY from Marvell only supports serialised modes as its
line-facing interfaces. Convert that driver to the generic phylib SFP
handling.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4: no changes

 drivers/net/phy/marvell-88x2222.c | 96 +++++++++++++------------------
 1 file changed, 39 insertions(+), 57 deletions(-)

diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index fad2f54c1eac..3dba7b33a873 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -13,7 +13,7 @@
 #include <linux/mdio.h>
 #include <linux/marvell_phy.h>
 #include <linux/of.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 
 /* Port PCS Configuration */
@@ -473,90 +473,71 @@ static int mv2222_config_init(struct phy_device *phydev)
 	return 0;
 }
 
-static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int mv2222_configure_serdes(struct phy_port *port, bool enable,
+				   phy_interface_t interface)
 {
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
-	struct phy_device *phydev = upstream;
-	phy_interface_t sfp_interface;
+	struct phy_device *phydev = port_phydev(port);
 	struct mv2222_data *priv;
-	struct device *dev;
-	int ret;
-
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_supported) = { 0, };
+	int ret = 0;
 
 	priv = phydev->priv;
-	dev = &phydev->mdio.dev;
-
-	sfp_parse_support(phydev->sfp_bus, id, sfp_supported, interfaces);
-	phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_supported);
-	sfp_interface = sfp_select_interface(phydev->sfp_bus, sfp_supported);
-
-	dev_info(dev, "%s SFP module inserted\n", phy_modes(sfp_interface));
+	priv->line_interface = interface;
 
-	if (sfp_interface != PHY_INTERFACE_MODE_10GBASER &&
-	    sfp_interface != PHY_INTERFACE_MODE_1000BASEX &&
-	    sfp_interface != PHY_INTERFACE_MODE_SGMII) {
-		dev_err(dev, "Incompatible SFP module inserted\n");
+	if (enable) {
+		linkmode_and(priv->supported, phydev->supported, port->supported);
 
-		return -EINVAL;
-	}
-
-	priv->line_interface = sfp_interface;
-	linkmode_and(priv->supported, phydev->supported, sfp_supported);
+		ret = mv2222_config_line(phydev);
+		if (ret < 0)
+			return ret;
 
-	ret = mv2222_config_line(phydev);
-	if (ret < 0)
-		return ret;
+		if (mutex_trylock(&phydev->lock)) {
+			ret = mv2222_config_aneg(phydev);
+			mutex_unlock(&phydev->lock);
+		}
 
-	if (mutex_trylock(&phydev->lock)) {
-		ret = mv2222_config_aneg(phydev);
-		mutex_unlock(&phydev->lock);
+	} else {
+		linkmode_zero(priv->supported);
 	}
 
 	return ret;
 }
 
-static void mv2222_sfp_remove(void *upstream)
-{
-	struct phy_device *phydev = upstream;
-	struct mv2222_data *priv;
-
-	priv = phydev->priv;
-
-	priv->line_interface = PHY_INTERFACE_MODE_NA;
-	linkmode_zero(priv->supported);
-	phydev->port = PORT_NONE;
-}
-
-static void mv2222_sfp_link_up(void *upstream)
+static void mv2222_port_link_up(struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
+	struct phy_device *phydev = port_phydev(port);
 	struct mv2222_data *priv;
 
 	priv = phydev->priv;
 	priv->sfp_link = true;
 }
 
-static void mv2222_sfp_link_down(void *upstream)
+static void mv2222_port_link_down(struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
+	struct phy_device *phydev = port_phydev(port);
 	struct mv2222_data *priv;
 
 	priv = phydev->priv;
 	priv->sfp_link = false;
 }
 
-static const struct sfp_upstream_ops sfp_phy_ops = {
-	.module_insert = mv2222_sfp_insert,
-	.module_remove = mv2222_sfp_remove,
-	.link_up = mv2222_sfp_link_up,
-	.link_down = mv2222_sfp_link_down,
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
+static const struct phy_port_ops mv2222_port_ops = {
+	.link_up = mv2222_port_link_up,
+	.link_down = mv2222_port_link_down,
+	.configure_mii = mv2222_configure_serdes,
 };
 
+static int mv2222_attach_port(struct phy_device *phydev, struct phy_port *port)
+{
+	if (!port->is_serdes)
+		return 0;
+
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
+
+	return 0;
+}
+
 static int mv2222_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -592,7 +573,7 @@ static int mv2222_probe(struct phy_device *phydev)
 	priv->line_interface = PHY_INTERFACE_MODE_NA;
 	phydev->priv = priv;
 
-	return phy_sfp_probe(phydev, &sfp_phy_ops);
+	return 0;
 }
 
 static struct phy_driver mv2222_drivers[] = {
@@ -609,6 +590,7 @@ static struct phy_driver mv2222_drivers[] = {
 		.suspend = mv2222_suspend,
 		.resume = mv2222_resume,
 		.read_status = mv2222_read_status,
+		.attach_port = mv2222_attach_port,
 	},
 };
 module_phy_driver(mv2222_drivers);
-- 
2.48.1


