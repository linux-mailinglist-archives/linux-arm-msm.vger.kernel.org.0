Return-Path: <linux-arm-msm+bounces-88010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4DD041E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1B7D3090C93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E4936BCD4;
	Thu,  8 Jan 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EmxxtWFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F8392825;
	Thu,  8 Jan 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859306; cv=none; b=hjABCOrDaX4NgHUMCPWg+Hi3TdpbfpgIvS8d0WEfFTr2OZh9Wf+IotMGiSSkd7lqGmJadoLPc6hdUK3fIbptscLtG7zl6d53PuC6v1t6nTI1JMNBMIXddZgJZEcpItJFqgjY9EdD6eLE9Ck+9QVLj/ycf1IfoG3kY1XzBWLEPoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859306; c=relaxed/simple;
	bh=7SbdU+tcUgAxQ/T7dZ9ZoX49c89mZ2EajY+VEunSIIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGySZI0UUzYvh9wK8RIYaMFrk9hlP/+m/Jw8NrVlf3AB+etNXQvzDiuKB4Na6xZe3Gfdk6TNJrMKESi1kRkGU1lwYiDP7H+yLsxxvsiUU99+LGvu7cvkw3SC3jPTC7w0SE+dlhZfaDFuSGyJfa0hakss+fzqAjEzp4E3xBiWWfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EmxxtWFF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 95C8A4E41FF3;
	Thu,  8 Jan 2026 08:01:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AFF9606B6;
	Thu,  8 Jan 2026 08:01:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9F9E103C84E2;
	Thu,  8 Jan 2026 09:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767859283; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cvalqWQNdUHmlVQiWYTBVow57GCTnO3jvYApxg1ymio=;
	b=EmxxtWFFBOl8yhdzp2H0qMwO0LxAuev/L2h5R2KEtyvM5iQ83Hg/2nGTYM1BqLRV2SSSzK
	/bIVsTYyyRjzxHgFfNaKGymK1sT1QVwa7e1SlE8UfeU0H2THOoDUQkEdIFdgY/9iCZs2Lb
	EWovjosP321y2EE9W7KYJpsS/wRH7oDwo+HRTjvwRk7y6CjZZss3BMrHqXWdSQYVuRObI+
	i1e2MxRh82VwjJlEEkAqcZUxrTur5ydk5aq7abmUq7f3IAm+6GeDl4iLWz1Tp2NA+g9YYo
	Ea9MfjGT5x4IHxGzICNlpYrp05hNTiugxXmVI2vD+pNfc/udLv1uEJEYQOIMZg==
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
Subject: [PATCH net-next v22 08/14] net: phy: marvell-88x2222: Support SFP through phy_port interface
Date: Thu,  8 Jan 2026 09:00:33 +0100
Message-ID: <20260108080041.553250-9-maxime.chevallier@bootlin.com>
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

The 88x2222 PHY from Marvell only supports serialised modes as its
line-facing interfaces. Convert that driver to the generic phylib SFP
handling.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/marvell-88x2222.c | 94 +++++++++++++------------------
 1 file changed, 38 insertions(+), 56 deletions(-)

diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index 894bcee61e65..ba1bbb6c63d6 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -13,7 +13,7 @@
 #include <linux/mdio.h>
 #include <linux/marvell_phy.h>
 #include <linux/of.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 #include <linux/netdevice.h>
 
 /* Port PCS Configuration */
@@ -473,89 +473,70 @@ static int mv2222_config_init(struct phy_device *phydev)
 	return 0;
 }
 
