Return-Path: <linux-arm-msm+bounces-47193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D3AA2D0A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EEC8188B5E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDC81DE4CE;
	Fri,  7 Feb 2025 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X3ImIHuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60A1DC996;
	Fri,  7 Feb 2025 22:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967809; cv=none; b=pOGfG0NHLAW/ngzPKzSBSvduYA9KKQ19iplEFPOUwXrEPjC+1QsxQqnhUKYdFD6yE+aeYISsUosPmsQA7vU/msmMOpTMI1h15JZesKi5oId54T7aBOcwIXUOaaWNsl3V7BgVeHmD0wAoViKPGKnTgIHf3nBK+spcudVTwdH4jf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967809; c=relaxed/simple;
	bh=47Jj2aFCwjITHn0vPTK7IfO6QmX8QkjNd/8dq4KZIcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIk8zp0Ev+Kj76SER0DxjM5iIUk/reqgCJfaGaXMF+dR436R1EdoxgfKnr+NFKs5ZZaOIssANf6rX99N7O3gSTLoET3qJZWLOyajFS3ovZntR4xnLpdnzULBkJhsGp/OfBAa7Uv3Z+0SLGTWdsP0RQIH6jcdbI+qeRzcnAOu7As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X3ImIHuT; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F4A220457;
	Fri,  7 Feb 2025 22:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738967805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uohfn9yIVdrgM7Xs4JN8//5R/l+TX3fiWCkR+sXkdVc=;
	b=X3ImIHuT1Fqn9GdVOuhhWxORb/DICobRo+8GgQc7hHKuZ5OCeEwdprwDxN00hUGXMHejhw
	vLHinbApSl0O0b0UfJBoAsHzVJqur9yJeKdaYsxS7VpLeQgbLXxlEnuY/mGzV+z/uDY5lC
	n6oo1IqqvRRP6X7KIZbPFMgwiPsbyBC3G0nwM6L9T0FrlNthjGvcPjkEKL2yS5bbgy6NJn
	hScHDp1A+8/k9WLGS3Wrra/0NuuvytfLSdRtYUp69edgzcPL0Ml/BCqy8rfQFzc+LvB4sc
	Xa+v45wvPo1JwVTk3semWSgLjLnlXwadj/6uBQIlUeIoyXbdtudMg77OPYYj8Q==
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
Subject: [PATCH net-next 04/13] net: phy: dp83822: Add support for phy_port representation
Date: Fri,  7 Feb 2025 23:36:23 +0100
Message-ID: <20250207223634.600218-5-maxime.chevallier@bootlin.com>
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

With the phy_port representation intrduced, we can use .attach_port to
populate the port information based on either the straps or the
ti,fiber-mode property. This allows simplifying the probe function and
allow users to override the strapping configuration.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 64 ++++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 6599feca1967..af535b0a3914 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 #include <linux/bitfield.h>
 
@@ -781,17 +782,6 @@ static int dp83822_of_init(struct phy_device *phydev)
 	struct device *dev = &phydev->mdio.dev;
 	const char *of_val;
 
-	/* Signal detection for the PHY is only enabled if the FX_EN and the
-	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
-	 * is strapped otherwise signal detection is disabled for the PHY.
-	 */
-	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
-		dp83822->fx_signal_det_low = device_property_present(dev,
-								     "ti,link-loss-low");
-	if (!dp83822->fx_enabled)
-		dp83822->fx_enabled = device_property_present(dev,
-							      "ti,fiber-mode");
-
 	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
 		if (strcmp(of_val, "mac-if") == 0) {
 			dp83822->gpio2_clk_out = DP83822_CLK_SRC_MAC_IF;
@@ -884,6 +874,43 @@ static int dp83822_read_straps(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
+{
+	struct dp83822_private *dp83822 = phydev->priv;
+	int ret;
+
+	if (port->mediums) {
+		if (phy_port_is_fiber(port) ||
+		    port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASEX))
+			dp83822->fx_enabled = true;
+	} else {
+		ret = dp83822_read_straps(phydev);
+		if (ret)
+			return ret;
+
+#ifdef CONFIG_OF_MDIO
+		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
+			dp83822->fx_signal_det_low =
+				device_property_present(dev, "ti,link-loss-low");
+		if (!dp83822->fx_enabled)
+			dp83822->fx_enabled =
+				device_property_present(dev, "ti,fiber-mode");
+#endif
+
+		if (dp83822->fx_enabled) {
+			port->lanes = 1;
+			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
+					BIT(ETHTOOL_LINK_MEDIUM_BASEX);
+		} else {
+			/* This PHY can only to 100BaseTX max, so on 2 lanes */
+			port->lanes = 2;
+			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
+		}
+	}
+
+	return 0;
+}
+
 static int dp8382x_probe(struct phy_device *phydev)
 {
 	struct dp83822_private *dp83822;
@@ -900,25 +927,13 @@ static int dp8382x_probe(struct phy_device *phydev)
 
 static int dp83822_probe(struct phy_device *phydev)
 {
-	struct dp83822_private *dp83822;
 	int ret;
 
 	ret = dp8382x_probe(phydev);
 	if (ret)
 		return ret;
 
-	dp83822 = phydev->priv;
-
-	ret = dp83822_read_straps(phydev);
-	if (ret)
-		return ret;
-
-	ret = dp83822_of_init(phydev);
-	if (ret)
-		return ret;
-
-	if (dp83822->fx_enabled)
-		phydev->port = PORT_FIBRE;
+	dp83822_of_init(phydev);
 
 	return 0;
 }
@@ -1104,6 +1119,7 @@ static int dp83822_led_hw_control_get(struct phy_device *phydev, u8 index,
 		.led_hw_is_supported = dp83822_led_hw_is_supported,	\
 		.led_hw_control_set = dp83822_led_hw_control_set,	\
 		.led_hw_control_get = dp83822_led_hw_control_get,	\
+		.attach_port = dp83822_attach_port		\
 	}
 
 #define DP83825_PHY_DRIVER(_id, _name)				\
-- 
2.48.1


