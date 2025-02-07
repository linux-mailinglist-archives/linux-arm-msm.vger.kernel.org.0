Return-Path: <linux-arm-msm+bounces-47192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2220A2D09F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E9316CA25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419DC1DE3A7;
	Fri,  7 Feb 2025 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AAbI/D51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2D502BE;
	Fri,  7 Feb 2025 22:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967809; cv=none; b=KHB9KWCXRfMgYnifk15rGPFKwFzxVNlMRQCwPJFnWS9BqYr8gIQ6UaBz5JUf+tqhdAcWMTizopWrmyxtOindB0ROsapVtTHYGOl9I2i3Or+HQCZOoSe+RkPWqM1dtfMrYrdheYqpueF5o814/5RYYZUTn0ObqQntqINlxNI+YGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967809; c=relaxed/simple;
	bh=3AnhjIxNYmrqrrxIdfDyyDD9QrBSOjxyusfVcZ7Bs8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jq7hycBa5KDjs+kzq54bag4z7OKjMS8dk0BaGBrGljh+7bK/eBXIsuOXr/QRmFYsaX7gbQB7QUapzwiVfrl1N4iRrjDMDerpkmH5s53I2AaNN552R/tnF2BfXjE13IozyH8/VnXpic1eP+8hV4u4RAzSNG+DBsmtl4b1whsAtv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AAbI/D51; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DD0920454;
	Fri,  7 Feb 2025 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738967804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7X/xfuwQAnckYKAbaWdakohD7UPO800xifxWxKM7dk0=;
	b=AAbI/D51rQUGiVi8zQedYdZxA9AQ0bfItfebJD9CRcGpcgS7XXfBeXJilyG2ULyr3xUeKW
	zB1eL5uaPPTuPJY+v41K3hh3INu4gkiQzHr8qpXnHejNt5Ug5GbsjOlDJrof4mQ7oo2lOm
	XFE5GWOB2ykFf/Xc4zHXS4dXIEOpICt+SpEex0OdaOCtwdNtzS3A4wmzIlLEprdhiCq+GU
	wLsUKuomkqgpAzbx30eQDZLCcIT5MTcAVfNo5IyVKrigusi9M/rWJYGmpid2TAybtqvTTv
	OCTshz8++SIUUXWbAaiiPtoV5tDBnSStJm5G7jE2bI57dHb0PyqTEQblqm8A2A==
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
Subject: [PATCH net-next 03/13] net: phy: Introduce PHY ports representation
Date: Fri,  7 Feb 2025 23:36:22 +0100
Message-ID: <20250207223634.600218-4-maxime.chevallier@bootlin.com>
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

Ethernet provides a wide variety of layer 1 protocols and standards for
data transmission. The front-facing ports of an interface have their own
complexity and configurability.

Introduce a representation of these front-facing ports. The current code
is minimalistic and only support ports controlled by PHY devices, but
the plan is to extend that to SFP as well as raw Ethernet MACs that
don't use PHY devices.

This minimal port representation allows describing the media and number
of lanes of a port. From that information, we can derive the linkmodes
usable on the port, which can be used to limit the capabilities of an
interface.

For now, the port lanes and medium is derived from devicetree, defined
by the PHY driver, or populated with default values (as we assume that
all PHYs expose at least one port).

The typical example is 100M ethernet. 100BaseT can work using only 2
lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
capable PHY is wired to its RJ45 port through 2 lanes only, we have no
way of detecting that. The "max-speed" DT property can be used, but a
more accurate representation can be used :

mdi {
	port@0 {
		media = "BaseT";
		lanes = <2>;
	};
};

From that information, we can derive the max speed reachable on the
port.

Another benefit of having that is to avoid vendor-specific DT properties
(micrel,fiber-mode or ti,fiber-mode).

This basic representation is meant to be expanded, by the introduction
of port ops, userspace listing of ports, and support for multi-port
devices.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/Makefile     |   2 +-
 drivers/net/phy/phy_device.c | 168 +++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 166 ++++++++++++++++++++++++++++++++++
 include/linux/ethtool.h      |  15 ++++
 include/linux/phy.h          |  31 +++++++
 include/linux/phy_port.h     |  92 +++++++++++++++++++
 6 files changed, 473 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index c8dac6e92278..de1415a46629 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -2,7 +2,7 @@
 # Makefile for Linux PHY drivers
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
-				   linkmode.o phy_link_topology.o
+				   linkmode.o phy_link_topology.o phy_port.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_MDIO_DEVICE
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 46713d27412b..df016d344c55 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -30,6 +30,7 @@
 #include <linux/phylib_stubs.h>
 #include <linux/phy_led_triggers.h>
 #include <linux/phy_link_topology.h>
