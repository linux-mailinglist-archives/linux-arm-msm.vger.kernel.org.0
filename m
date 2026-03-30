Return-Path: <linux-arm-msm+bounces-100795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E6wHmRvymnG8gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:41:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2F35B2B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 908FE3000896
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3CE3CFF6E;
	Mon, 30 Mar 2026 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1SkUQbL6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA11C3BFC;
	Mon, 30 Mar 2026 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774874161; cv=none; b=aCZfQcuksmxG/txkKAOktjnxDZ6WzUGnTNDS7u/QtW/Pbr9VITU5wNc+C8QR3k/aEN+wg6a8AjcwHM4c/y+XZLtBTMuovYkeUtG/fcl/rdaM1qCje5Hh9PemobtZHl6Elzed2kOtrPRRNF9zvR6njWgPAOHt/QiJSGnuW3ZYKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774874161; c=relaxed/simple;
	bh=JgLz3/9DYWLbmsDqByx5eAD23pD+Ig2Gi9+AabgwnYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCjrjihOPMlKRMYlgnF6lrhz+PHuXjeg1XozbN9pVGr0aoK22/55hkbtaZKH6anyQFAqtVmbPvjU5QBXP1wNc7sLLjkvGCU8etJkIUt3ZBMvqdTT1H44oVNCvuZ39o5ktX7AtVAl2xLOZzg0SzYjF/KS0T5Y48JTJFEMK06CmPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1SkUQbL6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wYBKS7dt5j38ighh50PUCkRqON2g0NPUuA+55y0x1ts=; b=1SkUQbL6OFfy1tSZ9NRgzdUTff
	nx10vqYDxRH/htdOaPiVosjSKdhM+qxPyDPb/ZeO7l4XS0kH0sLr7vfDRKQspBuuHzII56mZcUeVW
	pPYw7YPK1B530+BU4J4hpwSn8/TEQjcj6IM/G7WUTz09DeLGTvMLc3ou/fsCMWQZ6JEE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7BqF-00E1x8-5E; Mon, 30 Mar 2026 14:35:39 +0200
Date: Mon, 30 Mar 2026 14:35:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100795-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74E2F35B2B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > their rate. According to hardware documentation, the clock which is
> > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > 
> > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > to what degree. Will there be visible impact if we e.g. have a 200 or
> > 300 MHz clock somewhere?
> 
> When you add other platforms, you're going to have to deal with their
> differences.
> 
> IEEE 802.3 states that the maximum clock rate for the MDIO bus is
> 2.5MHz. You need to ensure that is the case.
> 
> Current qcom-ethqos code doesn't set clk_csr, and returns zero for
> clk_get_rate() on the stmmac clocks because they are managed entirely
> in firmware.

Could a fixed clock be used in DT to represent clk_csr? Different
platforms then set it to different frequencies, to represent whatever
the firmware is doing.

    Andrew

