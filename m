Return-Path: <linux-arm-msm+bounces-93106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wYcFDCNBlGkmBgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:21:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B48F14AC9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19CD9301FA56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92302298CB2;
	Tue, 17 Feb 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkoE9j9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3672877E8;
	Tue, 17 Feb 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323679; cv=none; b=mO9NE0L5LbA93LX64P95Emh68ie8/iViulc4xBzbzNCdx44SIoI8SfpAMowX/iHWWqwHtUtC2R6Dd7ByMzQ2E+R8fTxQqFmN+ZxY3JtcIyjJo2TOtqsxxCjGCZOKQYtrVdvBRdJ4G5M5mjnVCQ1FVIWvQ0w6Rqc/xG9onOW82MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323679; c=relaxed/simple;
	bh=nMYlB6mUz5sDcuGpH56QRUMJMtqJhSaGockFEPLWdMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba4IyE+J4uec83FovpacBFGCbAB6d4sljLeVGZ+fPp/NATm3WY8wUQE8oHPqXTrcY/iZ4cPxWZ3APCcYZmg+Ja3sIxjP9czKWZRFeZ1IBdjwGbUum6REGLvjfIInTEQtGDfLeJxfmoMJ2zFOEggXnSiJYT1oLNfOeQg2LSNKeA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkoE9j9K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901A1C4CEF7;
	Tue, 17 Feb 2026 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771323679;
	bh=nMYlB6mUz5sDcuGpH56QRUMJMtqJhSaGockFEPLWdMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkoE9j9KHbNrGTrndFzyjoJvaPqvLr0OZT62+8iL4EAvfV5M3qkF4fnCubvw9ggpD
	 Cw5m4WeuIiQfAqt8V67QEQl1CzjpDZK5Oo/Af0wbKoe6o4zSzM+0w2RxwOeRw2Jlb8
	 uOgS4NRrqxZQEMuZojmApE+FV3H+FLDjLnzE4jRiIreaqoBahmQvEaU7fSKi1yJEtc
	 lV85cvpvWyIme+Hx6p/jQZaIYH+YOuNJ77Ey1v/bUnNm6X6LSU5zPmwZfpcYOSoGNA
	 YCfrp67I/2i784MMV+kALIVyYx3DpqKUVNINDHgn+zSPE3t10PWv6MvNw+yoO2rZ3c
	 2bhQlM0JNuR5g==
Date: Tue, 17 Feb 2026 15:51:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
Message-ID: <aZRBG0h0HHSjc7tE@vaman>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <aY95qbcG2BLGVzHy@oss.qualcomm.com>
 <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B48F14AC9D
X-Rspamd-Action: no action

On 16-02-26, 15:42, Russell King (Oracle) wrote:
> Hi,
> 
> On Sat, Feb 14, 2026 at 12:51:13AM +0530, Mohd Ayaan Anwar wrote:
> > Hello Russell,
> > 
> > Things look pretty stable on the QCS9100 Ride R3 board (with the AQR115C
> > PHY). I would like to test a bit more and should be happy to provide a
> > Tested-by once that's complete.
> > 
> > I may also get access to a board with an RGMII PHY on Monday, so I’m
> > hoping to verify the changes to ethqos_rgmii_macro_init as well as your
> > patch from the previous series (“net: stmmac: qcom-ethqos: convert to
> > set_clk_tx_rate() method”) soon.
> 
> Looking forward to hearing the results, thanks!
> 
> As you seem to be fairly active with the qcom-ethqos stuff, please
> consider adding yourself to the "QUALCOMM ETHQOS ETHERNET DRIVER"
> maintainers entry. Thanks.
> 
> Vinod, are you still actively involved with this, and if not,
> should Mohd remove you from the entry for the dwmac-qcom-ethqos
> driver?

Yeah I am not doing anything in this area, pls do drop me from this

Thanks
-- 
~Vinod

