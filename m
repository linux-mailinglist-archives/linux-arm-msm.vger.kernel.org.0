Return-Path: <linux-arm-msm+bounces-75432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729BBA6DF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 11:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39380189890C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7022D979D;
	Sun, 28 Sep 2025 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gdUNi+A7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7D2D7DF2;
	Sun, 28 Sep 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759052112; cv=none; b=WVXBKpJXtpYKNwKQDmcp2ZrbfL/f6pOrWHYi2fdPl/5pSUSj7zRDsrTk2hCNGYJErc7rZiN+PYPgNdfimQPTkWsPU0k4BqXqZD4x9+e46Gx/YftA/s3+refvwwAs3p9xHdrqZoewl6Quhloixql3U2e1LYrHQh0eJA5Qm73BB1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759052112; c=relaxed/simple;
	bh=x7LcanOO5jUguzsWnaHVqCWZyFdBRCdPYyuW7ZwxcCs=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=be0TSYl1pheP9CAQKzyp92kTXLnMIDwN/nigB7gwutgVus0IyKq+ZSL0S4AviU78tPGyaP+bkzKGFWe+5N8MOpxzSLxE1fRqR8IYtdgp8KLatYVRLftKvCgsLWSB46WvWyicb8fswOc7tuM5yTXcLJoOc6qN3hfRKwz733Rk470=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gdUNi+A7; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lZxI4ElVQRDHDwUjNlzEzvtgHXaIDyFC91nvXTxngLA=; b=gdUNi+A7vfiFM3CdZ6SL8iWd+E
	M/vDY6RAvRvGEtk/TtKx3F/LKwBNU1qwqngZB4hRcZ/FL1N81QoSTBBJ5f5PLbYaD80tcFdBpd+Dv
	5HIeRlIbg2h+3V3JxtzRunxwBrbtBBoIDBCsWbBrlk2Rex2gh/NGYjI3ILssewggenfUqvQOWFKfn
	KsnYAGLOPTQGAg44aacgShs73pCE3x5XZP0jxhZdbYY4kPAFT58DrrwS1+HQjshCVol3n4xtVEhQ6
	fysj9obdVcATONK5WMrNRflNoHwRfwEyg4WcdZ8QUR8JYjBUlHHrY4yg3JQUl44AKo4bckn5F0rU1
	F2uf7P3w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54368 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nay-000000005JU-3JTA;
	Sun, 28 Sep 2025 10:21:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2naw-00000007oKg-0c8B;
	Sun, 28 Sep 2025 10:21:26 +0100
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
Subject: [PATCH RFC net-next v2 16/19] net: stmmac: add support for
 controlling PCS interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2naw-00000007oKg-0c8B@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:21:26 +0100

Add support to the PCS instance for controlling the PCS interrupts
depending on whether the PCS is used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  7 +++---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 11 ++++------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  2 --
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 10 +++------
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 22 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  4 +++-
 6 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 8f3002d9de78..697bba641e05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -38,11 +38,10 @@
 #define	GMAC_INT_DISABLE_PCSAN		BIT(2)
 #define	GMAC_INT_DISABLE_PMT		BIT(3)
 #define	GMAC_INT_DISABLE_TIMESTAMP	BIT(9)
-#define	GMAC_INT_DISABLE_PCS	(GMAC_INT_DISABLE_PCSLINK | \
-				 GMAC_INT_DISABLE_PCSAN)
 #define	GMAC_INT_DEFAULT_MASK	(GMAC_INT_DISABLE_RGMII | \
-				 GMAC_INT_DISABLE_TIMESTAMP | \
-				 GMAC_INT_DISABLE_PCS)
+				 GMAC_INT_DISABLE_PCSLINK | \
+				 GMAC_INT_DISABLE_PCSAN | \
+				 GMAC_INT_DISABLE_TIMESTAMP)
 
 /* PMT Control and Status */
 #define GMAC_PMT		0x0000002c
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 2ca94bfd3f71..a2ae136d2c0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -27,7 +27,9 @@ static int dwmac1000_pcs_init(struct stmmac_priv *priv)
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
+					  GMAC_INT_DISABLE_PCSLINK |
+					  GMAC_INT_DISABLE_PCSAN);
 }
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
@@ -48,12 +50,7 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
-	value = GMAC_INT_DEFAULT_MASK;
-
-	if (hw->pcs)
-		value &= ~GMAC_INT_DISABLE_PCS;
-
-	writel(value, ioaddr + GMAC_INT_MASK);
+	writel(GMAC_INT_DEFAULT_MASK, ioaddr + GMAC_INT_MASK);
 
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Tag detection without filtering */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 6dd84b6544cc..3cb733781e1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -106,8 +106,6 @@
 #define GMAC_INT_LPI_EN			BIT(5)
 #define GMAC_INT_TSIE			BIT(12)
 
-#define	GMAC_PCS_IRQ_DEFAULT	(GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE)
-
 #define	GMAC_INT_DEFAULT_ENABLE	(GMAC_INT_PMT_EN | GMAC_INT_LPI_EN | \
 				 GMAC_INT_TSIE)
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 6269407d70cd..a4282fd7c3c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -27,7 +27,8 @@ static int dwmac4_pcs_init(struct stmmac_priv *priv)
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
+					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE);
 }
 
 static void dwmac4_core_init(struct mac_device_info *hw,
@@ -46,12 +47,7 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	writel((clk_rate / 1000000) - 1, ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
 
 	/* Enable GMAC interrupts */
-	value = GMAC_INT_DEFAULT_ENABLE;
-
-	if (hw->pcs)
-		value |= GMAC_PCS_IRQ_DEFAULT;
-
-	writel(value, ioaddr + GMAC_INT_EN);
+	writel(GMAC_INT_DEFAULT_ENABLE, ioaddr + GMAC_INT_EN);
 
 	if (GMAC_INT_DEFAULT_ENABLE & GMAC_INT_TSIE)
 		init_waitqueue_head(&priv->tstamp_busy_wait);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 50ea51d7a1cc..e2f531c11986 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -2,6 +2,22 @@
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 
+static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
+
+	return 0;
+}
+
+static void dwmac_integrated_pcs_disable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	stmmac_mac_irq_modify(spcs->priv, spcs->int_mask, 0);
+}
+
 static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   unsigned int neg_mode,
 					   struct phylink_link_state *state)
@@ -23,11 +39,14 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_enable = dwmac_integrated_pcs_enable,
+	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
 	.pcs_config = dwmac_integrated_pcs_config,
 };
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
+			       u32 int_mask)
 {
 	struct stmmac_pcs *spcs;
 
@@ -37,6 +56,7 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
 
 	spcs->priv = priv;
 	spcs->base = priv->ioaddr + offset;
+	spcs->int_mask = int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 64397ac8ecab..cda93894168e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -52,6 +52,7 @@ struct stmmac_priv;
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
+	u32 int_mask;
 	struct phylink_pcs pcs;
 };
 
@@ -61,7 +62,8 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct stmmac_pcs, pcs);
 }
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset);
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
+			       u32 int_mask);
 
 /**
  * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
-- 
2.47.3


