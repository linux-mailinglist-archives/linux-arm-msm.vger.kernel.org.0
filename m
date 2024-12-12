Return-Path: <linux-arm-msm+bounces-41858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A829EFE9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 22:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AAFC18894C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873F81D9353;
	Thu, 12 Dec 2024 21:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRcBeUIA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1904C1DB375
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734039915; cv=none; b=PkmWMtW9VwGntzjPTXVHWXyU0ldZLOkt/VK3uUtyPTb1CqPWtpNdeHA8EWcxX18/eW6oTFfkA5fVlaNrpW/rsyDS2T+7mN9IXBsbMBnpNu+4Xzs73GNK4o9ih87DMmbN3qjbPpnf3+IEnJlHlAPVXTcgOa5o6aoCbwvHNDB9RlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734039915; c=relaxed/simple;
	bh=+pJC1tYp5SsRp+I/N+6d6y4+PFvu3012i6C7y4ybq4M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h9adb0jH4TGBxbTcnEJI9d1td3EELvFVarNGq3Hdw0yRBz+AZ66IGoTQ7nrhudSl3XUF8w//tKD/10LBlE787GB/+BFIvCIb+U25Fk046XtVzLG3DjEQaYpJ8n7TE5lopIOU93gJSiW7ybJXhCHgY8aaPrLQ2KExAOviXZi3Q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRcBeUIA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso11059545e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734039910; x=1734644710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EqGMbuCS/ZZIE29NMrOme5aBpr93tYRrvJdfmFw3cs=;
        b=qRcBeUIAZtlPvcol7fuAjVwTuY4WKP4f36A1B6OwRTzqVd8Sp7Z312ZEDfC7QLpzGa
         Q0+7v4BB0qix2fpUaq1Ch+HSJMHFwLpBr1WOWC7mFvJbc25uCbs3nwLRqQwvoAHjPuQR
         lIyv55Aw67VplWprRvAc7aKDoDzmZFcNO07mca63sg1mwmCL/Gl6WJJrPdcfBV+NmRnf
         vig1M6LN27b46GKfuZ1kLmPQz+m8AV5u8u0N7A165tG2aeXimjq16LOAJcZRahlid2/U
         oi/CN8HuYeovWh0QCdjgU1j1dwMhbrRs8EwUijuayQC1GHBHrQ5ZtzgfmlnoiNQLK7+5
         GV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734039910; x=1734644710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6EqGMbuCS/ZZIE29NMrOme5aBpr93tYRrvJdfmFw3cs=;
        b=DWfcdEYe7igUA4unLZWYQFTxFQCfLy/4voNYgvgZ25a63cDVLp6BaqTIcKSg57SM6S
         LDSaceabbYTye8Bbs3ISSY3eMM5XHQgsgyedIVyTLxUra8OSl2EqAV6cL6346zCaYb6y
         xaNmK/6RytkYoIBpouG2Lgwk5A5LRWg/ZUY7DOJQTV3hWYTYmOo2Uc1fi0yeZagB0zFw
         IzBObsD63qfF/7vYXNGtLL/ublCHIoiXcL3FLfomPI6xjq11xH6XFytZ+2lJa3kbkQbB
         +wZ/vrgKcSBdbh3elnxP8xu8pJZcGSIe6b+Hk8MqKMEmEnBKiKAhIeVD4jM0/owpubGm
         LG8A==
X-Gm-Message-State: AOJu0YyMczUFLupmILfHZnIX30dxkeNuMTeSGhqLDm485DqqAiAAMrc2
	4ZgbDnWytfdYeojBzGKlfXvkEy1cfN0FoE77dpCf1+OFXL2PM7aJpgmywGZq3vY=
X-Gm-Gg: ASbGncv/2fZFkYqGmNbDZWGAiPW2c1FBPDrZgBtnk5AtUiHTwYQDxBeBXKaJ+qjS55e
	zON2DwOzoQNMH3S389dszy199b4dcBYZxuxH17aGXaDSL6g/GKX5mkct2mNENO0DILxz3v2mKqZ
	KAThzXIc6wonBrOqQeDrJQWGhiXlKZAF412vbO/l1xHz/PgBPBNw5zApmf/4J0wrglw6hLEDM3R
	zyg1Q62DA+NROP4+3VVy489x4cmAwy5ctdVE8xeB8bf4MmOV8v1ToqRgyKUHr0Y9RdiBufx6tsM
	55Apej9gOik+bhoZ1nBxYP1eJHE4EgoNfQ==
