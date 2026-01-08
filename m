Return-Path: <linux-arm-msm+bounces-88121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55493D04A5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51E553039979
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 17:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67B4328B60;
	Thu,  8 Jan 2026 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="glfExQLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F9328247;
	Thu,  8 Jan 2026 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891564; cv=none; b=LR1UZG/CBf6bPFTkJwS9cn4gK7gzwl5kOm3uRd5FG17oRTdZ982FdCOhedTdUCAucjPXH7eEI8PVuswB9w1SS2cRo8L/dcqs/xcovEgyOrWURpg9uzd08/1bLGOZYpLsk2iFo57HSapySIv/qF+3Ulrvmcw0VvlXN3HDAhRKdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891564; c=relaxed/simple;
	bh=XzZZXjdtvOICb4xYlhqyG/RZmZePmoROzaSn75hfqto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6oDxSW4dgoHL1Cvm11Rbi8Zn9MJj65sYOjbKWzNTkcy757wLknMEXstgCDTo8okiOPdqfvRZIVwXnQJHTi/bF9Uf8o7BavEZQZA+hw5XCBdqv3VjkultgEXWxGVc8pw62R8ESX6Qba89JjhPb35UBQuXIDcQME6rh1+uhKg5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=glfExQLs; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uQf5+PqsoN/BZz1kHM8KDEKsf5OhkvBgMB2wQzEFpJI=; b=glfExQLsR0hZ4sRZ6CiLG573SM
	wBfOXMbUFFxOZY0aGirZkoLAPPLhb7Uy2OCOlhjO8QuWzJy2/NrAYmRaGRLcpQzTNpMwGI/O8zgCS
	s6c7DAwdGU1XdQgDQPPuzKaT5+tzcufSpp6+sW1oJzTinQtTqpaGtsvYsKtnqCJ886RA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdtLq-001zJe-M6; Thu, 08 Jan 2026 17:59:10 +0100
Date: Thu, 8 Jan 2026 17:59:10 +0100
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v22 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <aa13419e-2e4e-4e26-ba35-54d640a49815@lunn.ch>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
 <20260108080041.553250-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080041.553250-4-maxime.chevallier@bootlin.com>

On Thu, Jan 08, 2026 at 09:00:28AM +0100, Maxime Chevallier wrote:
> Ethernet provides a wide variety of layer 1 protocols and standards for
> data transmission. The front-facing ports of an interface have their own
> complexity and configurability.
> 
> Introduce a representation of these front-facing ports. The current code
> is minimalistic and only support ports controlled by PHY devices, but
> the plan is to extend that to SFP as well as raw Ethernet MACs that
> don't use PHY devices.
> 
> This minimal port representation allows describing the media and number
> of pairs of a BaseT port. From that information, we can derive the
> linkmodes usable on the port, which can be used to limit the
> capabilities of an interface.
> 
> For now, the port pairs and medium is derived from devicetree, defined
> by the PHY driver, or populated with default values (as we assume that
> all PHYs expose at least one port).
> 
> The typical example is 100M ethernet. 100BaseTX works using only 2
> pairs on a Cat 5 cables. However, in the situation where a 10/100/1000
> capable PHY is wired to its RJ45 port through 2 pairs only, we have no
> way of detecting that. The "max-speed" DT property can be used, but a
> more accurate representation can be used :
> 
> mdi {
> 	connector-0 {
> 		media = "BaseT";
> 		pairs = <2>;
> 	};
> };
> 
> >From that information, we can derive the max speed reachable on the
> port.
> 
> Another benefit of having that is to avoid vendor-specific DT properties
> (micrel,fiber-mode or ti,fiber-mode).
> 
> This basic representation is meant to be expanded, by the introduction
> of port ops, userspace listing of ports, and support for multi-port
> devices.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

