Return-Path: <linux-arm-msm+bounces-27777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC91945C47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 12:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B0C1F21471
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 10:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763451DB444;
	Fri,  2 Aug 2024 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hbgxXwxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2541DB423;
	Fri,  2 Aug 2024 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722595634; cv=none; b=L60H3T/KiEgwIN2/dikthWm9AqDgPl3s4xZEGVPt3Cg87hoKmqAGuw/mhgBaKBQdjb1BUCGZffWzrtItpIuOiZ7KuEhE0fxIUePCgC3R/Z3zdLDi6CYAt+CAZjiVADQHKYlVhoWRZsgOz03xtdJjAy9dtq5NFcjQokQI49HmNng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722595634; c=relaxed/simple;
	bh=K+z1J21KYpXed9CRxiSyQ6P8nDT8XSx/VBd76MnlTNw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=N8dEz/7wi1Z7U4w4NS3VDXVG07df3X5qmJWTYQbBvNP4lCdaSgZX5hyMsWBiQrMFoBVZQ53cmdN++eydvMOIwi4u4AEHzbhevD6Of+CnbYiY9Rg5G6/du7teVtqHCbeHnZtCqFVvFcGayeqDJwOtd9ygMfkVwGdmgMVbD5+fIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=hbgxXwxq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EpjH42ZYRLEtWP1bc9GI1pFyG22AKovRXxMyj5jwJD0=; b=hbgxXwxqnVcpC3nWpRl7iuoWyQ
	90gTv6bprDmuUxZBzhW6TNVkuE/YSotvkZgJNRhAwu5ZlG/KSqfLVbo1++hhbS8l06Vkl+FZgkO09
	mmJZArinx+Kqyf2QBUmqK0oMkZoD8bjX0jbUnLtQ/lKPvCmgD5LZP5j5V/9mYx11KmCFb9JCuTyOH
	CFUHU+jqHrc38YRCLnFoHLTr7Lc4AWv2hlumC8/rhymTAYYMf0+ousGaeLlCJKvuhu2Ql6H8ydLng
	pIxGSvh/LVltR591csAgDvvpFnAXrs7NPpeO+jlmVO7VylLMQOIciogQoMqMSOLz493ur37SU3c8S
	G3V8uHaA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40360 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1sZpnz-0006EH-1z;
	Fri, 02 Aug 2024 11:46:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1sZpo1-000eH2-6W; Fri, 02 Aug 2024 11:46:41 +0100
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 03/14] net: stmmac: remove pcs_get_adv_lp() support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1sZpo1-000eH2-6W@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 02 Aug 2024 11:46:41 +0100

