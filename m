Return-Path: <linux-arm-msm+bounces-77020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B841BD38A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE883C7BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3D3239562;
	Mon, 13 Oct 2025 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sJK4A5Qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C2326A0AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365964; cv=none; b=Yd7IVPBv8YOWNWIKt8DvzZiOfWR6YSlXrCR5JT2TWWfFf99kf0lTa8j7Yv0fBLFs3jBH9Iapbe+Y0kTEcd1jgbjSSRYOgw4QjqjXgHDDNI9wSbW/kP4SSQwxMW4cwz2GfNPi7oLQQ4eu93ThrBIR9KwGnaku0kTvxnWXGnfN8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365964; c=relaxed/simple;
	bh=KG0zuimVC19v6dTAbIfQj8BFM5DyWk6NgNwRKAX/hjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lfWLqPcM4eMop+HZ2DTuh6y4v40N4jC85t/sJiOpaaaHyla3+YC46fkdy9PV+Q8F0SjSH8az0767VsskBpBh+FFicXNI/nrXvd+JMuEQKi1n6TMpr/RyXzcJBkvN2kYT360pem5CndFWhaX1AnI2XwqoWLXFcQ04sgOA01h+gVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sJK4A5Qp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4365A1A12FF;
	Mon, 13 Oct 2025 14:32:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15F52606C6;
	Mon, 13 Oct 2025 14:32:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9E5B102F226F;
	Mon, 13 Oct 2025 16:32:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760365955; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7/QqhZmfuN9mfE2UUx1hJbkYusfiviRsg3vor+udg6o=;
	b=sJK4A5Qpg++PYniWMsRnFdRtgj9zkeJKGBzfW18b1RupuaUwB3y/z4BGwAtfvhEk/MHZv9
	HCDpRXwORI5/jRpYqwYYeZRRbvmGfjai83/bfI7OZF2YQQeiYxHW2frOfaUOcmfgDGD4hV
	FuFAnj/29JX71V43HH0JwOeZZXe66Y2R0DBRyM1RnQBcyg/Xb8voZA6tuBalcMsLEjixQi
	tdLuwjqUKAlIlWWdgvYJyE763oebVXTPmy83zLFN+KqdzYJTwhEw/jHrTHhCProVkrDY6D
	ciTIg1l2NafknxCmAKTHg7rObfK7Xb5S+GpOww2miH38fxuHhNfpfMES4dNYYA==
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
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v14 04/16] net: phy: Introduce PHY ports representation
Date: Mon, 13 Oct 2025 16:31:30 +0200
Message-ID: <20251013143146.364919-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

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
	connector-0 {
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 MAINTAINERS                  |   1 +
 drivers/net/phy/Makefile     |   2 +-
 drivers/net/phy/phy-caps.h   |   5 +
 drivers/net/phy/phy-core.c   |   6 ++
 drivers/net/phy/phy_caps.c   |  56 +++++++++++
 drivers/net/phy/phy_device.c | 185 +++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 135 +++++++++++++++++++++++++
 include/linux/ethtool.h      |  26 +++++
 include/linux/phy.h          |  55 +++++++++++
 include/linux/phy_port.h     |  96 ++++++++++++++++++
 10 files changed, 566 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f8a5ae66314..ddd04d11ad65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9288,6 +9288,7 @@ F:	include/linux/of_net.h
 F:	include/linux/phy.h
 F:	include/linux/phy_fixed.h
 F:	include/linux/phy_link_topology.h
+F:	include/linux/phy_port.h
 F:	include/linux/phylib_stubs.h
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 F:	include/linux/platform_data/mdio-gpio.h
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 76e0db40f879..3a34917adea7 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -3,7 +3,7 @@
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 				   linkmode.o phy_link_topology.o \
-				   phy_caps.o mdio_bus_provider.o
+				   phy_caps.o mdio_bus_provider.o phy_port.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_PHYLIB
diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index b7f0c6a3037a..c94b9c852563 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -60,4 +60,9 @@ const struct link_capabilities *
 phy_caps_lookup(int speed, unsigned int duplex, const unsigned long *supported,
 		bool exact);
 
+void phy_caps_medium_get_supported(unsigned long *supported,
+				   enum ethtool_link_medium medium,
+				   int lanes);
+u32 phy_caps_mediums_from_linkmodes(unsigned long *linkmodes);
+
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 605ca20ae192..6f825f63c1bf 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -4,6 +4,7 @@
  */
 #include <linux/export.h>
 #include <linux/phy.h>
+#include <linux/phy_port.h>
 #include <linux/of.h>
 
 #include "phylib.h"
@@ -163,7 +164,12 @@ EXPORT_SYMBOL_GPL(phy_interface_num_ports);
 
 static void __set_phy_supported(struct phy_device *phydev, u32 max_speed)
 {
+	struct phy_port *port;
+
 	phy_caps_linkmode_max_speed(max_speed, phydev->supported);
+
+	phy_for_each_port(phydev, port)
+		phy_caps_linkmode_max_speed(max_speed, port->supported);
 }
 
 /**
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index f3fbe5d127af..7bf62246f085 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -384,3 +384,59 @@ unsigned long phy_caps_from_interface(phy_interface_t interface)
 	return link_caps;
 }
 EXPORT_SYMBOL_GPL(phy_caps_from_interface);
+
+/**
+ * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
+ * @supported: After this call, contains all possible linkmodes on a given medium,
+ *	       and with the given number of lanes, or less.
+ * @medium: The medium to get the support from
+ * @lanes: The number of lanes used on the given medium
+ *
+ * If no match exists, the supported field is left untouched.
+ */
+void phy_caps_medium_get_supported(unsigned long *supported,
+				   enum ethtool_link_medium medium,
+				   int lanes)
+{
+	int i;
+
+	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
+		/* Special bits such as Autoneg, Pause, Asym_pause, etc. are
+		 * set and will be masked away by the port parent.
+		 */
+		if (link_mode_params[i].mediums == BIT(ETHTOOL_LINK_MEDIUM_NONE)) {
+			linkmode_set_bit(i, supported);
+			continue;
+		}
+
+		/* For most cases, min_lanes == lanes, except for 10/100BaseT that work
+		 * on 2 lanes but are compatible with 4 lanes mediums
+		 */
+		if (link_mode_params[i].mediums & BIT(medium) &&
+		    link_mode_params[i].min_lanes <= lanes)
+			linkmode_set_bit(i, supported);
+	}
+}
+EXPORT_SYMBOL_GPL(phy_caps_medium_get_supported);
+
+/**
+ * phy_caps_mediums_from_linkmodes() - Get all mediums from a linkmodes list
+ * @linkmodes: A bitset of linkmodes to get the mediums from
+ *
+ * Returns: A bitset of ETHTOOL_MEDIUM_XXX values corresponding to all medium
+ *	    types in the linkmodes list
+ */
+u32 phy_caps_mediums_from_linkmodes(unsigned long *linkmodes)
+{
+	const struct link_mode_info *linkmode;
+	u32 mediums = 0;
+	int i;
+
+	for_each_set_bit(i, linkmodes, __ETHTOOL_LINK_MODE_MASK_NBITS) {
+		linkmode = &link_mode_params[i];
+		mediums |= linkmode->mediums;
+	}
+
+	return mediums;
+}
+EXPORT_SYMBOL_GPL(phy_caps_mediums_from_linkmodes);
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7a67c900e79a..c44eb0c77c3a 100644
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
@@ -835,6 +836,13 @@ struct phy_device *phy_device_create(struct mii_bus *bus, int addr, u32 phy_id,
 
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
@@ -1578,6 +1586,51 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
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
+	if (port->is_mii) {
+		if (phydev->drv && phydev->drv->attach_mii_port)
+			ret = phydev->drv->attach_mii_port(phydev, port);
+	} else {
+		if (phydev->drv && phydev->drv->attach_mdi_port)
+			ret = phydev->drv->attach_mdi_port(phydev, port);
+	}
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
@@ -3313,6 +3366,131 @@ static int of_phy_leds(struct phy_device *phydev)
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
+
+	/* Let the PHY driver know that this port was never described anywhere.
+	 * This is the usual case, where we assume single-port PHY devices with
+	 * no SFP. In that case, the port supports exactly the same thing as
+	 * the PHY itself.
+	 *
+	 * However, this can also be because we have a combo-port PHY, with
+	 * only one port described in DT, through SFP for example.
+	 *
+	 * In that case, the PHY driver will be in charge of saying what we can
+	 * do on that non-represented port.
+	 */
+	port->not_described = true;
+	linkmode_copy(port->supported, phydev->supported);
+	port->mediums = phy_caps_mediums_from_linkmodes(port->supported);
+
+	phy_add_port(phydev, port);
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
+		if (port->active) {
+			phydev->port = phy_port_get_type(port);
+			break;
+		}
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
@@ -3450,6 +3628,11 @@ static int phy_probe(struct device *dev)
 		phydev->is_gigabit_capable = 1;
 
 	of_set_phy_supported(phydev);
+
+	err = phy_setup_ports(phydev);
+	if (err)
+		goto out;
+
 	phy_advertise_supported(phydev);
 
 	/* Get PHY default EEE advertising modes and handle them as potentially
@@ -3525,6 +3708,8 @@ static int phy_remove(struct device *dev)
 
 	phydev->state = PHY_DOWN;
 
+	phy_cleanup_ports(phydev);
+
 	sfp_bus_del_upstream(phydev->sfp_bus);
 	phydev->sfp_bus = NULL;
 
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
new file mode 100644
index 000000000000..cf897ed74c4c
--- /dev/null
+++ b/drivers/net/phy/phy_port.c
@@ -0,0 +1,135 @@
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
+#include "phy-caps.h"
+
+/**
+ * phy_port_alloc() - Allocate a new phy_port
+ *
+ * Returns: a newly allocated struct phy_port, or NULL.
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
+ * phy_port_destroy() - Free a struct phy_port
+ * @port: The port to destroy
+ */
+void phy_port_destroy(struct phy_port *port)
+{
+	kfree(port);
+}
+EXPORT_SYMBOL_GPL(phy_port_destroy);
+
+/**
+ * phy_of_parse_port() - Create a phy_port from a firmware representation
+ * @dn: device_node representation of the port, following the
+ *	ethernet-connector.yaml binding
+ *
+ * Returns: a newly allocated and initialized phy_port pointer, or an ERR_PTR.
+ */
+struct phy_port *phy_of_parse_port(struct device_node *dn)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
+	enum ethtool_link_medium medium;
+	struct phy_port *port;
+	const char *med_str;
+	u32 lanes, mediums = 0;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = fwnode_property_read_string(fwnode, "media", &med_str);
+	if (ret)
+		return ERR_PTR(ret);
+
+	medium = ethtool_str_to_medium(med_str);
+	if (medium == ETHTOOL_LINK_MEDIUM_NONE)
+		return ERR_PTR(-EINVAL);
+
+	mediums |= BIT(medium);
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
+ * phy_port_update_supported() - Setup the port->supported field
+ * @port: the port to update
+ *
+ * Once the port's medium list and number of lanes has been configured based
+ * on firmware, straps and vendor-specific properties, this function may be
+ * called to update the port's supported linkmodes list.
+ *
+ * Any mode that was manually set in the port's supported list remains set.
+ */
+void phy_port_update_supported(struct phy_port *port)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0 };
+	int i, lanes = 1;
+
+	/* If there's no lanes specified, we grab the default number of
+	 * lanes as the max of the default lanes for each medium
+	 */
+	if (!port->lanes)
+		for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
+			lanes = max_t(int, lanes, phy_medium_default_lanes(i));
+
+	port->lanes = lanes;
+
+	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST) {
+		linkmode_zero(supported);
+		phy_caps_medium_get_supported(supported, i, port->lanes);
+		linkmode_or(port->supported, port->supported, supported);
+	}
+}
+EXPORT_SYMBOL_GPL(phy_port_update_supported);
+
+/**
+ * phy_port_get_type() - get the PORT_* attribute for that port.
+ * @port: The port we want the information from
+ *
+ * Returns: A PORT_XXX value.
+ */
+int phy_port_get_type(struct phy_port *port)
+{
+	if (port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASET))
+		return PORT_TP;
+
+	if (phy_port_is_fiber(port))
+		return PORT_FIBRE;
+
+	return PORT_OTHER;
+}
+EXPORT_SYMBOL_GPL(phy_port_get_type);
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 183a4888b63f..292406dea438 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -227,6 +227,10 @@ extern const struct link_mode_info link_mode_params[];
 
 extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
 
