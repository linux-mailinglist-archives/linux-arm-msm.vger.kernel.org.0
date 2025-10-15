Return-Path: <linux-arm-msm+bounces-77474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3DBE0AD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 22:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC5624E0EE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48C02C0F95;
	Wed, 15 Oct 2025 20:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xZiJDm8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ECA134CB;
	Wed, 15 Oct 2025 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561110; cv=none; b=KcXdyO6FtREupNUVZ4EUzi82uniYbptq9iIFx4hZO0eHEz1g2HJf9Bc8usY0ZDgMnCU1UG1Yuq7D6u/WTVMnsOO5Y+oPBG2FQvHtRdXbs5EVAJrS64cqZ9R1cEBGBPd2dhrEHtyHU/uzPhLhprc6J3/h0JtYBeIRCeBL5zk1WZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561110; c=relaxed/simple;
	bh=Iq2BotJ/9tDHq+cw5nKriSOWuVBVhxvAUcr1x5nMkqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUW5yw4EQOeVFKqYiyOccjzaq79HKgIcT0tUM+J+gd+drv+JPDRMGUMaCBZaeNVm15TIiwI3i92XHOYuXPoiZ5Nic1osFRHtKke6jbqlinBbKpk72LapA05gFdBUSg1FgdCuMXEkfeS1V0wGudc8kzMQNAcE5LmzXx/QEqT7MHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xZiJDm8G; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V4qHh0SKCML66MNRzOdx5c40VzjCCEykcjU71IxLqCM=; b=xZiJDm8GSZk7IPE6k2ZlvGYy09
	2vvPl1kjspU6dp7WSofd+ttfV/tOvvkYU0hleUAzhJnG4MdCF1qKYKhlnRWxZPpp21fQz70SLMpD6
	aoTstzQjDMnFX7EdJNElHgwAfEhll5o+xAOQdNgxV7jcAj0HycPphyzyIpxLIcsAFy4I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98MJ-00B4XL-DQ; Wed, 15 Oct 2025 22:44:31 +0200
Date: Wed, 15 Oct 2025 22:44:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
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
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 01/14] net: stmmac: remove broken PCS code
Message-ID: <26d9cccd-2351-483f-a417-03d484fd25a4@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92ME-0000000AmGD-1VsS@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92ME-0000000AmGD-1VsS@rmk-PC.armlinux.org.uk>

