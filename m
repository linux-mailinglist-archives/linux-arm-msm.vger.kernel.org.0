Return-Path: <linux-arm-msm+bounces-95943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPTtMOcFrGl0jAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:03:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 135C222B4AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36E163013726
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA0933AD82;
	Sat,  7 Mar 2026 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FFGaI7Vv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A513E31813A;
	Sat,  7 Mar 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772881376; cv=none; b=kBEA/cci7jXjbmmlm3QIi1R3mVonLcwRNxtGj+2rlOaTtcH1EXl2wNYbZEryr6vIwrm3Fv0nwLmkrEA2miIGbSacoubGfsXO2iGA1W91vSG7mVODVNZCekBdZLnyFb931L1CFnTi3hRwD+IH/V1iU/BUdz068WK9CBTE0vqrEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772881376; c=relaxed/simple;
	bh=USaxOJqUlJvq9yWbxsgQP4FNKfav2RWvTmVjdVa1vSA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=HKOy3OU3gersvLfAQKc82spBgz5n8wvKYSoc3T2tVu2Qj3iWNe9iOdz+Qf5zVxB/M3Vfq8rStgOpuUUSSz+2eRTp7yzv6U2+OgqM5WBADtS6vSlQ5rCUsKBsAHYwq+KnoPy9UVBl8ssc2md/vYF0PMiYn3878N1ywMNiGNozYPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=FFGaI7Vv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YwtMUAZTUX+DedK7frl0afLmUEjjoTcHhOmPYx1WSBI=; b=FFGaI7VvorcLhN9/4oiN7KEwru
	Gl2CZNCNDrhmaqSJq+yy2dCATIl7zRKVTl5odzyvaULN/vhIZkdGwqaXGMNKOeW7g2o/WvXbjY6Zf
	BYRWJxe9507ysFMUT+c4HKiOi1Z3NIHiW+regO7P8O64hW5seKTiZOVGjE9bpvxdWqW3oHHy/MZBE
	bzJA20dqX/KR+7T8g3FAybyFfrZUgtAj1fLF2gZRKU6plveKCbpwSPfxxc7GL0VN487HOEzg7qjY2
	4ulEkUCDCmXvSID/h+/QkkEG16In+zKoDV8reg2KO6Yr6gwDUxGOn3X4Zxaoz2K/G3OoD60DftXB+
	4klMygrQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46228 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vypQf-0000000027Y-04oP;
	Sat, 07 Mar 2026 11:02:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vypQe-0000000CSw0-0JpB;
	Sat, 07 Mar 2026 11:02:40 +0000
In-Reply-To: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
References: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/7] net: stmmac: provide plat_dat->dma_cfg in
 stmmac_plat_dat_alloc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vypQe-0000000CSw0-0JpB@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sat, 07 Mar 2026 11:02:40 +0000
X-Rspamd-Queue-Id: 135C222B4AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95943-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_SPAM(0.00)[0.326];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

plat_dat->dma_cfg is unconditionally required for the operation of the
driver, so it would make sense to allocate it along with the plat_dat.

On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.

Given that dma_cfg is required, and it is now less than a cache line,
It doesn't make sense to allocate this separateny, so place it at the
end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
at that to avoid mass changes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 5 -----
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 4 ----
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 5 -----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 8 +-------
 include/linux/stmmac.h                                | 1 +
 7 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index fc13bfb47783..0b32560cd059 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1251,11 +1251,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
-				     GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
 					     GFP_KERNEL);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ada6c6ef1f5c..51b1562f84d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -513,10 +513,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	ld = devm_kzalloc(&pdev->dev, sizeof(*ld), GFP_KERNEL);
 	if (!ld)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 8b45b9cf7202..d245546b90db 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -218,10 +218,6 @@ motorcomm_default_plat_data(struct pci_dev *pdev)
 	if (!plat->mdio_bus_data)
 		return NULL;
 
-	plat->dma_cfg = devm_kzalloc(dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return NULL;
-
 	plat->axi = devm_kzalloc(dev, sizeof(*plat->axi), GFP_KERNEL);
 	if (!plat->axi)
 		return NULL;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f0160ff54a59..87f43811faa0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7730,6 +7730,8 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 	if (!plat_dat)
 		return NULL;
 
+	plat_dat->dma_cfg = &plat_dat->__dma_cfg;
+
 	/* Set the defaults:
 	 * - phy autodetection
 	 * - determine GMII_Address CR field from CSR clock
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 270ad066ced3..836fed7d60ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -134,11 +134,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
-				     GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
 					     GFP_KERNEL);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c34998486293..1aed48fe0db6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -548,13 +548,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 				     &plat->multicast_filter_bins);
 	}
 
-	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
-			       GFP_KERNEL);
-	if (!dma_cfg) {
-		ret = ERR_PTR(-ENOMEM);
-		goto error_put_mdio;
-	}
-	plat->dma_cfg = dma_cfg;
+	dma_cfg = plat->dma_cfg;
 
 	of_property_read_u32(np, "snps,pbl", &dma_cfg->pbl);
 	if (!dma_cfg->pbl)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 965ada809fdf..919196713c05 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -306,5 +306,6 @@ struct plat_stmmacenet_data {
 	int msi_tx_base_vec;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
+	struct stmmac_dma_cfg __dma_cfg;
 };
 #endif
-- 
2.47.3


