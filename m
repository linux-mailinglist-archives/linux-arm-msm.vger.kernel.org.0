Return-Path: <linux-arm-msm+bounces-84101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00469C9C05D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 16:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE25A4E3BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 15:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74B4320CD1;
	Tue,  2 Dec 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0DIW3mVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345731578B;
	Tue,  2 Dec 2025 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764690534; cv=none; b=p3zFjrc/bWNjzFgdJrbyEYfoQ+UtHgTB3pr7ZnqUNd4ph+j0q+ebzgpcUSBWebI1LDhCk6tYzxvzFLWcA0ldL3qemPGhpaP+p2vApxLNbt0I5OyrjJpD6HuzP7LGTflpz6lIk9f6Ngmgrw/zEf4XaXRFaXr7rPdoVR00ZIHO3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764690534; c=relaxed/simple;
	bh=K1tR2iuSOs6vNvplJ2wKOeNyl3VhtwG9KecCIqkktbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSef3GKYO9qQmjRFDEv72vbQoxOLi53CikBNG124xnOG48vYBx9PmmAryS7ZjxqXYIcX934KmIj0g5W74AW6rNWiFUr+EJBF+Z8wLMVCFmpKmljQpY/sti5k5qGYSOBBu+1Ts2nfv5TrFytLMHFqwsfxJpMiHPBnVp+6AmgZ8lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0DIW3mVp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E1A404E419DB;
	Tue,  2 Dec 2025 15:48:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB9EE606D6;
	Tue,  2 Dec 2025 15:48:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9088811919C22;
	Tue,  2 Dec 2025 16:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764690528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rMIFzfxad91ubA6fyH1uZaF1Zu4vkX1bopp9UAEB1ok=;
	b=0DIW3mVpRWiI2wPcbqGnJN+i3obaZkrmas/VrjGd8XMI25WcIAJG9yk2nxOGGumtlKjaml
	cQQZyCjT2C66qpCtLoyAQCeUCWxBb/KV2J6FpEMYCVV5vLmZ1tVg3oOxsJX61uVgiJeDXF
	O1HzokU48HCHr8r6SCbeCwT/5OB9xo6XmuFgvpZEj+VfvbHDOSuTjpZLc9FGN3LFtip1+2
	4o2gNvUWlmaS8TTC3Basjl6KnwfV9a3fYLCniuGvpyRO/Vwrpf0LGzeHdVeMV4NoffY8m7
	Kf5bBhs8qOCODQqGcWFMhQpF6+P5omRFiyPjLF3sGh3HhyUz27FIMEYQqYTSqA==
Message-ID: <49709595-5012-4fa3-9616-839dcdbf6b09@bootlin.com>
Date: Tue, 2 Dec 2025 16:48:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
To: Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
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
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-3-maxime.chevallier@bootlin.com>
 <298e982d-7796-4e46-ad1d-a7f57c573f35@redhat.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <298e982d-7796-4e46-ad1d-a7f57c573f35@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Paolo

On 02/12/2025 14:03, Paolo Abeni wrote:
> On 11/29/25 9:22 AM, Maxime Chevallier wrote:
>> @@ -298,138 +321,149 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>>  		.speed	= SPEED_UNKNOWN, \
>>  		.lanes	= 0, \
>>  		.duplex	= DUPLEX_UNKNOWN, \
>> +		.mediums = BIT(ETHTOOL_LINK_MEDIUM_NONE), \
>>  	}
>>  
>>  const struct link_mode_info link_mode_params[] = {
>> -	__DEFINE_LINK_MODE_PARAMS(10, T, Half),
>> -	__DEFINE_LINK_MODE_PARAMS(10, T, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
>> -	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
>> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Half, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Full, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Half, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Full, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Half, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Full, T),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Autoneg),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(TP),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(AUI),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(MII),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(FIBRE),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(BNC),
>> -	__DEFINE_LINK_MODE_PARAMS(10000, T, Full),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10000, T, 4, 4, Full, T),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Pause),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Asym_Pause),
>> -	__DEFINE_LINK_MODE_PARAMS(2500, X, Full),
>> +	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(2500, X, Full,
>> +					  __MED(C) | __MED(S) | __MED(L)),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Backplane),
>> -	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
>> +	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
>> +	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
>> +	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K),
>>  	[ETHTOOL_LINK_MODE_10000baseR_FEC_BIT] = {
>>  		.speed	= SPEED_10000,
>>  		.lanes	= 1,
>>  		.duplex = DUPLEX_FULL,
> 
> The AI review points that medium is not initialized here:
> 
> https://netdev-ai.bots.linux.dev/ai-review.html?id=437cd013-c6a6-49e1-bec1-de4869930c7a#patch-1
> 
> Is that intentional? It should deserve at least an explanation in the
> commit message.

Yes it is OK, however I don't really know how to answer AI on that. I'm
sorry it's still a bit blurry to me what's the right way to proceed with
these reviews.

Should I paste the AI report, then reply to it ?

I'd rather add more comments to the code than say in my commit log "AI
says xxx, it's wrong because blabla" though.

> 
> Somewhat related, AI raised on the first patch the same question raised
> on a previous iteration, and I assumed you considered that valid,
> according to:
> 
> https://lore.kernel.org/netdev/f753719e-2370-401d-a001-821bdd5ee838@bootlin.com/

So I don't know either how to proceed with this. dt_binding_check is
fine with the current state, and Rob acked the patch. I am not sure how
it's going to be received if I reach out to DT maintainers saying "the
netdev LLM said XXX, is this correct or hallucination ?", but it may
very well have a good point. I did try to dive into the yaml and then
json schema specs, but I wasn't able to go far enough to reach a proper
conclusion on wether we must remove "contains" for scalar :(

All of that would be a bit clearer if the AI review was on the ML, but I
also understand the risk for pollution with that, especially at an early
stage of adoption.

> 
> Otherwise I think some wording in the commit message explaining why the
> AI feedback is incorrect would be useful.
> 
> /P
> 

I'll update the commits and add comments anyways. I guess in a month
though, with net-next closed then the end of year.

Thanks,

Maxime

