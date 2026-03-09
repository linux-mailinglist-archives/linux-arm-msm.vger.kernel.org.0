Return-Path: <linux-arm-msm+bounces-96170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIQ1NvGVrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:42:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9E2365F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFA95301FCA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358B37C10F;
	Mon,  9 Mar 2026 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="dtnzDucV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC4137AA89;
	Mon,  9 Mar 2026 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049186; cv=none; b=fPknbO8APwlP2Iuhoujms6jX0Zc5ciFE62/9u/JQS+McRWjk28SwpHYBwdATeMqXK2lEbfkR0WFfcwJMIrzF+oYDFlU8/nLt5o7lTGI82J6RxmzguBUUQbEGY9MhHwji2tAhNqA27zlCeKWPKO4tBAce/2KTXcY4FK4TrRieYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049186; c=relaxed/simple;
	bh=CBg+yuZJV5m5DOx9unTVVRstDMn3CU8QWFscLLZbSaA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=pR1K8Mzr0NI2NgK6xvLkNyiRVkJGlhBEK/aDmR8a/dXqx4WWQexo2kgjBc2e/xeBqS5ARuAyZmtPRyMjFVHT80912Ycv9QaIWMPoejLU8PLghUBA+tischl/y/i78nKV7LEk8BoCs5AYGF4E7w8vknGRWEbDviCM+j2lhxXkbAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=dtnzDucV; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ass4zcIQgMq8RyUlE3ZGquyQ7D25QZZxqWSmx1pHjq0=; b=dtnzDucVNQosAv+B9Na/Ivn5NT
	OvwjRpZ2VP33RKn0sF0pwhKzsvYIyDTdQVXNnJ9oNrgPibEUsj9jvEnL0GdY5W85x05p0Cda0bY/L
	iAoiBu8fRROX+Nv6woqVYiI/bWe4PQaOrEwcBjVB0rgi7kvbV+1K3GYgvbyaqSZ0S9YM9MtDbBiPy
	u3cCmec2XqSqymr9n3hByfX563ZkFIQaEpCWbCe7M9Gcc/DFUZSGhL/oR1tEdtGXyxMklZNGvYgdN
	8fcGrKUS5C4nXFzikP11BN1UZDVr5fTfAX1lADOUMsRVmLeB+053v/4XRYu7SuVCz2hLxV1Jwd4OP
	1KdeJ+mg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57952 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzX5A-000000003UF-2zCz;
	Mon, 09 Mar 2026 09:39:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzX59-0000000CVs2-3MHc;
	Mon, 09 Mar 2026 09:39:23 +0000
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
Subject: [PATCH net-next v2 2/7] net: stmmac: convert plat_stmmacenet_data
 booleans to type bool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:23 +0000
X-Rspamd-Queue-Id: 4FD9E2365F2
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
	TAGGED_FROM(0.00)[bounces-96170-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_SPAM(0.00)[0.336];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,armlinux.org.uk:email]
X-Rspamd-Action: no action

Convert members of struct plat_stmmacenet_data that are booleans to
type 'bool' and ensure their initialisers are true/false. Move the
has_xxx for the GMAC cores together, and move the COE members to the
end of the list of bool to avoid unused holes in the struct.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  6 +++---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 +++++++++----------
 include/linux/stmmac.h                        | 14 ++++++-------
 14 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 0495437d3a6e..b0c5d1ecabce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -88,7 +88,7 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	plat_dat->dma_cfg->aal = 1;
 	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	plat_dat->pmt = 1;
+	plat_dat->pmt = true;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 0b32560cd059..421c6c81ca5e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -566,7 +566,7 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
 	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->core_type = DWMAC_CORE_GMAC;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 
 	plat->mdio_bus_data->needs_reset = true;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 51b1562f84d1..eb14c197d6ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -94,7 +94,7 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* clk_csr_i = 100-150MHz & MDC = clk_csr_i/62 */
 	plat->clk_csr = STMMAC_CSR_100_150M;
 	plat->core_type = DWMAC_CORE_GMAC;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 
 	/* Increase the default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 1f2d7d19ca56..a139db6a8cbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -564,7 +564,7 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 		plat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
 	else
 		plat->flags |= STMMAC_FLAG_USE_PHY_WOL;
-	plat->riwt_off = 1;
+	plat->riwt_off = true;
 	plat->maxmtu = ETH_DATA_LEN;
 	plat->host_dma_width = priv_plat->variant->dma_bit_mask;
 	plat->bsp_priv = priv_plat;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cb1c074c2053..388e9fdeb86c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -817,7 +817,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
-	plat_dat->pmt = 1;
+	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index af594a096676..48fceadc55b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -163,7 +163,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 
 	/* S32CC core feature set */
 	plat->core_type = DWMAC_CORE_GMAC4;
