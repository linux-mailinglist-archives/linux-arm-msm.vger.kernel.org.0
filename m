Return-Path: <linux-arm-msm+bounces-84078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B213FC9B8C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 14:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 47E2834845E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 13:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1092FD7A0;
	Tue,  2 Dec 2025 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EeETkfNK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LYE0WAs1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBF313E39
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680616; cv=none; b=rlDraQxE/X1m4pzKz9TpMMa0yQQTm9kDtV81lDA0wVY7bDFvZPRwa5oJfWAaH69MqwbYuwx5uzUc/chaJvUHF7xEbIbQKdqiz954HDfc90R7LE0CdXdGSW6g2DmCtJk2bcURy19pGjndYylHY4anB3ArivU4TTo53E92Q8i5Qqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680616; c=relaxed/simple;
	bh=KdKmDoBxn/rPOKUCTHhKFuAtVgA9Ufb6RRmosnME1ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MErvmHned2t8lw945ljJfF9luUNFCK+yZ1y3x03HHlWp/XtE6vHr5CknVEDkqCd30L0LYcMgDPFHIElZ2ogdZPkZNAt1UclRbHzWXYtw09P6XT2uEXyv2sv7bsQyESfsLHI116CxmWVNMahPw97DsrTvaT0W2VEKV/uCDU1Y0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EeETkfNK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LYE0WAs1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764680613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ey6wtgDcQ116K7LfiiQ+bxQUIrUIywSYa0E8sps1NXc=;
	b=EeETkfNKO7H5zy+TTTpNwtZcXYRje4MgbIAT4ah1Y57tsYleMyiQHEfgiGQ72ErAY1bW89
	NksGegEdZAK+Q5gASxx/My8vMJcqy+wBts56GIbGygwfVkFZQJMG2+RBTgiGn9aCManY2j
	Qek8kT5cUnpRtXKwFIht4oK1yfVH7VI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-5plOpfJLOkGHmXiQ3kfDHg-1; Tue, 02 Dec 2025 08:03:32 -0500
X-MC-Unique: 5plOpfJLOkGHmXiQ3kfDHg-1
X-Mimecast-MFC-AGG-ID: 5plOpfJLOkGHmXiQ3kfDHg_1764680611
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477939321e6so31867925e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 05:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764680611; x=1765285411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ey6wtgDcQ116K7LfiiQ+bxQUIrUIywSYa0E8sps1NXc=;
        b=LYE0WAs1DDSDkJyXgmhQfyA1qlDf3KHTgPYaOd+TkDuf3XF7BGA55qwbd2eACxcQQB
         tAQi1UXKhpmDgCXAR6dM+ItCNt1axhyZ0ZJVWm6+dxn23te5DjAYqKaUHCEFdNflXGhP
         f2OKAr9kWfc23uxxOQmUg3XYaD4ymIm2PIyjby2YGLHwtnpttFF/1eFfAF0QPWiFrHTx
         MLk28/TGSG3w3MRvGuJKsaVDYNcDtCc0SVepE9/mz8k7JAsOD6lT4+s0Po0XchwUupZ9
         nVOSoJjMhvxpyKHOLPrp2WsMtvoPmAe7TRKngdYtga4pAbL75TB1IgBFolK1LzS8LE1N
         Ohvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764680611; x=1765285411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ey6wtgDcQ116K7LfiiQ+bxQUIrUIywSYa0E8sps1NXc=;
        b=NerfQtGahq6X884nZZ9HeRUGGkWuQHf4/kO38FCkKTDJWaeRae3vayR5K7WZGStCPJ
         9JgBeJTH2UrtMisDQoQ4v9+wvHpUbXFvi1C2MxU9Fw3cT9hC5lGwaZiRdJG7MyoIZBbo
         yddAY3ZRYRBynArVXzxxEW7rS28ItCdQ+/Z8pNf1cPPeLfnVlY6+nKht7F/35vcHNsSc
         P5zgf7l6Odo4m3tP2euHLVdfLLrSONkIwoApE/cpxS4XwYj4vovv8o8XUQYslXwI133I
         KLQpfLxmLETE1rqgKY22hgmpGo2Z6f9snf2dSjHM603Bz8VP51IjVhwlOMI8tmY0oOmv
         LX1g==
