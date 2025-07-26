Return-Path: <linux-arm-msm+bounces-66767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE021B12C72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 22:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82D077A6C20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 20:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD98D28A1FB;
	Sat, 26 Jul 2025 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZW6cm0y+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4544B1E8338;
	Sat, 26 Jul 2025 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753563024; cv=none; b=RjTqxly8ZCRZij01ObrYnCogjgl7kh8gZ5I+OSiaXa7CxP0bikk3G1Cm1mxeh3m2jL1fhIsX+kDEQ6qX7rp4t8mub8MPL/gwdYIItNTxyUjbhdJEYsNp3dXvT9tNwQ99ba8JwCah+oeqB516e3eCSRGNIr9ksF9Dixta/pBwsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753563024; c=relaxed/simple;
	bh=5CcbBLAvFqafwbDTuYRHBZTGQlGQDl+tdcBy7K/cZGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEZhA1aGvdezAND48h0JaLG/bMTxBV9QkQ8ZW1PjaGw6I63lRQqte7MoSNwAr52IsquT4Ob7fYkpjIYseT3cUNy73xn+Wtv+Z/vh2oAK5hhv6hh8yIRg59E0TAWmExlFqK7BSzNgMRPhbCNC+9KiZkp2lxDOgT5lUBhzld+wb6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZW6cm0y+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EUlYzqAYpxnFteGA0rbRZWT0uzl0Of2A26AS9jfz3Wo=; b=ZW6cm0y+hFYTZGKm3HL1p2XLP1
	8FbSV3vCcrpTwA/ix7DfXcxH5bVojJw1TxYnBB4IVWmeoGa+Uh5vm0wF0xKYfbVy70dIB2ssyQvcm
	M+ooW4OZRVswmkrk2xlqbkGiFhn75Q/53d6lNjcO0+KYs19DJOjIjgVOADNhYRH4v49g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uflqK-002xx0-Oy; Sat, 26 Jul 2025 22:50:08 +0200
Date: Sat, 26 Jul 2025 22:50:08 +0200
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
Subject: Re: [PATCH net-next v10 05/15] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <6721b691-bae8-4a91-b14b-276b14b89244@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-6-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-6-maxime.chevallier@bootlin.com>

> +#if IS_ENABLED(CONFIG_OF_MDIO)
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,link-loss-low");
> +
> +		/* ti,fiber-mode is still used for backwards compatibility, but
> +		 * has been replaced with the mdi node definition, see
> +		 * ethernet-port.yaml
> +		 */
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,fiber-mode");

Could be my grep fu is broken but:

~/linux$ grep -r fiber-mode arch/*
~/linux$ 

So it does not even appear to be used. If it is not used, do we have
to consider backwards compatibility?

Maybe consider marking the property deprecated and point to the new
binding?

	Andrew

