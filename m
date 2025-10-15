Return-Path: <linux-arm-msm+bounces-77414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E9BDEFED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A733F3A38C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C7B243969;
	Wed, 15 Oct 2025 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KLMDOiTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925F21885A;
	Wed, 15 Oct 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538040; cv=none; b=eJ31diABHGMPHboEStN3FlC+YtRVXeoHuPfCbkxigUTGvgoHMuASAebYXYicqCcjP3AZ9B8xFe0zquv5ds1HHCGbQGsdd2VuqBp5uQH1kFZqA5t/DQPbcffbcvFD9mlD3jRguAG1LPiYHSnw+6s5gTWGbo2HdW5BisgyfqpVw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538040; c=relaxed/simple;
	bh=718f0XRr8lNa9Iqb39BuFvqI8YB3PRaH9hMlvRg7zPo=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=nlUaBJWN+/p8ZXsOJ0y7/QA6W8hBk0O3ZNRsouvq6qZXhFXbdeaqthaVkq4g+iZaVO1EBOeysyRki6JfVGD9nFsoeo5RS59EEVs3IMoBblWBqN9MSQMPkAkZ/hXx0J+ZXgG2nwFIMTMa9h7GIx7nYkWgUqEasUBFB7tFE+V8XGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KLMDOiTl; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U0szfPHwQjQj9GEHLawB31X/kDPoFGYu8UghRfk9/30=; b=KLMDOiTlmoHs/P9Mw7UVgP+DxF
	NCrnc7Nn+kRNSLtvEO+9vvXcO4PziN3kqHDwC4+YpX5pU1itkq5Sth6JFZyX0M/fTyIy4uWwBj93d
	Rjt42WKj1IBXyiQZOFCew0Sv8XdH2EEBar5zUwCt/VBISg3iG3mY+8cNzvCvfNwoE0Bdk19ATIBIv
	iPWtxMnQypnB//XoM5yuns3Y+X9E3rATj/rqV1bXbHJYfEnqEUmzZKNPhjBRUFbh1onjmC74Gh6PG
	Ky3cq+KX//NEKVp6NvDomEfIQ56I33JnNYmybiZdbetGe9f5pl4JWveEL+n/SEg7bndvGhye4ma9h
	cD5Ws6vw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35474 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92MF-000000004e2-2Diu;
	Wed, 15 Oct 2025 15:20:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92ME-0000000AmGD-1VsS;
	Wed, 15 Oct 2025 15:20:02 +0100
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
Subject: [PATCH net-next 01/14] net: stmmac: remove broken PCS code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92ME-0000000AmGD-1VsS@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:02 +0100

Changing the netif_carrier_*() state behind phylink's back has always
been prohibited because it messes up with phylinks state tracking, and
means that phylink no longer guarantees to call the mac_link_down()
and mac_link_up() methods at the appropriate times.  This was later
documented in the sfp-phylink network driver conversion guide.

stmmac was converted to phylink in 2019, but nothing was done with the
"PCS" code. Since then, apart from the updates as part of phylink
development, nothing has happened with stmmac to improve its use of
phylink, or even to address this point.

A couple of years ago, a has_integrated_pcs boolean was added by Bart,
which later became the STMMAC_FLAG_HAS_INTEGRATED_PCS flag, to avoid
manipulating the netif_carrier_*() state. This flag is mis-named,
because whenever the stmmac is synthesized for its native SGMII, TBI
or RTBI interfaces, it has an "integrated PCS". This boolean/flag
actually means "ignore the status from the integrated PCS".

Discussing with Bart, the reasons for this are lost to the winds of
time (which is why we should always document the reasons in the commit
message.)

RGMII also has in-band status, and the dwmac cores and stmmac code
supports this but with one bug that saves the day.

When dwmac cores are synthesised for RGMII only, they do not contain
an integrated PCS, and so priv->dma_cap.pcs is clear, which prevents
(incorrectly) the "RGMII PCS" being used, meaning we don't read the
in-band status. However, a core synthesised for RGMII and also SGMII,
TBI or RTBI will have this capability bit set, thus making these
code paths reachable.

