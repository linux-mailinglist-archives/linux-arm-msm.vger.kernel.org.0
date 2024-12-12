Return-Path: <linux-arm-msm+bounces-41855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4B9EFE79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 22:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1ACA188DBF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E45D1DD0F6;
	Thu, 12 Dec 2024 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LhRu7Fl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FD01DB922
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 21:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734039477; cv=none; b=OvYcQ0WQ77GLVVV64sNZPO7BPoGV3F3EYU2PNIR2apApgNnh/v9bV5kdtLSQPRYOFLWWHAWSo9ZXYU6TnqNohkZv1OSUDJUQeOue6FrguGmyU8SE1A3Wm/LQzbkLXznnN4fPewqXtgWCXkJ+ITfDY5dph8ZzEYUJVJEKCONULl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734039477; c=relaxed/simple;
	bh=JABPRPZ8Tq12X1enzZ585niniToZiqshyAK6HH3U7Lc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EX7N6PrWyGlb33PNdePdw8laJ9vqImEGMTina12/ZBcK2x4IXEt70MX0l5YDZ8qw8RPCuQVitXkmv7uamPfmWmKA99o1JSR4tlQ3yMsJJXl33EKFCZsXzZiLImjP0eiA+xnbr205F5xcEJ7tIcWq2GO2ObCM7SjOjVoFM7tvgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LhRu7Fl8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436281c8a38so5147435e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734039473; x=1734644273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCkTwnsf1PiA+hFHolRkzDIblj6R2OKbctOKbJTNTe4=;
        b=LhRu7Fl885peogzXr1W9HJ9QZiF4XfMbdG4WePcqLwdF0t2AS4juhiQN+3J4Xrydj9
         cIDvnA2lswu2RiIHPokj3NXIor7rpFCiekGdQMoA3WVRksQpWa8KNhtQwT+Ds7N5d6U2
         d2k5V/3u/CRXgCXbnlhhmjRylTqockGCY7hZ0/7C73grIwyJorZR9SNnqDgAXqkik9JJ
         yQU3mWDte4cbf6UjYMZHdMaSLQESQTTriHIhKSf5KW+aspjAl4JAXdQTUFmxCrm30LMr
         uTXFyWGzqI99wUxR+r9nthTdBdZ0AfEhrQLnocNomm8v7dsH1A4RIA9y/vbzegH+qVY/
         +riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734039473; x=1734644273;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sCkTwnsf1PiA+hFHolRkzDIblj6R2OKbctOKbJTNTe4=;
        b=qCT4sMlUJZBqsBiNUrsOYDwwpDdQICs7srfnWpd7D9yrvW8U5Qir2riljGFy3cCsod
         1lt9meNBZV+QKJNmacSymPf8KQFdNKNImMDdMZKULBD+EBcb57n3myRx3H95/EMPheNt
         ZYyBWds4aCABvi1Pd2VykWsWPklVv+p2WyAln0tK5bgpaQBOSH6BLSF06YJsVYdSrKof
         uWBrbOIsc+cQ2JaHcN7VLseQKV8EBdNldHmK7/hzuU93yuHhfMXOCcnVYRN/ZUh+480Y
         zGqc8pKVvndsZ9BxjTHyJKEXK55DUMI3XtapK1N+osbKUeRu+AlDfHfJ7izwnoyxA4XV
         Wlqw==
X-Gm-Message-State: AOJu0YxB74+Nk7OP/T6PMJPjbrrNH7XP4Fmq5pfcSgbd6EYMJQ2vO7BE
	r59gw6LdimjrJz4AUWGaY+X0Ou9UYaKClGs6ZB/okYVz8dL+rZMwQuifGpC4fUw=
