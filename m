Return-Path: <linux-arm-msm+bounces-92995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO1cGz07k2mV2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:43:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E945145BC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A8730067B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EB1328B56;
	Mon, 16 Feb 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="qgb3v+Vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B40306D2A;
	Mon, 16 Feb 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256546; cv=none; b=nXj7wTe52jiIsaZ0WSBoGEbeBGsDAK8JWfQWiGmYwcQoDXF2ryeTRQaccg81BcxMK2/IoVnedPcHUIOz1k+R98ZNKV/YYR+rOrYz9QZ7ELXJD/9NeIVR/9r+FzZR/4ZXIp7eFuxcb+EoPYAg351s6Y/oWXlJUQQREMwd8U+DSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256546; c=relaxed/simple;
	bh=6s3znu4j+iODnWook2IfmD2/Bnh5JhU8+Zk8gOlMEik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vs916nWwkGO0NfwEvzRuAAcgeSzk/E9+740yS7SCCdQ5hkWq6hjcjYWyAQJBoy1KO6XmGulf0fzwdoTx5/t6h2+ecCWFcSf0FAMlbvjXPshwEJt0nBHu74aFZaJ3y6aJSNwzjeJtFGNrvXuxA2UdjwLeDoqh/CeqQsOuyD6g4jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=qgb3v+Vt; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rtQGx8JaIvXg61aL8RGWRy89nLOrlWoGMW1moSYdF4U=; b=qgb3v+Vtq+yIqIbp+EvMyer2d5
	aOqdWJwZ9wUpJHfFUZg/NtJFsYcn/IHj3N2S1wrjFCYxQXNLsM8BItrnXAGIbqG4X2KQ/8IFu1yXS
	+LZDKwysogk6ieqLtopJz7trniT9lskIKGT8X/CsHCOX84pP8XxLP1HxAMdxEd14HLYzKLiinKjC9
	OPe2deRHvKTMwuR0v+6bHA2Sk/VpIV7ycJZxjZbC5uC121xwaPqGdUNIyXi6tm2NoiZWUybjBiNwv
	JbPEOk44dfUlk60GIKz7RGCa3DxR5B3JXaWpI5c3zUvC+ZJcijQXdPm8U/W6gn9SFnZH2cenlVfqM
	kY2cNW4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39088)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vs0jl-0000000075q-0Ygn;
	Mon, 16 Feb 2026 15:42:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vs0jh-000000000MC-0xiX;
	Mon, 16 Feb 2026 15:42:09 +0000
Date: Mon, 16 Feb 2026 15:42:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <aY95qbcG2BLGVzHy@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY95qbcG2BLGVzHy@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92995-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E945145BC3
X-Rspamd-Action: no action

Hi,

On Sat, Feb 14, 2026 at 12:51:13AM +0530, Mohd Ayaan Anwar wrote:
> Hello Russell,
> 
> Things look pretty stable on the QCS9100 Ride R3 board (with the AQR115C
> PHY). I would like to test a bit more and should be happy to provide a
> Tested-by once that's complete.
> 
> I may also get access to a board with an RGMII PHY on Monday, so I’m
> hoping to verify the changes to ethqos_rgmii_macro_init as well as your
> patch from the previous series (“net: stmmac: qcom-ethqos: convert to
> set_clk_tx_rate() method”) soon.

Looking forward to hearing the results, thanks!

As you seem to be fairly active with the qcom-ethqos stuff, please
consider adding yourself to the "QUALCOMM ETHQOS ETHERNET DRIVER"
maintainers entry. Thanks.

Vinod, are you still actively involved with this, and if not,
should Mohd remove you from the entry for the dwmac-qcom-ethqos
driver?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

