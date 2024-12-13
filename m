Return-Path: <linux-arm-msm+bounces-42089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A88FF9F1264
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5997E282DE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630E01E0B7C;
	Fri, 13 Dec 2024 16:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlEbMRJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664641DFD8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108064; cv=none; b=cq5KEvZggdgRC1+DLn3T7AvRHE5O/GB7LN7sWaC+/lHdzc89EJ//ZTus9DPmIBpdPGHEEFFUq/FuWw53CUFBBX93YztNuwBNO9Ij0ncz8hR+C7jyMwWcDF93W0h4uIy3bszk63PpxzHpfjP92a3H+IqDQNkYL4NhBKb3oJratrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108064; c=relaxed/simple;
	bh=XU5iI/hLzybY3Ny2wX3CP6O+8hYtARWiRowfWJjtIEw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hG/NtqtgaQN9GNq6aZ1fkiwVlnQWuUY9DmmhuBsPjOI9hNaGbbnk5F2IijgXTXBZKAw2mmCXeq4Ob7a62Atq85mCFa3VeeWCmNV8Ey+sN752MYBA7aUAG6AfRP8Es0wXqpZiytwPQz2rWFjGEdFNTwck5rqXMda5j3mAH16aQ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlEbMRJ3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso18798715e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108061; x=1734712861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhYZQe35crokcavC5cBfXzDPXtIKiULqcKxoeLDgk88=;
        b=AlEbMRJ3havPTqTW6J5Es9TbPZCn4+UYOikPyDu5+VKaeb7DYlcqbPvMuAa/s1hkBC
         Epj+wL7mCIXCqkYW/KMFu5At5OWXMEKQlJoFY3XAVxR/ugh66aQNuyqvFFMt/+llQa60
         G221e7aQh0hAqlsKwt39N57jwlwuuf1o+/ltQLJ/vWuQ49KsLivNBBBYsxFmZiPCaj8U
         GWYLZP1jkc8B7d6ssfmaff/eiT7D9W+uY1eOY0SAQZyxICPGRXTRh9QJpylfWlMlb50N
         vMg9cSilkmc5ftPnnxmxi+OnuIPMXy4nx46aaFuXUx6OMHSGJG+xtfxfa6Y3uYnf2ej6
         8RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108061; x=1734712861;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UhYZQe35crokcavC5cBfXzDPXtIKiULqcKxoeLDgk88=;
        b=q/Kf/ET9+x52B+hOKDpEI2MhpxfKAJNEmYTMP8xk+jm//aDAN+BcLVooHZlWZl1XOe
         dR121jlW+pQWCiITUNmknCvlZoGHVAau4E1YuoO1PorFL2dSSvbSOF48Hy9uhkB9lybN
         rk88Ql6/wNh4bI5kkpwxndWrEPl4cW2bWheypn8w7ubmRzbmBZ/fbEO5b38eA2+DLiFu
         qQq4qT3FLPyZOg59FcaIX/xWs2GA3eorNHfi34QNuaSyD/vO6x1IVtE/27vZ2685E+el
         kjJgSBdzAVfLp8z6ZhGmDLpWL6WvinihnLVwN/IAmHlQQw6qzx+G8I0sQ+VUTcd/nr/V
         7dgg==
X-Gm-Message-State: AOJu0YyHof13CR8Qaj+aJ87U5mIAif0uY9UgStB7O+cpT1FtTPxi4c3s
	8hyXrShvvfwmxqyC5Dy8t9xbNcskdts2hWvAlh/pIoct7r1q3FeSRJgwCiUIlY4=
X-Gm-Gg: ASbGncvdu7Sq3gDuiWfWAg2ALRDoUjYgfJvIl+pCOF+v4oeikx1IiCGX4Nc5F9pyrfZ
	hjf/+eBmNxudZDk2/E0lm6zJaG8qu7wmgl6bG5i6+0G6fMZqR/bv+w3et4yxv5Q4nbY72BvEyU2
	vZoabEqzVLx+X8/n61/ML8mtXufYWHgUNUvoOxOdip3IoZ/0IghItPkm8UHhJ5QAoPOQhK64zSK
	RXFUk6lxRR7yK7XsWW7PSSzKgyklgiKatyumT91a18fxgLO0wd7MItGgjs+GU5LTdOF8/KtSM33
	p/AhaDG9YTHiHSudsesTivdAMTsjCQsFTw==
