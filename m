Return-Path: <linux-arm-msm+bounces-39794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 444359DFC58
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96A06B215F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DCD1FA14D;
	Mon,  2 Dec 2024 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9ZgxKqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B001F9EA6
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733129191; cv=none; b=PMy3XfnvVe2eYT4MdAGpYudm+w6xZMZTbsRgbIxDVqCEPFHvTGBbLScwaWBh4cvKQN8euozxIx7eiJ2dvf96nKLIUycg9VxlU+7NZDs4HZt4eJoCisbYJIqwcPwiZ060gcWNksIQYyA3Q0YNzbmVlVCELi2uDn+9TXFVdt3w0X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733129191; c=relaxed/simple;
	bh=2i6YTzbDmJtsUUAeqTzmyeUvVfxbBDnIKwCQ5pMMLS4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X2VDEA2074Bf1mH8oD2Nw1rrkIwIG6b/cGQf4T90JL885ZZaI/272eQErguuATq/kSwDrf5B93r9b//zcoDLi6NUtGGGXCqEJ5+JpPDHIRIBVibxtOJEBFKLqpSXb83ObWa5vxWgAWXnj1JoWmLmasaj1sKJc3s9WxWkLR2GqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9ZgxKqt; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53de880c77eso4485225e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 00:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733129186; x=1733733986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO0PMHTPCNgv7ePv+6rOpWSFWRVpkh6/tEB8bg8Fdb0=;
        b=m9ZgxKqt/BL0QMSGN5AjkEaPnzYx+vxkM/mMwg9EQ6llmOsUkOnADxYldbVIkLtBMG
         x+Fips/GVRY5tRu53gxUij/qQpvwhRxUckukLg0J8S+108R6Z875QE5WrE9u149/iheL
         u+MtcuU3FJhdKzMHRGprmIzjbnEOiPb3JENN4f7lCm1/D9xCdblnFwgssQ+az783MRI2
         P06GKyi3cM+kXP3WnvDrgHCDShJOrXYthISEvvPLS63sb1S4gUQ1aeTZoAnw++0S6b/W
         tW689ZdqLnmNDdMPpNpdYEhyh803/RIPxQHQNhhEAig4C3Vp/tdGGvQ0X/tlnA3SS2jk
         6lAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733129186; x=1733733986;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KO0PMHTPCNgv7ePv+6rOpWSFWRVpkh6/tEB8bg8Fdb0=;
        b=p1TkCXhCOepfuDImmVklpuJbrmA+4RVZspwK+i9yRvTFBHgNoO36V0iI5CgOyLU6wo
         2//xYjqUbTvzFHoBGSZBGIDmGV/OBStknaTQ2xcl9wsGrDSvUexrM/NpcnGEJAICtlty
         1InYwQeW+UHiKT8DEKVqY+AZQv+YIYIWJRmXQ8Rlk3CBljKcvHLMaE6eYG663hVc5W4V
         TbJtDi1N2bdGaoA0Reg2/wiYUNiZxrpmBnFOb13khfQyfp0dPfVnwOQ7ox3iWfYXfpP1
         mS1wmZzoTqRYnHnXg+fX77p/w7vXKOTK+WTLiKOKQAtrWQud/ZjvKBHaKsG0j9/yIHF6
         /vkg==
X-Gm-Message-State: AOJu0YyDN0OfisCVIaMHMMNt1CYi+xe/KtQNUBrkg6IsAdatBUgvw6qU
	6epqvF8mb3azh8QtealrorS6VEBLj2VnAOf2zIKZ/sVfNZcMdD9jajTPzrmSJyQ=
X-Gm-Gg: ASbGncvVUvJbge5TdbLUbNr/te0SEI4dlChCEOVUQ3xhBIiuarZZt8R+P5UHdKTgU6I
	tNeQuXGalHDdNqJFsw8FSnmJqwnonLdq6DfsRcSKS9Zs0A45h3PyLZ//ZmJIasJ5Ksq73ZKXe8h
	FXFfl4j4eiy38A8nqJnC/u63PSPqqCankXLb27PVIo61TVJgWbcpjJvTZUMGAq063D9eMarJlQm
	17BGS8KCpkvk5AGoIUtNPnjxj3JeO/fypuEpgR+zmWmt0nqER8DYzEnNRE4LnWKZZAp4AewycUL
	hCXLqX1u4mxKM6nZpOK5PGrDJVs=
