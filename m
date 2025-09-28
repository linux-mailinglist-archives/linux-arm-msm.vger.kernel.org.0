Return-Path: <linux-arm-msm+bounces-75422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F4BA6D60
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 11:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A92EB3B82D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 09:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2B42D0C9C;
	Sun, 28 Sep 2025 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="rcBuxI2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E2329E110;
	Sun, 28 Sep 2025 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759051740; cv=none; b=t6OrD+cn+vqMCD7GixP3r9Pxp9mPUBLc1ulfm1P+Ck49HUYcdcTd9W0z+mouP/t+gw+G+kqqfkNAzFzL0Yl9B5RYx+sT6ELYqO+ao0e6cvl+uYKjBSLxj3UbQirFtAmRNHnIj7TC/dIBKgm8clPTDm/9gzrUZaAwAcP+5OIyiio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759051740; c=relaxed/simple;
	bh=9NN9fr67WoNETKVTOTiH6Iw/vqkVwREUoXhUyUjLJm8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=o0GkYqwFAITPJs+ydUh+pEFwE+h3z/bAbuwNNOzUt+DLm/xmp83Wi/J8X1PXaxqMJnv1YP7I2na7B6EMCkJQkHo94x3e0+/qF5cbTKZ8R6N4MThw5TSlN+5c4OwHxc0kPGI0DEdR1ocMKx9awVj1RuIfQ4TJmfJMcKgQ60PHhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=rcBuxI2g; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zfzbvxzTQoEqODEMoNNlZ/eCy7Ue1+toCRb4MMoMOM0=; b=rcBuxI2g/As/f/Oj6y83atdtQh
	wJQtkfwXEgan78WLBq3muhdLIJhgTGmabQLbE1HqRKY7tov/5EdpK1Y2I3OCuoLdIf01sMb/10V04
	cqwMqP+n2hwLTemuhAbeioGr+igdG8SdPg3qc4IGKvmg/ZvMzIcxlDZY66Nxkf4UCJTdEWRMSne7O
	js2DN1t6YbtRkWr9/S/oq5vFJfvOfWZ0+YxcO45lw6fq+t+BBXLfNdShMdQJjNrTZyvRPrCOoQo+P
	MDZsCe5dhg9feCRHRszqcYjA1p9sDLTQzwSefxmn3Xh87+hDrjqcjbqBRd/ghkacVKhO8khCjF4Qz
	mFvaZZ9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54354 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nau-000000005J8-0oFE;
	Sun, 28 Sep 2025 10:21:24 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2naq-00000007oJa-0gWU;
	Sun, 28 Sep 2025 10:21:20 +0100
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
Subject: [PATCH RFC net-next v2 15/19] net: stmmac: add
 stmmac_mac_irq_modify()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2naq-00000007oJa-0gWU@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:21:20 +0100

Add a function to allow interrupts to be enabled and disabled in a
core independent manner.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h    |  5 +++++
 .../ethernet/stmicro/stmmac/dwmac1000_core.c    | 15 +++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c   | 17 +++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 16 ++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  4 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c    |  3 +++
 7 files changed, 62 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 9758d768fd0a..fd6635d36801 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -605,6 +605,11 @@ struct mac_device_info {
 	u8 vlan_fail_q;
 	bool hw_vlan_en;
 	bool reverse_sgmii_enable;
+
+	/* This spinlock protects read-modify-write of the interrupt
+	 * mask/enable registers.
+	 */
+	spinlock_t irq_ctrl_lock;
 };
 
 struct stmmac_rx_routing {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 571e48362444..2ca94bfd3f71 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -61,6 +61,20 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 #endif
 }
 
+static void dwmac1000_irq_modify(struct mac_device_info *hw, u32 disable,
+				 u32 enable)
+{
+	void __iomem *int_mask = hw->pcsr + GMAC_INT_MASK;
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&hw->irq_ctrl_lock, flags);
+	value = readl(int_mask) | disable;
+	value &= ~enable;
+	writel(value, int_mask);
+	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
+}
+
 static int dwmac1000_rx_ipc_enable(struct mac_device_info *hw)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -445,6 +459,7 @@ static void dwmac1000_set_mac_loopback(void __iomem *ioaddr, bool enable)
 const struct stmmac_ops dwmac1000_ops = {
 	.pcs_init = dwmac1000_pcs_init,
 	.core_init = dwmac1000_core_init,
+	.irq_modify = dwmac1000_irq_modify,
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac1000_rx_ipc_enable,
 	.dump_regs = dwmac1000_dump_regs,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 0b785389b7ef..6269407d70cd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -57,6 +57,20 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 		init_waitqueue_head(&priv->tstamp_busy_wait);
 }
 
