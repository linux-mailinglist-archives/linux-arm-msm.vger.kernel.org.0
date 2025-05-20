Return-Path: <linux-arm-msm+bounces-58638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B332ABD124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF95C7B0F43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABE225DD18;
	Tue, 20 May 2025 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTNT8OjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BEF10E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727772; cv=none; b=kWHI4PuSYjRDcDubCIUuJG10JSFOvdncFdA7cn1ckP6BYML8wiRjliPKR3P0qQOUl0kWyH8NKuWtsj0NrSiaM89iWn3M9gZrAPbKmYOmgtzFryc1gpkeD78mXHN+5UzRKVlNJFjIqYN3xyevLRfRdFVeeZrD1xuPKqvWX+/GwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727772; c=relaxed/simple;
	bh=694tGXNeN+BjLDOVyMSijRVIYZWMQslPcf4Lu2hZrhI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iv/FL9VD7/sT3LjfpWG8lnVpPCuh65T+z0LGbUhpY5HDGJc6e8IosNWJt5K6WASP4m+ihml+KqIRaLf5UpffGvQlDYZti+7dFzbGVoAWlcQW3QqqBoDMPxtJIHc/esqQPaN6BM69A7DfWyF0stSymUNZgoARmR6SJMexbL2v/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTNT8OjP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ede096d73so37354505e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727768; x=1748332568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F11bs03eZCLtBsVxVlw2EQffcaqCf7aP9O5RupB8kGc=;
        b=vTNT8OjPcs71KfSOZfYtzShdej+DdJZjsRQuuwsyg2QM15bLAhJnCqZr5y2i0/lc8c
         4beZYyAXA9x74XUkT37gI5DhZMBD6UtrWKowKAkLMKAvVzB7VnCUR4IeJ2Hgjb4VddPI
         0jh24x9uNGa9Pki8qH0HZUBw5M1WOVGw3UKlq4nnhBL3Dk1Z8Go9DMOEo4Ti3mKlavvC
         zlYqx3pvDOTCiUopFkpWcpgwtgKKknpOge3SebS3CmKdIsDluhYXbaWFY9mPyKrqrr0H
         UkcFUgvvM5PIb+Sf9/AVX10iYUQABs+B5tcqTf96DEafZhKTUbqblnVLCk4Lq9BpNosi
         XgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727768; x=1748332568;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F11bs03eZCLtBsVxVlw2EQffcaqCf7aP9O5RupB8kGc=;
        b=kAOxwKOsfcFMFEKtuW9hBIAznzOiVVm6U2x0K09mFB87R2BAmhXzpDbkpImPsyjr1S
         39JXXKMCCE+TI+7JjAsUPSTapGIpTmDOdytZMK57RXr1jUsGN176a9mYbnnFT4ThqObj
         e/GkG+h3EBKvpUcPY0sxh0rY5oifAAfCf6CzeujgykQlU4KvZJEzS1CPA4w/UNBmT20R
         1waLh9wf0eELuvlOgD+IkfpBwFuA7MRFbw+l0iUPEBTtZylierD/jh5GeL7uBc3Y/PGq
         eszLfuYVjBnVElD3bcGK9He7Pm3wfZY18fRSSJwgIb8xDpPQfeq42GCFxin+KSAHU9Sw
         VRZg==
X-Gm-Message-State: AOJu0YzsfSOgvcf7N7N++Mbc/zYKMHzk/o/3Kz1fa0jAaNmQsUNxEaTf
	b9fDobnYMI3Y4bntqlWGTEvyJZPNMvoHznQl2aN/1owdj/MT3/+6Tjep3C7yLB5PKD8=
X-Gm-Gg: ASbGncsVEdfY/NWj+JY0u6X4RjO1TQBegvdr6jkkoeXgtEmTZq7ebfSvDTpIp0TrlR/
	FzUevv+SqoZbcc0n5aBKfBuR2qyPafdeU3jfCs4CQC/LXI7Zt6NxqcsSNaUYyFw7mZ3ZiDngHHB
	H/QyeZJl4XOBjM6/21mxSC0lxXeuAPDN2RmwZCehs3/T8yb+OY6G4GcEhYIjT8IC6iVb4YzwRlh
	ZqJBxJ7Vkv9UlrRlJVSX0MkLXAucsE8LbOhRTk16gahb/5U8/7grt8wAxmg5n6437LrSVEChdRj
	QA8oio1NmLpKEy7B4SoENgvOj2fBTtKC/q9YvCKhlrqbnt157b8vm54C6yw0MjQOe3cU3g4seZn
	GTkj5ZUy3r7mefVquQ89GvONPOVZf
X-Google-Smtp-Source: AGHT+IGD16JXLg6tO8XaFCwpYAuFj0ArHLRvtiPSi3zl6hlgfffjwHEQZ2/bzv2WW2NLnQP7OWGaPg==
X-Received: by 2002:a05:600c:45c3:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-442fd6656f8mr120452925e9.20.1747727768488;
        Tue, 20 May 2025 00:56:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm20944195e9.22.2025.05.20.00.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:56:08 -0700 (PDT)
Message-ID: <c6b82b68-5407-4961-8ce8-d257cebcb0b1@linaro.org>
Date: Tue, 20 May 2025 09:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-10-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-10-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0863e5cfb3283ed32f61ddd4483220742df8633d..6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -105,8 +105,7 @@
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_FETCH_ACTIVE) | \
> -	 BIT(DPU_CTL_VM_CFG) | \
> +	(BIT(DPU_CTL_VM_CFG) | \
>   	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>   
>   #define INTF_SC7180_MASK \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 9981d090b689b46bbc378d1965b0efd1df0efa8b..82f04de6300eca7d05ece3ac880c26f3a56505b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -132,14 +132,12 @@ enum {
>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> - * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
>    * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
>    * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
>    * @DPU_CTL_MAX
>    */
>   enum {
>   	DPU_CTL_SPLIT_DISPLAY = 0x1,
> -	DPU_CTL_FETCH_ACTIVE,
>   	DPU_CTL_VM_CFG,
>   	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>   	DPU_CTL_MAX
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 2dfb7db371a3915f663cf134e4dd62f92224185b..772df53bfc4fcc2ff976f66ef7339be1ae3da8f4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -809,7 +809,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	else
>   		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
>   
> -	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
> +	if (mdss_ver->core_major_ver >= 7)
>   		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
>   
>   	c->idx = cfg->id;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

