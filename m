Return-Path: <linux-arm-msm+bounces-47223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7FA2D2FA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 03:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6953E188D203
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 02:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EB4149C41;
	Sat,  8 Feb 2025 02:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqCg5xFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD02BAF9;
	Sat,  8 Feb 2025 02:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980879; cv=none; b=rAFi8G+C77eY3YvrDEWvHXIuSW+vJdwvq6ZVMi5U1DILbIZk7PbFnKPZ+eNZrzDOY/hlzRayGV55MB/EEcu6vIfYGY8YW9mPnkNeGitR+cFH/5mBB8IgSxywJ9zAK1EnVvij2IKcTfPMKlgDBgnlDALUA5BtHd6kWrw2KiOajNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980879; c=relaxed/simple;
	bh=coAPJBA0TgnnXie5n+36MkiQOZmJDu0E3V4IHnF8ApA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwHvuq51kweaD8yaTAGOBMee/ddQ17OrW/qh8U1cHle09AjHL3xsfl3u1rxl36WjxTZUcTqnhby2BlMM9hlKPmmz03Kdy83Atz7jZUvJfyGjWVU5/L6Lj6bqjPq4pKx7G7nhWUgLF4C2PMrcmoi0CVtnQDS88n7a3LSabPNb5+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqCg5xFq; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6ffda45f3so37721085a.2;
        Fri, 07 Feb 2025 18:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738980876; x=1739585676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5/SN3DCvwYBNYU4/IONaZxto7bXDguxKcJOD+fv9VM=;
        b=lqCg5xFqT+DKFh7FNEaa6tNeGqlHBOYtMHCbPdR9fsYy/TgZO6NhG7V7f7PsZyGu/o
         mXS5+oasaVG2hNx2gDqvk1E1WB+l14xZ6DlvrMH7XBWfjFap9x27P9eaiChZGcvRX1If
         Axuhkz0szVs+cLKG5TUJSBa/25CBb0U2J5CLfg5LllZN4JlqIOF+sAJHQ0OHaD/zxIPy
         NPOTbs2dA7yFUwrgAbZN977F8G25V0qObfpyMY44fAihui3yDG5VzCMIaw/URjn4mXba
         poMs9jDSaExjhCGoym1SpiLR2+4TUtNG6dktaLhDVgvBoRJi7Etv77rC6HNbjXW2gb3j
         whVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980876; x=1739585676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5/SN3DCvwYBNYU4/IONaZxto7bXDguxKcJOD+fv9VM=;
        b=g2Z8L1i13aAAO8ZONhoILaF9L28AxWoFwM7P4Ggk2cNEg56KOtt8Cv0YWG19k1A++o
         97LIaX4ZdeXqRWNYAKsxBqbD1lO6evN2LNjZc72YODtAHxjvLWbhhYwOvKkisxgTvLet
         K4X96Wmg7+Az3ka9lEUJoVC1I0wGrWnvg1NXifG9ZfnMCsjZ8vGz112l0HQOzW7AW9E3
         NuEiyGwBh8obHeQg5QIg3E/wYQj27ClSxY2Gy/qfY6UYKeRQl0X+PCJlDSM+xi7YMjcs
         KEwzsiJKlF9+T5s40+b4/XFKpZl2s87OQSaronMCSepQa9ifvFRfqeOgjnNIMm7c/edN
         oGxA==
X-Forwarded-Encrypted: i=1; AJvYcCV8NT1BXQXCRbQPEynq9xx0+SkdBI6oHL9Tn9bb9UlmkpIpwB7C0uEzcYy5z4/LA7vz2S7mJcu3R4sn@vger.kernel.org, AJvYcCVMRO50FGR+xwfzw4ykFZdoVc+YLSy+kHfn9J4sH9leDqSpB97vj7YenPX0sZiKVI/yP93lWVtSxVn+E+JM@vger.kernel.org, AJvYcCW2yBMWPSKRafmHs6/X9/puXawimMqvfMw4gPoOElkbZDvv4z4pvUtLxqbUvq0ihMiJkGBaAcp40wZaVEUreQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1j7V+WOcgn0ukZ+BPnDvqeWVKYsw+ghaXyqZIrOJFPUBxlsE
	3AJWaLcR89D6hWmPSNr5kNnHPwklfYw5Sa1SOK5tcgz8LPIUvizH
