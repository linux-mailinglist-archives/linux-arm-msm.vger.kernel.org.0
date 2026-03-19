Return-Path: <linux-arm-msm+bounces-98782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIZhA5oSvGnbrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:13:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF32CD801
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 140E1300B573
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871AA364E8B;
	Thu, 19 Mar 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="aMU5hgi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4742D63E5;
	Thu, 19 Mar 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933099; cv=none; b=Tfwcs1NPUCGY5aMiiWSGiX1JZlybzjb++dJStKl2kerDwJmkL9e0WPe6hu37QR/ZxFWZB/gcKROCYKLPo5oE6zOREynLiXuSWlP6be9O/xDJU6XbDR7HBHvRsG7FHRjFIWRXhjwW6k7Fvw7fMCzPwPKKiWXQWijcPts0VrPASyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933099; c=relaxed/simple;
	bh=+SwXy12jOCXpAUmKYSQndcqp+9kRiCVGtDj8RdjYL94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze2jMWgyJxJA0ve4Kr6kh3q62UULvVAI/Mt33m8P3CRvwymkrg9sq13n3iQ7Vlm/SqqQfZ2Kdkp5L+AWhkl6HMuDQIAZzR2wwZcn0amlYAqcXIjLPga92JDFPjMLcM3QOftfQtyi8Fi6hBRqtZYB2RcTaS/IIuu1Ab79BKBcmHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=aMU5hgi1; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9PKfHh7lpDmvXp/AacCSQ4DXliViadOMLA1Saz6vuQM=; b=aMU5hgi1JmyBFGBjGXz8h6GZ97
	qYwyqthq0k4Ie4XVz0Hlae3+6315exn9CIHZElJ2p8VCpxl2xKmcH+w4AnFTPGKg3iTz87AwMcRSj
	FGG3vbB6iCtpNc550JNthzmkcgwcjQFf00NEatZGff38mF4Xh/0pRCuIVpL/BPAYvRgRQkl1JBumc
	hwNUdMIq7KTa8qejhtlF2HzWMqXc7yfq8XjQxCKEozzTiwCWPPeOYUe4b+csipMMjRAy1MM5DsY1d
	aoL3AROYLqPzi5JhFgMHtmSIKoiNWoIer31sAiKsvXIR6kgJaEVxIxDIwYF13JTHfmuGasC2KYHJC
	r/4lZR/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59324)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w3F20-000000004tn-0xA2;
	Thu, 19 Mar 2026 15:11:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w3F1w-000000008E5-2ekr;
	Thu, 19 Mar 2026 15:11:24 +0000
Date: Thu, 19 Mar 2026 15:11:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
 <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98782-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.709];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 77CF32CD801
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:50:29PM +0100, Konrad Dybcio wrote:
> On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> > On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> >> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> >>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> >>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> >>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> >>>>
> >>>> Please look into this first - with the MDIO bus operating at
> >>>> who-knows-what frequency, this could make reading from the PHY
> >>>> unreliable.
> >>>
> >>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> >>> which means we don't know the rate of the CSR clock.
> >>>
> >>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> >>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> >>> struct clk_branch makes no mention of any clock rate, nor does it
> >>> have any parent. From what I can see, neither of these drivers
> >>> specify any rates for any of their clocks, which likely means that
> >>> clk_get_rate() will be zero for all of them.
> >>>
> >>> Sadly, when I designed the clk API, I didn't think that people would
> >>> be stupid enough not to implement the API properly, more fool me.
> >>>
> >>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> >>> we're assuming that the CSR clock is between 20 and 35MHz, even
> >>> though the value is zero. Is that the case? If it's higher than
> >>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> >>> specification, which can make PHY access unrealible.
> >>>
> >>> In any case, please fix your clock drivers.
> >>
> >> I'm not 100% sure the currently-passed AXI clock is what we want
> >> there and the docs aren't super helpful.. is there a synopsys-name
> >> for it? What rates would you expect it to run at?
> > 
> > There is no easy answer to that - it depends on the bus interfaces
> > and whether the CSR (register) clock is separate.
> > 
> > The likely possible names are hclk_i (for AHB master), aclk_i (for
> > AXI master), or clk_csr_i.
> > 
> > It does state that the CSR clock should have a minimum frequency of
> > 25MHz to allow all statistics to be properly collected.
> > 
> > The rate of the CSR clock needs to be known, as selecting the divider
> > for generating MDC within IEEE 802.3 specifications is rather
> > fundamental. You may find something there which hints at what rate
> > the dwmac's CSR clock runs at.
> 
> If it's either AXI or AHB, in both cases their direct parent is controlled
> by an entity external to Linux and their rates may change at runtime,
> based on aggregated needs of the bus. They're defined as levels/corners
> (abstract term for a hidden volt+freq combo).
> 
> It may be that the operating range for the EMAC removes that variability,
> but with no concrete evidence and just anecdotal experience, that's only
> the case for the AHB clock

The important thing is that the MDC doesn't exceed the max clock
frequency for the PHY and any other device connected to the MDIO
bus. IEEE 802.3 specifies a max frequency of 2.5MHz (minimum period
for MDC shall be 400 ns). Some PHYs can operate in excess of this,
but one would need to confirm that all devices on the MDIO bus
supports higher frequencies before using them. In the kernel, we
generally err on the side of caution and stick to IEEE 802.3.

There are two ways to achieve the divider value with stmmac.

1. if priv->plat->csr_clk is set to a value other than -1, this
   configures the hardware divisor (for "normal" cores, it takes
   STMMAC_CSR_* constants that can be found in include/linux/stmmac.h)

2. otherwise, the rate of priv->plat->stmmac_clk is used as the CSR
   clock value, which is the reference clock for the divider that
   generates the MDC clock, and an appropriate divider is selected.
   Given the available dividers, it works out at between 1.25MHz for
   a CSR clock of just over 20MHz and 2.47MHz for 800MHz. (I have a
   patch which documents the ranges for each of the STMMAC_CSR_xxx
   values.)

Note that the dividier constants are not the actual divider itself,
as can be seen in include/linux/stmmac.h

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

