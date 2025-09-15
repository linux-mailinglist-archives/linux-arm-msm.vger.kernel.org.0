Return-Path: <linux-arm-msm+bounces-73585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA4B57D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1A6A1642CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CCA31326C;
	Mon, 15 Sep 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="xSjhsv7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD22FA0F1;
	Mon, 15 Sep 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943116; cv=none; b=A0jzkBJZ5LgtWF2yxK+O7b0NAtl/JxTCz1g3FqcqNAG0VB6KIywCxyDL2+/bSOTOCRkQpAZCgW34lIU0Y4bIYXxpkw003fk8gvIGeiscj8d3H2WHUIiIV4o7Br+XUEWbuUGOjQaIcPT10lgLxG53LTnuPgDYaGECtNt5FSSMlQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943116; c=relaxed/simple;
	bh=3uxDLpDLY3+RBOXnqKOBQS2sb9wzxLTpNbc6Z1LD8A0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=QMDFHwO5h8OrxqBy5sqsblXnnOILTLApj7yb2rjREUzykSATBHaV5SqHA9skpiyF+75OdC02zgt3RiUnOvsuLPojLIegm/QyBDATBCjRRcvqyUCq3C+xud77UTdBgo65AchZYG1rOCiRPiINzADpf7UR4xIzA+XcJvBWzGrghPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=xSjhsv7W; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sbhcmALB3N/IFiXzDdeuz+lt1vdArgsFHpLxMr/6oq0=; b=xSjhsv7WwHo5XLqeWQSunImIVl
	xMOcmrAl3pUtm8HcoXMbUu/iM+UxKc0TAisVkkZgH2L99nx186qgEeLFRA0Box4E/Y9G/zTRnP5La
	E4UYTKXZRYIyJmr0iHcNFDzXbouVbSSrr8xBeI0GEvTmu9NYq0gkGWLPSZQplCRF5Vkt1w90MsVC0
	2/0IG+CI8NsOKPytZNWgLMulNL/I4TShJ4Y1Ii3NzN8nBB0b7oTTSk1GR4DJ//u2GoEZFHyolOtpo
	e5NRRXSaTqLMmq6LIQFNtiuggok9eNSgOmsV05wmInLnJnz6u1cp1P6FMnNmBowGDQjCl3qgfFiBD
	uGj0E26Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46962 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uy9J9-000000000MO-0ZWL;
	Mon, 15 Sep 2025 14:31:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uy9J8-00000005jg1-1lhL;
	Mon, 15 Sep 2025 14:31:50 +0100
In-Reply-To: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	"Marek Beh__n" <kabel@kernel.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/7] net: sfp: pre-parse the module support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uy9J8-00000005jg1-1lhL@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 15 Sep 2025 14:31:50 +0100

Pre-parse the module support on insert rather than when the upstream
requests the data. This will allow more flexible and extensible
parsing.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/sfp-bus.c | 80 +++++++++++++++++++++++++++------------
 include/linux/sfp.h       | 22 +++++++++++
 2 files changed, 77 insertions(+), 25 deletions(-)

