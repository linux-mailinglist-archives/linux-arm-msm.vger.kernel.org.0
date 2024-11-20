Return-Path: <linux-arm-msm+bounces-38491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F86D9D3AB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 636AEB21312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B89219EED7;
	Wed, 20 Nov 2024 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWcszfr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF771A08D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732106242; cv=none; b=nFJs5mwPPaj3jUsw8d2rC7iXgAGQlVLzQPNCln9QcdHq+BeHgKRL37NuW1tSa8VdhcE6z7AdcWgEI5QnQDG9ZFANcfMJjtwbdJ0/6lw0bf+O0Wxf3xX34iJqR5QT4FJ6FO28VHK6KoBtCMBH4As3Yab08woldQNyyVyXNWYk9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732106242; c=relaxed/simple;
	bh=w2Dc9Cg39dr6M6oAvuVGLV6DKCKaBhdnb0q4yVtgdYo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U/7LdZYn+8vNyqDBW+ke9SXeyhfrpuq6icuS7Fu6qCh8zMnbsiFLp675i09v9kmi06DibOXz4j+xJxZktS99ri5H9kdhltQpwPl5YJEhmmfwjrz5w/RMktzQ2wR5JuCi8u1nmj3a8PfuF3oug6P5JsXZLS497UBT4nWNZk/C0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWcszfr6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314b316495so46258005e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 04:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732106238; x=1732711038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29+F59TCX2oWN8H3D9tvKo2oVb7iFDjyrRDf38+/OfY=;
        b=QWcszfr6WffbOU1yQEyB3a5mvZngEqN5S9n25HxzbIXW/42Y+D4uKfMxFO7Gg73obL
         QrgRjaFtAEWVVxUBwcYoWKlxbJLw7xV2olqkgXTwGdr1BLmrfGY/aNGccz4SHOoqkmMj
         SxL/GrJhgVaTtQzwKbjwwnKWc6LUjfB6/Lq5X7MmH6bDj8BXczXdyUFEJU7+jLomA0GW
         vW/SXvNaSxH6jJpUQgYJCw8Qxprx+2+f8fn1uAx4i6y48m2qQoo8Ifzx753axxb5yIvC
         vUF1wc/EAaSqQg2FABY7hZzAHR9Jaxe0+5b2o7nB2Ji7eoxca6KXxhzfdeS+36H5yG1X
         T6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732106238; x=1732711038;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=29+F59TCX2oWN8H3D9tvKo2oVb7iFDjyrRDf38+/OfY=;
        b=DVlZx7r5PxU/RL93U7/9ArECM5dBwZe9Pz4RyMtTKnhfgIrcmgqDeIc5jD96eQcgiM
         Lp+Dkps0aWyT4LsJMpedbpfrIQojvPxgpg8wz+nllWdaq87jVuPNE8SrTpU+K3PKCfXj
         YdGDWMNtkBXTTcJc9gq7GzUAiQHcEa/Uw3bhFest61CNsdDLInvP42lN1Rcj6B+VZ0mk
         4wQWY9E9zXMwTnPvpaeWSI8Pjx2RnblL2iV0vsdPKOGamyTjqrw4AUBexzwhZsZDJEk3
         CPCdwLkBPZzZP0LwvBJqSmfTCPl4I0CAT84y/sEHJcxTn3oUiEA9pa6RCyVTRTLBeohF
         D1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk7QprDql27JZr//885zYhihwcQRSTznRkalAUb14luzJufpw7jEaSLmCZkB+9/ZEO5AshjLDLK9kgBQO/@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzXuHccoTtdaAonQMeL1Os+V1hn82IV/i2mLJk+UkfS4LSeUs
	ng2897TAj8TcIVIT2KSxSBSbmHC1DuDg3EkPfUtT7RzyvXVZlwQrg5JrnmofOjU=
X-Google-Smtp-Source: AGHT+IE1cTIXKuvyTa+VfNMnZORUxk9RDxl7wgCCFVWN0Cp7P+TTaqVCRjbi64l1BhQOLHPU1KVmvg==
X-Received: by 2002:a05:600c:4447:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-433489b1a20mr22697215e9.8.1732106238208;
        Wed, 20 Nov 2024 04:37:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:927b:2848:1f7d:3776? ([2a01:e0a:982:cbb0:927b:2848:1f7d:3776])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45fb5f6sm17738025e9.15.2024.11.20.04.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 04:37:17 -0800 (PST)
