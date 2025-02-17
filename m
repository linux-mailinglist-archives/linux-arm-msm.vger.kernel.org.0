Return-Path: <linux-arm-msm+bounces-48238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1789A38787
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F451894137
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208EC224AE3;
	Mon, 17 Feb 2025 15:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1k1STfMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E841494DF;
	Mon, 17 Feb 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739806182; cv=none; b=bV0S0tf7T7chUsoMAODY0ONXh6EjULs3qiiq/JHH/KpakodyCGg5QW4+kpn8xyFG+GzMEEBvGqGblk35uhWwOCxU5xLJjnGzlwuVrfTL6RvmHTwSf/vpV/eAG804qQYL9F00G2edEty854QatQThfaduosDaB9UTbJUVl8+qZ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739806182; c=relaxed/simple;
	bh=d+GskYFB5OX9ASZUN7hD4NLWJWM9+7vGlcErfaEnuJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwALFBp77M4pNNFMTEGdjRv9HMKOdhS3tc5Xon6FYNoxx+GGv9K1dwMLCl+bfZa90E3UZUBl9uYa7YOgQbNzHdZ7biKrycFKxVLQjAi/lqjkvkoFru0FOa0m+xOCm6AIM0fW8Znswgsx/qNqcdmMVk+kkwScNtQi1YlNKmQshGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1k1STfMO; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+P4Mpectj/6/0am8dXU2KXP02bvuc53X5h8fNZ10rK8=; b=1k1STfMOkQti3uds9OuyjOMNA5
	vq99x42ZtFDRa8xdYiiTYeKEXC8WrkNr9VbMpkjX7UqcIDds4lMLXGbBkYYbVtRxUGGADqsx69ofd
	f84ONF4ybMwA6zY4xseRfP1BY80QuxP58m1YwddMn6npp+0cF4wFoKssyyhv+h4aeRQc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tk33p-00F0Wh-7S; Mon, 17 Feb 2025 16:29:29 +0100
Date: Mon, 17 Feb 2025 16:29:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 05/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <f88c0ed5-c50b-4bea-81e5-41a1c8c50de7@lunn.ch>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-6-maxime.chevallier@bootlin.com>
 <Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
 <20250217092911.772da5d0@fedora.home>
 <5d618829-a9bc-4dd4-8a2e-6ce3a4acd51e@lunn.ch>
 <20250217152216.5b206284@fedora.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217152216.5b206284@fedora.home>

> > Please be careful with the scope of these. Heiner is going through
> > phylib and trying to reduce the scope of some of the functions we
> > exporting in include/linux/phy.h to just being available in
> > drivers/net/phy. That will help stop MAC drivers abuse them. We should
> > do the same here, limit what can actually use these helpers to stop
> > abuse.
> 
> Can we consider having an header file sitting in drivers/net/phy
> directly for this kind of things ?

Yes, we then only need to worry about phy drivers, not MAC
drivers. PHY driver writers tend to abuse things less.

	Andrew