diff --git a/drivers/net/phy/sfp-bus.c b/drivers/net/phy/sfp-bus.c
index f13c00b5b449..18e5d3de63a8 100644
--- a/drivers/net/phy/sfp-bus.c
+++ b/drivers/net/phy/sfp-bus.c
@@ -22,7 +22,6 @@ struct sfp_bus {
 	const struct sfp_socket_ops *socket_ops;
 	struct device *sfp_dev;
 	struct sfp *sfp;
-	const struct sfp_quirk *sfp_quirk;
 
 	const struct sfp_upstream_ops *upstream_ops;
 	void *upstream;
@@ -30,6 +29,8 @@ struct sfp_bus {
 
 	bool registered;
 	bool started;
+
+	struct sfp_module_caps caps;
 };
 
 /**
@@ -48,6 +49,13 @@ struct sfp_bus {
  */
 int sfp_parse_port(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
 		   unsigned long *support)
+{
+	return bus->caps.port;
+}
+EXPORT_SYMBOL_GPL(sfp_parse_port);
+
+static void sfp_module_parse_port(struct sfp_bus *bus,
+				  const struct sfp_eeprom_id *id)
 {
 	int port;
 
@@ -91,21 +99,18 @@ int sfp_parse_port(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
 		break;
 	}
 
-	if (support) {
-		switch (port) {
-		case PORT_FIBRE:
-			phylink_set(support, FIBRE);
-			break;
+	switch (port) {
+	case PORT_FIBRE:
+		phylink_set(bus->caps.link_modes, FIBRE);
+		break;
 
-		case PORT_TP:
-			phylink_set(support, TP);
-			break;
-		}
+	case PORT_TP:
+		phylink_set(bus->caps.link_modes, TP);
+		break;
 	}
 
-	return port;
+	bus->caps.port = port;
 }
-EXPORT_SYMBOL_GPL(sfp_parse_port);
 
 /**
  * sfp_may_have_phy() - indicate whether the module may have a PHY
@@ -117,8 +122,17 @@ EXPORT_SYMBOL_GPL(sfp_parse_port);
  */
 bool sfp_may_have_phy(struct sfp_bus *bus, const struct sfp_eeprom_id *id)
 {
-	if (id->base.e1000_base_t)
-		return true;
+	return bus->caps.may_have_phy;
+}
+EXPORT_SYMBOL_GPL(sfp_may_have_phy);
+
+static void sfp_module_may_have_phy(struct sfp_bus *bus,
+				    const struct sfp_eeprom_id *id)
+{
+	if (id->base.e1000_base_t) {
+		bus->caps.may_have_phy = true;
+		return;
+	}
 
 	if (id->base.phys_id != SFF8024_ID_DWDM_SFP) {
 		switch (id->base.extended_cc) {
@@ -126,13 +140,13 @@ bool sfp_may_have_phy(struct sfp_bus *bus, const struct sfp_eeprom_id *id)
 		case SFF8024_ECC_10GBASE_T_SR:
 		case SFF8024_ECC_5GBASE_T:
 		case SFF8024_ECC_2_5GBASE_T:
-			return true;
+			bus->caps.may_have_phy = true;
+			return;
 		}
 	}
 
-	return false;
+	bus->caps.may_have_phy = false;
 }
-EXPORT_SYMBOL_GPL(sfp_may_have_phy);
 
 /**
  * sfp_parse_support() - Parse the eeprom id for supported link modes
@@ -148,8 +162,17 @@ EXPORT_SYMBOL_GPL(sfp_may_have_phy);
 void sfp_parse_support(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
 		       unsigned long *support, unsigned long *interfaces)
 {
+	linkmode_or(support, support, bus->caps.link_modes);
+	phy_interface_copy(interfaces, bus->caps.interfaces);
+}
+EXPORT_SYMBOL_GPL(sfp_parse_support);
+
+static void sfp_module_parse_support(struct sfp_bus *bus,
+				     const struct sfp_eeprom_id *id)
+{
+	unsigned long *interfaces = bus->caps.interfaces;
+	unsigned long *modes = bus->caps.link_modes;
 	unsigned int br_min, br_nom, br_max;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(modes) = { 0, };
 
 	/* Decode the bitrate information to MBd */
 	br_min = br_nom = br_max = 0;
@@ -338,13 +361,22 @@ void sfp_parse_support(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
 	phylink_set(modes, Autoneg);
 	phylink_set(modes, Pause);
 	phylink_set(modes, Asym_Pause);
+}
+
+static void sfp_init_module(struct sfp_bus *bus,
+			    const struct sfp_eeprom_id *id,
+			    const struct sfp_quirk *quirk)
+{
+	memset(&bus->caps, 0, sizeof(bus->caps));
 
-	if (bus->sfp_quirk && bus->sfp_quirk->modes)
-		bus->sfp_quirk->modes(id, modes, interfaces);
+	sfp_module_parse_support(bus, id);
+	sfp_module_parse_port(bus, id);
+	sfp_module_may_have_phy(bus, id);
 
-	linkmode_or(support, support, modes);
+	if (quirk && quirk->modes)
+		quirk->modes(id, bus->caps.link_modes,
+			     bus->caps.interfaces);
 }
-EXPORT_SYMBOL_GPL(sfp_parse_support);
 
 /**
  * sfp_select_interface() - Select appropriate phy_interface_t mode
@@ -794,7 +826,7 @@ int sfp_module_insert(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
 	const struct sfp_upstream_ops *ops = sfp_get_upstream_ops(bus);
 	int ret = 0;
 
-	bus->sfp_quirk = quirk;
+	sfp_init_module(bus, id, quirk);
 
 	if (ops && ops->module_insert)
 		ret = ops->module_insert(bus->upstream, id);
@@ -809,8 +841,6 @@ void sfp_module_remove(struct sfp_bus *bus)
 
 	if (ops && ops->module_remove)
 		ops->module_remove(bus->upstream);
-
-	bus->sfp_quirk = NULL;
 }
 EXPORT_SYMBOL_GPL(sfp_module_remove);
 
diff --git a/include/linux/sfp.h b/include/linux/sfp.h
index 60c65cea74f6..5fb59cf49882 100644
--- a/include/linux/sfp.h
+++ b/include/linux/sfp.h
@@ -521,6 +521,28 @@ struct ethtool_eeprom;
 struct ethtool_modinfo;
 struct sfp_bus;
 
+/**
+ * struct sfp_module_caps - sfp module capabilities
+ * @interfaces: bitmap of interfaces that the module may support
+ * @link_modes: bitmap of ethtool link modes that the module may support
+ */
+struct sfp_module_caps {
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(link_modes);
+	/**
+	 * @may_have_phy: indicate whether the module may have an ethernet PHY
+	 * There is no way to be sure that a module has a PHY as the EEPROM
+	 * doesn't contain this information. When set, this does not mean that
+	 * the module definitely has a PHY.
+	 */
+	bool may_have_phy;
+	/**
+	 * @port: one of ethtool %PORT_* definitions, parsed from the module
+	 * EEPROM, or %PORT_OTHER if the port type is not known.
+	 */
+	u8 port;
+};
+
 /**
  * struct sfp_upstream_ops - upstream operations structure
  * @attach: called when the sfp socket driver is bound to the upstream
-- 
2.47.3