On Wed, Oct 15, 2025 at 03:20:02PM +0100, Russell King (Oracle) wrote:
> Changing the netif_carrier_*() state behind phylink's back has always
> been prohibited because it messes up with phylinks state tracking, and
> means that phylink no longer guarantees to call the mac_link_down()
> and mac_link_up() methods at the appropriate times.  This was later
> documented in the sfp-phylink network driver conversion guide.
> 
> stmmac was converted to phylink in 2019, but nothing was done with the
> "PCS" code. Since then, apart from the updates as part of phylink
> development, nothing has happened with stmmac to improve its use of
> phylink, or even to address this point.
> 
> A couple of years ago, a has_integrated_pcs boolean was added by Bart,
> which later became the STMMAC_FLAG_HAS_INTEGRATED_PCS flag, to avoid
> manipulating the netif_carrier_*() state. This flag is mis-named,
> because whenever the stmmac is synthesized for its native SGMII, TBI
> or RTBI interfaces, it has an "integrated PCS". This boolean/flag
> actually means "ignore the status from the integrated PCS".
> 
> Discussing with Bart, the reasons for this are lost to the winds of
> time (which is why we should always document the reasons in the commit
> message.)
> 
> RGMII also has in-band status, and the dwmac cores and stmmac code
> supports this but with one bug that saves the day.
> 
> When dwmac cores are synthesised for RGMII only, they do not contain
> an integrated PCS, and so priv->dma_cap.pcs is clear, which prevents
> (incorrectly) the "RGMII PCS" being used, meaning we don't read the
> in-band status. However, a core synthesised for RGMII and also SGMII,
> TBI or RTBI will have this capability bit set, thus making these
> code paths reachable.
> 
> The Jetson Xavier NX uses RGMII mode to talk to its PHY, and removing
> the incorrect check for priv->dma_cap.pcs reveals the theortical issue
> with netif_carrier_*() manipulation is real:
> 
> dwc-eth-dwmac 2490000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> dwc-eth-dwmac 2490000.ethernet eth0: PHY [stmmac-0:00] driver [RTL8211F Gigabit Ethernet] (irq=141)
> dwc-eth-dwmac 2490000.ethernet eth0: No Safety Features support found
> dwc-eth-dwmac 2490000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> dwc-eth-dwmac 2490000.ethernet eth0: registered PTP clock
> dwc-eth-dwmac 2490000.ethernet eth0: configuring for phy/rgmii-id link mode
> 8021q: adding VLAN 0 to HW filter on device eth0
> dwc-eth-dwmac 2490000.ethernet eth0: Adding VLAN ID 0 is not supported
> Link is Up - 1000/Full
> Link is Down
> Link is Up - 1000/Full
> 
> This looks good until one realises that the phylink "Link" status
> messages are missing, even when the RJ45 cable is reconnected. Nothing
> one can do results in the interface working. The interrupt handler
> (which prints those "Link is" messages) always wins over phylink's
> resolve worker, meaning phylink never calls the mac_link_up() nor
> mac_link_down() methods.
> 
> eth0 also sees no traffic received, and is unable to obtain a DHCP
> address:
> 
> 3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group defa
> ult qlen 1000
>     link/ether e6:d3:6a:e6:92:de brd ff:ff:ff:ff:ff:ff
>     RX: bytes  packets  errors  dropped overrun mcast
>     0          0        0       0       0       0
>     TX: bytes  packets  errors  dropped carrier collsns
>     27686      149      0       0       0       0
> 
> With the STMMAC_FLAG_HAS_INTEGRATED_PCS flag set, which disables the
> netif_carrier_*() manipulation then stmmac works normally:
> 
> dwc-eth-dwmac 2490000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> dwc-eth-dwmac 2490000.ethernet eth0: PHY [stmmac-0:00] driver [RTL8211F Gigabit Ethernet] (irq=141)
> dwc-eth-dwmac 2490000.ethernet eth0: No Safety Features support found
> dwc-eth-dwmac 2490000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> dwc-eth-dwmac 2490000.ethernet eth0: registered PTP clock
> dwc-eth-dwmac 2490000.ethernet eth0: configuring for phy/rgmii-id link mode
> 8021q: adding VLAN 0 to HW filter on device eth0
> dwc-eth-dwmac 2490000.ethernet eth0: Adding VLAN ID 0 is not supported
> Link is Up - 1000/Full
> dwc-eth-dwmac 2490000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> 
> and packets can be transferred.
> 
> This clearly shows that when priv->hw->pcs is set, but
> STMMAC_FLAG_HAS_INTEGRATED_PCS is clear, the driver reliably fails.
> 
> Discovering whether a platform falls into this is impossible as
> parsing all the dtsi and dts files to find out which use the stmmac
> driver, whether any of them use RGMII or SGMII and also depends
> whether an external interface is being used. The kernel likely
> doesn't contain all dts files either.
> 
> The only driver that sets this flag uses the qcom,sa8775p-ethqos
> compatible, and uses SGMII or 2500BASE-X.
> 
> but these are saved from this problem by the incorrect check for
> priv->dma_cap.pcs.
> 
> So, we have to assume that for every other platform that uses SGMII
> with stmmac is using an external PCS.
> 
> Moreover, ethtool output can be incorrect. With the full-duplex link
> negotiated, ethtool reports:
> 
>         Speed: 1000Mb/s
>         Duplex: Half
> 
> because with dwmac4, the full-duplex bit is in bit 16 of the status,
> priv->xstats.pcs_duplex becomes BIT(16) for full duplex, but the
> ethtool ksettings duplex member is u8 - so becomes zero. Moreover,
> the supported, advertised and link partner modes are all "not
> reported".
> 
> Finally, ksettings_set() won't be able to set the advertisement on
> a PHY if this PCS code is activated, which is incorrect when SGMII
> is used with a PHY.
> 
> Thus, remove:
> 1. the incorrect netif_carrier_*() manipulation.
> 2. the broken ethtool ksettings code.
> 
> Given that all uses of STMMAC_FLAG_HAS_INTEGRATED_PCS are now gone,
> remove the flag from stmmac.h and dwmac-qcom-ethqos.c.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

