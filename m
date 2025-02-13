Return-Path: <linux-arm-msm+bounces-47889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55472A33C88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 11:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D62B63AC536
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 10:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23310217712;
	Thu, 13 Feb 2025 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gXTTaW0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D3212FAC;
	Thu, 13 Feb 2025 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441795; cv=none; b=LfQLGs8md8IYFSpGGw4OGYDk97S5pnLz6SWakz9T9Wx8vJGnx333P2haZdTN8u2nx14/kyamcx/Ii8mUVfHv/cTKlERfgAbxTabunJSgrHdbsku/bE53QNTKdTeeUTsXKlEXAmzdNFlZxFl4IYJwlHQY8pbQpMCuu0iIc25nn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441795; c=relaxed/simple;
	bh=wufiFpRUKBCfveq6FTsvbY+37GjERNCfOMmYvYI22JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8bUq1S1cOez8RcaLuMF2Ml8JYTd/OgT+w28HucW5DWeOj7ClBU/ch4K5eGiFsQHJUwjf2J8c6of6SiowypdxnGmJ25bB3A7IineIHT28fM2ZB362lhwWt2Hg/L3QI5zkbkPCuGnK0SWysYtqEOAFJ8oZv1ayIv4R1UTUFoqBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gXTTaW0g; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9534432B7;
	Thu, 13 Feb 2025 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739441791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9eLT9JomQ5Q9HrSA9RoPCZ5XH9zArIZma4oIIjl1j0=;
	b=gXTTaW0gOEfreQjA3L9wmfT9WA+73uynCq71wjMmt9w5ChvqtcaFVl4hYFMAKzoUZJ9gAa
	t7xya3CRy4BFgAs4L6rgZJRRfdFZ8Sf7oanBAW/QwxneXtE9HEYSi6fj2NxDKRLjFVhDXs
	5MjQxpe9LMYz6wWlqSdy3JV9TKMWjuLC+gGuR/u2TmjmbdVeiKhHlvgrITHwbjn+N7tykb
	P1DeuUCf51/5QafwTkOxxGiACBNvG16HfQ1+m5tlNn4V5XkVhlIi1oGoMKh97eiyfAJweY
	pQXSKLoE8elJPiaU89bLJ3Nzgdl1luB2XTs0c34JkeRqTct2P/T4tw4FMCdP+g==
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
	Sean Anderson <seanga2@gmail.com>
Subject: [PATCH net-next v4 12/15] net: phy: Only rely on phy_port for PHY-driven SFP
Date: Thu, 13 Feb 2025 11:16:00 +0100
Message-ID: <20250213101606.1154014-13-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Now that all PHY drivers that support downstream SFP have been converted
to phy_port serdes handling, we can make the generic PHY SFP handling
mandatory, thus making all phylib sfp helpers static.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4: no changes

 drivers/net/phy/phy_device.c | 28 +++++++++-------------------
 include/linux/phy.h          |  6 ------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 8d2ee51cc1c0..50ecefccbf99 100644
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
index 51ee8803f2e1..e5202cbe72f6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1905,12 +1905,6 @@ int phy_suspend(struct phy_device *phydev);
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


