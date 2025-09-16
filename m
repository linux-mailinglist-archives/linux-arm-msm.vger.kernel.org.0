Return-Path: <linux-arm-msm+bounces-73813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD5B5A433
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE3F52414E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385DD2F5A2F;
	Tue, 16 Sep 2025 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="rYoC83Uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8192E92D0;
	Tue, 16 Sep 2025 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059233; cv=none; b=HnQBxXtlzagGUKYv9XrPCzonspw6pj0VJG5RDiy0nu8kEc6QSFoi+OWkxzubgiqahS1Y9STiRUmdzN0luoi7oLGOAQT3M0zh/RLG8UY/9LGyickfmGCBT+CzHUA0jaI+cPXnbt3N+oX1bpjdxT99zz/9VQSvHUcNuIpIUx9QIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059233; c=relaxed/simple;
	bh=kxIW5dxCqalhpFmoDO3aaqWJ44pGzvhHUZg+09t33GI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=eD2B7/G8+G8MpqoVgYwUkl8+fByG5+UPXZL27L6N0ll88GVbLfmIdKzbegY1l50UW4JFT32Rl6K+qq+ATbOme/C90p0yvWNkZRLcY5LNM8IoRApkxILBix54n2glNz3IrfB0BPP8bxyXjtPb8WOjU2TMh5iSZLAMoFAaiuhzEBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=rYoC83Uq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qcVW22TOs2gRLP7G+Xi6iKltAJreHyc3R//4lQkBChk=; b=rYoC83Uq2KbtedpqHZxFdaHjS6
	F96Kkqec3r9B4vtLA5X6FgmvfiWyAUM5Lci8OLS9Btlz5nW3HzDDSPf9ZLQZo8+4O7zUPfQgG7NDC
	9mNQfpLqsNuyyq7Rneh0noxKxxs0IJ+1mBYrf5SFZtVRwIHUVKvIMjiotzPSLg0925ch/UES61Lyn
	mDg4XusFlNI8i0zTdJukkHcRP0k4AFwdPyojnyWYTqWTSDeHT5kgigj/boZWVaRX4WuT9Lx4KUtDr
	Lyy3xgI+sjFAjKGinjOME4KgznPTlj6+rH9YvTqNMrHLHVjCS13yVF7yULVq6tiwMuvNo4Q12OFYG
	AwCOLCaw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37946 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uydVz-000000006QK-4B90;
	Tue, 16 Sep 2025 22:47:08 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uydVz-000000061Wj-13Yd;
	Tue, 16 Sep 2025 22:47:07 +0100
In-Reply-To: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
References: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 7/7] net: sfp: remove old sfp_parse_* functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uydVz-000000061Wj-13Yd@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 16 Sep 2025 22:47:07 +0100

Remove the old sfp_parse_*() functions that are now no longer used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/sfp-bus.c | 54 ---------------------------------------
 include/linux/sfp.h       | 25 ------------------
 2 files changed, 79 deletions(-)

diff --git a/drivers/net/phy/sfp-bus.c b/drivers/net/phy/sfp-bus.c
index e8cf411396fa..b945d75966d5 100644
--- a/drivers/net/phy/sfp-bus.c
+++ b/drivers/net/phy/sfp-bus.c
@@ -39,27 +39,6 @@ const struct sfp_module_caps *sfp_get_module_caps(struct sfp_bus *bus)
 }
 EXPORT_SYMBOL_GPL(sfp_get_module_caps);
 
