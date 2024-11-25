Return-Path: <linux-arm-msm+bounces-39066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C77D89D7CB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 09:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33269B22A9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 08:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B9818A93F;
	Mon, 25 Nov 2024 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f60s+7bX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132F188591
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732522503; cv=none; b=GHCo8sbNZUyRI0+BhX/bXygMTEP/HrLRMBuEe3GFNZBM9MoDjox+ihYWMltwrRLrr1xZx0XkzTDgqSMchvKwJv9YGZDYftSelINuiV1r6QCoE6CqW0u68WCWesml8YLxClfwgpAM4S3k24Rc/maPFd3ndumjLMY6BPGlO7+0IiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732522503; c=relaxed/simple;
	bh=fYjHKXxXWtY3cJwzNq4qtm4J8QtIYUYBiDZGU1w/GO4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kBiLS/VIdxyCZeAWBXXBytIniOAstaz/iU3yPT/1HUgtdt2FTgOh1u6f5HyWURvDPLp7AfNtSSqBE/NuErOaSb23IXsOpSGoumGcMGizaKrvGTsCvcEINl7djiZKcpbLePCYPwlCm3U8S+DMgT9f76e4dl5EziKfP9wbp0DzTk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f60s+7bX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-382378f359dso2866047f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 00:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732522500; x=1733127300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuNZSDzeVZdDQZua1seWS+OU6/2Ie+aLuH3627NtT64=;
        b=f60s+7bXilyKeLzyNg70R5i+Obr01IXFDYjj8vy4auiz6kSX2GVx4Ym75rR871z6jj
         RJLbfb9lE5K3oti+JmMUrV8x0890Xz4iRJi+wyD4oM5l4jCTd+ICyZ894N4yZOf4LUkA
         h3KmV7EBa+QJDvCeGpBygArgdrqd/Sc79Zqf27xQuo+BDmXVlqH4DqRhnWogCpNbLsJk
         gRfA4LFhotd2iLrglh17WIvJLS3SOKPe2kjhuiBMCZzcst9KCcBu2xf5S3pxL5XHGN6B
         AElcL41uzFu7TJXdOFDPtjcbUIpF7DarrazycSeNXh4CEZc7sK8/MvyV6/bkcX+/6EXt
         cXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732522500; x=1733127300;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VuNZSDzeVZdDQZua1seWS+OU6/2Ie+aLuH3627NtT64=;
        b=Hai55MMJTW9b/9eLGANExrZTD4RJHIECFYqnrb5SY/f5OTeZ/DXixFde/GHSSeh00O
         /6HoHS5UH/Ddy/iZk36F5vfm7oXT4BsaRup5ATi4DecFvrKvdUCqK2Br3eq4mJ39iXbM
         E6hRcsYXp+Xqreb/0V+kwYH4W0w+zBYN5NM8KmTOVn+ov0cU++q/85VMmgFblVhNq4vW
         Bd8DHe7eis/q1xpQO99CvpGoCXAHwQgrx4qcXoVHgLpqr6fkpEmDxJjlLWPz/TBO97zM
         9dzU+NPu1DqPk0ldH2zcIfuCuVY/HBP3e2M3ovEbuEHNODdENSsN8LAnrbwbkBz7nIvp
         DJlw==
X-Forwarded-Encrypted: i=1; AJvYcCUUf7GkUz3d+6JhKdU3bEBoi0bVdgGKdZxCrcsJ61Q5uFhXyX4cu38Ahlap46prSx88nHrTxnlklldGACTt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyf8ecT/zpSCrGHLDE2QEh+glOrIsVYVujp6IYORKTWlJAyGsJ
	sgkVToE978idqnr/x3nmQd67+MOPfqkK/y0LTwOX4Nnc0YLS+xKoKreZoRFmJQE=
