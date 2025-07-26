Return-Path: <linux-arm-msm+bounces-66771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC26B12C98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 23:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6951B1C21A5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 21:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0B3217723;
	Sat, 26 Jul 2025 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="oJVz5O3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA666199924;
	Sat, 26 Jul 2025 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753564643; cv=none; b=Jwn+9pW+h0pIO9aH3FKnHT6OAaxW4ywar1iX+SFmhiZf4QdaBxWHczriID3ag6IC2D7OyzuXe3CwFJOOD7JsUQ1i6kNK0RnvA0Bd8YTxDuzb4HQEcn8SzhVue5K/GPUO+KVvPHC2soALvMiqLGLpgKKTC29fgPDzX4TY9oYn3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753564643; c=relaxed/simple;
	bh=RGFBcNYwtvE1bQmu9UD7+TrQ2VnLnSDCTMyX6RsoTek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrqi4WCR8MyAv8vTXyP+avs71XUH0BY0SnNXv76Ysf0kNt8eZqdMFGRE69zJjQtjN1rLei/bjlfA5GG8QWQ/Vs2OPfvDKybwV7Gy7P4RSbXeaeXQ96gncOex425l8BmtxjPzdS36AT0Ywdbby84uDfAgUFONtQRwopZIKrj8XQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=oJVz5O3P; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RKHW63eS4vhsiq6w1j0xdaM2ua1lyfOxwy9A13DXxwY=; b=oJVz5O3PaIy0LU9cDnAZlXPyno
	R+veBl7QJbWRkAf2pTm7637bQrp0MNhVqHYYJixxbfh5Vlvl34c/8wFRbagtFmR11sUCuNhTxaGg1
	DX54ZfLTubSCixKIqtMnFDov/gMyBBn+HQScGGSxxyddsvg5ryJOJGKjBuB37+3ShNMk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufmGV-002y5Q-RC; Sat, 26 Jul 2025 23:17:11 +0200
Date: Sat, 26 Jul 2025 23:17:11 +0200
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
Subject: Re: [PATCH net-next v10 10/15] net: phy: marvell10g: Support SFP
 through phy_port
Message-ID: <b6498944-0d06-459f-9668-26813f037166@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-11-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-11-maxime.chevallier@bootlin.com>

> +	} else if (port->not_described) {
> +		/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
> +		 * of them going to an SFP and the other one to a RJ45
> +		 * connector. If we don't have any representation for the port
> +		 * in DT, and we are dealing with a non-SFP port, then we
> +		 * mask the port's capabilities to report BaseT-only modes
> +		 */
> +		port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +
> +		phy_port_filter_supported(port);

That seems a little bit error prone. Maybe add a helper to set
port->mediums, which also makes the phy_port_filter_supported() call?

	Andrew