+#include <linux/phy_port.h>
 #include <linux/pse-pd/pse.h>
 #include <linux/property.h>
 #include <linux/ptp_clock_kernel.h>
@@ -656,6 +657,13 @@ struct phy_device *phy_device_create(struct mii_bus *bus, int addr, u32 phy_id,
 
 	dev->state = PHY_DOWN;
 	INIT_LIST_HEAD(&dev->leds);
+	INIT_LIST_HEAD(&dev->ports);
+
+	/* The driver's probe function must change that to the real number
+	 * of ports possible on the PHY. We assume by default we are dealing
+	 * with a single-port PHY
+	 */
+	dev->max_n_ports = 1;
 
 	mutex_init(&dev->lock);
 	INIT_DELAYED_WORK(&dev->state_queue, phy_state_machine);
@@ -1412,6 +1420,46 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 }
 EXPORT_SYMBOL(phy_sfp_detach);
 
+static int phy_add_port(struct phy_device *phydev, struct phy_port *port)
+{
+	int ret = 0;
+
+	if (phydev->n_ports == phydev->max_n_ports)
+		return -EBUSY;
+
+	/* We set all ports as active by default, PHY drivers may deactivate
+	 * them (when unused)
+	 */
+	port->active = true;
+
+	if (phydev->drv && phydev->drv->attach_port)
+		ret = phydev->drv->attach_port(phydev, port);
+
+	if (ret)
+		return ret;
+
+	/* The PHY driver might have added, removed or set medium/lanes info,
+	 * so update the port supported accordingly.
+	 */
+	phy_port_update_supported(port);
+
+	list_add(&port->head, &phydev->ports);
+
+	phydev->n_ports++;
+
+	return 0;
+}
+
+static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
+{
+	if (!phydev->n_ports)
+		return;
+
+	list_del(&port->head);
+
+	phydev->n_ports--;
+}
+
 /**
  * phy_sfp_probe - probe for a SFP cage attached to this PHY device
  * @phydev: Pointer to phy_device
@@ -3405,6 +3453,119 @@ static int of_phy_leds(struct phy_device *phydev)
 	return 0;
 }
 
+static void phy_cleanup_ports(struct phy_device *phydev)
+{
+	struct phy_port *tmp, *port;
+
+	list_for_each_entry_safe(port, tmp, &phydev->ports, head) {
+		phy_del_port(phydev, port);
+		phy_port_destroy(port);
+	}
+}
+
+static int phy_default_setup_single_port(struct phy_device *phydev)
+{
+	struct phy_port *port = phy_port_alloc();
+
+	if (!port)
+		return -ENOMEM;
+
+	port->parent_type = PHY_PORT_PHY;
+	port->phy = phydev;
+	linkmode_copy(port->supported, phydev->supported);
+
+	phy_add_port(phydev, port);
+
+	/* default medium is copper */
+	if (!port->mediums)
+		port->mediums |= BIT(ETHTOOL_LINK_MEDIUM_BASET);
+
+	return 0;
+}
+
+static int of_phy_ports(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct device_node *mdi;
+	struct phy_port *port;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_OF_MDIO))
+		return 0;
+
+	if (!node)
+		return 0;
+
+	mdi = of_get_child_by_name(node, "mdi");
+	if (!mdi)
+		return 0;
+
+	for_each_available_child_of_node_scoped(mdi, port_node) {
+		port = phy_of_parse_port(port_node);
+		if (IS_ERR(port)) {
+			err = PTR_ERR(port);
+			goto out_err;
+		}
+
+		port->parent_type = PHY_PORT_PHY;
+		port->phy = phydev;
+		err = phy_add_port(phydev, port);
+		if (err)
+			goto out_err;
+	}
+	of_node_put(mdi);
+
+	return 0;
+
+out_err:
+	phy_cleanup_ports(phydev);
+	of_node_put(mdi);
+	return err;
+}
+
+static int phy_setup_ports(struct phy_device *phydev)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(ports_supported);
+	struct phy_port *port;
+	int ret;
+
+	ret = of_phy_ports(phydev);
+	if (ret)
+		return ret;
+
+	if (phydev->n_ports < phydev->max_n_ports) {
+		ret = phy_default_setup_single_port(phydev);
+		if (ret)
+			goto out;
+	}
+
+	linkmode_zero(ports_supported);
+
+	/* Aggregate the supported modes, which are made-up of :
+	 *  - What the PHY itself supports
+	 *  - What the sum of all ports support
+	 */
+	list_for_each_entry(port, &phydev->ports, head)
+		if (port->active)
+			linkmode_or(ports_supported, ports_supported,
+				    port->supported);
+
+	if (!linkmode_empty(ports_supported))
+		linkmode_and(phydev->supported, phydev->supported,
+			     ports_supported);
+
+	/* For now, the phy->port field is set as the first active port's type */
+	list_for_each_entry(port, &phydev->ports, head)
+		if (port->active)
+			phydev->port = phy_port_get_type(port);
+
+	return 0;
+
+out:
+	phy_cleanup_ports(phydev);
+	return ret;
+}
+
 /**
  * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
  * @fwnode: pointer to the mdio_device's fwnode
@@ -3554,6 +3715,11 @@ static int phy_probe(struct device *dev)
 		phydev->is_gigabit_capable = 1;
 
 	of_set_phy_supported(phydev);
+
+	err = phy_setup_ports(phydev);
+	if (err)
+		goto out;
+
 	phy_advertise_supported(phydev);
 
 	/* Get PHY default EEE advertising modes and handle them as potentially
@@ -3630,6 +3796,8 @@ static int phy_remove(struct device *dev)
 
 	phydev->state = PHY_DOWN;
 
+	phy_cleanup_ports(phydev);
+
 	sfp_bus_del_upstream(phydev->sfp_bus);
 	phydev->sfp_bus = NULL;
 
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
new file mode 100644
index 000000000000..3a7bdc44b556
--- /dev/null
+++ b/drivers/net/phy/phy_port.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Framework to drive Ethernet ports
+ *
+ * Copyright (c) 2024 Maxime Chevallier <maxime.chevallier@bootlin.com>
+ */
+
+#include <linux/linkmode.h>
+#include <linux/of.h>
+#include <linux/phy_port.h>
+
+/**
+ * phy_port_alloc: Allocate a new phy_port
+ *
+ * Returns a newly allocated struct phy_port, or NULL.
+ */
+struct phy_port *phy_port_alloc(void)
+{
+	struct phy_port *port;
+
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return NULL;
+
+	linkmode_zero(port->supported);
+	INIT_LIST_HEAD(&port->head);
+
+	return port;
+}
+EXPORT_SYMBOL_GPL(phy_port_alloc);
+
+/**
+ * phy_port_destroy: Free a struct phy_port
+ */
+void phy_port_destroy(struct phy_port *port)
+{
+	kfree(port);
+}
+EXPORT_SYMBOL_GPL(phy_port_destroy);
+
+static void ethtool_medium_get_supported(unsigned long *supported,
+					 enum ethtool_link_medium medium,
+					 int lanes)
+{
+	int i;
+
+	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
+		/* Special bits such as Autoneg, Pause, Asym_pause, etc. are
+		 * set and will be masked away by the port parent.
+		 */
+		if (link_mode_params[i].medium == ETHTOOL_LINK_MEDIUM_NONE) {
+			linkmode_set_bit(i, supported);
+			continue;
+		}
+
+		/* For most cases, min_lanes == lanes, except for 10/100BaseT that work
+		 * on 2 lanes but are compatible with 4 lanes mediums
+		 */
+		if (link_mode_params[i].medium == medium &&
+		    link_mode_params[i].lanes >= lanes &&
+		    link_mode_params[i].min_lanes <= lanes) {
+			linkmode_set_bit(i, supported);
+		}
+	}
+}
+
+static enum ethtool_link_medium ethtool_str_to_medium(const char *str)
+{
+	int i;
+
+	for (i = 0; i < __ETHTOOL_LINK_MEDIUM_LAST; i++)
+		if (!strcmp(phy_mediums(i), str))
+			return i;
+
+	return ETHTOOL_LINK_MEDIUM_NONE;
+}
+
+/**
+ * phy_of_parse_port: Create a phy_port from a firmware representation
+ *
+ * Returns a newly allocated and initialized phy_port pointer, or an ERR_PTR.
+ */
+struct phy_port *phy_of_parse_port(struct device_node *dn)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
+	enum ethtool_link_medium medium;
+	struct phy_port *port;
+	struct property *prop;
+	const char *med_str;
+	u32 lanes, mediums = 0;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
+	if (ret)
+		lanes = 0;
+
+	ret = fwnode_property_read_string(fwnode, "media", &med_str);
+	if (ret)
+		return ERR_PTR(ret);
+
+	of_property_for_each_string(to_of_node(fwnode), "media", prop, med_str) {
+		medium = ethtool_str_to_medium(med_str);
+		if (medium == ETHTOOL_LINK_MEDIUM_NONE)
+			return ERR_PTR(-EINVAL);
+
+		mediums |= BIT(medium);
+	}
+
+	if (!mediums)
+		return ERR_PTR(-EINVAL);
+
+	port = phy_port_alloc();
+	if (!port)
+		return ERR_PTR(-ENOMEM);
+
+	port->lanes = lanes;
+	port->mediums = mediums;
+
+	return port;
+}
+EXPORT_SYMBOL_GPL(phy_of_parse_port);
+
+/**
+ * phy_port_update_supported: Setup the port->supported field
+ * port: the port to update
+ *
+ * Once the port's medium list and number of lanes has been configured based
+ * on firmware, straps and vendor-specific properties, this function may be
+ * called to update the port's supported linkmodes list.
+ *
+ * Any mode that was manually set in the port's supported list remains set.
+ */
+void phy_port_update_supported(struct phy_port *port)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+	int i, lanes = 1;
+
+	/* If there's no lanes specified, we grab the default number of
+	 * lanes as the max of the default lanes for each medium
+	 */
+	if (!port->lanes)
+		for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
+			lanes = max_t(int, lanes, phy_medium_default_lanes(i));
+
+	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST) {
+		linkmode_zero(supported);
+		ethtool_medium_get_supported(supported, i, port->lanes);
+		linkmode_or(port->supported, port->supported, supported);
+	}
+}
+EXPORT_SYMBOL_GPL(phy_port_update_supported);
+
+/**
+ * phy_port_get_type: get the PORT_* attribut for that port.
+ */
+int phy_port_get_type(struct phy_port *port)
+{
+	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)
+		return PORT_TP;
+
+	if (phy_port_is_fiber(port) ||
+	    (port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX)))
+		return PORT_FIBRE;
+
+	return PORT_OTHER;
+}
+EXPORT_SYMBOL_GPL(phy_port_get_type);
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 519a90ce24d3..32fe062b715c 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -227,6 +227,10 @@ enum ethtool_link_medium {
 	__ETHTOOL_LINK_MEDIUM_LAST,
 };
 