+#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
+				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
+				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
+
 static inline const char *phy_mediums(enum ethtool_link_medium medium)
 {
 	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
@@ -235,6 +239,28 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
 	return ethtool_link_medium_names[medium];
 }
 
+static inline enum ethtool_link_medium ethtool_str_to_medium(const char *str)
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
 /* declare a link mode bitmap */
 #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
 	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482356..7630508bf520 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -327,6 +327,7 @@ static inline long rgmii_clock(int speed)
 struct device;
 struct kernel_hwtstamp_config;
 struct phylink;
+struct phy_port;
 struct sfp_bus;
 struct sfp_upstream_ops;
 struct sk_buff;
@@ -621,6 +622,9 @@ struct macsec_ops;
  * @master_slave_state: Current master/slave configuration
  * @mii_ts: Pointer to time stamper callbacks
  * @psec: Pointer to Power Sourcing Equipment control struct
+ * @ports: List of PHY ports structures
+ * @n_ports: Number of ports currently attached to the PHY
+ * @max_n_ports: Max number of ports this PHY can expose
  * @lock:  Mutex for serialization access to PHY
  * @state_queue: Work queue for state machine
  * @link_down_events: Number of times link was lost
@@ -758,6 +762,10 @@ struct phy_device {
 	struct mii_timestamper *mii_ts;
 	struct pse_control *psec;
 
+	struct list_head ports;
+	int n_ports;
+	int max_n_ports;
+
 	u8 mdix;
 	u8 mdix_ctrl;
 
@@ -780,6 +788,9 @@ struct phy_device {
 
 #define to_phy_device(__dev)	container_of_const(to_mdio_device(__dev), struct phy_device, mdio)
 
+#define phy_for_each_port(phydev, port) \
+	list_for_each_entry(port, &(phydev)->ports, head)
+
 /**
  * struct phy_tdr_config - Configuration of a TDR raw test
  *
@@ -1274,6 +1285,49 @@ struct phy_driver {
 	 * Returns the time in jiffies until the next update event.
 	 */
 	unsigned int (*get_next_update_time)(struct phy_device *dev);
+
+	/**
+	 * @attach_mii_port: Attach the given MII port to the PHY device
+	 * @dev: PHY device to notify
+	 * @port: The port being added
+	 *
+	 * Called when an MII port that needs to be driven by the PHY is found.
+	 *
+	 * The port that is being passed may or may not be initialized. If it is
+	 * already initialized, it is by the generic port representation from
+	 * devicetree, which superseeds any strapping or vendor-specific
+	 * properties.
+	 *
+	 * If the port isn't initialized, the port->mediums and port->lanes
+	 * fields must be set, possibly according to strapping information.
+	 *
+	 * The PHY driver must set the port->interfaces field to indicate the
+	 * possible MII modes that this PHY can output on the port.
+	 *
+	 * Returns 0, or an error code.
+	 */
+	int (*attach_mii_port)(struct phy_device *dev, struct phy_port *port);
+
+	/**
+	 * @attach_mdi_port: Attach the given MII port to the PHY device
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
+	 * fields must be set, possibly according to strapping information.
+	 *
+	 * Returns 0, or an error code.
+	 */
+	int (*attach_mdi_port)(struct phy_device *dev, struct phy_port *port);
 };
 #define to_phy_driver(d) container_of_const(to_mdio_common_driver(d),		\
 				      struct phy_driver, mdiodrv)
