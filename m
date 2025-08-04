Return-Path: <linux-arm-msm+bounces-67704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD7B1A3EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E576A7ACDF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FEB26C38E;
	Mon,  4 Aug 2025 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="if8Cno+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFE25D53C;
	Mon,  4 Aug 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754315808; cv=none; b=mJ1H2CE3pC9Xcm1SDfdV4cxPRJs+pal1aMSinEKOGB2UAKDTi/HzGQltg3WfQWip5Dh77szBp8nihEPpp+5wV/9fqzwrkB515j21xi+8R79PzqEd9NxlDC4jfpjjRk9GLQcQPUmVi+UHwc1/QUpa+BScXJlZaa8MEzZGRsW7jCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754315808; c=relaxed/simple;
	bh=7/a6J9L72Vn5jHGTjVBt9K0+XZXfSB5eubI9G5HM7sU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRFn6pXSSaBGwNPRdOpelZ2pXkDib/sdazC7uPBCj6KsNjS5jKSbK4kT1glX3G7T17cwEzXhK1hrZPRHHc5DLJEameRclH3FrO9r771/THZUxOGk3vAblSJJlZdBPzzcrrRkTOgIRBRfTU7qkR+APD/zJwHoWilMunGjidVzmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=if8Cno+p; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A67CC44987;
	Mon,  4 Aug 2025 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GWaCWfMGOeVLl+TC602dyEUg8hYPmCqnXlyFHBYtbE=;
	b=if8Cno+pLmFsNTLP9iO4kurwuCoJS+SM7SNnUVQRcbIXkBglBAdWaO3TqC/NeSnvZRiz7U
	70SgMt2IDllHWTN9fVAtnCknmWDz4bSfyyHW4fuG+rd2W59h5QTAsBTxNP9QkEPoHYsvTw
	dLwvquxfVQ71NstbxTN+136qyBeoOkzKr7QGRktAlQ2SP2GJ8i+bgSsZs2VkwEoOk6878m
	2cJFd9uJsod2ohNYPYwsq9FqKWCMawJfypBtQ330aSBCgIlnCbtonIBaeVOsloYQxsZ7Vt
	1sZUXqZ8/hBK330il1NmzhQCw75BQpCtRg6zlzqZkYr8W6gMLDXEL+9+KRF/XQ==
Date: Mon, 4 Aug 2025 15:56:41 +0200
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
Subject: Re: [PATCH net-next v10 11/15] net: phy: at803x: Support SFP
 through phy_port interface
Message-ID: <20250804155641.176a64f7@fedora.home>
In-Reply-To: <67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-12-maxime.chevallier@bootlin.com>
	<67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm

On Sat, 26 Jul 2025 23:24:36 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Tue, Jul 22, 2025 at 02:16:16PM +0200, Maxime Chevallier wrote:
> > Convert the at803x driver to use the generic phylib SFP handling, via a
> > dedicated .attach_port() callback, populating the supported interfaces.
> > 
> > As these devices are limited to 1000BaseX, a workaround is used to also
> > support, in a very limited way, copper modules. This is done by
> > supporting SGMII but limiting it to 1G full duplex (in which case it's
> > somwhat compatible with 1000BaseX).  
> 
> Missing e
> 
> > +static int at8031_attach_port(struct phy_device *phydev, struct phy_port *port)
> >  {  
> 
> ...
> 
> > +	if (!port->is_mii)
> > +		return 0;  
> 
> That seems common to all these drivers? Can it be pulled into the
> core?

If we pull that into the core, we'll need to add specialised
.attach_port() callbacks in phy_driver, such as

	.attach_mii_port() or .attach_serdes_port()
	.attach_mdi_port()

I'm perfectly OK with that though :)

> 
> > -	if (iface == PHY_INTERFACE_MODE_SGMII)
> > -		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");  
> 
> I think we need to keep this warning. I don't remember the details,
> but i think this is the kernel saying the hardware is broken, this
> might not work, we will give it a go, but don't blame me if it does
> not work. We need to keep this disclaimer.

Sure thing, looking at it now I'm not sure why I removed that...

I'll add it back,

Maxime

