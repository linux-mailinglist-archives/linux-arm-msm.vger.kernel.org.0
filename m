Return-Path: <linux-arm-msm+bounces-48216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62469A384FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 592CE188A960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310DC21CC6C;
	Mon, 17 Feb 2025 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qbmgE286"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B9B13AA5D;
	Mon, 17 Feb 2025 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799793; cv=none; b=snFV/Z++mZWkIpXHuBU3sCygButLT3tAUpl39rmHwajQJoWUw1wZ2ng2QB0GncHWOgK23Z6oLLkudp96phrS5STtenveWt2ai7gtDsCc1NFwDIwYyUkM66TrY2pK9NJgvxf5xusY8iIYFMiPKSzYRlZGV5cP9r/kGFHBw3EZ0s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799793; c=relaxed/simple;
	bh=Zolr9ZlVWPXTFxA8Jbg1jTpPdXRZV0RmUT+tTwWZFDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sM2dt6AD3i6I3WenrAoQDzhrTVS1RjwAc6SvvItrr48y8762l8dORcwMJiVJ/h65rYEX2adU2JA6yv6vTjf4CGb/yUphXYMHEk277SynhgXaxQYLD5BA8pqDPt7t7sZmKJ4RVVvjl2x82YPAzmOhq3Nklk7ogkPu1+d8wEecFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qbmgE286; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PNmSyDJcR//atUZ0VI/KDC8D5+6hGjhamZjsGf8geS4=; b=qbmgE286BZdak7XL+mky6WmBud
	gXG1+IgkUstfuDE1scOhlcH7TQ4lak5O6zX8AV48CgzfDqTAZXOlhEWfPGBpN/9nJIuzWokMi6vW8
	U9S/zGMf35rtCnx4/LC8mKlts+Mn01GO3jRTvH+M6KzfKAExz+SF2ak1Nrfvu43ZDguU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tk1Om-00Eyt6-AD; Mon, 17 Feb 2025 14:43:00 +0100
Date: Mon, 17 Feb 2025 14:43:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
	Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 05/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <5d618829-a9bc-4dd4-8a2e-6ce3a4acd51e@lunn.ch>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-6-maxime.chevallier@bootlin.com>
 <Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
 <20250217092911.772da5d0@fedora.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217092911.772da5d0@fedora.home>

> One way to avoid that would be to extract out of phylink/phylib all the
> functions for linkmode handling that aren't tied to phylink/phylib
> directly, but are about managing the capabilities of each interface,
> linkmode, speed, duplex, etc. For phylink, that would be :
> 
> phylink_merge_link_mode
> phylink_get_capabilities
> phylink_cap_from_speed_duplex
> phylink_limit_mac_speed
> phylink_caps_to_linkmodes
> phylink_interface_max_speed
> phylink_interface_signal_rate
> phylink_is_empty_linkmode
> phylink_an_mode_str
> phylink_set_port_modes

...

> These would go into linkmode.c/h for example, and we'd have a shared set
> of helpers that we can use in phylink, phylib and phy_port.

Please be careful with the scope of these. Heiner is going through
phylib and trying to reduce the scope of some of the functions we
exporting in include/linux/phy.h to just being available in
drivers/net/phy. That will help stop MAC drivers abuse them. We should
do the same here, limit what can actually use these helpers to stop
abuse.

	Andrew

