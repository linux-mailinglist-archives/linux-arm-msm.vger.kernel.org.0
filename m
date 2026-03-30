Return-Path: <linux-arm-msm+bounces-100805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGbJDnN8ymlo9QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:36:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5635C182
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2B9930022A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524A73D3339;
	Mon, 30 Mar 2026 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0gEg9Keb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C173D1CD5;
	Mon, 30 Mar 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876938; cv=none; b=EGL565gZsXcvGp3WS7iaOXri7dJvKz6eELpa5gNLdRHJZzvocWXVisK5cfDuucVqxPM/XR4pokcNm1aO33dsJ+rbXGr9b509GeLnok3YXsGtrdlnoYgqnJbhSYj3KJxcfDFSA/3ffnIlDZdSKydKXkHWB3NN/kDv0sxPuSWMF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876938; c=relaxed/simple;
	bh=Gz8s+o2EJrs89tywYwzT7PokJBGi36kyG/i1TlClfng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfC/n31VNi5F2KVW243Zn3+DQQIQShKQxE1MglhUbfEa7sv/TkbMWaXdig0rgq3h3RIkAvU/p0C4hjKxIs1ABIB2kproS4zSB8URnCJVPi+QyDh+JTxiKe93mJ0hFT/IydPD9v93aSMLSgH4q0NBwyYejeZf5dT4M5Q1ov8K+NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0gEg9Keb; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=neu4ARCwcfoinhz170R6LNmDJUciz9Vr0r4/+mMh+SI=; b=0gEg9KebiJm2KpoeNAh/J7egLy
	BASIfKM3/qG1q4MpPqWRIHSzKy9xyMNPDWm78WnSMZQHQ5amOmm4E7FCwK1OH2RhKPSFIGrCJDegJ
	VNQvnlysdvTZ7Zij3PesRxgZ9MNE+EsosQ0lwiSbLPbwzzZVYXsH8+Ld9WIyGpyQkMshGlkwiJDso
	sE/9KiMQ3U7uxLxH9wU/2uVOz3NHe1g/62zeUA+mWGV3o2CrrBV1maSW9o3nhJ+9BnT0K9KkNPcx8
	RyxMeayliIB1F8xfFm8dxKdM+fY0s4ZMADAOoODFmPJjP9o5dwb9D8VSNBT48GQSUdUTEsjNXEQqM
	zNjCqXyQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35698)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w7CZ8-000000000X1-3ZfD;
	Mon, 30 Mar 2026 14:22:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w7CZ5-000000002hc-2jMj;
	Mon, 30 Mar 2026 14:21:59 +0100
Date: Mon, 30 Mar 2026 14:21:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <acp490PTrVCWjiqT@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
 <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100805-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.745];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CF5635C182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:35:39PM +0200, Andrew Lunn wrote:
> On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> > On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > > their rate. According to hardware documentation, the clock which is
> > > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > > 
> > > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > > to what degree. Will there be visible impact if we e.g. have a 200 or
> > > 300 MHz clock somewhere?
> > 
> > When you add other platforms, you're going to have to deal with their
> > differences.
> > 
> > IEEE 802.3 states that the maximum clock rate for the MDIO bus is
> > 2.5MHz. You need to ensure that is the case.
> > 
> > Current qcom-ethqos code doesn't set clk_csr, and returns zero for
> > clk_get_rate() on the stmmac clocks because they are managed entirely
> > in firmware.
> 
> Could a fixed clock be used in DT to represent clk_csr? Different
> platforms then set it to different frequencies, to represent whatever
> the firmware is doing.

Unfortunately, at hardware level, clk_csr isn't a separate clock input
as such. It can be one of many, depending on the synthesis options
chosen by the designer. It may be hclk (AHB clock), aclk (AXI clock)
clk_app (application clock) or a specific clk_csr input.

Nothing is simple with dwmac. :/

The problem with adding a ficticious clock to solve this is that it
adds to implementers confusion for what is already a very complicated
problem.

We've already seen that the stmmac clocks are a total trainwreck
because no one seems to really understnad what is what, and that goes
back to the days when that "apb" clock was added - and that made the
situation worse not better.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

