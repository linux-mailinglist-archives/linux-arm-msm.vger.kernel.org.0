Return-Path: <linux-arm-msm+bounces-88009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A389DD0395E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D6E33049F09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B496036B048;
	Thu,  8 Jan 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O30LX8JG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2BD3904CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859302; cv=none; b=JB4/7gwblXTu7zkuw+rAEEfPjWVsratEdtfU3abbX5Ctl+qJlKjK6BWfMwUJKXPp+0ok5ZYc7t/cZ6G9wShcKdLEBwrI7gPKjbmOdnk5wXTT8KwHF7GyZBzP/C+oowqx5F/oWNg8ZVthhWdFIpI5zMYt6fEnla9yB6DaN6uSZTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859302; c=relaxed/simple;
	bh=fj4aYWubxD7Qhp3req5/jBS7peIh15koNSi6lWQiRYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcFYRfBz+zRL5L0oCYL7C1FCXczNklmFFTJTj6qb1fe22i8GHO9+RG3q0xLSWk+tpyPQ01MItkS33uTiiKTEXXjyEz7Ps+XvpOqWto7SravGZxgOwLTeecMvQYb9ARepl9t0x7ZqCuJvztXz8cZOFGU/MtiWXNRT0/ykXS5pNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O30LX8JG; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2FB7C1ECAF;
	Thu,  8 Jan 2026 08:00:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F074B606B6;
	Thu,  8 Jan 2026 08:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53B98103C87D2;
	Thu,  8 Jan 2026 09:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767859279; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KGToPETKc3PdM56RulXfZZRgLZaCtwBU1/AJSBG3GEM=;
	b=O30LX8JG3oOvr1XT9SicmyIO/CEtf7b0kvfbxzk5Es0ivydxE7m3imJ0Yz3w1+we6u9CTi
	wRb2MtMyiBTl3ekR6iwjSkYg7UOpiG18Y6aSN6lFnX5LPcYCp6MT9UH4YMTZFI/TcxtSA3
	SOTgXleAK1vWZUUwJgaLNhfJew2t0gvgwZEnglixQbLTACN8gD/JhD3+mn8LkoPk5pSaRd
	JFVZbfXrMD2XOweyoOZkwEHg0+zFHeZmhcErKCUns4MS68id6zpHxcnQ61PevfV5qsbFwt
	d37sgQrUuRP9TVO+rI/GHOu5+73FnfeUQW2HJoM25Zw06B8tlcf+HTsvaQFjgw==
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
Subject: [PATCH net-next v22 07/14] net: phy: Introduce generic SFP handling for PHY drivers
Date: Thu,  8 Jan 2026 09:00:32 +0100
Message-ID: <20260108080041.553250-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 107 +++++++++++++++++++++++++++++++++++
 include/linux/phy.h          |   2 +
 include/linux/phy_port.h     |   2 +
 3 files changed, 111 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 3fc3a30fe7ed..0d9eca84081e 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1598,6 +1598,86 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 }
 EXPORT_SYMBOL(phy_sfp_detach);
 
+static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
+	struct phy_device *phydev = upstream;
+	const struct sfp_module_caps *caps;
+	struct phy_port *port;
+
+	phy_interface_t iface;
+
+	linkmode_zero(sfp_support);
+
+	port = phy_get_sfp_port(phydev);
+	if (!port)
+		return -EINVAL;
+
+	caps = sfp_get_module_caps(phydev->sfp_bus);
+
+	linkmode_and(sfp_support, port->supported, caps->link_modes);
+	if (linkmode_empty(sfp_support)) {
+		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");
+		return -EINVAL;
+	}
+
+	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
+	if (iface == PHY_INTERFACE_MODE_NA) {
+		dev_err(&phydev->mdio.dev, "PHY %s does not support the SFP module's requested MII interfaces\n",
+			phydev_name(phydev));
+		return -EINVAL;
+	}
+
+	if (phydev->n_ports == 1)
+		phydev->port = caps->port;
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
@@ -1658,6 +1738,7 @@ static int phy_setup_sfp_port(struct phy_device *phydev)
 	 * is a MII port.
 	 */
 	port->is_mii = true;
+	port->is_sfp = true;
 
 	/* The port->supported and port->interfaces list will be populated
 	 * when attaching the port to the phydev.
@@ -3505,6 +3586,13 @@ static int phy_setup_ports(struct phy_device *phydev)
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
@@ -3540,6 +3628,25 @@ static int phy_setup_ports(struct phy_device *phydev)
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
index b7e769b52e6c..eb7fd533b0e4 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2455,6 +2455,8 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
 		       struct kernel_hwtstamp_config *config,
 		       struct netlink_ext_ack *extack);
 
+struct phy_port *phy_get_sfp_port(struct phy_device *phydev);
+
 extern const struct bus_type mdio_bus_type;
 extern const struct class mdio_bus_class;
 
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
index ce0208fbccf7..550c3f4ab19f 100644
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


