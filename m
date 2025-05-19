Return-Path: <linux-arm-msm+bounces-58556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA9ABC7CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 21:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB8C3B0B48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206352116FB;
	Mon, 19 May 2025 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J4hcoefD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840820AF9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682833; cv=none; b=W6Lwe1eKCFosttK9c9LWHeQYyWUfEKapO0JMX5/OzJTilInEidntgC7BjFi0SrGu+yrRSbhDu0pwvIvQ1U5kp6R6Bbqttg7gsZ6K+zdZxAEhj+l86CoRjqK6d5+HFxQUsWZDXjt5hIKQCzTRTEVogi9zI7/lpTQgKxNqK+M+k9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682833; c=relaxed/simple;
	bh=TcgkbVnpQt+FYThL+uSFWFk5LZWDhD3xjAm+8YbUUmQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=laqbo+GAmUbJOx4+bieoVtidXqqvTdx9LEYlr/6nLFc9HvZzXuhIll72yqvLGteObqgIeLWENeC3+qQbKXIASciCJh87FEK8Jn2x4LY4b8v1IpOFysdFSMKYyokxRSxXABVg9kUzry412ZY61oFToEM24hy7TVPfSDeHF1S5Y1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J4hcoefD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso35420085e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747682829; x=1748287629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUIbMIX0qpjZAfI2726nQo87F32yjlrtrT1+wU7Wsio=;
        b=J4hcoefDI4rkqF1NBc5rosUFXzfqaw2ZxmvMMtxFlamyJ1xtrMVsd8b0ZzDvwdjQAh
         Q6SYWwhLMDgPOMbC3UkDUflcSNOaIsuLENl7Yu5Nda14Sxe8JqzsONT95eeano4mxVI3
         G6l2+kNAyIeawmzmADY+ZMUwaTySiGdYFx2qxX0D1oHSIKAdj5at4OmBQW9WmlX+TFpF
         8eVvSL5rhg3itqE0DredzUWHVCBsWa8b/4IBD5WX94A+Rzws+N/Ix3dLv+bL4L3dymPr
         huY8EfPj1zJSF98Jmam/fbuDJ/8Yh9p59Y6H6bgMTCH3L8OnRNi4Mieqa4AX0FCX3o4d
         A9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747682829; x=1748287629;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zUIbMIX0qpjZAfI2726nQo87F32yjlrtrT1+wU7Wsio=;
        b=jkOxKCpyLA56kDMc7ZyxJ82nbzPj+mGGQN+IyMSBqHXq2v+k7VUKAVrsofoSpEhJNd
         6O7dNVbeJI8JBCzloi1laDBGCxFHh4QNOair8ElSYXPdwVSGLAZxPBmkR19tr/4H+lXy
         lRGrcGWwaBTGkoQjB+ossVGB47KEA6KZrWnTBTNqbE8UpRCiR3tasb+BYp5JC9ogORkS
         7MaijIp19aDHBfjCkBO984n7mq2meM5mfLAzk9kQJazMOSEm4R0bAmplhCZzdqgEUlFk
         dd9g8RSetiNuHu7Xw70u6CxiXjIAGGKCmXgUHDW1DxVj2LL8c2A3PPRvVX8QD9H2qLFy
         6ktQ==
X-Gm-Message-State: AOJu0YxeBDVbLUJY5R/vt3/jTX7e37y/85px2DCoQhMvHcJ77MZa0yZ+
	m7tPEw1znLkg7gwM+6YLFAk6cSTL3sU0TNfs8bmGV0n5dZhsLTaU5gB5StmDGtv5/Bw=
X-Gm-Gg: ASbGncsQ/fgn/kG5mKInLMItUFpJgwTa4iHDGBMtoptUW+00vplFFr+2TSOK2hh6hZ8
	7IaNn3LuTElZLRpnnaU04x7+9CMK/5tbARpC9HDYlttOLDkYM0BtUvdLYwDBLB4sWqX5BjGr75f
	ruR4iK/4mLdBAy3Tbm+fCZ2Jp2zukcF96VcfBu8KvEJZuy57HbdpoqT0sn9Nzm7sTEdg2DmyiYj
	EE+9OnMqkPyM+wEEp2KSX7PJiXDr+K/iVezZkXkWTsV0GQN4L2DLU3GKQq8DfvdsitpvP5joF1W
	kWyaoKLwniRc5A+IPRCZaQpT27DVVLv4u+XEVauX49uNibUhBJalkaDJ9GnZApEvJRo0QUmXQ6X
	jXlHIvsB0Aqb+ElJfv+Ec1mn8aljc8P/fIcBFzQ8=
X-Google-Smtp-Source: AGHT+IGsfWglEaW0FESElW+HxWiqJEQe+UHwGwKsQ751zC2k/504E1anuJnCDgJIM+AhaqlWgfCb6Q==
X-Received: by 2002:a05:600c:64c5:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-442fefdad81mr123501575e9.1.1747682829460;
        Mon, 19 May 2025 12:27:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a79asm13616611f8f.25.2025.05.19.12.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 12:27:08 -0700 (PDT)
Message-ID: <4fb3b14d-e20b-4e0d-9b1f-a0a714240c42@linaro.org>
Date: Mon, 19 May 2025 21:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 04/30] drm/msm/dpu: inline _setup_dsc_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Inline the _setup_dsc_ops() function, it makes it easier to handle
> different conditions involving DSC configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>   	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
>   }
>   
> -static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
> -			   unsigned long cap)
> -{
> -	ops->dsc_disable = dpu_hw_dsc_disable;
> -	ops->dsc_config = dpu_hw_dsc_config;
> -	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
> -	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
> -		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
> -};
> -
>   /**
>    * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
>    * @dev:  Corresponding device for devres management
> @@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
>   
>   	c->idx = cfg->id;
>   	c->caps = cfg;
> -	_setup_dsc_ops(&c->ops, c->caps->features);
> +
> +	c->ops.dsc_disable = dpu_hw_dsc_disable;
> +	c->ops.dsc_config = dpu_hw_dsc_config;
> +	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
> +	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
> +		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
>   
>   	return c;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

