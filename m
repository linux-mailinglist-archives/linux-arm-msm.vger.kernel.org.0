Return-Path: <linux-arm-msm+bounces-59657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9AFAC6417
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 10:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD73C7A6FA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 08:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9912690F6;
	Wed, 28 May 2025 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GmmKet9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB786253B67;
	Wed, 28 May 2025 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420082; cv=none; b=XuddlnJKLaSeIy4q2u2SxNSxV+Y9SnSY4dLKrr3u8+uPZ2Us988m6OPpFx1GmCVXxa22myaZx7ImpAn83ohj66zcQOWb3gJIijsUy9DRoRYXvbh44ubdx2CFPoEXiMcB9ZpgQUImzuU7Zna4bE1VZjU53kg5TNAQoLTXQFCi1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420082; c=relaxed/simple;
	bh=wt48bzl9Te9AiJKom6zAeexyDvlkvDseB24S8SUK4Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saT5mbmvtXZT24QuepZG2PxQYkP/EFX5/9C9u6AbYdi3SBCYbqEex4lmJF9hzhsSfhE3oCXgvB2p6vGmQu2JtxKI16MYS6Yh7MB4cSYRMM5VKKKBH/tw1ahDoe0obFpdA7CEvSoTG5XNkQ6/Zl8+Y6kLTHtUL1M+JCgYeOx7nt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GmmKet9p; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1870B433B8;
	Wed, 28 May 2025 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748420077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmfTvvPStnYNFbapNxW0qFHGxJZE9z8RXtIY6Yccn4A=;
	b=GmmKet9pX4CZPw9vI2RkFp/fskWOZW5hzm+5bATRMs6c2CGqeUyOozqvUoX/cRCytBBJeF
	RYIKU/EbxzcFCEvO8+961dKMO0gU8QgqDzL9HTYRldcw0qvKx/FUDBQQZhSFXtjn5yycYy
	c0bv7PZO0Aztx2iSYbXaazwJ/y3hhG0X7AKwiWIM2LPaUKyOo+2i+fem4AdyJ8D0n0z3uR
	HNpQr1YzhybeV/vq5eZUrWDI1u7t12V7euX9kUmuLmMeLPTiKkBcxEsqvLvTHDOGkFrAL/
	TyPLnZFmGsQXo54XMeOVOxdAR0stbcp/o8qD9dJeHbwgpXd2GbtI1R8cL6L5Pw==
Date: Wed, 28 May 2025 10:14:33 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Daniel Golle
 <daniel@makrotopia.org>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 06/14] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <20250528101433.138b2f31@device-24.home>
In-Reply-To: <13770694.uLZWGnKmhe@fw-rgant>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<23936783.6Emhk5qWAg@fw-rgant>
	<20250523145457.07b1e7db@2a02-8428-0f40-1901-f412-2f85-a503-26ba.rev.sfr.net>
	<13770694.uLZWGnKmhe@fw-rgant>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepuggvvhhitggvqddvgedrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhop
 ehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Romain

