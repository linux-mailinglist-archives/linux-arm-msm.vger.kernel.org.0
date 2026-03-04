Return-Path: <linux-arm-msm+bounces-95269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKZYOTrzp2mtmwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:54:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 310CA1FCFAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B690D30F3869
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 08:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C27A3822A9;
	Wed,  4 Mar 2026 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KTTbuHZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EE037EFEE;
	Wed,  4 Mar 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614173; cv=none; b=Nfr/Uy0N+KTud6WlBwOARrEDqxo0sGyZGCcfmeOGKGEkU4ujpgRljUNLPGAx4O9CDRMrxosa7kg8kg2ETSV9W/pqeuSa5bhpmdzv3AZZCGO1J/ZgdUmqctt88/xI28JVeoOaSdDkQv1mtMEtAD/2GA310h6nDIJIpARFmd3YJac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614173; c=relaxed/simple;
	bh=rqOZy5ivGZn3j36pV8mIcqLgONpRG6mqltzJNNp5CcI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Zqf+GXoZ8cdO/Da/zObeyjmn+776J7TJMwu7ORZ2ip40dZjTn54U4o/KwMRYRjvteUWkZGLfKERjMD7186WENaGHr0WBKuDlEgrgGg4r6q0Jh2M8yr1xaLzRGJBvK6amKC9M/8Aua5eEwBW3PHjBHSyOSPok01jTvejInd+yue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KTTbuHZR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vPHVR3a8adnghsIRMK2UT0yNdKP+/A8WHRXe+SGH6l4=; b=KTTbuHZRKMJkkR89leYpttjJ5X
	HFKfIBg+NPuJlm409I95A6l3oRsZGphS4XazBPQQcweRo/ECzw9rPvniFGhBfxvEP9tDOk4ajC/5w
	GiwkjMTctGAX+oC9W/YLQVk+tqBFR2vERrQv6VcmFh+M+c1AY7FLnK2Av0oJcxTejQ0Z2PD79JGF6
	EbAy9qGSmDR4FFOwDZrrEU/lUiOrFvqlXSkjI3ZoQzDK0w4nrxEQyHJUIOHJdF0sI18OBpFZYoLaH
	YshEvwrp5wpKDeW0KZnYvyY0IQB9/EZoPt2kCZazDSNq2xN6JJy9VynuLMQzAv5XVnbYxHGQ3AWMy
	GkvGYrWQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35038 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxhuz-000000006AF-2tWi;
	Wed, 04 Mar 2026 08:49:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxhuy-0000000BqGj-1ZEN;
	Wed, 04 Mar 2026 08:49:20 +0000
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next v2 5/7] net: stmmac: add support for reading
 inband SGMII status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxhuy-0000000BqGj-1ZEN@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 04 Mar 2026 08:49:20 +0000
X-Rspamd-Queue-Id: 310CA1FCFAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95269-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.207];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Action: no action

Report the link, speed and duplex for SGMII links, read from the
SGMII, RGMII and SMII status and control register.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
rfc->v1: fix setting SGMII's link status - depend on both link status.
v2:
 - fill in rsgmii offset and status fields in dwmac cores
 - rename new GMAC_RGSMIII_xxx constants to GMAC_RGSMII_xxx
