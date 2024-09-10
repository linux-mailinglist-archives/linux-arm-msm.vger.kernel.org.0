Return-Path: <linux-arm-msm+bounces-31424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639E973CC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 17:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9285B20D64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 15:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81EB19C54A;
	Tue, 10 Sep 2024 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="fLorXbFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29D14F12C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725983692; cv=none; b=AmV/UXBA+kmrmwEx01qjYQbupQrD8Ug1rErfuz6ctoNbp8uFxDkyCgG3aBp4KnvVEbxqy71YQYfYniyg5YfGJdsI6s5JWHpDWH67TbkqPHLjsEOuVZhM2kH5AAbS+1PhC1xdmnNN+guhnOX9QR6+V3ylhs9yIOrmmer+ST5sbkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725983692; c=relaxed/simple;
	bh=b281JWnfVo+p46J0D3RZLd1UIMJeIh/xP6vwav6HPIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJ1cbsrlGRj2dhEqtOP75KSQGdnt/koMtQBGQSp8M9LwRmugghL0oqKYj4NSDu+Np8oh/dTUyMvoCgElD2UTIawgTAvuHspA2IsrxWzTr8d+9J4y6KKacUWUIcSJe39HauQfbtYwlaf0HMz/wiu/N9OqMq45jWdT4EsNpuSoVN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=fLorXbFF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cba0dc922so16757735e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1725983687; x=1726588487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PxrvNA8ZTQVOz0CWahQR48w5Gv7e/oF6A+jLaE/Ydo=;
        b=fLorXbFF5GZfU1c4arIcHQ1MtXVCJK98N0jBRjjR0VpYQHYuYRcqYex1UAJAbYkWe9
         Qpn3bgsWzEdwjBW7aspAAW7TS8DRsOM/px4Uy1s79Ht3E8/kGApdGwwnAao096ELvob4
         5iv+0NatICrKPFvhZwfT1lObq4lKLS8imcAjsA3Jf8kTUOOKvBeyO+urj3aMEEbBdJ5t
         qIVOz44yq1+HOEobzKw0g2h2rRcerZbU4LCpTMf4D425gjrtGXAvhjLoRsdftXGlGjKw
         5d3HI2o61j94ivEL19Xo1JKwomAplpE1GtJBN4zgjR/rZ3s5s4O0eg4BmDGuFwxQN0tB
         qvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725983687; x=1726588487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PxrvNA8ZTQVOz0CWahQR48w5Gv7e/oF6A+jLaE/Ydo=;
        b=xE2Y3RNMLWFN7Qi62xa6wCHh2oQpoVUvd3guwygR2dD5YbM7I9lcxOXEnR6ff0ef9M
         dnOlmiMX5BMemDYMIJe3RxcNY7ZUnHEZYs5/O3qWOfw2b9PrzklBhvalg6D3ftwnRHes
         Kh2bbziGZHGLYSa4rvJ/kQ/t9pLyFXBVeXM9CxeoSjH4R4KWlUJ0JCy+kEp/Lkq4SqB7
         qc9D7ahJeRXPqePzRkYek0u4HBz27FjiIJnvcMIBmbQUb4ZQBSZTc3/skhns7GIqQkGn
         wAxETJf9YiH6F+kkKLw6oJ7WQVPFSEP6wm+jCiegX7lzelpgJqFCk29lSe3+3w96VxzW
         RAIw==
X-Forwarded-Encrypted: i=1; AJvYcCX3wfAFGFGM1uYVut7QfthzJkLm4J834A5uWg7HUY7/PBhFgd7V3yuVaz9kVimU3UGA9O9NCFvsoL0Bhc7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzN0vvsRnHvoednRiNb94f0hj+vRPIb/iwYFSfgh+8Hu/0EBBtO
	OTjRSqdkT+AJ82speoFBYMD266SjyJAhn4txbWLxKg/3rrq7uViyMNOdB+RHBjQ=
X-Google-Smtp-Source: AGHT+IEb0qA5EpGtNaNVZJscuK0KLM4oa8DNMmxJuy4xu6oN9fz+YV9+rQWeonEJ5VU15eSCcYGm4A==
X-Received: by 2002:a05:600c:3d11:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-42cad87f264mr87685255e9.29.1725983686172;
        Tue, 10 Sep 2024 08:54:46 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc1375c6esm20178245e9.1.2024.09.10.08.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 08:54:45 -0700 (PDT)
Message-ID: <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
Date: Tue, 10 Sep 2024 17:54:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2024 16:51, Dmitry Baryshkov wrote:

> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>
>> Building with clang and and W=1 leads to warning about unused
>> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
>>
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=1 build").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> I think this function can be dropped. Marc, your call, as an author of
> the patch?

( Why is the patch prefixed "drm/msmi", is "msmi" a typo? )

-> For the record, Arnaud is the driver's author.

pll_cmp_to_fdata() was used in hdmi_8998_pll_recalc_rate()
in a commented code block which was later removed.

Thus, yes, it is safe to completely delete the unused function.
I'm surprised gcc didn't catch that...

Regards


>> ---
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> index 0e3a2b16a2ce..c0bf1f35539e 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> @@ -153,7 +153,7 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>>  	return dividend - 1;
>>  }
>>  
>> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>> +static inline __maybe_unused u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>>  {
>>  	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
>>  
>> -- 
>> 2.39.2



