Return-Path: <linux-arm-msm+bounces-82496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 422CBC6EE57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id B222329744
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 13:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D50535E526;
	Wed, 19 Nov 2025 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pe1Fcnas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5569031A05B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558970; cv=none; b=j+TgDb1laqCvGE6PoPESG0E4WunqPXCgxxYblSrYWOTy+ixMIDEdFMqWMbtYUiPVYKQdLipzpkwHqe8LH3caziZnRZqQzVsaDE1mj8ea7U/2QIV15/n5b+Dr8YCTV8CFcyxVIQReddf9bUJVLt8ztcHmPOaSXYx1NvxYNzyXnR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558970; c=relaxed/simple;
	bh=qw70Gd/8aPnigjGd4TFxyj7CW7WiK8MjE5NahwJDp/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/hPsHwGkMGPmVSgPQKyD/bFE29zb1c35Z+h38bzW9AnEQIVbC1Y/wjp2HpBr5KhDN7jEDG84eqGlqvhZ04XGBr9U8o6btW3uwIrz6Eh88Ez37HK8ShEkTLWY8ab3iuVD5ENscDlJ1CcuNXuu2SuVe2rshfqLcsQpT5nklSqtEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pe1Fcnas; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65054C11188;
	Wed, 19 Nov 2025 13:28:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9307F60699;
	Wed, 19 Nov 2025 13:29:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 239FB10371A57;
	Wed, 19 Nov 2025 14:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763558960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QCeVgdlyRn3to5o8svSAQCYCIaAyOrCinIsywtbsnqc=;
	b=Pe1FcnasPMVjycj+4K0o7Bt+G5cxX2nnbT/fjuTU12uOoD4C3dTkyrWYHDi4XbjOerISVJ
	GiBRvYSi1g+DJiRpzTmUx46bAYXMDyGPbCQO2SLSqf0G1FD5Ot/to08c5dMt4qwhoVjffU
	37zIfMQw1phSkaC1c/UNsBu4sEVa6I96q563Ij2ZArqeBPQaaRxRQn/qFGDgK9b1CakKZw
	+QkZhMbpKEb0PxoTkvEClXSlBk4+/4wVOW+TfgWXpgzfxptQVhNs/R9RCcqX2Xcr/leEzs
	eAupQQBmU4B84dRKUW9STIjPPYVKbLbTmcmWdRne8rlSpmzA3wUjDBd4WnJktw==
Message-ID: <57aa6516-ae7d-4d8d-9ae4-70bd6557547f@bootlin.com>
Date: Wed, 19 Nov 2025 14:29:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 02/15] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
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
 <20251113081418.180557-3-maxime.chevallier@bootlin.com>
 <20251118191517.1a369dad@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251118191517.1a369dad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub,

On 19/11/2025 04:15, Jakub Kicinski wrote:
> On Thu, 13 Nov 2025 09:14:04 +0100 Maxime Chevallier wrote:
>> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
>> index c2d8b4ec62eb..ad2b5ed9522b 100644
>> --- a/include/linux/ethtool.h
>> +++ b/include/linux/ethtool.h
>> @@ -216,13 +216,26 @@ static inline u8 *ethtool_rxfh_context_key(struct ethtool_rxfh_context *ctx)
>>  void ethtool_rxfh_context_lost(struct net_device *dev, u32 context_id);
>>  
>>  struct link_mode_info {
>> -	int                             speed;
>> -	u8                              lanes;
>> -	u8                              duplex;
>> +	int	speed;
>> +	u8	lanes;
>> +	u8	min_pairs;
>> +	u8	pairs;
>> +	u8	duplex;
>> +	u16	mediums;
>>  };
>>  
>>  extern const struct link_mode_info link_mode_params[];
>>  
>> +extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
>> +
>> +static inline const char *phy_mediums(enum ethtool_link_medium medium)
>> +{
>> +	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
>> +		return "unknown";
>> +
>> +	return ethtool_link_medium_names[medium];
>> +}
> 
> Will this function be called by a lot of drivers? Would be great to
> find a more suitable place for it, ethtool.h is included by thousands
> of objects :(

I expect this to be mostly used by the current DT parsing code, as well
as a few print statements in the core. So indeed let's move this
somewhere more specific.

> 
>>  /* declare a link mode bitmap */
>>  #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
>>  	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
>> diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
>> index 8bd5ea5469d9..6ed235053aed 100644
>> --- a/include/uapi/linux/ethtool.h
>> +++ b/include/uapi/linux/ethtool.h
>> @@ -2587,4 +2587,24 @@ enum phy_upstream {
>>  	PHY_UPSTREAM_PHY,
>>  };
>>  
>> +enum ethtool_link_medium {
>> +	ETHTOOL_LINK_MEDIUM_BASET = 0,
>> +	ETHTOOL_LINK_MEDIUM_BASEK,
>> +	ETHTOOL_LINK_MEDIUM_BASES,
>> +	ETHTOOL_LINK_MEDIUM_BASEC,
>> +	ETHTOOL_LINK_MEDIUM_BASEL,
>> +	ETHTOOL_LINK_MEDIUM_BASED,
>> +	ETHTOOL_LINK_MEDIUM_BASEE,
>> +	ETHTOOL_LINK_MEDIUM_BASEF,
>> +	ETHTOOL_LINK_MEDIUM_BASEV,
>> +	ETHTOOL_LINK_MEDIUM_BASEMLD,
>> +	ETHTOOL_LINK_MEDIUM_NONE,
>> +
>> +	__ETHTOOL_LINK_MEDIUM_LAST,
>> +};
> 
> Why is this in uAPI? I'd have expected it to either exist in the YAML
> spec if there's a new uAPI that needs it, or in kernel headers.
> Let's move it out for now to be safe, we can always move it in.

I originally planned to report that in linkmodes et.al. but changed my
mind, let me move that out as well.

> 
>> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
> 
> Ditto.

Thanks for taking a look,

Maxime

