Return-Path: <linux-arm-msm+bounces-47200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D2A2D0C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9095C1881FAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836BA1EDA07;
	Fri,  7 Feb 2025 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CECoJHQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3E71E5B61;
	Fri,  7 Feb 2025 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967821; cv=none; b=OnHn1ADDjIswUc17y1pQNJGAVtpz6Xhbd0trebrDaeOX96j3DaLakL+e5Oze9u2Jzah/ceA6nECdYkoQv57sIev1KX2ZAC7RHvhS9FdmVeoG9GASZqHjhysjaGU1/EyWW4bG9R53dIOxLT7n0agSmpa1EE82BW8/sLSbOajLk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967821; c=relaxed/simple;
	bh=wI7+rJAZo97hQv+UfeCIU4GtbZmqsLrBS10KSs8fzR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCEkZhdjXPqUKg1T1haqkfnAsws4GJJCUPrbfh/GaQ4VNVDK63TTXodZ5UrIVB+/wmJrOUjjfIaLI9cEA1yZWHCZyldKES8CdFTUo5jTU2boIMeu3mvPDiKLNV0Yc0rDrHyDw6niQknzwDkaYwzE9VS/5ZpIcQZ4aAXv6LidrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CECoJHQ/; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 134AB204DA;
	Fri,  7 Feb 2025 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738967817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aA5m3YdlpCJ5BLiF0i2ytw++GibD4Bbwg62u27i8F74=;
	b=CECoJHQ/+82WhK/SW5xjMHGFjj4yInduEre/UQm9iIV2w6LbOscv4Tr9wiOhV7XMqG24c6
	xPqSuMDzRKh8/PwB7rV79NdqJf1Y4utjBBv8d9qrFUGPtyq3jmmk+nhZUqAuAK6yw8DieN
	kkc1Jzp4pvSebW/6lmG7W6Cs9+d8reU0vi57fKa8SUk9zziOBqOEQJSNZKbbgVfH6wB4Ty
	8l4M1feduMLuTPXBvoAcdg82LL871N67IDvldDOTtIOs/DY2g8cpMQELljyPuwIsRofc/r
	2EX9FYZKOANnVHsEFazlZAteMuROCRqFcgcn1Q4xinbXadC7nLC+tlmftw7EEQ==
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
Subject: [PATCH net-next 11/13] net: phy: Only rely on phy_port for PHY-driven SFP
Date: Fri,  7 Feb 2025 23:36:30 +0100
Message-ID: <20250207223634.600218-12-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemtggtfegtmeeglehfgeemfeeiheehmegsheejgeenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemtggtfegtmeeglehfgeemfeeiheehmegsheejgedphhgvlhhopehfvgguohhrrgdquddrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Now that all PHY drivers that support downstream SFP have been converted
to phy_port serdes handling, we can make the generic PHY SFP handling
mandatory, thus making all phylib sfp helpers static.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_device.c | 28 +++++++++-------------------
 include/linux/phy.h          |  6 ------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 4aac9644c25c..9ae9607e0cd4 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1354,7 +1354,7 @@ static DEVICE_ATTR_RO(phy_standalone);
  *
  * Return: 0 on success, otherwise a negative error code.
  */
-int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
+static int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
 {
 	struct phy_device *phydev = upstream;
 	struct net_device *dev = phydev->attached_dev;
@@ -1364,7 +1364,6 @@ int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	return 0;
 }
-EXPORT_SYMBOL(phy_sfp_connect_phy);
 
 /**
  * phy_sfp_disconnect_phy - Disconnect the SFP module's PHY from the upstream PHY
@@ -1376,7 +1375,7 @@ EXPORT_SYMBOL(phy_sfp_connect_phy);
  * will be destroyed, re-inserting the same module will add a new phy with a
  * new index.
  */
-void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
+static void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
 {
 	struct phy_device *phydev = upstream;
 	struct net_device *dev = phydev->attached_dev;
@@ -1384,7 +1383,6 @@ void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
 	if (dev)
 		phy_link_topo_del_phy(dev, phy);
 }
-EXPORT_SYMBOL(phy_sfp_disconnect_phy);
 
 /**
  * phy_sfp_attach - attach the SFP bus to the PHY upstream network device
@@ -1393,7 +1391,7 @@ EXPORT_SYMBOL(phy_sfp_disconnect_phy);
  *
  * This is used to fill in the sfp_upstream_ops .attach member.
  */
-void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
+static void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
 {
 	struct phy_device *phydev = upstream;
 
@@ -1401,7 +1399,6 @@ void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
 		phydev->attached_dev->sfp_bus = bus;
 	phydev->sfp_bus_attached = true;
 }
-EXPORT_SYMBOL(phy_sfp_attach);
 
 /**
  * phy_sfp_detach - detach the SFP bus from the PHY upstream network device
@@ -1410,7 +1407,7 @@ EXPORT_SYMBOL(phy_sfp_attach);
  *
  * This is used to fill in the sfp_upstream_ops .detach member.
  */
-void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
+static void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 {
 	struct phy_device *phydev = upstream;
 
@@ -1418,7 +1415,6 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 		phydev->attached_dev->sfp_bus = NULL;
 	phydev->sfp_bus_attached = false;
 }
-EXPORT_SYMBOL(phy_sfp_detach);
 
 static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
@@ -1561,10 +1557,8 @@ static int phy_setup_sfp_port(struct phy_device *phydev)
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
@@ -1576,7 +1570,7 @@ int phy_sfp_probe(struct phy_device *phydev,
 
 		phydev->sfp_bus = bus;
 
-		ret = sfp_bus_add_upstream(bus, phydev, ops);
+		ret = sfp_bus_add_upstream(bus, phydev, &sfp_phydev_ops);
 		sfp_bus_put(bus);
 	}
 
@@ -1585,7 +1579,6 @@ int phy_sfp_probe(struct phy_device *phydev,
 
 	return ret;
 }
-EXPORT_SYMBOL(phy_sfp_probe);
 
 static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 {
@@ -3635,12 +3628,9 @@ static int phy_setup_ports(struct phy_device *phydev)
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
index b850af2500e4..12cf2d81567c 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1909,12 +1909,6 @@ int phy_suspend(struct phy_device *phydev);
 int phy_resume(struct phy_device *phydev);
 int __phy_resume(struct phy_device *phydev);
 int phy_loopback(struct phy_device *phydev, bool enable);
-int phy_sfp_connect_phy(void *upstream, struct phy_device *phy);
-void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy);
-void phy_sfp_attach(void *upstream, struct sfp_bus *bus);
-void phy_sfp_detach(void *upstream, struct sfp_bus *bus);
-int phy_sfp_probe(struct phy_device *phydev,
-	          const struct sfp_upstream_ops *ops);
 struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
 			      phy_interface_t interface);
 struct phy_device *phy_find_first(struct mii_bus *bus);
-- 
2.48.1