X-Google-Smtp-Source: AGHT+IF5/+Jrvgv4s3ueVCJoCsZwKVU/EjZP6+PRD2aegZfz2rCwFND7aIZnKE6iaKTEjWY1J9n7fg==
X-Received: by 2002:a05:600c:c11:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-4362aa1549bmr1300265e9.4.1734039910424;
        Thu, 12 Dec 2024 13:45:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a? ([2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436255800f6sm27926505e9.18.2024.12.12.13.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 13:45:10 -0800 (PST)
Message-ID: <924bb119-178d-4778-800f-94e884acc5a3@linaro.org>
Date: Thu, 12 Dec 2024 22:45:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-2-6112f9f785ec@linaro.org>
 <3aad9de3-76a5-4106-a513-4707b3e39e7a@oss.qualcomm.com>
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
In-Reply-To: <3aad9de3-76a5-4106-a513-4707b3e39e7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 20:55, Konrad Dybcio wrote:
> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
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
>> This vote value is called IB, while on the other side the GMU also
>> takes another vote called AB which is a 16bit quantized value
>> of the floor bandwidth against the maximum supported bandwidth.
>> The AB vote will be calculated later when setting the frequency.
>>
>> The vote array will then be used to dynamically generate the GMU
>> bw_table sent during the GMU power-up.
>>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 144 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  13 +++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>>   3 files changed, 158 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 14db7376c712d19446b38152e480bd5a1e0a5198..36696d372a42a27b26a018b19e73bc6d8a4a5235 100644
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
>> @@ -1287,6 +1288,101 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
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
> 
> No. This is a direct copypasta of drivers/interconnect/qcom/icc-rpmh.h
> You cannot just randomly duplicate things..
> 
> Move it out to a shared header in include/ (and remove the duplicate from
> clk-rpmh.c while at it)
> 

Not sure if this a good idea

> 
> I'd also really prefer if you took
> 
> drivers/interconnect/qcom/bcm-voter.c : tcs_list_gen()
> 
> and abstracted it to operate on struct bcm_db with any additional
> required parameters passed as arguments.. Still left some comments
> on this version if you decide to go with it

They are still very different, look closely, tcs_list_gen is designed to
operate on BW aggregations + scsaling, it would make no sense to unify them.

The calculation is simple enough, I made it explicitely easy to read and
maintain, but honestly there's nothing special.

> 
>> +
>> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
>> +				       struct a6xx_gmu *gmu)
>> +{
>> +	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
>> +	unsigned int bcm_index, bw_index, bcm_count = 0;
>> +
>> +	if (!info->bcms)
>> +		return 0;
> 
> You already checked that from the caller

Good catch

> 
>> +
>> +	/* Retrieve BCM data from cmd-db */
>> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>> +		size_t count;
>> +
>> +		/* Stop at first unconfigured bcm */
>> +		if (!info->bcms[bcm_index].name)
>> +			break;
> 
> Unconfigured doesn't really fit here.. Maybe just mention the list is NULL
> -terminated

Ack

> 
>> +
>> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
>> +						info->bcms[bcm_index].name,
>> +						&count);
>> +		if (IS_ERR(bcm_data[bcm_index]))
>> +			return PTR_ERR(bcm_data[bcm_index]);
>> +
>> +		if (!count)
>> +			return -EINVAL;
> 
> If this condition ever happens, it'll be impossible to track down,
> please add an err message

Hmm sure

> 
>> +
>> +		++bcm_count;
> 
> I've heard somewhere that prefixed increments are discouraged for
> "reasons" and my OCD would like to support that

Never got this memo...

> 
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
>> +			u64 peak;
>> +			u32 vote;
>> +
>> +			/* Skip unconfigured BCM */
>> +			if (!bcm_data[bcm_index])
>> +				continue;
> 
> I don't see how this is useful here

It's a leftover, will drop

> 
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
> 
> You may want to take a pointer to info->bcms[bcm_index]

Sure, will help

> 
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
>> +			peak = (u64)bw * le16_to_cpu(bcm_data[bcm_index]->width);
>> +			do_div(peak, info->bcms[bcm_index].buswidth);
>> +
>> +			/* Input bandwidth value is in KBps, scale the value to BCM unit */
>> +			peak *= 1000ULL;
> 
> I don't think this needs to be ULL since the other argument is an u64
> 
>> +			do_div(peak, le32_to_cpu(bcm_data[bcm_index]->unit));
>> +
>> +			vote = clamp(peak, 1, BCM_TCS_CMD_VOTE_MASK);
>> +
>> +			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
> 
> x is the avg vote, y is the peak vote

downstream sets both calculated from the exact same value and the same way...

> 
> Just noting down for my future self I guess, a6xx sets ab=0,
> a7xx sets ab=ib like you did here

Probably, I'll need to check on that, but it can be done in a second step when enabling it on a6xx

> 
> Konrad


