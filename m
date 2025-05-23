Return-Path: <linux-arm-msm+bounces-59221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A08AC2324
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 14:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421DA1C04D9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D228286334;
	Fri, 23 May 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZEcDaO+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74F17A31C;
	Fri, 23 May 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004913; cv=none; b=Cs4gN+RRnVDObh8O5rB5a7r7IFdvpKMetdqeHznE3iLGF4zX3404rW1tmwpZtpri/8c8IG0RNtz8wBsOGDRvUfMsdpPaTy+afgg1uc1M7Yy4hURfwAGT5sYp9l7TrEu/NGXYSutgh85sRK5zNcD8ueZT0iY0zaXVhTanN8KrYko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004913; c=relaxed/simple;
	bh=LkNcq2xuHhljWbucXm13VtjJMEsWvLHCeMjsNIOmY+E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQzL//3biu0jtFbVWRUYLUP0ZESDRULs6zIobcA560CUrlZGOVtlPX55h1gtLf3zqeyFgn7rgaYU6zdxZd8/VY09bzHSR65QIm4RPD14l3vWjrnYAnbOyZ42/fcghixyKdyRj0B5aonI/H26qwO9iXOjORUZxHA7faud/WxT8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZEcDaO+l; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 066BA4399E;
	Fri, 23 May 2025 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748004903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1kgxapgqpqXKaidI+dwQyPPRpZm75jne3m7YkATlzkI=;
	b=ZEcDaO+l+3Vp/ktqUSPkwm5cuKaiXWUMMNrU2zxBnF0MSE8d5hkLY1smkK1u0miJXbuDwa
	mdCfeF4zZ9bKTHeZ4VOY3VO6MtPSrAzF7JjRdaxLvwzcjObPrFS+BKXNTOOU17/ZPCx/cG
	A8lSQNOuJSG11dP7Hbp5VbAlOCG+jEjOEdnEu8U5pVbjesJURt++hfQLazUlWQ+1bn4dPb
	2kShAqi1PvUmemBXbrlwE7FwvmJySFnBUOuic74F4xH108Yo4rXhtBeEaC0V0pq83E71qG
	A9bNjuApw8wGun0SuJpw9db90sBuSnwm1arA13qF3Q2sku6QK8AKeBe8NamGeQ==
Date: Fri, 23 May 2025 14:54:57 +0200
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
Message-ID: <20250523145457.07b1e7db@2a02-8428-0f40-1901-f412-2f85-a503-26ba.rev.sfr.net>
In-Reply-To: <23936783.6Emhk5qWAg@fw-rgant>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-7-maxime.chevallier@bootlin.com>
	<23936783.6Emhk5qWAg@fw-rgant>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekledtucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtvdemkeegvdekmehfgedtmeduledtudemfheguddvmedvfhekheemrgehtdefmedviegsrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfgedtmeduledtudemfheguddvmedvfhekheemrgehtdefmedviegsrgdphhgvlhhopedvrgdtvddqkeegvdekqddtfhegtddqudeltdduqdhfgeduvddqvdhfkeehqdgrhedtfedqvdeisggrrdhrvghvrdhsfhhrrdhnvghtpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Romain,