X-Google-Smtp-Source: AGHT+IH2XLUfC8L/OoM5Z9wesXnND6BN21UkL2+D+PdmAdyg355CZoFr3QUGxpPoZ5wmZk/rxZmr1w==
X-Received: by 2002:a05:6512:3d0f:b0:53d:e65c:e33b with SMTP id 2adb3069b0e04-53df00d11bdmr10299748e87.23.1733129186116;
        Mon, 02 Dec 2024 00:46:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1485:2a78:787c:c669? ([2a01:e0a:982:cbb0:1485:2a78:787c:c669])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78c202sm175242175e9.26.2024.12.02.00.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:46:25 -0800 (PST)
Message-ID: <26a1fa02-0f47-40d8-9ba7-b76ba907297d@linaro.org>
Date: Mon, 2 Dec 2024 09:46:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
 <8cf9db06-0718-4c17-9712-d11943bcbe15@quicinc.com>
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
In-Reply-To: <8cf9db06-0718-4c17-9712-d11943bcbe15@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/11/2024 22:49, Akhil P Oommen wrote:
> On 11/28/2024 3:55 PM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> While scaling via the interconnect path was sufficient, newer GPUs
>> like the A750 requires specific vote paremeters and bandwidth to
>> achieve full functionality.
>>
>> In order to calculate vote values used by the GPU Management
>> Unit (GMU), we need to parse all the possible OPP Bandwidths and
>> create a vote value to be sent to the appropriate Bus Control
>> Modules (BCMs) declared in the GPU info struct.
>>
>> This vote value is called IB, while on the othe side the GMU also
>> takes another vote called AB which is a 16bit quantized value
>> of the bandwidth against the maximum supported bandwidth.
>>
>> The vote array will then be used to dynamically generate the GMU
>> bw_table sent during the GMU power-up.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 174 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 +++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |   5 +
>>   4 files changed, 194 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 14db7376c712d19446b38152e480bd5a1e0a5198..ee2010a01186721dd377f1655fcf05ddaff77131 100644
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
>> @@ -1287,6 +1288,131 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
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
>> +	unsigned int bcm_index, bw_index, bcm_count = 0;
>> +
>> +	if (!info->bcms)
>> +		return 0;
>> +
>> +	/* Retrieve BCM data from cmd-db */
>> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>> +		size_t count;
>> +
>> +		/* Stop at first unconfigured bcm */
>> +		if (!info->bcms[bcm_index].name)
>> +			break;
>> +
>> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
>> +						info->bcms[bcm_index].name,
>> +						&count);
>> +		if (IS_ERR(bcm_data[bcm_index]))
>> +			return PTR_ERR(bcm_data[bcm_index]);
>> +
>> +		if (!count)
>> +			return -EINVAL;
>> +
>> +		++bcm_count;
>> +	}
>> +
>> +	/* Generate BCM votes values for each bandwidth & BCM */
>> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
>> +		u32 *data = gmu->gpu_ib_votes[bw_index];
>> +		u32 bw = gmu->gpu_bw_table[bw_index];
>> +
>> +		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
>> +		for (bcm_index = 0; bcm_index < bcm_count; bcm_index++) {
>> +			bool commit = false;
>> +			u64 peak, vote;
>> +			u16 width;
>> +			u32 unit;
>> +
>> +			/* Skip unconfigured BCM */
>> +			if (!bcm_data[bcm_index])
>> +				continue;
>> +
>> +			if (bcm_index == bcm_count - 1 ||
>> +			    (bcm_data[bcm_index + 1] &&
>> +			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
>> +				commit = true;
>> +
>> +			if (!bw) {
>> +				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
>> +				continue;
>> +			}
>> +
>> +			if (info->bcms[bcm_index].fixed) {
>> +				u32 perfmode = 0;
>> +
>> +				if (bw >= info->bcms[bcm_index].perfmode_bw)
>> +					perfmode = info->bcms[bcm_index].perfmode;
>> +
>> +				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
>> +				continue;
>> +			}
>> +
>> +			/* Multiply the bandwidth by the width of the connection */
>> +			width = le16_to_cpu(bcm_data[bcm_index]->width);
>> +			peak = bcm_div((u64)bw * width, info->bcms[bcm_index].buswidth);
>> +
>> +			/* Input bandwidth value is in KBps, scale the value to BCM unit */
>> +			unit = le32_to_cpu(bcm_data[bcm_index]->unit);
>> +			vote = bcm_div(peak * 1000ULL, unit);
>> +
>> +			if (vote > BCM_TCS_CMD_VOTE_MASK)
>> +				vote = BCM_TCS_CMD_VOTE_MASK;
> 
> use clamp()?

Yep, I think I could replace bcm_div with clamp

> 
>> +
>> +			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
>> +		}
>> +	}
>> +
>> +	/* Generate AB votes which are a quantitized bandwidth value */
>> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
>> +		u64 tmp;
>> +
>> +		/*
>> +		 * The AB vote consists of a 16 bit wide quantized level
>> +		 * against the maximum supported bandwidth.
>> +		 * Quantization can be calculated as below:
>> +		 * vote = (bandwidth * 2^16) / max bandwidth
>> +		 */
>> +		tmp = gmu->gpu_bw_table[bw_index] * MAX_AB_VOTE;
>> +
>> +		/* Divide by the maximum bandwidth to get a quantized value */
>> +		gmu->gpu_ab_votes[bw_index] =
>> +			bcm_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
>> +	}
> 
> So I suppose you are trying to vote AB equal to IB. Aggregation logic
> for both are different. So this will make DDR scale very aggressively. A
> more reasonable approach would be to vote a % of IB vote (25%?). Ideally
> we should measure GPU's bandwidth usage and vote that if you are really
> concerned about stability issues. IB is just a floor vote, GPU can
> generate way higher traffic.

