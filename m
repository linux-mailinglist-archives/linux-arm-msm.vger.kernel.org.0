Return-Path: <linux-arm-msm+bounces-48812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC6BA3ED41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B9CE70255A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6EA1FE443;
	Fri, 21 Feb 2025 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrMLREqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204451FC105;
	Fri, 21 Feb 2025 07:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740122429; cv=none; b=pv77CnEyeJTw+qH+lrNI/mIJ4Grmn3kHHGi41Jq+7Le0QBNxiUHXEr2cJ9vOGaDLzY66S6RTwpD5wrfg70Xn/NiUpuqlDPpfNNLgE+3EZ+YFvvekOGc/5qw1QQH1zKy0kuNq60VWOlKOeRmdmjCDPt7YtyY2W6vWzWkLyChPs94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740122429; c=relaxed/simple;
	bh=kfk1e1qeYc9pfp6U+A20khSM3r0AbPFWN/R6/a+9Xnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWzympWJDq1lXcGIlDKBLtiIh0SCTTHaMlhBlCyw/GmiQFAhz2b2T1VP7CgI2lmxkP4VFN7BD+JY1q09CSV+6bKXH6GHgzBjWf41EeuweHMccEwN5evKXRL3Vje7BZbIhyyTtotb0GMfwaL+W8i5vj98g6xXFrFINKtup7Jvnaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrMLREqF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f22fe8762so856912f8f.2;
        Thu, 20 Feb 2025 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740122426; x=1740727226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zSQoOeRNMREqljX6P5aowkBRrtgKoOCHtii1nkE3DDU=;
        b=FrMLREqFvQO6zcfsx8LFHvd223ZkEnEaUOI/SE5bKP0QH1I43DMdFTadLxAJjZcmWA
         X3bGmYrGffPzpEscfok2tWq9QyDIE8dFDHz3XB3jeZ1k899lebjisE74yhFPFxcZwNGA
         u2WEoA6cuG4eX83tebYZZkiZZ+iKw7jzOXj0L19+Y6nVBWltEFCdoF5dF9WMMmOJ+VVu
         VsPeMokWaNUeF4Ao0XLLNddDfl94aTehb+neAgHMTdEVecPMZBzIOzGE/ZUP5U3Kq5mv
         hsU0ZdklhW7SYu4P3Sg53YPmKzFAINpKtNaPIn7zSPj1dOmKSG0zLV0tmbEhBPYSggbH
         gkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740122426; x=1740727226;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSQoOeRNMREqljX6P5aowkBRrtgKoOCHtii1nkE3DDU=;
        b=HoZfdSy3U0z75PsoDNcBuvR3laoStvOKWyOo0smExHpmnpJjLTANeLuDpPs7D3WX6z
         6vAN1O2kpawTIiIadkz8ALkt4OgfRjWDHbzBlagHmF98t7Jg5CBa/hpLMnuOffaaWO+Y
         00tWblRIaFI25iUuc7vSf5/t97EpT6j+z6TfLYGuebD/XsvZA6oTfMiMxTJd8imNnRrO
         NsstnObS3WDzqhc4GdqDMvyegjuiRQVJOKd4n0DIpK3sFxVpIlN9aBTI9gHuhmq1twuC
         l5w31ANDaICk75vp1VY2bAGqo3eyPevEoft54wjLpJJdwgzRukUum3o2QNNuUBQrxW/4
         k/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW8F6wkYx+Xj5xAdZNvg4dxPmdIn9j+0VRK72Je/2la8sXtqhgQ0D1/Mj4YRBFWAK7u51fUQjyAyjNsyX9@vger.kernel.org, AJvYcCW4IZmeLzwyDWCMqF5rU+vAF2xu5n9sOYC32tlbASq2bvD22rGrAT1Vbf542l3OzZXCuFGt4os/@vger.kernel.org
X-Gm-Message-State: AOJu0YxC02TSGvHyq0sFpwRXGMpB+eehj9RZKT8ovKm4bObrubmSdN+m
	038o4oXpkLUfGE3rJWgb+n0rb1aQtZndzwXC60R5bZj5ytn1DJiW
X-Gm-Gg: ASbGnctk6uYCBA4mHThzLy2ibdQqyIBCd+/m83k/zkRLPgr3xqIY7zfHRhm8dlohWYt
	/rEvRxlDXVyvxe4/TzczNcfYSaVVGcD5tbCCqdWB15jm8+o+JuoD6csDV24ediMId7mZJtU03T1
	yXY1+qb3Y8dFW+XX45u07+b6fAQtYGS+M/uZmBFLRDq3fePMJvdB/3/GnpwegnDNOKWikwu3np+
	wbv4+o6gsR5SuJOSdjC6i43FEbOs/i9hfEO0OqOEVBznMT7vXJoC9f4hd4ceGFcVynISCpxWqEA
	emtNkh8Nq2/W6q2k+DoanrecOWb1DQCSiiulTVF14I3Fm2RHcMFoxadxlpRdap3F0jeiabBoaOY
	mrKOCv5ht00LCvO2Qah9dohsXoKiS14X3S0HkDB0PfXzZrCR9j/TTii5Geym7vl4F7gn/yZKpgy
	pLuTRQiLm+px2R7zU=
X-Google-Smtp-Source: AGHT+IGeC5GBablq0AQrNpEx1BwFRc5eBCiJJC6ceaihfvgRqpFraNQ0ARF3K84jFym+xzSGuzhxZw==
X-Received: by 2002:a5d:47ac:0:b0:38f:516b:5429 with SMTP id ffacd0b85a97d-38f6e96738amr2062366f8f.25.1740122426123;
        Thu, 20 Feb 2025 23:20:26 -0800 (PST)
Received: from ?IPV6:2a02:3100:b29e:900:acd2:27f9:86ef:d768? (dynamic-2a02-3100-b29e-0900-acd2-27f9-86ef-d768.310.pool.telefonica.de. [2a02:3100:b29e:900:acd2:27f9:86ef:d768])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f258ddbb2sm22195014f8f.40.2025.02.20.23.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 23:20:24 -0800 (PST)
Message-ID: <944941ec-d897-4306-9cd8-e39de833749c@gmail.com>
Date: Fri, 21 Feb 2025 08:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/8] net: phy: move PHY package related code from
 phy.h to phy_package.c
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
 <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 02:56, Andrew Lunn wrote:
> On Wed, Feb 19, 2025 at 10:03:50PM +0100, Heiner Kallweit wrote:
>> Move PHY package related inline functions from phy.h to phy_package.c.
>> While doing so remove locked versions phy_package_read() and
>> phy_package_write() which have no user.
> 
> What combination of builtin and modules have you tried? Code like this
> is often in the header because we get linker errors in some
> configurations. It might be worth checking the versions of the
> original patches from Christian to see if there was such issues.
> 
The PHY package functions are used by PHY drivers only, all of them
have a Kconfig dependency on PHYLIB. I don't see a scenario where we
could have the problem you're mentioning. But right, the PHY package
function declarations are a candidate for a new header file not to
be used outside drivers/net/phy.

> 	Andrew
Heiner

