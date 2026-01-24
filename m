Return-Path: <linux-arm-msm+bounces-90391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JvlMOoPdGmp1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:18:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461F7BA43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1956301FF8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 00:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0777261C;
	Sat, 24 Jan 2026 00:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vRSuX8oU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3573335BA;
	Sat, 24 Jan 2026 00:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769213813; cv=none; b=SfnhmKNE5XOXC3qA9kWXieAmfnxoqISmKYvPLIbH2H0R7J8EtytJgwrbpkkouhE7vPuvVC8IgnaXB8dKPFjq2DixjXsnRbMB1AyhPrKNRUGMHgAtSSIfxi1H2sMMYDUK8CTImDMZYJcMBgwLmWesbqhT3redWq3CChTsah4QgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769213813; c=relaxed/simple;
	bh=h3CIg4bLQDlSIE2Ih2cdfQUqE+t4LWsNlQ4sUBWaaRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4M3OvH+gasaChRdN0Kb4rFLyBmfCTWOZ5OuBVAGSghLOqyfB9k76XAXtYCc+4+EflCzYL0gT6mvMOqbmxEEqSA9sdxuIUUR9UO2ZYlrFRei0s5tua/XcUXXjtEkhlsl8Iyv/4vp9fSMEfEJlBB7ZTox0ihrlYafnnHJ2b5rcM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vRSuX8oU; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iZB71uqjML4w9rR8etBjxBLKoRFzZrwDxpZiOxS2Ois=; b=vRSuX8oU8/P4wCgCBM9K3rqdta
	ZFSOeo9EMGRE8fRWUz+5xUaBJKm20kbE8f092osZzm89zIJIQMOMjSriMMCx+XzmPJuvFYIdJShSj
	C6RH1gHbjhksFQ7BeCFZS5qInVkMFvhmwAXsQYeSqxE6Xfw47SLPKSSm+sJZ1GOhDDbMQtnNxDXb8
	y/Ce8GNmcD+0y9WBB7GJhtLZ+wXCCKYyAABUYjOQ5L94CV5sVvOuiKsLow80eINl7lIQntrIo3zVZ
	7wAHOswmVW9EA6HQCubITsqcIvNYR0Zkw7w1IXGFjQPET7Lx6RkeLP39OW85A2itOp5AKlNrfwpdT
	Qo3GrNvg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjRKT-000000002e4-0vPd;
	Sat, 24 Jan 2026 00:16:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjRKP-000000002Xd-1kQd;
	Sat, 24 Jan 2026 00:16:37 +0000
Date: Sat, 24 Jan 2026 00:16:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXQPZfRQl2wpQ3Sx@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
 <20260124000409.36nsxlvkde4zpddk@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124000409.36nsxlvkde4zpddk@skbuf>
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
	TAGGED_FROM(0.00)[bounces-90391-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2461F7BA43
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 02:04:09AM +0200, Vladimir Oltean wrote:
> On Fri, Jan 23, 2026 at 11:13:26AM +0000, Russell King (Oracle) wrote:
> > According to patchwork, this doesn't apply to net-next. That's odd,
> > it was generated on last night's net next, and although there has been
> > further work, it rebases cleanly on top of this morning's. How can
> > these changes:
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++----
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> > 
> > which happened in net-next overnight result in this change in patch 1:
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > failing to apply?
> > 
> > No, patchwork is clearly wrong.
> 
> Conflicts with commit dc6597fab3e3 ("net: stmmac: dwmac-imx: keep
> preamble before sfd on i.MX8MP"), merged in the meantime.
> 
> In include/linux/stmmac.h (your commit "net: stmmac: add stmmac core
> serdes support" adds a "struct phy;" line, but that other commit
> modifies the context by inserting:
> 
> #define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
> 
> (the last stmmac flag in your context, at patch generation time, was:
> #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
> )

I still maintain that this is silly - to mark all patches as such
and without any details about the problem applying the patches is
not helpful.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

