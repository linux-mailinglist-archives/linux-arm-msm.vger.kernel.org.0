Return-Path: <linux-arm-msm+bounces-66772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB500B12C9D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 23:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F7297A69B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 21:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF6021ADC6;
	Sat, 26 Jul 2025 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iZCBryEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9A1BEF7E;
	Sat, 26 Jul 2025 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753565089; cv=none; b=QQdjiVJF3bU9TDMFZ0t9Oc/4+4d3pC6vjsTyFgQwSqpR7uGYN3fH6o3mnZ6JyOv6NMySp6vjCAF0YdZXy0/g1g3JfxLAwR2T85/IMg9EiWUtF4+e656JL2lJ4saz1zxgWvaa6uLJYRwNH+LA/9Q83OGofZ2KVSTU+5l2YYkH80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753565089; c=relaxed/simple;
	bh=zX0JMI7Q3kU3P9tcEi3RFlmeubhAibQGoc85nzIr9a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKixE5ampMyiQ1WRZLQHnTZCBDT/DN/p/TQg4S3aVUyGXiAfiFeYDDgOCq33PZeqHE1VtlBA0CA4HXi2bGO72FAfl74xk71FBSkmQAeY7ysHo+W/WdC29e+gzhM0WQkjawV1C5hgJ/OyTajB/pMoOZPlOXUWCnh+nRuHy4BokEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iZCBryEN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uqIsyHweDQuU/cfkFMj4zECHx2q4S7M+MS7iuNNPSZM=; b=iZCBryENHxBWgI+GZsRBHrXiTy
	eErR82jHlEPktXtCg+QSTH37YVCSi7sIlSpVqU0b2jGd0mWdtMisbLN/AXuztAPonw18G1bt5j6pZ
	Tuh5vGWU0kSOU6K4XV8BCmikFpoqOA15XyIbDgJ94v/SUxNFZwnUhBz9kykBYmvtxfoM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufmNg-002y6t-0q; Sat, 26 Jul 2025 23:24:36 +0200
Date: Sat, 26 Jul 2025 23:24:36 +0200
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
Subject: Re: [PATCH net-next v10 11/15] net: phy: at803x: Support SFP through
 phy_port interface
Message-ID: <67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-12-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-12-maxime.chevallier@bootlin.com>

On Tue, Jul 22, 2025 at 02:16:16PM +0200, Maxime Chevallier wrote:
> Convert the at803x driver to use the generic phylib SFP handling, via a
> dedicated .attach_port() callback, populating the supported interfaces.
> 
> As these devices are limited to 1000BaseX, a workaround is used to also
> support, in a very limited way, copper modules. This is done by
> supporting SGMII but limiting it to 1G full duplex (in which case it's
> somwhat compatible with 1000BaseX).

Missing e

> +static int at8031_attach_port(struct phy_device *phydev, struct phy_port *port)
>  {

...

> +	if (!port->is_mii)
> +		return 0;

That seems common to all these drivers? Can it be pulled into the
core?

> -	if (iface == PHY_INTERFACE_MODE_SGMII)
> -		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");

I think we need to keep this warning. I don't remember the details,
but i think this is the kernel saying the hardware is broken, this
might not work, we will give it a go, but don't blame me if it does
not work. We need to keep this disclaimer.

	Andrew

