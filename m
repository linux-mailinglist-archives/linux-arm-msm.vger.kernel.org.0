Return-Path: <linux-arm-msm+bounces-82498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBEC6EE87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id DFC3B2975E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 13:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8663523D7EA;
	Wed, 19 Nov 2025 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DxkpUbxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75AC230D0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559046; cv=none; b=GHu9krA4g7j/UkJUQtxN5SVtVqtu0AI5yFYYkHxXJ2OmQNPXtYw6yUNmW2T0tDMVwy4WeHegZMWVuSb0jOXvFNLj5pCe8tBDTdfsigahViSV5q33yRVqe3bPXpKZVN4WeOA2SgchwzXJpk2La9aOvXMxaGO+PC/+0eEN0dz4pWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559046; c=relaxed/simple;
	bh=0JSaxk1aJKMXj2rYXl+mGjnieA9lFuG4mq2Q7ZheaDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwLWq35w4dUNPty9aRKH0+vCuO0yOwv5W+DDEw8CYfYw+8whwrIoit4ABV93voHLI2D3zQD4ALA5gJrPGvb98kMI+yFQ+T5uGJ93PDAytcTO3SF/EYdHEQhAm2sdmcer/yVQn8W4yMuvg0YVvGi4J117QyF7NQ9sPPRi/Hj2FJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DxkpUbxv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D0323C11188;
	Wed, 19 Nov 2025 13:30:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13CD160699;
	Wed, 19 Nov 2025 13:30:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC661103719E1;
	Wed, 19 Nov 2025 14:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763559041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HEGot4h9kychVL6laGKD8TzXIABfNJFUf/+dWi3bwb8=;
	b=DxkpUbxvYUvghPJX54p4X0tkKAiJXsbu/Ic29R2ZsICFN2uEEaHrbyPJ2F2ndjLmvTkGAK
	VjuoqFWJ+UGTD9T3iGk4aBqS7BfxuDj1M9coYMXnLMR0mV6VrBYFJwoPn2UF0z3C8jhf3G
	iS5e/fmC3INoC1yWvLlnZ91yPAdD5vtZIy/e2jM1sA9vnwwDCsTP4qRcK4ZlHa8Wsn2KJJ
	CSstZ4lPJLRpW2mzW6jQOse8IxIXggs1kTedY2uFzn+5SqLHABMZwlNzMnZSQ90K75YHwr
	lgOGJNJxz5IWyb5rkQI4ozsITzQU0G+78XsgZFcrL9KNelYWNZ5UtGEL346jOA==
Message-ID: <56d3f69a-0a03-43a1-aa41-6b32c6360c7f@bootlin.com>
Date: Wed, 19 Nov 2025 14:30:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 03/15] net: phy: Introduce PHY ports
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
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-4-maxime.chevallier@bootlin.com>
 <20251118191523.4719ca2c@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251118191523.4719ca2c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 19/11/2025 04:15, Jakub Kicinski wrote:
> On Thu, 13 Nov 2025 09:14:05 +0100 Maxime Chevallier wrote:
>> --- a/include/linux/ethtool.h
>> +++ b/include/linux/ethtool.h
>> @@ -228,6 +228,10 @@ extern const struct link_mode_info link_mode_params[];
>>  
>>  extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
>>  
>> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
> 
> Hm, I think this is defined in uAPI as well?

hmpf indeed... thanks for spotting this

> 
>>  static inline const char *phy_mediums(enum ethtool_link_medium medium)
>>  {
>>  	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
>> @@ -236,6 +240,22 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
>>  	return ethtool_link_medium_names[medium];
>>  }
>>  
>> +static inline enum ethtool_link_medium ethtool_str_to_medium(const char *str)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < __ETHTOOL_LINK_MEDIUM_LAST; i++)
>> +		if (!strcmp(phy_mediums(i), str))
>> +			return i;
>> +
>> +	return ETHTOOL_LINK_MEDIUM_NONE;
>> +}
> 
> Same comment about possibly moving this elsewhere as on phy_mediums()

No problem :)

Thanks !

Maxime

> 
>> +static inline int ethtool_linkmode_n_pairs(unsigned int mode)
>> +{
>> +	return link_mode_params[mode].pairs;
>> +}


