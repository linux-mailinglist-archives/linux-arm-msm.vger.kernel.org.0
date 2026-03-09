Return-Path: <linux-arm-msm+bounces-96233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F+gH5atrmkSHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:23:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B645237DCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40EA93009569
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6F939A7E6;
	Mon,  9 Mar 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="y4D+xuEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4173E47B;
	Mon,  9 Mar 2026 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055241; cv=none; b=C11sc0swLuQvvxXXu+tIU/5Rq5yOcW4NJTeV9FHPZk2CvU8kOv3IKwN9e5tJ3hZf73qHEi8/0CcD8BsfsHzcfbUN2YVcoalG66S4j4PbcIGuL5n9ZvxUViV5R0bOes5QuVB7wyfXlMtzie3FYYBYHi48HibY29rpb+TFFeVr2uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055241; c=relaxed/simple;
	bh=QN6RS4jeJVGf22876bOHmQMHQByik3zM7gq00YmRIfg=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=GUFCAfb08g4i9HBB4P+cVLJBo515htnpwaG4siMOaV8nuXI/r0CbmtYx9YFh9fC0Uuozsl69noGFm3rvFX7/QiZE8XsZXrwLH96zb7Sbh/dCx4hU4YeFSpwTS10KXXDP1aG8QljbRWgo8eNS8kr+nplv5FwHqhyABwNs8W5PU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=y4D+xuEy; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sHIfZLxXXzlg28O2tzFJWzH47vbUnSdgvG5c9Hv7nbI=; b=y4D+xuEykbRblTKqYfJO+YUw2/
	GVwJ+ZD6RvbvKaI+wQxl2cdwtA7F9llD76AANpWpTFp4/qiBkKL/OT7iBYqD5kcRTCmy6Z+Ippzrj
	q5XNwhV24A5nSc+JXjThzhJixhBCGKNgt8LOw5Nxq4nk8w65Jh3yrTx4ddnX1pQgt11ZgsZRgrjHd
	xwRrHEILYiFxRHEP+KBmoxOxsFfOUQyVE2EjXAh896CuZfRrZTqv6pBUL3G4/Mf2511XnFEW/x5LT
	tUIl+eAn1Shxy6bwwmzNJBtBAE1H2XiBxQdpia6QBNMGXBGom5IXgUdjKNO3ciEEOzf8af8CeMH8b
	o/qfaDHQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50422 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzYf3-000000003fo-0C3f;
	Mon, 09 Mar 2026 11:20:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzYf2-0000000CZyb-1CLV;
	Mon, 09 Mar 2026 11:20:32 +0000
In-Reply-To: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
References: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next v3 2/8] net: stmmac: add support for reading
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
Message-Id: <E1vzYf2-0000000CZyb-1CLV@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 09 Mar 2026 11:20:32 +0000
X-Rspamd-Queue-Id: 0B645237DCA
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
	TAGGED_FROM(0.00)[bounces-96233-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_SPAM(0.00)[0.233];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
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
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 49 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  4 ++
 6 files changed, 58 insertions(+), 21 deletions(-)

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
index ba7de26e6a15..834a6ff4ea69 100644
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
index 360e5ab410c0..83e988db561c 100644
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
index 2695e0b9ed03..df72f7c5a6a7 100644
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
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -36,7 +46,42 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   unsigned int neg_mode,
 					   struct phylink_link_state *state)
 {
-	state->link = false;
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	u32 status, rgsmii;
+
+	status = readl(spcs->base + GMAC_AN_STATUS);
+
+	if (phy_interface_mode_is_8023z(state->interface)) {
+		state->link = false;
+	} else {
+		rgsmii = field_get(spcs->rgsmii_status_mask,
+				   readl(spcs->rgsmii));
+
+		state->link = status & BMSR_LSTATUS &&
+			      rgsmii & GMAC_RGSMII_LNKSTS;
+
+		if (state->link && neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
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
+	}
 }
 
 static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
@@ -101,6 +146,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
 
 	spcs->priv = priv;
 	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
+	spcs->rgsmii = priv->ioaddr + pcs_info->rgsmii_offset;
+	spcs->rgsmii_status_mask = pcs_info->rgsmii_status_mask;
 	spcs->int_mask = pcs_info->int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index f1ee473d8e3e..09e609f111b1 100644
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
 };
-- 
2.47.3


