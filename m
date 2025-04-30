Return-Path: <linux-arm-msm+bounces-56266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23066AA4BE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E66863BD5EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853D02641E4;
	Wed, 30 Apr 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PM/zHuyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869EB25E45B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017375; cv=none; b=hucezkqgmqB6YoYixmeFt0gNwzBp+hcoDyNXVpdQ5CtCEyt1Svse7XQa7yFuWdc7lGbdt3XhHIsYK8LIbNBzP1ztocK9db7gYXeHjRsyehfagw4Vd8IGkTFrF24a2X+dNInabGdu2ratvLJgVwxU/VWs3K74aeWcECpm0/0yPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017375; c=relaxed/simple;
	bh=gzkHwSINqk/wG+dEPUXrHWcOFDYjlD3M3qoHOoMhpgQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SJ6xszw9sjl9w9Z7kHw5hvyIU3jv0WxLA99QkgQF7PQrN1Qd1OU5EJb+Vz2u38YUiGCUr4ZorSIX/KOHBhTuRtI75vgBFcv/gz6Vx3A8NLLQU59gY7u2iP4cZ3196/2DNNSS/jEJCWPk+W+l4J99IIBUV498wSezzULx1tjKQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PM/zHuyz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43690d4605dso55685545e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746017372; x=1746622172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0QaE6gqDjxKdHf7ertrDDvouXP/X1oSlZQqvhzBwFk=;
        b=PM/zHuyzisxrTl+gAGUrv6Jf7Q/06RjLOX2FOb0Am2hpY3ZiBXQRgKOOBVY45dkt8c
         Cq8JwPgrAzNL2NmOMPNs1D4i1AmbOlC6Y8KphmEZRKaLVp3kKNuJY1Q6Lv29CmqfoRi/
         zfbXxQDnSxNmZyeYT5k15sn0o4CweqrP0iFtZ/AjsRkfunDmBbw7GVBb2qOL/g5aRoig
         pUwL0/RxvxM0n/mRZ9FSz04HCTu9j6VImPkEmtHaaZVWfQWe5Dd4r7eMHYB3TXwC5a7O
         orNv/9d0S5jAL0o+5b6H9PxyrY4R9SJ+m1Gzn5NoboGLaDczGqySmGEgnGBb0eTjKUYc
         //QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746017372; x=1746622172;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U0QaE6gqDjxKdHf7ertrDDvouXP/X1oSlZQqvhzBwFk=;
        b=K4iPEbwqk1ROT+9Xt5iT9UiyXd2ICKaHu2iZ0YCZBFLqRkpiyuGCw8U7fK/Nxl/FGJ
         CUNfyOpRvgUyB1UWrkPlGWQOSjdQorQLr+0OT5HEyjgpWCPUC9TUZehe7nli7ias+di8
         TF2jBrwApk+HGl6lFO4usoH5gaMr/tSJYKJvzPHw4kP/e9LYkezCntNGjSvOiZapc56s
         8AAxiWZa0XjBtG57JKO0+zEBtonvb6wTvZqR4HvPWcPYG2WfV6SeOGNglxduSQPRvY/z
         v7em3hEGi/3xBTulRO6U/6hqhuGTLpxo6UhvVZjTGhJcM5a8BPJc4Q0pmI+C/S8gT+zl
         4c1A==
X-Forwarded-Encrypted: i=1; AJvYcCXJt5XuBSeIX6ID4i0yQBJjIbFILzWDemE96Pwe+AfIxNsQBCViLAKp9RL+c3BtTB3fxDCaGo9L4WbAoW5r@vger.kernel.org
X-Gm-Message-State: AOJu0YyvhbPplQvcY6Waj6trkOVJtoELdKcESBIyEW1CsSCLXGzptaop
	UMrAnmaE7RvbMUs2KifW8ABOzJzJu8bGhbdvpLJ6IvlGGNmrKRniMIG0LlT7NSg=
X-Gm-Gg: ASbGncsZ3SNbidpcGusGqR5FZ8grJc42pg+0cz0Xi6fiX91IpCMgjWi/Q0B6iXMixJk
	m2Lj3y9NeUBApM+fhKBPYrjmyUNsBddi3WBjYQ1fkNtaCgPXFlPsA4aJsEfh18M35GlVQChMT4c
	q8IL/uZKzj0pFPTcUh7oaXI3T3/c2uWE8EWKDYJDJ/IbWTBYwnxCoQzP4mTdgTQbIj+q1o/uv7f
	Xl3+KxFodZBiPFPQXsY4Nuow0g4JxmnwYnZ6YzUyW8gwH3PsmdZrFi/b+RESSeadCNBmkWiQf58
	mDTsTBSGIpulHDCSDduzdvPE5v8Xt01r8JZKMuxgjxLZbiB4UGhiWG4LuF2HDQw8aPQ4QCzIZ/J
	3y+obFAkkFAiyOYMXTw==
X-Google-Smtp-Source: AGHT+IE0vi2coXCwFNtieUFxKKeCy42jmnqHs3dTSRXFK+ENcMKD71lm+Qd/xSuR3AE5EW7jjaACeg==
X-Received: by 2002:a05:600c:a016:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-441b2639853mr24601215e9.13.1746017371767;
        Wed, 30 Apr 2025 05:49:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785? ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b9726fsm24514075e9.8.2025.04.30.05.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:49:31 -0700 (PDT)
Message-ID: <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Date: Wed, 30 Apr 2025 14:49:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
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
In-Reply-To: <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/04/2025 14:35, Konrad Dybcio wrote:
> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>
>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>> should be speedbin 1", but what the values are for said "everything" are
>>> not known, so that's an exercise left to the user..
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -11,6 +11,9 @@
>>>    #include "a6xx.xml.h"
>>>    #include "a6xx_gmu.xml.h"
>>>    +#include <linux/soc/qcom/smem.h>
>>> +#include <linux/soc/qcom/socinfo.h>
>>> +
>>>    static const struct adreno_reglist a612_hwcg[] = {
>>>        {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>        {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>            },
>>>            .address_space_size = SZ_16G,
>>>            .preempt_record_size = 4192 * SZ_1K,
>>> +        .speedbins = ADRENO_SPEEDBINS(
>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>
>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
> 
> What I'm saying is that all other entries that happen to be possibly
> added down the line are expected to be speedbin 1 (i.e. BIT(1))
> 
>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
> 
> No, the default was to allow speedbin mask ~(0U)

Hmm no:

	supp_hw = fuse_to_supp_hw(info, speedbin);

	if (supp_hw == UINT_MAX) {
		DRM_DEV_ERROR(dev,
			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
			speedbin);
		supp_hw = BIT(0); /* Default */
	}

	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
	if (ret)
		return ret;

> 
> Konrad


