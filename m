Return-Path: <linux-arm-msm+bounces-77419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98596BDF017
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47AA33AB7C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59202252904;
	Wed, 15 Oct 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iX2eFN5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459E243969;
	Wed, 15 Oct 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538104; cv=none; b=a3VV3rG7EfNBOii1SgRmGu+mL3+peVElHVgNpWTcnUyDOomE/w7QfwRXshH1mlnM+6MMlSeP09cWXLsKdvLQe4Ot5u3r5X6+OLfgI4Ob1VgMo3jvDx8oFfuNNTZM5sR6HcmQIpSW/y2SdJyxMn8wzWD61amHxbgHFYb64ODpgfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538104; c=relaxed/simple;
	bh=XcMZNNLMtiKbA786j1tJuvBwn3efx6UCT9YPvujBkWk=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=bFqUX2oHK2ES3dzvA6CRhayCvElFx1mcZfyliJSznum7Nk8rNQ36g7rIwRkKSugYnfr5UzSxzFyq+wQ0P8hKCZ55iD7K8MqhRoK+faxERXzZg3m/NbilDShDXOOl0JO/VCl1+VSLA7B5AqqBagRah+WXa63dzgSJLODis7D7bjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=iX2eFN5M; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PkzEXKrk7RiVwlShBSl0OJhiBXrJm3zMeL24zlXLNiM=; b=iX2eFN5MNtL16Dmwt5L/IHkzhH
	Gb4c+iDRr5RUlhE9r8piFw2K/6YLsTpnMtUiiJshot+eIFtGE0yy/TMcsdz1pNb/VSexpH3Xpw5S0
	iVIKqMFiz1dtAdq2pqlMQptPMRNHPp5vbyH231OxMTnNlhG3TadGE/Za3kE5RDMNsATelNLpw6dLD
	61CKrxdlDS1nmrBo+b3cbt1fwM9H9PzR1tOUgqHcjQhlvKvcnd8/Qck2K30hxgUjLc9P79+pxtbAe
	feQlPL9rawVD8vjxvJVVB/63w2VTNQNSdaGYdDLWnKskr50KdrRl34XNrTJl7RP9XjvU9OM3MSjYd
	whX7zDwQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37732 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92Mo-000000004fn-2eo8;
	Wed, 15 Oct 2025 15:20:39 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92Me-0000000AmGw-0074;
	Wed, 15 Oct 2025 15:20:28 +0100
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
Subject: [PATCH net-next 06/14] net: stmmac: remove hw->ps xxx_core_init()
 hardware setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92Me-0000000AmGw-0074@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:28 +0100

After a lot of digging, it seems that the oddly named hw->ps member is
all about configuring the core for reverse SGMII. This member is set to
one of 0, SPEED_10, SPEED_100 or SPEED_1000 depending on
priv->plat->mac_port_sel_speed. On DT systems, this comes from the
"snps,ps-speed" DT property.

When set to a non-zero value, it:

1. Configures the MAC at initialisation time to operate at a specific
   speed. However, this will be overwritten by mac_link_up() when the
   link comes up (e.g. with the fixed-link parameters.)

   Note that dwxgmac2 wants to also support SPEED_2500 and SPEED_10000,
   but both these values are impossible.

2. It _incorrectly_ enables the transmitter (GMAC_CONFIG_TE) which
   makes no sense, rather than enabling the "transmit configuration"
   bit (GMAC_CONFIG_TC). Likely a typo.

3. It configures the SGMII rate adapter layer to retrieve its speed
   setting from the MAC configuration register rather than the PHY.

There are two ways forward here:

a) fixing (2) so that we set GMAC_CONFIG_TC. However, we have platform
   that set the "snps,ps-speed" property and that work today. Fixing
   this will cause the RGMII, SGMII or SMII inband configuration to be
   transmitted, which will be a functional change which could cause a
   regression.

b) ripping out (1) and (2) as they are ineffective. This also has the
   possibility of regressions, but the patch author believes this risk
   is much lower than (a).

Therefore, this commit takes the approach in (b).

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 23 +++--------------
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 24 +++---------------
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 25 ++-----------------
 3 files changed, 8 insertions(+), 64 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 5c653be3d453..d35db8958be1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -26,35 +26,18 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 				struct net_device *dev)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	u32 value = readl(ioaddr + GMAC_CONTROL);
 	int mtu = dev->mtu;
+	u32 value;
 
 	/* Configure GMAC core */
-	value |= GMAC_CORE_INIT;
+	value = readl(ioaddr + GMAC_CONTROL);
 
 	if (mtu > 1500)
 		value |= GMAC_CONTROL_2K;
 	if (mtu > 2000)
 		value |= GMAC_CONTROL_JE;
 
-	if (hw->ps) {
-		value |= GMAC_CONTROL_TE;
-
-		value &= ~hw->link.speed_mask;
-		switch (hw->ps) {
-		case SPEED_1000:
-			value |= hw->link.speed1000;
-			break;
-		case SPEED_100:
-			value |= hw->link.speed100;
-			break;
-		case SPEED_10:
-			value |= hw->link.speed10;
-			break;
-		}
-	}
-
-	writel(value, ioaddr + GMAC_CONTROL);
+	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
 	value = GMAC_INT_DEFAULT_MASK;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 21e4461db937..d855ab6b9145 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -27,29 +27,11 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	void __iomem *ioaddr = hw->pcsr;
-	u32 value = readl(ioaddr + GMAC_CONFIG);
 	unsigned long clk_rate;
+	u32 value;
 
-	value |= GMAC_CORE_INIT;
-
-	if (hw->ps) {
-		value |= GMAC_CONFIG_TE;
-
-		value &= hw->link.speed_mask;
-		switch (hw->ps) {
-		case SPEED_1000:
-			value |= hw->link.speed1000;
-			break;
-		case SPEED_100:
-			value |= hw->link.speed100;
-			break;
-		case SPEED_10:
-			value |= hw->link.speed10;
-			break;
-		}
-	}
-
-	writel(value, ioaddr + GMAC_CONFIG);
+	value = readl(ioaddr + GMAC_CONFIG);
+	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONFIG);
 
 	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1 */
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 00e929bf280b..0430af27da40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -23,29 +23,8 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
 	tx = readl(ioaddr + XGMAC_TX_CONFIG);
 	rx = readl(ioaddr + XGMAC_RX_CONFIG);
 
-	tx |= XGMAC_CORE_INIT_TX;
-	rx |= XGMAC_CORE_INIT_RX;
-
-	if (hw->ps) {
-		tx |= XGMAC_CONFIG_TE;
-		tx &= ~hw->link.speed_mask;
-
-		switch (hw->ps) {
-		case SPEED_10000:
-			tx |= hw->link.xgmii.speed10000;
-			break;
-		case SPEED_2500:
-			tx |= hw->link.speed2500;
-			break;
-		case SPEED_1000:
-		default:
-			tx |= hw->link.speed1000;
-			break;
-		}
-	}
-
-	writel(tx, ioaddr + XGMAC_TX_CONFIG);
-	writel(rx, ioaddr + XGMAC_RX_CONFIG);
+	writel(tx | XGMAC_CORE_INIT_TX, ioaddr + XGMAC_TX_CONFIG);
+	writel(rx | XGMAC_CORE_INIT_RX, ioaddr + XGMAC_RX_CONFIG);
 	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
 }
 
-- 
2.47.3


