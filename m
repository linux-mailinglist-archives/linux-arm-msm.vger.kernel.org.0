Return-Path: <linux-arm-msm+bounces-77605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC0BE3F3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 16:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CEB31A65184
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E6B340D8D;
	Thu, 16 Oct 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="TIgWNPeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE93314BB;
	Thu, 16 Oct 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625510; cv=none; b=NqNfbGGDkFPNUuxxYMCKXdd24t1HylpYdfO9akGOnd7ETZqJJpYOc4O3wMDrlPEaKtgDeV0FP5vLogsxBUgEgwf1k5YLsCljqdN/VmIKR809IW1hbBW8YKHc9091Q+aQiiC/FPBuzqBkyNdc58+LIY8eUgUf3HxMHNtBc/3+siE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625510; c=relaxed/simple;
	bh=XcMZNNLMtiKbA786j1tJuvBwn3efx6UCT9YPvujBkWk=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=iMvehKKPOGuIAqaDpny6oRIR7KA73AIa8T2MRYy6c7SHSY9lRiMWTiiDjEt3dVWlxKaMvlJMPSWMYXb/FlBVt8pE5nP/ztCJFmPMLqf2DWS266BxK40enqbNfEv1Md1oSiVC3uuBidwwkTSgxay/4ysYZ7rbqtSQ+QUTmU1ZBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=TIgWNPeU; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PkzEXKrk7RiVwlShBSl0OJhiBXrJm3zMeL24zlXLNiM=; b=TIgWNPeUzSzB3Kno3hPmRsaonf
	x+nfvROU0Df6TQf1HI/2FBPViH7ltI2gQR57cpD3Z68ucMgCrmeibKj1CCyQmqwEf4YQEofUumSoj
	uBLERzJeVB1p+/btdxTuXiY3aXksY7ijzUGyFCh+8ktUH9+qB+sdgrYNYa2vBlwHUuB69ynKHh7C/
	9fT3GObX+TVA4MTK5R3e+7w3dYho3esCjsnl3lu/RUO2vJYsVFSAYagXGcVWF9JIZOj4luFezSFsW
	o8RXF63Abtm3UFDA04KW8VkjG4AHv6p6/XcQrvLDIHHG/APt5OUFbwzXC4UqmtFAhxbHq2qZH8BmT
	q9cPPRPQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44420 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9P6S-000000006RB-3imm;
	Thu, 16 Oct 2025 15:37:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9P6N-0000000Aolg-3y0a;
	Thu, 16 Oct 2025 15:37:11 +0100
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
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
Subject: [PATCH net-next v2 06/14] net: stmmac: remove hw->ps xxx_core_init()
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
Message-Id: <E1v9P6N-0000000Aolg-3y0a@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 16 Oct 2025 15:37:11 +0100

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


