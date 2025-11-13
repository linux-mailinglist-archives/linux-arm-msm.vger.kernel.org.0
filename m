Return-Path: <linux-arm-msm+bounces-81542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF7C5638D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F62F351056
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 08:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F87334691;
	Thu, 13 Nov 2025 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="myda6n+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1C33438F;
	Thu, 13 Nov 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021686; cv=none; b=fHchtmsZU8axHyCEtPPchzxz5BqvH09l1zpOSEDO9/p+gnbW2M3qYsXQyUV2GZn2aZCHGHuI6Lk3sYuy1qmu6hZvVV59KqKr0jFRp17AyrObhtPI6zL3JD/OVY+ZC4HQf1FIUXKtF5ySQ/4T7FmYtyXmivyJb9Wk3lDuUs82fro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021686; c=relaxed/simple;
	bh=nzCKXPuF99wS1hrT9xMldW2DiAXaIjS68tBMd1ez+lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQLrzypZWG/5RivMx7Qsh6DZoxd2x/x0tocqn4Hcw1wC4u4wMu/0x+DvSSl0m0qzdn2Vi5m/s814te9v2o3EWnM/4Z2eWgTgLuSFxtNEWdKg3+N1u0CZ2e5W7YZ56xLZLl2zz6yKBnfiFyHvoTyArGh+/5dS9AC51zd2EpKk5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=myda6n+P; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 37611C0F57C;
	Thu, 13 Nov 2025 08:14:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFECC6068C;
	Thu, 13 Nov 2025 08:14:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 401CF102F22B0;
	Thu, 13 Nov 2025 09:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763021681; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MMxeVfl3RZeej0PFqvfAsboTYV5PEQ83vi7r3ilMJMY=;
	b=myda6n+PZ/mKKCG/KaQgrS7qf1xhfYlcTf7yPP8SeueSMPaYW9Gvq9lN2uuQCyjM8EsVcr
	0QV0rZkv5E2B3AHq8uayTD4IJb71oaFRyjn/v6WGeRcmv0bdfgBVYyVcgmE2v8cKDuqV4O
	DcaaVswKRvq8D/C/YBL8DSk00UT88mx1hnmlPKc9Eve1SO60zAGG8liSYQh6IhIsg6ybtG
	sQFMyG8IahmNF+KM/hqd7DJTDsPlJY56T/bRxUg//rKtlsFXt0r4bzFstfSI9xDQ2dk9Hh
	dG7EZu9cC5VVHBd6HqeooQGj5EYiz2nyBIwntyzEkL66x19QZpKgDpuxGhKqCw==
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
Subject: [PATCH net-next v16 06/15] net: phy: Create a phy_port for PHY-driven SFPs
Date: Thu, 13 Nov 2025 09:14:08 +0100
Message-ID: <20251113081418.180557-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Some PHY devices may be used as media-converters to drive SFP ports (for
example, to allow using SFP when the SoC can only output RGMII). This is
already supported to some extend by allowing PHY drivers to registers
themselves as being SFP upstream.

However, the logic to drive the SFP can actually be split to a per-port
control logic, allowing support for multi-port PHYs, or PHYs that can
either drive SFPs or Copper.

To that extent, create a phy_port when registering an SFP bus onto a
PHY. This port is considered a "serdes" port, in that it can feed data
to another entity on the link. The PHY driver needs to specify the
various PHY_INTERFACE_MODE_XXX that this port supports.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 14 ++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index f48565c3a9b8..3772c68b1dbc 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1643,6 +1643,26 @@ static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
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
+	/* The PHY is a media converter, the port connected to the SFP cage
+	 * is a MII port.
+	 */
+	port->is_mii = true;
+
+	phy_add_port(phydev, port);
+
+	return 0;
+}
+
 /**
  * phy_sfp_probe - probe for a SFP cage attached to this PHY device
  * @phydev: Pointer to phy_device
@@ -1664,6 +1684,10 @@ int phy_sfp_probe(struct phy_device *phydev,
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
index 05455dc487cd..f89f70f83593 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -132,6 +132,20 @@ void phy_port_update_supported(struct phy_port *port)
 			port->pairs = max_t(int, port->pairs,
 					    ethtool_linkmode_n_pairs(mode));
 
+	/* Serdes ports supported through SFP may not have any medium set,
+	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, derive
+	 * the supported list based on these interfaces
+	 */
+	if (port->is_mii && linkmode_empty(supported)) {
+		unsigned long interface, link_caps = 0;
+
+		/* Get each interface's caps */
+		for_each_set_bit(interface, port->interfaces,
+				 PHY_INTERFACE_MODE_MAX)
+			link_caps |= phy_caps_from_interface(interface);
+
+		phy_caps_linkmodes(link_caps, port->supported);
+	}
 }
 EXPORT_SYMBOL_GPL(phy_port_update_supported);
 
-- 
2.49.0


