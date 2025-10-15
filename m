Return-Path: <linux-arm-msm+bounces-77415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90184BDEFF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D9803A7B42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA0223FC49;
	Wed, 15 Oct 2025 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vr+r9eP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A991534EC;
	Wed, 15 Oct 2025 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538061; cv=none; b=DSxecN49Eris+nzoCKUQOmE4wJ1bKLXcAaI+R4MMtMuyI9InV/CYMD8VgqlomUQHdL5b9M7B7TMjDGVWITa0yovp6ocfmcWH6dxeC0o/kRQalNgwIbhYCLTifPZIFDihSSU7m02IE/5oXwUk0TbvTmKQZ0H4hGbIDz7+c6Gtbu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538061; c=relaxed/simple;
	bh=De8SqzaHR1d0suKQZnzZwCS3jxZQhbVRsQOhYy38xjo=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=DAoIDuARBgUjVlCjnK4VGkV2BcCGw7cU3+cZMPxSlCGzhPq/7CYnjeV/kU5QibQMiM9V4oiZcC89U5mGo+gnTawrT3OwPlcSGIEHukKV8ZwD/JrnqBjjHXLbzxpSNVSZAzq+ay5HYOYfuW6uFDT2wLBFUAm1Dh6G/BzgNpae6vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vr+r9eP7; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ouOW943JU9Gcnhp67uNgabyL6BsaH6RjxGzkPWc08Hc=; b=vr+r9eP7sIK/0K/Smo4S63Qs8p
	bQ60wArEO5oEzKS06FxbTgBjhzkuknTvDJ+rk5Pu+sIi3RjuTA2/cLrV5yT4BZm0FV11iBXAnfV6m
	/dySwt8vb5LObmWu3drjfmfIE2f5Dqehh3uaApYPfHhzp1n+xmf1qkFhzhy3KEnROB+llC0rhYYrq
	hrgxMrafuxYQ9rH5a8yH8NUpnPx3UvxLeELrsYLTXP8+ffI208WIjys+10KvlVoEZF2aYOrHPcPvz
	2UqqwNc2CxGCxnb9ASdDazQZR7MuY6o4VE/562eY5xolqIEY2AbSu3U6sCSO4kvdxdaXYARDiYSYb
	FwXNJUrA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35484 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92MK-000000004eI-3tBx;
	Wed, 15 Oct 2025 15:20:09 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92MJ-0000000AmGJ-29wO;
	Wed, 15 Oct 2025 15:20:07 +0100
In-Reply-To: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
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
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
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
Subject: [PATCH net-next 02/14] net: stmmac: remove xstats.pcs_* members
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92MJ-0000000AmGJ-29wO@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:07 +0100

As a result of the previous commit, the pcs_link, pcs_duplex and
pcs_speed members are not used outside of the interrupt handling code,
and are only used to print their status using the misleading "Link is"
messages that bear no relation to the actual status of the link.

Remove the printing of these messages, these members, and the code
that decodes them from the hardware.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  3 --
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 28 +------------------
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 28 +------------------
 3 files changed, 2 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 8f34c9ad457f..33aeac5666f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -192,9 +192,6 @@ struct stmmac_extra_stats {
 	unsigned long irq_pcs_ane_n;
 	unsigned long irq_pcs_link_n;
 	unsigned long irq_rgmii_n;
-	unsigned long pcs_link;
-	unsigned long pcs_duplex;
-	unsigned long pcs_speed;
 	/* debug register */
 	unsigned long mtl_tx_status_fifo_full;
 	unsigned long mtl_tx_fifo_not_empty;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index fe776ddf6889..2c5ee59c3208 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -266,34 +266,8 @@ static void dwmac1000_pmt(struct mac_device_info *hw, unsigned long mode)
 /* RGMII or SMII interface */
 static void dwmac1000_rgsmii(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
-	u32 status;
-
-	status = readl(ioaddr + GMAC_RGSMIIIS);
+	readl(ioaddr + GMAC_RGSMIIIS);
 	x->irq_rgmii_n++;
-
-	/* Check the link status */
-	if (status & GMAC_RGSMIIIS_LNKSTS) {
-		int speed_value;
-
-		x->pcs_link = 1;
-
-		speed_value = ((status & GMAC_RGSMIIIS_SPEED) >>
-			       GMAC_RGSMIIIS_SPEED_SHIFT);
-		if (speed_value == GMAC_RGSMIIIS_SPEED_125)
-			x->pcs_speed = SPEED_1000;
-		else if (speed_value == GMAC_RGSMIIIS_SPEED_25)
-			x->pcs_speed = SPEED_100;
-		else
-			x->pcs_speed = SPEED_10;
-
-		x->pcs_duplex = (status & GMAC_RGSMIIIS_LNKMOD_MASK);
-
-		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
-			x->pcs_duplex ? "Full" : "Half");
-	} else {
-		x->pcs_link = 0;
-		pr_info("Link is Down\n");
-	}
 }
 
 static int dwmac1000_irq_status(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index d85bc0bb5c3c..8a19df7b0577 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -592,34 +592,8 @@ static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 /* RGMII or SMII interface */
 static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
-	u32 status;
-
-	status = readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
+	readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
 	x->irq_rgmii_n++;
-
-	/* Check the link status */
-	if (status & GMAC_PHYIF_CTRLSTATUS_LNKSTS) {
-		int speed_value;
-
-		x->pcs_link = 1;
-
-		speed_value = ((status & GMAC_PHYIF_CTRLSTATUS_SPEED) >>
-			       GMAC_PHYIF_CTRLSTATUS_SPEED_SHIFT);
-		if (speed_value == GMAC_PHYIF_CTRLSTATUS_SPEED_125)
-			x->pcs_speed = SPEED_1000;
-		else if (speed_value == GMAC_PHYIF_CTRLSTATUS_SPEED_25)
-			x->pcs_speed = SPEED_100;
-		else
-			x->pcs_speed = SPEED_10;
-
-		x->pcs_duplex = (status & GMAC_PHYIF_CTRLSTATUS_LNKMOD);
-
-		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
-			x->pcs_duplex ? "Full" : "Half");
-	} else {
-		x->pcs_link = 0;
-		pr_info("Link is Down\n");
-	}
 }
 
 static int dwmac4_irq_mtl_status(struct stmmac_priv *priv,
-- 
2.47.3


