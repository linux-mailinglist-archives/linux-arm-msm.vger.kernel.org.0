Return-Path: <linux-arm-msm+bounces-59654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 491FFAC6324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40F21896AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 07:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3742459FE;
	Wed, 28 May 2025 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WE0eBuaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743DA244665;
	Wed, 28 May 2025 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417749; cv=none; b=m+o8q+laMGSrk0WRE668Sl/ui8RLJFo5DR7NVZPzGIcJooOYmz+CDHgtJ9Cg6Ja4Yr9BGY48KKZpAg81hpuGa4Jmh3FQzrOJIpKqnAccQHvIIRme/3nyVeJr+P0jF1tw+qLvnOdqjTk73tslnJb/LeAGi7zA5lPiowwZkQRGxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417749; c=relaxed/simple;
	bh=S8P+yvbmk0wVDGTl+t/UnoLEXNQG5E82HLv9m3qBVhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NckJUJafvFo8VB4vs2y3aC0sJcRNdvcWE6pA996ztpV4rL59lPV9bUH2Yeu0e03rRuCWQw2GYQtklbxZECdaHmBkOjBFMKYvNM7WooweZZGTeBz9kZbciXDHZbuYkLPNejpIkTD12dk/GddwCCO6ICSdTNual3Wtf4RJLVvAyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WE0eBuaE; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FC4C1FCF7;
	Wed, 28 May 2025 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748417743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qZet8K57aFf7MLwllx+Xr4zoaf0VAd/thbkHyxlDE/A=;
	b=WE0eBuaEKnP5zoS7G34uEJE4OlxRIIPdghO+W0Dzl/2r+BsoQ8V0c9/rgQzO1aH3EtA4I9
	XIiQodWp8YH5Ato2OLO/mD4/8e8TByFpHARy2p4IlVdweBPmpPYKp68ldAd5URk44W9i/D
	KpOAfykW8CyWDgsnbHvuBDZZOx/kP8HALXY6zpxQm0nwaLnutRkczG12uO6i5LeJxD53x+
	zTG5N4Mt+bkdx+vOhxlAytUMY75bxid4PAyffkuGoZVvTerJDrD5kLAwL8WUhHpSBw2N1l
	9VURF1FcbKejrkdSfagsPZzQoRJ8mLcblH4te9SRAZumM4JsPcaU1PuACdGLbw==
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
Date: Wed, 28 May 2025 09:35:35 +0200
Message-ID: <13770694.uLZWGnKmhe@fw-rgant>
In-Reply-To:
 <20250523145457.07b1e7db@2a02-8428-0f40-1901-f412-2f85-a503-26ba.rev.sfr.net>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <23936783.6Emhk5qWAg@fw-rgant>
 <20250523145457.07b1e7db@2a02-8428-0f40-1901-f412-2f85-a503-26ba.rev.sfr.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2992374.e9J7NaK4W3";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdeijeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkv
 ghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart2992374.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Wed, 28 May 2025 09:35:35 +0200
Message-ID: <13770694.uLZWGnKmhe@fw-rgant>
MIME-Version: 1.0

