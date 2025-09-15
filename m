Return-Path: <linux-arm-msm+bounces-73601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ACCB5803A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 17:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7643E18902D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6D4334731;
	Mon, 15 Sep 2025 15:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="g3pnRY0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F445320387;
	Mon, 15 Sep 2025 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757949074; cv=none; b=QPpK/8P60JiiC+RPfm0X69AM8RaMtXsIU1RebPaIHaaGJ9j5nrFqPuiC+bJZKVtVuzHfl+QsFe4iSJCJeqvzGD5kCus+r6214ZcqazsWLbEeHRZ/KP2Vu/BG+YLDOZPkoBaId8TFwVU+b2jQdsvyR2r5X0RuolTpDQqHpb0zmE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757949074; c=relaxed/simple;
	bh=63EY3ctwPlCII/zbqHIwtxT//+JnZDzY6EJnU6Y3OzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFIaUuVRdOnfdpxa6HR5fVUsRuUr//5G7Zc308gF4MehsfmQufmbP3nnTGAIGDsXR9x7hvZvC2Sl2n8TAykkg1Jip+vXPQB5CQpJK1aMoSHzv3kRTaLMHQ0HM8/FXGkvcPW+/QsUXt9hCOHrEO24+DS4fN6aZx06yig8YEE2684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=g3pnRY0l; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2vv7mzTspn8YSSzImCdO3beqA7HPeUQQg28cj3eRsME=; b=g3pnRY0lJ2LY/xpKP+w1ylJAbM
	0WO21FYWMAUxgSOIsL75yLY5dbGtsUeJvBaaiMa8W7ec+/RLo/Tz/j0Le3L7YcOxTkAUjhd2s6204
	H/FvpRA0QA86g6P2KuaBYzSUds6BQpXUD8MSK+bwcVdg6ci6owuN1JSzg3HPQzY8m+GSB1SVKaZln
	xtDdfHdlcvmKLt5YPIjBam/wZC+4M5X90+6Spl5W6mnQBZl66YeGIWfJMrnpkRCiLU7ThUjGmsuqg
	QS64VOMROTmvXO8os3eZLcB0QM5mzd85LXDqhzo/Ml80U8CZ0c9sJDrGvIFoy6Q4f49JRJ5qJ7jLX
	0KcI7wEw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41340)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uyArC-000000000o0-3Vjn;
	Mon, 15 Sep 2025 16:11:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uyArA-000000006lb-2EUe;
	Mon, 15 Sep 2025 16:11:04 +0100
Date: Mon, 15 Sep 2025 16:11:04 +0100
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
Message-ID: <aMgsiDS5tFeqJsKD@shell.armlinux.org.uk>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
 <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
 <aMgCA13MhTnG80_V@shell.armlinux.org.uk>
 <aMgootkPQ/GcdiXX@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMgootkPQ/GcdiXX@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 15, 2025 at 08:24:26PM +0530, Mohd Ayaan Anwar wrote:
> On Mon, Sep 15, 2025 at 01:09:39PM +0100, Russell King (Oracle) wrote:
> > This shows that the PHY supports SGMII (4) and 2500base-X (23). However,
> > as we only validate 2500base-X, this suggests stmmac doesn't support
> > switching between SGMII and 2500base-X.
> > 
> > What *exactly* is the setup with stmmac here? Do you have an external
> > PCS to support 2500base-X, or are you using the stmmac internal PCS?
> 
> Internal PCS. But it's not really pure 2500base-X...
> I found an older thread for this exact MAC core [0], and it looks like
> we have an overclocked SGMII, i.e., 2500base-X without in-band
> signalling.
> 
> Just wondering if registering a `.get_interfaces` callback in
> `dwmac-qcom-ethqos.c` and doing something like the following will be
> helpful?
> 
> case PHY_INTERFACE_MODE_2500BASEX:
> 	__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
> 	fallthrough;
> case PHY_INTERFACE_MODE_SGMII:
> 	__set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
> 	break;
> ...
> 
> This should ensure that both SGMII and 2500base-X are validated,
> allowing switching between them.

So, this is something that has never worked with this hardware setup.
I don't think we should rush to make it work. The stmmac internal
PCS code is a mess, bypassing phylink. I had a patch series which
addressed this a while back but it went nowhere, but I guess this is
an opportunity to say "look, we need to get this sorted properly".

I suspect this isn't going to be simple - stmmac does _not_ use
phylink properly (I've been doing lots of cleanups to this driver
over the last year or so to try and make the code more
understandable so I can start addressing this deficiency) and
there's still lots of work to be done. The way the "platform glue"
drivers work is far from ideal, especially when it comes to
switching interfaces.

I'll try to post the stmmac PCS cleanup series in the coming few
days, and it would be useful if you could give it whatever
testing you can.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

