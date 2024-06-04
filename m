Return-Path: <linux-arm-msm+bounces-21660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A168B8FBA95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 19:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A451C218B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ADB14A4D2;
	Tue,  4 Jun 2024 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IoxwzwXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9E114A0B8
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522512; cv=none; b=meiU34Bfj1mk3ByrJhkfMzhH9GgWpwQOvavaaZoFJK4E9ImMf5iJB7t0UzJjJXAOpZBewcK3Ge5pak3CKyTJ0UIkrrcztcI6w782PP9aliyym7kfDL/R6E961CDCtsnG2gy9scJkSAy0cfh4kNGtKlo0hykz+6jG5fg2ooorMOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522512; c=relaxed/simple;
	bh=NaVx3uI645FZo6SowLbCrdVh3hn49VjVzM7/DLBmF34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkPkx4Q+KUnjb1ldBmVPDn0fUuV6AN43WvgfJCPPP3FqbiTrmS8qr/y5/lRgH5whoOXECMi1T1gsmHD6TnfJ7KYIE7qJUek+lsLIxfcW98ls7C5N0QZq+R+1TngQLB10y2wIzK8e4v/1Y0wgrWxWFySMO3NtmadH1MUomRnyTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IoxwzwXK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a68ca4d6545so11811466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717522508; x=1718127308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCsbwFVhaLIbM7WR4Y1tBA9sw9ajFsgDjNJvygL98eI=;
        b=IoxwzwXKJxmKyiiF64397xpa3gsIAjWEL5Yr55gOL/+tXkfBxrHz4sAwuPXfZFsn83
         5wfbo0lu7U/EQPirsZakQ07OijYjLgUzsruWejCtfr9hpwf1ZBoCx8QtdcdnIeK+XlLw
         C63WcK/FIHGnGKqZHn2XYhz/bZqG3FN35KI9bmIYoaXgwU24Blwmb8lXPd95WxrPKecX
         hgkevmH0RFRQOos66VgCu1ujas901Zi5vGBG2rhQFGOg8beFfIRPQGnmsFG0NG79LWvD
         2vxxDGe8bvRcTBodFd7P0ifSELv+Uo3e/z7ZQHvSg0g2G3qmmDTcw/9nEI5OadGFLYJl
         LnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522508; x=1718127308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCsbwFVhaLIbM7WR4Y1tBA9sw9ajFsgDjNJvygL98eI=;
        b=rA6sphhctTvNsSN/5zJ3mNSOFKUSQGedW3nBMdJ5ZTOkcNbP3MyOc8lPBqQMC7S7JH
         /dMqpqqdMmbXIOEVzoeQALXN24NmCXnWs3Ie3TZs9xmsFxVzNBKlwx1P9nFcH4/nz4fU
         0gJrUp7TRwOJ7fO6ygbtrVxxCd+dISHnYnaERMciA+iFmbgY+u3/sx2WuZx6x4tfs/DA
         U00XKLcP4WiD35d9MERZ0FlRHT5O+8j3LafMOl0iQp8B2EoIUgVUsgb8kSb5JTWHj8c9
         QBfar+Y+hYG0GPXitAoapwBD01n4W+S+UGeIY2d/hic0nWOC8o5uYOQw/cHLwmSpHsFu
         gCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUATtW5hU8+M+A5IhZ0ibgwboFJFSx5Oh8ZFgfpN+unXTdA5TS3Ga0TukFrTBnCpOHOYPgL9e1hr0fPcyDNZhEWPfgBaevYGj1iFAcWRw==
X-Gm-Message-State: AOJu0YzA19E9nEu7ztzTre2fOaHUcIIVU66gHHQccU/X/LVcPR6cEMsp
	53/iKiFg8ks8mccG7Lu+odyW0EXys1TCH8+ADFjXWuf5sXpi6UJ1BcIgt0gNKvY=