The Jetson Xavier NX uses RGMII mode to talk to its PHY, and removing
the incorrect check for priv->dma_cap.pcs reveals the theortical issue
with netif_carrier_*() manipulation is real:

dwc-eth-dwmac 2490000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
dwc-eth-dwmac 2490000.ethernet eth0: PHY [stmmac-0:00] driver [RTL8211F Gigabit Ethernet] (irq=141)
dwc-eth-dwmac 2490000.ethernet eth0: No Safety Features support found
dwc-eth-dwmac 2490000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
dwc-eth-dwmac 2490000.ethernet eth0: registered PTP clock
dwc-eth-dwmac 2490000.ethernet eth0: configuring for phy/rgmii-id link mode
8021q: adding VLAN 0 to HW filter on device eth0
dwc-eth-dwmac 2490000.ethernet eth0: Adding VLAN ID 0 is not supported
Link is Up - 1000/Full
Link is Down
Link is Up - 1000/Full

This looks good until one realises that the phylink "Link" status
messages are missing, even when the RJ45 cable is reconnected. Nothing
one can do results in the interface working. The interrupt handler
(which prints those "Link is" messages) always wins over phylink's
resolve worker, meaning phylink never calls the mac_link_up() nor
mac_link_down() methods.

eth0 also sees no traffic received, and is unable to obtain a DHCP
address:

3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group defa
ult qlen 1000
    link/ether e6:d3:6a:e6:92:de brd ff:ff:ff:ff:ff:ff
    RX: bytes  packets  errors  dropped overrun mcast
    0          0        0       0       0       0
    TX: bytes  packets  errors  dropped carrier collsns
    27686      149      0       0       0       0

With the STMMAC_FLAG_HAS_INTEGRATED_PCS flag set, which disables the
netif_carrier_*() manipulation then stmmac works normally:

dwc-eth-dwmac 2490000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
dwc-eth-dwmac 2490000.ethernet eth0: PHY [stmmac-0:00] driver [RTL8211F Gigabit Ethernet] (irq=141)
dwc-eth-dwmac 2490000.ethernet eth0: No Safety Features support found
dwc-eth-dwmac 2490000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
dwc-eth-dwmac 2490000.ethernet eth0: registered PTP clock
dwc-eth-dwmac 2490000.ethernet eth0: configuring for phy/rgmii-id link mode
8021q: adding VLAN 0 to HW filter on device eth0
dwc-eth-dwmac 2490000.ethernet eth0: Adding VLAN ID 0 is not supported
Link is Up - 1000/Full
dwc-eth-dwmac 2490000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx

and packets can be transferred.

This clearly shows that when priv->hw->pcs is set, but
STMMAC_FLAG_HAS_INTEGRATED_PCS is clear, the driver reliably fails.

Discovering whether a platform falls into this is impossible as
parsing all the dtsi and dts files to find out which use the stmmac
driver, whether any of them use RGMII or SGMII and also depends
whether an external interface is being used. The kernel likely
doesn't contain all dts files either.

The only driver that sets this flag uses the qcom,sa8775p-ethqos
compatible, and uses SGMII or 2500BASE-X.

but these are saved from this problem by the incorrect check for
priv->dma_cap.pcs.

So, we have to assume that for every other platform that uses SGMII
with stmmac is using an external PCS.

Moreover, ethtool output can be incorrect. With the full-duplex link
negotiated, ethtool reports:

        Speed: 1000Mb/s
        Duplex: Half

because with dwmac4, the full-duplex bit is in bit 16 of the status,
priv->xstats.pcs_duplex becomes BIT(16) for full duplex, but the
ethtool ksettings duplex member is u8 - so becomes zero. Moreover,
the supported, advertised and link partner modes are all "not
reported".

Finally, ksettings_set() won't be able to set the advertisement on
a PHY if this PCS code is activated, which is incorrect when SGMII
is used with a PHY.