X-Gm-Gg: ASbGncubN2WbGSzs8/ows9KjRDLsn1Z3ooF99lgEoEiYiPdVPUtGzsaGSBsLfCZDpvA
	U+pHZ8/bkONNgdM87pidqyrkLsnjvyLETg1GELygOjr+zvVs6rzzsaKan8Wl6RZTa6ltTY1UY7r
	qXeF7m0AeOJngdXRoQ1xc1lIR/eor3NV/IDWaZ03J8Neustjx9mCb27pJSLjRRh6T+LxQDKg9h8
	hdAtfKCP3JemICywpEPp+MyvYrw83o2FLatJC73R91m/Eaombz8u2pme1rFLFtiUyP5n79vqIDy
	estI9ff2CnBhIU7Y9ctfmP8p9iY=
X-Google-Smtp-Source: AGHT+IEBgpfTABC9GcRijyVRfCMnEOtAaw2EX4TxRqz+qu2+hlRTkTPWkBsyICRahX3S9/vDx/qV2w==
X-Received: by 2002:a05:6000:1449:b0:37c:d569:97b with SMTP id ffacd0b85a97d-38260b60008mr9617189f8f.19.1732522499968;
        Mon, 25 Nov 2024 00:14:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm9606898f8f.91.2024.11.25.00.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:14:59 -0800 (PST)