-/**
- * sfp_parse_port() - Parse the EEPROM base ID, setting the port type
- * @bus: a pointer to the &struct sfp_bus structure for the sfp module
- * @id: a pointer to the module's &struct sfp_eeprom_id
- * @support: optional pointer to an array of unsigned long for the
- *   ethtool support mask
- *
- * Parse the EEPROM identification given in @id, and return one of
- * %PORT_TP, %PORT_FIBRE or %PORT_OTHER. If @support is non-%NULL,
- * also set the ethtool %ETHTOOL_LINK_MODE_xxx_BIT corresponding with
- * the connector type.
- *
- * If the port type is not known, returns %PORT_OTHER.
- */
-int sfp_parse_port(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
-		   unsigned long *support)
-{
-	return bus->caps.port;
-}
-EXPORT_SYMBOL_GPL(sfp_parse_port);
-
 static void sfp_module_parse_port(struct sfp_bus *bus,
 				  const struct sfp_eeprom_id *id)
 {
@@ -118,20 +97,6 @@ static void sfp_module_parse_port(struct sfp_bus *bus,
 	bus->caps.port = port;
 }
 
-/**
- * sfp_may_have_phy() - indicate whether the module may have a PHY
- * @bus: a pointer to the &struct sfp_bus structure for the sfp module
- * @id: a pointer to the module's &struct sfp_eeprom_id
- *
- * Parse the EEPROM identification given in @id, and return whether
- * this module may have a PHY.
- */
-bool sfp_may_have_phy(struct sfp_bus *bus, const struct sfp_eeprom_id *id)
-{
-	return bus->caps.may_have_phy;
-}
-EXPORT_SYMBOL_GPL(sfp_may_have_phy);
-
 static void sfp_module_parse_may_have_phy(struct sfp_bus *bus,
 					  const struct sfp_eeprom_id *id)
 {
@@ -154,25 +119,6 @@ static void sfp_module_parse_may_have_phy(struct sfp_bus *bus,
 	bus->caps.may_have_phy = false;
 }
 
-/**
- * sfp_parse_support() - Parse the eeprom id for supported link modes
- * @bus: a pointer to the &struct sfp_bus structure for the sfp module
- * @id: a pointer to the module's &struct sfp_eeprom_id
- * @support: pointer to an array of unsigned long for the ethtool support mask
- * @interfaces: pointer to an array of unsigned long for phy interface modes
- *		mask
- *
- * Parse the EEPROM identification information and derive the supported
- * ethtool link modes for the module.
- */
-void sfp_parse_support(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
-		       unsigned long *support, unsigned long *interfaces)
-{
-	linkmode_or(support, support, bus->caps.link_modes);
-	phy_interface_copy(interfaces, bus->caps.interfaces);
-}
-EXPORT_SYMBOL_GPL(sfp_parse_support);
-
 static void sfp_module_parse_support(struct sfp_bus *bus,
 				     const struct sfp_eeprom_id *id)
 {
diff --git a/include/linux/sfp.h b/include/linux/sfp.h
index 9f29fcad52be..5c71945a5e4d 100644
--- a/include/linux/sfp.h
+++ b/include/linux/sfp.h
@@ -577,11 +577,6 @@ struct sfp_upstream_ops {
 
 #if IS_ENABLED(CONFIG_SFP)
 const struct sfp_module_caps *sfp_get_module_caps(struct sfp_bus *bus);
-int sfp_parse_port(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
-		   unsigned long *support);
-bool sfp_may_have_phy(struct sfp_bus *bus, const struct sfp_eeprom_id *id);
-void sfp_parse_support(struct sfp_bus *bus, const struct sfp_eeprom_id *id,
-		       unsigned long *support, unsigned long *interfaces);
 phy_interface_t sfp_select_interface(struct sfp_bus *bus,
 				     const unsigned long *link_modes);
 
@@ -607,26 +602,6 @@ sfp_get_module_caps(struct sfp_bus *bus)
 	return NULL;
 }
 
-static inline int sfp_parse_port(struct sfp_bus *bus,
-				 const struct sfp_eeprom_id *id,
-				 unsigned long *support)
-{
-	return PORT_OTHER;
-}
-
-static inline bool sfp_may_have_phy(struct sfp_bus *bus,
-				    const struct sfp_eeprom_id *id)
-{
-	return false;
-}
-
-static inline void sfp_parse_support(struct sfp_bus *bus,
-				     const struct sfp_eeprom_id *id,
-				     unsigned long *support,
-				     unsigned long *interfaces)
-{
-}
-
 static inline phy_interface_t sfp_select_interface(struct sfp_bus *bus,
 						const unsigned long *link_modes)
 {
-- 
2.47.3


