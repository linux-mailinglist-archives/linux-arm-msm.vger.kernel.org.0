Return-Path: <linux-arm-msm+bounces-83641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D5C8FAB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF07E3ACD7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBCE2FFFBC;
	Thu, 27 Nov 2025 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DuV8mwQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A72FF176;
	Thu, 27 Nov 2025 17:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263947; cv=none; b=Y/p56kyeuYXaL7roIuoU9NgesAafAyOKzhse4uW5DZMtjxeYYR/kM9MIam6o2q4LnglDfelAgowTfEzoolwT8a9VQi0Wry14U7mgHRx8IqeZDKJxXrJRCAVfLTMbk48KBBYkB3w2tzALtyaRAkeUgcT3hbNQC6HiIfCAeI6Kj+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263947; c=relaxed/simple;
	bh=9IMJPkDAIj872hswX4go4OxCq6fGPx8yszGuLpmG/2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAnkgWmTxwewc0HT5/ZoAFeh9YRevkCKvxHHvvkjeMGLSVDcv5CQbgfcZNf3U8+QCyCUEeDNFNByRpGQhF6oyyIxBpO4cOSkYJ9S+0oTjC+DV0KXgz1nPj3QIRwu1WhMxeF2e4Tz4W4iOgsrB2SO6dDB6ZRdCcILe/INTtKQyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DuV8mwQ5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F0F4C16A23;
	Thu, 27 Nov 2025 17:18:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 380C260722;
	Thu, 27 Nov 2025 17:19:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24842102F2846;
	Thu, 27 Nov 2025 18:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764263942; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bWPnbJHd/61ERmeZQGXyueGys3fwdn5jVNs/hlveCm0=;
	b=DuV8mwQ5qKL4Wyp1s53VwgWY5RAt3PVF24roIWM0QntBUDYfScCTsx8ZC/d38a020oF5Ue
	RO9dHbTcx6Xl+7alltAJ9fP7CAKqxFairDe1ujZ5Ahggi0tHMJ8gsH8X1oABTwD3g+WspU
	g+Yso6HqJyhomLSgfhi8kLJ7W9ZPSqlqDcPe0ELsk5XfJ5U/H3pfK/Bx/lLoLdXtrzRHl9
	R8WeToCF5kQiS4bdmfyCPBdZXaRSdNc2UHg2N2qMHjFgh6EB4+hPMb5IDBS5s4IXx9nxmk
	JthTrnvGqFz8KAJs9+uVrotqlByT9Kw7h9lIxPFoLOGMan1kcQSiGtkddgr6kg==
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
Subject: [PATCH net-next v20 13/14] net: phy: Only rely on phy_port for PHY-driven SFP
Date: Thu, 27 Nov 2025 18:17:56 +0100
Message-ID: <20251127171800.171330-14-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Now that all PHY drivers that support downstream SFP have been converted
to phy_port serdes handling, we can make the generic PHY SFP handling
mandatory, thus making all phylib sfp helpers static.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 28 +++++++++-------------------
 include/linux/phy.h          |  6 ------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 793c6e0260c8..76a95eae8706 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1532,7 +1532,7 @@ static DEVICE_ATTR_RO(phy_standalone);
  *
  * Return: 0 on success, otherwise a negative error code.
  */
-int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
+static int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
 {
 	struct phy_device *phydev = upstream;
 	struct net_device *dev = phydev->attached_dev;
@@ -1542,7 +1542,6 @@ int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	return 0;
 }
-EXPORT_SYMBOL(phy_sfp_connect_phy);
 
 /**
  * phy_sfp_disconnect_phy - Disconnect the SFP module's PHY from the upstream PHY
@@ -1554,7 +1553,7 @@ EXPORT_SYMBOL(phy_sfp_connect_phy);
  * will be destroyed, re-inserting the same module will add a new phy with a
  * new index.
  */
