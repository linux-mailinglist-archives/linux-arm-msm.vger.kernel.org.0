Return-Path: <linux-arm-msm+bounces-72839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561BB5014A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9E524E2AD6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0CB35FC19;
	Tue,  9 Sep 2025 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m+dqVcDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B435FC05;
	Tue,  9 Sep 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431674; cv=none; b=kvpBRFSd0tX95JhfVD1W3eGKJwoMTsmT5QogriCXCeouiMDIXgyu+FPuK0GJDlqA+gPw77QC+mGC9kRZCHCbg1SOqS1ma7VqNJwM0URFbeox1aMq9ZpZGZCgxqCY+wjKu3Tq+b6XpD6KGtxy9iNNvHMGQCf/Cxd7bX6l6T/x+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431674; c=relaxed/simple;
	bh=EE/5ok3OR5vAZOrQHO8/ZRplYPCIDe4gPHmzH2vflqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUQsOSTTA3n9yGibUgFcfCApk3UqTQPwnxC3PdPl8D1y0fzoy/9Jmu0KuG76jJbfef/0UP8Tx3d7cEEY5r/hYTAPAfLvqSdHt883zhWIV9zXAXJjujf/h7XNxRP5Nbdn9IF9mz+ZSqrtounKma1GSAH3YBMrLfMXnrq2kGrLy/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m+dqVcDy; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 740C84E408EC;
	Tue,  9 Sep 2025 15:27:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B4C760630;
	Tue,  9 Sep 2025 15:27:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 091DC102F2993;
	Tue,  9 Sep 2025 17:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757431669; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zNhWK752cxcpDpbOsrh4PVDPs4ps7jznAASK1JhMrSU=;
	b=m+dqVcDysbImEJzSl2cVCskbv06Fq1F6rMe6mWfD0+nWf8A2iyRof8Yb4Wv9aqDq1LxrdB
	9hXhZHGx5Rruuuc+CnCFgfyi+O976WhAEfBrlfq9SfuX+OxOkJVAq9dULcuKyMOA0ZwHEd
	NQokvABu5tjsCOLvfW66IJ1tcL0pX5hU9o96FSH8ZRY9+ACjSVw3mP08ZCuaejlWtkPuKP
	s/CZIHLxdbGr0qH4SJFFqZXmz/v9HdMP/DRwRYrOF2IyaNKbq0RbglSu0bImiqmq90zeHJ
	/3qTva634OJ0WEidB7G9ttf1rxnCrKTc6p9QxtnWCzV4HHcol8oqaQ5BX5RbBg==
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
Subject: [PATCH net-next v12 10/18] net: phy: Introduce generic SFP handling for PHY drivers
Date: Tue,  9 Sep 2025 17:26:06 +0200
Message-ID: <20250909152617.119554-11-maxime.chevallier@bootlin.com>
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

There are currently 4 PHY drivers that can drive downstream SFPs:
marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
logic is boilerplate, either calling into generic phylib helpers (for
SFP PHY attach, bus attach, etc.) or performing the same tasks with a
bit of validation :
 - Getting the module's expected interface mode
 - Making sure the PHY supports it
 - Optionaly perform some configuration to make sure the PHY outputs
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 109 +++++++++++++++++++++++++++++++++++
 include/linux/phy.h          |   2 +
 include/linux/phy_port.h     |   2 +
 3 files changed, 113 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index d195e15bde11..7b8ec7be473c 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1587,6 +1587,88 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 }
 EXPORT_SYMBOL(phy_sfp_detach);
 
+static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
+{
+	struct phy_device *phydev = upstream;
+	struct phy_port *port;
+
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
+	phy_interface_t iface;
+
+	linkmode_zero(sfp_support);
+
+	port = phy_get_sfp_port(phydev);
+	if (!port)
+		return -EINVAL;
+
+	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
+
+	if (phydev->n_ports == 1)
+		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
+
+	linkmode_and(sfp_support, port->supported, sfp_support);
+	linkmode_and(interfaces, interfaces, port->interfaces);
+
+	if (linkmode_empty(sfp_support)) {
+		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");
+		return -EINVAL;
+	}
+
+	iface = phy_caps_choose_sfp_interface(interfaces);
+	if (iface == PHY_INTERFACE_MODE_NA) {
+		dev_err(&phydev->mdio.dev, "PHY %s does not support the SFP module's requested MII interfaces\n",
+			phydev_name(phydev));
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
@@ -1646,6 +1728,7 @@ static int phy_setup_sfp_port(struct phy_device *phydev)
 	 * is a MII port.
 	 */
 	port->is_mii = true;
+	port->is_sfp = true;
 
 	phy_add_port(phydev, port);
 
@@ -3479,6 +3562,13 @@ static int phy_setup_ports(struct phy_device *phydev)
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
@@ -3514,6 +3604,25 @@ static int phy_setup_ports(struct phy_device *phydev)
 	return ret;
 }
 
+/**
+ * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
+ * @phydev: pointer to the PHY device to get the SFP port from
+ *
+ * Returns: The first active SFP (serdes) port of a PHY device, NULL if none
+ * exist.
+ */
+struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
+{
+	struct phy_port *port;
+
+	list_for_each_entry(port, &phydev->ports, head)
+		if (port->active && port->is_sfp)
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
index a6cd0465b059..a376fe83e999 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2168,6 +2168,8 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
 		       struct kernel_hwtstamp_config *config,
 		       struct netlink_ext_ack *extack);
 
+struct phy_port *phy_get_sfp_port(struct phy_device *phydev);
+
 extern const struct bus_type mdio_bus_type;
 extern const struct class mdio_bus_class;
 
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
index f47ac5f5ef9e..053c35c70071 100644
--- a/include/linux/phy_port.h
+++ b/include/linux/phy_port.h
@@ -49,6 +49,7 @@ struct phy_port_ops {
  * @active: Indicates if the port is currently part of the active link.
  * @is_mii: Indicates if this port is MII (Media Independent Interface),
  *          or MDI (Media Dependent Interface).
+ * @is_sfp: Indicates if this port drives an SFP cage.
  */
 struct phy_port {
 	struct list_head head;
@@ -67,6 +68,7 @@ struct phy_port {
 	unsigned int not_described:1;
 	unsigned int active:1;
 	unsigned int is_mii:1;
+	unsigned int is_sfp:1;
 };
 
 struct phy_port *phy_port_alloc(void);
-- 
2.49.0


