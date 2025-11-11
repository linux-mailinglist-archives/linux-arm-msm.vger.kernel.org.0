Return-Path: <linux-arm-msm+bounces-81159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EACCC4B584
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9EB3AB782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 03:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA73346FB9;
	Tue, 11 Nov 2025 03:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dn0Wswuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B52F25F6;
	Tue, 11 Nov 2025 03:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762832293; cv=none; b=U0H5XXkTUfVVcOgCcTmrAc8zcUdeioit1a4Oq2e7wNc/aXYNytISSVs7H2IvLrrQ3jPzW6vrME5bLe5MdqJLp+xTfPD9TyUG6MjWZ5196oHUmXZNy+l2UyKQIcqeUOm+aijuTpDAEeMuTLnjA+z/GinkB9fyNghDUWs5D3ZXAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762832293; c=relaxed/simple;
	bh=JnjR3ccdOgFUFdsqe6dQDe53y5GKhqvyQm58YKJGcBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvUvIFYYgc1zBH5/JCQpC2idfbj41rcIvQyqQb4NZq7PEAt9WWno4wFzaCcSf70OwxMrZInmTtW55m0WGf38lz7JcewUd7gFAqfAQDsxZk/2rSE3OysUp3y+WezO0Fe8XiYbwBJxp3i7mnUJ3Veq+x2/QUMnAkQb0qcliUd7O3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dn0Wswuu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0r//aGWrlmi6Dku4SGylGdOm8j4QEiQNTC0qV/wOxJc=; b=dn0WswuuraMNIHUtJcky8SsfHD
	lYIF25aVVaICooOnwK6+1PhUjbAamJyARyDAbXGu23yIu3Ji7VCSMdoZoeArPgiHPP2RbbwUC4nnH
	QFDYH0MFaWvFlkZznzTej00KZ9EL9ucvBHfCt8FyHwRAH9hk+DJELfuWxhdzwBv2b7W8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfCf-00DaPh-BJ; Tue, 11 Nov 2025 04:37:57 +0100
Date: Tue, 11 Nov 2025 04:37:57 +0100
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
Subject: Re: [PATCH net-next v15 02/15] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <71c1c7a9-db8b-4efe-94fe-0f7f9ef00840@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-3-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-3-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:27AM +0100, Maxime Chevallier wrote:
> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
> 
> This is part of the 802.3 naming convention, for example :
> 
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ pairs (4)
>  |    |   \___ Medium (T == Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed
> 
>  Other example :
> 
> 10000 Base K X 4
>            | | \_ lanes (4)
>            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
>            \_____ Medium (K is backplane ethernet)
> 
> In the case of representing a physical port, only the medium and number
> of pairs should be relevant. One exception would be 1000BaseX, which is
> currently also used as a medium in what appears to be any of
> 1000BaseSX, 1000BaseCX and 1000BaseLX. This was reflected in the mediums
> associated with the 1000BaseX linkmode.
> 
> These mediums are set in the net/ethtool/common.c lookup table that
> maintains a list of all linkmodes with their number of lanes, medium,
> encoding, speed and duplex.
> 
> One notable exception to this is 100M BaseT Ethernet. 100BaseTX is a
> 2-lanes protocol but it will also work on 4-lanes cables, so the lookup
> table contains 2 sets of lane numbers, indicating the min number of lanes
> for a protocol to work and the "nominal" number of lanes as well.
> 
> Another set of exceptions are linkmodes such 100000baseLR4_ER4, where
> the same link mode seems to represent 100GBaseLR4 and 100GBaseER4. The
> macro __DEFINE_LINK_MODE_PARAMS_MEDIUMS is here used to populate the
> .mediums bitfield with all appropriate mediums.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

