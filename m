Return-Path: <linux-arm-msm+bounces-77416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31DBDEFFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D063AA7A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CD3243969;
	Wed, 15 Oct 2025 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FkV7VDXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75F2101AE;
	Wed, 15 Oct 2025 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538076; cv=none; b=c8g+3PJo3HLj/DBtGD0dwrHDXA3lzVVfAigcySItapMUE3fsF8YK0ytIWbHRJBshiup0A/uz76V7bWShIuKZ8spEXjjdILZ8QPTiaTWxqfS0z7J08sPW315k0bS74QVaWjxHrRf2lTtPqT00Mje1ODD5qCPjaW0PZRLynxyzIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538076; c=relaxed/simple;
	bh=QYUPIncYnkax3zEl46Ot1q189elP6Ufo4KyZDrAbL30=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=TfP9nEWbJVOaeqNwAS4Ge9OYPeuqV2kSG0sL1m+2VmEAAfYcTmMOlnam3sykzatgozu/NGgHyAPWxW8fNo3o+zRA2v/mYFNIFbZFGXJ5TavPzNUSKarCNeDWQXa5rVGTi8UEqU8nCxLwDem2sFXTOEcr9w86yhgBPGZ++B6SDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=FkV7VDXe; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wL/ame7v34EiY5oVwcuvfByYyCNwndIpgbavubqiA/g=; b=FkV7VDXeTEelSX4c/Rba2HOh6a
	Yjm3Me462MkTrT4jbPCFHW8Jnd7vIoeMOEgUPInRRBaafTJVJOJUIqfWJ2W9KaJiwRwg86DHslLFf
	ulYplIXogkd7VQEWjsOp/i8nouzQ/hQv30lgLjMTNDFzVH+XWFJ3ZiVXobYyvpVjOiLoB3NG8Ia/5
	ayHRYlHoaGyu5xxFLWI+Sop3Ugz3coVmvK6bt+CHUx7HJ/hz8k31HP08TTnf8X7mgojVJbAuEc7YT
	acfqh0ayOBUhRkw+JrRu9R45OGoyfxqt/H69JG5Z11ancgaUJ/vi7xhRWjXoQYPceVY4bBHBPixse
	Xtnmv8kQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58334 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92MQ-000000004eZ-1xVV;
	Wed, 15 Oct 2025 15:20:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92MO-0000000AmGP-2hFV;
	Wed, 15 Oct 2025 15:20:12 +0100
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
Subject: [PATCH net-next 03/14] net: stmmac: remove SGMII/RGMII/SMII interrupt
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:12 +0100

Now that the only use for the interrupt is to clear it and increment a
statistic counter (which is not that relevant anymore) remove all this
code and ensure that the interrupt remains disabled to avoid a stuck
interrupt.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h      |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 10 ----------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h         |  3 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    |  9 ---------
 4 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 0c011a47d5a3..8f3002d9de78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -38,10 +38,10 @@
 #define	GMAC_INT_DISABLE_PCSAN		BIT(2)
 #define	GMAC_INT_DISABLE_PMT		BIT(3)
 #define	GMAC_INT_DISABLE_TIMESTAMP	BIT(9)
-#define	GMAC_INT_DISABLE_PCS	(GMAC_INT_DISABLE_RGMII | \
-				 GMAC_INT_DISABLE_PCSLINK | \
+#define	GMAC_INT_DISABLE_PCS	(GMAC_INT_DISABLE_PCSLINK | \
 				 GMAC_INT_DISABLE_PCSAN)
-#define	GMAC_INT_DEFAULT_MASK	(GMAC_INT_DISABLE_TIMESTAMP | \
+#define	GMAC_INT_DEFAULT_MASK	(GMAC_INT_DISABLE_RGMII | \
+				 GMAC_INT_DISABLE_TIMESTAMP | \
 				 GMAC_INT_DISABLE_PCS)
 
 /* PMT Control and Status */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 2c5ee59c3208..654331b411f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -263,13 +263,6 @@ static void dwmac1000_pmt(struct mac_device_info *hw, unsigned long mode)
 	writel(pmt, ioaddr + GMAC_PMT);
 }
 
-/* RGMII or SMII interface */
-static void dwmac1000_rgsmii(void __iomem *ioaddr, struct stmmac_extra_stats *x)
-{
-	readl(ioaddr + GMAC_RGSMIIIS);
-	x->irq_rgmii_n++;
-}
-
 static int dwmac1000_irq_status(struct mac_device_info *hw,
 				struct stmmac_extra_stats *x)
 {
@@ -311,9 +304,6 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
 
 	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
 
-	if (intr_status & PCS_RGSMIIIS_IRQ)
-		dwmac1000_rgsmii(ioaddr, x);
-
 	return ret;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 3dec1a264cf6..6dd84b6544cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -106,8 +106,7 @@
 #define GMAC_INT_LPI_EN			BIT(5)
 #define GMAC_INT_TSIE			BIT(12)
 
-#define	GMAC_PCS_IRQ_DEFAULT	(GMAC_INT_RGSMIIS | GMAC_INT_PCS_LINK |	\
-				 GMAC_INT_PCS_ANE)
+#define	GMAC_PCS_IRQ_DEFAULT	(GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE)
 
 #define	GMAC_INT_DEFAULT_ENABLE	(GMAC_INT_PMT_EN | GMAC_INT_LPI_EN | \
 				 GMAC_INT_TSIE)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 8a19df7b0577..bff4c371c1d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -589,13 +589,6 @@ static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
-/* RGMII or SMII interface */
-static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
-{
-	readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
-	x->irq_rgmii_n++;
-}
-
 static int dwmac4_irq_mtl_status(struct stmmac_priv *priv,
 				 struct mac_device_info *hw, u32 chan)
 {
@@ -667,8 +660,6 @@ static int dwmac4_irq_status(struct mac_device_info *hw,
 	}
 
 	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
-	if (intr_status & PCS_RGSMIIIS_IRQ)
-		dwmac4_phystatus(ioaddr, x);
 
 	return ret;
 }
-- 
2.47.3