Message-ID: <a1aa497f-3be9-4870-a09a-d91f10091308@linaro.org>
Date: Wed, 20 Nov 2024 13:37:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 05/11] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-5-4deb87be2498@linaro.org>
 <stifp2gtqxmegysrewfuwdsxpqin6zznvqndw7rj5nysi6rq4g@543stomenpvf>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <stifp2gtqxmegysrewfuwdsxpqin6zznvqndw7rj5nysi6rq4g@543stomenpvf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2024 12:42, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 06:56:40PM +0100, Neil Armstrong wrote:
>> The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> In order to calculate vote values used by the GPU Management
>> Unit (GMU), we need to parse all the possible OPP Bandwidths and
>> create a vote value to be sent to the appropriate Bus Control
>> Modules (BCMs) declared in the GPU info struct.
>>
>> The vote array will then be used to dynamically generate the GMU
>> bw_table sent during the GMU power-up.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> LGTM, two minor nits below.
> 
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 153 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 ++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>>   3 files changed, 168 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 14db7376c712d19446b38152e480bd5a1e0a5198..f6814d92a4edb29ba8a34a34aabb8b2324e9c6a4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>>   #include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/tcs.h>
>>   #include <drm/drm_gem.h>
>>   
>>   #include "a6xx_gpu.h"
>> @@ -1287,6 +1288,109 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
>> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
>> + * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
>> + * @vcd: virtual clock domain that this bcm belongs to
>> + * @reserved: reserved field
>> + */
>> +struct bcm_db {
>> +	__le32 unit;
>> +	__le16 width;
>> +	u8 vcd;
>> +	u8 reserved;
>> +};
>> +
>> +static u64 bcm_div(u64 num, u32 base)
>> +{
>> +	/* Ensure that small votes aren't lost. */
>> +	if (num && num < base)
>> +		return 1;
>> +
>> +	do_div(num, base);
>> +
>> +	return num;
>> +}
>> +
>> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
>> +				       struct a6xx_gmu *gmu)
>> +{
>> +	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
>> +	unsigned int bcm_index, bw_index;
>> +
>> +	/* Retrieve BCM data from cmd-db */
>> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>> +		size_t count;
>> +
>> +		/* Skip unconfigured BCM */
>> +		if (!info->bcm[bcm_index].name)
>> +			continue;
>> +
>> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
>> +						info->bcm[bcm_index].name,
>> +						&count);
>> +		if (IS_ERR(bcm_data[bcm_index]))
>> +			return PTR_ERR(bcm_data[bcm_index]);
>> +
>> +		if (!count)
>> +			return -EINVAL;
>> +	}
>> +
>> +	/* Generate BCM votes values for each bandwidth & BCM */
>> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
>> +		u32 *data = gmu->gpu_bw_votes[bw_index];
>> +		u32 bw = gmu->gpu_bw_table[bw_index];
>> +
>> +		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
>> +		for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>> +			bool commit = false;
>> +			u64 peak, vote;
>> +			u16 width;
>> +			u32 unit;
>> +
>> +			/* Skip unconfigured BCM */
>> +			if (!info->bcm[bcm_index].name || !bcm_data[bcm_index])
>> +				continue;
> 
> Nit: you don't care about the .name anymore, the first check can be
> dropped.

Right