On Mon, 12 May 2025 10:38:52 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hi Maxime,
> 
> On Wednesday, 7 May 2025 15:53:22 CEST Maxime Chevallier wrote:
> > There are currently 4 PHY drivers that can drive downstream SFPs:
> > marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> > logic is boilerplate, either calling into generic phylib helpers (for
> > SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> > bit of validation :
> >  - Getting the module's expected interface mode
> >  - Making sure the PHY supports it
> >  - Optionnaly perform some configuration to make sure the PHY outputs
> >    the right mode
> > 
> > This can be made more generic by leveraging the phy_port, and its
> > configure_mii() callback which allows setting a port's interfaces when
> > the port is a serdes.
> > 
> > Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
> > bus itself, but an SFP phandle is found in devicetree/firmware, then the
> > generic PHY SFP support will be used, relying on port ops.
> > 
> > PHY driver need to :
> >  - Register a .attach_port() callback
> >  - When a serdes port is registered to the PHY, drivers must set
> >    port->interfaces to the set of PHY_INTERFACE_MODE the port can output
> >  - If the port has limitations regarding speed, duplex and aneg, the
> >    port can also fine-tune the final linkmodes that can be supported
> >  - The port may register a set of ops, including .configure_mii(), that
> >    will be called at module_insert time to adjust the interface based on
> >    the module detected.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  drivers/net/phy/phy_device.c | 107 +++++++++++++++++++++++++++++++++++
> >  include/linux/phy.h          |   2 +
> >  2 files changed, 109 insertions(+)
> > 
> > diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> > index aaf0eccbefba..aca3a47cbb66 100644
> > --- a/drivers/net/phy/phy_device.c
> > +++ b/drivers/net/phy/phy_device.c
> > @@ -1450,6 +1450,87 @@ void phy_sfp_detach(void *upstream, struct sfp_bus
> > *bus) }
> >  EXPORT_SYMBOL(phy_sfp_detach);
> > 
> > +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id
> > *id) +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > +  
> 
> RCT

Can't be done here, it won't build if in the other order...

> 
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
> > +		phydev->port = sfp_parse_port(phydev->sfp_bus, id,   
> sfp_support);
> 
> As mentionned below, this check looks a bit strange to me. Why are we only 
> parsing the SFP port if the PHY device only has one registered port?

Because phydev->port is global to the PHY. If we have another port,
then phydev->port must be handled differently so that SFP insertion /
removal doesn't overwrite what the other port is.

Handling of phydev->port is still fragile in this state of the series,
I'll try to improve on that for V7 and document it better.

> > +
> > +	linkmode_and(sfp_support, port->supported, sfp_support);
> > +
> > +	if (linkmode_empty(sfp_support)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module   
> inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> > +
> > +	/* Check that this interface is supported */
> > +	if (!test_bit(iface, port->interfaces)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module   
> inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (port->ops && port->ops->configure_mii)
> > +		return port->ops->configure_mii(port, true, iface);  
> 
> The name "configure_mii()" seems a bit narrow-scoped to me, as this callback 
> might have to configure something else than a MII link. For example, if a DAC 
> SFP module is inserted, the downstream side of the transciever will have to be 
> configured to 1000Base-X or something similar.

In that regard, you can consider 1000BaseX as a MII mode (we do have
PHY_INTERFACE_MODE_1000BASEX).

> I'd suggest something like "post_sfp_insert()", please let me know what you 
> think.

That's not intended to be SFP-specific though. post_sfp_insert() sounds
lke the narrow-scoped name to me :) Here we are dealing with a PHy that
has a media-side port that isn't a MDI port, but an MII interface like
a MAC would usually export. There may be an SFP here, or something else
entirely :)

One thing though is that this series uses a mix of "is_serdes" and
"configure_mii" to mean pretty-much the same thing, I'll make the names
a bit more homogenous.

> > +
> > +	return 0;
> > +}
> > +
> > +static void phy_sfp_module_remove(void *upstream)
> > +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > +
> > +	if (port && port->ops && port->ops->configure_mii)
> > +		port->ops->configure_mii(port, false, PHY_INTERFACE_MODE_NA);
> > +
> > +	if (phydev->n_ports == 1)
> > +		phydev->port = PORT_NONE;  
> 
> This check is a bit confusing to me. Could you please explain why you're only 
> setting the phydev's SFP port to PORT_NONE if the PHY device only has one 
> registered port? Shouldn't this be done regardless?

So that we don't overwrite what the other port would have set :) but,
that's a bit fragile as I said and probably not correct anyways, let me
double-check that.

Maxime