@@ -2039,6 +2093,7 @@ void phy_trigger_machine(struct phy_device *phydev);
 void phy_mac_interrupt(struct phy_device *phydev);
 void phy_start_machine(struct phy_device *phydev);
 void phy_stop_machine(struct phy_device *phydev);
+
 void phy_ethtool_ksettings_get(struct phy_device *phydev,
 			       struct ethtool_link_ksettings *cmd);
 int phy_ethtool_ksettings_set(struct phy_device *phydev,
diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
new file mode 100644
index 000000000000..f47ac5f5ef9e
--- /dev/null
+++ b/include/linux/phy_port.h
@@ -0,0 +1,96 @@
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
+ * @ops: Callback ops implemented by the port controller
+ * @lanes: The number of lanes (diff pairs) this port has, 0 if not applicable
+ * @mediums: Bitmask of the physical mediums this port provides access to
+ * @supported: The link modes this port can expose, if this port is MDI (not MII)
+ * @interfaces: The MII interfaces this port supports, if this port is MII
+ * @not_described: Indicates to the parent driver if this port isn't described,
+ *		   so it's up to the parent to filter its capabilities.
+ * @active: Indicates if the port is currently part of the active link.
+ * @is_mii: Indicates if this port is MII (Media Independent Interface),
+ *          or MDI (Media Dependent Interface).
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
+	unsigned int not_described:1;
+	unsigned int active:1;
+	unsigned int is_mii:1;
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
2.49.0


