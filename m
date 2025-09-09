Return-Path: <linux-arm-msm+bounces-72838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96BB50147
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14EE53B052E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CA335E4E5;
	Tue,  9 Sep 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iGEhGuuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC335E4D2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431670; cv=none; b=BlfeYno4lnQ0n0+nYyrLcN964Ixpunt8O4EUwdWcQUyrRe+4GVLAXm+YsY5u+VhIjBi27BBgTPj3N1V+2z+xBAvjc13NfApLPrrdTZuY3lETKfw7HbUPW0ERU/KXQsz/STR5N44mYRDzdFWggQLo8FAEQsIjHK9xxlCJcLI6tjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431670; c=relaxed/simple;
	bh=o5FYh3oTZugN9LT68qVrM5gz/OPBK7ZZw3rN85EunQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQefWW7NHzbg4NluSMg+cNVMEMDW7pLcPJu/Px06D8Eg39+dusdeBRBCqDEgc/fIXcj4da9k3b0E7G+gc06fx7WMNKQJZ8kL1zCB/DK2tvjPjBHia5IxRm58MrgqiOEGkYWJkJ3azwuo02+YDIdvHjF1hk/3zWziqc6pk2Ot8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iGEhGuuC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2B3621A0CCC;
	Tue,  9 Sep 2025 15:27:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 002F560630;
	Tue,  9 Sep 2025 15:27:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81548102F28B4;
	Tue,  9 Sep 2025 17:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757431665; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=s4q+SEA1JILehYKkJLFt8JUFivmtIE7L8Bs9yFeUzdQ=;
	b=iGEhGuuCt+fSYRZ91tqfX/q9s0Jen6eOnvIRm32d5D/iQF+UzD4S1fdYipjSztGQFVCmoz
	mBTqyD+jQzdBxoIavK531VksHXEh9btxzwheB0qzCDDhdKFnXV33cyVSDvNv+zUr2Bm+SN
	a7Iw89XRl2C10g1mLhw/WgtLR1BJT5oLMwYU8Wj2SIDEfKW3QAJ4mHcEAkGGIU47bFH/M0
	5/bcKnI5QZqKT+t6iMO2rHi0ycmlcUdlxHqRHcAG5h9Q6Ksrq7M+SrX9Not/YlI7E2bCRQ
	f/28N6jql6w90qcj1FP0efuL/LYFAhYfPnpGR1bkX4bz6PJdz/t3HqGuIYqBoA==
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
Subject: [PATCH net-next v12 09/18] net: phylink: Move sfp interface selection and filtering to phy_caps
Date: Tue,  9 Sep 2025 17:26:05 +0200
Message-ID: <20250909152617.119554-10-maxime.chevallier@bootlin.com>
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

Phylink's helpers to get the interfaces usable on an SFP module based on
speed and linkmodes can be modes to phy_caps, so that it can benefit to
PHY-driver SFP support.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-caps.h |  6 ++++
 drivers/net/phy/phy_caps.c | 72 ++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/phylink.c  | 72 +++++---------------------------------
 3 files changed, 86 insertions(+), 64 deletions(-)

diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
index ba81cd75e122..ebed340a2e77 100644
--- a/drivers/net/phy/phy-caps.h
+++ b/drivers/net/phy/phy-caps.h
@@ -66,4 +66,10 @@ void phy_caps_medium_get_supported(unsigned long *supported,
 				   int lanes);
 u32 phy_caps_mediums_from_linkmodes(unsigned long *linkmodes);
 
+void phy_caps_filter_sfp_interfaces(unsigned long *dst,
+				    const unsigned long *interfaces);
+phy_interface_t phy_caps_select_sfp_interface_speed(const unsigned long *interfaces,
+						    u32 speed);
+phy_interface_t phy_caps_choose_sfp_interface(const unsigned long *interfaces);
+
 #endif /* __PHY_CAPS_H */
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index b38c567ec6ef..e4adc36e0fe3 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -63,6 +63,22 @@ static int speed_duplex_to_capa(int speed, unsigned int duplex)
 #define for_each_link_caps_desc_speed(cap) \
 	for (cap = &link_caps[__LINK_CAPA_MAX - 1]; cap >= link_caps; cap--)
 
