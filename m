Return-Path: <linux-arm-msm+bounces-58643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F381AABD13B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24AD83A3135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471AD2116E0;
	Tue, 20 May 2025 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmY1eRW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC8710E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727945; cv=none; b=hOWc1waHcW1q5bVSfm0geIqo4zn6FZjt5SIdoCDvg1kbRefLWDDEP3ZAPfhVbLTHSvN+EY1+pPuq8j7OkhFT+6BbHQUFvd17a4lzw8mkEPC76pbQNgMOStWxmpLGZE8NckTJzCLy3TZG8+ktN8pR3iAal4ALZ7J7KCoi1XtHZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727945; c=relaxed/simple;
	bh=HtdF/+HKNw4x8OKaYxE/Me0dMhZ7WCE3DcLVDTebkWE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kMoCC3hCGFVJYXS5JRGVNSyzeh2v0RCSreiSD/GndBQBT100CmRQxjUu+2PJwm+LWhkMjgT2+hRyzh0LIjVEDViOFHwXrPp+On/4GIZV0Tvsbh4RdWidAlg/7PWvUihcEYaSdBX3hbFzJ74Vwl9Tz4pQTZICr4FufLgFvC1LWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmY1eRW3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so64896025e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727942; x=1748332742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6f8cvNKScSNadpgBa20vfxx/XekVxFGIBj3EsSWOMg=;
        b=gmY1eRW3vJmX/b6o88wvsfrIMEXatESagFmMcQIwORYZsuAmneQqiEAXEP5V6hbZk8
         udSF4gBnoHFGRZ3KvkqQufY5QjSw+M1S5+bRJwjS7iT4cQkd3ty9p/wsSlBi9XN5P2cm
         uRJoGTozuc8YNo+BaS/sw3MtvN23fCQvT5r/k2BGYYDgDnFiiHKgPzJze2aYAgP71OTl
         zSn/LPAM4U9X9hB8aSzdjAPii6k/xqkKOAj8Y280SgOxbHi/+N/JD+bC/gxWQCp3PLJ3
         xzgVqLpd89YW5g0fxGUYNnQtvpQuTlCJ/jBMXCP8wN92pzTd8gBlH5ApsbvBfI1SN24n
         Um1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727942; x=1748332742;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I6f8cvNKScSNadpgBa20vfxx/XekVxFGIBj3EsSWOMg=;
        b=IiM51Mn1d0ixpxxDSPykjCpQl+t++TxqIOfkHOAK4/jjeMsS/A+cTOAtlDzzVmEKZt
         pPN6aw48IxT/w3EEPt8VFJVuGD2iMiw9G9+TlsVUzK4J/pVTcGrU45CwIK3snc1cwx6r
         wQBdPSEs77ADCrVpplJ/F2/lGBjYVvWVUS432ha2GrItB0k5DW/w6T3/VX22rA1AGyNc
         ulVLv6ynD5la5pCZmVjYkxfiMX853B4ET0GO2Yc/ZGrwAXdpoIsZ1jawjHy/Bf4aC2f6
         fq38h39zyN06/om2aj8YttgrUB/R3WR2FdlMKunUmmm0YJPaIzrefNKFz9NsUgktP1bT
         ZYUg==
X-Gm-Message-State: AOJu0Yze0EQsMVxIc1hOrC5k3jIUI6hJuMqpviks8WXNuh46qxgFTWI3
	pNMFCfLXqj5UEG5zl4CH+Uepm2u7KvAdLhcSeNCtX3w5vRnpmkXO7nWF9pdusiEjWSE=
X-Gm-Gg: ASbGncsjzwanPNt4wrbGqJiNqMdwAwIsyk+uSTkBPbxK9tDjrIs/CuWKVSyRnHrHrYz
	j6/x9CTpQv/DNvwQsvTZRkcU8GLosUJPkLKPWXfl7ChITvLeek9N3ycp6xN+uC/Tl5q13WVVOYz
	kfL3nTsw+xsst7VOxMbkOBMl9J0KBUBbw3/7hWGkyF/UAwgNgIGLNHdbIULkVlBlq4xagowK5VP
	K0Tisg8Z4t1e1bbPBIhal9k5tZWcplpmllpMUYd/kC7EMPzQueNQJx18IprxYma7RNdtrG+mfIy
	wLFwPTcwCd6SoAsyub40Yh2CGcPXpq/hjry0XyqorOkHscQ5SZ8aTlZb2y4FyVpSE51TfR5Gh93
	mdODv2HEUVOnAoFppw0uF4bEVc8CvVnZNDn6//Jc=