> 
>> +
>> +			if (bcm_index == GMU_MAX_BCMS - 1 ||
>> +			    (bcm_data[bcm_index + 1] &&
>> +			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
>> +				commit = true;
>> +
>> +			if (!bw) {
>> +				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
>> +				continue;
>> +			}
>> +
>> +			if (info->bcm[bcm_index].fixed) {
>> +				u32 perfmode = 0;
>> +
>> +				if (bw >= info->bcm[bcm_index].perfmode_bw)
>> +					perfmode = info->bcm[bcm_index].perfmode;
>> +
>> +				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
>> +				continue;
>> +			}
>> +
>> +			/* Multiply the bandwidth by the width of the connection */
>> +			width = le16_to_cpu(bcm_data[bcm_index]->width);
>> +			peak = bcm_div((u64)bw * width, info->bcm[bcm_index].buswidth);
>> +
>> +			/* Input bandwidth value is in KBps, scale the value to BCM unit */
>> +			unit = le32_to_cpu(bcm_data[bcm_index]->unit);
>> +			vote = bcm_div(peak * 1000ULL, unit);
>> +
>> +			if (vote > BCM_TCS_CMD_VOTE_MASK)
>> +				vote = BCM_TCS_CMD_VOTE_MASK;
>> +
>> +			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /* Return the 'arc-level' for the given frequency */
>>   static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>>   					   unsigned long freq)
>> @@ -1390,12 +1494,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>>    * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
>>    * to construct the list of votes on the CPU and send it over. Query the RPMh
>>    * voltage levels and build the votes
>> + * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
>> + * and BCM parameters to build the votes.
>>    */
>>   
>>   static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>   {
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   	struct msm_gpu *gpu = &adreno_gpu->base;
>>   	int ret;
>>   
>> @@ -1407,6 +1514,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>   	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
>>   		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>>   
>> +	/* Build the interconnect votes */
>> +	if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
>> +		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1442,6 +1553,38 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
>>   	return index;
>>   }
>>   
>> +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
>> +		u32 size)
>> +{
>> +	int count = dev_pm_opp_get_opp_count(dev);
>> +	struct dev_pm_opp *opp;
>> +	int i, index = 0;
>> +	unsigned int bandwidth = 1;
>> +
>> +	/*
>> +	 * The OPP table doesn't contain the "off" bandwidth level so we need to
>> +	 * add 1 to the table size to account for it
>> +	 */
>> +
>> +	if (WARN(count + 1 > size,
>> +		"The GMU bandwidth table is being truncated\n"))
>> +		count = size - 1;
>> +
>> +	/* Set the "off" bandwidth */
>> +	bandwidths[index++] = 0;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
>> +		if (IS_ERR(opp))
>> +			break;
>> +
>> +		dev_pm_opp_put(opp);
>> +		bandwidths[index++] = bandwidth++;
>> +	}
>> +
>> +	return index;
>> +}
>> +
>>   static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>   {
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> @@ -1472,6 +1615,16 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>   
>>   	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>>   
>> +	/*
>> +	 * The GMU also handles GPU Interconnect Votes so build a list
>> +	 * of DDR bandwidths from the GPU OPP table
>> +	 */
>> +	if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
>> +		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
>> +			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
>> +
>> +	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>> +
>>   	/* Build the list of RPMh votes that we'll send to the GMU */
>>   	return a6xx_gmu_rpmh_votes_init(gmu);
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..03603eadc0f9ed866899c95e99f333a511ebc3c1 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -19,6 +19,16 @@ struct a6xx_gmu_bo {
>>   	u64 iova;
>>   };
>>   
>> +#define GMU_MAX_BCMS	3
>> +
>> +struct a6xx_bcm {
>> +	char *name;
>> +	unsigned int buswidth;
>> +	bool fixed;
>> +	unsigned int perfmode;
>> +	unsigned int perfmode_bw;
>> +};
>> +
>>   /*
>>    * These define the different GMU wake up options - these define how both the
>>    * CPU and the GMU bring up the hardware
>> @@ -82,6 +92,10 @@ struct a6xx_gmu {
>>   	unsigned long gpu_freqs[16];
>>   	u32 gx_arc_votes[16];
>>   
>> +	int nr_gpu_bws;
>> +	unsigned long gpu_bw_table[16];
>> +	u32 gpu_bw_votes[16][GMU_MAX_BCMS];
> 
> We still have magic 16 here. GPU_MAX_FREQUENCIES? GPU_FREQ_TABLE_SIZE?

Yeah it would be max frequencies.

I tried to replace this 16, but it's used as ARRAY_SIZE(gmu->gpu_bw_table)
like the other gx_arc_votes & gpu_freqs.

So I don't know what do define and where, and how, a separate patch ?

The define would only be used in the struct, not in the code, or whould I
drop the ARRAY_SIZE and use this define ?

> 
>> +
>>   	int nr_gmu_freqs;
>>   	unsigned long gmu_freqs[4];
>>   	u32 cx_arc_votes[4];
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..5b80919e595fa1ba0a3afcca55feb89e60870cb1 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -44,6 +44,7 @@ struct a6xx_info {
>>   	u32 gmu_chipid;
>>   	u32 gmu_cgc_mode;
>>   	u32 prim_fifo_threshold;
>> +	const struct a6xx_bcm bcm[GMU_MAX_BCMS];
>>   };
>>   
>>   struct a6xx_gpu {
>>
>> -- 
>> 2.34.1
>>
> 

Thanks,
Neil


