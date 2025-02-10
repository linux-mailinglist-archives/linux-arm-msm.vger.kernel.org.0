Return-Path: <linux-arm-msm+bounces-47416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ABEA2EB79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 12:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F350B7A1994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690D21E0DCA;
	Mon, 10 Feb 2025 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJeHZuiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F51E379B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187563; cv=none; b=lH7wjd9pDgllsh7CstHbMhu6d/J96QZknaUyB2oU9vAhD73aLXYN8YNIqNy+2hjJyUVHSP402lQ43Gb8GBI2hg3b18ajkWkJtoFGKUoYHObSsoLXzS59HyxsiYTQwPq4gJE31FXVzzg3py8O04b08Dm2VkA5yvSA+uM4Yy6+kwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187563; c=relaxed/simple;
	bh=3gWCjUdrhEX5o1hKIRRVUTniivb3NGT2sSazolj94l0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iCqNxDYl0wfRuPIwLBp1GlEvP3q4lj+FY9k5jk1gpOf9tHzh4ak4uiKdpfmNdHWu/4QgRXTWcTMBy4zQyrmh+HSbmYXLRmfKeqHMxSOXA3lGOTCaH7m2GijbQZiIl9Z4a/q359m3PY8vE1jC3Ndtqw0uY59eYpUsw3rTaJCm29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJeHZuiF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so1305641f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 03:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739187560; x=1739792360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdyKhWNG/YV+fyvzEZfQRru8urZE6HyQB3qAUgMoUvM=;
        b=CJeHZuiFrPuXkIFLMe5bzHB218M6zjuW0wEF/1URPNN8Pj3aFGu+vnLbBZzRwxJ8cy
         6VZ4qq1ShLKEPxWUlv+lFo8fDwk+Npjj2/uTtEBz3q63m8F1rgS0372AIBPf/m2h2Lux
         89vMzWIzDzOK0V3utQmhRvHOed+nEP9Bg5tTfVUUaGSV2yyNhfJswNjs5epZZVJq8LvT
         uuLXEL6tqYU8zlRTcUXe+gb5gkyCQBc7ppYLEirO6P/9KZKfF7231wcbqCK38IU6vV89
         AhWeyOMQCJWfAGqgH8KGMGqjfu4y0TKH07eskuqWotCZzLknPrApSw58XCUlpfmnHdJv
         tg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187560; x=1739792360;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HdyKhWNG/YV+fyvzEZfQRru8urZE6HyQB3qAUgMoUvM=;
        b=spnRV1ZjUruGo4Z4CHZlIyhjDMI6IHVKjvRil7j3V/AkD40n1KTvXR9LbrRcz0tk11
         qajOjUevC/5OM5wlC796u+2vKaTUsLZloCmp5kC66V8vA68guHJ+Uf6dkqRSIoLUlnvw
         +TGO/vonOSMLHjcPTTk2v1ZR0x2gp7bRdDeKDK5rLzWMwgrVh0Tm3h0zFDFVhVsZFNuj
         mamETZMVDBqW3pdvtANjcfNMjUUwptrAyB/hhBjJad/HqKpOzA+A2Ik9Uf+Lk7Yn6AqR
         bDLeaRgZj/I8jzKKjceZyxi6rVDmbT4C77hsaqhknYRx6eqrCXU60zm7ldqk/eOvKd1n
         cYpA==
X-Forwarded-Encrypted: i=1; AJvYcCWDJnbLTymxMQpUdS60ojUMP1mcqKc1QlITs3s29EPsVgeFt9ZzzwAk+0WhK8QZimazzUZmgJyIeMR1zU8I@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKxnhHFif1xoyNA/jvflRznVtm3bxklO2FfCyo/B7UKWFHhzJ
	etePnSq1LpLN7Pdl/udz0RusHaRCssU+5st87ToFPlBQGNIZUrL6zdpXR9olZgY=
X-Gm-Gg: ASbGncs4jMEEaxVFhXpIrPnIpDSAMHLbVKfkI1e3T5XtLuN1SNnXGMNy3A/39Ey3tgM
	wNA6z0n4xpGdOGHUnlRv0xvZhimNru0I1c/daorzDv7zQi2bsPFHlY4zyOArWLK/ZrHBXLqbEJO
	sNOVmIF6vOZxg84MERS+XB5jbGRuAH4XZLPDx7BFS+I6uCbxT6vnYy+SkmiyzUK9ggB2jRsp31e
	blStI+Ia4EkpR41iaeFFQbxRb/ufrFDP9r8j1MO3/EQ+R312cNIAvq0/vrgKICWb/9lcG2AxLqa
	5ZdycOw8LSezomHOmpe/FpdwgZdcq8ItU0SxX1AlIKn03Z7D0xn+e6fgUOOEgIRC7nof
