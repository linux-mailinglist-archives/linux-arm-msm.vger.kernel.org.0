Return-Path: <linux-arm-msm+bounces-57591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED4AB31D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 10:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C4AB3B5A37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 08:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1155D257436;
	Mon, 12 May 2025 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PkHRUm+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C441D528;
	Mon, 12 May 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039144; cv=none; b=LmHofKQbHZHHEmtDber9V6YeO8nJLWPdXRQIJNrR5u5RJZ8Lc5Aoxjtb60kr/7bPberf7FuyVqS2Prwkb/2bI0fhxdzo76qR3JhvfzKr4Sc2LYgLpbcNIpvrOUKnB3Fxdt0EqBMSESggZjw8emwzSkn/TqGqRBmGpd0vTC4BOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039144; c=relaxed/simple;
	bh=L3aqGzgMRaim5pNrebRmy/pWTtf/ugG/uAv15SzoMV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UCj7CUyGwE39YrOCVQGSMLcq4lOekNCJR2F2ZaZG9tfgUrm9NgjTNzH1noKWAPaFmkIM7BXZoFMZWnvEP55Nsco8JymoRcIkOv9POHZdIFtWA9sZqeb7V7CLGy2piz95nC6UTh3fm2a3KBcMeCRm/3SXr/xcSHRy9e6hAaETdKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PkHRUm+j; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1B4643290;
	Mon, 12 May 2025 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747039139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XOD96s7LugVHFz30PvysbvlXbAJ1uhNxsx+QFxIwIG8=;
	b=PkHRUm+jGhCnCJ0LApHUd5UCMOIZPg2zCsGyTFhygXnBqKJ34sc+Am0w7lvkxQ36SjrAGj
	8jzPcfUUA2ELha/+4OC9sBRLZUM6Y8+Ikd57MDcGTRAiqT6iQMISokYSMm+HQy/ESCZkrA
	+N5Cjp4IEdBcWhc8Gmr9KG2UwkI3tDput4hHSo6n1PShVGHChOvKqDGXxV61w6TtMr0FWN
	YOhr6GFPwdedSKZ+ZP7wvG1Vqy4Je4NtF4HUtdSTAQEPx1eOIZEHKdRZj4nWh8+Naeltmr
	afUTnJJ9gZ2B6t9K7n3bTWp3w1DE7aI3macsbwFOSXPTJJCaIgbQx/MvZZgSeA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: davem@davemloft.net, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
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
Date: Mon, 12 May 2025 10:38:52 +0200
Message-ID: <23936783.6Emhk5qWAg@fw-rgant>
In-Reply-To: <20250507135331.76021-7-maxime.chevallier@bootlin.com>
References:
 <20250507135331.76021-1-maxime.chevallier@bootlin.com>
 <20250507135331.76021-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2655786.Lt9SDvczpP";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart2655786.Lt9SDvczpP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 May 2025 10:38:52 +0200
Message-ID: <23936783.6Emhk5qWAg@fw-rgant>
In-Reply-To: <20250507135331.76021-7-maxime.chevallier@bootlin.com>
MIME-Version: 1.0

Hi Maxime,

On Wednesday, 7 May 2025 15:53:22 CEST Maxime Chevallier wrote:
> There are currently 4 PHY drivers that can drive downstream SFPs:
> marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> logic is boilerplate, either calling into generic phylib helpers (for
> SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> bit of validation :
>  - Getting the module's expected interface mode
>  - Making sure the PHY supports it
>  - Optionnaly perform some configuration to make sure the PHY outputs
>    the right mode
> 
> This can be made more generic by leveraging the phy_port, and its
> configure_mii() callback which allows setting a port's interfaces when
> the port is a serdes.
> 
> Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
> bus itself, but an SFP phandle is found in devicetree/firmware, then the
> generic PHY SFP support will be used, relying on port ops.
> 
> PHY driver need to :
>  - Register a .attach_port() callback
>  - When a serdes port is registered to the PHY, drivers must set
>    port->interfaces to the set of PHY_INTERFACE_MODE the port can output
>  - If the port has limitations regarding speed, duplex and aneg, the
>    port can also fine-tune the final linkmodes that can be supported
>  - The port may register a set of ops, including .configure_mii(), that
>    will be called at module_insert time to adjust the interface based on
>    the module detected.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/phy_device.c | 107 +++++++++++++++++++++++++++++++++++
>  include/linux/phy.h          |   2 +
>  2 files changed, 109 insertions(+)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index aaf0eccbefba..aca3a47cbb66 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1450,6 +1450,87 @@ void phy_sfp_detach(void *upstream, struct sfp_bus
> *bus) }
>  EXPORT_SYMBOL(phy_sfp_detach);
> 
> +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id
> *id) +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);
> +

RCT

> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> +	phy_interface_t iface;
> +
> +	linkmode_zero(sfp_support);
> +
> +	if (!port)
> +		return -EINVAL;
> +
> +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> +
> +	if (phydev->n_ports == 1)
> +		phydev->port = sfp_parse_port(phydev->sfp_bus, id, 
sfp_support);

As mentionned below, this check looks a bit strange to me. Why are we only 
parsing the SFP port if the PHY device only has one registered port?

> +
> +	linkmode_and(sfp_support, port->supported, sfp_support);
> +
> +	if (linkmode_empty(sfp_support)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module 
inserted\n");
> +		return -EINVAL;
> +	}
> +
> +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> +
> +	/* Check that this interface is supported */
> +	if (!test_bit(iface, port->interfaces)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module 
inserted\n");
> +		return -EINVAL;
> +	}
> +
> +	if (port->ops && port->ops->configure_mii)
> +		return port->ops->configure_mii(port, true, iface);

