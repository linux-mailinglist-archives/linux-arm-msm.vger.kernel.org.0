Return-Path: <linux-arm-msm+bounces-75414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F5BA6CFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 11:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D01AE7A82D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 09:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F952D4B5A;
	Sun, 28 Sep 2025 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Ef8bhI/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84D1C4A0A;
	Sun, 28 Sep 2025 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759051246; cv=none; b=TuvUD+2f1XHImSUp6LEomYKeGOO3qmALlQQb3v+mx6H08Y9qcuTxdE4QhLQ++84BpWbdzcUJTgoA4JtOboqNduOkKxIw6kFpte9Or26O4EE3VCQkwRM/ANdGwez5qis58jCynhbIzsReB1Gv1UjSnk/Wgig8ce1zN6k+YSs7GYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759051246; c=relaxed/simple;
	bh=pyyVdupjWmGBcidrmK/8HrqD5CZSlIUAhD8g8R5HF80=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=XbMF0iU+hWwVrag6VZEd0lOwEU7Kk1Lt5DEgEDKZN27J9FIm6aNTY0A4ESyYM1iKam9aCVfVMhXRYFKJLc3Dn/8zvKcbkzrPyVAXvb+pvSG/gQJjtyy6DRJQdu8mpVwIGHVibOCo9WTztjzR6c3qwTdyQBKscassHUJ6tun5nLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Ef8bhI/Z; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X0Dx61SmUSZPOg+fQqzHu8F8LceEPLcrc6v6iwBDeog=; b=Ef8bhI/Zdhk1i1kbxqbeYdRk2A
	7NKb2loClhJpeZZgDTBMPaQrwlMrWrzm8BCU78bIfC1dP19S6pZbbbVPMet+VqcRnQRcZIQJVPdGS
	KHALUn6DTqRw+YYimV1j9inR2SElj1HibcatZE1RqG255sOdUbpvvd1wJqPRjVB4fLltk9YDtiooe
	Rh1dJJHZWzLUQbsjZ8xGA11Xg7R7TsfTEHe/xfEewDNO7962Qbxvo7GVHKY57S2dPrW07T5KQRItP
	OWX4x/EQ5tjzgz8u10C2Tdmmsykd5B3OyO88us86mDg2ZtyRWoD0L+ZB7Z7H4Pf3ALr9/X8e7FXqP
	56ZPuKLA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53928 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nZl-000000005Er-3c4K;
	Sun, 28 Sep 2025 10:20:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2nZk-00000007o4X-2ttj;
	Sun, 28 Sep 2025 10:20:12 +0100
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
Subject: [PATCH RFC net-next v2 02/19] net: stmmac: remove xstats.pcs_*
 members
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2nZk-00000007o4X-2ttj@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:20:12 +0100

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
index eaa1f2e1c5a5..8ff3406cdfbf 100644
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


