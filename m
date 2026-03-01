Return-Path: <linux-arm-msm+bounces-94736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CVVO6NBpGkgbQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:39:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A561D0011
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 14:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3444B3004627
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 13:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1273432BF44;
	Sun,  1 Mar 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="dF0Wv6tL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A99D32AABE;
	Sun,  1 Mar 2026 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372383; cv=none; b=Lt3yMurOyoIR9Z95Lzf9Gi/kNnnFuDLdVkusxnwhTVElm9MJKg+05WbIXuFBmxT4ajMkyKFr1DXqGza9xtM1pMN1ynAYYj87D9r4Sg1nTbdtYcBnsLWWE5DWJrh7htzeKJ3xF5ZB1L5ke2oJDX3JwpVEvYxSvkYU89t+Eb470o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372383; c=relaxed/simple;
	bh=M9DbE+6FJL3vpGESxsbwn32yx16AulfKWZwoSv+M63o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHGwVtQ0qlhnppbLrAbtysgbFu9ae/I5uXjLL/cXrbppJKEdNpYrabJUC8trErYmh4Co+lhbFCB3S/5d+hv/t3B6n7Y9Oq03+w6Upa1etFRaEwSuonTCPVebNkRl4ZcBJW+Q5oF0yldJowffK0KD4OZxejAeFMSdA1Xd8jHeXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=dF0Wv6tL; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1Q7wucS6pURwPgHIHcP2h2EzaAhhqWaFY4RLsBpkyUQ=; b=dF0Wv6tLgza0gUbPq4l/7IJhcO
	nGOxj81ENoCMwLZD3V0kkqlB8vinRdDF+U4zojPxN2FQhri+VE76vSqHJiHO7y0bjUppSqVKN+ols
	4QviiLN7JWTWU8cedj7/MIVjFkEoQfLXZpWM3F7iGMuxk33IvtONkj6PpN0HVMV1++QFetrnvjBgd
	9vRETjyYjTuizmQw7Sh90+wUP1B8Ro2eHRiHjnxPykLP/RUBoto2GmlpKbOZzOKpzy4FjhcFyYD9/
	pKBimEoFdRNBCBEg4Sa+Y73UsRyFdqotusGT+dnK4eNRGLcLEdtcG94bWYCVk6tA2m4Aed9S1bwXk
	qOIM41iw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35798)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vwh18-000000002zk-02mS;
	Sun, 01 Mar 2026 13:39:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vwh13-0000000052b-2zUf;
	Sun, 01 Mar 2026 13:39:25 +0000
Date: Sun, 1 Mar 2026 13:39:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228083111.5df8550c@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94736-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.778];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,shell.armlinux.org.uk:mid,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 09A561D0011
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> > On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > > The AI review for patch 7 says:
> > > 
> > >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> > >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> > >   .set_mode() and .validate() methods") by making phy_power_on() call
> > >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> > >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> > >   before attempting calibration.
> > > 
> > >   Should this commit include:
> > > 
> > >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > > 
> > > which is _wrong_, this isn't a bug fix.  
> > 
> > Yes, that's what I thought but then I saw the other thread..
> 
> Trying to apply this now but stmmac parts don't apply on Linus's tree,
> and Vinod wants a tag :( What do we do? 

The problem will be that this series has dependencies on the first
batch of qcom-ethqos patches, particularly:
cd0aa6515350 ("net: stmmac: pass interface mode into fix_mac_speed()
method")
b560938163db ("net: stmmac: qcom-ethqos: pass phy interface mode to
configs")
fb42f19e671f ("net: stmmac: qcom-ethqos: move SerDes speed
configuration")

which enables the change in the third patch of this series - and
without the third patch, none of the following patches in this series
can be applied.

I'm not sure what to suggest either.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

