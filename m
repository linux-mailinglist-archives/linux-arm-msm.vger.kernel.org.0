Return-Path: <linux-arm-msm+bounces-47195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C9A2D0AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 837EB7A5D65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842BB1DFE16;
	Fri,  7 Feb 2025 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W8Kbp2Ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CC01DF252;
	Fri,  7 Feb 2025 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967813; cv=none; b=D0g6C/6Zjab+r9cyPeWblTymnfrtuW8ta80KHmSxAaCQL1H9AopX6lzFWuZqdUX9uhgaWJfLbPy1grC7769iUpKUxTKAaeAzwMhUPHhgA62uxJQi3YcRlEHGJi6JXhoNbc/FHC5C2GH9DVoSK6aunpThde8d++SoPxEnat+7yd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967813; c=relaxed/simple;
	bh=O7sNBSWGX5cwEbixvIRi4v7bov9+6SBh/8THqWScyKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewI1Kwb/hIgTmqmLdiS4a1T3mnP1xpKQbGGVocY4ORxT4RgLCTWqS2dhRjFSFB2MNi+f9vksVQL+yrHODO/zENSuu+zS/Q2MeYhkBtIV2/Za3QqO6w+g7iG9nZeCDbNgLa5+4DCvGyHhUcjiRmVucIk5Nlpbqqyfcib1XgWfX1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W8Kbp2Ms; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 931DE204CC;
	Fri,  7 Feb 2025 22:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738967809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/ePMEqy1mOCLfEpKe8pS/xqyGA6Nzou9Q6bZyZSwrs=;
	b=W8Kbp2MsPOP1WJk5iiUmcmY7UQto82FzAHkhIlwt4+IjeTZObeXUhQXeN4SQI9p5ODLIvE
	SDvphCN31V0NYGGYECU4H59ZgS4f0r6wr2k1zO7HG6MqueEiSgh9uL9pSvGgxAFLgvkDxM
	e5lGKfUe6XbNH9ze9v6A2iyzmAsM5xIeRgcsfotmWn8feILDOkeV0CsnFRwynlCNg4giJr
	AtsCOohpuZXPF5IFl2OmXYWk7ue6+PUwcsnKpgoHdx7thTuhynEFFCtTqX7lkgB4v5dCm6
	N6H2DyMF7iV2uxxeTJZaHlQd9ShKr1hlJ2M0mAu1/K3/5306U0KcKBNYtpmaHg==
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
	Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next 06/13] net: phy: Intrduce generic SFP handling for PHY drivers
Date: Fri,  7 Feb 2025 23:36:25 +0100
Message-ID: <20250207223634.600218-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemtggtfegtmeeglehfgeemfeeiheehmegsheejgeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegttgeftgemgeelfhegmeefieehheemsgehjeegpdhhvghlohepfhgvughorhgrqddurdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

There are currently 4 PHY drivers that can drive downstream SFPs:
marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
logic is boilerplate, either calling into generic phylib helpers (for
SFP PHY attach, bus attach, etc.) or performing the same tasks with a
bit of validation :
 - Getting the module's expected interface mode
 - Making sure the PHY supports it
 - Optionnaly perform some configuration to make sure the PHY outputs
   the right mode

This can be made more generic by leveraging the phy_port, and its
configure_mii() callback which allows setting a port's interfaces when
the port is a serdes.

Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
bus itself, but an SFP phandle is found in devicetree/firmware, then the
generic PHY SFP support will be used, relying on port ops.

PHY driver need to :
 - Register a .attach_port() callback
 - When a serdes port is registered to the PHY, drivers must set
   port->interfaces to the set of PHY_INTERFACE_MODE the port can output
 - If the port has limitations regarding speed, duplex and aneg, the
   port can also fine-tune the final linkmodes that can be supported
 - The port may register a set of ops, including .configure_mii(), that
   will be called at module_insert time to adjust the interface based on
   the module detected.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 102 +++++++++++++++++++++++++++++++++++
 include/linux/phy.h          |   2 +
 2 files changed, 104 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 56928c4459c6..4aac9644c25c 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1420,6 +1420,87 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 }
 EXPORT_SYMBOL(phy_sfp_detach);
 
