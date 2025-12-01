Return-Path: <linux-arm-msm+bounces-83917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D94C9590B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 03:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4630C3A1634
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 02:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999E215687D;
	Mon,  1 Dec 2025 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="hIll+sFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB23C17
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764554879; cv=none; b=hLyYXwM7BegivesSEMX7UVJITu20gjZhT4ws7+w8q7t2QaIahtYa0p5MuoQ2LF10PEdhg0FQ7xskzvCLUBYnm7gJkA68XkKaq3qDFDNXE4HWaSrBAzV1StaKhjpl6ufLm1xbZ2pLY5fcIcYtk79+M+oroygeZHV/3G0hwWNukts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764554879; c=relaxed/simple;
	bh=Brd1m0I502flbbrPfstky28/MGkvAvnbspaAxGS6FXs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GCOvaTLx+e23xDz91WWtic0JJuFaLd9KsEzMPIzUDYovmomzEUF52eOdxaGfVlQTqAFs93TbL+C2bg9DzAU2gcX/1KPRfB1qG9mqev7JUNe6vvbdEZjx0dE2XxGiMjVvSCibeqZpuz4rRbOmmXylLAAObKCrHB/RLC3aj48FhVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=hIll+sFh; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so29729126d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764554877; x=1765159677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6X7FczmyNbajVkfCjjfiVo5L7sC0KZ02KzTNegv4hWk=;
        b=hIll+sFhOv6DirBFuTXPeoAurVxF0nunO/mHO+UZSL3mWfvGYxpQOcvV+nfFoZcZCh
         67D9OccZbh/DUmdDJvmBDF++5qVNTmphm7p42cX38QQ20Wt1GoaWnIvvje8Ngi9i5/jm
         2720Z4bcFnF9Nn88/FLKrywzG4FsqZMahNbPvX7KpdCC1CorEq5Rku2ibgZiwHCVwIkj
         r5xzKgoQRVnWabQod39b5JOcFBooBj4Q2xj2EN5CDCuiGilsJCBBo37AryZkQdX1IRqv
         Pxt1BrjCQAylQypJsAhe0TO56Go/uRwx4Yr2J0Pq5deZBBgaiENcE1LtEZS01v+eYDes
         M6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764554877; x=1765159677;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6X7FczmyNbajVkfCjjfiVo5L7sC0KZ02KzTNegv4hWk=;
        b=KFT7mMDwIV5WjC27u+cC+O8rf1cMEPL9msqaBSXszUN6rPpCaAzsFBPfLtIOynaDTk
         Td4B3I9VslSjylOR/ydJ1jHcVGovRlFbdFPf7r6GJ+dRFLL89LM7pgPU1qSDwa1eyYs7
         ftAoY61UhHxXQ4c0WQaG9hGSzMmZUNXt/iWREtBd1P/FgfvMDnXuT2MgK93wjP4hike6
         Neco/4vUntS8i7HZaISolqcHlo0HOADXDsGMoQsm2WbqRg5vthqq2DdJKUagFLaoqD4q
         OG+6W3h8/O6sHkKQO6wIOC/vmizEVvnAjyoM3QDVcbSt8XoYwTm7aCBLVhKaACWp69dP
         ImRw==
X-Forwarded-Encrypted: i=1; AJvYcCV9fDQVa7XR1KJQeOxQMteHo/e7hPoRQKWFux7sDEf5Bf/fn+EXm5U93mY0bHcjDDBLbiRwBlz0UtfPoDM9@vger.kernel.org
X-Gm-Message-State: AOJu0YyePp6R5H0c+I2b09CwV3NYRDQkBHXIGFjYC9S/KhzJ6nnjk6d6
	s1OuYZdrv1o6LPR1o+uh2oH1ygU1VRwZ8m2FYiQsVrQtwU/EmjoXu8auXC0amAwIwBc=
X-Gm-Gg: ASbGncuhQmuWwYF4NkcWzCFHNmJqbCfpM1/3PizM3T5oq8nTmezb0FevlITkLSWcKIM
	7zCeAAK7Fea/aOPqcjXGNZnW+ap9GJWYi5m93eu5jYYsVO2KpygPLTgP3XiaEYarAygsmAMA+7g
	uEHOASr16rDD5BYWi3bDjZM3rRKmXxhZxXzBrq4xWgVOznFUQsoak0YIESYkfH9yBB3ZDDI5OBM
	3JSX0X9AqeQbNSiDEDN1zItH+pjTbVDLoce26Wp1fM/rfgYlD5nl1xK3LgVdbOfEaPtb7qkxSWn
	qp3Bi3kyzow/PP1DcYKax29W5oN6nl0MD/rR7O2C2gntWOGFbtBdCVGVoUin8wJktbrsBD3QaNG
	IAC8Su/YVAnEzfyRzfGlKWixrgKQQPDnZptb+aqiomhmC9E/rtcqH9G6TYEFGv0UnKD8ZA3eVtM
	uwnK0sA0IkUAlGKi0JWKlq88PCfZZga6mMRes+veXIm87wkAlf2OsIGUIRdw==
X-Google-Smtp-Source: AGHT+IGCg/pbS5JiPjM9WKZ9zNImn5eqcsCySAHuKjfPaPXvoXsOlLO0gykRKp6rucTDz/5r2Kefeg==
X-Received: by 2002:a05:6214:5090:b0:880:56f6:92ae with SMTP id 6a1803df08f44-8863b04bd3bmr367681906d6.57.1764554876871;
        Sun, 30 Nov 2025 18:07:56 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b6d7b0sm73513216d6.41.2025.11.30.18.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 18:07:56 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Steev Klimaszewski <threeway@gmail.com>
Cc: abel.vesa@linaro.org, andersson@kernel.org,
 christopher.obbard@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rjendra@quicinc.com, robh@kernel.org, sibi.sankar@oss.qualcomm.com,
 stephan.gerhold@linaro.org
References: <35615ad4-5b86-577f-4695-c6cd85206334@marek.ca>
 <20251201001353.9852-1-threeway@gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <4e3c1c5d-fee9-d4d8-8b06-d33210c5819e@marek.ca>
Date: Sun, 30 Nov 2025 21:06:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251201001353.9852-1-threeway@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I was curious about this so I tried booting EL1
- 32GB CRD boots fine
- 64GB T14S boots with CONFIG_ARM64_VA_BITS_39 (except display driver 
didn't probe, because it depends on adsp firmware, lol). without 
CONFIG_ARM64_VA_BITS_39 it resets

Anyway making things worse for "64GB+EL1+broken firmware" shouldn't 
block this patch, because "64GB+EL1+broken firmware" needs workarounds 
anyway and this change is needed to use 64GB without issues otherwise.

On 11/30/25 7:13 PM, Steev Klimaszewski wrote:
> Hi All,
> 
> On my Thinkpad T14S OLED with 64GB, with this patch applied, I am unable to boot
> the laptop anymore.  It doesn't matter whether I have mem=30GB, nor if I set
> CONFIG_ARM64_VA_BITS_39, or not limiting the ram - shortly after loading the
> device tree, the laptop just resets.
> 
> I have tried over 20 boots with it applied, as well as trying both booting a
> working kernel, and then rebooting as well as cold boots.
> 
> 
> -- steev
> 
.