I think this should be optimized better in a different patchset, so I would
like to make the simplest vote possible here to retain functionnality.

So if I understand I should divide this vote value by 4 ? Downstram uses 25% by default
when no AB was calculated, but what does that mean exactly ?

Is there a counter somewhere to measure the GPU traffic ?

> 
>> +
>> +	return 0;
>> +}
>> +
>>   /* Return the 'arc-level' for the given frequency */
>>   static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>>   					   unsigned long freq)
>> @@ -1390,12 +1516,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
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
>> @@ -1407,6 +1536,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>   	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
>>   		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>>   
>> +	/* Build the interconnect votes */
>> +	if (info->bcms && gmu->nr_gpu_bws > 1)
>> +		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1442,10 +1575,43 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
>>   	return index;
>>   }
>>   
>> +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
>> +		u32 size)
>> +{
>> +	int count = dev_pm_opp_get_opp_count(dev);
> 
> I am less concerned about this now since you are not voting real AB BW.

Sorry I don't understand

Thanks,
Neil

> 
> -Akhil.
> 
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
>>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   	struct msm_gpu *gpu = &adreno_gpu->base;
>>   
>>   	int ret = 0;
>> @@ -1472,6 +1638,14 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>   
>>   	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>>   
>> +	/*
>> +	 * The GMU also handles GPU Interconnect Votes so build a list
>> +	 * of DDR bandwidths from the GPU OPP table
>> +	 */
>> +	if (info->bcms)
>> +		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
>> +			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
>> +
>>   	/* Build the list of RPMh votes that we'll send to the GMU */
>>   	return a6xx_gmu_rpmh_votes_init(gmu);
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index 88f18ea6a38a08b5b171709e5020010947a5d347..bdfc106cb3a578c90d7cd84f7d4fe228d761a994 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -21,6 +21,15 @@ struct a6xx_gmu_bo {
>>   
>>   #define GMU_MAX_GX_FREQS	16
>>   #define GMU_MAX_CX_FREQS	4
>> +#define GMU_MAX_BCMS		3
>> +
>> +struct a6xx_bcm {
>> +	char *name;
>> +	unsigned int buswidth;
>> +	bool fixed;
>> +	unsigned int perfmode;
>> +	unsigned int perfmode_bw;
>> +};
>>   
>>   /*
>>    * These define the different GMU wake up options - these define how both the
>> @@ -85,6 +94,11 @@ struct a6xx_gmu {
>>   	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
>>   	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
>>   
>> +	int nr_gpu_bws;
>> +	unsigned long gpu_bw_table[GMU_MAX_GX_FREQS];
>> +	u32 gpu_ib_votes[GMU_MAX_GX_FREQS][GMU_MAX_BCMS];
>> +	u16 gpu_ab_votes[GMU_MAX_GX_FREQS];
>> +
>>   	int nr_gmu_freqs;
>>   	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
>>   	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..9201a53dd341bf432923ffb44947e015208a3d02 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -44,6 +44,7 @@ struct a6xx_info {
>>   	u32 gmu_chipid;
>>   	u32 gmu_cgc_mode;
>>   	u32 prim_fifo_threshold;
>> +	const struct a6xx_bcm *bcms;
>>   };
>>   
>>   struct a6xx_gpu {
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> @@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
>>   	u32 bw;
>>   };
>>   
>> +#define AB_VOTE_MASK		GENMASK(31, 16)
>> +#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
>> +#define AB_VOTE(vote)		FIELD_PREP(AB_VOTE_MASK, (vote))
>> +#define AB_VOTE_ENABLE		BIT(8)
>> +
>>   #define HFI_H2F_MSG_PREPARE_SLUMBER 33
>>   
>>   struct a6xx_hfi_prep_slumber_cmd {
>>
> 


