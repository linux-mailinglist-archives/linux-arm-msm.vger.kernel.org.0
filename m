Return-Path: <linux-arm-msm+bounces-47879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20786A33C59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 11:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B568F1686DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 10:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223B3213E63;
	Thu, 13 Feb 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cz0XE4tC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A120C49C;
	Thu, 13 Feb 2025 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441784; cv=none; b=kIJRS9xuxDsfi2SMTkHLwsxeh62mFf+13HQq9uL4Shk+3z7liv6+TjnDSnRlv9n3NfOBXUuGegoTYJZByQeAgTLsDCkJhqMWf3vwXHlqkqv+HZ/rGHOrNwL7O0IYDER9Dh2PnX71YS6LRJdlE1ZKFvnMxnHH/7sq7yEPurPy3XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441784; c=relaxed/simple;
	bh=YphZfYccDOOS5+FcfPbPW+psV8pdyQjed5vW/FhyTjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQfW6Mw1vZBCmvzISw25Yc7JBS3xfJq4xci5i5F68rR4ecOlnufhNIUGDHj7haEyuD7nPgRGUxF0SMEX7wn+YxMoEAcPcOzFCcoK+vFFX4f4C3nEXEvVBZTQFRe4E7EKsmSERxcrN+ipK2CxiJ/wh5DlMdyrVN5tQmo7qzWyufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Cz0XE4tC; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EE23432C5;
	Thu, 13 Feb 2025 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739441779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mK3rgSN2YlUqdiyDeyCXBi8QpRm77XQlkPvYE7qZoeA=;
	b=Cz0XE4tCv+iMjvnRrKbP/sS7lrXTN1JNhVlpQlqAy+Zf/Z+f7EDL/TdybdfG7XsvdImWr0
	7jSYlK+zfMCtHuGitEQtA0vmfzt0gPCzMcFl+IRoKnqU0PmgVAx3u3PaNmcOCN1YTpUdJM
	qZxUzTM8ePOHUXEN0A8ySwrYxUVpfeHz6eREvH/YV4hUDTo7YU0h/QdIos80wrVYutDKNe
	ajIKdQUhFkDkEhbozP/Ta5tzaoO+iUKilCdn3bm0q2Tu8EwOLX/qWuo+BucPrwiZZ98GG9
	BGZjBAOh1t+bq2EaWrMoY+3Kt1UkP7C42/LESBdXzRlh+6XhHi4sl7S6OVEeug==
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
Subject: [PATCH net-next v4 05/15] net: phy: Create a phy_port for PHY-driven SFPs
Date: Thu, 13 Feb 2025 11:15:53 +0100
Message-ID: <20250213101606.1154014-6-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Some PHY devices may be used as media-converters to drive SFP ports (for
example, to allow using SFP when the SoC can only output RGMII). This is
already supported to some extend by allowing PHY drivers to registers
themselves as being SFP upstream.

However, the logic to drive the SFP can actually be split to a per-port
control logic, allowing support for multi-port PHYs, or PHYs that can
either drive SFPs or Copper.

To that extent, create a phy_port when registering an SFP bus onto a
PHY. This port is considered a "serdes" port, in that it can feed data
to anther entity on the link. The PHY driver needs to specify the
various PHY_INTERFACE_MODE_XXX that this port supports.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4: Fixed phylink_interfaces_to_linkmodes() to use |= instead of =

 drivers/net/phy/phy_device.c | 21 +++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 10 ++++++++++
 drivers/net/phy/phylink.c    | 32 ++++++++++++++++++++++++++++++++
 include/linux/phylink.h      |  2 ++
 4 files changed, 65 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index fc24fb001b92..fc0b3a344cee 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1460,6 +1460,23 @@ static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
 	phydev->n_ports--;
 }
 
+static int phy_setup_sfp_port(struct phy_device *phydev)
+{
+	struct phy_port *port = phy_port_alloc();
+
+	if (!port)
+		return -ENOMEM;
+
+	port->parent_type = PHY_PORT_PHY;
+	port->phy = phydev;
+
+	port->is_serdes = true;
+
+	phy_add_port(phydev, port);
+
+	return 0;
+}
+
 /**
  * phy_sfp_probe - probe for a SFP cage attached to this PHY device
  * @phydev: Pointer to phy_device
@@ -1481,6 +1498,10 @@ int phy_sfp_probe(struct phy_device *phydev,
 		ret = sfp_bus_add_upstream(bus, phydev, ops);
 		sfp_bus_put(bus);
 	}
+
+	if (phydev->sfp_bus)
+		ret = phy_setup_sfp_port(phydev);
+
 	return ret;
 }
 EXPORT_SYMBOL(phy_sfp_probe);
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index 94e21523e2b7..6680fcaf4d6e 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -7,6 +7,7 @@
 #include <linux/linkmode.h>
 #include <linux/of.h>
 #include <linux/phy_port.h>
+#include <linux/phylink.h>
 
 /**
  * phy_port_alloc: Allocate a new phy_port
@@ -146,6 +147,15 @@ void phy_port_update_supported(struct phy_port *port)
 		ethtool_medium_get_supported(supported, i, port->lanes);
 		linkmode_or(port->supported, port->supported, supported);
 	}
+
+	/* Serdes ports supported may through SFP may not have any medium set,
+	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, derive
+	 * the supported list based on these interfaces
+	 */
+	if (port->is_serdes && linkmode_empty(supported))
+		phylink_interfaces_to_linkmodes(port->supported,
+						port->interfaces);
+
 }
 EXPORT_SYMBOL_GPL(phy_port_update_supported);
 
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 214b62fba991..a49edc012636 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -673,6 +673,38 @@ static void phylink_validate_mask_caps(unsigned long *supported,
 	linkmode_and(state->advertising, state->advertising, mask);
 }
 
+/**
+ * phylink_interfaces_to_linkmodes() - List all possible linkmodes based on a
+ *				       set of supported interfaces, assuming no
+ *				       rate matching.
+ * @linkmodes: the supported linkmodes
+ * @interfaces: Set of interfaces (PHY_INTERFACE_MODE_XXX)
+ *
+ * Compute the exhaustive list of modes that can conceivably be achieved from a
+ * set of MII interfaces. This is derived from the possible speeds and duplex
+ * achievable from these interfaces. This list is likely too exhaustive (there
+ * may not exist any device out there that can convert from an interface to a
+ * linkmode) and it needs further filtering based on real HW capabilities.
+ */
+void phylink_interfaces_to_linkmodes(unsigned long *linkmodes,
+				     const unsigned long *interfaces)
+{
+	phy_interface_t interface;
+	unsigned long caps = 0;
+
+	linkmode_zero(linkmodes);
+
+	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
+		caps = phylink_get_capabilities(interface,
+						GENMASK(__fls(MAC_400000FD),
+							__fls(MAC_10HD)),
+						RATE_MATCH_NONE);
+
+	phylink_set(linkmodes, Autoneg);
+	phylink_caps_to_linkmodes(linkmodes, caps);
+}
+EXPORT_SYMBOL_GPL(phylink_interfaces_to_linkmodes);
+
 static int phylink_validate_mac_and_pcs(struct phylink *pl,
 					unsigned long *supported,
 					struct phylink_link_state *state)
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 898b00451bbf..ffd8dd32ff3d 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -176,6 +176,8 @@ struct phylink_config {
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
+void phylink_interfaces_to_linkmodes(unsigned long *linkmodes,
+				     const unsigned long *interfaces);
 
 /**
  * struct phylink_mac_ops - MAC operations structure.
-- 
2.48.1