+static void dwmac4_irq_modify(struct mac_device_info *hw, u32 disable,
+			      u32 enable)
+{
+	void __iomem *int_mask = hw->pcsr + GMAC_INT_EN;
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&hw->irq_ctrl_lock, flags);
+	value = readl(int_mask) & ~disable;
+	value |= enable;
+	writel(value, int_mask);
+	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
+}
+
 static void dwmac4_update_caps(struct stmmac_priv *priv)
 {
 	if (priv->plat->tx_queues_to_use > 1)
@@ -885,6 +899,7 @@ static int dwmac4_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
 const struct stmmac_ops dwmac4_ops = {
 	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
+	.irq_modify = dwmac4_irq_modify,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
@@ -920,6 +935,7 @@ const struct stmmac_ops dwmac4_ops = {
 const struct stmmac_ops dwmac410_ops = {
 	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
+	.irq_modify = dwmac4_irq_modify,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
@@ -957,6 +973,7 @@ const struct stmmac_ops dwmac410_ops = {
 const struct stmmac_ops dwmac510_ops = {
 	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
+	.irq_modify = dwmac4_irq_modify,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 0430af27da40..b40b3ea50e25 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -28,6 +28,20 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
 	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
 }
 
+static void dwxgmac2_irq_modify(struct mac_device_info *hw, u32 disable,
+				u32 enable)
+{
+	void __iomem *int_mask = hw->pcsr + XGMAC_INT_EN;
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&hw->irq_ctrl_lock, flags);
+	value = readl(int_mask) & ~disable;
+	value |= enable;
+	writel(value, int_mask);
+	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
+}
+
 static void dwxgmac2_update_caps(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.mbps_10_100)
@@ -1411,6 +1425,7 @@ static void dwxgmac2_set_arp_offload(struct mac_device_info *hw, bool en,
 
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
+	.irq_modify = dwxgmac2_irq_modify,
 	.update_caps = dwxgmac2_update_caps,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
@@ -1466,6 +1481,7 @@ static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
 
 const struct stmmac_ops dwxlgmac2_ops = {
 	.core_init = dwxgmac2_core_init,
+	.irq_modify = dwxgmac2_irq_modify,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
 	.rx_queue_enable = dwxlgmac2_rx_queue_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 3f7c765dcb79..aa9e06be4a79 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -351,6 +351,8 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	if (!mac)
 		return -ENOMEM;
 
+	spin_lock_init(&mac->irq_ctrl_lock);
+
 	/* Fallback to generic HW */
 	for (i = ARRAY_SIZE(stmmac_hw) - 1; i >= 0; i--) {
 		entry = &stmmac_hw[i];
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 82cfb6bec334..cb8fc09caf86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -319,6 +319,8 @@ struct stmmac_ops {
 	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
 	/* Update MAC capabilities */
 	void (*update_caps)(struct stmmac_priv *priv);
+	/* Change the interrupt enable setting. Enable takes precedence. */
+	void (*irq_modify)(struct mac_device_info *hw, u32 disable, u32 enable);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
@@ -421,6 +423,8 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, core_init, __args)
 #define stmmac_mac_update_caps(__priv) \
 	stmmac_do_void_callback(__priv, mac, update_caps, __priv)
+#define stmmac_mac_irq_modify(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, irq_modify, (__priv)->hw, __args)
 #define stmmac_mac_set(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_mac, __args)
 #define stmmac_rx_ipc(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 75b470ee621a..c54c70224351 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -70,8 +70,10 @@ static void stmmac_fpe_configure_pmac(struct ethtool_mmsv *mmsv, bool pmac_enabl
 	struct stmmac_priv *priv = container_of(cfg, struct stmmac_priv, fpe_cfg);
 	const struct stmmac_fpe_reg *reg = cfg->reg;
 	void __iomem *ioaddr = priv->ioaddr;
+	unsigned long flags;
 	u32 value;
 
+	spin_lock_irqsave(&priv->hw->irq_ctrl_lock, flags);
 	value = readl(ioaddr + reg->int_en_reg);
 
 	if (pmac_enable) {
@@ -86,6 +88,7 @@ static void stmmac_fpe_configure_pmac(struct ethtool_mmsv *mmsv, bool pmac_enabl
 	}
 
 	writel(value, ioaddr + reg->int_en_reg);
+	spin_unlock_irqrestore(&priv->hw->irq_ctrl_lock, flags);
 }
 
 static void stmmac_fpe_send_mpacket(struct ethtool_mmsv *mmsv,
-- 
2.47.3


