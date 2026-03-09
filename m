Return-Path: <linux-arm-msm+bounces-96172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAAaF42WrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:44:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9A02366E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A3413067064
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34B037B3E1;
	Mon,  9 Mar 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="YIeOTm3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FE33D4FD;
	Mon,  9 Mar 2026 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049210; cv=none; b=UqAagc/rPl4H9xO+adClIz8moyvUdth4o1bRb9SM0WQ7NzhrFRSw8SaV28qmYnHWyU3vkzgBcJobGEf8U3VHSg9Y7A6D+3XueWsNbaYURh13dwOBYdmgqSjDfyNqmvr0+f8luIe8FohZYB8rwoLPViyibuoGp59ae6u7tXtGIuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049210; c=relaxed/simple;
	bh=qx4TV06zlucVOf2My1N8fwZOhGRHQBytKDSvrYsB7R4=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=iGDENtQ+IiSr9oIbCRmNlaPPeMgAxl5y0bxvh53n+tG3xD4DTZfZC9ltSfOc9HVdeWOAzZ/05Uc47mYK2r0fTJgduobN/vluh1+2H2lXFm8jxYUKSJm8o3XK02Y9Fpcn49l2yD2Xg/oXk6o7LoFXM3ozeytg1a0Jlw+sRatUViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=YIeOTm3k; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fO8Jd8j5PMYoZnY6wk6Oanf1EdrVfYWKurFtIzWVQyc=; b=YIeOTm3kIYnGpkqEBgRQMw842C
	l04YfY34k+BapHtRnu7o8TOmCmefP0dvRIVxfUxnr7WdNuFf5AFYV+9LKkWiCRBlZT23AzMDcNQDW
	oCZJCAO0Lye1xvY8qqkyJuy66dksLQAq/H5ZZzDdPJ2d/tic5/MxJLR+gmGG4qoxWDHFj+Xu459Ul
	dX2IWB2DMTae/Qd/owVC8KMaiCREPaSkjt6Uq4e7Rr9qTHYfl0QVwSj+uposiVXp4jggJioSTCF5Y
	tdqJXahLNN5jfII3pWLSUgEakSP/tWK83Hgw1+vhWpbWyJwWot0YefpocW/yyYfjMMMJf9Os8f5gP
	IWtBqQvQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50160 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzX5N-000000003Ul-3vJ2;
	Mon, 09 Mar 2026 09:39:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzX5K-0000000CVsE-0J0Y;
	Mon, 09 Mar 2026 09:39:34 +0000
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
Subject: [PATCH net-next v2 4/7] net: stmmac: use u8 for ?x_queues_to_use and
 number_?x_queues
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:34 +0000
X-Rspamd-Queue-Id: 9E9A02366E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96172-lists,linux-arm-msm=lfdr.de,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,armlinux.org.uk:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.597];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

The maximum number of queues is a compile time constant of only eight.
This makes using a 32-bit quantity wastefulf. Instead, use u8 for
these and their associated variables.

