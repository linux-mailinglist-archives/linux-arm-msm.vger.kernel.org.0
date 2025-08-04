Return-Path: <linux-arm-msm+bounces-67699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E1B1A3D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D511B167F54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E432571DF;
	Mon,  4 Aug 2025 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LVsw/QWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4914A4CC;
	Mon,  4 Aug 2025 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754315396; cv=none; b=rFm2idlVehfpyXVaQFhjNcmWuZnDm3GJS5ALcMK2JnFT7vmTHS1pmRH2R915hVYpPCBMTKKZ++Sw5wDgNWCCQrt13fQmGfsjLXa45bFEYah0aJFClAEhY0PKIpoqr+0vWoWjKE3MIX7Lq71+/ga5HExpcUbSt5LwsGvv07fPOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754315396; c=relaxed/simple;
	bh=srs53v0xLtntg6cfrqV4BsYGkqhos5XR/fUU7n2qfLM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5b6ATw8ci0sv1f7JqjlJnRKwAatGxCtkdtziiJXo6RdA9hRLahXFF/whGfsHBV5/DCUPloH1V/crM4OypRQkSXuRUPdAAsczXCWzwkIOXhq2Gid3q4ppqbOfb0VJ7inKI4e/pOjakKh0YfxUPiN7ipqEYaq1fLTVCOI9TMkY6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LVsw/QWm; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FBCE205AF;
	Mon,  4 Aug 2025 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33C/cbbkFmBZEeMpAPusxnbTMNnhzWiivF3NeeXbwaQ=;
	b=LVsw/QWmBTRTbTaooY8OnHQGNxXtUmmo6v2YWzKw31V5RczfmrOkRZ4Bg5AzK69ZJPP3CO
	efWANVtXHkcvmFzA/L/2olQwkjVVP1tLcZw2oHRlQH3VPKcgcMhQYkTSikD7sqHIPvWjAf
	YbVouWp4BlIgk+vhlCPc5jfGlziUsNos286bNNxObY+TQlhqQf4lD5egqj+lFZiuAuq2dt
	cSFFUhV25DvgSfFyIvXUHd0lACUzOUMcOjHV697dDEwF9IiiI92KjwGreFuTULR0eP3BiP
	iC4H8DOXMbvHrk6/Ly803rdONV25L/DPTPpgv3WDaIgC9UDqrEJwEGea4GfueQ==
Date: Mon, 4 Aug 2025 15:49:49 +0200
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
Subject: Re: [PATCH net-next v10 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <20250804154949.49cbed6f@fedora.home>
In-Reply-To: <762dd1dd-0170-4f7d-b418-1997c48e7f95@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-8-maxime.chevallier@bootlin.com>
	<762dd1dd-0170-4f7d-b418-1997c48e7f95@lunn.ch>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com

On Sat, 26 Jul 2025 23:05:33 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> > There are currently 4 PHY drivers that can drive downstream SFPs:
> > marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> > logic is boilerplate, either calling into generic phylib helpers (for
> > SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> > bit of validation :
> >  - Getting the module's expected interface mode
> >  - Making sure the PHY supports it
> >  - Optionnaly perform some configuration to make sure the PHY outputs  
> 
> Too man n's.
> 
> > +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> > +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);  
> 
> Strictly speeding, this is not allowed, reverse Christmas tree...
> 
> The assignment needs to move into the body of the function.
> 
> > +	if (linkmode_empty(sfp_support)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> > +
> > +	/* Check that this interface is supported */
> > +	if (!test_bit(iface, port->interfaces)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");  
> 
> Maybe make this string different to the previous one, so somebody
> debugging issues knows which happened?
> 
> > +/**
> > + * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
> > + * @phydev: pointer to the PHY device to get the SFP port from
> > + *
> > + * Returns: The first active SFP (serdes) port of a PHY device, NULL if none
> > + * exist.
> > + */
> > +struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
> > +{
> > +	struct phy_port *port;
> > +
> > +	list_for_each_entry(port, &phydev->ports, head)
> > +		if (port->active && port->is_mii)  
> 
> Naming is hard, but this actually returns the first mii port.  Is
> there a clear 1:1 mapping? I don't think i've ever seen it, but such a
> SERDES port could be connected to a Ethernet switch? And when you get
> further, add support for a MUX, could it be connected to a MUX?

Hmmm correct, that's a bit fragile. With a mux or a switch that could
be different indeed. There may even be PHYs with 2 MII interfaces one
day ?

So yes it's most of a time a 1:1 mapping but it doesn't have to, I'll
see how I can make that more reliable...

Thanks for the review,

Maxim


