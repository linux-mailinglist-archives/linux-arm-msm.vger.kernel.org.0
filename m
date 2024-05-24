Return-Path: <linux-arm-msm+bounces-20417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307F8CE919
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 19:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38171F2272D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495B112EBCC;
	Fri, 24 May 2024 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="f4ccaKAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C10B381CC;
	Fri, 24 May 2024 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716570820; cv=none; b=QuSfA7M/9qnSrVzySiDzeloVFeqnsO0QqACQOqSmEtcH0LAz1dQP3fFkKolZdFeh3qzDjffmfSpp4fKnEAIxqEpyCPcYASEKalbQmfU5zw1Xo5xcBeElna+l4DUgGVdAEwIFUYeulvk7xTwi5cLKNxvwVOg+ZzpaGccny0/6bjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716570820; c=relaxed/simple;
	bh=niiygQemT/sqnVFy3UWwLMvNxIikaJEfzXfZrGhDvJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AykQWKEbJWhE/RP2cWl6stqEEYO8gv9QnCRUjuvESl2b0Squv7N1IomJLEaFWKDWoCrtkCONqw3t/sod4HW6xu50AD5wfeMi7qmprzFQcbLDin01fX/tu484knFfRcCDPUweEJ7CODuMSs29SKsICybZt6J6So8rJ/WxRZ2G4fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=f4ccaKAw; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1aJfRRbC8WpoZM7RERcls71YiqRszkda7JhNjiCCDo4=; b=f4ccaKAwYs++oHMLkZG1DeJl46
	XbxPpb9GSkHiPgJzQJV9PgbY5U6lnCr4phhHQulTUMIbzv+S+oaowg+7BGpqVZRg0SkWuNJZFev/W
	7d5EiQud6xbl9ye0BkxF555nnF+qdDnW8ObWJoq3lW7RKxcIwt4lhxdhMCwoNEZIde5m93mGkavJR
	Z0bSiGSsK/f3Jfi7/p2KztgxmGWgjtrM17kLL+NOeVD9pdhv0MVp4ATvZXEImaIUUv38xKiUl9GNs
	fnXrH1bQPK78qwea9qneljDs/cqTlJaZ9uAGFH5kCYY4BhMIid382YNuh0hajWrlIN3vbph5NWE25
	B/rcDztQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46500)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sAYTn-0005iu-2p;
	Fri, 24 May 2024 18:13:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sAYTm-00087X-4Z; Fri, 24 May 2024 18:13:18 +0100
Date: Fri, 24 May 2024 18:13:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sneh Shah <quic_snehshah@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Halaney <ahalaney@redhat.com>, kernel@quicinc.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-qcom-ethqos: Enable
 support for 2500BASEX
Message-ID: <ZlDKrS0EhHgQPHAo@shell.armlinux.org.uk>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
 <20240524130653.30666-3-quic_snehshah@quicinc.com>
 <a7317809-77a1-4884-83d8-2271ceea2c81@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7317809-77a1-4884-83d8-2271ceea2c81@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, May 24, 2024 at 06:07:15PM +0200, Andrew Lunn wrote:
