Return-Path: <linux-arm-msm+bounces-66782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1B2B12EEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 11:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F76175E28
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8246A1FDE22;
	Sun, 27 Jul 2025 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Rw9v4iQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3602B9BA;
	Sun, 27 Jul 2025 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753610235; cv=none; b=mYCqOsIHb7SXbZi2yoEOs9/7FVFgJlKl1Jm9iheKqvLviP57nX+AdS7hkqJ2/Z5LQzlUjWAbNTm8yzTQoX3YM61clEmY5+Rged8S4w0bj8q2aEL4mm/bnPTsESpVP+9vbxZxCH+XC7QWOHDpMl9s/WY+cYDL4zppbYwr9vskQ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753610235; c=relaxed/simple;
	bh=KkWHTNsaRGw3IlGPku2eWteMZzaa5h0eTarLknTzXsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6Jdk0d8Sww8holXLkXrwSMBTVSXgpxQU4MKmYTrPq3cUvsTcJb4rdxZpt+e8WgL0db3IiRBdg8smaWc+X9kIGBqRzF1keQt9TBjhezEZKkghi3U+51L+RXQsZSGWg6wYQHrnjzPQnXbTz+zQigMJVf+09qnWwKyQdinfuBRyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Rw9v4iQZ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bgcaSBrVCciGkW/9wHNmmtdtZky2ZFmyIYefiynEDqc=; b=Rw9v4iQZI8V77POV1SbIpK9YhU
	h+gtpTCZNqbgj5sZ3e/6KTwa4J1ulOO5aS1V0/lEnzKagZx7etOLTPnaiOu3RoOCnwPydslEz4pu0
	H8GSE6ZGDN5AGlB6A0yxJ4Eh4L9/EQfck95HGdfCXdarQRqlyGfmq8k/VFLQco2EEg/5c0/Rf5EMz
	kingW6H8tyaFUVBH98+Cag2A9EGkfQ+cibNdNgwdhwM5zCwpS749KowgdCDpi87btXj7zcyMAevOm
	Z8heZ2JV6vSzXhYtTDCji9wcvOdD01tdck1+9t+PSpk8UqlXdd5dDW8MDOiv5Je+iKDBQkd6sxTw1
	bYCYZkMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47138)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ufy7o-00079q-34;
	Sun, 27 Jul 2025 10:57:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ufy7g-0003fM-1B;
	Sun, 27 Jul 2025 10:56:52 +0100
Date: Sun, 27 Jul 2025 10:56:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
Message-ID: <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
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
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> +{
> +	struct phy_device *phydev = upstream;
> +	struct phy_port *port = phy_get_sfp_port(phydev);
> +
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
> +		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
> +
> +	linkmode_and(sfp_support, port->supported, sfp_support);
> +
> +	if (linkmode_empty(sfp_support)) {
> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> +		return -EINVAL;
> +	}
> +
> +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);

I've been moving phylink away from using sfp_select_interface() because
it requires two stages of translation - one from the module capabilties
to linkmodes, and then linkmodes to interfaces.

sfp_parse_support() now provides the interfaces that the optical module
supports, and the possible interfaces that a copper module _might_
support (but we don't know for certain about that until we discover a
PHY.)

The only place in phylink where this function continues to be used is
when there's an optical module which supports multiple different
speeds, and we need to select it based on the advertising mask provided
by userspace. Everywhere else shouldn't use this function, but should
instead use the interfaces returned from sfp_parse_support().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

