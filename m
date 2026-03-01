Return-Path: <linux-arm-msm+bounces-94737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL8cBUZCpGl6bQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:42:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDB1D003F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3964300DF46
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 13:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDCB32E72F;
	Sun,  1 Mar 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mSynvnue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C930B50A;
	Sun,  1 Mar 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372546; cv=none; b=IxtJzkRR1xlpls7u+9cfoXUs65eo5TuCzhd8gVa69Ae4pchvCt9h/4fKcFraG4Z1POhOuvhhp8DKvWWt7NKdQ5qEmVkyI3LeYr16oc695nln574S60y9Lwh88YKs7Nx6s39PizWzWVEZh9oytua4B/UNg2mS7dFpmrQeLrh4SI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372546; c=relaxed/simple;
	bh=qVD4RKahyay8TGAHGHXvQhEtbsva9khTzVeRXDCOk/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ghjlvg9EDs+svQHIH1ldP0r7YNH2Dmc6ddZDoq/LEntLCiL1UkQ/piKKfBcPCwLZ4oiDbQLX92jKafnpB0I4ElO+SJ5HI+H210wZCRP/fFdKt5+eHrSKH6g8u4RPFvwevPZXs45qorJuS/ZjTomslRtgOKYr0KbuzkZ30rSJM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mSynvnue; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WpLeXtLyKHRcvN1WgzNsqUfY7g82mlvTHaVSolT+rAw=; b=mSynvnueSrkVI69YpKkbBjRG9f
	aDqJMD3Z92UYypxgYcWlSpCCtaGG2y5OYeYOflT/SvZk3WJSEFJHK+L4vcEl0QEUh/m7fdWN1X8nD
	UjUsf4wbB5jtulQNCeRci5aBAJSaol5Z3TYzHhfJ7KrF9ikCaGhXijMFvUJ8Xu7OiZS40PeV0uWKJ
	6r9q6qFwUJLNJ9ROOSBrzNHPwcUQ2O7GDrXGAjhsH4CViafGcb9wnhbllqGjyN6QWTHhN663z4boG
	z14caRvnp4pi0+vYszyFsw7gFgYh3yopRncaw+ZSz/0GlrMYVQJy2mfwnHUizYlAXgzrjlVOLi4Ka
	qv/Sd9YA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41064)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vwh3p-0000000030E-41Ie;
	Sun, 01 Mar 2026 13:42:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vwh3n-0000000052j-1vRB;
	Sun, 01 Mar 2026 13:42:15 +0000
Date: Sun, 1 Mar 2026 13:42:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <aaRCN7zbX6FjUtQ_@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301001453.lpd2rawy7bqxyivp@skbuf>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94737-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.160];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shell.armlinux.org.uk:mid,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 87CDB1D003F
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 02:14:53AM +0200, Vladimir Oltean wrote:
> On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> > On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> > > On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > > > The AI review for patch 7 says:
> > > > 
> > > >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> > > >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> > > >   .set_mode() and .validate() methods") by making phy_power_on() call
> > > >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> > > >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> > > >   before attempting calibration.
> > > > 
> > > >   Should this commit include:
> > > > 
> > > >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > > > 
> > > > which is _wrong_, this isn't a bug fix.  
> > > 
> > > Yes, that's what I thought but then I saw the other thread..
> > 
> > Trying to apply this now but stmmac parts don't apply on Linus's tree,
> > and Vinod wants a tag :( What do we do? 
> > 
> > Could you, perhaps, send us a PR with this on top of Linus's tree 
> > (a resolution of the inevitable conflict with net-next would be helpful
> > too).
> > 
> > Or do we give up on the tag?
> 
> Actually, I think it's mainly me who wants a stable tag. I'm working on
> a series for phy-next which will conflict with this hunk from Russell's
> patch 1:

Is this because of the issues I raised with the quality of generic PHY
API implementation by drivers?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