> On Fri, May 24, 2024 at 06:36:53PM +0530, Sneh Shah wrote:
> > With integrated PCS qcom mac supports both SGMII and 2500BASEX mode.
> > Implement get_interfaces to add support for 2500BASEX.
> 
> I don't know this driver very well..... but
> 
> /* PCS defines */
> #define STMMAC_PCS_RGMII        (1 << 0)
> #define STMMAC_PCS_SGMII        (1 << 1)
> #define STMMAC_PCS_TBI          (1 << 2)
> #define STMMAC_PCS_RTBI         (1 << 3)
> 
> 
> static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
>                                              struct ethtool_link_ksettings *cmd)
> {
>         struct stmmac_priv *priv = netdev_priv(dev);
> 
>         if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
>             (priv->hw->pcs & STMMAC_PCS_RGMII ||
>              priv->hw->pcs & STMMAC_PCS_SGMII)) {
>                 struct rgmii_adv adv;
>                 u32 supported, advertising, lp_advertising;
> 
>                 if (!priv->xstats.pcs_link) {
>                         cmd->base.speed = SPEED_UNKNOWN;
>                         cmd->base.duplex = DUPLEX_UNKNOWN;
>                         return 0;
>                 }

Note that this checks for !STMMAC_FLAG_HAS_INTEGRATED_PCS, so this isn't
going to be used by this code which is conditional on this flag being
set.

In any case, I posted a patch set 12 days ago, which has remained
unreviewed and untested for 10 days from a promise to do so converting
this ugly hack to a phylink PCS driver (not that I would have had time
to deal with any feedback due to an urgent work issue, but that's sort
of beside the point.) There's some vague handwaving by Serge that there
are some issues in this series, but there hasn't been any feedback yet
on what these issues may be.

Also, from what I can tell, neither STMMAC_PCS_TBI nor STMMAC_PCS_RTBI
are ever assigned to hw->pcs. So, in stmmac_eee_init():

        if (priv->hw->pcs == STMMAC_PCS_TBI ||
            priv->hw->pcs == STMMAC_PCS_RTBI)
                return false;

is always false, and can be removed.

In __stmmac_open():

        if (priv->hw->pcs != STMMAC_PCS_TBI &&
            priv->hw->pcs != STMMAC_PCS_RTBI &&
            (!priv->hw->xpcs ||
             xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {

can become:
	if (!priv->hw->xpcs ||
	    xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {

In stmmac_dvr_probe():

        if (priv->hw->pcs != STMMAC_PCS_TBI &&
            priv->hw->pcs != STMMAC_PCS_RTBI) {
                /* MDIO bus Registration */
                ret = stmmac_mdio_register(ndev);

This if() condition can be eliminated, and we always register the
MDIO, and similarly in the cleanup and stmmac_dvr_remove() paths.

> /**
>  * stmmac_check_pcs_mode - verify if RGMII/SGMII is supported
>  * @priv: driver private structure
>  * Description: this is to verify if the HW supports the PCS.
>  * Physical Coding Sublayer (PCS) interface that can be used when the MAC is
>  * configured for the TBI, RTBI, or SGMII PHY interface.
>  */
> static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
> {
>         int interface = priv->plat->mac_interface;
> 
>         if (priv->dma_cap.pcs) {
>                 if ((interface == PHY_INTERFACE_MODE_RGMII) ||
>                     (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
>                     (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
>                     (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
>                         netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
>                         priv->hw->pcs = STMMAC_PCS_RGMII;
>                 } else if (interface == PHY_INTERFACE_MODE_SGMII) {
>                         netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
>                         priv->hw->pcs = STMMAC_PCS_SGMII;
>                 }
>         }
> }
> 
> I get the feeling this is a minimal hack, rather than a proper
> solution.

I didn't remove that in my patch set because I don't understand fully
the logic here - and I didn't want to add further dubious complication
to my six patch series. I actually kept the logic and continued to
use it explicitly to avoid changing the decision making:

+static struct phylink_pcs *
+dwmac4_phylink_select_pcs(struct stmmac_priv *priv, phy_interface_t interface)
+{
+       if (priv->hw->pcs & STMMAC_PCS_RGMII ||
+           priv->hw->pcs & STMMAC_PCS_SGMII)
+               return &priv->hw->mac_pcs;
+
+       return NULL;
+}

Ultimately, this _should_ check the "interface" here, but bear in
mind that stmmac_check_pcs_mode() checks plat->mac_interface
(which is the interface between the MAC and PCS) whereas the
"interface" passed here is the interface between the PCS and PHY.
This is why removing stmmac_check_pcs_mode() isn't a sane change
to make until we have worked through the issues with removing the
its-a-PCS-but-not-phylink_pcs hack.

I _think_ a sensible next step would be to eliminate priv->hw->pcs,
instead testing priv->plat->mac_interface in
dwmac4_phylink_select_pcs() and dwmac1000_phylink_select_pcs():

	phy_interface_t mac_interface = priv->plat->mac_interface;

	if (phy_interface_is_rgmii(mac_interface) ||
	    mac_interface == PHY_INTERFACE_MODE_SGMII)
		return &priv->hw->mac_pcs;

and _then_ maybe as a separate patch switch this to test the
PHY-side interface (because that would make more sense... but
that would be a behavioural change to the driver.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

