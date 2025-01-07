Return-Path: <linux-arm-msm+bounces-44080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B057A0398E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82B19165396
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 08:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081F61DF74F;
	Tue,  7 Jan 2025 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKd2wQYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155431E0B96
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 08:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237789; cv=none; b=UebLSHSrORoq8aO1c3UgvGP5qYxw6lRs0PdneuEBgw5+N/pgL4wzJa0tuyBwD1o2kIoiN11rUTy2MvJ09UBj/pF+c1y+RY9rMnod+vrBQi2HqRszhRSwvhxQk/vLnY7OokHX1CxjB0THdCBqocn3zQFbXENpNzXf8LYqejrrSeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237789; c=relaxed/simple;
	bh=Z6VFH/EjpbLKxrVOG3m6oo1//cU28NIpXQ7yFP3rR3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GvC0N9io2w8bTMWX0ckEc5sWgTsVgo+2cvxloWaYSkdI9nmMdsVj4vZhacCOs+6JaDkBXiunhE8BB6YfEYDbPi9zPVQnQWe9Dhy2jwKDzWy7yascEWi2wARGMmp+Tv9JQsd3DhUGoaWfVBBKMR+8R715BQgZNXNb+WjTn5AgavI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKd2wQYr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e2880606so11007600f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736237783; x=1736842583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPvkl9NLmMFO9chBKj0rhtLZ12jNHzyAWJ3EKiBo2Fc=;
        b=qKd2wQYrUpWSVl6CWikVu+soHnrVL93To7aiS7doxNSMhGDRSdSyCB/8zFwHKrzVTS
         1H1+Q9AH/c4cCekkFx3ITEZv5exrUVGbHI9ScFBwYBqnaDvtwLKKDyIKOeLxrvPE4ZC+
         Cb5n2CRi5DH7Wzqce+X7eIaqGhJnraCEi7yoYcYL0cQQJ9YAMbC3b7q4a3h3d8t2q+bf
         nLwg4HpiIJSqXSGhzRay5qtwgnw2Au4aLphOtPxiWZnl63mpHK/crZGuur1Xaq6xDXWM
         iuCLHQhxJV65wDtPFkQQq6tQdP3zO56NtIw/OltFx0XgmpHpHxOHd9EokILRp44PudLL
         /SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237783; x=1736842583;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VPvkl9NLmMFO9chBKj0rhtLZ12jNHzyAWJ3EKiBo2Fc=;
        b=MdfL5cP4+wo2rYa+9V7dpLGytkOAeBxdre/dFGNrGays/FGXKQ+4Rvl6nTBSOV9mDD
         2jYalCFwTr8PTNetHPKvnb/duGwD1K9UMQ0V3cgqT4lLHCculgAoZeIqLuCIbr6mcBZE
         K0S/Kem2Qu9ZdmqwP7RPjJN8/+AGGWVWfmnUZNr8BXM0RdIGzFav81sAu1v9m2VT+c7l
         kskdLYwgGGoR4SCp+/avKnZDVeQ0fhjaaXqsLqQRFbFOUpp7Y0JedGYuVf9hi9MqvvrY
         6yHmwGihjkfvRrC3OVjbbYeSBe3YcmG4UloCdxFXML6a+BHKAuwf5qWQN6ILM703VQT2
         9IZQ==
X-Gm-Message-State: AOJu0YxNf4AUkdeFVSrdvnKj3nIAIT7dpLYU7OUUvcR0XTbkcADAePDj
	Nse+QqGXfswxu2HCfRH97Dogm7flay1aPCQj0kZEU2YZUq2YcNLwF+RYLUiPjEU=
X-Gm-Gg: ASbGncu0ZEAmWIztFRVgZ9tPIXeqWz5M3PPPLYwpEcEIMVpKW4ITmicBvo7u+qLeKYE
	HmkplHEamnW8i1OU7WgoPyeBSMFaSuczam3TgiP3/3xLuRud1qibd161bd5cIRhPJqMb27Msz9x
	U9LcBD+GwVQdk5+y8ruVdOlH3r9MgrbLZK7Uwd/ks7XexIq1E425OvMwWgnn3GQ1oTKinQ1BXgr
	8zhKNIxI8kRmxXdwP55B7eEARTEpwZD/6uUPlwIYOMWI0Uo6+1FPY6wZ69GPRUyvWzowBHgYysd
	Lsr+9JZVCEF4RrzhUMp+8IzPmV+rD89nkA==
X-Google-Smtp-Source: AGHT+IEj3mnGDF4IJMWEXYu122nB2ocAcm6lUPn1P5i+p5AsmXkfV/YbZ2y/vsSj6aanKVz9FOlZRQ==
X-Received: by 2002:a5d:5987:0:b0:38a:6929:ffa1 with SMTP id ffacd0b85a97d-38a692a0090mr10700443f8f.23.1736237783202;
        Tue, 07 Jan 2025 00:16:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6d5b:2c82:bc7f:46f6? ([2a01:e0a:982:cbb0:6d5b:2c82:bc7f:46f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828989sm49811861f8f.18.2025.01.07.00.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 00:16:22 -0800 (PST)
Message-ID: <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
Date: Tue, 7 Jan 2025 09:16:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
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
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2024 05:25, Dmitry Baryshkov wrote:
> Enable CDM block on all the platforms where it is supposed to be
> present. Notably, from the platforms being supported by the DPU driver
> it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> (DPU 6.9)


Can you specify how to validate this ?

Thanks,
Neil

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (4):
>        drm/msm/dpu: rename CDM block definition
>        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
>        drm/msm/dpu: enable CDM_0 for SC8280XP platform
>        drm/msm/dpu: enable CDM_0 for X Elite platform
> 
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>   26 files changed, 26 insertions(+), 4 deletions(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> 
> Best regards,


