Return-Path: <linux-arm-msm+bounces-73809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E17B5A42B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B939A1C017E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97D52F5A25;
	Tue, 16 Sep 2025 21:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="BIh8XLjr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09003276022;
	Tue, 16 Sep 2025 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059212; cv=none; b=DnQDIQcsTAhZbagpsnR+652teH9dhc+WBW18F6dFQHvUNbr4crochUIcuO4zHGEOFykjzkf7nMcIqOioS0Psf4fu5WRWbK4B5H6NLb8oHvLdh+UgIJYFWhme+ZF/3NhCLqLg67v0RjJisPt1VDtlTKTWuQzI3C0Hn+l6xDjAzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059212; c=relaxed/simple;
	bh=4OpOATQQnBa+4DcRQ1lrJXYg8RjO3LhyBtLQfVW/Fg8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=J3jpm2c+1qCRMns9Qyo3zKxW3mC6FWYbdIU92EuIAPx+HqlxqZztx23/biC7kDUStE4bmOyiEeVqbzxZ57VEGZw+HAtetwggEM21ufaupNgbfGQt6Jq4OumZppthNd4kdHzmZs/HVrabRjLmPVnehLAjuzHSggUhUGUKVPKuhuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=BIh8XLjr; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U5jSzw1vCyRVAlOq6rFdT9IxD0X85FOPonWw5QFf5rk=; b=BIh8XLjrf23e9F5P6OTZcv52Ld
	9pHVXW0A4PfCX2BVDcpbkS3JhV4vVXzgOGmjPyWdBlVwpRjP+3B5Vi5l3bhnO97JH9nBmm9qOsQkY
	eW1hRJ+gS56bJTyxPxOx9Q/4HGcZnEL60NwaEnJVcKLEAj82rxHkN5vP2S1iHyJ9OlXNVWZtzNIQ6
	Hy4kby7zZxmPuLmoUsZjiQ49RPSMTvX+kLJ1skIsBwka4yuqvnyW+g8NoY6yBKCZeQYZ88tQLawkP
	vajW9kYLl9y9qEx2/L9AZsl8ySzuT5kdqVAlT2nUEH1j98dFk1sPqk/lamyOA6y4Y61HRsi0IdbhZ
	DsvGsJMA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37262 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uydVf-000000006PP-26dt;
	Tue, 16 Sep 2025 22:46:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uydVe-000000061WK-3KwI;
	Tue, 16 Sep 2025 22:46:46 +0100
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
Subject: [PATCH net-next 3/7] net: sfp: convert sfp quirks to modify struct
 sfp_module_support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uydVe-000000061WK-3KwI@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 16 Sep 2025 22:46:46 +0100

In order to provide extensible module support properties, arrange for
the SFP quirks to modify any member of the sfp_module_support struct,
rather than just the ethtool link modes and interfaces.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/sfp-bus.c |  5 ++--
 drivers/net/phy/sfp.c     | 49 +++++++++++++++++++--------------------
 drivers/net/phy/sfp.h     |  4 ++--
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/net/phy/sfp-bus.c b/drivers/net/phy/sfp-bus.c
index 35030c527fbe..b77190494b04 100644
--- a/drivers/net/phy/sfp-bus.c
+++ b/drivers/net/phy/sfp-bus.c
@@ -373,9 +373,8 @@ static void sfp_init_module(struct sfp_bus *bus,
 	sfp_module_parse_port(bus, id);
 	sfp_module_parse_may_have_phy(bus, id);
 
-	if (quirk && quirk->modes)
-		quirk->modes(id, bus->caps.link_modes,
-			     bus->caps.interfaces);
+	if (quirk && quirk->support)
+		quirk->support(id, &bus->caps);
 }
 
 /**
diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 4cd1d6c51dc2..d49f91ac2e50 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -440,45 +440,44 @@ static void sfp_fixup_rollball_cc(struct sfp *sfp)
 }
 
 static void sfp_quirk_2500basex(const struct sfp_eeprom_id *id,
-				unsigned long *modes,
-				unsigned long *interfaces)
+				struct sfp_module_caps *caps)
 {
-	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseX_Full_BIT, modes);
-	__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseX_Full_BIT,
+			 caps->link_modes);
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX, caps->interfaces);
 }
 
 static void sfp_quirk_disable_autoneg(const struct sfp_eeprom_id *id,
-				      unsigned long *modes,
-				      unsigned long *interfaces)
+				      struct sfp_module_caps *caps)
 {
-	linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, modes);
+	linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, caps->link_modes);
 }
 
 static void sfp_quirk_oem_2_5g(const struct sfp_eeprom_id *id,
-			       unsigned long *modes,
-			       unsigned long *interfaces)
+			       struct sfp_module_caps *caps)
 {
 	/* Copper 2.5G SFP */
