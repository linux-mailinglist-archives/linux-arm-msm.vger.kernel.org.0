Return-Path: <linux-arm-msm+bounces-82632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E7C72BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D7393349BEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB3427B349;
	Thu, 20 Nov 2025 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zO53s/w0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591D93009EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626488; cv=none; b=htYXaMQY6HPmoy69NGRjomuCOu0+GUiYGsc14+Cv33R+gY2wjCFLJJozgI9SQJSCYlSEVS/Uz0Qj/WE0wjoGB0c2Cq2fwHG3uoay+/O/BfusPmJZ/DIj87IAomWU/drapOjpb6lP+1fdoFISNit7lM5W6wgJdi2CTKp4+RkKFIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626488; c=relaxed/simple;
	bh=4M3rIlDgfGY2KP0GGEpH34NIuXvhKUUboZiFUNvEWSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKM5BhHovwhtJ7aYscqjhlArz8BhexAG16FguLJvmmFRZQ0CHRsYG5zug3wDX8bSwcOfYfiCvRj/ZREkUgyNt3DNQrqikFjw1Bs0XW/fK9BsRwwGr0JSBijL56+Aee/DBIPIx4tqAvCgnViEmL70Fo7BaNaagQgmB3ssdn2HiM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zO53s/w0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F6C31A1C20;
	Thu, 20 Nov 2025 08:14:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2888D6068C;
	Thu, 20 Nov 2025 08:14:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2463810371BE5;
	Thu, 20 Nov 2025 09:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763626483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=04pEPH5W1KZzvKj2XXuseVAsQtkSJz6OArHi5Tto5KU=;
	b=zO53s/w0VCdf+TA3nqmIBY3AO6g2hAcIA8DYJg+Ur8lzFILy38/OMfKYSQ+ZWW4du3nKeG
	TaIzz/Lc8SeReN6qrxdnf52ZQqv8Styxa8pscrO72QV9f0PKjdMWJsxF8dHVlTD+0AMOnX
	vs1Bdl3BLh5uSif2yxUad37+pzs0McyAq9JMmw6audHClyPHRmRJkFDnD3EYimer8auZhK
	pme+Y01qHFkt3vlfXUqplZ2pvegrCpRugViRQTqsIVXvmORw8N1mWZsglY+BAaozClZoKG
	d5DoLtYlP73V22dpwdFeNsQ07vPVl4hhxer5xnFxmeFSlwzUHiE9ZbIVxpWCbQ==
Message-ID: <61f73cda-b3d8-44da-a210-34ea15888d24@bootlin.com>
Date: Thu, 20 Nov 2025 09:14:33 +0100
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

hmpf I hesistated for some dumb reason... I'll respin after the usual
cooldown.

I'll keep Christophe's review tag though, as this is just adding the
static keyword :)

Maxime


