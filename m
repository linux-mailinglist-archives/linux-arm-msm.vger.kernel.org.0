Return-Path: <linux-arm-msm+bounces-59658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F22AC643D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 10:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C81499E4885
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 08:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4E6248867;
	Wed, 28 May 2025 08:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TzGTVOWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C711E5B7E;
	Wed, 28 May 2025 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420189; cv=none; b=tPCqgyu/Eqhp6EKDgBc40XkER7E971EZxYG2vXeZMVSa297GOGcBTBkD9S/+cZqlPYpYBbPzPi+t6Nu+oU0DxDZFexu5xfIe5HS+sVj+Dt357pQnqYIh41m9MydV4J/Et7VR0i8y2Pig5cEhN1H7mxttLz0oGYs+mV3NrKBCyYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420189; c=relaxed/simple;
	bh=N+Qh65Pwk27kNqtp7q29PX/b7gyohJLkykeeaeJQuLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2B41S585cW49D8rHcH0Ktlq06JhEWKnGl7pqT4JySKt1qryvlkapX6pOKTwvK/84hPTqXABI+4PiACzLBQ3gqLbSMqPTN/NrlSurXTy4iyXdZQllDDyFioVgxDmxScb07DoG9TGtnQNFU0kkoZHleVb+XyAm9eF9E+IL7V98SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TzGTVOWS; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34DE94316E;
	Wed, 28 May 2025 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748420179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WOFwRpfANHjb3otGmi54M/pace4GHz369sqF3SK7s9s=;
	b=TzGTVOWSeG0ERVh6bKRs0qdcd1m4lV9KndnAXHTDn+w0KnetXd6u8qnR2pZE1KaHPgEwvr
	/M5TGa6cqjIMBT4UNKZ9B0A/yDb+5PETGbCK51oYkMEurLG2E//hkP9grtvki06EhUme/6
	5wdnrCQM0mFBis0HYzTirGmtYz4dF/1SFqRKsw0BLWXJ5soCgTIXLG2ScFmE826gDbyS9A
	d9fzlH2C07VkJ594+dekbfvD16jIFRzvwYUHAiuOv5ncJF1YeU6iAf6j/RNGwYwPpehNzn
	ixUxRR2asqalM/HBulxvSYbxSWsssaXE0mlL0CQfBNz6LWE8N2k+4IhFEgxixg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?B?Tmljb2zDsg==?= Veronese <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject:
 Re: [PATCH net-next v6 06/14] net: phy: Introduce generic SFP handling for
 PHY drivers
Date: Wed, 28 May 2025 10:16:12 +0200
Message-ID: <2915123.mvXUDI8C0e@fw-rgant>
In-Reply-To: <20250528101433.138b2f31@device-24.home>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <13770694.uLZWGnKmhe@fw-rgant> <20250528101433.138b2f31@device-24.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12805152.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkv
 ghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart12805152.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Wed, 28 May 2025 10:16:12 +0200
Message-ID: <2915123.mvXUDI8C0e@fw-rgant>
In-Reply-To: <20250528101433.138b2f31@device-24.home>
MIME-Version: 1.0

