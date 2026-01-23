Return-Path: <linux-arm-msm+bounces-90366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP5GNW6vc2nOxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:27:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F326978FE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF1E13006993
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 17:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06B82DEA62;
	Fri, 23 Jan 2026 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WbE7SAtu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9407C296BA7;
	Fri, 23 Jan 2026 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769189225; cv=none; b=fgaXQlkvohzcGUgdOEUP16EwFFJCuOIOZ0ii6yaxNSfXlU58kty9tGAM2DveBKaQgNk6+GyNkuMYjSGar3XYkgxnYXzTxNewAq5W4i8cN35ikyip+j+FAZSos9xYe+1sOxldPN7rB9BixEL7yheRMtujF7ZXYpIMVrC3SFkNsck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769189225; c=relaxed/simple;
	bh=G/8OCQ/8COWTW4EpiiDpBWGvKl0QjVJqCfmQ1t0wbGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFww1EDg0ydWh5VxptX/8opl+3PpUl3qMul8mYN+5YdO9Oveq8t11NsLaQ+B8r570rxXvdhE36eS+BxUcuT6b6ODMN3rGDF4pS84xpRN6eWGKSqMutO8sIEFAIW5CsGiYbuPlpcretd57/VhXBco4GSyB9pRiCsp/mKmogNYqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WbE7SAtu; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ATqUy5/Sp0hLV7kTQCotJYn2id+kgnBDhi2Bfu1dxMw=; b=WbE7SAtucfXWKA5HnfaYgijWAA
	7L0Et33+VW7YE0lTPtIg91YcJfGT/yqR4XWo1hOw3m7+aVG65JgF7eEHkVJ2uucFrEz9d3yS0RouW
	pT+Tki0zV5+Z5Jy3b1t3Syzoa/LXYZcZEwiBOglSDeN7qf+1Dhgk0Mv06lfV2fsphs/ho1GU7SiPk
	7Lup2A1+JyjmwnTix8YwXKrcGF4aBOn7KZ/kjR695XoY5LJlDU4d/Hqm0YJmltDvCL7s3/OAaJ++m
	ZpZK6f8PfdvQq5KpcTqsfmSNWwQZtHE4V5fTLx3oUaU2CZ+leNEvhXGF4mPe+8IT6GbIMaS6sLY5/
	Fp2PCgHA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42282)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjKvr-000000002Mn-2kBY;
	Fri, 23 Jan 2026 17:26:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjKvn-000000002GB-2S0Y;
	Fri, 23 Jan 2026 17:26:47 +0000
Date: Fri, 23 Jan 2026 17:26:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90366-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,foss.st.com,davemloft.net,google.com,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,linaro.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.912];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F326978FE9
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 07:05:00PM +0530, Mohd Ayaan Anwar wrote:
> Hello Russell,
> On Fri, Jan 23, 2026 at 09:52:00AM +0000, Russell King (Oracle) wrote:
> > This is the v1 submission: if it doesn't get tested but review goes
> > well, it'll end up in net-next and mainline without testing on the
> > affected hardware!
> > 
> > Mentioned previously, I've been trying to sort out the PCS support in
> > stmmac, and this series represents the current state of play.
> > 
> > Previous posted patches centred around merely getting autonegotiation
> > to be configured correctly, to a point where the manual configuration
> > can be removed from the qcom-ethqos driver. The qcom-ethqos driver
> > uses both SGMII and 2500BASE-X, manually configuring the dwmac's
> > integrated PCS appropriately.
> > 
> 
> Thank you for CC'ing me on this series. Sorry, but I have been M.I.A.
> for the past couple of months due to some health issues, which caused a
> backlog at work that I had to power through. I haven't been able to
> monitor the mailing list for stmmac patches.

Sorry to hear that, but if it's any consolation, you're not alone. On
new year's eve, I had three teeth extracted, including one that was
laying horizontally in the palate of the mouth buried in bone, and
needed in bone graft (modern bone grafts are quite different from what
you'd expect btw.) It's been quite sore/painful as it heals.

> I tested v1 last night and just picked up v2. Here are my observations
> and logs (phylink logs are enabled). I haven't had time to debug the
> issues, but they are not seen on the net-next tree. One thing that I
> remember from our last discussion is the need to test with comma
> detection enabled; I will test that next.
> 
> Tested on the QCS9100 Ride R3 board with 2X AQR115C PHYs. I have one
> more board that I can test next week (IQ8275, which has a single
> QCA8081 PHY, but that is limited to 2.5G because the PHY switches its
> mode according to the speed).

Thanks for testing!

Given the results you've given, my suggestion would be that the
following patches are probably the most risky:

Patch 2 "net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method"

This changes the way the clock is configured. It would be worth
testing that and giving a tested-by for the first two patches if
that's successful.

Patch 6 "net: stmmac: qcom-ethqos: convert to dwmac generic SerDes
support"

This changes how the SerDes is handled, which is a significant change.
It's possible that the PHY calibration needs some other state to be
appropriately configured, and that's not happening in the same order.

Either of these two would account for what appears to be an unstable
SerDes link.

As for the NULL pointer deref, I'll look at that in a bit (waiting
for a build to complete so I can hopefully pinpoint where the oops
is happening.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

