Return-Path: <linux-arm-msm+bounces-58632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3235ABD10B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 071791BA17CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367D125DB1A;
	Tue, 20 May 2025 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzUMLhzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2991B25DCF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727695; cv=none; b=MyZH/o9l2njnGCI+q2tNcDFTFCKl+DdZMUhsQ1wiwg6K2jLB4ycIL9dwRt3iq+4V22OORPRrnuSS5zi682OKhom2jkbiGEQ1svCzyOJytRwPZEac5Rmcw2ox/VetpnBEpnsZISLwuoass/AixTVflpmIf3/Wtfr5AN40UBmcIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727695; c=relaxed/simple;
	bh=dg2ZUnrNhrcqshSiONu4HiUFxMc7ihGOqLOGXTy265k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p4mPJdmVfL7o29VnncRodBCp8zkjiLPXnZ53pDZzT8KG7vdD2GdLjKufZ1IgUEG++dxYRQ1+FzcIg19x87P83CLuhc5c0qs1w8HfDskmmRt4KPPam+dQPbYeVrwLuWj4dRhXuh+L3oF+c0bonc3z15oI6DMrHcVpuolSYL7HTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzUMLhzH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a3706ff36bso1421313f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727691; x=1748332491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmHJzTXgvlxjsSJS/8vEUaRv6lsn7GndOG9mwRJnBVU=;
        b=MzUMLhzH4C3t3SJ99qD9ZV4HhjYpmq3OLYP5oHXtLlYB4OY8COPL/9TssMfOINdVP1
         jbkHkZhwrVIPQ5DYe856YWQhY8tQ7Y0zWtrCc0xngBs8K3Dy4zS8hrXqvJdy7988HybV
         mCwjDnunpiN1K3nRIYGnpFf1QpJ2gD3iz+i3+y7bhy/HpFpgMW8yKkvVG9fZQ3zVRwae
         E4a2Pnf898o2Dr1aq1rhAWZtyXGUb4ig9tx1L9B/P+lVRTp5704+Elwg+Xwg+iqePzWK
         MMZCDO96TkQlbkKQ0fzwxs5rQ8ze7rZQmWFa3uO8cIofgaTIHwV0j3CcXiAJrujdQIsv
         ZDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727691; x=1748332491;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AmHJzTXgvlxjsSJS/8vEUaRv6lsn7GndOG9mwRJnBVU=;
        b=vu1+HmS3/X0ZiZ4YVmlLL7gVlTClnXf20juF1iiHLyPnzINUmp05B5ZzZ5nqlpBytS
         YK/xAhKdKXovKWeGd+pJh2oLreCEM2zP+pttIWn3IPR4RbbYLB1vVh5iZ/VIKUOl0GOi
         42gwrLa+HTInmr7j/otwSrgvo+oLI4aMR4TfNdDAldnFgg093dcOKvZ1PEM2ApC08aiT
         x3z6ZhFp5j8bnpyK7q1ajs22fs6/0C1z5yhNhWCqpaRZf3aleBUO0dRCfVEbFKoh/e7e
         lNkRcmHE6LKZmQjMFYyYQyugw5c88sha5nNY5s4UA3s+FRyopjgEL0Ff4ItGHmxOsXDn
         IC1A==
X-Gm-Message-State: AOJu0YzD09g3lBzyS6yzXlD99rYt+f+Qoouwkyh4jxgQLxW3giciCF2T
	t538Rsi6HSTiRoJBPBooSBGZpKB1Rdo/SQVxues9Box9LglvhYGUHYqWh/i6UtDEyoQ=
X-Gm-Gg: ASbGncuXTp52JUx1TOsfj9SZRQs6augCczpnodLoGrQrNxlxAyrvFkLKRvzrN3LrPQT
	z4H5lbZ9V443BytmjT9DGEmKlL7cgXhuAKcric00zjyXPuj7sMwyhqk2bxtop1Htpi6Auzm8Ue7
	SKUF/baz1BJ73N0/2vA89hwY96EdhoOqtO7z2IfubvlEkB9PscsyJfaQ7UizJF39IxwrQW+rQT4
	GnEDKVh58JGjuKSD7cbitvVqe7N0L4fc4dTgjEiXGg4UqzgubFK8U22qfDQMEM/cdsyHrleOQL/
	OsHN1g5HLErP6ancjnjGFzxYy+5Mq3inm9+W08/E1t7ZmCYLdmav9Qn1LFdnt9Sx31veUiIzREW
	yAjm2P9m8owd3TSeM21UohSeMsnrO
X-Google-Smtp-Source: AGHT+IFgTtMJFEz9OVOG4DvQgJmegTfdifKdm9bKW/FgSdez0ImuKoYiC70z5JjZSi6YNrZfLH+vtg==
X-Received: by 2002:a5d:5f8d:0:b0:3a0:88d5:7fca with SMTP id ffacd0b85a97d-3a35c808b9emr12016993f8f.12.1747727691355;
        Tue, 20 May 2025 00:54:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889d9sm15499428f8f.77.2025.05.20.00.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:54:51 -0700 (PDT)
Message-ID: <7995edf4-decc-42c9-ad88-ce234ef00c3b@linaro.org>
Date: Tue, 20 May 2025 09:54:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-16-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-16-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 7 ++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c         | 2 +-
>   4 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> index 8fe07a5683f734a058e7e7250f0811e3b7b7cf07..0e8e71775f2c1c38af018353c85ffeb6ccddb42f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> @@ -181,28 +181,24 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index df1eeb9082f74ab734c235f0cd0baf8c0eda14b5..75b679cd2bd27dd25971489a2d3a6f516b248235 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -95,14 +95,11 @@
>   #define MIXER_QCM2290_MASK \
>   	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
> -#define PINGPONG_MSM8996_MASK \
> -	(BIT(DPU_PINGPONG_DSC))
> -
>   #define PINGPONG_SDM845_MASK \
> -	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
> +	(BIT(DPU_PINGPONG_DITHER))
>   
>   #define PINGPONG_SM8150_MASK \
> -	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
> +	(BIT(DPU_PINGPONG_DITHER))
>   
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index bc71ec9a5bc8b6e15d7af13c42ba5d4197729822..ac63f753b43615f7c34d2da51fce919fd77142bf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -118,14 +118,12 @@ enum {
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
>    * @DPU_PINGPONG_DITHER     Dither blocks
> - * @DPU_PINGPONG_DSC        PP block supports DSC
>    * @DPU_PINGPONG_MAX
>    */
>   enum {
>   	DPU_PINGPONG_SPLIT = 0x1,
>   	DPU_PINGPONG_SLAVE,
>   	DPU_PINGPONG_DITHER,
> -	DPU_PINGPONG_DSC,
>   	DPU_PINGPONG_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
>   		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>   	}
>   
> -	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> +	if (mdss_rev->core_major_ver < 7) {
>   		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>   		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