When reading the DT properties, saturdate at U8_MAX. Provided the core
provides DMA capabilities to describe the number of queues, this will
be capped by stmmac_hw_init() with a warning.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |   2 +-
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |   2 +-
 .../ethernet/stmicro/stmmac/dwmac100_core.c   |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |   4 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 223 +++++++++---------
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  15 +-
 include/linux/stmmac.h                        |   4 +-
 11 files changed, 136 insertions(+), 128 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 46454e2886ce..f1628de8ed18 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -446,8 +446,8 @@ struct dma_features {
 	unsigned int number_rx_channel;
 	unsigned int number_tx_channel;
 	/* TX and RX number of queues */
-	unsigned int number_rx_queues;
-	unsigned int number_tx_queues;
+	u8 number_rx_queues;
+	u8 number_tx_queues;
 	/* PPS output */
 	unsigned int pps_out_num;
 	/* Number of Traffic Classes */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6dbe5d5a3224..48c52eb96233 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -718,7 +718,7 @@ static void sun8i_dwmac_set_filter(struct mac_device_info *hw,
 
 static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 				  unsigned int duplex, unsigned int fc,
-				  unsigned int pause_time, u32 tx_cnt)
+				  unsigned int pause_time, u8 tx_cnt)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 v;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index c7cb30672604..01f8353eb6ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -222,7 +222,7 @@ static void dwmac1000_set_filter(struct mac_device_info *hw,
 
 static void dwmac1000_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 				unsigned int fc, unsigned int pause_time,
-				u32 tx_cnt)
+				u8 tx_cnt)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	/* Set flow such that DZPQ in Mac Register 6 is 0,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 6b5cf3a0866a..94d24d355d95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -126,7 +126,7 @@ static void dwmac100_set_filter(struct mac_device_info *hw,
 
 static void dwmac100_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 			       unsigned int fc, unsigned int pause_time,
-			       u32 tx_cnt)
+			       u8 tx_cnt)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	unsigned int flow = MAC_FLOW_CTRL_ENABLE;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index e6bcb77b22a2..4c6fed3ecbcf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -547,11 +547,11 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 
 static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 			     unsigned int fc, unsigned int pause_time,
-			     u32 tx_cnt)
+			     u8 tx_cnt)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	unsigned int flow = 0;
-	u32 queue = 0;
+	u8 queue;
 
 	pr_debug("GMAC Flow-Control:\n");
 	if (fc & FLOW_RX) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index efa76b147f9e..f02b434bbd50 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -355,10 +355,10 @@ static int dwxgmac2_host_mtl_irq_status(struct stmmac_priv *priv,
 
 static void dwxgmac2_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 			       unsigned int fc, unsigned int pause_time,
-			       u32 tx_cnt)
+			       u8 tx_cnt)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	u32 i;
+	u8 i;
 
 	if (fc & FLOW_RX)
 		writel(XGMAC_RFE, ioaddr + XGMAC_RX_FLOW_CTRL);
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 374f326efa01..010b4d32484a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -352,7 +352,7 @@ struct stmmac_ops {
 	void (*set_filter)(struct mac_device_info *hw, struct net_device *dev);
 	/* Flow control setting */
 	void (*flow_ctrl)(struct mac_device_info *hw, unsigned int duplex,
-			  unsigned int fc, unsigned int pause_time, u32 tx_cnt);
+			  unsigned int fc, unsigned int pause_time, u8 tx_cnt);
 	/* Set power management mode (e.g. magic frame) */
 	void (*pmt)(struct mac_device_info *hw, unsigned long mode);
 	/* Set/Get Unicast MAC addresses */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 335e60439b42..bba9bb9c95bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -407,7 +407,7 @@ void stmmac_dvr_remove(struct device *dev);
 int stmmac_dvr_probe(struct device *device,
 		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
-int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
+int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 			   phy_interface_t interface, int speed);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 939431255fa5..11150bddd872 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -264,10 +264,10 @@ static void stmmac_verify_args(void)
 
 static void __stmmac_disable_all_queues(struct stmmac_priv *priv)
 {
-	u32 rx_queues_cnt = priv->plat->rx_queues_to_use;
-	u32 tx_queues_cnt = priv->plat->tx_queues_to_use;
-	u32 maxq = max(rx_queues_cnt, tx_queues_cnt);
-	u32 queue;
+	u8 rx_queues_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_queues_cnt = priv->plat->tx_queues_to_use;
+	u8 maxq = max(rx_queues_cnt, tx_queues_cnt);
+	u8 queue;
 
 	for (queue = 0; queue < maxq; queue++) {
 		struct stmmac_channel *ch = &priv->channel[queue];
@@ -291,9 +291,9 @@ static void __stmmac_disable_all_queues(struct stmmac_priv *priv)
  */
 static void stmmac_disable_all_queues(struct stmmac_priv *priv)
 {
-	u32 rx_queues_cnt = priv->plat->rx_queues_to_use;
+	u8 rx_queues_cnt = priv->plat->rx_queues_to_use;
 	struct stmmac_rx_queue *rx_q;
-	u32 queue;
+	u8 queue;
 
 	/* synchronize_rcu() needed for pending XDP buffers to drain */
 	for (queue = 0; queue < rx_queues_cnt; queue++) {
@@ -313,10 +313,10 @@ static void stmmac_disable_all_queues(struct stmmac_priv *priv)
  */
 static void stmmac_enable_all_queues(struct stmmac_priv *priv)
 {
-	u32 rx_queues_cnt = priv->plat->rx_queues_to_use;
-	u32 tx_queues_cnt = priv->plat->tx_queues_to_use;
-	u32 maxq = max(rx_queues_cnt, tx_queues_cnt);
-	u32 queue;
+	u8 rx_queues_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_queues_cnt = priv->plat->tx_queues_to_use;
+	u8 maxq = max(rx_queues_cnt, tx_queues_cnt);
+	u8 queue;
 
 	for (queue = 0; queue < maxq; queue++) {
 		struct stmmac_channel *ch = &priv->channel[queue];
@@ -377,8 +377,8 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 
 static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
 {
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 queue;
 
 	/* check if all TX queues have the work finished */
 	for (queue = 0; queue < tx_cnt; queue++) {
@@ -909,7 +909,7 @@ static int stmmac_legacy_serdes_power_up(struct stmmac_priv *priv)
 static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex,
 				 unsigned int flow_ctrl)
 {
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
 
 	stmmac_flow_ctrl(priv, priv->hw, duplex, flow_ctrl, priv->pause_time,
 			 tx_cnt);
@@ -1410,10 +1410,10 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 static void stmmac_display_rx_rings(struct stmmac_priv *priv,
 				    struct stmmac_dma_conf *dma_conf)
 {
-	u32 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
 	unsigned int desc_size;
 	void *head_rx;
-	u32 queue;
+	u8 queue;
 
 	/* Display RX rings */
 	for (queue = 0; queue < rx_cnt; queue++) {
@@ -1438,10 +1438,10 @@ static void stmmac_display_rx_rings(struct stmmac_priv *priv,
 static void stmmac_display_tx_rings(struct stmmac_priv *priv,
 				    struct stmmac_dma_conf *dma_conf)
 {
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
 	unsigned int desc_size;
 	void *head_tx;
-	u32 queue;
+	u8 queue;
 
 	/* Display TX rings */
 	for (queue = 0; queue < tx_cnt; queue++) {
@@ -1571,9 +1571,9 @@ static void stmmac_clear_tx_descriptors(struct stmmac_priv *priv,
 static void stmmac_clear_descriptors(struct stmmac_priv *priv,
 				     struct stmmac_dma_conf *dma_conf)
 {
-	u32 rx_queue_cnt = priv->plat->rx_queues_to_use;
-	u32 tx_queue_cnt = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 rx_queue_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_queue_cnt = priv->plat->tx_queues_to_use;
+	u8 queue;
 
 	/* Clear the RX descriptors */
 	for (queue = 0; queue < rx_queue_cnt; queue++)
@@ -1891,7 +1891,7 @@ static int init_dma_rx_desc_rings(struct net_device *dev,
 				  gfp_t flags)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 rx_count = priv->plat->rx_queues_to_use;
+	u8 rx_count = priv->plat->rx_queues_to_use;
 	int queue;
 	int ret;
 
@@ -1985,8 +1985,8 @@ static int init_dma_tx_desc_rings(struct net_device *dev,
 				  struct stmmac_dma_conf *dma_conf)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 tx_queue_cnt;
-	u32 queue;
+	u8 tx_queue_cnt;
+	u8 queue;
 
 	tx_queue_cnt = priv->plat->tx_queues_to_use;
 
@@ -2057,8 +2057,8 @@ static void dma_free_tx_skbufs(struct stmmac_priv *priv,
  */
 static void stmmac_free_tx_skbufs(struct stmmac_priv *priv)
 {
-	u32 tx_queue_cnt = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 tx_queue_cnt = priv->plat->tx_queues_to_use;
+	u8 queue;
 
 	for (queue = 0; queue < tx_queue_cnt; queue++)
 		dma_free_tx_skbufs(priv, &priv->dma_conf, queue);
@@ -2106,8 +2106,8 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
 				       struct stmmac_dma_conf *dma_conf)
 {
-	u32 rx_count = priv->plat->rx_queues_to_use;
-	u32 queue;
+	u8 rx_count = priv->plat->rx_queues_to_use;
+	u8 queue;
 
 	/* Free RX queue resources */
 	for (queue = 0; queue < rx_count; queue++)
@@ -2153,8 +2153,8 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
 				       struct stmmac_dma_conf *dma_conf)
 {
-	u32 tx_count = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 tx_count = priv->plat->tx_queues_to_use;
+	u8 queue;
 
 	/* Free TX queue resources */
 	for (queue = 0; queue < tx_count; queue++)
@@ -2255,8 +2255,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 static int alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 				       struct stmmac_dma_conf *dma_conf)
 {
-	u32 rx_count = priv->plat->rx_queues_to_use;
-	u32 queue;
+	u8 rx_count = priv->plat->rx_queues_to_use;
+	u8 queue;
 	int ret;
 
 	/* RX queues buffers and DMA */
@@ -2331,8 +2331,8 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 				       struct stmmac_dma_conf *dma_conf)
 {
-	u32 tx_count = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 tx_count = priv->plat->tx_queues_to_use;
+	u8 queue;
 	int ret;
 
 	/* TX queues buffers and DMA */
@@ -2396,8 +2396,8 @@ static void free_dma_desc_resources(struct stmmac_priv *priv,
  */
 static void stmmac_mac_enable_rx_queues(struct stmmac_priv *priv)
 {
-	u32 rx_queues_count = priv->plat->rx_queues_to_use;
-	int queue;
+	u8 rx_queues_count = priv->plat->rx_queues_to_use;
+	u8 queue;
 	u8 mode;
 
 	for (queue = 0; queue < rx_queues_count; queue++) {
@@ -2460,10 +2460,10 @@ static void stmmac_stop_tx_dma(struct stmmac_priv *priv, u32 chan)
 
 static void stmmac_enable_all_dma_irq(struct stmmac_priv *priv)
 {
-	u32 rx_channels_count = priv->plat->rx_queues_to_use;
-	u32 tx_channels_count = priv->plat->tx_queues_to_use;
-	u32 dma_csr_ch = max(rx_channels_count, tx_channels_count);
-	u32 chan;
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 dma_csr_ch = max(rx_channels_count, tx_channels_count);
+	u8 chan;
 
 	for (chan = 0; chan < dma_csr_ch; chan++) {
 		struct stmmac_channel *ch = &priv->channel[chan];
@@ -2483,9 +2483,9 @@ static void stmmac_enable_all_dma_irq(struct stmmac_priv *priv)
  */
 static void stmmac_start_all_dma(struct stmmac_priv *priv)
 {
-	u32 rx_channels_count = priv->plat->rx_queues_to_use;
-	u32 tx_channels_count = priv->plat->tx_queues_to_use;
-	u32 chan = 0;
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 chan;
 
 	for (chan = 0; chan < rx_channels_count; chan++)
 		stmmac_start_rx_dma(priv, chan);
@@ -2502,9 +2502,9 @@ static void stmmac_start_all_dma(struct stmmac_priv *priv)
  */
 static void stmmac_stop_all_dma(struct stmmac_priv *priv)
 {
-	u32 rx_channels_count = priv->plat->rx_queues_to_use;
-	u32 tx_channels_count = priv->plat->tx_queues_to_use;
-	u32 chan = 0;
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 chan;
 
 	for (chan = 0; chan < rx_channels_count; chan++)
 		stmmac_stop_rx_dma(priv, chan);
@@ -2521,14 +2521,14 @@ static void stmmac_stop_all_dma(struct stmmac_priv *priv)
  */
 static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 {
-	u32 rx_channels_count = priv->plat->rx_queues_to_use;
-	u32 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
 	int rxfifosz = priv->plat->rx_fifo_size;
 	int txfifosz = priv->plat->tx_fifo_size;
 	u32 txmode = 0;
 	u32 rxmode = 0;
-	u32 chan = 0;
 	u8 qmode = 0;
+	u8 chan;
 
 	if (rxfifosz == 0)
 		rxfifosz = priv->dma_cap.rx_fifo_size;
@@ -3012,8 +3012,8 @@ static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
 {
 	u8 rxqmode = priv->plat->rx_queues_cfg[chan].mode_to_use;
 	u8 txqmode = priv->plat->tx_queues_cfg[chan].mode_to_use;
-	u32 rx_channels_count = priv->plat->rx_queues_to_use;
-	u32 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
 	int rxfifosz = priv->plat->rx_fifo_size;
 	int txfifosz = priv->plat->tx_fifo_size;
 
@@ -3088,12 +3088,12 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
  */
 static void stmmac_dma_interrupt(struct stmmac_priv *priv)
 {
-	u32 tx_channel_count = priv->plat->tx_queues_to_use;
-	u32 rx_channel_count = priv->plat->rx_queues_to_use;
-	u32 channels_to_check = tx_channel_count > rx_channel_count ?
-				tx_channel_count : rx_channel_count;
-	u32 chan;
+	u8 tx_channel_count = priv->plat->tx_queues_to_use;
+	u8 rx_channel_count = priv->plat->rx_queues_to_use;
+	u8 channels_to_check = tx_channel_count > rx_channel_count ?
+			       tx_channel_count : rx_channel_count;
 	int status[MAX_T(u32, MTL_MAX_TX_QUEUES, MTL_MAX_RX_QUEUES)];
+	u8 chan;
 
 	/* Make sure we never check beyond our status buffer. */
 	if (WARN_ON_ONCE(channels_to_check > ARRAY_SIZE(status)))
@@ -3237,13 +3237,13 @@ static int stmmac_prereset_configure(struct stmmac_priv *priv)
  */
 static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 {
-	u32 rx_channels_count = priv->plat->rx_queues_to_use;
-	u32 tx_channels_count = priv->plat->tx_queues_to_use;
-	u32 dma_csr_ch = max(rx_channels_count, tx_channels_count);
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 dma_csr_ch = max(rx_channels_count, tx_channels_count);
 	struct stmmac_rx_queue *rx_q;
 	struct stmmac_tx_queue *tx_q;
-	u32 chan = 0;
 	int ret = 0;
+	u8 chan;
 
 	ret = stmmac_prereset_configure(priv);
 	if (ret)
@@ -3359,9 +3359,9 @@ static enum hrtimer_restart stmmac_tx_timer(struct hrtimer *t)
  */
 static void stmmac_init_coalesce(struct stmmac_priv *priv)
 {
-	u32 tx_channel_count = priv->plat->tx_queues_to_use;
-	u32 rx_channel_count = priv->plat->rx_queues_to_use;
-	u32 chan;
+	u8 tx_channel_count = priv->plat->tx_queues_to_use;
+	u8 rx_channel_count = priv->plat->rx_queues_to_use;
+	u8 chan;
 
 	for (chan = 0; chan < tx_channel_count; chan++) {
 		struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
@@ -3378,9 +3378,9 @@ static void stmmac_init_coalesce(struct stmmac_priv *priv)
 
 static void stmmac_set_rings_length(struct stmmac_priv *priv)
 {
-	u32 rx_channels_count = priv->plat->rx_queues_to_use;
-	u32 tx_channels_count = priv->plat->tx_queues_to_use;
-	u32 chan;
+	u8 rx_channels_count = priv->plat->rx_queues_to_use;
+	u8 tx_channels_count = priv->plat->tx_queues_to_use;
+	u8 chan;
 
 	/* set TX ring length */
 	for (chan = 0; chan < tx_channels_count; chan++)
@@ -3400,9 +3400,9 @@ static void stmmac_set_rings_length(struct stmmac_priv *priv)
  */
 static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
 {
-	u32 tx_queues_count = priv->plat->tx_queues_to_use;
+	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 	u32 weight;
-	u32 queue;
+	u8 queue;
 
 	for (queue = 0; queue < tx_queues_count; queue++) {
 		weight = priv->plat->tx_queues_cfg[queue].weight;
@@ -3417,9 +3417,9 @@ static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
  */
 static void stmmac_configure_cbs(struct stmmac_priv *priv)
 {
-	u32 tx_queues_count = priv->plat->tx_queues_to_use;
+	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 	u32 mode_to_use;
-	u32 queue;
+	u8 queue;
 
 	/* queue 0 is reserved for legacy traffic */
 	for (queue = 1; queue < tx_queues_count; queue++) {
@@ -3443,8 +3443,8 @@ static void stmmac_configure_cbs(struct stmmac_priv *priv)
  */
 static void stmmac_rx_queue_dma_chan_map(struct stmmac_priv *priv)
 {
-	u32 rx_queues_count = priv->plat->rx_queues_to_use;
-	u32 queue;
+	u8 rx_queues_count = priv->plat->rx_queues_to_use;
+	u8 queue;
 	u32 chan;
 
 	for (queue = 0; queue < rx_queues_count; queue++) {
@@ -3460,8 +3460,8 @@ static void stmmac_rx_queue_dma_chan_map(struct stmmac_priv *priv)
  */
 static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
 {
-	u32 rx_queues_count = priv->plat->rx_queues_to_use;
-	u32 queue;
+	u8 rx_queues_count = priv->plat->rx_queues_to_use;
+	u8 queue;
 	u32 prio;
 
 	for (queue = 0; queue < rx_queues_count; queue++) {
@@ -3480,8 +3480,8 @@ static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
  */
 static void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
 {
-	u32 tx_queues_count = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 tx_queues_count = priv->plat->tx_queues_to_use;
+	u8 queue;
 	u32 prio;
 
 	for (queue = 0; queue < tx_queues_count; queue++) {
@@ -3500,9 +3500,9 @@ static void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
  */
 static void stmmac_mac_config_rx_queues_routing(struct stmmac_priv *priv)
 {
-	u32 rx_queues_count = priv->plat->rx_queues_to_use;
-	u32 queue;
+	u8 rx_queues_count = priv->plat->rx_queues_to_use;
 	u8 packet;
+	u8 queue;
 
 	for (queue = 0; queue < rx_queues_count; queue++) {
 		/* no specific packet type routing specified for the queue */
@@ -3537,8 +3537,8 @@ static void stmmac_mac_config_rss(struct stmmac_priv *priv)
  */
 static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 {
-	u32 rx_queues_count = priv->plat->rx_queues_to_use;
-	u32 tx_queues_count = priv->plat->tx_queues_to_use;
+	u8 rx_queues_count = priv->plat->rx_queues_to_use;
+	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 
 	if (tx_queues_count > 1)
 		stmmac_set_tx_queue_weight(priv);
@@ -3606,10 +3606,10 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 static int stmmac_hw_setup(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 rx_cnt = priv->plat->rx_queues_to_use;
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
 	bool sph_en;
-	u32 chan;
+	u8 chan;
 	int ret;
 
 	/* Make sure RX clock is enabled */
@@ -4001,7 +4001,8 @@ static struct stmmac_dma_conf *
 stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
 {
 	struct stmmac_dma_conf *dma_conf;
-	int chan, bfsize, ret;
+	int bfsize, ret;
+	u8 chan;
 
 	dma_conf = kzalloc_obj(*dma_conf);
 	if (!dma_conf) {
@@ -4076,7 +4077,7 @@ static int __stmmac_open(struct net_device *dev,
 			 struct stmmac_dma_conf *dma_conf)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 chan;
+	u8 chan;
 	int ret;
 
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
@@ -4175,7 +4176,7 @@ static int stmmac_open(struct net_device *dev)
 static void __stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 chan;
+	u8 chan;
 
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
@@ -6123,7 +6124,7 @@ static int stmmac_set_features(struct net_device *netdev,
 
 	if (priv->sph_capable) {
 		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
-		u32 chan;
+		u8 chan;
 
 		for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
@@ -6143,11 +6144,11 @@ static int stmmac_set_features(struct net_device *netdev,
 
 static void stmmac_common_interrupt(struct stmmac_priv *priv)
 {
-	u32 rx_cnt = priv->plat->rx_queues_to_use;
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
-	u32 queues_count;
-	u32 queue;
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 queues_count;
 	bool xmac;
+	u8 queue;
 
 	xmac = dwmac_is_xmac(priv->plat->core_type);
 	queues_count = (rx_cnt > tx_cnt) ? rx_cnt : tx_cnt;
@@ -6445,9 +6446,9 @@ static int stmmac_rings_status_show(struct seq_file *seq, void *v)
 {
 	struct net_device *dev = seq->private;
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 rx_count = priv->plat->rx_queues_to_use;
-	u32 tx_count = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 rx_count = priv->plat->rx_queues_to_use;
+	u8 tx_count = priv->plat->tx_queues_to_use;
+	u8 queue;
 
 	if ((dev->flags & IFF_UP) == 0)
 		return 0;
@@ -6572,9 +6573,9 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 		   priv->dma_cap.number_rx_channel);
 	seq_printf(seq, "\tNumber of Additional TX channel: %d\n",
 		   priv->dma_cap.number_tx_channel);
-	seq_printf(seq, "\tNumber of Additional RX queues: %d\n",
+	seq_printf(seq, "\tNumber of Additional RX queues: %u\n",
 		   priv->dma_cap.number_rx_queues);
-	seq_printf(seq, "\tNumber of Additional TX queues: %d\n",
+	seq_printf(seq, "\tNumber of Additional TX queues: %u\n",
 		   priv->dma_cap.number_tx_queues);
 	seq_printf(seq, "\tEnhanced descriptors: %s\n",
 		   (priv->dma_cap.enh_desc) ? "Y" : "N");
@@ -7043,7 +7044,7 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 void stmmac_xdp_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 chan;
+	u8 chan;
 
 	/* Ensure tx function is not running */
 	netif_tx_disable(dev);
@@ -7076,14 +7077,14 @@ void stmmac_xdp_release(struct net_device *dev)
 int stmmac_xdp_open(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 rx_cnt = priv->plat->rx_queues_to_use;
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
-	u32 dma_csr_ch = max(rx_cnt, tx_cnt);
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 dma_csr_ch = max(rx_cnt, tx_cnt);
 	struct stmmac_rx_queue *rx_q;
 	struct stmmac_tx_queue *tx_q;
 	u32 buf_size;
 	bool sph_en;
-	u32 chan;
+	u8 chan;
 	int ret;
 
 	ret = alloc_dma_desc_resources(priv, &priv->dma_conf);
@@ -7219,10 +7220,10 @@ int stmmac_xsk_wakeup(struct net_device *dev, u32 queue, u32 flags)
 static void stmmac_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
-	u32 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
 	unsigned int start;
-	int q;
+	u8 q;
 
 	for (q = 0; q < tx_cnt; q++) {
 		struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[q];
@@ -7511,7 +7512,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 static void stmmac_napi_add(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 queue, maxq;
+	u8 queue, maxq;
 
 	maxq = max(priv->plat->rx_queues_to_use, priv->plat->tx_queues_to_use);
 
@@ -7540,7 +7541,7 @@ static void stmmac_napi_add(struct net_device *dev)
 static void stmmac_napi_del(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 queue, maxq;
+	u8 queue, maxq;
 
 	maxq = max(priv->plat->rx_queues_to_use, priv->plat->tx_queues_to_use);
 
@@ -7558,7 +7559,7 @@ static void stmmac_napi_del(struct net_device *dev)
 	}
 }
 
-int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
+int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
@@ -7763,8 +7764,8 @@ static int __stmmac_dvr_probe(struct device *device,
 {
 	struct net_device *ndev = NULL;
 	struct stmmac_priv *priv;
-	u32 rxq;
 	int i, ret = 0;
+	u8 rxq;
 
 	if (!plat_dat->dma_cfg || !plat_dat->dma_cfg->pbl) {
 		dev_err(device, "invalid DMA configuration\n");
@@ -8147,7 +8148,7 @@ int stmmac_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	u32 chan;
+	u8 chan;
 
 	if (!ndev || !netif_running(ndev))
 		goto suspend_bsp;
@@ -8222,9 +8223,9 @@ static void stmmac_reset_tx_queue(struct stmmac_priv *priv, u32 queue)
  */
 static void stmmac_reset_queues_param(struct stmmac_priv *priv)
 {
-	u32 rx_cnt = priv->plat->rx_queues_to_use;
-	u32 tx_cnt = priv->plat->tx_queues_to_use;
-	u32 queue;
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	u8 queue;
 
 	for (queue = 0; queue < rx_cnt; queue++)
 		stmmac_reset_rx_queue(priv, queue);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 0d3bad0f8915..3b514a702612 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -138,6 +138,7 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	struct device_node *tx_node;
 	u8 queue = 0;
 	int ret = 0;
+	u32 value;
 
 	/* First Queue must always be in DCB mode. As MTL_QUEUE_DCB = 1 we need
 	 * to always set this, otherwise Queue will be classified as AVB
@@ -157,8 +158,11 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	}
 
 	/* Processing RX queues common config */
-	of_property_read_u32(rx_node, "snps,rx-queues-to-use",
-			     &plat->rx_queues_to_use);
+	if (!of_property_read_u32(rx_node, "snps,rx-queues-to-use", &value)) {
+		if (value > U8_MAX)
+			value = U8_MAX;
+		plat->rx_queues_to_use = value;
+	}
 
 	if (of_property_read_bool(rx_node, "snps,rx-sched-sp"))
 		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
@@ -208,8 +212,11 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	}
 
 	/* Processing TX queues common config */
-	of_property_read_u32(tx_node, "snps,tx-queues-to-use",
-			     &plat->tx_queues_to_use);
+	if (!of_property_read_u32(tx_node, "snps,tx-queues-to-use", &value)) {
+		if (value > U8_MAX)
+			value = U8_MAX;
+		plat->tx_queues_to_use = value;
+	}
 
 	if (of_property_read_bool(tx_node, "snps,tx-sched-wrr"))
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 411cdd3ea034..03fd85060a73 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -244,8 +244,8 @@ struct plat_stmmacenet_data {
 	int tx_fifo_size;
 	int rx_fifo_size;
 	u32 host_dma_width;
-	u32 rx_queues_to_use;
-	u32 tx_queues_to_use;
+	u8 rx_queues_to_use;
+	u8 tx_queues_to_use;
 	u8 rx_sched_algorithm;
 	u8 tx_sched_algorithm;
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
-- 
2.47.3