On Friday, 23 May 2025 14:54:57 CEST Maxime Chevallier wrote:
> Hi Romain,
> 
> On Mon, 12 May 2025 10:38:52 +0200
> 
> Romain Gantois <romain.gantois@bootlin.com> wrote:
> > Hi Maxime,
> > 
> > On Wednesday, 7 May 2025 15:53:22 CEST Maxime Chevallier wrote:
> > > There are currently 4 PHY drivers that can drive downstream SFPs:
> > > marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> > > logic is boilerplate, either calling into generic phylib helpers (for
> > > SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> > > 
> > > bit of validation :
> > >  - Getting the module's expected interface mode
> > >  - Making sure the PHY supports it
> > >  - Optionnaly perform some configuration to make sure the PHY outputs
> > >  
> > >    the right mode
> > > 
> > > This can be made more generic by leveraging the phy_port, and its
> > > configure_mii() callback which allows setting a port's interfaces when
> > > the port is a serdes.
> > > 
> > > Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
> > > bus itself, but an SFP phandle is found in devicetree/firmware, then the
> > > generic PHY SFP support will be used, relying on port ops.
> > > 
> > > PHY driver need to :
> > >  - Register a .attach_port() callback
> > >  - When a serdes port is registered to the PHY, drivers must set
> > >  
> > >    port->interfaces to the set of PHY_INTERFACE_MODE the port can output
> > >  
> > >  - If the port has limitations regarding speed, duplex and aneg, the
> > >  
> > >    port can also fine-tune the final linkmodes that can be supported
> > >  
> > >  - The port may register a set of ops, including .configure_mii(), that
> > >  
> > >    will be called at module_insert time to adjust the interface based on
> > >    the module detected.
> > > 
> > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > ---
> > > 
> > >  drivers/net/phy/phy_device.c | 107 +++++++++++++++++++++++++++++++++++
> > >  include/linux/phy.h          |   2 +
> > >  2 files changed, 109 insertions(+)
> > > 
> > > diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> > > index aaf0eccbefba..aca3a47cbb66 100644
> > > --- a/drivers/net/phy/phy_device.c
> > > +++ b/drivers/net/phy/phy_device.c
> > > @@ -1450,6 +1450,87 @@ void phy_sfp_detach(void *upstream, struct
> > > sfp_bus
> > > *bus) }
> > > 
> > >  EXPORT_SYMBOL(phy_sfp_detach);
> > > 
> > > +static int phy_sfp_module_insert(void *upstream, const struct
> > > sfp_eeprom_id *id) +{
> > > +	struct phy_device *phydev = upstream;
> > > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > > +
> > 
> > RCT
> 
> Can't be done here, it won't build if in the other order...
> 

You could always separate the declaration from the assignment, I've seen that 
done quite a lot to keep things in RCT.

> > > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> > > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > > +	phy_interface_t iface;
> > > +
> > > +	linkmode_zero(sfp_support);
> > > +
> > > +	if (!port)
> > > +		return -EINVAL;
> > > +
> > > +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> > > +
> > > +	if (phydev->n_ports == 1)
> > > +		phydev->port = sfp_parse_port(phydev->sfp_bus, id,
> > 
> > sfp_support);
> > 
> > As mentionned below, this check looks a bit strange to me. Why are we only
> > parsing the SFP port if the PHY device only has one registered port?
> 
> Because phydev->port is global to the PHY. If we have another port,
> then phydev->port must be handled differently so that SFP insertion /
> removal doesn't overwrite what the other port is.
> 

Okay, I see, thanks for explaining.

> Handling of phydev->port is still fragile in this state of the series,
> I'll try to improve on that for V7 and document it better.
> 
> > > +
> > > +	linkmode_and(sfp_support, port->supported, sfp_support);
> > > +
> > > +	if (linkmode_empty(sfp_support)) {
> > > +		dev_err(&phydev->mdio.dev, "incompatible SFP module
> > 
> > inserted\n");
> > 
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> > > +
> > > +	/* Check that this interface is supported */
> > > +	if (!test_bit(iface, port->interfaces)) {
> > > +		dev_err(&phydev->mdio.dev, "incompatible SFP module
> > 
> > inserted\n");
> > 
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (port->ops && port->ops->configure_mii)
> > > +		return port->ops->configure_mii(port, true, iface);
> > 
> > The name "configure_mii()" seems a bit narrow-scoped to me, as this
> > callback might have to configure something else than a MII link. For
> > example, if a DAC SFP module is inserted, the downstream side of the
> > transciever will have to be configured to 1000Base-X or something
> > similar.
> 
> In that regard, you can consider 1000BaseX as a MII mode (we do have
> PHY_INTERFACE_MODE_1000BASEX).
> 

Ugh, the "1000BaseX" terminology never ceases to confuse me, but yes you're 
right.

> > I'd suggest something like "post_sfp_insert()", please let me know what
> > you
> > think.
> 
> That's not intended to be SFP-specific though. post_sfp_insert() sounds
> lke the narrow-scoped name to me :) Here we are dealing with a PHy that
> has a media-side port that isn't a MDI port, but an MII interface like
> a MAC would usually export. There may be an SFP here, or something else
> entirely :)
> 

Is that callback really not meant to be SFP-specific? It's only called from 
phy_sfp_module_insert() though.

> One thing though is that this series uses a mix of "is_serdes" and
> "configure_mii" to mean pretty-much the same thing, I'll make the names
> a bit more homogenous.
> 

Sure, sounds good.

> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void phy_sfp_module_remove(void *upstream)
> > > +{
> > > +	struct phy_device *phydev = upstream;
> > > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > > +
> > > +	if (port && port->ops && port->ops->configure_mii)
> > > +		port->ops->configure_mii(port, false, PHY_INTERFACE_MODE_NA);
> > > +
> > > +	if (phydev->n_ports == 1)
> > > +		phydev->port = PORT_NONE;
> > 
> > This check is a bit confusing to me. Could you please explain why you're
> > only setting the phydev's SFP port to PORT_NONE if the PHY device only
> > has one registered port? Shouldn't this be done regardless?
> 
> So that we don't overwrite what the other port would have set :) but,
> that's a bit fragile as I said and probably not correct anyways, let me
> double-check that.
> 

All right, that makes sense given what you've already told me.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart2992374.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg2vMcACgkQ3R9U/FLj
284fQw//bXvaaOClw8PTi+x2VP1IslHsH/yhIqqOayUREQePqHxHPAQ0n9mEG7bV
lYBrv1wJQ7RJlch/c7N1vG5ATGmi5M1YkatEWDgljwGH7GGkPght0TUfRp7mVx5W
1T+Cm6L6h/Xj7+VSorgiT+bbBlbYAtwv0MHw4+8S6cn0vj4nFyxhXoN/dALln5Pj
O03Fsd4E7T1nplOzC6uo0cdv4QwINrPDVd80rzv/LNbXjz8to0dIz9hBD2gB8Bjx
f3gffOH0APTtZyzL8KIWePR8PmBAlu+zpx2XVy1xLhMXQSboiEdFtsxATBSkv++w
P7UvJ9vaAXfuUMAjcF2T1fe2ECUoRgmayFaNYDLOEs7N2y2a5j3g6oMFi0jrrovv
PtyrRIEX+c22+v1VS/OjrNdKdtaSDe4ryvDZQr0tU3fTXEybHf0NqDYVY/eJtDvK
f5C+EtOtIKKxAYwGn0SkFwKfCdVRYeeh9c7+0OtU/s9VPtsoG77a6C1SQ3P32xO8
7vrSHOHfyqy4uFuwTmheAl8/hrh0tq2iTf46EdicJfBJKF/7873krpXkSLyGPwCK
mgx4h2pp1XLblD6cI7mUu/zWuhlp2wpJeTDFO9sz9Odh8mup1h4BlxumSimsKCYH
NAUp4JHDQkX6I/Cm8ZYuoNCbnvYsY2JwMZPDJJb6Z3SQ6c95Nok=
=GM9s
-----END PGP SIGNATURE-----

--nextPart2992374.e9J7NaK4W3--