---
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   | 12 +----
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  | 10 +---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 46 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  4 ++
 6 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 9fe639fb06bb..1de1f929d61c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -70,18 +70,8 @@ enum power_event {
 #define GMAC_RGSMIIIS		0x000000d8	/* RGMII/SMII status */
 
 /* SGMII/RGMII status register */
-#define GMAC_RGSMIIIS_LNKMODE		BIT(0)
-#define GMAC_RGSMIIIS_SPEED		GENMASK(2, 1)
-#define GMAC_RGSMIIIS_LNKSTS		BIT(3)
-#define GMAC_RGSMIIIS_JABTO		BIT(4)
-#define GMAC_RGSMIIIS_FALSECARDET	BIT(5)
+#define GMAC_RSGMIIIS_MASK		GENMASK(15, 0)
 #define GMAC_RGSMIIIS_SMIDRXS		BIT(16)
-/* LNKMOD */
-#define GMAC_RGSMIIIS_LNKMOD_MASK	0x1
-/* LNKSPEED */
-#define GMAC_RGSMIIIS_SPEED_125		0x2
-#define GMAC_RGSMIIIS_SPEED_25		0x1
-#define GMAC_RGSMIIIS_SPEED_2_5		0x0
 
 /* GMAC Configuration defines */
 #define GMAC_CONTROL_2K 0x08000000	/* IEEE 802.3as 2K packets */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index a3ef237de1b8..31f6ac5432f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -24,6 +24,8 @@
 
 static const struct stmmac_pcs_info dwmac1000_pcs_info = {
 	.pcs_offset = GMAC_PCS_BASE,
+	.rgsmii_offset = GMAC_RGSMIIIS,
+	.rgsmii_status_mask = GMAC_RSGMIIIS_MASK,
 	.int_mask = GMAC_INT_DISABLE_PCSLINK | GMAC_INT_DISABLE_PCSAN,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index d797d936aee1..ffcd036d4c02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -470,15 +470,7 @@ static inline u32 mtl_low_credx_base_addr(const struct dwmac4_addrs *addrs,
 #define GMAC_PHYIF_CTRLSTATUS_TC		BIT(0)
 #define GMAC_PHYIF_CTRLSTATUS_LUD		BIT(1)
 #define GMAC_PHYIF_CTRLSTATUS_SMIDRXS		BIT(4)
-#define GMAC_PHYIF_CTRLSTATUS_LNKMOD		BIT(16)
-#define GMAC_PHYIF_CTRLSTATUS_SPEED		GENMASK(18, 17)
-#define GMAC_PHYIF_CTRLSTATUS_LNKSTS		BIT(19)
-#define GMAC_PHYIF_CTRLSTATUS_JABTO		BIT(20)
-#define GMAC_PHYIF_CTRLSTATUS_FALSECARDET	BIT(21)
-/* LNKSPEED */
-#define GMAC_PHYIF_CTRLSTATUS_SPEED_125		0x2
-#define GMAC_PHYIF_CTRLSTATUS_SPEED_25		0x1
-#define GMAC_PHYIF_CTRLSTATUS_SPEED_2_5		0x0
+#define GMAC_PHYIF_CTRLSTATUS_RSGMII_MASK	GENMASK(31, 16)
 
 extern const struct stmmac_dma_ops dwmac4_dma_ops;
 extern const struct stmmac_dma_ops dwmac410_dma_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 7f4949229288..ced2cd98cc54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -24,6 +24,8 @@
 
 static const struct stmmac_pcs_info dwmac4_pcs_info = {
 	.pcs_offset = GMAC_PCS_BASE,
+	.rgsmii_offset = GMAC_PHYIF_CONTROL_STATUS,
+	.rgsmii_status_mask = GMAC_PHYIF_CTRLSTATUS_RSGMII_MASK,
 	.int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 77a83e415597..ba0cf51e67f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -16,6 +16,16 @@
 #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
 #define GMAC_TBI	0x14	/* TBI extend status */
 
+/*
+ * RGSMII status bitfield definitions.
+ */
+#define GMAC_RGSMII_LNKMOD		BIT(0)
+#define GMAC_RGSMII_SPEED_MASK		GENMASK(2, 1)
+#define GMAC_RGSMII_SPEED_125		2
+#define GMAC_RGSMII_SPEED_25		1
+#define GMAC_RGSMII_SPEED_2_5		0
+#define GMAC_RGSMII_LNKSTS		BIT(3)
+
 static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 						     phy_interface_t interface)
 {
@@ -58,7 +68,7 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   struct phylink_link_state *state)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	u32 status, lpa;
+	u32 status, lpa, rgsmii;
 
 	status = readl(spcs->base + GMAC_AN_STATUS);
 
@@ -73,7 +83,37 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 
 		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
 	} else {
-		state->link = false;
+		rgsmii = field_get(spcs->rgsmii_status_mask,
+				   readl(spcs->rgsmii));
+
+		state->link = status & BMSR_LSTATUS &&
+			      rgsmii & GMAC_RGSMII_LNKSTS;
+
+		if (state->link && neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
+			/* FIXME: fill in speed and duplex. This requires the
+			 * contents of the dwmac1000 GMAC_RGSMIIS or dwmac4
+			 * GMAC_PHYIF_CONTROL_STATUS register.
+			 */
+			state->duplex = rgsmii & GMAC_RGSMII_LNKMOD ?
+					DUPLEX_FULL : DUPLEX_HALF;
+			switch (FIELD_GET(GMAC_RGSMII_SPEED_MASK, rgsmii)) {
+			case GMAC_RGSMII_SPEED_2_5:
+				state->speed = SPEED_10;
+				break;
+
+			case GMAC_RGSMII_SPEED_25:
+				state->speed = SPEED_100;
+				break;
+
+			case GMAC_RGSMII_SPEED_125:
+				state->speed = SPEED_1000;
+				break;
+
+			default:
+				state->link = false;
+				break;
+			}
+		}
 	}
 }
 
@@ -178,6 +218,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
 
 	spcs->priv = priv;
 	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
+	spcs->rgsmii = priv->ioaddr + pcs_info->rgsmii_offset;
+	spcs->rgsmii_status_mask = pcs_info->rgsmii_status_mask;
 	spcs->int_mask = pcs_info->int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index f3dada71e381..b2b12d34b3dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -29,12 +29,16 @@ struct stmmac_priv;
 
 struct stmmac_pcs_info {
 	unsigned int pcs_offset;
+	unsigned int rgsmii_offset;
+	u32 rgsmii_status_mask;
 	u32 int_mask;
 };
 
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
+	void __iomem *rgsmii;
+	u32 rgsmii_status_mask;
 	u32 int_mask;
 	struct phylink_pcs pcs;
 	bool support_tbi_rtbi;
-- 
2.47.3


