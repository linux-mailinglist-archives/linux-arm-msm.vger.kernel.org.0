Return-Path: <linux-arm-msm+bounces-73814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B7B7D843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D62DF169F9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 22:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8B629B204;
	Tue, 16 Sep 2025 22:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="PbGhk40v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443228C869;
	Tue, 16 Sep 2025 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758061197; cv=none; b=LRBLMoLjFrJCf9rZn/9wvSf5M57BpZBQymkY5PKoUN71qClAS2BQ58a3Vwplob87Dq8bqj6ZHtck8pGZEB9qvd6OIKOHjeGRNC2iRmEVpo+aDjsipJX48uF0M7NY1ecTrj8EAMAlxThdtJr7A9h3ltIsYGhGt9Won1qFaprHlWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758061197; c=relaxed/simple;
	bh=m4JY9aGLYVoEfQTvIOCGSK9fG/1zq/kPVw6zLN783uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY+MJzCBVG7m73E74aNoVf+V9ZJFvjiCEQMsXlKR00uoc8i6gN3YOpveDMoIpoFNbV+ZKau4E+6sIiibPOPZZOcwIpuBvOPk0iCNufwBBLfLDvMnks6+ZaazlVVv2xB90j7mX/EWvRxXZD+eeBlEwwA5/oGXWpThCh5PIirzSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=PbGhk40v; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6jJa1yb6mq/yCOx6rK0pnWqPtQg/Mqf+5GEFWxFsvHU=; b=PbGhk40vPRpR4Y38Yd5CXsgOaC
	Ingfdvy+FZckMkZJRlESAaVZaRGIrREu/7sMA+TyDBh15nM2L34u/cbtJRtrKsDDSNIjquIkoxpUv
	MAwpW5lTHDf4HwH70NGP/CObiaadLjKXVCKlgQ36ZJR3XLnaRBV9uXGndZAr/fGHV+OqeXPr0RAnf
	XhQq1qeZDvgBh0Q/Dkq1ksASa5fjifQx1XexIUz2emDWMhUD6wx0jTKFjzyKjER/HJXCbJHZWVRcL
	b53hkOrayZEQZ1nRdIvtToxDitAkeJKZPwaZRcJYtKYUQ4DgEKsKgFS2p4V4uI8rd1S91uudMm97j
	uPvbti9A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33612)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uye1d-000000006Wl-3upM;
	Tue, 16 Sep 2025 23:19:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uye1b-0000000082K-1ZIi;
	Tue, 16 Sep 2025 23:19:47 +0100
Date: Tue, 16 Sep 2025 23:19:47 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew@lunn.ch, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <aMnigwTeMQc0GxaD@shell.armlinux.org.uk>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
 <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
 <aMgCA13MhTnG80_V@shell.armlinux.org.uk>
 <aMgootkPQ/GcdiXX@oss.qualcomm.com>
 <aMgsiDS5tFeqJsKD@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMgsiDS5tFeqJsKD@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 15, 2025 at 04:11:04PM +0100, Russell King (Oracle) wrote:
> On Mon, Sep 15, 2025 at 08:24:26PM +0530, Mohd Ayaan Anwar wrote:
> > On Mon, Sep 15, 2025 at 01:09:39PM +0100, Russell King (Oracle) wrote:
> > > This shows that the PHY supports SGMII (4) and 2500base-X (23). However,
> > > as we only validate 2500base-X, this suggests stmmac doesn't support
> > > switching between SGMII and 2500base-X.
> > > 
> > > What *exactly* is the setup with stmmac here? Do you have an external
> > > PCS to support 2500base-X, or are you using the stmmac internal PCS?
> > 
> > Internal PCS. But it's not really pure 2500base-X...
> > I found an older thread for this exact MAC core [0], and it looks like
> > we have an overclocked SGMII, i.e., 2500base-X without in-band
> > signalling.
> > 
> > Just wondering if registering a `.get_interfaces` callback in
> > `dwmac-qcom-ethqos.c` and doing something like the following will be
> > helpful?
> > 
> > case PHY_INTERFACE_MODE_2500BASEX:
> > 	__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
> > 	fallthrough;
> > case PHY_INTERFACE_MODE_SGMII:
> > 	__set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
> > 	break;
> > ...
> > 
> > This should ensure that both SGMII and 2500base-X are validated,
> > allowing switching between them.
> 
> So, this is something that has never worked with this hardware setup.
> I don't think we should rush to make it work. The stmmac internal
> PCS code is a mess, bypassing phylink. I had a patch series which
> addressed this a while back but it went nowhere, but I guess this is
> an opportunity to say "look, we need to get this sorted properly".
> 
> I suspect this isn't going to be simple - stmmac does _not_ use
> phylink properly (I've been doing lots of cleanups to this driver
> over the last year or so to try and make the code more
> understandable so I can start addressing this deficiency) and
> there's still lots of work to be done. The way the "platform glue"
> drivers work is far from ideal, especially when it comes to
> switching interfaces.
> 
> I'll try to post the stmmac PCS cleanup series in the coming few
> days, and it would be useful if you could give it whatever
> testing you can.

... and it's been delayed because I've had to rework three of the
patch series I recently posted.

I did get some time late last night to read through the documentation
I have for one version of the dwmac which has optional PCS, and I'm
coming to the conclusion that the whole mac_interface vs phy_interface
thing is wrong in the driver.

My comment update which added this a few years ago:

        /* MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
         *       ^                               ^
         * mac_interface                   phy_interface
         *
         * mac_interface is the MAC-side interface, which may be the same
         * as phy_interface if there is no intervening PCS. If there is a
         * PCS, then mac_interface describes the interface mode between the
         * MAC and PCS, and phy_interface describes the interface mode
         * between the PCS and PHY.
         */

appears to be incorrect. It was based on just phylink knowledge and a
reasonable guess about what was going on with this driver. It seems
no one had any better ideas on exactly what mac_interface was trying
to describe.

Having looked at the information I now have, and referred back to the
psat code, it appears to me that what is actually going on here is
this:

	MAC --- optional integrated PCS --- SerDes --- world (media or PHY)
                                         ^          ^
                                 mac_interface  phy_interface
				        TBI      1000base-X

It seems that TBI is used on the PCS output when talking to a SerDes
for 1000BASE-X or SGMII. RTBI is used with a PHY that can talk RTBI.

Considering just 2.5G and below, it seems to me that mac_interface
can be determined from phy_interface:

phy_interface		mac_interface
SGMII			TBI
1000BASE-X		TBI
2500BASE-X		TBI
RTBI			RTBI

These are the "official" modes. There is also a seperate block that
is used for SMII and RGMII which the code treats as a PCS (partly
because it uses the same registers) so I'd throw into this:

phy_interface		mac_interface
SMII			SMII
RGMII*			RGMII*

For every other phy_interface <= 2.5G, mac_interface is basically
not applicable, and we should be referring to phy_interface everywhere.

In fact, I can't see that mac_interface actually matters for most of
the driver. The only case I can see it matters is when the core
supports multiple interfaces, and needs to be configured appropriately
(which needs an entire core-wide reset if it changes.)

So, I'm going to propose at the very least selecting whether the driver
uses the PCS not based on mac_interface as the code currently does, but
on phy_interface (actually the interface passed by phylink.) That will
make phylink happier when stmmac is converted to phylink_pcs.

This means I need to spend some time reworking my series... and yay,
more patches to add to my already massive stack of stmmac patches. :/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

