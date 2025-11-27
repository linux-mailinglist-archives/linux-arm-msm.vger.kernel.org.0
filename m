Return-Path: <linux-arm-msm+bounces-83619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56019C8F39E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 16:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 441083A1DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 15:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137132C0269;
	Thu, 27 Nov 2025 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="o1345l8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AF12E1DC;
	Thu, 27 Nov 2025 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256484; cv=none; b=tOcZTxwgPHbHDyQj2+ye4ZjLfDjm2pSthTx867dc63dFz6Nhe77MAuxyFIq7cLIUcM45MTA+1bqfOAaN4r3bBieNdVvVZrkW06F/FLwVEkDKsiHbQ0Dahn1utHhyuvNFnfAy9VmTv6op+rkthEAz39KUFouFd8n0nNmsw+3u52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256484; c=relaxed/simple;
	bh=GISJZlbMjRMH3FLgOAE/n7aeSYqibczCRUShnMLEDl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeIN1430NPldo9IoyoVOWq2xXbHHQ4jEYE1C+HBnQKN6eTQX5HnMcfAj4aIl3GnaJLHNRSRn4wc34vag3qLTGiv+qVbpaaAr0McDXWPysARLQBmgVsCKfUX2oN9cFX7jp2M6ifRFyl8DeghspEALF5q8oNGuPWLk4uTqiCOHbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=o1345l8G; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ya793UL1t6ZXjE9Jutk32ViGQVOdRhEUj5I2c8rJ+v4=; b=o1345l8GjSsxF78GHz7VRDhwD1
	i+YJDPWDThMyKLUKfRMesM4wz2zGO72lbjlX2BvFQnTNn5+bk0uc47aPcECfvoTw6gCPxHfk/Tl25
	h/mlFmhSLc9mhY2J/TIrMSYfD4RyLMHyeTUHWejYNVFhfy/50Z8NSHUzyxxg327j/eKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vOdhS-00FH0H-SV; Thu, 27 Nov 2025 16:14:26 +0100
Date: Thu, 27 Nov 2025 16:14:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <858378a8-263d-473b-8a74-e9cdc8b6e3f6@lunn.ch>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
 <e4bdc937-04db-421b-bbce-e71f0466672a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4bdc937-04db-421b-bbce-e71f0466672a@bootlin.com>

On Thu, Nov 27, 2025 at 09:43:23AM +0100, Maxime Chevallier wrote:
> Hi Jakub,
> 
> On 27/11/2025 04:00, Jakub Kicinski wrote:
> > On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
> >> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
> >>
> >> This v19 has no changes compared to v18, but patch 2 was rebased on top
> >> of the recent 1.6T linkmodes.
> >>
> >> Thanks for everyone's patience and reviews on that work ! Now, the
> >> usual blurb for the series description.
> > 
> > Hopefully we can still make v6.19, but we hooked up Claude Code review
> > to patchwork this week, and it points out some legit issues here :(
> > Some look transient but others are definitely legit, please look thru
> > this:
> > 
> > https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574
> 
> Heh this is actually fairly impressive, I'll go through that :)

Always verify what it says. This is still early testing phase, and we
expect it gets things wrong with quite a high probability.

When it does get it wrong, we would appreciate feedback saying what is
wrong. We can then ask the developer to update the rules to try to
prevent the false positive.

	Andrew