On Wednesday, 28 May 2025 10:14:33 CEST Maxime Chevallier wrote:
> Hi Romain
> 
> On Wed, 28 May 2025 09:35:35 +0200
> 
> Romain Gantois <romain.gantois@bootlin.com> wrote:
> > On Friday, 23 May 2025 14:54:57 CEST Maxime Chevallier wrote:
> > > Hi Romain,
> > > 
> > > On Mon, 12 May 2025 10:38:52 +0200
> > > 
> > > Romain Gantois <romain.gantois@bootlin.com> wrote:
> > > > Hi Maxime,
> > > > 
> > > > On Wednesday, 7 May 2025 15:53:22 CEST Maxime Chevallier wrote:
> > > > > There are currently 4 PHY drivers that can drive downstream SFPs:
> > > > > marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> > > > > logic is boilerplate, either calling into generic phylib helpers
> > > > > (for
> > > > > SFP PHY attach, bus attach, etc.) or performing the same tasks with
> > > > > a
> > > > > 
> > > > > bit of validation :
> > > > >  - Getting the module's expected interface mode
> > > > >  - Making sure the PHY supports it
> > > > >  - Optionnaly perform some configuration to make sure the PHY
> > > > >  outputs
> > > > >  
> > > > >    the right mode
> > > > > 
> > > > > This can be made more generic by leveraging the phy_port, and its
> > > > > configure_mii() callback which allows setting a port's interfaces
> > > > > when
> > > > > the port is a serdes.
> > > > > 
> > > > > Introduce a generic PHY SFP support. If a driver doesn't probe the
> > > > > SFP
> > > > > bus itself, but an SFP phandle is found in devicetree/firmware, then
> > > > > the
> > > > > generic PHY SFP support will be used, relying on port ops.
> > > > > 
> > > > > PHY driver need to :
> > > > >  - Register a .attach_port() callback
> > > > >  - When a serdes port is registered to the PHY, drivers must set
> > > > >  
> > > > >    port->interfaces to the set of PHY_INTERFACE_MODE the port can
> > > > >    output
> > > > >  
> > > > >  - If the port has limitations regarding speed, duplex and aneg, the
> > > > >  
> > > > >    port can also fine-tune the final linkmodes that can be supported
> > > > >  
> > > > >  - The port may register a set of ops, including .configure_mii(),
> > > > >  that
> > > > >  
> > > > >    will be called at module_insert time to adjust the interface
> > > > >    based on
> > > > >    the module detected.
> > > > > 
> > > > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > > ---
> > > > > 
> > > > >  drivers/net/phy/phy_device.c | 107
> > > > >  +++++++++++++++++++++++++++++++++++
> > > > >  include/linux/phy.h          |   2 +
> > > > >  2 files changed, 109 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/net/phy/phy_device.c
> > > > > b/drivers/net/phy/phy_device.c
> > > > > index aaf0eccbefba..aca3a47cbb66 100644
> > > > > --- a/drivers/net/phy/phy_device.c
> > > > > +++ b/drivers/net/phy/phy_device.c
> > > > > @@ -1450,6 +1450,87 @@ void phy_sfp_detach(void *upstream, struct
> > > > > sfp_bus
> > > > > *bus) }
> > > > > 
> > > > >  EXPORT_SYMBOL(phy_sfp_detach);
> > > > > 
> > > > > +static int phy_sfp_module_insert(void *upstream, const struct
> > > > > sfp_eeprom_id *id) +{
> > > > > +	struct phy_device *phydev = upstream;
> > > > > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > > > > +
> > > > 
> > > > RCT
> > > 
> > > Can't be done here, it won't build if in the other order...
> > 
> > You could always separate the declaration from the assignment, I've seen
> > that done quite a lot to keep things in RCT.
> > 
> > > > > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> > > > > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > > > > +	phy_interface_t iface;
> > > > > +
> > > > > +	linkmode_zero(sfp_support);
> > > > > +
> > > > > +	if (!port)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, 
interfaces);
> > > > > +
> > > > > +	if (phydev->n_ports == 1)
> > > > > +		phydev->port = sfp_parse_port(phydev->sfp_bus, id,
> > > > 
> > > > sfp_support);
> > > > 
> > > > As mentionned below, this check looks a bit strange to me. Why are we
> > > > only
> > > > parsing the SFP port if the PHY device only has one registered port?
> > > 
> > > Because phydev->port is global to the PHY. If we have another port,
> > > then phydev->port must be handled differently so that SFP insertion /
> > > removal doesn't overwrite what the other port is.
> > 
> > Okay, I see, thanks for explaining.
> > 
> > > Handling of phydev->port is still fragile in this state of the series,
> > > I'll try to improve on that for V7 and document it better.
> > > 
> > > > > +
> > > > > +	linkmode_and(sfp_support, port->supported, sfp_support);
> > > > > +
> > > > > +	if (linkmode_empty(sfp_support)) {
> > > > > +		dev_err(&phydev->mdio.dev, "incompatible SFP module
> > > > 
> > > > inserted\n");
> > > > 
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> > > > > +
> > > > > +	/* Check that this interface is supported */
> > > > > +	if (!test_bit(iface, port->interfaces)) {
> > > > > +		dev_err(&phydev->mdio.dev, "incompatible SFP module
> > > > 
> > > > inserted\n");
> > > > 
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	if (port->ops && port->ops->configure_mii)
> > > > > +		return port->ops->configure_mii(port, true, iface);
> > > > 
> > > > The name "configure_mii()" seems a bit narrow-scoped to me, as this
> > > > callback might have to configure something else than a MII link. For
> > > > example, if a DAC SFP module is inserted, the downstream side of the
> > > > transciever will have to be configured to 1000Base-X or something
> > > > similar.
> > > 
> > > In that regard, you can consider 1000BaseX as a MII mode (we do have
> > > PHY_INTERFACE_MODE_1000BASEX).
> > 
> > Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes
> > you're
> > right.
> > 
> > > > I'd suggest something like "post_sfp_insert()", please let me know
> > > > what
> > > > you
> > > > think.
> > > 
> > > That's not intended to be SFP-specific though. post_sfp_insert() sounds
> > > lke the narrow-scoped name to me :) Here we are dealing with a PHy that
> > > has a media-side port that isn't a MDI port, but an MII interface like
> > > a MAC would usually export. There may be an SFP here, or something else
> > > entirely :)
> > 
> > Is that callback really not meant to be SFP-specific? It's only called
> > from
> > phy_sfp_module_insert() though.
> 
> Well for now yeah as this is the only user now, but ports are meant to
> be about more than drving SFPs.
> 
> This series as of today is quite long but doesn't cover the other
> classes of use-cases which are non-phy-driven ports.
> 
> Taking the example of the Turris Omnia, we have something like that :
> 
>       +------------------+
> 
>       | MUX  +--------+  |
>       | 
>       |    +-| port 1 | --- SGMII - PHY
>       |    
>       |    | +--------+  |
> 
> MAC -------+             |
> 
>       |    | +--------+  |
>       |    
>       |    +-| port 2 | ---- SGMII/1000BaseX - SFP
>       |    
>       |      +--------+  |
> 
>       +------------------+
> 
> Here we have 1 mac that drives 2 ports through a MUX. So the ports here
> would be driven by the mux driver (which I have a framewrok for ready to
> send once this series lands). The goal would be to use the same
> phy_port representation for these 2 ports, the .configure_mii()
> callback will be used to switch between ports (so, perform the muxing),
> then the rest of the stack takes over through the usual means (phylink,
> phylib and all that). So here, the .configure_mii() ops doesn't
> necessarily drives an SFP :)

I see, thanks again for explaining.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart12805152.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg2xkwACgkQ3R9U/FLj
2871iRAAgQamZldk5/l3rtmKpYjN6tVlCAfp8Itpq7UsG+NBnJHjGKDhdNt5KLMt
P44MHwli5WlyRVXuIYYA3XxilyqAKUkBaMQBWPzg4mZbaZGSPJl1uVanurWkE7lJ
y7KWe/LiVDdTkOTvstzlPCqPMsj7bhmoezTlQsWJZSO5XKQHXIxK/pMHSHvLopm1
ev5g4RW0uvLk5JyvZQJsUKBr2ImQLAcy1yszQgpGGSjrRFNCR3LN9tdJdrkEKzid
R2h8CMjvRdZ/G8B1RUITv7F9QnA3Sie28dKVLzFQqBbD/bTAiWhSJ5pV1Pmvevql
W6hNt7gQsNPWnZYIUJ5L48iLd8pXuypaDpsWcNZOW+BZkCzpdu5TMURHQHoLM8NO
7ocpwL7e0PSmY2opOy5WEiBMbruvm23d/BZJQxJWJOWjSbjgXjpts5GMcllKjwxG
J8Nl26Y0S1luX/CDaqF8p1eX4ACqCSkep9uc4kVOr2tawffXC2GLInXbNtY00kWT
oFKyZmTIYBPgmM++EeduBEEV+JAXdWcQDNmIqKr6hljL+OdDHjL6syrtTfgjgIEO
rfTXYKSP7wpSgiZ1UKTMvo0F+QEjllLLxQ6pE1aQVZJ9K5KrecpnvSDMf6xA2YYv
M6LGxBfbzDXilciejANK/66uoAfFw9CNjNfeyPonBnVq65700gc=
=a0JB
-----END PGP SIGNATURE-----

--nextPart12805152.O9o76ZdvQC--