Thus, remove:
1. the incorrect netif_carrier_*() manipulation.
2. the broken ethtool ksettings code.

Given that all uses of STMMAC_FLAG_HAS_INTEGRATED_PCS are now gone,
remove the flag from stmmac.h and dwmac-qcom-ethqos.c.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  4 --
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 55 -------------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  9 ---
 include/linux/stmmac.h                        |  1 -
 4 files changed, 69 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced..f62825220cf7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -96,7 +96,6 @@ struct ethqos_emac_driver_data {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	const char *link_clk_name;
-	bool has_integrated_pcs;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
@@ -282,7 +281,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
-	.has_integrated_pcs = true,
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -856,8 +854,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->has_integrated_pcs)
-		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 39fa1ec92f82..d89662b48087 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -322,47 +322,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
-	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
-		u32 supported, advertising, lp_advertising;
-
-		if (!priv->xstats.pcs_link) {
-			cmd->base.speed = SPEED_UNKNOWN;
-			cmd->base.duplex = DUPLEX_UNKNOWN;
-			return 0;
-		}
-		cmd->base.duplex = priv->xstats.pcs_duplex;
-
-		cmd->base.speed = priv->xstats.pcs_speed;
-
-		/* Encoding of PSE bits is defined in 802.3z, 37.2.1.4 */
-
-		ethtool_convert_link_mode_to_legacy_u32(
-			&supported, cmd->link_modes.supported);
-		ethtool_convert_link_mode_to_legacy_u32(
-			&advertising, cmd->link_modes.advertising);
-		ethtool_convert_link_mode_to_legacy_u32(
-			&lp_advertising, cmd->link_modes.lp_advertising);
-
-		/* Reg49[3] always set because ANE is always supported */
-		cmd->base.autoneg = ADVERTISED_Autoneg;
-		supported |= SUPPORTED_Autoneg;
-		advertising |= ADVERTISED_Autoneg;
-		lp_advertising |= ADVERTISED_Autoneg;
-
-		cmd->base.port = PORT_OTHER;
-
-		ethtool_convert_legacy_u32_to_link_mode(
-			cmd->link_modes.supported, supported);
-		ethtool_convert_legacy_u32_to_link_mode(
-			cmd->link_modes.advertising, advertising);
-		ethtool_convert_legacy_u32_to_link_mode(
-			cmd->link_modes.lp_advertising, lp_advertising);
-
-		return 0;
-	}
-
 	return phylink_ethtool_ksettings_get(priv->phylink, cmd);
 }
 
@@ -372,20 +331,6 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
-	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
-		/* Only support ANE */
-		if (cmd->base.autoneg != AUTONEG_ENABLE)
-			return -EINVAL;
-
-		mutex_lock(&priv->lock);
-		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->ps, 0);
-		mutex_unlock(&priv->lock);
-
-		return 0;
-	}
-
 	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 650d75b73e0b..87a9d36f47a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6000,15 +6000,6 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		for (queue = 0; queue < queues_count; queue++)
 			stmmac_host_mtl_irq_status(priv, priv->hw, queue);
 
-		/* PCS link status */
-		if (priv->hw->pcs &&
-		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
-			if (priv->xstats.pcs_link)
-				netif_carrier_on(priv->dev);
-			else
-				netif_carrier_off(priv->dev);
-		}
-
 		stmmac_timestamp_interrupt(priv, priv);
 	}
 }
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index fa1318bac06c..99022620457a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -171,7 +171,6 @@ struct dwmac4_addrs {
 	u32 mtl_low_cred_offset;
 };
 
-#define STMMAC_FLAG_HAS_INTEGRATED_PCS		BIT(0)
 #define STMMAC_FLAG_SPH_DISABLE			BIT(1)
 #define STMMAC_FLAG_USE_PHY_WOL			BIT(2)
 #define STMMAC_FLAG_HAS_SUN8I			BIT(3)
-- 
2.47.3


