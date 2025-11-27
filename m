Return-Path: <linux-arm-msm+bounces-83655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26AC8FDDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3F264E8387
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCB32FB99B;
	Thu, 27 Nov 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="E/WGvUO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D682A2FB622;
	Thu, 27 Nov 2025 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266701; cv=none; b=i8nHWO1e//HpZBzDkg5WrNyo76MtJRLGxWhoxicez29IJKNrt7cKD71x6gQu8Y43g61OP7jVKAf8VltzoJKNIuuTNTI4SbK0yPpanJnuucpB2Q2cyp6GmY2BMVmJL6tptC1+MvMDndZKYqdWgYb20J/O/S1As+Sb/CleWoOzQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266701; c=relaxed/simple;
	bh=eh6GptPit+DQZ6AAi34iOts1zR/PLLDsa0LMxGdRvcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6FKFfO4M4fImhYfGg7cwm0aPVlc6PD7TJaRNB025pCGzS4boSC/mKBykLi+VRmI8wWZUb1KxnhoAulbUIzcZh2Xf4uqNRphCJsbmdisT9QgIw/H6nxCyBQrwDlNE2E56ZNfea8wGo1uaXFJqM1oBm6CvFPxuY2c0zPNf2q2Kck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=E/WGvUO0; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EvV1w4cAULv5qSHvIlf1UNf4JtPT19KI5eOxlCJ4tWA=; b=E/WGvUO0zODvpejzuuJAosSxXI
	iFqcj14LgqeI5b4CMhcAFYvNJNtPr/B8w3KNcBxAZqcXP+XFkZpLwQrhkmhgLcGYNjUdnkqzt12Dk
	5CBA+U+vk0kdLeeWzH9zoHUJsqicpqOa9iJv8NQhieYPif5d8/MauMU9LlOu8xAMTqbNC1l/qX4Fu
	fym+Npr21c7gk+4bn9CLtZ4o0h5qvf7hWxMHInKycDIBXnwA34CxjWBLrzV2SWwAjmV07If9JBQxW
	mNb21q0UHBKtVyPyXgE80fwKVYLKTjrXgJHs9/wrKzip3pvC5vXHEd/quSFNJ3d4fZh+ToXqlOcdB
	h9Deqrtg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55118)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vOgMS-000000005bY-30fO;
	Thu, 27 Nov 2025 18:04:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vOgMP-000000002rV-16BZ;
	Thu, 27 Nov 2025 18:04:53 +0000
Date: Thu, 27 Nov 2025 18:04:53 +0000
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v20 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <aSiSxbE-XY_zxMBC@shell.armlinux.org.uk>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127171800.171330-4-maxime.chevallier@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 27, 2025 at 06:17:46PM +0100, Maxime Chevallier wrote:
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
> The typical example is 100M ethernet. 100BaseT can work using only 2
> pairs on a Cat 5 cables.

Correction: 100BASE-TX. 100BASE-T, which covers the family of 100BASE-T
media, includes 100BASE-T4 which is over all four pairs of the cable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

