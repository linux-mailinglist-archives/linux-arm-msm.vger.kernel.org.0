Return-Path: <linux-arm-msm+bounces-80559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18EC39F00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 10:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C42EC4FD830
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 09:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3B4312830;
	Thu,  6 Nov 2025 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jFiKz2Uj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5CF3126BE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422521; cv=none; b=rCFcy+YN/I6CtmNrQQazWnFApSlzlyGECelr3ioThhv3+1XH8H75JhXUAXCAl+wKJfve8dE7OgchrIyzEBd+28vnmsLbPL4dn4/2l0hjnCX0V1F9aWWWATOhNoY9mXzb91NtO5Ta4PEV9BIwptG4zBAnbA7h5BtmtOtuTXH7fsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422521; c=relaxed/simple;
	bh=j6vc++6JLb9mf/lH73D+IZKvQOyipkXa+xaW/pMiUPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehh8joCvYqOAIcFm7/gL+SqQgLcZ4Wfj06zC2zWG3gI64rSBGqR0ewrkj3aRKZ9G089a3D83yR6yf/BI/nWGrZRaFa0RFDtZ69x7XQeZbOBgzIPEiTmZhCuos0cO6K7AriArx6BwdzmwwiTIJrmXVcJYI5R28BHOk7HG+GXi8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jFiKz2Uj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 455424E41562;
	Thu,  6 Nov 2025 09:48:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A9946068C;
	Thu,  6 Nov 2025 09:48:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B69311850800;
	Thu,  6 Nov 2025 10:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422516; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qZvQNX+Emw1eazDZ1dy4JzOzugquft+dLVSI7f6Pkec=;
	b=jFiKz2Ujal1K0389LqEe/eWv2i7W3FpGe/uI/KIavLXAOBZowuRS4InsUlzZd3kBL6DanF
	hmabetRC6+d/OfxLibOcWSE6Gr8sBCWIUikMKhXAX+q1d81A4+reySNrmlnGG96AFsPydK
	bdV1q2/agev8i25hzt725XXtmQOePSkDKvMEauP/606V85xb4j6Nm37YkCI/rNf37yq2QK
	FwDwnRucEAS2+rtftM1T6i/V4JrVwzgXRTin7BBkvsyYAzFkpJYlpdJibGgbsfx1+rcXLH
	S3iF6j53w/nrFabRQNpdKfirBwKCjRTxEFCKpbCNaJ8hPd2HEc6HIx2pnnuMIA==
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
Subject: [PATCH net-next v15 11/15] net: phy: at803x: Support SFP through phy_port interface
Date: Thu,  6 Nov 2025 10:47:36 +0100
Message-ID: <20251106094742.2104099-12-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Convert the at803x driver to use the generic phylib SFP handling, via a
dedicated .attach_port() callback, populating the supported interfaces.

As these devices are limited to 1000BaseX, a workaround is used to also
support, in a very limited way, copper modules. This is done by
supporting SGMII but limiting it to 1G full duplex (in which case it's
somewhat compatible with 1000BaseX).

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/qcom/at803x.c | 77 +++++++++++++++--------------------
 1 file changed, 32 insertions(+), 45 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 338acd11a9b6..2995b08bac96 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -20,7 +20,7 @@
 #include <linux/of.h>
 #include <linux/phylink.h>
 #include <linux/reset.h>
-#include <linux/sfp.h>
+#include <linux/phy_port.h>
 #include <dt-bindings/net/qca-ar803x.h>
 
 #include "qcom.h"
@@ -769,57 +769,44 @@ static int at8031_register_regulators(struct phy_device *phydev)
 	return 0;
 }
 
-static int at8031_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+static int at803x_configure_mii(struct phy_port *port, bool enable,
+				phy_interface_t interface)
 {
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_support);
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
-	struct phy_device *phydev = upstream;
-	const struct sfp_module_caps *caps;
-	phy_interface_t iface;
-
-	linkmode_zero(phy_support);
-	phylink_set(phy_support, 1000baseX_Full);
-	phylink_set(phy_support, 1000baseT_Full);
-	phylink_set(phy_support, Autoneg);
-	phylink_set(phy_support, Pause);
-	phylink_set(phy_support, Asym_Pause);
-
-	caps = sfp_get_module_caps(phydev->sfp_bus);
-	/* Some modules support 10G modes as well as others we support.
-	 * Mask out non-supported modes so the correct interface is picked.
-	 */
-	linkmode_and(sfp_support, phy_support, caps->link_modes);
+	struct phy_device *phydev = port_phydev(port);
 
-	if (linkmode_empty(sfp_support)) {
-		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
-		return -EINVAL;
-	}
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		dev_warn(&phydev->mdio.dev,
+			 "module may not function if 1000Base-X not supported\n");
+
+	return 0;
+}
 
-	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
+static const struct phy_port_ops at803x_port_ops = {
+	.configure_mii = at803x_configure_mii,
+};
 
-	/* Only 1000Base-X is supported by AR8031/8033 as the downstream SerDes
-	 * interface for use with SFP modules.
-	 * However, some copper modules detected as having a preferred SGMII
-	 * interface do default to and function in 1000Base-X mode, so just
-	 * print a warning and allow such modules, as they may have some chance
-	 * of working.
+static int at8031_attach_mii_port(struct phy_device *phydev,
+				  struct phy_port *port)
+{
+	linkmode_zero(port->supported);
+	phylink_set(port->supported, 1000baseX_Full);
+	phylink_set(port->supported, 1000baseT_Full);
+	phylink_set(port->supported, Autoneg);
+	phylink_set(port->supported, Pause);
+	phylink_set(port->supported, Asym_Pause);
+
+	/* This device doesn't really support SGMII. However, do our best
+	 * to be compatible with copper modules (that usually require SGMII),
+	 * in a degraded mode as we only allow 1000BaseT Full
 	 */
-	if (iface == PHY_INTERFACE_MODE_SGMII)
-		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");
-	else if (iface != PHY_INTERFACE_MODE_1000BASEX)
-		return -EINVAL;
+	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
+
+	port->ops = &at803x_port_ops;
 
 	return 0;
 }
 
-static const struct sfp_upstream_ops at8031_sfp_ops = {
-	.attach = phy_sfp_attach,
-	.detach = phy_sfp_detach,
-	.module_insert = at8031_sfp_insert,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
-};
-
 static int at8031_parse_dt(struct phy_device *phydev)
 {
 	struct device_node *node = phydev->mdio.dev.of_node;
@@ -840,8 +827,7 @@ static int at8031_parse_dt(struct phy_device *phydev)
 		return ret;
 	}
 
-	/* Only AR8031/8033 support 1000Base-X for SFP modules */
-	return phy_sfp_probe(phydev, &at8031_sfp_ops);
+	return 0;
 }
 
 static int at8031_probe(struct phy_device *phydev)
@@ -1172,6 +1158,7 @@ static struct phy_driver at803x_driver[] = {
 	.set_tunable		= at803x_set_tunable,
 	.cable_test_start	= at8031_cable_test_start,
 	.cable_test_get_status	= at8031_cable_test_get_status,
+	.attach_mii_port	= at8031_attach_mii_port,
 }, {
 	/* Qualcomm Atheros AR8032 */
 	PHY_ID_MATCH_EXACT(ATH8032_PHY_ID),
-- 
2.49.0