The name "configure_mii()" seems a bit narrow-scoped to me, as this callback 
might have to configure something else than a MII link. For example, if a DAC 
SFP module is inserted, the downstream side of the transciever will have to be 
configured to 1000Base-X or something similar.

I'd suggest something like "post_sfp_insert()", please let me know what you 
think.

> +
> +	return 0;
> +}
> +
> +static void phy_sfp_module_remove(void *upstream)
> +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);
> +
> +	if (port && port->ops && port->ops->configure_mii)
> +		port->ops->configure_mii(port, false, PHY_INTERFACE_MODE_NA);
> +
> +	if (phydev->n_ports == 1)
> +		phydev->port = PORT_NONE;

This check is a bit confusing to me. Could you please explain why you're only 
setting the phydev's SFP port to PORT_NONE if the PHY device only has one 
registered port? Shouldn't this be done regardless?

> +}
> +
> +static void phy_sfp_link_up(void *upstream)
> +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);
> +
> +	if (port && port->ops && port->ops->link_up)
> +		port->ops->link_up(port);
> +}
> +
> +static void phy_sfp_link_down(void *upstream)
> +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);
> +
> +	if (port && port->ops && port->ops->link_down)
> +		port->ops->link_down(port);
> +}
> +
> +static const struct sfp_upstream_ops sfp_phydev_ops = {
> +	.attach = phy_sfp_attach,
> +	.detach = phy_sfp_detach,
> +	.module_insert = phy_sfp_module_insert,
> +	.module_remove = phy_sfp_module_remove,
> +	.link_up = phy_sfp_link_up,
> +	.link_down = phy_sfp_link_down,
> +	.connect_phy = phy_sfp_connect_phy,
> +	.disconnect_phy = phy_sfp_disconnect_phy,
> +};
> +
>  static int phy_add_port(struct phy_device *phydev, struct phy_port *port)
>  {
>  	int ret = 0;
> @@ -3351,6 +3432,13 @@ static int phy_setup_ports(struct phy_device *phydev)
> if (ret)
>  		return ret;
> 
> +	/* Use generic SFP probing only if the driver didn't do so already */
> +	if (!phydev->sfp_bus) {

Should the phy_sfp_probe() API be changed to something explicitely legacy? I 
feel like people writing new PHY drivers could be confused if they see some 
other drivers calling phy_sfp_probe() and others not doing anything and still 
getting SFP busses.

> +		ret = phy_sfp_probe(phydev, &sfp_phydev_ops);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	if (phydev->n_ports < phydev->max_n_ports) {
>  		ret = phy_default_setup_single_port(phydev);
>  		if (ret)
> @@ -3384,6 +3472,25 @@ static int phy_setup_ports(struct phy_device *phydev)
> return ret;
>  }
> 
> +/**
> + * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
> + * @phydev: pointer to the PHY device to get the SFP port from
> + *
> + * Returns: The first active SFP (serdes) port of a PHY device, NULL if
> none + * exist.
> + */
> +struct phy_port *phy_get_sfp_port(struct phy_device *phydev)

I'd suggest "phy_get_active_sfp_port()".

> +{
> +	struct phy_port *port;
> +
> +	list_for_each_entry(port, &phydev->ports, head)
> +		if (port->active && port->is_serdes)
> +			return port;
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_sfp_port);
> +
>  /**
>   * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
>   * @fwnode: pointer to the mdio_device's fwnode
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 0180f4d4fd7d..aef13fab8882 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -2091,6 +2091,8 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
>  		       struct kernel_hwtstamp_config *config,
>  		       struct netlink_ext_ack *extack);
> 
> +struct phy_port *phy_get_sfp_port(struct phy_device *phydev);
> +
>  extern const struct bus_type mdio_bus_type;
>  extern const struct class mdio_bus_class;

Thanks!

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart2655786.Lt9SDvczpP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmghs5wACgkQ3R9U/FLj
284G4A//fXz9TTKAHlDGItB9w6mE3I4om5NlNEFzmfoxya7idWY6IJt9b9ZqjzSu
MnwQU1Oc5k51/RvGaLY313ScI8ZPpyIBXzfCwRmti7B44vi3JtTrKn2PW5OHf5QZ
lJ19YYAKWbIkW8//csWElEKOaGGyca8U34sK57DP16IzHJESSp4PBpjhzTKNzdg2
lMHSpBNCiCXdqRdKGJby2E1TL0BG3KbfHWDZ/QTSxbcWKFXlG5vigBkHdALykwYP
kUmbxkcFbAeHx0SdydrMpzm8nrn0WRqpj6Iw3HPmopAgcurWDMzS/gEvCcNkUK7S
i1D6T4LqmQ9NmYjdi1m6BHOFAv761d4Scao7lNI4tzvUAZDO/VTO7Ihy00bvNkam
hljwNP4gkjRIgLBM6QuCWOuK5lsg6aBzlor4RcGegghiv6KoyEonrLmS5RPdc8VX
m4U2fs8wMAjTTcOaOnNywTsWxeh2c8SOB7TdVUMJo8e8ae55vqahozQ/MDSEGi59
5ao/Jxd9E9ZsCARf7GteicSEjqh7mUTrTx3vMDMBhm8aByNicO//0ERo5JdCwS/E
f1IW6uninzWXbdLK9ces4lQyuhjzshkeB5Uh24mwoXjmgMLZ4SEbTN9WSiIWYuSR
9FJkUp6dlrwVcPq3BiX8z1lE4UnGPgU+r8U62vGAd6hMBMrvlAM=
=ML5+
-----END PGP SIGNATURE-----

--nextPart2655786.Lt9SDvczpP--