+static const phy_interface_t phy_caps_sfp_interface_preference[] = {
+	PHY_INTERFACE_MODE_100GBASEP,
+	PHY_INTERFACE_MODE_50GBASER,
+	PHY_INTERFACE_MODE_LAUI,
+	PHY_INTERFACE_MODE_25GBASER,
+	PHY_INTERFACE_MODE_USXGMII,
+	PHY_INTERFACE_MODE_10GBASER,
+	PHY_INTERFACE_MODE_5GBASER,
+	PHY_INTERFACE_MODE_2500BASEX,
+	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_1000BASEX,
+	PHY_INTERFACE_MODE_100BASEX,
+};
+
+static DECLARE_PHY_INTERFACE_MASK(phy_caps_sfp_interfaces);
+
 /**
  * phy_caps_init() - Initializes the link_caps array from the link_mode_params.
  *
@@ -100,6 +116,10 @@ int phy_caps_init(void)
 		__set_bit(i, link_caps[capa].linkmodes);
 	}
 
+	for (int i = 0; i < ARRAY_SIZE(phy_caps_sfp_interface_preference); ++i)
+		__set_bit(phy_caps_sfp_interface_preference[i],
+			  phy_caps_sfp_interfaces);
+
 	return 0;
 }
 
@@ -520,3 +540,55 @@ int phy_caps_interface_max_speed(phy_interface_t interface)
 	return SPEED_UNKNOWN;
 }
 EXPORT_SYMBOL_GPL(phy_caps_interface_max_speed);
+
+void phy_caps_filter_sfp_interfaces(unsigned long *dst,
+				    const unsigned long *interfaces)
+{
+	phy_interface_and(dst, interfaces, phy_caps_sfp_interfaces);
+}
+
+phy_interface_t
+phy_caps_select_sfp_interface_speed(const unsigned long *interfaces, u32 speed)
+{
+	phy_interface_t best_interface = PHY_INTERFACE_MODE_NA;
+	phy_interface_t interface;
+	u32 max_speed;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(phy_caps_sfp_interface_preference); i++) {
+		interface = phy_caps_sfp_interface_preference[i];
+		if (!test_bit(interface, interfaces))
+			continue;
+
+		max_speed = phy_caps_interface_max_speed(interface);
+
+		/* The logic here is: if speed == max_speed, then we've found
+		 * the best interface. Otherwise we find the interface that
+		 * can just support the requested speed.
+		 */
+		if (max_speed >= speed)
+			best_interface = interface;
+
+		if (max_speed <= speed)
+			break;
+	}
+
+	return best_interface;
+}
+EXPORT_SYMBOL_GPL(phy_caps_select_sfp_interface_speed);
+
+phy_interface_t phy_caps_choose_sfp_interface(const unsigned long *interfaces)
+{
+	phy_interface_t interface;
+	size_t i;
+
+	interface = PHY_INTERFACE_MODE_NA;
+	for (i = 0; i < ARRAY_SIZE(phy_caps_sfp_interface_preference); i++)
+		if (test_bit(phy_caps_sfp_interface_preference[i], interfaces)) {
+			interface = phy_caps_sfp_interface_preference[i];
+			break;
+		}
+
+	return interface;
+}
+EXPORT_SYMBOL_GPL(phy_caps_choose_sfp_interface);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 091b1ee5c49a..91111ea1b149 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -126,22 +126,6 @@ do {									\
 })
 #endif
 
