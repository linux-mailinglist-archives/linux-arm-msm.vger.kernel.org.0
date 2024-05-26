Return-Path: <linux-arm-msm+bounces-20483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D218CF4DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 May 2024 18:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323D41F2119E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 May 2024 16:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32F1182D2;
	Sun, 26 May 2024 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hp9Nyopb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92E41803D;
	Sun, 26 May 2024 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716740858; cv=none; b=jSQdWZ6rqSsFiY/ci68lEx6bgNO7dF38YzeklMaIux3vE6l6pi8RZn/p3pYyB05M4boNiTAP5KL01yYRz3BwQBx0QqaISvj0uWfsRYRpGXb5Mfuskc9kiFVJLq1FFvi1BBF9mTwJtebzuNvSFk9+y3/4IwrjYlaTJRCvQI+PO9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716740858; c=relaxed/simple;
	bh=Ck8ZP8XmBhx3qfNQgaZytRg6uoSkdm/hDN0wyzQbEcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSze0a8yysbPoOsHcit/5kSXcGV0HYbvZQ4zm49lFgbuJSFjLdyY0krPKbqrMZAiRiowR41xajiwS4NcG1Znv5jwyq+vxBH5lQ0gsEkcXUlH1vIxaIXYBLgh6dL5jjaWrNouwmFucTmqQGVvRtYG/6dkzziNQGP1uA5o4w0fdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=hp9Nyopb; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HQ77S7fv3o2eNNFdQwNAIpUe0Htav/emvIcvmyeydso=; b=hp9NyopbKR1MoB2zPFnPbXwX3v
	rO8DRx7ecCpR8ZcLKVQBjIBERF7z4kD288lBS4Wohdk/O/IVgrHyc8UkvLAAaimqFqScFr6MLPank
	a/8ciH7WW+adrEUv+Twq7G29LVpNGKgClj+lJOaYJBqPCwbI7a+Fk4XhdATH7wvO7f9FoQG8AsP2R
	KuQsqrWpTio7pYfgApOHJQ+u2a4MY9PXJmFpuNboiHKmu02OqC65mrVsmM4Iia1gSP9YnwfAoQFIq
	IEX/qKvnoKUYJMgnrOvYun297Arp039xQT0uawxqddScEgHgxHAPek41V4X1D5/YHHM3JR4dTp568
	nTxoWzbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35300)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sBGiA-0002of-2D;
	Sun, 26 May 2024 17:27:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sBGi8-0001Vm-2o; Sun, 26 May 2024 17:27:04 +0100
Date: Sun, 26 May 2024 17:27:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
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
	kernel@quicinc.com
Subject: Re: [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Add support for
 2.5G SGMII
Message-ID: <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Dec 21, 2023 at 02:23:57PM +0530, Sneh Shah wrote:
> On 12/20/2023 9:29 PM, Andrew Halaney wrote:
> > I'd evaluate if you can update that function to clear the ANE bit when
> > the ane boolean is false. From the usage I see I feel that makes sense,
> > but correct me if you think I'm wrong.
> > At the very least let's use the defines from there, and possibly add a
> > new function if clearing is not acceptable in dwmac_ctrl_ane().
> > 
> > Stepping back, I was asking in general is the need to muck with ANE here
> > is a Qualcomm specific problem, or is that a generic thing that should be
> > handled in the core (and the phy_set_speed() bit stay here)? i.e. would
> > any dwmac5 based IP need to do something like this for SPEED_2500?
> I think disabling ANE for SPEED_2500 is generic not specific to qualcomm.
> Even in dwxgmac2 versions also we need to disable ANE for SPEED_2500.
> Autoneg clause 37 stadard doesn't support 2500 speed. So we need to
> disable autoneg for speed 2500

(Going back over the history of this addition)

What 802.3 Clause 37 says is utterly _irrelevant_ when discussing Cisco
SGMII. Cisco took 802.3 1000base-X and modified it for their own
purposes, changing the format of the 16-bit control word, adding support
for symbol replication to support 100Mbps and 10Mbps, changing the link
timer, etc. SGMII is *not* 802.3 Clause 37.

I guess you are getting caught up in the widespread crud where
manufacturers stupidly abuse "SGMII" to mean maybe "Cisco SGMII" and
maybe "802.3 1000base-X" because both are "serial gigabit MII". Yes,
both are serial in nature, but Cisco SGMII is not 1000base-X and it
also is not 2500base-X.

What makes this even more difficult is that 2500base-X was never
standardised by the 802.3 committees until very late, so we've ended
up with manufacturers doing their own thing for years. We've ended up
with a mess of different implementations described in different ways
many of which boil down to being 2500base-X without inband AN. For
example, one manufacturer talks about "HS-SGMII", but doesn't permit
the interface to operate at the x10 and x100 symbol replications that
conventional Cisco SGMII uses for 100M and 10M speeds respectfully,
making it in effect no different from 2500base-X.

Now through into this mess various implementations that do not support
inband at 2.5G speeds, those that require inband at 2.5G speeds... one
can get into the situation where one pairs a PHY that requires inband
with a PCS that doesn't support it and the result doesn't work. This
is particularly problematical if the PHY is on a hotpluggable module
like a SFP.

It's a total trainwreck.

I do have some work-in-progress patches that attempt to sort this out
in phylink and identify incompatible situations.

See http://git.armlinux.org.uk/cgit/linux-arm.git/log/?h=net-queue

commits (I think)...

net: phylink: clean up phylink_resolve()

to:

net: phylink: switch to MLO_AN_PHY when PCS uses outband

and since I'm converting stmmac's hacky PCS that bypasses phylink to
a real phylink_pcs, the ethqos code as it stands presents a blocker
because of this issue. So, I'm intending to post a series in the next
few days (after the bank holiday) and will definitely need to be
tested on ethqos hardware.

However, first we need to get to the bottom of your latest patch that
only sets PHY_INTERFACE_MODE_2500BASEX when plat_dat->flags has the
STMMAC_FLAG_HAS_INTEGRATED_PCS flag _set_, but the stmmac code very
oddly does _not_ use the built-in PCS if this flag is set. See:

	stmmac_ethtool_get_link_ksettings()
	stmmac_ethtool_set_link_ksettings()

and their use of pcs_link / pcs_duplex / pcs_speed. Also see

	stmmac_common_interrupt()

and its use of pcs_link to control the carrier, the dwmac1000 and
dwmac4 code that reads the status from the GMAC, updating the
pcs_link / pcs_duplex / pcs_speed variables.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