+static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
+{
+	struct phy_device *phydev = upstream;
+	struct phy_port *port = phy_get_sfp_port(phydev);
+
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
+	phy_interface_t iface;
+
+	linkmode_zero(sfp_support);
+
+	if (!port)
+		return -EINVAL;
+
+	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
+
+	if (phydev->n_ports == 1)
+		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
+
+	linkmode_and(sfp_support, port->supported, sfp_support);
+
+	if (linkmode_empty(sfp_support)) {
+		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
+		return -EINVAL;
+	}
+
+	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
+
+	/* Check that this interface is supported */
+	if (!test_bit(iface, port->interfaces)) {
+		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
+		return -EINVAL;
+	}
+
+	if (port->ops && port->ops->configure_mii)
+		return port->ops->configure_mii(port, true, iface);
+
+	return 0;
+}
+
+static void phy_sfp_module_remove(void *upstream)
+{
+	struct phy_device *phydev = upstream;
+	struct phy_port *port = phy_get_sfp_port(phydev);
+
+	if (port && port->ops && port->ops->configure_mii)
+		port->ops->configure_mii(port, false, PHY_INTERFACE_MODE_NA);
+
+	if (phydev->n_ports == 1)
+		phydev->port = PORT_NONE;
+}
+
+static void phy_sfp_link_up(void *upstream)
+{
+	struct phy_device *phydev = upstream;
+	struct phy_port *port = phy_get_sfp_port(phydev);
+
+	if (port && port->ops && port->ops->link_up)
+		port->ops->link_up(port);
+}
+
+static void phy_sfp_link_down(void *upstream)
+{
+	struct phy_device *phydev = upstream;
+	struct phy_port *port = phy_get_sfp_port(phydev);
+
+	if (port && port->ops && port->ops->link_down)
+		port->ops->link_down(port);
+}
+
+static const struct sfp_upstream_ops sfp_phydev_ops = {
+	.attach = phy_sfp_attach,
+	.detach = phy_sfp_detach,
+	.module_insert = phy_sfp_module_insert,
+	.module_remove = phy_sfp_module_remove,
+	.link_up = phy_sfp_link_up,
+	.link_down = phy_sfp_link_down,
+	.connect_phy = phy_sfp_connect_phy,
+	.disconnect_phy = phy_sfp_disconnect_phy,
+};
+
 static int phy_add_port(struct phy_device *phydev, struct phy_port *port)
 {
 	int ret = 0;
@@ -3554,6 +3635,13 @@ static int phy_setup_ports(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
+	/* Use generic SFP probing only if the driver didn't do so already */
+	if (!phydev->sfp_bus) {
+		ret = phy_sfp_probe(phydev, &sfp_phydev_ops);
+		if (ret)
+			goto out;
+	}
+
 	if (phydev->n_ports < phydev->max_n_ports) {
 		ret = phy_default_setup_single_port(phydev);
 		if (ret)
@@ -3587,6 +3675,20 @@ static int phy_setup_ports(struct phy_device *phydev)
 	return ret;
 }
 
+/**
+ * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
+ */
+struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
+{
+	struct phy_port *port;
+	list_for_each_entry(port, &phydev->ports, head)
+		if (port->active && port->is_serdes)
+			return port;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(phy_get_sfp_port);
+
 /**
  * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
  * @fwnode: pointer to the mdio_device's fwnode
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 17bc287c1866..b850af2500e4 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2209,6 +2209,8 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
 		       struct kernel_hwtstamp_config *config,
 		       struct netlink_ext_ack *extack);
 
+struct phy_port *phy_get_sfp_port(struct phy_device *phydev);
+
 static inline int phy_package_address(struct phy_device *phydev,
 				      unsigned int addr_offset)
 {
-- 
2.48.1