-static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int mv2222_configure_serdes(struct phy_port *port, bool enable,
+				   phy_interface_t interface)
 {
-	struct phy_device *phydev = upstream;
-	const struct sfp_module_caps *caps;
-	phy_interface_t sfp_interface;
+	struct phy_device *phydev = port_phydev(port);
 	struct mv2222_data *priv;
-	struct device *dev;
-	int ret;
+	int ret = 0;
 
 	priv = phydev->priv;
-	dev = &phydev->mdio.dev;
-
-	caps = sfp_get_module_caps(phydev->sfp_bus);
-
-	phydev->port = caps->port;
-	sfp_interface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
-
-	dev_info(dev, "%s SFP module inserted\n", phy_modes(sfp_interface));
+	priv->line_interface = interface;
 
-	if (sfp_interface != PHY_INTERFACE_MODE_10GBASER &&
-	    sfp_interface != PHY_INTERFACE_MODE_1000BASEX &&
-	    sfp_interface != PHY_INTERFACE_MODE_SGMII) {
-		dev_err(dev, "Incompatible SFP module inserted\n");
+	if (enable) {
+		linkmode_and(priv->supported, phydev->supported, port->supported);
 
-		return -EINVAL;
-	}
-
-	priv->line_interface = sfp_interface;
-	linkmode_and(priv->supported, phydev->supported, caps->link_modes);
+		ret = mv2222_config_line(phydev);
+		if (ret < 0)
+			return ret;
 
-	ret = mv2222_config_line(phydev);
-	if (ret < 0)
-		return ret;
+		if (mutex_trylock(&phydev->lock)) {
+			ret = mv2222_config_aneg(phydev);
+			mutex_unlock(&phydev->lock);
+		}
 
-	if (mutex_trylock(&phydev->lock)) {
-		ret = mv2222_config_aneg(phydev);
-		mutex_unlock(&phydev->lock);
+	} else {
+		linkmode_zero(priv->supported);
 	}
 
 	return ret;
 }
 
-static void mv2222_sfp_remove(void *upstream)
+static void mv2222_port_link_up(struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
-	struct mv2222_data *priv;
-
-	priv = phydev->priv;
-
-	priv->line_interface = PHY_INTERFACE_MODE_NA;
-	linkmode_zero(priv->supported);
-	phydev->port = PORT_NONE;
-}
-
-static void mv2222_sfp_link_up(void *upstream)
-{
-	struct phy_device *phydev = upstream;
+	struct phy_device *phydev = port_phydev(port);
 	struct mv2222_data *priv;
 
 	priv = phydev->priv;
 	priv->sfp_link = true;
 }
 
-static void mv2222_sfp_link_down(void *upstream)
+static void mv2222_port_link_down(struct phy_port *port)
 {
-	struct phy_device *phydev = upstream;
+	struct phy_device *phydev = port_phydev(port);
 	struct mv2222_data *priv;
 
 	priv = phydev->priv;
 	priv->sfp_link = false;
 }
 
-static const struct sfp_upstream_ops sfp_phy_ops = {
-	.module_insert = mv2222_sfp_insert,
-	.module_remove = mv2222_sfp_remove,
-	.link_up = mv2222_sfp_link_up,
-	.link_down = mv2222_sfp_link_down,
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
+static const struct phy_port_ops mv2222_port_ops = {
+	.link_up = mv2222_port_link_up,
+	.link_down = mv2222_port_link_down,
+	.configure_mii = mv2222_configure_serdes,
 };
 
+static int mv2222_attach_mii_port(struct phy_device *phydev, struct phy_port *port)
+{
+	port->ops = &mv2222_port_ops;
+
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
+
+	return 0;
+}
+
 static int mv2222_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -591,7 +572,7 @@ static int mv2222_probe(struct phy_device *phydev)
 	priv->line_interface = PHY_INTERFACE_MODE_NA;
 	phydev->priv = priv;
 
-	return phy_sfp_probe(phydev, &sfp_phy_ops);
+	return 0;
 }
 
 static struct phy_driver mv2222_drivers[] = {
@@ -608,6 +589,7 @@ static struct phy_driver mv2222_drivers[] = {
 		.suspend = mv2222_suspend,
 		.resume = mv2222_resume,
 		.read_status = mv2222_read_status,
+		.attach_mii_port = mv2222_attach_mii_port,
 	},
 };
 module_phy_driver(mv2222_drivers);
-- 
2.49.0