X-Forwarded-Encrypted: i=1; AJvYcCUWlAoxX2wf23XIAaKpRmm09WzucAxEh0rvXesMYxyQNCowsA88uCMFMQ47wADCPIaMtFe9eGsM/1vHRb7q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx163kJfektWwR/TVLbtWdgQAsum0j8NRGOSJ8mSQ5Rorubl3ip
	l2JKchSaF7mZIPUn+AqzDqsouSzH1YJais045oM+wl5j8r1DwwaXrIJ+3eDNOx2QRCGMhX8SE+t
	TSIsiw5URu6p5shq/oEMhFDeWSfDE9ZKR5WkZ5M9EfjKpvzGHu3l0/RTnxtIf9CnsAxc=
X-Gm-Gg: ASbGnctddr5haTCYfqBh0araWWE2oF3kg+xJHc1HR3VISPfT+0YhPhqJzpZd6V2en6l
	48n+8QohjeewcfQw2xcpwceBE52Rtb04xqnfY+dDaxz0vcmhxuKF4g4wWjk/VCLLbZHyrS+Eq0O
	90jNoBn1gTZdlLmHnd2ya35+DlD/TFTHqFWD1YOorcFjq0fhUfYnTKwChEqBIWopjSZxKEZVH5+
	E1WRwLUSyCXAOCJ+CiTda2QoqLN15UOSdWMTyFVL/hAnMB3sOnX/5mF7Ev4U4RLajfaQ/4l949S
	3gbtBkzp7mKvsUE0kJYA6/zK8H+EpRDOZnhM31HZswi7/BdoC7lJChwUYlP3auX4cKPzUDuDGnz
	Cc6UmH0mgIfar6A==
X-Received: by 2002:a05:600c:35d2:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47904ae214emr355760535e9.15.1764680611288;
        Tue, 02 Dec 2025 05:03:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmafT5DyC4RoGwnfp5MmrgkftnBIjDmLkHPcVwpalWPTKpHlhk1u8H7c9dIZ7UKqeyugJgdw==
X-Received: by 2002:a05:600c:35d2:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47904ae214emr355760035e9.15.1764680610815;
        Tue, 02 Dec 2025 05:03:30 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add60e2sm355758785e9.6.2025.12.02.05.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:03:30 -0800 (PST)
Message-ID: <298e982d-7796-4e46-ad1d-a7f57c573f35@redhat.com>
Date: Tue, 2 Dec 2025 14:03:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251129082228.454678-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/25 9:22 AM, Maxime Chevallier wrote:
> @@ -298,138 +321,149 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>  		.speed	= SPEED_UNKNOWN, \
>  		.lanes	= 0, \
>  		.duplex	= DUPLEX_UNKNOWN, \
> +		.mediums = BIT(ETHTOOL_LINK_MEDIUM_NONE), \
>  	}
>  
>  const struct link_mode_info link_mode_params[] = {
> -	__DEFINE_LINK_MODE_PARAMS(10, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(10, T, Full),
> -	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Full, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Full, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Full, T),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Autoneg),
>  	__DEFINE_SPECIAL_MODE_PARAMS(TP),
>  	__DEFINE_SPECIAL_MODE_PARAMS(AUI),
>  	__DEFINE_SPECIAL_MODE_PARAMS(MII),
>  	__DEFINE_SPECIAL_MODE_PARAMS(FIBRE),
>  	__DEFINE_SPECIAL_MODE_PARAMS(BNC),
> -	__DEFINE_LINK_MODE_PARAMS(10000, T, Full),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10000, T, 4, 4, Full, T),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Pause),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Asym_Pause),
> -	__DEFINE_LINK_MODE_PARAMS(2500, X, Full),
> +	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(2500, X, Full,
> +					  __MED(C) | __MED(S) | __MED(L)),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Backplane),
> -	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
> -	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
> -	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
> +	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
> +	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
> +	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K),
>  	[ETHTOOL_LINK_MODE_10000baseR_FEC_BIT] = {
>  		.speed	= SPEED_10000,
>  		.lanes	= 1,
>  		.duplex = DUPLEX_FULL,

The AI review points that medium is not initialized here:

https://netdev-ai.bots.linux.dev/ai-review.html?id=437cd013-c6a6-49e1-bec1-de4869930c7a#patch-1

Is that intentional? It should deserve at least an explanation in the
commit message.

Somewhat related, AI raised on the first patch the same question raised
on a previous iteration, and I assumed you considered that valid,
according to:

https://lore.kernel.org/netdev/f753719e-2370-401d-a001-821bdd5ee838@bootlin.com/

Otherwise I think some wording in the commit message explaining why the
AI feedback is incorrect would be useful.

/P


