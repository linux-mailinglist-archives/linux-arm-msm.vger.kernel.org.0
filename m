Return-Path: <linux-arm-msm+bounces-67701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 421BFB1A3D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD3453A4A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0172652AF;
	Mon,  4 Aug 2025 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cn1iVYZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349719D092;
	Mon,  4 Aug 2025 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754315494; cv=none; b=S9EGmfaJSvMkjw1h1pmtprITL/cpgY2Fe7xh3XYR2A0ai+uDpdfFPvVoTTzYs1Zp/p6I0aY+IYoJMRdp/LfVqec3daPbYXdqmyfbtNu7SP0yJ41ePh1GLL2oDobWQVl9ixPW0WCDtjQbkrt372KWLH0jx3XOfBRZ0h1vSI+pPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754315494; c=relaxed/simple;
	bh=jIdmE7ufYQKltTHYqWAtzcP3HrpJ35HLEKyjmyXFQpI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R149gKYsLsLNGRdPIlO0aD3tW/vF0xcieoFlCOE/plz/+vU2kOuRl6+/J3oHxkdaFE6gz2595G8RSLerQbAFd4RPKtyu+AcasfgXmvajYAcpcnq/5CAr24cSdDpWka+Llsbrh9d6iUWM2KOMknLs5VVXrnSmxjoLF79DF/lORQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cn1iVYZF; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id B394658235D;
	Mon,  4 Aug 2025 13:44:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E20CC205A4;
	Mon,  4 Aug 2025 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgwV+fOXVrQs+Zt5dFjBh21EJNlqb8OXXzjZNjPngpM=;
	b=cn1iVYZFX0jUTmSyC5w/5e6EI47N+q6Fu9FjRlF81cT9C1t3/qclIKDqXQuit6thzC2Dwm
	/7Xjmv0Njv76DbeYwvS/4nUaWU2Hy7rai1AuKmW8DULAVF4f3XxHoKjgSTlYvT9DN7yDox
	b8EVmhe2KkkAhZ43Sp1d2P5UndZa8g9iHRHIWspq8oi7Th+2FUmpRDvfMnq8G/ei4Z1VdU
	jPAExvJF0VxlEE3ddGK4GfAZw6mkS6y0YRPkP27B96Y+00GWCOLFAiXvLILrFIGwFAc1cr
	c5mTYnbNf7YL2B4aFohic47T3qfrgcWHmPm2BrPuRZxbvch9hDjSnAR9m9H8XA==
Date: Mon, 4 Aug 2025 15:44:30 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 05/15] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250804154430.3896b385@fedora.home>
In-Reply-To: <6721b691-bae8-4a91-b14b-276b14b89244@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-6-maxime.chevallier@bootlin.com>
	<6721b691-bae8-4a91-b14b-276b14b89244@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com

On Sat, 26 Jul 2025 22:50:08 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +#if IS_ENABLED(CONFIG_OF_MDIO)
> > +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> > +			dp83822->fx_signal_det_low =
> > +				device_property_present(&phydev->mdio.dev,
> > +							"ti,link-loss-low");
> > +
> > +		/* ti,fiber-mode is still used for backwards compatibility, but
> > +		 * has been replaced with the mdi node definition, see
> > +		 * ethernet-port.yaml
> > +		 */
> > +		if (!dp83822->fx_enabled)
> > +			dp83822->fx_enabled =
> > +				device_property_present(&phydev->mdio.dev,
> > +							"ti,fiber-mode");  
> 
> Could be my grep fu is broken but:
> 
> ~/linux$ grep -r fiber-mode arch/*
> ~/linux$ 
> 
> So it does not even appear to be used. If it is not used, do we have
> to consider backwards compatibility?
> 
> Maybe consider marking the property deprecated and point to the new
> binding?

I'd love that :)

Let's mark it as deprecated then, I'll do that for the next iteration.

Maxime

> 
> 	Andrew


