Return-Path: <linux-arm-msm+bounces-47774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFEBA32A4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59C5D188CC7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 15:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C2F2135B0;
	Wed, 12 Feb 2025 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fqz5bnvt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1421621129F;
	Wed, 12 Feb 2025 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374793; cv=none; b=npAWQ5St4lKLA7fZdWT1viXNG1wvhf7WF0BAc7ooPAnYBUDc7m6HgC9uA5gGSAPMZ0CxMa56a+fPMKMzG2YOnFDz3NScvXOhAvLCM6bT1hhEubkaJZrJT/aFge2Q62Ip+UYyqYZQWFTWOdvkln8hxFvYxsguJRk/AnVGzrhZp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374793; c=relaxed/simple;
	bh=3z+OUDZVEpd6KTuA41lQ6fdesEzkm8fAbRNuIOcZxoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMGjWWRwY+FH91L0iKhsIczwQtRPgAqj8xvdLdW5XgQCpyDJQDD4ZbK3nDVr4TFwSGpiuQ/rybzPhMUjWuLS1913efeaG58PY8UFFqAfRY7CWkQ1mSASqiQ3ZZDUy92mW8U8CFy7yl8IGHuzAF6yfHaEo7L10YL+OQMKc9+s9Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fqz5bnvt; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-471a4f8bf65so535721cf.3;
        Wed, 12 Feb 2025 07:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739374791; x=1739979591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HbouPgm0agqCXksCDmZHeVO+0y6FRGzW0Of6wTqd3II=;
        b=Fqz5bnvt2eCgNW9Pesi3prVx74U4sd55qAIVu1gH/ChzP1lYz4bVsH3MQ48MuVz3tM
         9HV7f7FGotPuY6b3QVgSKjA09jAR/XTp9CqvKyIdahJUNDqwo4vdOH4zWd9Mi1AjA5Um
         rFQ80qfl/TTfo19mNU8bfno/WOy5V/jIQ9NZsMG6XBvZqedUDQC35ufsEOGzqZHhm9SD
         B3nWxG8fJ2LKpVuI09NkeltyI11p2Qp/TY8Rlhu9XMLXEO/t7pLiVW10/Egpg82V5xF+
         S+AvJqZRK0XrMXsmku6gvgTyVp0sjqbnJGUghThPpi+Bj0LZhoU0Ghro0XYnQjB1hdkw
         q/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374791; x=1739979591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbouPgm0agqCXksCDmZHeVO+0y6FRGzW0Of6wTqd3II=;
        b=q2iFUpUEORKgMaTMgcXtx0+DE+comgN4zBQ1JGy5AspkPgV4/OJaSUHQftPLwXDcuu
         URiK3rDd2kLRySQU9VpRzDccjrVzdYcskYkoSky2Wl/vviF9I5Hw0yrZHI2k4DsdRN/M
         f/8z1OtUQQNPKp1yAt9qEUWJBsQ0t7HbRHdMkztwNmbtILo2LYi9XOCIF8eO0bs2ZERL
         uzFNPEf/S+bCVC4A9204mVt7tchPMmZ1msEMwM1jmp9Vb40nFWF70C/jFm9MCd5aq/c+
         tPJPd2TwhxWZNkiHUfa7axhyTmSlW9wiy+PAm8Fll8gGURJ0fdeTQ3M5ysfetNf8/0WS
         p7EA==
X-Forwarded-Encrypted: i=1; AJvYcCVt7Oeqnec5F+WO4zHqAuq/6bghKCwZxSvR4XKJXTfUke0O8ebN/G9pYU2d/pOeoNpHRa18ftyI@vger.kernel.org, AJvYcCWMcnvvYbWLZnWaOQjCRNig7v5TI9vPAlZkqsbNudGi2Xt+rH5nseWi1fBOeEYK3qEcEfTY536Pn6hO@vger.kernel.org, AJvYcCWud1B+IiOQu928UYpKPlxbBiXaPkdey46lc0bYmRklf5BQPS0QjtoHgZKYCdz/GFm9k65CwD/wQgVo0VTQxQ==@vger.kernel.org, AJvYcCXkAO7gJvs4k9GiYLQaGTAx7W3NMkYaUrjttXMH3F04Z09rsX9GhhTpQEErWpDrVkhW6+4QW7NZLXthVLPl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3JXH96IMnt91S4373H4w6RkOO/NoqFnSM1OwcQTOxvGSSUBm
	cXKLkB2imbuZpEV7uzrckFT/qEhY1k4JukTp6RWFyOFOtWfNHIMX
X-Gm-Gg: ASbGncsYyuPMsD1CGDOMXm89EIOjlzUB24gFD2wHY/nR1wwzUUsNwbYCa4gPU3J6Y7a
	BaUjKFITMKscS9mCyhrTtcGb2AVdgy2x9tJLOPQYYoPc2UK54DD81yZRcT2gsSilk+eg5JPgU3c
	m06HUCPFPSSb4vvqUkSYULlHRFzoBf2sBUri+ftw3UwzKTa6HWU8GF3pyz1bVOFx7MStaO706r9
	hYJB2sEEqOyzde2b7n8mNCkvbMINvLQUC7DjYm6WXUeSBcyCp1mQGujeKhhe7eitrqHaihJOfGF
	Y1pdEVpEgppf+uFQtsoj1mX0EYPZXYD10ujFLT4z7n99iyFerSpgNSEJtJxIurMh9LI=
