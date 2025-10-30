Return-Path: <linux-arm-msm+bounces-79700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE8C20C47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF21E4E1E7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEA327B4EB;
	Thu, 30 Oct 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c4jfDxDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685D277C96;
	Thu, 30 Oct 2025 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835843; cv=none; b=TnNjY6y6eDoRjM2+mCGZQbcFV57Ahafpf48Eml49S1RaC126z28oayhOyUYPrm4zMHcyeouf6JAsXjca3wINAcEJJqQnSwsm5SfKG3wN9n302biqh8YdEVCNG1VK+Ryhxd/M1ig3YE/NiL7msOmAVTAX+yI9SIZ/xRlkuL0/UZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835843; c=relaxed/simple;
	bh=3L6GDKEDg3zuG7rGWxNDn00DLu7kQEV2e1daHP0d+hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teFb0/qRjnnbLuHiIER5UzhykTY3DOpJRw/rWoZ+f5M8YmahQQ/hJh6lgN//ISkhf/RcI0BtRI9JrbPhoafS90EBd4kmGSx6GiT+ouE6yHhSwQewEyfX/BwftaPgpB3b9ZGtKh4xbI14k75CFc2LMfndm3v6a+Xtft1Nm5MB2HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c4jfDxDa; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A8954E41402;
	Thu, 30 Oct 2025 14:50:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEAE06068C;
	Thu, 30 Oct 2025 14:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA2EF118085D0;
	Thu, 30 Oct 2025 15:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761835837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+1Ygbu6e/z62ponw49iBMoX40vLxbr6Wro8ocFjVzww=;
	b=c4jfDxDaT7/tVH7dUdrj/rMHhXZb5FKMUZRP2sjVcueoc2itU5lk3zruIAyueCdoFM1fLw
	7McxfrFbhskqXwSsiRl+kz8Tow+vo3oRbaRsj8G+XmyLujC2rkg3lrfvPf5RTXemvc3D7S
	xzdGDxlGRK2BFG/ZaNxn7LxlSvRkADyOizAuJDb9ZWYL0JADEPuY7WFrul65gkEWG4kvcx
	CQLvKMhCKtQzpVM6W9HZdc/85ivPnl6XvHlsTZ6uTlGbqdhUPJtO+tNuj+28MCo78LJwpq
	gisCKKFuiq9TnBRQUAK7AAo7a5N8dfuIBOIWMK7uRtBxFXjIPsTRC30aBWo38Q==
Message-ID: <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>
Date: Thu, 30 Oct 2025 15:50:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
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
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
 <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Andrew, thanks for the reply !

On 30/10/2025 14:23, Andrew Lunn wrote:
> On Thu, Oct 30, 2025 at 01:13:14PM +0100, Maxime Chevallier wrote:
>> Hi,
>>
>>> @@ -313,5 +324,12 @@ examples:
>>>                      default-state = "keep";
>>>                  };
>>>              };
>>> +            /* Fast Ethernet port, with only 2 pairs wired */
>>> +            mdi {
>>> +                connector-0 {
>>> +                    lanes = <2>;
>>> +                    media = "BaseT";
>>> +                };
>>> +            };
>>>          };
>>>      };
>>
>> As Andrew suggest clearly differentiating "lanes" and "pairs", do we
>> want this difference to also affect the binding ?
>>
>> I still think "lanes" makes some level of sense here, but at least
>> the doc will need updating.
> 
> How do you define MDI?
> 
> For copper, one possibility is an RJ-45 plug/socket, and you have
> twisted pairs, 2 or 4 of them.
> 
> Some people are old enough to remember 10Base2, using a coaxial cable
> and BNC connectors. Would you consider that a pair? A lane?
> 
> How about an SFF, a soldered down module. Its MDI interface is likely
> to be 2 fibre strands. But consider so called bidi modules, which use
> one fibre, and two different wavelengths of light.
> 
> Or an SFP, where you have no idea what the MDI is until you plug it in
> and read the EEPROM.
> 
> Do we need to be able to describe all the different MDI? Do we maybe
> need to look at the media property to decide it is an RJ-45 connector
> so there should be a pairs property? Or the media is -KS, so there
> should be a lanes property for the number of PCS lanes on the PCB?
> 
> This needs further discussion, what are you actually trying to
> represent here?

What I'd like to represent here is at least BaseT connectors, or simple
Fiber connectors without SFF/SFP (we already have an sff/sfp description
in DT, and we can know what they do by reading the eeprom).

Let's consider these examples, which are representative of what I
want to represent and why.

As a remainder, the end-goal is to be able to list to userspace the
front-facing ports that are beind a netdev, so that we can in the end
support MII-side muxing.

We have several examples of that already upstream :
 - Turris omnia, where we have a mux in the SoC to output the SGMII/1000BaseX
  either on a PHY or an SFP port. This is not covered by this series.

 - The MCBin Doubleshot. Here we have the Marvell 88x3310 PHY connected to the MAC,
and to both an SFP and a RJ45.

However, what we have in DT is :


&cp0_xmdio {
	status = "okay";

	phy0: ethernet-phy@0 {
		compatible = "ethernet-phy-ieee802.3-c45";
		reg = <0>;
		sfp = <&sfp_eth0>;
	};

	[...]
};

The question is, with the information we have in DT and from what the PHY
can autodiscover, how do we know if we have this :

MAC --- PHY ---- SFP

or this :

MAC ---PHY ----SFP
        \-----RJ45

I don't think we can, we are missing a description of the MDI-side of the PHY.

Of course I don't want to start representing the MDI for every PHY out
there, most common case we have one MDI, that supports whatever the PHY
reports from .get_features(), with the possibility of reading some straps to
adjust.

When we start representing the MDI, we can take that opportunity to solve other
problems :

 - The proliferation of vendor properties like "ti,fiber-mode" or "micrel,fiber-mode"
 - The use of "max-speed = <100>;" because the PHY is only connected to the RJ45 with
   2 pairs

So that being said, an option could be to only focus on pairs, only for medium = BaseT,
and ditch the "lanes" terminology, at least when it comes to the DT bindings.

Does that sound good ?

Maxime