X-Google-Smtp-Source: AGHT+IGhf9lS3crLEoNLUnBANd1l1OnXNNmmhTax0NZR8qnDFb0O9+hRSYiZbS083bbEEChIcHAjXA==
X-Received: by 2002:a05:6000:4009:b0:38d:be2c:2f5 with SMTP id ffacd0b85a97d-38dc8dc3a56mr7631659f8f.6.1739187559686;
        Mon, 10 Feb 2025 03:39:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc4d00645sm10937178f8f.66.2025.02.10.03.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 03:39:19 -0800 (PST)
Message-ID: <d1a1c179-664c-48af-baa1-2c8329575174@linaro.org>
Date: Mon, 10 Feb 2025 12:39:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] Revert "dmaengine: qcom: bam_dma: Avoid writing
 unavailable register"
To: Caleb Connolly <caleb.connolly@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Amit Vadhavana <av2082000@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <kees@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>, Robin Murphy
 <robin.murphy@arm.com>, Vinod Koul <vkoul@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dmaengine@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250208223112.142567-1-caleb.connolly@linaro.org>
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
In-Reply-To: <20250208223112.142567-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2025 23:30, Caleb Connolly wrote:
> This commit causes a hard crash on sdm845 and likely other platforms.
> Revert it until a proper fix is found.
> 
> This reverts commit 57a7138d0627309d469719f1845d2778c251f358.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   drivers/dma/qcom/bam_dma.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c14557efd577..bbc3276992bb 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -58,11 +58,8 @@ struct bam_desc_hw {
>   #define DESC_FLAG_EOB BIT(13)
>   #define DESC_FLAG_NWD BIT(12)
>   #define DESC_FLAG_CMD BIT(11)
>   
> -#define BAM_NDP_REVISION_START	0x20
> -#define BAM_NDP_REVISION_END	0x27
> -
>   struct bam_async_desc {
>   	struct virt_dma_desc vd;
>   
>   	u32 num_desc;
> @@ -400,9 +397,8 @@ struct bam_device {
>   	int irq;
>   
>   	/* dma start transaction tasklet */
>   	struct tasklet_struct task;
> -	u32 bam_revision;
>   };
>   
>   /**
>    * bam_addr - returns BAM register address
> @@ -444,12 +440,10 @@ static void bam_reset(struct bam_device *bdev)
>   	val |= BAM_EN;
>   	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
>   
>   	/* set descriptor threshold, start with 4 bytes */
> -	if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -		     BAM_NDP_REVISION_END))
> -		writel_relaxed(DEFAULT_CNT_THRSHLD,
> -			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> +	writel_relaxed(DEFAULT_CNT_THRSHLD,
> +			bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>   
>   	/* Enable default set of h/w workarounds, ie all except BAM_FULL_PIPE */
>   	writel_relaxed(BAM_CNFG_BITS_DEFAULT, bam_addr(bdev, 0, BAM_CNFG_BITS));
>   
> @@ -1005,12 +999,11 @@ static void bam_apply_new_config(struct bam_chan *bchan,
>   		if (dir == DMA_DEV_TO_MEM)
>   			maxburst = bchan->slave.src_maxburst;
>   		else
>   			maxburst = bchan->slave.dst_maxburst;
> -		if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -			     BAM_NDP_REVISION_END))
> -			writel_relaxed(maxburst,
> -				       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> +
> +		writel_relaxed(maxburst,
> +			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>   	}
>   
>   	bchan->reconfigure = 0;
>   }
> @@ -1198,13 +1191,12 @@ static int bam_init(struct bam_device *bdev)
>   {
>   	u32 val;
>   
>   	/* read revision and configuration information */
> -	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
> -	if (!bdev->num_ees)
> +	if (!bdev->num_ees) {
> +		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
>   		bdev->num_ees = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
> -
> -	bdev->bam_revision = val & REVISION_MASK;
> +	}
>   
>   	/* check that configured EE is within range */
>   	if (bdev->ee >= bdev->num_ees)
>   		return -EINVAL;

This fixes the BAM DMA crash happening on DB845c & ifc6410.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on sdm845-DB845c
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on apq8064-ifc6410

CI: https://git.codelinaro.org/linaro/qcomlt/ci/staging/linux/-/pipelines/131277

Thanks,
Neil