Discussing with Serge Semin, it appears that the GMAC_ANE_ADV and
GMAC_ANE_LPA registers are only available for TBI and RTBI PHY
interfaces. In commit 482b3c3ba757 ("net: stmmac: Drop TBI/RTBI PCS
flags") support for these was dropped, and thus it no longer makes
sense to access these registers.

Remove the *_get_adv_lp() functions from the stmmac driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  6 ---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  8 ----
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 --
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 47 +------------------
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 32 +------------
 5 files changed, 4 insertions(+), 92 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index a673cfe9c016..8af51ddef3e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -404,11 +404,6 @@ static void dwmac1000_ctrl_ane(struct stmmac_priv *priv, bool ane,
 	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
-static void dwmac1000_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
-{
-	dwmac_get_adv_lp(ioaddr, GMAC_PCS_BASE, adv);
-}
-
 static void dwmac1000_debug(struct stmmac_priv *priv, void __iomem *ioaddr,
 			    struct stmmac_extra_stats *x,
 			    u32 rx_queues, u32 tx_queues)
@@ -514,7 +509,6 @@ const struct stmmac_ops dwmac1000_ops = {
 	.set_eee_pls = dwmac1000_set_eee_pls,
 	.debug = dwmac1000_debug,
 	.pcs_ctrl_ane = dwmac1000_ctrl_ane,
-	.pcs_get_adv_lp = dwmac1000_get_adv_lp,
 	.set_mac_loopback = dwmac1000_set_mac_loopback,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 0c3aac304193..d919fc07c8f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -758,11 +758,6 @@ static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
-static void dwmac4_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
-{
-	dwmac_get_adv_lp(ioaddr, GMAC_PCS_BASE, adv);
-}
-
 /* RGMII or SMII interface */
 static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
@@ -1210,7 +1205,6 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
-	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
@@ -1254,7 +1248,6 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
-	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.flex_pps_config = dwmac5_flex_pps_config,
@@ -1302,7 +1295,6 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_eee_timer = dwmac4_set_eee_timer,
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
-	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.safety_feat_config = dwmac5_safety_feat_config,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 74d7b2394591..1711d8072cd2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -370,7 +370,6 @@ struct stmmac_ops {
 	/* PCS calls */
 	void (*pcs_ctrl_ane)(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 			     bool loopback);
-	void (*pcs_get_adv_lp)(void __iomem *ioaddr, struct rgmii_adv *adv);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
 				  struct stmmac_safety_feature_cfg *safety_cfg);
@@ -483,8 +482,6 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
 #define stmmac_pcs_ctrl_ane(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __priv, __args)
-#define stmmac_pcs_get_adv_lp(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, pcs_get_adv_lp, __args)
 #define stmmac_safety_feat_config(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, safety_feat_config, __args)
 #define stmmac_safety_feat_irq_status(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 7008219fd88d..fbf71d0af9bc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -324,7 +324,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
 	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
 	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
-		struct rgmii_adv adv;
 		u32 supported, advertising, lp_advertising;
 
 		if (!priv->xstats.pcs_link) {
@@ -336,10 +335,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 
 		cmd->base.speed = priv->xstats.pcs_speed;
 
-		/* Get and convert ADV/LP_ADV from the HW AN registers */
-		if (stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv))
-			return -EOPNOTSUPP;	/* should never happen indeed */
-
 		/* Encoding of PSE bits is defined in 802.3z, 37.2.1.4 */
 
 		ethtool_convert_link_mode_to_legacy_u32(
@@ -349,44 +344,12 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 		ethtool_convert_link_mode_to_legacy_u32(
 			&lp_advertising, cmd->link_modes.lp_advertising);
 
-		if (adv.pause & STMMAC_PCS_PAUSE)
-			advertising |= ADVERTISED_Pause;
-		if (adv.pause & STMMAC_PCS_ASYM_PAUSE)
-			advertising |= ADVERTISED_Asym_Pause;
-		if (adv.lp_pause & STMMAC_PCS_PAUSE)
-			lp_advertising |= ADVERTISED_Pause;
-		if (adv.lp_pause & STMMAC_PCS_ASYM_PAUSE)
-			lp_advertising |= ADVERTISED_Asym_Pause;
-
 		/* Reg49[3] always set because ANE is always supported */
 		cmd->base.autoneg = ADVERTISED_Autoneg;
 		supported |= SUPPORTED_Autoneg;
 		advertising |= ADVERTISED_Autoneg;
 		lp_advertising |= ADVERTISED_Autoneg;
 
-		if (adv.duplex) {
-			supported |= (SUPPORTED_1000baseT_Full |
-				      SUPPORTED_100baseT_Full |
-				      SUPPORTED_10baseT_Full);
-			advertising |= (ADVERTISED_1000baseT_Full |
-					ADVERTISED_100baseT_Full |
-					ADVERTISED_10baseT_Full);
-		} else {
-			supported |= (SUPPORTED_1000baseT_Half |
-				      SUPPORTED_100baseT_Half |
-				      SUPPORTED_10baseT_Half);
-			advertising |= (ADVERTISED_1000baseT_Half |
-					ADVERTISED_100baseT_Half |
-					ADVERTISED_10baseT_Half);
-		}
-		if (adv.lp_duplex)
-			lp_advertising |= (ADVERTISED_1000baseT_Full |
-					   ADVERTISED_100baseT_Full |
-					   ADVERTISED_10baseT_Full);
-		else
-			lp_advertising |= (ADVERTISED_1000baseT_Half |
-					   ADVERTISED_100baseT_Half |
-					   ADVERTISED_10baseT_Half);
 		cmd->base.port = PORT_OTHER;
 
 		ethtool_convert_legacy_u32_to_link_mode(
@@ -521,12 +484,9 @@ stmmac_get_pauseparam(struct net_device *netdev,
 		      struct ethtool_pauseparam *pause)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
-	struct rgmii_adv adv_lp;
 
-	if (priv->hw->pcs && !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
+	if (priv->hw->pcs) {
 		pause->autoneg = 1;
-		if (!adv_lp.pause)
-			return;
 	} else {
 		phylink_ethtool_get_pauseparam(priv->phylink, pause);
 	}
@@ -537,12 +497,9 @@ stmmac_set_pauseparam(struct net_device *netdev,
 		      struct ethtool_pauseparam *pause)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
-	struct rgmii_adv adv_lp;
 
-	if (priv->hw->pcs && !stmmac_pcs_get_adv_lp(priv, priv->ioaddr, &adv_lp)) {
+	if (priv->hw->pcs) {
 		pause->autoneg = 1;
-		if (!adv_lp.pause)
-			return -EOPNOTSUPP;
 		return 0;
 	} else {
 		return phylink_ethtool_set_pauseparam(priv->phylink, pause);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 1bdf87b237c4..4a684c97dfae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -16,6 +16,8 @@
 /* PCS registers (AN/TBI/SGMII/RGMII) offsets */
 #define GMAC_AN_CTRL(x)		(x)		/* AN control */
 #define GMAC_AN_STATUS(x)	(x + 0x4)	/* AN status */
+
+/* ADV, LPA and EXP are only available for the TBI and RTBI interfaces */
 #define GMAC_ANE_ADV(x)		(x + 0x8)	/* ANE Advertisement */
 #define GMAC_ANE_LPA(x)		(x + 0xc)	/* ANE link partener ability */
 #define GMAC_ANE_EXP(x)		(x + 0x10)	/* ANE expansion */
@@ -107,34 +109,4 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
 }
-
-/**
- * dwmac_get_adv_lp - Get ADV and LP cap
- * @ioaddr: IO registers pointer
- * @reg: Base address of the AN Control Register.
- * @adv_lp: structure to store the adv,lp status
- * Description: this is to expose the ANE advertisement and Link partner ability
- * status to ethtool support.
- */
-static inline void dwmac_get_adv_lp(void __iomem *ioaddr, u32 reg,
-				    struct rgmii_adv *adv_lp)
-{
-	u32 value = readl(ioaddr + GMAC_ANE_ADV(reg));
-
-	if (value & GMAC_ANE_FD)
-		adv_lp->duplex = DUPLEX_FULL;
-	if (value & GMAC_ANE_HD)
-		adv_lp->duplex |= DUPLEX_HALF;
-
-	adv_lp->pause = (value & GMAC_ANE_PSE) >> GMAC_ANE_PSE_SHIFT;
-
-	value = readl(ioaddr + GMAC_ANE_LPA(reg));
-
-	if (value & GMAC_ANE_FD)
-		adv_lp->lp_duplex = DUPLEX_FULL;
-	if (value & GMAC_ANE_HD)
-		adv_lp->lp_duplex = DUPLEX_HALF;
-
-	adv_lp->lp_pause = (value & GMAC_ANE_PSE) >> GMAC_ANE_PSE_SHIFT;
-}
 #endif /* __STMMAC_PCS_H__ */
-- 
2.30.2


