Return-Path: <linux-arm-msm+bounces-67700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E71B1A3D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CAC17373B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024E3261585;
	Mon,  4 Aug 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BnZFOCJH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221025A341;
	Mon,  4 Aug 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754315484; cv=none; b=KGOgsUP9kqd8yAqkaQTpdFAQ5EC2je5iz08+mGO4eMEM49+zcmzpIM66txgRwiAUSwyCvtFvMaiv9PPDwmchZtB3BJDWEvqYUqn9tc8GQyfcfnQ992yW5EqawwdYHgNSBTEA2CN8K9ZjgZ/wB+u1P4Cv3P5ofytAE7HaSMDQDWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754315484; c=relaxed/simple;
	bh=Nsz+garcN3m9scPRfLN+0iCsurhlWiVp1tA48TmESRI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ntEkxoFhuMoI2SzfYa2EkyUoEG0kP6DGn/VgwbF8+o4+N1Odia7cm13pbsH90x1kaDpFBVYzm/ucQ9vdThSewImu1OdLdIfHj124fDACjlRW/ZHB6KnfdAK1FAPUnQlKxs9RbKAawmmzNCspMRE7+tsREWd0dZ3LAelix6KIzvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BnZFOCJH; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28CA242D7F;
	Mon,  4 Aug 2025 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hP+zIvyoBGYMCE15FD3haQLr1XBrKDkbsIDrg0+NHfc=;
	b=BnZFOCJH/+d+WMYUzst8s3sUTgn/XaS7tm0B2eDJh9galaxY99J9zWvefMBQEydZd61EMw
	zfSmFBZ7gPuFdvl+ZIfFR6X/GRpKH9m7QRoozJ8OsF3VRtRnPaQvtadqCz5vqeIojhRkBW
	1pZtykKv0y+HtV/JhvELF7yCkT21wpEJJEWxhzJPDXAKV32STBKZ5qPg3uNTHfgu5H76Q+
	WIVjMsu7m17+jqaMdAQHjvq+JZYLLRRb9GSrGflPeJra96yjkawBeR6mnJUWcJNInWiKE5
	lLydblU3gPYygdpL0/JchNuQesvgKJxvVW8U7zm/pmS9Wib4TgDGJFFOQPf9gg==
Date: Mon, 4 Aug 2025 15:51:15 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
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
Message-ID: <20250804155115.4a301cdc@fedora.home>
In-Reply-To: <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-8-maxime.chevallier@bootlin.com>
	<aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlr
 dhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

On Sun, 27 Jul 2025 10:56:52 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> > +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> > +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > +
> > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > +	phy_interface_t iface;
> > +
> > +	linkmode_zero(sfp_support);
> > +
> > +	if (!port)
> > +		return -EINVAL;
> > +
> > +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> > +
> > +	if (phydev->n_ports == 1)
> > +		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
> > +
> > +	linkmode_and(sfp_support, port->supported, sfp_support);
> > +
> > +	if (linkmode_empty(sfp_support)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);  
> 
> I've been moving phylink away from using sfp_select_interface() because
> it requires two stages of translation - one from the module capabilties
> to linkmodes, and then linkmodes to interfaces.
> 
> sfp_parse_support() now provides the interfaces that the optical module
> supports, and the possible interfaces that a copper module _might_
> support (but we don't know for certain about that until we discover a
> PHY.)
> 
> The only place in phylink where this function continues to be used is
> when there's an optical module which supports multiple different
> speeds, and we need to select it based on the advertising mask provided
> by userspace. Everywhere else shouldn't use this function, but should
> instead use the interfaces returned from sfp_parse_support().

Thanks for the input, it'll make things even simpler so I'm all in for
that. I'll rework this for the next iteration, thanks a lot for taking
a look at this !

Maxime

> 