X-Google-Smtp-Source: AGHT+IF+MmctVYs07ml0PNL3TjoY/lXXGyUEn0qQZbuTuskppxtwfI/b18sBj2L2nJE1T1LQBrflrg==
X-Received: by 2002:ac8:59ce:0:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-471afdf1d29mr22021761cf.3.1739374790839;
        Wed, 12 Feb 2025 07:39:50 -0800 (PST)
Received: from [192.168.1.201] (pool-108-28-192-105.washdc.fios.verizon.net. [108.28.192.105])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471492a90bcsm76580671cf.31.2025.02.12.07.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:39:50 -0800 (PST)
Message-ID: <c927247b-e39c-8511-d95c-77fb23b82808@gmail.com>
Date: Wed, 12 Feb 2025 10:39:48 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port representation
Content-Language: en-US
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=c3=b2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
 <8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
 <20250210095542.721bf967@fedora-1.home>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20250210095542.721bf967@fedora-1.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 2/10/25 03:55, Maxime Chevallier wrote:
> Hi Sean,
> 
> On Fri, 7 Feb 2025 21:14:32 -0500
> Sean Anderson <seanga2@gmail.com> wrote:
> 
>> Hi Maxime,
>>
>> On 2/7/25 17:36, Maxime Chevallier wrote:
>>> Hello everyone,
>>>
>>> This series follows the 2 RFC that were sent a few weeks ago :
>>> RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
>>> RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/
>>>
>>> The goal of this series is to introduce an internal way of representing
>>> the "outputs" of ethernet devices, for now only focusing on PHYs.
>>>
>>> This allows laying the groundwork for multi-port devices support (both 1
>>> PHY 2 ports, or more exotic setups with 2 PHYs in parallel, or MII
>>> multiplexers).
>>>
>>> Compared to the RFCs, this series tries to properly support SFP,
>>> especially PHY-driven SFPs through special phy_ports named "serdes"
>>> ports. They have the particularity of outputing a generic interface,
>>> that feeds into another component (usually, an SFP cage and therefore an
>>> SFP module).
>>>
>>> This allows getting a fairly generic PHY-driven SFP support (MAC-driven
>>> SFP is handled by phylink).
>>>
>>> This series doesn't address PHY-less interfaces (bare MAC devices, MACs
>>> with embedded PHYs not driven by phylink, or MAC connected to optical
>>> SFPs) to stay within the 15 patches limit, nor does it include the uAPI
>>> part that exposes these ports to userspace.
>>>
>>> I've kept the cover short, much more details can be found in the RFC
>>> covers.
>>>
>>> Thanks everyone,
>>>
>>> Maxime
>>
>> Forgive me for my ignorance, but why have a new ethtool interface instead of
>> extending ethtool_link_settings.port? It's a rather ancient interface, but it
>> seems to be tackling the exact same problem as you are trying to address. Older
>> NICs used to have several physical connectors (e.g. BNC, MII, twisted-pair) but
>> only one could be used at once. This seems directly analogous to a PHY that
>> supports multiple "port"s but not all at once. In fact, the only missing
>> connector type seems to be PORT_BACKPLANE.
>>
>> I can think of a few reasons why you wouldn't use PORT_*:
>>
>> - It describes the NIC and not the PHY, and perhaps there is too much impedance
>>     mismatch?
>> - There is too much legacy in userspace (or in the kernel) to use that API in
>>     this way?
>> - You need more flexibility?
> 
> So there are multiple reasons that make the PORT_* field limited :
> 
>   - We can't gracefully handle multi-port PHYs for complex scenarios
> where we could say "I'm currently using the Copper port, but does the
> Fiber port has link ?"
> 
>   - As you mention in your first argument, what I'd like to try to do is
> come-up with a "generic" representation of outgoing NIC interfaces. The
> final use-cases I'd like to cover are multi-port NICs, allowing
> userspace to control which physical interfaces are available, and which
> t use. Looking at the hardware, this can be implemented in multiple
> ways :
> 
>             ___ Copper
>            /
>   MAC - PHY
>            \__ SFP
> 
> Here, a single PHY has 2 media-side interfaces, and we'd like to select
> the one to use. That's fairly common now, there are quite a number of
> PHYs that support this : mv33x3310, VSC8552, mv88x2222 only to name a
> few. But there are other, more uncommon topologies that exist :
> 
>                             ____ SGMII PHY -- Copper
>                            /
>   MAC - SGMII/1000BaseX MUX
>                            \____ SFP
> 
> Here, we also have 2 media-side ports, but they are driver through
> different entities : The Copper port sits behind a single-port PHY,
> that is itself behind a *MII MUX, that's also connected to an SFP. Here
> the port selection is done at the MUX level
> 
> Finally, I've been working on supporting devices whith another topology
> (actually, what started this whole work) :
> 
>              ___ PHY
>             /
>   MAC --MUX |
>             \__ PHY
> 
> Here both PHYs are on the same *MII bus, with some physical,
> gpio-driven MUX, and we have 2 PORT_TP on the same NIC. That design is
> used for link redundancy, if one PHY loses the link, we switch to the
> other one (that hopefully has link).
> 
> All these cases have different drivers involved in the MUX'ing (phy
> driver itself, intermediate MUX in-between...), so the end-goal would
> be to expose to userspace info about the media interfaces themselves.
> 
> This phy_port object would be what we expose to userspace. One missing
> step in this series is adding control on the ports (netlink API,
> enabling/disabling logic for ports) but that far exceeds the 15 patches
> limitation :)
> 
> Sorry if all of that was blurry, I did make so good of a job linking to
> all previous discussions on the topic, I'll address that for the next
> round.

Thanks for the detailed explanation, especially regarding PHY redundancy.
Could you add it to a commit message (or even better to Documentation/)?

--Sean