-static const phy_interface_t phylink_sfp_interface_preference[] = {
-	PHY_INTERFACE_MODE_100GBASEP,
-	PHY_INTERFACE_MODE_50GBASER,
-	PHY_INTERFACE_MODE_LAUI,
-	PHY_INTERFACE_MODE_25GBASER,
-	PHY_INTERFACE_MODE_USXGMII,
-	PHY_INTERFACE_MODE_10GBASER,
-	PHY_INTERFACE_MODE_5GBASER,
-	PHY_INTERFACE_MODE_2500BASEX,
-	PHY_INTERFACE_MODE_SGMII,
-	PHY_INTERFACE_MODE_1000BASEX,
-	PHY_INTERFACE_MODE_100BASEX,
-};
-
-static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
-
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
  * @mask: ethtool link mode mask
@@ -1922,8 +1906,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 			/* If the PHY is on a SFP, limit the interfaces to
 			 * those that can be used with a SFP module.
 			 */
-			phy_interface_and(interfaces, interfaces,
-					  phylink_sfp_interfaces);
+			phy_caps_filter_sfp_interfaces(interfaces, interfaces);
 
 			if (phy_interface_empty(interfaces)) {
 				phylink_err(pl, "SFP PHY's possible interfaces becomes empty\n");
@@ -2643,34 +2626,16 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 static phy_interface_t phylink_sfp_select_interface_speed(struct phylink *pl,
 							  u32 speed)
 {
-	phy_interface_t best_interface = PHY_INTERFACE_MODE_NA;
 	phy_interface_t interface;
-	u32 max_speed;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++) {
-		interface = phylink_sfp_interface_preference[i];
-		if (!test_bit(interface, pl->sfp_interfaces))
-			continue;
-
-		max_speed = phy_caps_interface_max_speed(interface);
 
-		/* The logic here is: if speed == max_speed, then we've found
-		 * the best interface. Otherwise we find the interface that
-		 * can just support the requested speed.
-		 */
-		if (max_speed >= speed)
-			best_interface = interface;
-
-		if (max_speed <= speed)
-			break;
-	}
+	interface = phy_caps_select_sfp_interface_speed(pl->sfp_interfaces,
+							speed);
 
-	if (best_interface == PHY_INTERFACE_MODE_NA)
+	if (interface == PHY_INTERFACE_MODE_NA)
 		phylink_err(pl, "selection of interface failed, speed %u\n",
 			    speed);
 
-	return best_interface;
+	return interface;
 }
 
 static void phylink_merge_link_mode(unsigned long *dst, const unsigned long *b)
@@ -3450,17 +3415,7 @@ static void phylink_sfp_detach(void *upstream, struct sfp_bus *bus)
 static phy_interface_t phylink_choose_sfp_interface(struct phylink *pl,
 						    const unsigned long *intf)
 {
-	phy_interface_t interface;
-	size_t i;
-
-	interface = PHY_INTERFACE_MODE_NA;
-	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++)
-		if (test_bit(phylink_sfp_interface_preference[i], intf)) {
-			interface = phylink_sfp_interface_preference[i];
-			break;
-		}
-
-	return interface;
+	return phy_caps_choose_sfp_interface(intf);
 }
 
 static void phylink_sfp_set_config(struct phylink *pl, unsigned long *supported,
@@ -3737,8 +3692,8 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 	phy_support_asym_pause(phy);
 
 	/* Set the PHY's host supported interfaces */
-	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+	phy_caps_filter_sfp_interfaces(phy->host_interfaces,
+				       pl->config->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
@@ -4166,16 +4121,5 @@ void phylink_mii_c45_pcs_get_state(struct mdio_device *pcs,
 }
 EXPORT_SYMBOL_GPL(phylink_mii_c45_pcs_get_state);
 
-static int __init phylink_init(void)
-{
-	for (int i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); ++i)
-		__set_bit(phylink_sfp_interface_preference[i],
-			  phylink_sfp_interfaces);
-
-	return 0;
-}
-
-module_init(phylink_init);
-
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("phylink models the MAC to optional PHY connection");
-- 
2.49.0