X-Google-Smtp-Source: AGHT+IEjcOF9+M6MP95PhiB5Ty/rvfO3P6Z5ngoFQ7Ttj8s1F/LJ0uoAhwyd0wUEzTYOq5frGLeA+A==
X-Received: by 2002:a17:906:6951:b0:a68:fe44:91f7 with SMTP id a640c23a62f3a-a6954bb13bfmr237231866b.31.1717522508091;
        Tue, 04 Jun 2024 10:35:08 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8? ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a685b935b5csm614209666b.206.2024.06.04.10.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 10:35:07 -0700 (PDT)
Message-ID: <5ff40fba-e45a-4a5c-b5a7-7ef5a799a008@linaro.org>
Date: Tue, 4 Jun 2024 19:35:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/14/24 20:38, Akhil P Oommen wrote:
> On Wed, May 08, 2024 at 07:46:31PM +0200, Konrad Dybcio wrote:
>> Memory barriers help ensure instruction ordering, NOT time and order
>> of actual write arrival at other observers (e.g. memory-mapped IP).
>> On architectures employing weak memory ordering, the latter can be a
>> giant pain point, and it has been as part of this driver.
>>
>> Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
>> readl/writel, which include r/w (respectively) barriers.
>>
>> Replace the barriers with a readback that ensures the previous writes
>> have exited the write buffer (as the CPU must flush the write to the
>> register it's trying to read back) and subsequently remove the hack
>> introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
>> status in hw_init").
>>
>> Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 ++---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++----------
>>   2 files changed, 6 insertions(+), 13 deletions(-)
> 
> I prefer this version compared to the v2. A helper routine is
> unnecessary here because:
> 1. there are very few scenarios where we have to read back the same
> register.
> 2. we may accidently readback a write only register.

Which would still trigger an address dependency on the CPU, no?

> 
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 0e3dfd4c2bc8..4135a53b55a7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -466,9 +466,8 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>>   	int ret;
>>   	u32 val;
>>   
>> -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
>> -	/* Wait for the register to finish posting */
>> -	wmb();
>> +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
>> +	gmu_read(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ);
> 
> This is unnecessary because we are polling on a register on the same port below. But I think we
> can replace "wmb()" above with "mb()" to avoid reordering between read
> and write IO instructions.

Ok on the dropping readback part

+ AFAIU from Will's response, we can drop the barrier as well

> 
>>   
>>   	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
>>   		val & (1 << 1), 100, 10000);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 973872ad0474..0acbc38b8e70 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1713,22 +1713,16 @@ static int hw_init(struct msm_gpu *gpu)
>>   	}
>>   
>>   	/* Clear GBIF halt in case GX domain was not collapsed */
>> +	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> 
> We need a full barrier here to avoid reordering. Also, lets add a
> comment about why we are doing this odd looking sequence.
> 
>> +	gpu_read(gpu, REG_A6XX_GBIF_HALT);
>>   	if (adreno_is_a619_holi(adreno_gpu)) {
>> -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
>>   		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
>> -		/* Let's make extra sure that the GPU can access the memory.. */
>> -		mb();
> 
> We need a full barrier here.
> 
>> +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
>>   	} else if (a6xx_has_gbif(adreno_gpu)) {
>> -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
>>   		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
>> -		/* Let's make extra sure that the GPU can access the memory.. */
>> -		mb();
> 
> We need a full barrier here.

Not sure we do between REG_A6XX_GBIF_HALT & REG_A6XX_RBBM_(GBIF_HALT/GPR0_CNTL),
but I suppose keeping the one after REG_A6XX_RBBM_(GBIF_HALT/GPR0_CNTL) makes
sense to avoid the possibility of configuring the GPU before it can access DRAM..

> 
>> +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
>>   	}
>>   
>> -	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
>> -	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
>> -		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
>> -
> 
> Why is this removed?

Because it was a hack in the first place and the enforcement of GBIF
unhalt requests coming through before proceeding further removes the
necessity to check this (unless there's some hw-mandated delay we should
keep in mind, but kgsl doesn't have that and there doesn't seem to be
any from testing on 8[456]50).

Konrad

