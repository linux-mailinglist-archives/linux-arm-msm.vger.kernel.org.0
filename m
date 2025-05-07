Return-Path: <linux-arm-msm+bounces-57151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C648AAE1DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 323BA524300
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EE028DB6F;
	Wed,  7 May 2025 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QkLCEIoz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CDE28D8E9;
	Wed,  7 May 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626035; cv=none; b=ssZU+Pvlm8FsyqBbm7/M9iPj72YXzCG8tiMcnfPydKjB9OtouDKToWXAmku4tXz7RdeCxROeteW5S7uJhl8CTJFU/WDJ5WADuqEz2dNaVvQDV5SQNU13r1VUBZDJJvNaWlyO9FIR56aQ0IwLEaeqr6Bo16qgKH2O8c5lX8ABRqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626035; c=relaxed/simple;
	bh=TkLQyLnzYWvs7g/Bow2ery3LFRDxjyn/dd3lhiyaQT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLnUAhQeO2MumsjRWMN3G979dlNeaVmvqcKQWBCTwrMQb6UfxRutBV53qVSWzumfVMFIdGKPNZzQL4aeIbqkQ6XCvfCAuctfR+O2bkxoJhOwGOdEOouVRKCx5JdoOjTlQ0GOS7yN19+elQktIAMf056NhVWB0QVEilue+RnrMKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QkLCEIoz; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DE1D43B66;
	Wed,  7 May 2025 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746626031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEbE5uDf9s2uAyL6DcoceftKJv+uXskkuOrFrb2LwlQ=;
	b=QkLCEIozkbTKj4WQpgv0xz0dFO65dZc0HSWqJlFjt0bMnOQvFbh6ah++3do99hQX5TULZO
	eoRwdnYyaxXGAS4KkUWntICeW5ssCLisvV9ONaXET4WPjJO2U0lJsdMcYOppNQvtigYhaB
	gN1VIo6xh2NKww/wJ0Ll+kxocDJ2ZWSy8YQRd9V/he/HCvhJqndJ7b4b/J/IyCSeWulS8l
	No5plEgDGs9ldjB6I77fC3LWkkq0jQ7uJiDVwytJH6meVvQMIv1HomSfGyJ91VNY3JgYYo
	UvZ6pw5Nb3IPjdSC2jYzKKT/OzA9SSpBAZhnTsWj4Sgp70GKEzDhphHlyqZ61A==
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
Subject: [PATCH net-next v6 04/14] net: phy: dp83822: Add support for phy_port representation
Date: Wed,  7 May 2025 15:53:20 +0200
Message-ID: <20250507135331.76021-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtvdemkeeggedtmehfhedtsgemfedvheemrgeigeefmedufheiugemfhgvrgegmeegsgduieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeeggedtmehfhedtsgemfedvheemrgeigeefmedufheiugemfhgvrgegmeegsgduiedphhgvlhhopedvrgdtvddqkeeggedtqdhfhedtsgdqtdefvdehqdgrieegfedqudhfieguqdhfvggrgedqgegsudeirdhrvghvrdhsfhhrrdhnvghtpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvr
 ghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

With the phy_port representation intrduced, we can use .attach_port to
populate the port information based on either the straps or the
ti,fiber-mode property. This allows simplifying the probe function and
allow users to override the strapping configuration.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 71 +++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 01255dada600..a0b4ebddd484 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 #include <linux/bitfield.h>
 
@@ -814,17 +815,6 @@ static int dp83822_of_init(struct phy_device *phydev)
 	int i, ret;
 	u32 val;
 
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
@@ -953,6 +943,48 @@ static int dp83822_read_straps(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
+{
+	struct dp83822_private *dp83822 = phydev->priv;
+	int ret;
+
+	if (port->mediums) {
+		if (phy_port_is_fiber(port))
+			dp83822->fx_enabled = true;
+	} else {
+		ret = dp83822_read_straps(phydev);
+		if (ret)
+			return ret;
+
+#ifdef CONFIG_OF_MDIO
+		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
+			dp83822->fx_signal_det_low =
+				device_property_present(&phydev->mdio.dev,
+							"ti,link-loss-low");
+
+		/* ti,fiber-mode is still used for backwards compatibility, but
+		 * has been replaced with the mdi node definition, see
+		 * ethernet-port.yaml
+		 */
+		if (!dp83822->fx_enabled)
+			dp83822->fx_enabled =
+				device_property_present(&phydev->mdio.dev,
+							"ti,fiber-mode");
+#endif
+
+		if (dp83822->fx_enabled) {
+			port->lanes = 1;
+			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF);
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
@@ -971,27 +1003,13 @@ static int dp8382x_probe(struct phy_device *phydev)
 
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
-
-	return 0;
+	return dp83822_of_init(phydev);
 }
 
 static int dp83826_probe(struct phy_device *phydev)
@@ -1175,6 +1193,7 @@ static int dp83822_led_hw_control_get(struct phy_device *phydev, u8 index,
 		.led_hw_is_supported = dp83822_led_hw_is_supported,	\
 		.led_hw_control_set = dp83822_led_hw_control_set,	\
 		.led_hw_control_get = dp83822_led_hw_control_get,	\
+		.attach_port = dp83822_attach_port		\
 	}
 
 #define DP83825_PHY_DRIVER(_id, _name)				\
-- 
2.49.0