X-Google-Smtp-Source: AGHT+IHhteapVHrOhIDQhnxAloCB38K7IQFWTgx0ajDWz0Pt0FetAnPdpqhRuEk0FUUisVsWd+Ja8A==
X-Received: by 2002:a05:600c:1e8a:b0:434:f5d1:f10f with SMTP id 5b1f17b1804b1-4362aa52fa7mr31133025e9.17.1734108060613;
        Fri, 13 Dec 2024 08:41:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70? ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362527ecc3sm56170105e9.0.2024.12.13.08.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:41:00 -0800 (PST)
Message-ID: <9dcf26e5-1c25-4a18-ab01-58ddf3fbd607@linaro.org>
Date: Fri, 13 Dec 2024 17:40:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
 <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
 <c2d8f443-5876-4293-8d2b-ecd13eaf8285@oss.qualcomm.com>
 <268d67c0-efdf-4ad4-b5fe-5b4f04e73131@linaro.org>
 <0d4d3ca3-ec8a-4e85-9838-a2bf1e07e872@oss.qualcomm.com>
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
In-Reply-To: <0d4d3ca3-ec8a-4e85-9838-a2bf1e07e872@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/12/2024 17:31, Konrad Dybcio wrote:
> On 13.12.2024 5:28 PM, neil.armstrong@linaro.org wrote:
>> On 13/12/2024 16:37, Konrad Dybcio wrote:
>>> On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
>>>> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>>>>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>>>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>>>>>>> along the Frequency and Power Domain level, until now we left the OPP
>>>>>>> core scale the OPP bandwidth via the interconnect path.
>>>>>>>
>>>>>>> In order to enable bandwidth voting via the GPU Management
>>>>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>>>>> the corresponding bandwidth index in the previously generated
>>>>>>> bw_table and pass this value along the frequency index to the GMU.
>>>>>>>
>>>>>>> The GMU also takes another vote called AB which is a 16bit quantized
>>>>>>> value of the floor bandwidth against the maximum supported bandwidth.
>>>>>>>
>>>>>>> The AB is calculated with a default 25% of the bandwidth like the
>>>>>>> downstream implementation too inform the GMU firmware the minimal
>>>>>>> quantity of bandwidth we require for this OPP.
>>>>>>>
>>>>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>>>>> is no more needed, so we can completely skip calling
>>>>>>> dev_pm_opp_set_opp() in this situation.
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 ++++++++++++++++++++++++
>>>>>>> +++++++++--
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>>>>     4 files changed, 46 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>>>>>> msm/adreno/a6xx_gmu.c
>>>>>>> index
>>>>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>>> struct dev_pm_opp *opp,
>>>>>>>                    bool suspended)
>>>>>>>     {
>>>>>>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>>>>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>>>>         struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>>>>         u32 perf_index;
>>>>>>> +    u32 bw_index = 0;
>>>>>>>         unsigned long gpu_freq;
>>>>>>>         int ret = 0;
>>>>>>>     @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>>> struct dev_pm_opp *opp,
>>>>>>>             if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>>>>                 break;
>>>>>>>     +    /* If enabled, find the corresponding DDR bandwidth index */
>>>>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>>>>
>>>>>> if (gmu->nr_gpu_bws)
>>>>>
>>>>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
>>>>> "off" state)
>>>>>
>>>>>>
>>>>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>>>>> +
>>>>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index+
>>>>>>> +) {
>>>>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>>>>> +                break;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>>>>> +        if (bw) {
>>>>>>
>>>>>> This seems to only be introduced with certain a7xx too.. you should
>>>>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
>>>>>
>>>>> Good point
>>>>
>>>> No no. Doing this will trigger some assert in pre-A750 gmu firmwares. We
>>>> learned it the hard way. No improvisation please. :)
>>>
>>> We shouldn't be sending that AB data to firmware that doesn't expect
>>> it either too, though..
>>
>> Well we don't !
> 
> The code in the scope that I quoted above does that

No it doesn't, if the proper bcms are not declared in the gpu_info, it won't

Neil

> 
> see the full explanation here
> 
> https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/graphics-kernel/-/commit/6026c31a54444b712f7ea36ac1aafaaeef07fa4e
> 
> Konrad


