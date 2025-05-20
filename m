Return-Path: <linux-arm-msm+bounces-58642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35EDABD136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 035B83A7CD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8142571D3;
	Tue, 20 May 2025 07:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pE2bRIqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A690420E6E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727929; cv=none; b=IBrvzY0wl7ukXb9fMOl+qXWI2JG1oBNFcXcsayRgkqy7Bh5TR3eFxhiFGqo9PeR3H/l6mkcHHyz9QVrNiZI0KfyqXImoqLUq/ThrWCDmfH4KpeJimJf/KSnELk/qBVN7UCZIzwGQ/NmBFQM30rSl+gO5X2VCIbV9IhDpkZ/vBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727929; c=relaxed/simple;
	bh=3M4FcN/9RrOWe9hit7alhWDQL8MkOlj0S5DiYuwBk9w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HWsM4o7BGx3UlVP7ufTLhV5Bffh6O1zhbGBfVxBxIaKrmmKhg9RCWVse7fpoW0Z8roHQw/JOXJUVKUv0VLbero4nJQv/E9p0myIG1vUi4VTueyL2VH0BztTliLDEv+GAMSY4I8lhW3thoOlqUb6+0/SzzE7ZcnI6jiLtZoZ9Cyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pE2bRIqh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375888197so841104f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727926; x=1748332726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oo0/tdevSaG7ElMyXzN5kWb1dc7pDpkxqWGhmvLy1sA=;
        b=pE2bRIqhfnrbmxkBLUq8IsPPN2H5AosRWOgyDZE8LrXUe504ZyDKBbJk883ojpYyuq
         YiS/0kmJ9G5ROxnSxhXysmg+MLBZ3oOxlknfTH/feN42rAnjAqUeZxVKLeyerdSCNoPx
         X9iFfcnD5tMUKylBm3gCj1KLgrsWEbGTzWbW88OXtRiVpCRM2K0/39y5QXqHbK3af4pG
         Kfe0ZhqHY80jooj6Zm7W6ptCR+0TNvlmoZqzFWBUaat5zr4OdrZuOMS/+1y2i/65Lgli
         uuPsMPMt8spTHJg6MZHrZvxIx4age5JacQWhbKp2j7k6g9ytVEKmAgVqv2NKoRCWTdj8
         c54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727926; x=1748332726;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oo0/tdevSaG7ElMyXzN5kWb1dc7pDpkxqWGhmvLy1sA=;
        b=UjJilMjYzgXe4OcDZmRoLw9ty7gnJWsIiLsmyUuDKmdL3UuPNSvRY3FuRHsA0BncCK
         RID+j1xXNBGVZc6s/8oXwN/YL65akJTTlu9YFu/0uIMYaZySkNy1nteXjLOcZXy3V6wh
         a5dYMcWCWAYqlEVCfb9OFJEEuAovsWmm68eDsmGkFqMrUuQhWHpnSRXVGrRLlfIUBvYt
         1U4RFB6NL8tF0e03DxOk/7a+0O4RChPgTsepEqPQPXEE2f7Y5zieU3T/7jzgr0lt/vW1
         2kSoXGKw6NCOwoCJ0wYZNwT++pCvBjZkyjhK9mSJFYLt2/srWNpEGm8VQ2XZCfOTGGYJ
         yPjQ==
X-Gm-Message-State: AOJu0YzFX9ZK/cohXQkKBoZsfpMFgzvi0ugPcEmQ1gvgwhr08z0Vtsi5
	iov7UwBpbn85SzLi1ufs7gJJw6f+hD0LFRxh4atwsnP1H3Q2ecSIWmoR3hgSXhoEfE4=
X-Gm-Gg: ASbGncu/VU8fPBlCDzopXU8y2RbD30uZYRDsKDcgq9Oj8QTT1678lDX7bp78/lorZxo
	d9fNfSfCvdaES0x35Oumole6tAHt72C0SwJY+6Lc4CAftX3glFYUi02sQ2mKDyw4rDrLzgEn0+F
	MHAnEaa6DAHULK0/dm4+X8WBp0QNRQ/4ZayD6IUmAS5xMlBbqmS6KnBRjb368s0BRtlrxIT0cjo
	uREluMZwNKzYJgFxXDfe58K2fXA7PfBsttYY9mVE4U9kWv4dW/N3q4akkqBxVIwu8aQwi2c7brr
	2hEgrH8M3CQ+LI3aeF/Z24Nl40hLsyqk5NmdWY4NZ9tYph9JMjNE84N6Ecz3zmoooG6KcXMz/+m
	foWoAymIz20bv3M4DakLztEgU7nlp
X-Google-Smtp-Source: AGHT+IFCFBQUc2T7aE15/7qoiKLEOsTNzdjjQB7Bt1UC1UIFDiRVUhj/6u/Dr9+31dg/KRb6wY9wxQ==
X-Received: by 2002:a05:6000:1449:b0:3a3:7638:d754 with SMTP id ffacd0b85a97d-3a37638d82bmr3475599f8f.21.1747727925905;
        Tue, 20 May 2025 00:58:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88941sm15684159f8f.61.2025.05.20.00.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:58:45 -0700 (PDT)
Message-ID: <8eebc659-b5c7-4c49-b2cb-e0b20dd30f8a@linaro.org>
Date: Tue, 20 May 2025 09:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 06/30] drm/msm/dpu: inline _setup_mixer_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Inline the _setup_mixer_ops() function, it makes it easier to handle
> different conditions involving LM configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
>   	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
>   }
>   
> -static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
> -		unsigned long features)
> -{
> -	ops->setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
> -		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
> -	else
> -		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
> -	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
> -	ops->setup_border_color = dpu_hw_lm_setup_border_color;
> -	ops->setup_misr = dpu_hw_lm_setup_misr;
> -	ops->collect_misr = dpu_hw_lm_collect_misr;
> -}
> -
>   /**
>    * dpu_hw_lm_init() - Initializes the mixer hw driver object.
>    * should be called once before accessing every mixer.
> @@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>   	/* Assign ops */
>   	c->idx = cfg->id;
>   	c->cap = cfg;
> -	_setup_mixer_ops(&c->ops, c->cap->features);
> +	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
> +	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
> +	else
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
> +	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> +	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	c->ops.setup_misr = dpu_hw_lm_setup_misr;
> +	c->ops.collect_misr = dpu_hw_lm_collect_misr;
>   
>   	return c;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