X-Google-Smtp-Source: AGHT+IED7tfL2FyGE5Lx6JVPqKxoExtJjE4z4w7pOPtfZkvCIYhusb4i851hfqw7B3k/wFuOclLfSw==
X-Received: by 2002:a5d:64cc:0:b0:3a3:5ae4:6e9e with SMTP id ffacd0b85a97d-3a35c8092dcmr14763199f8f.1.1747727941503;
        Tue, 20 May 2025 00:59:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d230sm15229306f8f.4.2025.05.20.00.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:59:01 -0700 (PDT)
Message-ID: <61f3e509-328a-4484-961d-f02f37c2c014@linaro.org>
Date: Tue, 20 May 2025 09:59:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-21-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-21-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_MIXER_COMBINED_ALPHA feature bit with the core_major_ver >= 4 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      | 6 ++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h      | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 2 +-
>   5 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 4777a4a852da0d65e20cebc31fd05647e0b4c4b2..d64ebc729bfb589bf90af89c094181f879d5b1ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -90,10 +90,10 @@
>   	(BIT(DPU_MIXER_SOURCESPLIT))
>   
>   #define MIXER_SDM845_MASK \
> -	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
> +	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
>   
>   #define MIXER_QCM2290_MASK \
> -	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
> +	(BIT(DPU_DIM_LAYER))
>   
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 9ba9e273f81ab1966db1865b4ce28f8c18f750b8..5e4608d10c6d4fee387c9a599a73b15661148430 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -85,7 +85,6 @@ enum {
>    * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
>    * @DPU_MIXER_GC              Gamma correction block
>    * @DPU_DIM_LAYER             Layer mixer supports dim layer
> - * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
>    * @DPU_MIXER_MAX             maximum value
>    */
>   enum {
> @@ -93,7 +92,6 @@ enum {
>   	DPU_MIXER_SOURCESPLIT,
>   	DPU_MIXER_GC,
>   	DPU_DIM_LAYER,
> -	DPU_MIXER_COMBINED_ALPHA,
>   	DPU_MIXER_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 4f57cfca89bd3962e7e512952809db0300cb9baf..3bfb61cb83672dca4236bdbbbfb1e442223576d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -150,10 +150,12 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
>    * @dev:  Corresponding device for devres management
>    * @cfg:  mixer catalog entry for which driver object is required
>    * @addr: mapped register io address of MDP
> + * @mdss_ver: DPU core's major and minor versions
>    */
>   struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>   				    const struct dpu_lm_cfg *cfg,
> -				    void __iomem *addr)
> +				    void __iomem *addr,
> +				    const struct dpu_mdss_version *mdss_ver)
>   {
>   	struct dpu_hw_mixer *c;
>   
> @@ -173,7 +175,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>   	c->idx = cfg->id;
>   	c->cap = cfg;
>   	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
> +	if (mdss_ver->core_major_ver >= 4)
>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
>   	else
>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> index 6f60fa9b3cd78160699a97dc7a86a5ec0b599281..fff1156add683fec8ce6785e7fe1d769d0de3fe0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
> @@ -95,6 +95,7 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
>   
>   struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>   				    const struct dpu_lm_cfg *cfg,
> -				    void __iomem *addr);
> +				    void __iomem *addr,
> +				    const struct dpu_mdss_version *mdss_ver);
>   
>   #endif /*_DPU_HW_LM_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index d728e275ac427f7849dad4f4a055c56840ca2d23..7bcb1e057b143a5512aafbd640199c8f3b436527 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -60,7 +60,7 @@ int dpu_rm_init(struct drm_device *dev,
>   		struct dpu_hw_mixer *hw;
>   		const struct dpu_lm_cfg *lm = &cat->mixer[i];
>   
> -		hw = dpu_hw_lm_init(dev, lm, mmio);
> +		hw = dpu_hw_lm_init(dev, lm, mmio, cat->mdss_ver);
>   		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed lm object creation: err %d\n", rc);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