X-Gm-Gg: ASbGnctdrJZ8O0pc8thuot4QM//xso+apAVFOZrBl8dGvglkphI9x1EKE6xirhVIKtI
	X0nzYm397Uy3VF2QPS2Db8XdA+vvOiaLtS610gyc/uX9KBb+0zkqUEShb0GpdNRkpxBk14dZdAW
	+jjQd3VXDsi/tz4ga6LY9lvyeop2WmVwQm7Tbn1Gj704bKJD1rnKRkQ72FAY5VABXYOINuuWTCv
	pfuzKmIKzJGvHYpZQVWtLSiSSCiGRMgYlAK/2AC8XrpgxJdoatx6x3sANpw9Nzi92oa0OyXxHSJ
	MnJU5PkcttBQl/DVXEtVMeC+qHnflLiKSA==
X-Google-Smtp-Source: AGHT+IH0fWO5XUP1USWRMXKG8TC1Mecy6u/d6ipjAauD0fNu54oNY/Jfg5nVZN0lC0VBwzh5I3O1qQ==
X-Received: by 2002:a05:600c:3491:b0:435:b064:7dce with SMTP id 5b1f17b1804b1-4362aa66f9fmr1322065e9.18.1734039473355;
        Thu, 12 Dec 2024 13:37:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a? ([2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ea75sm28203835e9.19.2024.12.12.13.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 13:37:52 -0800 (PST)
Message-ID: <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
Date: Thu, 12 Dec 2024 22:37:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
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
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
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
In-Reply-To: <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 21:21, Konrad Dybcio wrote:
> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>> along the Frequency and Power Domain level, until now we left the OPP
>> core scale the OPP bandwidth via the interconnect path.
>>
>> In order to enable bandwidth voting via the GPU Management
>> Unit (GMU), when an opp is set by devfreq we also look for
>> the corresponding bandwidth index in the previously generated
>> bw_table and pass this value along the frequency index to the GMU.
>>
>> The GMU also takes another vote called AB which is a 16bit quantized
>> value of the floor bandwidth against the maximum supported bandwidth.
>>
>> The AB is calculated with a default 25% of the bandwidth like the
>> downstream implementation too inform the GMU firmware the minimal
>> quantity of bandwidth we require for this OPP.
>>
>> Since we now vote for all resources via the GMU, setting the OPP
>> is no more needed, so we can completely skip calling
>> dev_pm_opp_set_opp() in this situation.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>   4 files changed, 46 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>   		       bool suspended)
>>   {
>>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>   	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>   	u32 perf_index;
>> +	u32 bw_index = 0;
>>   	unsigned long gpu_freq;
>>   	int ret = 0;
>>   
>> @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>   		if (gpu_freq == gmu->gpu_freqs[perf_index])
>>   			break;
>>   
>> +	/* If enabled, find the corresponding DDR bandwidth index */
>> +	if (info->bcms && gmu->nr_gpu_bws > 1) {
> 
> if (gmu->nr_gpu_bws)

gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the "off" state)

> 
>> +		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>> +
>> +		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
>> +			if (bw == gmu->gpu_bw_table[bw_index])
>> +				break;
>> +		}
>> +
>> +		/* Vote AB as a fraction of the max bandwidth */
>> +		if (bw) {
> 
> This seems to only be introduced with certain a7xx too.. you should
> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported

Good point

> 
>> +			u64 tmp;
>> +
>> +			/* For now, vote for 25% of the bandwidth */
>> +			tmp = bw * 25;
>> +			do_div(tmp, 100);
>> +
>> +			/*
>> +			 * The AB vote consists of a 16 bit wide quantized level
>> +			 * against the maximum supported bandwidth.
>> +			 * Quantization can be calculated as below:
>> +			 * vote = (bandwidth * 2^16) / max bandwidth
>> +			 */
>> +			tmp *= MAX_AB_VOTE;
>> +			do_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
>> +
>> +			bw_index |= AB_VOTE(clamp(tmp, 1, MAX_AB_VOTE));
>> +			bw_index |= AB_VOTE_ENABLE;
>> +		}
>> +	}
> 
> BTW, did you dump the values we send to the GMU here and in the RPMh
> builder part & validate against downstream?

It matches how downstream builds the Ab vote yes

> 
> Konrad


