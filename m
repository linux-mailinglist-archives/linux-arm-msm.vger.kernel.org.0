Return-Path: <linux-arm-msm+bounces-98748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAFgIQH0u2nkqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:02:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4AA2CB9CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9D673014C03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0A83D34B3;
	Thu, 19 Mar 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="zxpv3RsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2243D34AB;
	Thu, 19 Mar 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925113; cv=none; b=RJ2BuOrlAGAKF6QdlGiivym+YpO2+SK8nSbdawtBk3hdsEhZ/SEfidYPmFDxaDCpbnkGUbIBgp/5hSPo+xRT0sA8c3xfwWBuIBxDQeyNPYIeywpq6PJv+xDnIKx0jfq2+ea82vRu9iaIteOqZ4MKhXA6w9wljdCrWGxOViqPiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925113; c=relaxed/simple;
	bh=cdknfVDKZfirBjvPbVt1AvVgcyHfvS3/uHlqeMpnjZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDyEm9T7zD1TQGs4DxiBnw8lalFUNDvDkZPgEGDer3S28s+F1MhxoIPbb3xt73XgP4fQcBEzbwUhg1+/F8zaz5dXYCFmBM7ziYWu7YhPm4vMW1VaZrZIpWGSEBCGyLrDM3oAcUgd+xZLCO9F+8LtEjYHOha4oyldGORJGhZnfeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=zxpv3RsH; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z7R0pn7ZfdsYWdr21Qctdy5ZMqO7uhqsnnOEXcHNYDI=; b=zxpv3RsH1j0RgeyxZ9QHdWZhmC
	lFnfS4AluSgqoW0Ktrf02KNVAy4qiftcMGC3jfrsFBWzpTqaQwAJ1AW+g8chPTOCmutDfi9k7Evaz
	KU1VJpc58NGgX2euaAZJhqiE0RxEiAteyQi7WxqXmCzkESLPGJxSWIbrWWcgCfW3TTTRkyNFQLIXB
	EpziFXgvzqIcLeViTs1sUUW1tm4DKdlRYwgOB+5xgeUF+zg0+vO5W6gqv3y1cvRlVZYExQpTEsBVW
	Pvzr1i6JlyzfF5+3xYYuwRhiSeImWqBxXJDeLeT40ly4HU9dvNv0LeJES9IpMlxtewEnK079koyAH
	UKG0/sxw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45602)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w3CxC-000000004lO-0Uh7;
	Thu, 19 Mar 2026 12:58:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w3Cx8-0000000088u-3p1e;
	Thu, 19 Mar 2026 12:58:18 +0000
Date: Thu, 19 Mar 2026 12:58:18 +0000
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
Message-ID: <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98748-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_SPAM(0.00)[0.717];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 1C4AA2CB9CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> > On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> >> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> >>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> >>
> >> Please look into this first - with the MDIO bus operating at
> >> who-knows-what frequency, this could make reading from the PHY
> >> unreliable.
> > 
> > My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> > which means we don't know the rate of the CSR clock.
> > 
> > From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> > drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> > struct clk_branch makes no mention of any clock rate, nor does it
> > have any parent. From what I can see, neither of these drivers
> > specify any rates for any of their clocks, which likely means that
> > clk_get_rate() will be zero for all of them.
> > 
> > Sadly, when I designed the clk API, I didn't think that people would
> > be stupid enough not to implement the API properly, more fool me.
> > 
> > Under the old code, we would've used STMMAC_CSR_20_35M, which means
> > we're assuming that the CSR clock is between 20 and 35MHz, even
> > though the value is zero. Is that the case? If it's higher than
> > 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> > specification, which can make PHY access unrealible.
> > 
> > In any case, please fix your clock drivers.
> 
> I'm not 100% sure the currently-passed AXI clock is what we want
> there and the docs aren't super helpful.. is there a synopsys-name
> for it? What rates would you expect it to run at?

There is no easy answer to that - it depends on the bus interfaces
and whether the CSR (register) clock is separate.

The likely possible names are hclk_i (for AHB master), aclk_i (for
AXI master), or clk_csr_i.

It does state that the CSR clock should have a minimum frequency of
25MHz to allow all statistics to be properly collected.

The rate of the CSR clock needs to be known, as selecting the divider
for generating MDC within IEEE 802.3 specifications is rather
fundamental. You may find something there which hints at what rate
the dwmac's CSR clock runs at.

Hope this helps.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

