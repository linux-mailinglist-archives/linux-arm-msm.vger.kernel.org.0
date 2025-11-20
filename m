Return-Path: <linux-arm-msm+bounces-82695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47BC75045
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B7A34EDAD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F329735C1B1;
	Thu, 20 Nov 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l9S42diO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC57366DB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651908; cv=none; b=sVWPoucCi/x+OAYPj+nnB0XPzEdwJsDr18Ejxayr4+jUwzI3ucqBAtzgutXScxWWTC+JPv/twIqLsN1KZLjwo2CH09/T8j7KNRDe0VfbYTK27lLoQ2+rF35fgxC7TVE6ES4e3UBD3DJpifCOSJduwP4Dn/0KJfBV7ZuCTAfG9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651908; c=relaxed/simple;
	bh=KiKmLPo0LId2AqBx7SKloWwEHaffPU4qyU54oEDKIa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQL9P7T6S1zOUN3ZpkyrkSDKOYlQ0c1kE8g5de1V9CyNEvjXHo0GY+0lI/ypCH4mbcKeAFOd4swg1XGW4bjVrfJVUGXHUn+i2EI9i8eprrqwSIvbC3LoJIMtGTONsAToMcV39QxpJvuGUMZwv9lhTwKONNYKpYkwI119VcnOQ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l9S42diO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E5094E41778;
	Thu, 20 Nov 2025 15:18:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C8EC6068C;
	Thu, 20 Nov 2025 15:18:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1371810371C4F;
	Thu, 20 Nov 2025 16:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763651902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=W+w9uzAPuUadr/2vcu3RjzEbTIq1CSq9medNjoIyd0c=;
	b=l9S42diO51gPGUNuhEnHQSnWSxeL7UtQyzWf+pSUkD1kHEiJLJ2pxLkp7FW9teyxIjXeM7
	GjWKcU9mPtqPUARnLTB3ODK0eZk1VkcUWYggdmpPLYWEwWavemElCdfRIimMfNBGkrc44R
	GfJd21OqCv3vIdx3ElchM3qWyG5kH3MY8B17grroqx8eE6LefdKu7NWY2NY9qgsXmOufzK
	SPI/OvH7FwMVdEIafwEKK2MLS+gq44ozi4hBBVG84S8XT/UIoO2PlY0dPj4Mx0IwzrYzDc
	aCTBmsdZC7uM6gAaoQzZlnJlVWbMcQ7lEVSNmdFhnJRosCsGAmk0OA+xXUyoPw==
Message-ID: <2fbd40ed-40e6-4ba2-b914-1f6d2d26dc85@bootlin.com>
Date: Thu, 20 Nov 2025 16:18:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports
 representation
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
 <20251119195920.442860-4-maxime.chevallier@bootlin.com>
 <20251119195400.1bf0cc68@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119195400.1bf0cc68@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 20/11/2025 04:54, Jakub Kicinski wrote:
> On Wed, 19 Nov 2025 20:59:04 +0100 Maxime Chevallier wrote:
>> diff --git a/net/ethtool/common.c b/net/ethtool/common.c
>> index 2f4b70f104e8..8216e4ada58e 100644
>> --- a/net/ethtool/common.c
>> +++ b/net/ethtool/common.c
>> @@ -460,6 +460,21 @@ const struct link_mode_info link_mode_params[] = {
>>  static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>>  EXPORT_SYMBOL_GPL(link_mode_params);
>>  
>> +const char ethtool_link_medium_names[][ETH_GSTRING_LEN] = {
>> +	[ETHTOOL_LINK_MEDIUM_BASET] = "BaseT",
>> +	[ETHTOOL_LINK_MEDIUM_BASEK] = "BaseK",
>> +	[ETHTOOL_LINK_MEDIUM_BASES] = "BaseS",
>> +	[ETHTOOL_LINK_MEDIUM_BASEC] = "BaseC",
>> +	[ETHTOOL_LINK_MEDIUM_BASEL] = "BaseL",
>> +	[ETHTOOL_LINK_MEDIUM_BASED] = "BaseD",
>> +	[ETHTOOL_LINK_MEDIUM_BASEE] = "BaseE",
>> +	[ETHTOOL_LINK_MEDIUM_BASEF] = "BaseF",
>> +	[ETHTOOL_LINK_MEDIUM_BASEV] = "BaseV",
>> +	[ETHTOOL_LINK_MEDIUM_BASEMLD] = "BaseMLD",
>> +	[ETHTOOL_LINK_MEDIUM_NONE] = "None",
>> +};
>> +static_assert(ARRAY_SIZE(ethtool_link_medium_names) == __ETHTOOL_LINK_MEDIUM_LAST);
> 
> Thanks for reshuffling things, this one needs a static tho:
> 
> net/ethtool/common.c:463:12: warning: symbol 'ethtool_link_medium_names' was not declared. Should it be static?

Ok I figured that I didn't have sparse installed locally, so the
local NIPA build "build_allmodconfig_warn" didn't go through.

That's fixed now, hopefully even less bugs next time !

Maxime


