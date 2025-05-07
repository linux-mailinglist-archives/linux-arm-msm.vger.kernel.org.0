Return-Path: <linux-arm-msm+bounces-57159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E711AAE209
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 577DC1BA2FDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B783B28FA81;
	Wed,  7 May 2025 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZezIp2/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E956428FAA6;
	Wed,  7 May 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626060; cv=none; b=iTPBDTQDshfll+Iyj5CgfunKJ2HqI0YPkDJD4jfzUpd2SP/yKqB6XL2KlUeVXO3LTCzy7XAlVAFnV240KMe078kKpju/rhisGr74yY1IWvPmGUR7e7rlYz1c6DM1oamWv9CbdaHa3TsaAJG6N35TRbWBKVGjOGPZxAQLS5TfjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626060; c=relaxed/simple;
	bh=oUJ/YRN2wcgS+LHSZ+JTzN55jZuX71Owm8hBJYXRaRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7/sSbJ3IT3La3wsDJUzTfspQzvdk8ZZZ0l3cPxLDaR/dQx00jaRvGAtfrbhJtj/YlQYooUrkB1gCyQpZ/ljKqTgeTnin2M0Kgs1sVSvSBc3TDAKtzfmSvlSpmHDp38U/WjmfqtZHF1e/PTEWpJJv8/MBWtB4IzHUh1Up/HEg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZezIp2/b; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5607543B6D;
	Wed,  7 May 2025 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746626054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5tIBBWNCHefTtgZukaX1JcW3PaspQi2v6MoyKdEzeg=;
	b=ZezIp2/bDHSCb9ozLm8yPPMkUYa69resBNzCd8Mp7HgvUjrpPkb5iRuK9GJUnhqqEaPeQJ
	TB28xd1oB9MnryJcBFsIE9q2VWxecFRJFfKEeQRdfZf/vIN6+XeOrs3mgIilgiVyeQ+Qe3
	6wZ9pZqfLLOrIOfIKO0qBco7tXAYGrnsLe2pbw8NkXACdExb0xfeLQxw2BjmtNEN4T6alL
	mQOt5Hbn+1Xvp/mOqeI+1CmWFd35rwOSbyFTitZOTZ9OFJguRJygHfoGOv4LVfmXgK2jap
	ubZWrlues1CHJRI4BQJEOGiAcwLyoQbUzlwwPAjiWTrwqlIarcpC1ww9Qxf7xg==
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
Subject: [PATCH net-next v6 12/14] net: phy: Only rely on phy_port for PHY-driven SFP
Date: Wed,  7 May 2025 15:53:28 +0200
Message-ID: <20250507135331.76021-13-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtvdemkeeggedtmehfhedtsgemfedvheemrgeigeefmedufheiugemfhgvrgegmeegsgduieenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeegtdemfhehtdgsmeefvdehmegrieegfeemudhfiegumehfvggrgeemgegsudeipdhhvghlohepvdgrtddvqdekgeegtddqfhehtdgsqddtfedvhedqrgeigeefqddufheiugdqfhgvrgegqdegsgduiedrrhgvvhdrshhfrhdrnhgvthdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvv
 hgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
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
index aca3a47cbb66..7f319526a7fe 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1384,7 +1384,7 @@ static DEVICE_ATTR_RO(phy_standalone);
  *
  * Return: 0 on success, otherwise a negative error code.
  */
-int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
+static int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
 {
 	struct phy_device *phydev = upstream;
 	struct net_device *dev = phydev->attached_dev;
@@ -1394,7 +1394,6 @@ int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	return 0;
 }
-EXPORT_SYMBOL(phy_sfp_connect_phy);
 
 /**
  * phy_sfp_disconnect_phy - Disconnect the SFP module's PHY from the upstream PHY
@@ -1406,7 +1405,7 @@ EXPORT_SYMBOL(phy_sfp_connect_phy);
  * will be destroyed, re-inserting the same module will add a new phy with a
  * new index.
  */
-void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
+static void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
 {
 	struct phy_device *phydev = upstream;
 	struct net_device *dev = phydev->attached_dev;
@@ -1414,7 +1413,6 @@ void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
 	if (dev)
 		phy_link_topo_del_phy(dev, phy);
 }
-EXPORT_SYMBOL(phy_sfp_disconnect_phy);
 
 /**
  * phy_sfp_attach - attach the SFP bus to the PHY upstream network device
@@ -1423,7 +1421,7 @@ EXPORT_SYMBOL(phy_sfp_disconnect_phy);
  *
  * This is used to fill in the sfp_upstream_ops .attach member.
  */
-void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
+static void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
 {
 	struct phy_device *phydev = upstream;
 
@@ -1431,7 +1429,6 @@ void phy_sfp_attach(void *upstream, struct sfp_bus *bus)
 		phydev->attached_dev->sfp_bus = bus;
 	phydev->sfp_bus_attached = true;
 }
-EXPORT_SYMBOL(phy_sfp_attach);
 
 /**
  * phy_sfp_detach - detach the SFP bus from the PHY upstream network device
@@ -1440,7 +1437,7 @@ EXPORT_SYMBOL(phy_sfp_attach);
  *
  * This is used to fill in the sfp_upstream_ops .detach member.
  */
-void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
+static void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 {
 	struct phy_device *phydev = upstream;
 
@@ -1448,7 +1445,6 @@ void phy_sfp_detach(void *upstream, struct sfp_bus *bus)
 		phydev->attached_dev->sfp_bus = NULL;
 	phydev->sfp_bus_attached = false;
 }
-EXPORT_SYMBOL(phy_sfp_detach);
 
 static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
 {
@@ -1591,10 +1587,8 @@ static int phy_setup_sfp_port(struct phy_device *phydev)
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
@@ -1606,7 +1600,7 @@ int phy_sfp_probe(struct phy_device *phydev,
 
 		phydev->sfp_bus = bus;
 
-		ret = sfp_bus_add_upstream(bus, phydev, ops);
+		ret = sfp_bus_add_upstream(bus, phydev, &sfp_phydev_ops);
 		sfp_bus_put(bus);
 	}
 
@@ -1615,7 +1609,6 @@ int phy_sfp_probe(struct phy_device *phydev,
 
 	return ret;
 }
-EXPORT_SYMBOL(phy_sfp_probe);
 
 static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 {
@@ -3432,12 +3425,9 @@ static int phy_setup_ports(struct phy_device *phydev)
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
index aef13fab8882..4df1c951dcf2 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1796,12 +1796,6 @@ int phy_suspend(struct phy_device *phydev);
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
 struct phy_device *phy_find_first(struct mii_bus *bus);
-- 
2.49.0


