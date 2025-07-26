Return-Path: <linux-arm-msm+bounces-66765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F42B12C2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 22:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C28B917E76B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 20:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A72215F7C;
	Sat, 26 Jul 2025 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pu4x+6J/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B81E5701;
	Sat, 26 Jul 2025 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753562027; cv=none; b=VD+llhrT2s0CurIED5hZxaMevmxWuPWg4bYQ83tFV+/KuOyuDY0lJRhgl7QOoY62x5wlPhAX2k4WtY2f//gwT/pCo4sCQsNqU7ktId4w8vL5qxI4JlK5swoU4uTkJipOLdpEPPwt7HysAV68jwd5i5VtqYw9FaEy1TJS55YxcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753562027; c=relaxed/simple;
	bh=CyaUenj1VJ7ZLB6mG0BcK/h7HN/jaBFXdvQHXyW+BIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwKkbb4c1fxEFS4NtdND4xW0yEc4ToU/1uZfkpWhej0xsJhWDcEsyB610WdRA8VmgK9IgOUyQUc7hFuiVydRPdVFm2V47dCL76peC6x1w4Sel/bLqiZ4Y4Mg0F2lUZiB2ifkmp9lTkR1oEV4eqAPHphKtP/cSaeXpQYWHAHTMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pu4x+6J/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0IOvRCaeU2dh9qCzyT4cj/QLVuaRH9ZU7loSGJGjyNw=; b=pu4x+6J/Q5hOdj+NEyYZ5raFsg
	jCIDvwFHmz7KQWUH0oDDhyTBYatlBOtOYZEIICDmPmyfLGPWOi23j9PNcrO0x+ET3Trsq6/ccMv+0
	lUy1BNGTKxDQjJNF4gOowmSwFFityHocQVR/NFCsUcp8+AI36Cp1m5hYwpussAVO797Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uflaH-002xqk-Ma; Sat, 26 Jul 2025 22:33:33 +0200
Date: Sat, 26 Jul 2025 22:33:33 +0200
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
Subject: Re: [PATCH net-next v10 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <a915e167-1490-4a20-98a8-35b4e5c6c23c@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-5-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-5-maxime.chevallier@bootlin.com>

> +
> +/**
> + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
> + * @supported: After this call, contains all possible linkmodes on a given medium,
> + *	       and with the given number of lanes.

Maybe nit picking, but maybe append:

, or less.

> +		/* For most cases, min_lanes == lanes, except for 10/100BaseT that work
> +		 * on 2 lanes but are compatible with 4 lanes mediums
> +		 */
> +		if (link_mode_params[i].mediums & BIT(medium) &&
> +		    link_mode_params[i].lanes >= lanes &&
> +		    link_mode_params[i].min_lanes <= lanes) {

We should only care about min_lanes here. I don't think the
link_mode_params[i].lanes >= lanes is needed.

Maybe you can add a BUILD_BUG_ON() into the macro to ensure
min_lanes <= lanes?

> +struct phy_port *phy_of_parse_port(struct device_node *dn)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
> +	enum ethtool_link_medium medium;
> +	struct phy_port *port;
> +	const char *med_str;
> +	u32 lanes, mediums = 0;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
> +	if (ret)
> +		lanes = 0;

The DT binding says that both properties are required. So i think this
should be:

		return ret;

> + * phy_port_get_type() - get the PORT_* attribut for that port.

attribut_e_

> +	 * If the port isn't initialized, the port->mediums and port->lanes
> +	 * fields must be set, possibly according to stapping information.

st_r_apping

	Andrew