-	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, modes);
-	__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
-	sfp_quirk_disable_autoneg(id, modes, interfaces);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+			 caps->link_modes);
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX, caps->interfaces);
+	sfp_quirk_disable_autoneg(id, caps);
 }
 
 static void sfp_quirk_ubnt_uf_instant(const struct sfp_eeprom_id *id,
-				      unsigned long *modes,
-				      unsigned long *interfaces)
+				      struct sfp_module_caps *caps)
 {
 	/* Ubiquiti U-Fiber Instant module claims that support all transceiver
 	 * types including 10G Ethernet which is not truth. So clear all claimed
 	 * modes and set only one mode which module supports: 1000baseX_Full.
 	 */
-	linkmode_zero(modes);
-	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT, modes);
+	linkmode_zero(caps->link_modes);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT,
+			 caps->link_modes);
 }
 
-#define SFP_QUIRK(_v, _p, _m, _f) \
-	{ .vendor = _v, .part = _p, .modes = _m, .fixup = _f, }
-#define SFP_QUIRK_M(_v, _p, _m) SFP_QUIRK(_v, _p, _m, NULL)
+#define SFP_QUIRK(_v, _p, _s, _f) \
+	{ .vendor = _v, .part = _p, .support = _s, .fixup = _f, }
+#define SFP_QUIRK_S(_v, _p, _s) SFP_QUIRK(_v, _p, _s, NULL)
 #define SFP_QUIRK_F(_v, _p, _f) SFP_QUIRK(_v, _p, NULL, _f)
 
 static const struct sfp_quirk sfp_quirks[] = {
@@ -514,7 +513,7 @@ static const struct sfp_quirk sfp_quirks[] = {
 
 	// HG MXPD-483II-F 2.5G supports 2500Base-X, but incorrectly reports
 	// 2600MBd in their EERPOM
-	SFP_QUIRK_M("HG GENUINE", "MXPD-483II", sfp_quirk_2500basex),
+	SFP_QUIRK_S("HG GENUINE", "MXPD-483II", sfp_quirk_2500basex),
 
 	// Huawei MA5671A can operate at 2500base-X, but report 1.2GBd NRZ in
 	// their EEPROM
@@ -523,9 +522,9 @@ static const struct sfp_quirk sfp_quirks[] = {
 
 	// Lantech 8330-262D-E can operate at 2500base-X, but incorrectly report
 	// 2500MBd NRZ in their EEPROM
-	SFP_QUIRK_M("Lantech", "8330-262D-E", sfp_quirk_2500basex),
+	SFP_QUIRK_S("Lantech", "8330-262D-E", sfp_quirk_2500basex),
 
-	SFP_QUIRK_M("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
+	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
 
 	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
 	// Rollball protocol to talk to the PHY.
@@ -538,9 +537,9 @@ static const struct sfp_quirk sfp_quirks[] = {
 	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
 
 	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
-	SFP_QUIRK_M("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
-	SFP_QUIRK_M("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
-	SFP_QUIRK_M("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
+	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
+	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
+	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
 	SFP_QUIRK_F("OEM", "RTSFP-10", sfp_fixup_rollball_cc),
 	SFP_QUIRK_F("OEM", "RTSFP-10G", sfp_fixup_rollball_cc),
 	SFP_QUIRK_F("Turris", "RTSFP-2.5G", sfp_fixup_rollball),
diff --git a/drivers/net/phy/sfp.h b/drivers/net/phy/sfp.h
index 1fd097dccb9f..879dff7afe6a 100644
--- a/drivers/net/phy/sfp.h
+++ b/drivers/net/phy/sfp.h
@@ -9,8 +9,8 @@ struct sfp;
 struct sfp_quirk {
 	const char *vendor;
 	const char *part;
-	void (*modes)(const struct sfp_eeprom_id *id, unsigned long *modes,
-		      unsigned long *interfaces);
+	void (*support)(const struct sfp_eeprom_id *id,
+			struct sfp_module_caps *caps);
 	void (*fixup)(struct sfp *sfp);
 };
 
-- 
2.47.3