+#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
+				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
+				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
+
 static inline const char *phy_mediums(enum ethtool_link_medium medium)
 {
 	switch (medium) {
@@ -258,6 +262,17 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
 	}
 }
 
+static inline int phy_medium_default_lanes(enum ethtool_link_medium medium)
+{
+	/* Let's consider that the default BaseT ethernet is BaseT4, i.e.
+	 * Gigabit Ethernet.
+	 */
+	if (medium == ETHTOOL_LINK_MEDIUM_BASET)
+		return 4;
+
+	return 1;
+}
+
 struct link_mode_info {
 	int                             speed;
 	u8                              min_lanes;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 19f076a71f94..17bc287c1866 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -316,6 +316,7 @@ static inline long rgmii_clock(int speed)
 struct device;
 struct kernel_hwtstamp_config;
 struct phylink;
+struct phy_port;
 struct sfp_bus;
 struct sfp_upstream_ops;
 struct sk_buff;
@@ -642,6 +643,9 @@ struct macsec_ops;
  * @master_slave_state: Current master/slave configuration
  * @mii_ts: Pointer to time stamper callbacks
  * @psec: Pointer to Power Sourcing Equipment control struct
+ * @ports: List of PHY ports structures
+ * n_ports: Number of ports currently attached to the PHY
+ * @max_n_ports: Max number of ports this PHY can expose
  * @lock:  Mutex for serialization access to PHY
  * @state_queue: Work queue for state machine
  * @link_down_events: Number of times link was lost
@@ -734,6 +738,7 @@ struct phy_device {
 
 	/* Host supported PHY interface types. Should be ignored if empty. */
 	DECLARE_PHY_INTERFACE_MASK(host_interfaces);
+	DECLARE_PHY_INTERFACE_MASK(sfp_bus_interfaces);
 
 #ifdef CONFIG_LED_TRIGGER_PHY
 	struct phy_led_trigger *phy_led_triggers;
@@ -776,6 +781,10 @@ struct phy_device {
 	struct mii_timestamper *mii_ts;
 	struct pse_control *psec;
 
+	struct list_head ports;
+	int n_ports;
+	int max_n_ports;
+
 	u8 mdix;
 	u8 mdix_ctrl;
 
@@ -1273,6 +1282,27 @@ struct phy_driver {
 	 */
 	int (*led_polarity_set)(struct phy_device *dev, int index,
 				unsigned long modes);
+
+	/**
+	 * @attach_port: Indicates to the PHY driver that a port is detected
+	 * @dev: PHY device to notify
+	 * @port: The port being added
+	 *
+	 * Called when a port that needs to be driven by the PHY is found. The
+	 * number of time this will be called depends on phydev->max_n_ports,
+	 * which the driver can change in .probe().
+	 *
+	 * The port that is being passed may or may not be initialized. If it is
+	 * already initialized, it is by the generic port representation from
+	 * devicetree, which superseeds any strapping or vendor-specific
+	 * properties.
+	 *
+	 * If the port isn't initialized, the port->mediums and port->lanes
+	 * fields must be set, possibly according to stapping information.
+	 *
+	 * Returns 0, or an error code.
+	 */
+	int (*attach_port)(struct phy_device *dev, struct phy_port *port);
 };
 #define to_phy_driver(d) container_of_const(to_mdio_common_driver(d),		\
 				      struct phy_driver, mdiodrv)
@@ -2083,6 +2113,7 @@ void phy_trigger_machine(struct phy_device *phydev);
 void phy_mac_interrupt(struct phy_device *phydev);
 void phy_start_machine(struct phy_device *phydev);
 void phy_stop_machine(struct phy_device *phydev);
+
 void phy_ethtool_ksettings_get(struct phy_device *phydev,
 			       struct ethtool_link_ksettings *cmd);
 int phy_ethtool_ksettings_set(struct phy_device *phydev,
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
new file mode 100644
index 000000000000..5dfad5157601
--- /dev/null
+++ b/include/linux/phy_port.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __PHY_PORT_H
+#define __PHY_PORT_H
+
+#include <linux/ethtool.h>
+#include <linux/types.h>
+#include <linux/phy.h>
+
+struct phy_port;
+
+/**
+ * enum phy_port_parent - The device this port is attached to
+ *
+ * @PHY_PORT_PHY: Indicates that the port is driven by a PHY device
+ */
+enum phy_port_parent {
+	PHY_PORT_PHY,
+};
+
+struct phy_port_ops {
+	/* Sometimes, the link state can be retrieved from physical,
+	 * out-of-band channels such as the LOS signal on SFP. These
+	 * callbacks allows notifying the port about state changes
+	 */
+	void (*link_up)(struct phy_port *port);
+	void (*link_down)(struct phy_port *port);
+
+	/* If the port acts as a Media Independent Interface (Serdes port),
+	 * configures the port with the relevant state and mode. When enable is
+	 * not set, interface should be ignored
+	 */
+	int (*configure_mii)(struct phy_port *port, bool enable, phy_interface_t interface);
+};
+
+/**
+ * struct phy_port - A representation of a network device physical interface
+ *
+ * @head: Used by the port's parent to list ports
+ * @parent_type: The type of device this port is directly connected to
+ * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
+ * @lanes: The number of lanes (diff pairs) this port has, 0 if not applicable
+ * @medium: The physical medium this port provides access to
+ * @supported: The link modes this port can expose, if this port is MDI (not MII)
+ * @interfaces: The MII interfaces this port supports, if this port is MII
+ * @active: Indicates if the port is currently part of the active link.
+ * @is_serdes: Indicates if this port is Serialised MII (Media Independent
+ *	       Interface), or an MDI (Media Dependent Interface).
+ */
+struct phy_port {
+	struct list_head head;
+	enum phy_port_parent parent_type;
+	union {
+		struct phy_device *phy;
+	};
+
+	const struct phy_port_ops *ops;
+
+	int lanes;
+	unsigned long mediums;
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
+
+	unsigned int active:1;
+	unsigned int is_serdes:1;
+};
+
+struct phy_port *phy_port_alloc(void);
+void phy_port_destroy(struct phy_port *port);
+
+static inline struct phy_device *port_phydev(struct phy_port *port)
+{
+	return port->phy;
+}
+
+struct phy_port *phy_of_parse_port(struct device_node *dn);
+
+static inline bool phy_port_is_copper(struct phy_port *port)
+{
+	return port->mediums == BIT(ETHTOOL_LINK_MEDIUM_BASET);
+}
+
+static inline bool phy_port_is_fiber(struct phy_port *port)
+{
+	return !!(port->mediums & ETHTOOL_MEDIUM_FIBER_BITS);
+}
+
+void phy_port_update_supported(struct phy_port *port);
+
+int phy_port_get_type(struct phy_port *port);
+
+#endif
-- 
2.48.1