-	plat->pmt = 1;
+	plat->pmt = true;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
 	plat->rx_fifo_size = 20480;
 	plat->tx_fifo_size = 20480;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c6b99814d391..5f89fd968ae9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -565,7 +565,7 @@ static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 	plat_dat->core_type = DWMAC_CORE_GMAC;
 
 	/* Rx watchdog timer in dwmac is buggy in this hw */
-	plat_dat->riwt_off = 1;
+	plat_dat->riwt_off = true;
 }
 
 static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 3ce03b059277..6dbe5d5a3224 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1179,7 +1179,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	 * hardware features were copied from Allwinner drivers.
 	 */
 	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
-	plat_dat->tx_coe = 1;
+	plat_dat->tx_coe = true;
 	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun8i_dwmac_init;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 52593ba3a3a3..74bd996d93c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -135,7 +135,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers. */
-	plat_dat->tx_coe = 1;
+	plat_dat->tx_coe = true;
 	plat_dat->core_type = DWMAC_CORE_GMAC;
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun7i_gmac_init;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index d765acbe3754..b4b39e6a169e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -310,7 +310,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 
 	plat->core_type = DWMAC_CORE_XGMAC;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
-	plat->pmt = 1;
+	plat->pmt = true;
 	plat->bsp_priv = mgbe;
 
 	if (!plat->mdio_node)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 87f43811faa0..939431255fa5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7401,7 +7401,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 
 		/* TXCOE doesn't work in thresh DMA mode */
 		if (priv->plat->force_thresh_dma_mode)
-			priv->plat->tx_coe = 0;
+			priv->plat->tx_coe = false;
 		else
 			priv->plat->tx_coe = priv->dma_cap.tx_coe;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 836fed7d60ab..d584fd2daa6f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -25,7 +25,7 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
 	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->core_type = DWMAC_CORE_GMAC;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 
 	plat->mdio_bus_data->needs_reset = true;
 }
@@ -58,9 +58,9 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 
 	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->core_type = DWMAC_CORE_GMAC4;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
-	plat->pmt = 1;
+	plat->pmt = true;
 
 	/* Set default number of RX and TX queues to use */
 	plat->tx_queues_to_use = 4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 1aed48fe0db6..0d3bad0f8915 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -514,34 +514,34 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->multicast_filter_bins = dwmac1000_validate_mcast_bins(
 				&pdev->dev, plat->multicast_filter_bins);
 		plat->core_type = DWMAC_CORE_GMAC;
-		plat->pmt = 1;
+		plat->pmt = true;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwmac-3.40a")) {
 		plat->core_type = DWMAC_CORE_GMAC;
-		plat->enh_desc = 1;
-		plat->tx_coe = 1;
-		plat->bugged_jumbo = 1;
-		plat->pmt = 1;
+		plat->enh_desc = true;
+		plat->tx_coe = true;
+		plat->bugged_jumbo = true;
+		plat->pmt = true;
 	}
 
 	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->core_type = DWMAC_CORE_GMAC4;
-		plat->pmt = 1;
+		plat->pmt = true;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwmac-3.610") ||
 		of_device_is_compatible(np, "snps,dwmac-3.710")) {
-		plat->enh_desc = 1;
-		plat->bugged_jumbo = 1;
-		plat->force_sf_dma_mode = 1;
+		plat->enh_desc = true;
+		plat->bugged_jumbo = true;
+		plat->force_sf_dma_mode = true;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwxgmac")) {
 		plat->core_type = DWMAC_CORE_XGMAC;
-		plat->pmt = 1;
+		plat->pmt = true;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
 		of_property_read_u32(np, "snps,multicast-filter-bins",
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 919196713c05..9420da96a4ff 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -229,14 +229,14 @@ struct plat_stmmacenet_data {
 	struct stmmac_dma_cfg *dma_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
 	int clk_csr;
-	int enh_desc;
-	int tx_coe;
+	bool enh_desc;
+	bool tx_coe;
+	bool bugged_jumbo;
+	bool pmt;
+	bool force_sf_dma_mode;
+	bool force_thresh_dma_mode;
+	bool riwt_off;
 	int rx_coe;
-	int bugged_jumbo;
-	int pmt;
-	int force_sf_dma_mode;
-	int force_thresh_dma_mode;
-	int riwt_off;
 	int max_speed;
 	int maxmtu;
 	int multicast_filter_bins;
-- 
2.47.3


