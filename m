Return-Path: <linux-arm-msm+bounces-83830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43349C939C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 09:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F3BB4E65D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 08:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45AA285418;
	Sat, 29 Nov 2025 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B0/EleUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE47B283FE6;
	Sat, 29 Nov 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764404585; cv=none; b=rUbUHqZltdqxeB8PEez5lwxaXdu3yhUAEHnAs/BQ6iesqEf7xBL+Q1xOG0JPuX/NdBgBRDU8X2wd4oxNur+Rx/RsPPhUWTOQhCryGlw57L8LDkxKorturS9WzPSMZgVtU+w09Neywu/UM1WPyaDm9HiyPLhxjrtHd+cM7cvdb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764404585; c=relaxed/simple;
	bh=S9j3dfTpz/1Ks19U23DT6EHwYHbJLw55V2ouETnmR9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItXGipH0Jt52KqtEwNXppqLDMShNEyUfVw1UdSPRRzQ2y8ioMN+yRE70cbmxlQ1IL2umUgIwVC/VuTSVCOLSX7H+cHCbAFHlX+WwCfWUAbuEnUpveuMBiEvruFCCKhBGzEhBboWgTak0jIfwU2uBniv1rdrYDp7DrwGmoWun5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B0/EleUl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 49C674E4196A;
	Sat, 29 Nov 2025 08:23:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D8D660706;
	Sat, 29 Nov 2025 08:23:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDD2C119104CB;
	Sat, 29 Nov 2025 09:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764404580; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WZNvma8TE7KVr361gEjx8d3Y64lm9bFVXh0rnSrkD9M=;
	b=B0/EleUlCU6Y+CuhFqvEOnMaTTUrwMa018F/C3b8hdN7qpme5epFAegxX0LwXki2XNvGCr
	w+Df/m4Ui5XdEKCZDBLKqZyrvqGFX7s1mThV/FOq6pp50wKwtBNC55UgFicMGMa7GlsNIz
	53dS36hnnhLZZozckorFqIxTfaJjwjj/lCGUitknsTk94jOfWfS7OIQuZDX6Md32BugQMa
	+RBjDVbticuAtJT8dALhq475AHsZLk+lkpgMxWBNJANt7Mt0G1rm5jbYtQ8LNkTcoM78Eu
	JKm92GE7WIEIntP8wqnB3qpyLCQbxXhCLb4YrZT7QkClNId4LKd+RKddbqJTDQ==
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
Subject: [PATCH net-next v21 06/14] net: phy: Create a phy_port for PHY-driven SFPs
Date: Sat, 29 Nov 2025 09:22:18 +0100
Message-ID: <20251129082228.454678-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Fuzzy: f0a28691f7ec4acdd6a2650b9611bd90b8db1865e04a7f31d08e08ed4978660bd74e6f9d7b79f45cf671da8c3c71ec37e6f3c48ea0acdb78a09d500b02d2c7fd

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
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 27 +++++++++++++++++++++++++++
 drivers/net/phy/phy_port.c   | 15 +++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index f9cacdfb516e..f9252d36df20 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1643,6 +1643,29 @@ static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
 	phydev->n_ports--;
 }
 
+static int phy_setup_sfp_port(struct phy_device *phydev)
+{
+	struct phy_port *port = phy_port_alloc();
+	int ret;
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
+	ret = phy_add_port(phydev, port);
+	if (ret)
+		phy_port_destroy(port);
+
+	return ret;
+}
+
 /**
  * phy_sfp_probe - probe for a SFP cage attached to this PHY device
  * @phydev: Pointer to phy_device
@@ -1664,6 +1687,10 @@ int phy_sfp_probe(struct phy_device *phydev,
 		ret = sfp_bus_add_upstream(bus, phydev, ops);
 		sfp_bus_put(bus);
 	}
+
+	if (!ret && phydev->sfp_bus)
+		ret = phy_setup_sfp_port(phydev);
+
 	return ret;
 }
 EXPORT_SYMBOL(phy_sfp_probe);
diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
index 70b3ecb8fb09..81e557aae0d6 100644
--- a/drivers/net/phy/phy_port.c
+++ b/drivers/net/phy/phy_port.c
@@ -131,6 +131,21 @@ void phy_port_update_supported(struct phy_port *port)
 				 __ETHTOOL_LINK_MODE_MASK_NBITS)
 			port->pairs = max_t(int, port->pairs,
 					    ethtool_linkmode_n_pairs(mode));
+
+	/* Serdes ports supported through SFP may not have any medium set,
+	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, derive
+	 * the supported list based on these interfaces
+	 */
+	if (port->is_mii && !port->mediums) {
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


