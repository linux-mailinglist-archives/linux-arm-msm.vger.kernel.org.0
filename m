Return-Path: <linux-arm-msm+bounces-78412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A3BFE563
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 23:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F07464F52DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 21:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1B4303A1D;
	Wed, 22 Oct 2025 21:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2o0zIKaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6B930275C;
	Wed, 22 Oct 2025 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761169371; cv=none; b=GXfAm5tULy7ilnvEYEnVGDIIw72pvpzV5pUvRHeJSOxayoXXu2It7D5zL16gZwtjbS1Rsjp/Xg0+8fHNStuBFzxvS1sI3SMEKKAyvGk4a3lwmz92pnCx1E4gZw9gz8SJ31zWtwGKIwjJbQGYXWLzuh8fZIjM2kyYIbsOiEuX/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761169371; c=relaxed/simple;
	bh=cGR7lMWBKqDn3+3GH8ZZjkJeJeokkQWRL6FFJ9SDucM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKLGp7YOeWNbetPRJfSUFVz+M7qu36oLJKsXX1ckWtrBfIsuU2SUX2Np2bLAYqG0br2otnoxQOTMpPd6M4c/06UjS6M7hFz1ZaxZGhyvt47XfQkRilptmyEn1Fu77rfAWJ4RzJPqEVuFwO+tj90eUfTcZV5gL0Z41yXN+kxhFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2o0zIKaG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RoLMA7YAWuosvmrIBLI8Zurj/FpRrXqerMkVboDNB+Y=; b=2o0zIKaGyuU7jtl6xkuRA757+/
	As1Ixp9TgpYCJDhpfUu1tGXwnnJp89Oxc92MQcKIqa1/B82750L/nqFG+MHAVGVbDX/ljYXwf4ptn
	Mszwaf22Z0j5sZeu62hOivGPjEZMSXwueveV3YZbNwS/5syABoUZ7lmMIjcqFgBc2bLw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vBgbA-00Boc8-AG; Wed, 22 Oct 2025 23:42:24 +0200
Date: Wed, 22 Oct 2025 23:42:24 +0200
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
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net-next v14 03/16] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <cb217bf8-763e-4c48-9233-e577b32b14a8@lunn.ch>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013143146.364919-4-maxime.chevallier@bootlin.com>

On Mon, Oct 13, 2025 at 04:31:29PM +0200, Maxime Chevallier wrote:
> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
> 
> This is part of the 802.3 naming convention, for example :
> 
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ lanes (4)
>  |    |   \___ Medium (T == Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed

Dumb question. Does 802.3 actually use the word lanes here?

I'm looking at the commit which added lanes:

commit 012ce4dd3102a0f4d80167de343e9d44b257c1b8

    Add 'ETHTOOL_A_LINKMODES_LANES' attribute and expand 'struct
    ethtool_link_settings' with lanes field in order to implement a new
    lanes-selector that will enable the user to advertise a specific number
    of lanes as well.

    $ ethtool -s swp1 lanes 4
    $ ethtool swp1
      Settings for swp1:
            Supported ports: [ FIBRE ]
            Supported link modes:   1000baseKX/Full
                                    10000baseKR/Full
                                    40000baseCR4/Full
                                    40000baseSR4/Full
                                    40000baseLR4/Full
                                    25000baseCR/Full
                                    25000baseSR/Full
                                    50000baseCR2/Full
                                    100000baseSR4/Full
                                    100000baseCR4/Full
            Supported pause frame use: Symmetric Receive-only
            Supports auto-negotiation: Yes
            Supported FEC modes: Not reported
            Advertised link modes:  40000baseCR4/Full
                                    40000baseSR4/Full
                                    40000baseLR4/Full
                                    100000baseSR4/Full
                                    100000baseCR4/Full


For these link modes we are talking about 4 PCS outputs feeding an
SFP module. The module when has one fibre pair, the media.

For baseT4 what you call a lane is a twisted pair, the media.

These two definitions seem to contradict each other.

For SGMII, 1000BaseX, we have 1 PCS lane, feeding a PHY with 4 pairs.

It gets more confusing at 10G, where the MAC might have 4 lanes
feeding 4 pairs, or 1 lane feeding 4 pairs.

Also, looking at the example above, if i have a MAC/PHY combination
which can do 10/100/1G and i did:

    $ ethtool -s swp1 lanes 2

would it then only advertise 10 and 100, since 1G need four 'lanes'?

Is reusing lanes going to cause us problems in the future, and maybe
we should add a pairs member, to represent the media? And we can
ignore bidi fibre modules for the moment :-)

       Andrew

