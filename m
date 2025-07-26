Return-Path: <linux-arm-msm+bounces-66766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BAB12C3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 22:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89E5B4E42E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 20:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27844235354;
	Sat, 26 Jul 2025 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="N6zFuSXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779F218AB4;
	Sat, 26 Jul 2025 20:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753562327; cv=none; b=m8fE+xbrmVMdxG054wjGu70kyzmXsOJubAfnt4SozE0/MsFSkcQiQiXA+6Mk2Y0Lw8G1Pc3RxGOW1GLi41QynOKwbhXyyS17bSvGtO4wUybdvI/Po6ZtU+2XFqZLu/urgiqL3qK40QMfmudHslw8Nd5yhCOqcSUeP/RpJR4FPVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753562327; c=relaxed/simple;
	bh=5YDCvTY4h79DMAWX/Vt2xwJMsU4mqVB/VaYI4FrTA1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y30ydv9MzZKxIpCVpHGp6dsGjk7aMLtCNM3G/oIvFz76ohfK1wwtCntUESVG7RSGdx8ypeMShW/5KmVxndoBq15qwZt2i55aMYHX51YtQMNf5tYu2XCMOSGK2KYMei94oOQduxINBIaCYQUrvpkcohHrd3+8zLKDXCO8iciflb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=N6zFuSXx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IdOZ/BpVWuZo4SXqhPcslF3K2uypFYqv/BJB8/Epd/U=; b=N6zFuSXx39EWTD28RZSXtzT2UI
	5s014y1jMHntFTUyLiW+BSGmS0T+ZXfmQQwYAA4G7EuiAalogyD/zaY/Mr+r2s1b0RiS4bhGaPn9p
	1j8T3MkambSaVb6OusqZd7+uzyPUE0F5Kaz2v+LZhefJlYGryYLxqcDPv2jnlja9OwNM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uflf6-002xsg-Fy; Sat, 26 Jul 2025 22:38:32 +0200
Date: Sat, 26 Jul 2025 22:38:32 +0200
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
Message-ID: <bec1b52f-d33d-4088-9d88-3345ecd0fa69@lunn.ch>
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

> +static int phy_default_setup_single_port(struct phy_device *phydev)
> +{
> +	struct phy_port *port = phy_port_alloc();
> +
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->parent_type = PHY_PORT_PHY;
> +	port->phy = phydev;
> +
> +	/* Let the PHY driver know that this port was never described anywhere.
> +	 * This is the usual case, where we assume single-port PHY devices with
> +	 * no SFP. In that case, the port supports exactly the same thing as
> +	 * the PHY itself.

I wounder if you should hook into __set_phy_supported() so that DT
max-speed, and the MAC driver calling phy_set_max_speed() are covered?

	   Andrew

