Return-Path: <linux-arm-msm+bounces-66769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05265B12C85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 23:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38E3C17B57B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 21:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE7E220F41;
	Sat, 26 Jul 2025 21:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0640mmRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BBD207A22;
	Sat, 26 Jul 2025 21:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753563947; cv=none; b=a8HjW+X+lFPpeaMoD/A3C4PH9PRbN0we4aNRRo/8pQqnkS+fiCJzP2wAXp1U+l1aWGCYKx/6yl+8/RG/JE0fGh2VI83woP+eFrN1kMdXSAwJpd4sRB9dN55h1KNIiI0aKw0PixDAD3g61e9O9qWLXCELlyc+tIDdDAEnf1ibQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753563947; c=relaxed/simple;
	bh=5KNVxKatnovSaR1Uj5p/zL0wiWVbFvRc7FlMjRs+oIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8JIdmu2Tr87wCfOYJgnOEuj49ZMtaOXlJqz5iPrg73jlb1q3btKe1s7dCfpFzBLh7eHFqqgJVxx4PgXHCTWQEYtod2FUjhh8pMQPkBoKdKZp2FrrAoBL1D+OkAYznTuUXbtpHd4R+P1YDl/FuVeZmjyn+yKf90nkOGKkdntKmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0640mmRp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nHnQrVjulWV5eTEaeLxZ11VN7DxPLeTCfKGd7yvq2Kg=; b=0640mmRpxuB0M4XtTXtwopiRXN
	tIEEn2VttlpVBUT0oUfNo/exnyXON3oM/tWTtoaxQt51qAm6V0sMc4R1NPxDiiOFY22F05N1f+vt3
	1GZ7qPB4x9BgWw8zDChJ6hH5n065tnbriroOIe3IUulFir+3mZBJog8FGCV/ThC4FKmk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufm5F-002y1h-DG; Sat, 26 Jul 2025 23:05:33 +0200
Date: Sat, 26 Jul 2025 23:05:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <762dd1dd-0170-4f7d-b418-1997c48e7f95@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-8-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-8-maxime.chevallier@bootlin.com>

On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> There are currently 4 PHY drivers that can drive downstream SFPs:
> marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> logic is boilerplate, either calling into generic phylib helpers (for
> SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> bit of validation :
>  - Getting the module's expected interface mode
>  - Making sure the PHY supports it
>  - Optionnaly perform some configuration to make sure the PHY outputs

Too man n's.

> +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);

Strictly speeding, this is not allowed, reverse Christmas tree...

The assignment needs to move into the body of the function.

> +	if (linkmode_empty(sfp_support)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> +		return -EINVAL;
> +	}
> +
> +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> +
> +	/* Check that this interface is supported */
> +	if (!test_bit(iface, port->interfaces)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");

Maybe make this string different to the previous one, so somebody
debugging issues knows which happened?

> +/**
> + * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
> + * @phydev: pointer to the PHY device to get the SFP port from
> + *
> + * Returns: The first active SFP (serdes) port of a PHY device, NULL if none
> + * exist.
> + */
> +struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
> +{
> +	struct phy_port *port;
> +
> +	list_for_each_entry(port, &phydev->ports, head)
> +		if (port->active && port->is_mii)

Naming is hard, but this actually returns the first mii port.  Is
there a clear 1:1 mapping? I don't think i've ever seen it, but such a
SERDES port could be connected to a Ethernet switch? And when you get
further, add support for a MUX, could it be connected to a MUX?

	Andrew

