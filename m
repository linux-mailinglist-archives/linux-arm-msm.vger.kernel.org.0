Return-Path: <linux-arm-msm+bounces-73589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF176B57D49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AFD23A777C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1954C313276;
	Mon, 15 Sep 2025 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KDnINY4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E83D3191A6;
	Mon, 15 Sep 2025 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943137; cv=none; b=DAX5FrlhTZ+0j8AksxoZvUQUhmFnYGi5J35hJHva0W2Q+FBPJrVli3XrqKB8AKMKHN2ulg0HDqSwiIaAnCBaXEtvKwsjjALuEVXl10oIUpiLRZILjDSgXFePdMmGEbI7hrsvRMbiOP+6iBzaKpgcX227YoHqhDxbPpIw18ITJkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943137; c=relaxed/simple;
	bh=Lmlk/cSh1K23kRvMuFUqbv/Qn0+tL37gTDo8AtKNwo0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=DwfZcXFbG78UAi7URerAhu3Vuy8QkahlJLgo8TFC5iGnkU5TtVdQQEJl/od9B3fofeH0gGHB5saICEGBOgUeYYaAEObJ6refNOgQgEbQtN9q45hxrCvlIS8y5hNW9eqD4iEWIvdB9tI7UFlukMXAW+vmoMlFt9reKTtJXOfMR5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KDnINY4W; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mG7HVcrqW6ZMYulncZv3wpXhhyP3H4rqhSTgByg4Y9s=; b=KDnINY4W9abNFFY54dA84UhhbE
	nUqt99wiGIeKUFl9KeJUv3uV1N1o+zvYpXNfyEW7fQ/140lnmAcVlNEcc6ByviE3fZyf7OpohJNWA
	U7d1CjHjkQTAieGHRwWLnMFs+2ob7OfDVUBOn7xu7IvklTIdrU2YhopwCscm1HJ6DVKD55+YJLxnQ
	E+aZHPdh/VKE7v66hsP9RaaI0cJ/VJ965KwXwmie/AKISiYWoaBv/v+Bsv/J+dW+1kS6w6Dqoh4+a
	pw5LX71ALOWZHdYTpZXkgI1fNGcFmVL5eZFZwDhPM+JFWTJaWzk67IAwgzkBUXCKp+tssnh9vra0m
	KmaiIbxQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53114 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uy9JT-000000000NJ-2fx2;
	Mon, 15 Sep 2025 14:32:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uy9JS-00000005jiD-3thK;
	Mon, 15 Sep 2025 14:32:10 +0100
In-Reply-To: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	"Marek Beh__n" <kabel@kernel.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 6/7] net: phy: update all PHYs to use
 sfp_get_module_caps()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uy9JS-00000005jiD-3thK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 15 Sep 2025 14:32:10 +0100

Update all PHYs to use sfp_get_module_caps() rather than the
sfp_parse_*() family of functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/marvell-88x2222.c | 13 ++++++-------
 drivers/net/phy/marvell.c         |  8 +++-----
 drivers/net/phy/marvell10g.c      |  7 +++----
 drivers/net/phy/qcom/at803x.c     |  9 ++++-----
 drivers/net/phy/qcom/qca807x.c    |  7 +++----
 5 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index fad2f54c1eac..894bcee61e65 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -475,21 +475,20 @@ static int mv2222_config_init(struct phy_device *phydev)
 
 static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
 	struct phy_device *phydev = upstream;
+	const struct sfp_module_caps *caps;
 	phy_interface_t sfp_interface;
 	struct mv2222_data *priv;
 	struct device *dev;
 	int ret;
 
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_supported) = { 0, };
-
 	priv = phydev->priv;
 	dev = &phydev->mdio.dev;
 
-	sfp_parse_support(phydev->sfp_bus, id, sfp_supported, interfaces);
-	phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_supported);
-	sfp_interface = sfp_select_interface(phydev->sfp_bus, sfp_supported);
+	caps = sfp_get_module_caps(phydev->sfp_bus);
+
+	phydev->port = caps->port;
+	sfp_interface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
 
 	dev_info(dev, "%s SFP module inserted\n", phy_modes(sfp_interface));
 
@@ -502,7 +501,7 @@ static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 	}
 
 	priv->line_interface = sfp_interface;
-	linkmode_and(priv->supported, phydev->supported, sfp_supported);
+	linkmode_and(priv->supported, phydev->supported, caps->link_modes);
 
 	ret = mv2222_config_line(phydev);
 	if (ret < 0)
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 0ea366c1217e..c248c90510ae 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -3600,20 +3600,18 @@ static int marvell_probe(struct phy_device *phydev)
 
 static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
 	struct phy_device *phydev = upstream;
+	const struct sfp_module_caps *caps;
 	phy_interface_t interface;
 	struct device *dev;
 	int oldpage;
 	int ret = 0;
 	u16 mode;
 
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0, };
-
 	dev = &phydev->mdio.dev;
 
-	sfp_parse_support(phydev->sfp_bus, id, supported, interfaces);
-	interface = sfp_select_interface(phydev->sfp_bus, supported);
+	caps = sfp_get_module_caps(phydev->sfp_bus);
+	interface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
 
 	dev_info(dev, "%s SFP module inserted\n", phy_modes(interface));
 
diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 13e81dff42c1..8fd42131cdbf 100644
--- a/drivers/net/phy/marvell10g.c
+++ b/drivers/net/phy/marvell10g.c
@@ -466,12 +466,11 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
 static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
 	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
+	const struct sfp_module_caps *caps;
 	phy_interface_t iface;
 
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
+	caps = sfp_get_module_caps(phydev->sfp_bus);
+	iface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
 
 	if (iface != PHY_INTERFACE_MODE_10GBASER) {
 		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 51a132242462..338acd11a9b6 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -771,10 +771,10 @@ static int at8031_register_regulators(struct phy_device *phydev)
 
 static int at8031_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
-	struct phy_device *phydev = upstream;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_support);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
+	struct phy_device *phydev = upstream;
+	const struct sfp_module_caps *caps;
 	phy_interface_t iface;
 
 	linkmode_zero(phy_support);
@@ -784,12 +784,11 @@ static int at8031_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 	phylink_set(phy_support, Pause);
 	phylink_set(phy_support, Asym_Pause);
 
-	linkmode_zero(sfp_support);
-	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
+	caps = sfp_get_module_caps(phydev->sfp_bus);
 	/* Some modules support 10G modes as well as others we support.
 	 * Mask out non-supported modes so the correct interface is picked.
 	 */
-	linkmode_and(sfp_support, phy_support, sfp_support);
+	linkmode_and(sfp_support, phy_support, caps->link_modes);
 
 	if (linkmode_empty(sfp_support)) {
 		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 070dc8c00835..1be8295a95cb 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -646,13 +646,12 @@ static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 static int qca807x_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
 	struct phy_device *phydev = upstream;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
+	const struct sfp_module_caps *caps;
 	phy_interface_t iface;
 	int ret;
-	DECLARE_PHY_INTERFACE_MASK(interfaces);
 
-	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
-	iface = sfp_select_interface(phydev->sfp_bus, support);
+	caps = sfp_get_module_caps(phydev->sfp_bus);
+	iface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
 
 	dev_info(&phydev->mdio.dev, "%s SFP module inserted\n", phy_modes(iface));
 
-- 
2.47.3


