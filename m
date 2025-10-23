Return-Path: <linux-arm-msm+bounces-78468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91216BFFABF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AFAC4F1DCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 07:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7F32C11CB;
	Thu, 23 Oct 2025 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KWG10gkj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98533254876;
	Thu, 23 Oct 2025 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205431; cv=none; b=d9icEbZDigptRxe0XPUQkoeR/UiDP4drwyO37ueYdPH6X9JA30e2TcsQ4vkObHNrZ7MIdSBdJA59KJDQ3XF2vYjQfmcMZSax1eOc4sy61OcPGnQX5rrdEvYGPtEhIqpfl9l8TkpMs5C0j1tj71FbH878XS9c1MMJiKn77imMhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205431; c=relaxed/simple;
	bh=2G9Gb/m5O+QY7Ni/xV5TyiwdzRpRI/FddBgYeAgIC6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tv9Ec5zmcNWZIb1txD1E+nBDAZBs/dkThQAN4VcjXhq6ZQyet2AzNmDqB52WC63U/8TXTuggW7FvO1GPYBJr8eDs6KrYkjr9Ey0TopMp+iqJx2BRrxklH3bQI5U98O4nPzARLAVXMWIcf32s9XnGnCQHdp5jGKPFMUDTvdgqwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KWG10gkj; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9C3FC0C407;
	Thu, 23 Oct 2025 07:43:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C6406062C;
	Thu, 23 Oct 2025 07:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC5BD102F2429;
	Thu, 23 Oct 2025 09:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761205424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FuwZwT+5jyvhDDTG/W4OLKYq+tnCcDl94SXGHBKrC1o=;
	b=KWG10gkjd1CX/r8TdNuB+zDc1mBWazqjexcpaPfoy9c1Itkz/VUMaMVGIg72x4Z10Mnovj
	Bsnrww7ShvAkm8U+6G1RSwVxRSeKSeVlXh+v95ZWtr9rV1XIYq7/nfnSF8zvMdPnlc3mrZ
	mqhbvqZIj/h3KZwoVZePWzhm/h2sPh2iVAH8FZ+RN58qg51UiQuo3N/CjLITx+oYuzXSQz
	uLcAREp/mbZz+YjwXbqqwl8okzC0jjXcyt3e5WjWGQezQl1LMBbKluUBgCM9euKYPfYLwf
	mgQz5raHiaT1D1UmIPtd406mEXQX4xjKfh83tFSlIE2txwKMJf0alP9ETs03mw==
Message-ID: <d798cbb4-74f8-47fd-98e8-0d6d6e9f8621@bootlin.com>
Date: Thu, 23 Oct 2025 09:43:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 03/16] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-4-maxime.chevallier@bootlin.com>
 <cb217bf8-763e-4c48-9233-e577b32b14a8@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <cb217bf8-763e-4c48-9233-e577b32b14a8@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Andrew,

On 22/10/2025 23:42, Andrew Lunn wrote:
> On Mon, Oct 13, 2025 at 04:31:29PM +0200, Maxime Chevallier wrote:
>> In an effort to have a better representation of Ethernet ports,
>> introduce enumeration values representing the various ethernet Mediums.
>>
>> This is part of the 802.3 naming convention, for example :
>>
>> 1000 Base T 4
>>  |    |   | |
>>  |    |   | \_ lanes (4)
>>  |    |   \___ Medium (T == Twisted Copper Pairs)
>>  |    \_______ Baseband transmission
>>  \____________ Speed
> 
> Dumb question. Does 802.3 actually use the word lanes here?

Depending on the mode, 802.3 uses either "pair" or "lane" :

1.4.13 1000BASE-T: IEEE 802.3 Physical Layer specification for a
1000 Mb/s CSMA/CD LAN using four pairs of Category 5 balanced
copper cabling.

1.4.26 100GBASE-CR2: IEEE 802.3 Physical Layer specification for
100 Gb/s using 100GBASE-R encoding over two lanes of shielded
balanced copper cabling.

> I'm looking at the commit which added lanes:
> 
> commit 012ce4dd3102a0f4d80167de343e9d44b257c1b8
> 
>     Add 'ETHTOOL_A_LINKMODES_LANES' attribute and expand 'struct
>     ethtool_link_settings' with lanes field in order to implement a new
>     lanes-selector that will enable the user to advertise a specific number
>     of lanes as well.
> 
>     $ ethtool -s swp1 lanes 4
>     $ ethtool swp1
>       Settings for swp1:
>             Supported ports: [ FIBRE ]
>             Supported link modes:   1000baseKX/Full
>                                     10000baseKR/Full
>                                     40000baseCR4/Full
>                                     40000baseSR4/Full
>                                     40000baseLR4/Full
>                                     25000baseCR/Full
>                                     25000baseSR/Full
>                                     50000baseCR2/Full
>                                     100000baseSR4/Full
>                                     100000baseCR4/Full
>             Supported pause frame use: Symmetric Receive-only
>             Supports auto-negotiation: Yes
>             Supported FEC modes: Not reported
>             Advertised link modes:  40000baseCR4/Full
>                                     40000baseSR4/Full
>                                     40000baseLR4/Full
>                                     100000baseSR4/Full
>                                     100000baseCR4/Full
> 
> 
> For these link modes we are talking about 4 PCS outputs feeding an
> SFP module. The module when has one fibre pair, the media.
> 
> For baseT4 what you call a lane is a twisted pair, the media.
> 
> These two definitions seem to contradict each other.
> 
> For SGMII, 1000BaseX, we have 1 PCS lane, feeding a PHY with 4 pairs.
> 
> It gets more confusing at 10G, where the MAC might have 4 lanes
> feeding 4 pairs, or 1 lane feeding 4 pairs.
> 
> Also, looking at the example above, if i have a MAC/PHY combination
> which can do 10/100/1G and i did:
> 
>     $ ethtool -s swp1 lanes 2
> 
> would it then only advertise 10 and 100, since 1G need four 'lanes'?

Ah right ! Yeah so lanes isn't about the MDI directly then, so
clearly this won't work :(
> 
> Is reusing lanes going to cause us problems in the future, and maybe
> we should add a pairs member, to represent the media? And we can
> ignore bidi fibre modules for the moment :-)

That's a very good point, I think this makes more sense. I've also
seen the word "channel" around, but Pair would be more explicit.

thanks for the feedback !

Maxime
> 
>        Andrew