Message-ID: <a46b4151-fa44-4ec9-80f1-f3151749c529@linaro.org>
Date: Mon, 25 Nov 2024 09:14:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 02/11] drm/msm: adreno: rename quirks that are features
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-2-4deb87be2498@linaro.org>
 <20241123192551.ederap4nmtjifrdq@hu-akhilpo-hyd.qualcomm.com>
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
In-Reply-To: <20241123192551.ederap4nmtjifrdq@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2024 20:25, Akhil P Oommen wrote:
> On Tue, Nov 19, 2024 at 06:56:37PM +0100, Neil Armstrong wrote:
>> Half of the current "Quirks" are in fact features, so rename
>> the defines with FEAT instead of QUIRK.
>>
>> They will be moved in a separate bitfield in a second time.
>>
>> No functional changes.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 62 +++++++++++++++---------------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +-
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 ++--
>>   4 files changed, 38 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..825c820def315968d508973c8ae40c7c7b646569 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -743,7 +743,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_512K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a615_zap.mbn",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -769,7 +769,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_512K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
>>   		.init = a6xx_gpu_init,
>>   		.a6xx = &(const struct a6xx_info) {
>>   			.protect = &a630_protect,
>> @@ -839,7 +839,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_512K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a615_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -864,8 +864,8 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_512K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			  ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			  ADRENO_FEAT_HAS_HW_APRIV,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a620_zap.mbn",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -892,7 +892,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_1M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a630_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -911,7 +911,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_1M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a640_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -934,8 +934,8 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_1M + SZ_128K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			ADRENO_FEAT_HAS_HW_APRIV,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a650_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -961,8 +961,8 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_1M + SZ_512K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			ADRENO_FEAT_HAS_HW_APRIV,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a660_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -981,8 +981,8 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_1M + SZ_512K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			ADRENO_FEAT_HAS_HW_APRIV,
>>   		.init = a6xx_gpu_init,
>>   		.a6xx = &(const struct a6xx_info) {
>>   			.hwcg = a690_hwcg,
>> @@ -1000,8 +1000,8 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_512K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			ADRENO_FEAT_HAS_HW_APRIV,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a660_zap.mbn",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1028,7 +1028,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_2M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a640_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1046,8 +1046,8 @@ static const struct adreno_info a6xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_4M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			ADRENO_FEAT_HAS_HW_APRIV,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a690_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1331,7 +1331,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_128K,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_FEAT_HAS_HW_APRIV,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a702_zap.mbn",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1355,9 +1355,9 @@ static const struct adreno_info a7xx_gpus[] = {
>>   		},
>>   		.gmem = SZ_2M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			  ADRENO_QUIRK_HAS_HW_APRIV |
>> -			  ADRENO_QUIRK_PREEMPTION,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			  ADRENO_FEAT_HAS_HW_APRIV |
>> +			  ADRENO_FEAT_PREEMPTION,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a730_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1377,9 +1377,9 @@ static const struct adreno_info a7xx_gpus[] = {
>>   		},
>>   		.gmem = 3 * SZ_1M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			  ADRENO_QUIRK_HAS_HW_APRIV |
>> -			  ADRENO_QUIRK_PREEMPTION,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			  ADRENO_FEAT_HAS_HW_APRIV |
>> +			  ADRENO_FEAT_PREEMPTION,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a740_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1400,9 +1400,9 @@ static const struct adreno_info a7xx_gpus[] = {
>>   		},
>>   		.gmem = 3 * SZ_1M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			  ADRENO_QUIRK_HAS_HW_APRIV |
>> -			  ADRENO_QUIRK_PREEMPTION,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			  ADRENO_FEAT_HAS_HW_APRIV |
>> +			  ADRENO_FEAT_PREEMPTION,
>>   		.init = a6xx_gpu_init,
>>   		.a6xx = &(const struct a6xx_info) {
>>   			.hwcg = a740_hwcg,
>> @@ -1422,9 +1422,9 @@ static const struct adreno_info a7xx_gpus[] = {
>>   		},
>>   		.gmem = 3 * SZ_1M,
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> -			  ADRENO_QUIRK_HAS_HW_APRIV |
>> -			  ADRENO_QUIRK_PREEMPTION,
>> +		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
>> +			  ADRENO_FEAT_HAS_HW_APRIV |
>> +			  ADRENO_FEAT_PREEMPTION,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "gen70900_zap.mbn",
>>   		.a6xx = &(const struct a6xx_info) {
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 019610341df1506c89f44e86b8d1deeb27d61857..2ebd3fac212576a1507e0b6afe2560cd0408dd89 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -2478,7 +2478,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>   	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
>>   
>>   	adreno_gpu->base.hw_apriv =
>> -		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
>> +		!!(config->info->quirks & ADRENO_FEAT_HAS_HW_APRIV);
>>   
>>   	/* gpu->info only gets assigned in adreno_gpu_init() */
>>   	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
>> @@ -2495,7 +2495,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>   	}
>>   
>>   	if ((enable_preemption == 1) || (enable_preemption == -1 &&
>> -	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
>> +	    (config->info->quirks & ADRENO_FEAT_PREEMPTION)))
>>   		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
>>   	else if (is_a7xx)
>>   		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 9ffe91920fbfb4841b28aabec9fbde94539fdd83..09d4569f77528c2a20cabc814668c4c930dd07f1 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -207,7 +207,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>>   
>>   	priv->is_a2xx = info->family < ADRENO_3XX;
>>   	priv->has_cached_coherent =
>> -		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>> +		!!(info->quirks & ADRENO_FEAT_HAS_CACHED_COHERENT);
>>   
>>   	gpu = info->init(drm);
>>   	if (IS_ERR(gpu)) {
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index e71f420f8b3a8e6cfc52dd1c4d5a63ef3704a07f..8782c25e8a393ec7d9dc23ad450908d039bd08c5 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -54,9 +54,10 @@ enum adreno_family {
>>   #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
>>   #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>>   #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>> -#define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>> -#define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>> -#define ADRENO_QUIRK_PREEMPTION			BIT(5)
>> +
> 
> IMO, we should not keep features separate. In future, we should just append the next
> quirk/feature at the bottom without disturbing the existing bit
> mappings. Just to ensure we don't accidentally duplicate a bit number.
> 
> I agree on using 'ADRENO_FEAT' to distinguish features.

Ack, this is the conclusion on patch 3, I'll drop the next one and not
separate the flags.

Neil

> 
> -Akhil
> 
>> +#define ADRENO_FEAT_HAS_HW_APRIV		BIT(3)
>> +#define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(4)
>> +#define ADRENO_FEAT_PREEMPTION			BIT(5)
>>   
>>   /* Helper for formating the chip_id in the way that userspace tools like
>>    * crashdec expect.
>>
>> -- 
>> 2.34.1
>>


