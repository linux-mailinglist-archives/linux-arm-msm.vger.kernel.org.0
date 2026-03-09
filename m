Return-Path: <linux-arm-msm+bounces-96173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP5xC5mWrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:44:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 799732366F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 255383037EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F89737BE76;
	Mon,  9 Mar 2026 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="v4G7RkRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9433D4FD;
	Mon,  9 Mar 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049218; cv=none; b=Q27fvRTeZlmNmlLx30rJGTQouScoYp1QHosZ2iWXKZ6XIdQHgwAsxMwY44ME8Y3lxVOWt7Ycj+lVxhUAp9X7ZEGh32QQjt/6YH62SP7gDvQPOOjTmJPbRxVi9GQEHSuHrnNVCx9JRr4OF3No3ADFzyiVV82WEuvU0ao42G8MY9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049218; c=relaxed/simple;
	bh=ii7GNtvbIIFIP0JpoqtPCe2CrL24uYO4CrYNNGHWIsI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=XobDwuU9S7VPR288YGNG3/aOvBrOKfs5UHTqJ+wxJgza5UFM4/o4rG3SFTtnCxPjgpqTP876PK9EEvMAo2Xsf1w+D+EucyvsD3t10a8u0pVbgAffdEyT4VftxkmDpzJlktVoIUk+myimMl4m5utmgp2OE0q/A/k7KCPdtsTw95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=v4G7RkRm; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rb/EL+ezeQrS78OpMW6WHBRGNWy12ObztGzPIs+46Uo=; b=v4G7RkRmx4Jjw+TF283B4kYROV
	hIbQR9+SisWfrlA7U5oO3011nFVHQmYi9Qox+/onh8rQ67gf1eU1CDcfLX6G2Mang24ALU8lW4jtv
	J6BSMmDU814yRA8uUHJ0E6a3jde1pFqVlRbLgS0G5K05/lIQ53fCURSU+8JgJ5rrgaz1oxD7PdU5G
	iDORomrBL9g9PrJCVH2aeacu3bqTOtZL/tKYDOrm0ly0Pk9vVdFulhy6Bx/lC36+/5RxHQFr+J7tF
	CkNx6aBHgoC5FTp8RhoC2OdFU6fQykPxx5hGFdVxOryuoAfG+zT8G/xugHxkNIW5z8rjr33WKTEyr
	iq20IHqA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60972 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzX5S-000000003Uy-1YJn;
	Mon, 09 Mar 2026 09:39:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzX5P-0000000CVsK-0iwX;
	Mon, 09 Mar 2026 09:39:39 +0000
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next v2 5/7] net: stmmac: use u8 for host_dma_width and
 similar struct members
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:39 +0000
X-Rspamd-Queue-Id: 799732366F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96173-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.325];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Action: no action

We aren't going to see >= 256-bit address busses soon, so reduce
host_dma_width and associated other struct members that initialise
this from u32 to u8.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 include/linux/stmmac.h                                  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 9f5a15b81f8a..9d1bd72ffb73 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -42,8 +42,8 @@
 struct imx_priv_data;
 
 struct imx_dwmac_ops {
-	u32 addr_width;
 	u32 flags;
+	u8 addr_width;
 	bool mac_rgmii_txclk_auto_adj;
 
 	int (*fix_soc_reset)(struct stmmac_priv *priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index a139db6a8cbb..30ae0dba7fff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -93,9 +93,9 @@ struct mediatek_dwmac_variant {
 	const char * const *clk_list;
 	int num_clks;
 
-	u32 dma_bit_mask;
 	u32 rx_delay_max;
 	u32 tx_delay_max;
+	u8 dma_bit_mask;
 };
 
 /* list of clocks required for mac */
@@ -268,9 +268,9 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 		.dwmac_set_delay = mt2712_set_delay,
 		.clk_list = mt2712_dwmac_clk_l,
 		.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
-		.dma_bit_mask = 33,
 		.rx_delay_max = 17600,
 		.tx_delay_max = 17600,
+		.dma_bit_mask = 33,
 };
 
 static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
@@ -418,9 +418,9 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_delay = mt8195_set_delay,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
-	.dma_bit_mask = 35,
 	.rx_delay_max = 9280,
 	.tx_delay_max = 9280,
+	.dma_bit_mask = 35,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 388e9fdeb86c..3ccf20fdf52a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,8 +91,8 @@ struct ethqos_emac_driver_data {
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
+	u8 dma_addr_width;
 	const char *link_clk_name;
-	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 03fd85060a73..11886189bf51 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -243,7 +243,7 @@ struct plat_stmmacenet_data {
 	int unicast_filter_entries;
 	int tx_fifo_size;
 	int rx_fifo_size;
-	u32 host_dma_width;
+	u8 host_dma_width;
 	u8 rx_queues_to_use;
 	u8 tx_queues_to_use;
 	u8 rx_sched_algorithm;
-- 
2.47.3