On Wed, 28 May 2025 09:35:35 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> On Friday, 23 May 2025 14:54:57 CEST Maxime Chevallier wrote:
> > Hi Romain,
> > 
> > On Mon, 12 May 2025 10:38:52 +0200
> > 
> > Romain Gantois <romain.gantois@bootlin.com> wrote:  
> > > Hi Maxime,
> > > 
> > > On Wednesday, 7 May 2025 15:53:22 CEST Maxime Chevallier wrote:  
> > > > There are currently 4 PHY drivers that can drive downstream SFPs:
> > > > marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> > > > logic is boilerplate, either calling into generic phylib helpers (for
> > > > SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> > > > 
> > > > bit of validation :
> > > >  - Getting the module's expected interface mode
> > > >  - Making sure the PHY supports it
> > > >  - Optionnaly perform some configuration to make sure the PHY outputs
> > > >  
> > > >    the right mode
> > > > 
> > > > This can be made more generic by leveraging the phy_port, and its
> > > > configure_mii() callback which allows setting a port's interfaces when
> > > > the port is a serdes.
> > > > 
> > > > Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
> > > > bus itself, but an SFP phandle is found in devicetree/firmware, then the
> > > > generic PHY SFP support will be used, relying on port ops.
> > > > 
> > > > PHY driver need to :
> > > >  - Register a .attach_port() callback
> > > >  - When a serdes port is registered to the PHY, drivers must set
> > > >  
> > > >    port->interfaces to the set of PHY_INTERFACE_MODE the port can output
> > > >  
> > > >  - If the port has limitations regarding speed, duplex and aneg, the
> > > >  
> > > >    port can also fine-tune the final linkmodes that can be supported
> > > >  
> > > >  - The port may register a set of ops, including .configure_mii(), that
> > > >  
> > > >    will be called at module_insert time to adjust the interface based on
> > > >    the module detected.
> > > > 
> > > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > ---
> > > > 
> > > >  drivers/net/phy/phy_device.c | 107 +++++++++++++++++++++++++++++++++++
> > > >  include/linux/phy.h          |   2 +
> > > >  2 files changed, 109 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> > > > index aaf0eccbefba..aca3a47cbb66 100644
> > > > --- a/drivers/net/phy/phy_device.c
> > > > +++ b/drivers/net/phy/phy_device.c
> > > > @@ -1450,6 +1450,87 @@ void phy_sfp_detach(void *upstream, struct
> > > > sfp_bus
> > > > *bus) }
> > > > 
> > > >  EXPORT_SYMBOL(phy_sfp_detach);
> > > > 
> > > > +static int phy_sfp_module_insert(void *upstream, const struct
> > > > sfp_eeprom_id *id) +{
> > > > +	struct phy_device *phydev = upstream;
> > > > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > > > +  
> > > 
> > > RCT  
> > 
> > Can't be done here, it won't build if in the other order...
> >   
> 
> You could always separate the declaration from the assignment, I've seen that 
> done quite a lot to keep things in RCT.
> 
> > > > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> > > > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > > > +	phy_interface_t iface;
> > > > +
> > > > +	linkmode_zero(sfp_support);
> > > > +
> > > > +	if (!port)
> > > > +		return -EINVAL;
> > > > +
> > > > +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> > > > +
> > > > +	if (phydev->n_ports == 1)
> > > > +		phydev->port = sfp_parse_port(phydev->sfp_bus, id,  
> > > 
> > > sfp_support);
> > > 
> > > As mentionned below, this check looks a bit strange to me. Why are we only
> > > parsing the SFP port if the PHY device only has one registered port?  
> > 
> > Because phydev->port is global to the PHY. If we have another port,
> > then phydev->port must be handled differently so that SFP insertion /
> > removal doesn't overwrite what the other port is.
> >   
> 
> Okay, I see, thanks for explaining.
> 
> > Handling of phydev->port is still fragile in this state of the series,
> > I'll try to improve on that for V7 and document it better.
> >   
> > > > +
> > > > +	linkmode_and(sfp_support, port->supported, sfp_support);
> > > > +
> > > > +	if (linkmode_empty(sfp_support)) {
> > > > +		dev_err(&phydev->mdio.dev, "incompatible SFP module  
> > > 
> > > inserted\n");
> > >   
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> > > > +
> > > > +	/* Check that this interface is supported */
> > > > +	if (!test_bit(iface, port->interfaces)) {
> > > > +		dev_err(&phydev->mdio.dev, "incompatible SFP module  
> > > 
> > > inserted\n");
> > >   
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	if (port->ops && port->ops->configure_mii)
> > > > +		return port->ops->configure_mii(port, true, iface);  
> > > 
> > > The name "configure_mii()" seems a bit narrow-scoped to me, as this
> > > callback might have to configure something else than a MII link. For
> > > example, if a DAC SFP module is inserted, the downstream side of the
> > > transciever will have to be configured to 1000Base-X or something
> > > similar.  
> > 
> > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > PHY_INTERFACE_MODE_1000BASEX).
> >   
> 
> Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes you're 
> right.
> 
> > > I'd suggest something like "post_sfp_insert()", please let me know what
> > > you
> > > think.  
> > 
> > That's not intended to be SFP-specific though. post_sfp_insert() sounds
> > lke the narrow-scoped name to me :) Here we are dealing with a PHy that
> > has a media-side port that isn't a MDI port, but an MII interface like
> > a MAC would usually export. There may be an SFP here, or something else
> > entirely :)
> >   
> 
> Is that callback really not meant to be SFP-specific? It's only called from 
> phy_sfp_module_insert() though.

Well for now yeah as this is the only user now, but ports are meant to
be about more than drving SFPs.

This series as of today is quite long but doesn't cover the other
classes of use-cases which are non-phy-driven ports.

Taking the example of the Turris Omnia, we have something like that :

      +------------------+ 
      | MUX  +--------+  |
      |    +-| port 1 | --- SGMII - PHY
      |    | +--------+  |
MAC -------+             |
      |    | +--------+  |
      |    +-| port 2 | ---- SGMII/1000BaseX - SFP
      |      +--------+  |
      +------------------+

Here we have 1 mac that drives 2 ports through a MUX. So the ports here
would be driven by the mux driver (which I have a framewrok for ready to
send once this series lands). The goal would be to use the same
phy_port representation for these 2 ports, the .configure_mii()
callback will be used to switch between ports (so, perform the muxing),
then the rest of the stack takes over through the usual means (phylink,
phylib and all that). So here, the .configure_mii() ops doesn't
necessarily drives an SFP :)

Maxime

