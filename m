Return-Path: <linux-arm-msm+bounces-75427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4EFBA6DB7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 11:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B1AC1774EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 09:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BAE2D7DF8;
	Sun, 28 Sep 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="uiaHdb/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD142D1911;
	Sun, 28 Sep 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759051927; cv=none; b=uEq6lxulXdcb79tJYACgvs3Fm7YuGX2gZ/pGs0sZkU0BOp6Q3ct89GnWQGZkls0PxDgTmGFRKBFIeDx5EKiYSh/gJQ2MPDt7wDyeYgCpD+dVM2kEKK7aTnxC/1e3p/9up8288Thr7Mti1GbgTMOEBjGNaOJSj/v6fW46Gj4bmp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759051927; c=relaxed/simple;
	bh=02bdbx2BJXCEsXK+z/k1M0YnhLUUK/Ev2PI05TK5PIE=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=djKwzRHoZXtx/6DcXz5AyMlfSNNto2FXlTuTatH+rCCNAkkA/dKYd1dcC5KYh9WUOURhW01MP26teXfy1JLFRLVx06Fo8eMvEw38gv1SgZcOl04lk6n+X0P2oB3cetcZnQ/HyXykArwJQhq6puRkk+9Ydu8QRR/IKd6vG+Co2Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=uiaHdb/F; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D3L8M7KQsmj1QF5jxJrVPkmo8sZwN7kGHH+0baoZXkA=; b=uiaHdb/FaZ3xmVmWegeOz5YPJR
	RMb7DyL5dDuc1dJyBSGZVFEZxTVh5cWDCRchGkM8/Ep4q0R4frUjS6oa2ZQPNJt0j65myRbkDV/N6
	cQbbz496gZiY0dfpnvjaizRH47xuSUI2yJMxHZNyvSK86E7w7ZIbFLUVt0fDtt67+RWrd+19VBu2m
	RY+R/6qL06yyeccXCLnu1psjpPd82hyPAiSSpCrDSUOiCPDf+JlRIKJrJzmYhmSofmHiitX4kchlU
	7gAwonw2hO4w7nvOTxw/4nzFWmQ9/soXVTiECous4LLc9u0SjoKn/A8+pPX76gSOQpzpJwyums0K9
	/31HMCbA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45574 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nas-000000005Ij-1a39;
	Sun, 28 Sep 2025 10:21:22 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2nal-00000007oJ8-0D5B;
	Sun, 28 Sep 2025 10:21:15 +0100
In-Reply-To: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
References: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	"Alexis Lothor__" <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH RFC net-next v2 14/19] net: stmmac: only initialise PCS when
 present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2nal-00000007oJ8-0D5B@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:21:15 +0100

dwmac1000 and dwmac4 both provide a hardware feature bit to indicate
when the PCS block is present. There is little point initialising the
PCS support when the hardware is not present.

Add a new callback which will be made after the hardware features have
been read, and heck whether the PCS is present.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c    | 11 ++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c   | 13 ++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   |  4 ++++
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index b01c0fc822f9..571e48362444 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -22,6 +22,14 @@
 #include "stmmac_ptp.h"
 #include "dwmac1000.h"
 
+static int dwmac1000_pcs_init(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.pcs)
+		return 0;
+
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+}
+
 static void dwmac1000_core_init(struct mac_device_info *hw,
 				struct net_device *dev)
 {
@@ -435,6 +443,7 @@ static void dwmac1000_set_mac_loopback(void __iomem *ioaddr, bool enable)
 }
 
 const struct stmmac_ops dwmac1000_ops = {
+	.pcs_init = dwmac1000_pcs_init,
 	.core_init = dwmac1000_core_init,
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac1000_rx_ipc_enable,
@@ -484,7 +493,7 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 	mac->mii.clk_csr_shift = 2;
 	mac->mii.clk_csr_mask = GENMASK(5, 2);
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return 0;
 }
 
 /* DWMAC 1000 HW Timestaming ops */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 688e45b440dd..0b785389b7ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -22,6 +22,14 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 
+static int dwmac4_pcs_init(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.pcs)
+		return 0;
+
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+}
+
 static void dwmac4_core_init(struct mac_device_info *hw,
 			     struct net_device *dev)
 {
@@ -875,6 +883,7 @@ static int dwmac4_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
 }
 
 const struct stmmac_ops dwmac4_ops = {
+	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_set_mac,
@@ -909,6 +918,7 @@ const struct stmmac_ops dwmac4_ops = {
 };
 
 const struct stmmac_ops dwmac410_ops = {
+	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
@@ -945,6 +955,7 @@ const struct stmmac_ops dwmac410_ops = {
 };
 
 const struct stmmac_ops dwmac510_ops = {
+	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
@@ -1017,5 +1028,5 @@ int dwmac4_setup(struct stmmac_priv *priv)
 	mac->mii.clk_csr_mask = GENMASK(11, 8);
 	mac->num_vlan = stmmac_get_num_vlan(priv->ioaddr);
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7796f5f3c96f..82cfb6bec334 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -313,6 +313,8 @@ enum stmmac_lpi_mode {
 
 /* Helpers to program the MAC core */
 struct stmmac_ops {
+	/* Initialise any PCS instances */
+	int (*pcs_init)(struct stmmac_priv *priv);
 	/* MAC core initialization */
 	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
 	/* Update MAC capabilities */
@@ -413,6 +415,8 @@ struct stmmac_ops {
 					u32 pclass);
 };
 
+#define stmmac_mac_pcs_init(__priv) \
+	stmmac_do_callback(__priv, mac, pcs_init, __priv)
 #define stmmac_core_init(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, core_init, __args)
 #define stmmac_mac_update_caps(__priv) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2cf6e69f3303..0f243f207f99 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7240,6 +7240,10 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			 "Enable RX Mitigation via HW Watchdog Timer\n");
 	}
 
+	ret = stmmac_mac_pcs_init(priv);
+	if (ret != -EINVAL)
+		return ret;
+
 	return 0;
 }
 
-- 
2.47.3