X-Gm-Gg: ASbGncsZLmmmBJh+mpE0XwKZSxtQ/OyRxuXxjdrh9SmyO6gz4XDfZQgiBRjQPTSahPO
	ZdN+OjtniaVrr5P3BdKJGOrmMMAX0MSdHlOlm5Eux/az15oqVav/0ejyIUZeUWW3/XY44e3W/TX
	5TxyKodqzJ1Xv7d8MFiWQsw9HkStV6qiibfsPg+M8161LdGvl4o2dgpaSkyr08y2yEybZMwlcQC
	yKcp6UdYYxslLOZzb8SGDxkP270SfJBC/NA6B8jHYS65qF4TKDglPgxS2d5750SDME7KpfBgYnz
	uUKqcSO1KaCG9VLIBuKN7oMdOu3LseeVGb4I/qZn2xyC5Ije2lPydVPhKVhFu63tpek=
X-Google-Smtp-Source: AGHT+IHaHLnQCpbgV9vtfeCu+dFr6ymQXG7wzjMf9uGoP8yh8kD6+ACPqZoUxJqmQwOKBWPlDIRBWg==
X-Received: by 2002:ad4:576b:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e4455e878bmr24319206d6.4.1738980876519;
        Fri, 07 Feb 2025 18:14:36 -0800 (PST)
Received: from [192.168.1.201] (pool-108-28-192-105.washdc.fios.verizon.net. [108.28.192.105])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e45074741fsm4078006d6.15.2025.02.07.18.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 18:14:35 -0800 (PST)
Message-ID: <8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
Date: Fri, 7 Feb 2025 21:14:32 -0500
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
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
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
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 2/7/25 17:36, Maxime Chevallier wrote:
> Hello everyone,
> 
> This series follows the 2 RFC that were sent a few weeks ago :
> RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
> RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/
> 
> The goal of this series is to introduce an internal way of representing
> the "outputs" of ethernet devices, for now only focusing on PHYs.
> 
> This allows laying the groundwork for multi-port devices support (both 1
> PHY 2 ports, or more exotic setups with 2 PHYs in parallel, or MII
> multiplexers).
> 
> Compared to the RFCs, this series tries to properly support SFP,
> especially PHY-driven SFPs through special phy_ports named "serdes"
> ports. They have the particularity of outputing a generic interface,
> that feeds into another component (usually, an SFP cage and therefore an
> SFP module).
> 
> This allows getting a fairly generic PHY-driven SFP support (MAC-driven
> SFP is handled by phylink).
> 
> This series doesn't address PHY-less interfaces (bare MAC devices, MACs
> with embedded PHYs not driven by phylink, or MAC connected to optical
> SFPs) to stay within the 15 patches limit, nor does it include the uAPI
> part that exposes these ports to userspace.
> 
> I've kept the cover short, much more details can be found in the RFC
> covers.
> 
> Thanks everyone,
> 
> Maxime

Forgive me for my ignorance, but why have a new ethtool interface instead of
extending ethtool_link_settings.port? It's a rather ancient interface, but it
seems to be tackling the exact same problem as you are trying to address. Older
NICs used to have several physical connectors (e.g. BNC, MII, twisted-pair) but
only one could be used at once. This seems directly analogous to a PHY that
supports multiple "port"s but not all at once. In fact, the only missing
connector type seems to be PORT_BACKPLANE.

I can think of a few reasons why you wouldn't use PORT_*:

- It describes the NIC and not the PHY, and perhaps there is too much impedance
   mismatch?
- There is too much legacy in userspace (or in the kernel) to use that API in
   this way?
- You need more flexibility?

At the very least, I think some discussion in one of the commits would be
warranted. Perhaps there was some on the RFC that I missed?

--Sean

