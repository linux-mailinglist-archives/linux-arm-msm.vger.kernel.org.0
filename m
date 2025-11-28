Return-Path: <linux-arm-msm+bounces-83708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 70975C91469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F0B634AFEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4D62EF65B;
	Fri, 28 Nov 2025 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BBTHcI0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8652EC54D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319513; cv=none; b=kphvLA2J+F2s2iWD2bt9jkJHl8OfATu/aWUzyFR8ClXHGZfY/DOnLsECceOQgCD00jUOALtCxpWBO3fD/ldPZsoiKfRoYp7KyZsf8aSkvXZMrwLPmJ+0Depwe/5fEH1QBClTaWjrxlbsE4IZDK0iyrAXivs24TiD51lvR/+mLCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319513; c=relaxed/simple;
	bh=0X/ydzoWDB4ZtJE0RBBBD7ONqrPxkKp/vJTWLZBq2/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pjk8UyGrC5gwH7KBnTqkN3mP2eIRWpMqO/lqykwUg8gVAQxggcFl1kuxn3y1XytRxqjiaLAe8Ao7JoRUGcVv5I1Jy7zf+4tQLzpLoClt50SKdoN/TKC2io9XESnVX+VLVWc+ImH5By0xxqoy409uqcIDIvsWxIvhVmCDbtrI8Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BBTHcI0a; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 620A21A1DE6;
	Fri, 28 Nov 2025 08:45:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F9C460706;
	Fri, 28 Nov 2025 08:45:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6FCF103C8F20;
	Fri, 28 Nov 2025 09:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764319507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=P0+e6XTu3A6o5AA0Sdf7CPZ+DssyTSsdo2j6rOigGDU=;
	b=BBTHcI0acimD4Z+tf+m+ZYYQA+zUHulwmzzRJl76h86HdO/UEPydJHf53ev70bfY4aiIby
	QuEkZFbcYpZU7rQRtod433l/ajomrZ1uWGCGGr0l2SO47MVJUcvI1kR5L970OEDTluHjI3
	pEnCGUJI2MMc3t/PnM4WWvL+BFtbp0iGLF7aSAtnWpCqyQDi+E5Kaj+ze9PK4QNAHccyAH
	ac8AAZKSGrBDmlX2aKRaPiA/E1xPCoBhK5pDjL4OpzQZL+XYsWWIg/QioPv7f2ih3dBrZK
	hzJIAu0eoVuAonbYRSOcYMQOgmDLjKqaEfceDzdP04sLoN84YN+sIGr8YyG2oA==
Message-ID: <e18d4197-b06e-493a-a843-e195fbc46d6c@bootlin.com>
Date: Fri, 28 Nov 2025 09:45:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 03/14] net: phy: Introduce PHY ports
 representation
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
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
 Tariq Toukan <tariqt@nvidia.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-4-maxime.chevallier@bootlin.com>
 <aSiSxbE-XY_zxMBC@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aSiSxbE-XY_zxMBC@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

On 27/11/2025 19:04, Russell King (Oracle) wrote:
> On Thu, Nov 27, 2025 at 06:17:46PM +0100, Maxime Chevallier wrote:
>> Ethernet provides a wide variety of layer 1 protocols and standards for
>> data transmission. The front-facing ports of an interface have their own
>> complexity and configurability.
>>
>> Introduce a representation of these front-facing ports. The current code
>> is minimalistic and only support ports controlled by PHY devices, but
>> the plan is to extend that to SFP as well as raw Ethernet MACs that
>> don't use PHY devices.
>>
>> This minimal port representation allows describing the media and number
>> of pairs of a BaseT port. From that information, we can derive the
>> linkmodes usable on the port, which can be used to limit the
>> capabilities of an interface.
>>
>> For now, the port pairs and medium is derived from devicetree, defined
>> by the PHY driver, or populated with default values (as we assume that
>> all PHYs expose at least one port).
>>
>> The typical example is 100M ethernet. 100BaseT can work using only 2
>> pairs on a Cat 5 cables.
> 
> Correction: 100BASE-TX. 100BASE-T, which covers the family of 100BASE-T
> media, includes 100BASE-T4 which is over all four pairs of the cable.
> 
 As Rob's bot made what appears at a first glance to be incorrect
comments, I'm not sure a resend is on the table yet. Do you want me to
send a v21 with the updated description ? I have the same question about
your comment on patch 2 :)

I'll gladly resend, but that'll be after the 24h cooldown.

Thanks a lot for taking a look a this,

Maxime