-void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
+static void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
 {
 	struct phy_device *phydev = upstream;
 	struct net_device *dev = phydev->attached_dev;
@@ -1562,7 +1561,6 @@ void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
 	if (dev)
 		phy_link_topo_del_phy(dev, phy);
 }
-EXPORT_SYMBOL(phy_sfp_disconnect_phy);
 
 /**
  * phy_sfp_attach - attach the SFP bus to the PHY upstream network device
@@ -1571,7 +1569,7 @@ EXPORT_SYMBOL(phy_sfp_disconnect_phy);
  *
  * This is used to fill in the sfp_upstream_ops .attach member.
  */
-void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
+static void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
 {
 	struct phy_device *phydev = upstream;
 
@@ -1579,7 +1577,6 @@ void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
 		phydev->attached_dev->sfp_bus = bus;
 	phydev->sfp_bus_attached = true;
 }
-EXPORT_SYMBOL(phy_sfp_attach);
 
 /**
  * phy_sfp_detach - detach the SFP bus from the PHY upstream network device
@@ -1588,7 +1585,7 @@ EXPORT_SYMBOL(phy_sfp_attach);
  *
  * This is used to fill in the sfp_upstream_ops .detach member.
  */
-void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
+static void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 {
 	struct phy_device *phydev = upstream;
 
@@ -1596,7 +1593,6 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 		phydev->attached_dev->sfp_bus = NULL;
 	phydev->sfp_bus_attached = false;
 }
-EXPORT_SYMBOL(phy_sfp_detach);
 
 static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
@@ -1750,10 +1746,8 @@ static int phy_setup_sfp_port(struct phy_device *phydev)
 /**
  * phy_sfp_probe - probe for a SFP cage attached to this PHY device
  * @phydev: Pointer to phy_device
- * @ops: SFP's upstream operations
  */
-int phy_sfp_probe(struct phy_device *phydev,
-		  const struct sfp_upstream_ops *ops)
+static int phy_sfp_probe(struct phy_device *phydev)
 {
 	struct sfp_bus *bus;
 	int ret = 0;
@@ -1765,7 +1759,7 @@ int phy_sfp_probe(struct phy_device *phydev,
 
 		phydev->sfp_bus = bus;
 
-		ret = sfp_bus_add_upstream(bus, phydev, ops);
+		ret = sfp_bus_add_upstream(bus, phydev, &sfp_phydev_ops);
 		sfp_bus_put(bus);
 	}
 
@@ -1774,7 +1768,6 @@ int phy_sfp_probe(struct phy_device *phydev,
 
 	return ret;
 }
-EXPORT_SYMBOL(phy_sfp_probe);
 
 static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 {
@@ -3583,12 +3576,9 @@ static int phy_setup_ports(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	/* Use generic SFP probing only if the driver didn't do so already */
-	if (!phydev->sfp_bus) {
-		ret = phy_sfp_probe(phydev, &sfp_phydev_ops);
-		if (ret)
-			goto out;
-	}
+	ret = phy_sfp_probe(phydev);
+	if (ret)
+		goto out;
 
 	if (phydev->n_ports < phydev->max_n_ports) {
 		ret = phy_default_setup_single_port(phydev);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index d75db4a88786..1d9a84ecc1dc 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2124,12 +2124,6 @@ int phy_suspend(struct phy_device *phydev);
 int phy_resume(struct phy_device *phydev);
 int __phy_resume(struct phy_device *phydev);
 int phy_loopback(struct phy_device *phydev, bool enable, int speed);
-int phy_sfp_connect_phy(void *upstream, struct phy_device *phy);
-void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy);
-void phy_sfp_attach(void *upstream, struct sfp_bus *bus);
-void phy_sfp_detach(void *upstream, struct sfp_bus *bus);
-int phy_sfp_probe(struct phy_device *phydev,
-	          const struct sfp_upstream_ops *ops);
 struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
 			      phy_interface_t interface);
 struct phy_device *phy_find_next(struct mii_bus *bus, struct phy_device *pos);
-- 
2.49.0


