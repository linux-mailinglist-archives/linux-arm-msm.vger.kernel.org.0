Return-Path: <linux-arm-msm+bounces-88005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E0DD047CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 885F73041A58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5714392830;
	Thu,  8 Jan 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WpThb7Wn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE283904D7;
	Thu,  8 Jan 2026 08:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859289; cv=none; b=lio0DhiTam6QL2PskN4523iEj0pfatN6CMDV+4EUn9nnlHdcJc1Eu7L+98dFQ8y8/lRaUcrw7knHIK0YEoqvh7FBz+djkxTckVcjiShZu2A8tdl+zS4GSUc2LHRItHKlbuuqiVgfhNlJ+9neVwNDOx0FdMI3qF/lqM6LiolwGOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859289; c=relaxed/simple;
	bh=pi/yUiE0GLIh3NoCUC5adF6wKjp71KSefaDgIXV/uPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrZ37YQ1RUNK4DrmsIk05zCvLJJPXRGUM/AHFUzwUjfx8/mIEeT72yJZQ2lCo29MPGa/o/1hvghQpFyByFGk+6Y7zEV/D8wggQ6YuoZYuSqETu9sTq1Rks38M2N0LRmoeuQO33xkL3Z20liF/QN2UTd1+FL9KxnnNVqspTB1DGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WpThb7Wn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87C82C1ECB2;
	Thu,  8 Jan 2026 08:00:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2E87606B6;
	Thu,  8 Jan 2026 08:01:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C89B9103C8674;
	Thu,  8 Jan 2026 09:01:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767859268; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KSlMJCkHN3qoiesq+GZbeTPd6cykEBxG8JM7oiO9bAg=;
	b=WpThb7WnTLTjv6c3UMgD6PN7ieEy+h4Z0Co7PGHP+cV/EFDGteAmJkRw0KTj1RIDc8vwD9
	UtHTcN0uguWgtoElr4gvb9ygr4NlU7mAhQ/WSNhsK7v9joBryZk/szAgY69JyA4Nwk1vk7
	ZNJA8z0w82gvktlSNTlKNaipw36EL4bwnjT5HVQhJyrNNdu3u9DBvXFc3j7RwE+2ReoAKm
	uyS25bO6w8lTD+0OHulFdThdQCUkRmVriJEZls4gNRqSo8tG5OsGaMzdmwqlnK6x5VYu6k
	3T9mQ5xXrFVKqWeQGrCCkuCFuZlKn0lwq+RlJF37LJ4J8T5p8bgYDbnszlCUyg==
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
Subject: [PATCH net-next v22 04/14] net: phy: dp83822: Add support for phy_port representation
Date: Thu,  8 Jan 2026 09:00:29 +0100
Message-ID: <20260108080041.553250-5-maxime.chevallier@bootlin.com>
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

With the phy_port representation introduced, we can use .attach_port to
populate the port information based on either the straps or the
ti,fiber-mode property. This allows simplifying the probe function and
allow users to override the strapping configuration.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 71 +++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 33db21251f2e..c012dfab3171 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 #include <linux/bitfield.h>
 
@@ -811,17 +812,6 @@ static int dp83822_of_init(struct phy_device *phydev)
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
@@ -950,6 +940,48 @@ static int dp83822_read_straps(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83822_attach_mdi_port(struct phy_device *phydev,
+				   struct phy_port *port)
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
+#if IS_ENABLED(CONFIG_OF_MDIO)
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
+#endif /* CONFIG_OF_MDIO */
+
+		if (dp83822->fx_enabled) {
+			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF);
+		} else {
+			/* This PHY can only to 100BaseTX max, so on 2 pairs */
+			port->pairs = 2;
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
@@ -968,27 +1000,13 @@ static int dp8382x_probe(struct phy_device *phydev)
 
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
@@ -1172,6 +1190,7 @@ static int dp83822_led_hw_control_get(struct phy_device *phydev, u8 index,
 		.led_hw_is_supported = dp83822_led_hw_is_supported,	\
 		.led_hw_control_set = dp83822_led_hw_control_set,	\
 		.led_hw_control_get = dp83822_led_hw_control_get,	\
+		.attach_mdi_port = dp83822_attach_mdi_port		\
 	}
 
 #define DP83825_PHY_DRIVER(_id, _name)				\
-- 
2.49.0


