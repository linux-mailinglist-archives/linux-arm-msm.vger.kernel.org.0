Return-Path: <linux-arm-msm+bounces-77465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B8BE0597
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 698494E628A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE2C3043D7;
	Wed, 15 Oct 2025 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwJGf+Ul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9BB303A08
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556178; cv=none; b=EK/Lc0HF1VENYQ8iwuOMQvzy+qNm2Aol0qWfLYfBtnhY/NYr6pKXRFYHg15KSL/4oU3y6xHxCCCXNmiCJMRYRl2SWzfyX6pHqLo0ZieBPmWxjmehkN6+Vx6gaBI0R701wMNKo6981zld2Dp8SCKjJxpf5BYA2B1tUQZq2gJP9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556178; c=relaxed/simple;
	bh=6FJ/R1ITDsF+bIAIpfjW01XbZyF5cdVhQGhS9FNGWBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKvErZHMeYoH1h7aFid+I+MtaSJUzB3mEmd2xNlCQqES+nnKq6vHApvWe44f6aCdWBj64+A2OK+2Y/5MOid097mu+H17tZU8AxO4YPdiLvppGs8N0dqQYur6NPj1634sNoHnIYD3WvcROBpjlv1asW7N9DyaIaAd+UJrJIpMwB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwJGf+Ul; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-58b002614d2so985993e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556175; x=1761160975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2uKCDGSkRJ1nI5Vl4WxpkpeLM82j5VPKiPiLY2XZbg=;
        b=UwJGf+UlWJ7t8hswzGU8YK+rxrOuzqHONzuZvAEiwpkAROzMHTpLkkQNhV7o/LEmva
         jZoNgA+b1QlTvQITTDVjuuuvZKbv1rFcfWcvt1WYbn0PpXPmG3xiWtyEFuphXwHCzzge
         0iFKQmd07AWa18Jc8VcjsBEbzoaZZj2pFVCE026X7r89Vik8YAKk0Jgg23aOl0rpd5PN
         rBpBs2+RJCTSiDv1nqCc/36aDGgX8n8tgQCOs9I5xO8Cm8R6XiYcLThitzFuraUTG/qb
         HUsq+QSuVAvrmIhMl8jxjfRBxrTAP7sepgYisGScurVa6EI6ShCZbU9mRnHUcSLc5p27
         aAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556175; x=1761160975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2uKCDGSkRJ1nI5Vl4WxpkpeLM82j5VPKiPiLY2XZbg=;
        b=vZlBA5LneVOAdY9PEu/Z664gFxQVt/kzzTXOz1Au+FxaHK9bsnYrfS+6NJqIbUhUd6
         2W/2d+SzCULBTKwn33aQjq0KA0BPKr0WmxHmiawXpvkQ9T0EtXlIR+AI+t3xbWsMpxGC
         M5kV6Y+wvVhuomXon+srKqZg1aCFOF09jy2T4Oltum2w9Lga8jfO1w1wUzc3s74YGd+6
         hCZQZRhCylryLZXDjX+VXDoclr+KHgOoaXMKfAKgwWCzOzcPQXUjDGw0G02tyrZM9N1W
         iyTvPM+3fdNo37ibZkAC9KSNEF5TX4Qx9VSfs0aFNJ5+s/ebrZq/6VTX9gN6VAdKivip
         +Mgg==
X-Forwarded-Encrypted: i=1; AJvYcCVFR/8tNktf1DlFc/UDB1kNrT0RhYPpbNV9BwqW3ZVRHyllF6twG+eJT4PUEoOS65mzIX3Np6VkS+BnrS72@vger.kernel.org
X-Gm-Message-State: AOJu0YxMOa3ioiwL/V6hRhpzmz5J7/Sj+77z1kF7xesMrySNkiy5QhMB
	JaZJoY70S442UqpBA8EHSe4SOXRA22EXBwKC9MSFywuOI4KPCq2nYf00wJ7yna31pYM=
X-Gm-Gg: ASbGncvG1Bm4FE9E66USNkdRrAXzS7A8Kc/w9mRN1A4jkxCsIyM40kvi12Ia+MvxF/B
	K74Kuy36Lch56aLLNmEO/2a3/npFIU8zkyABN0vlm8/OeGoAmpcJXRRw1uAU9Kl7jiqe0ckdH5F
	3PLWJ9S5hR43NEEHFDpwfabBVoOouBTCzmGPGWhwk/7iMfE0U29x6p297CsT9C9sWJ+7QqzPBqC
	3LmJFxpH4BTB3LFYb35Yb1aXjxyFoBEgywwPeEM12RrRA8LswVvUV5iJLcCkCh6FnIs6f8FRptc
	htVB+AFbwoe79iWUV3bzDbxARb/unlDBratH51BXMI0qGLGkdrbgzH8/tUyeg9Zuw8Q7E08lOoR
	GygJ34juIrZwpZUW45EtIjjLuRtGY90TXQ17FgbZC2iSmnJWaxjseDGhj0yyvx93Aukd7aCV0bg
	q5SxXsuYqTuTvq3/6sCqvrlmZEnsX11EE8lfge3OowGF5+m6l3X0SD6DtaTnAmdDq3h7U4YQ==
X-Google-Smtp-Source: AGHT+IGD/Uw/fgx84AFertLSvfVKmejPqlvypnP8IIzpqbGwR8abvcNYUgIYpDHVV55dLFfVQQ6myg==
X-Received: by 2002:a05:6512:39c6:b0:58a:fa11:b795 with SMTP id 2adb3069b0e04-5906d87bd8cmr5059024e87.3.1760556174897;
        Wed, 15 Oct 2025 12:22:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98d9sm5657624e87.24.2025.10.15.12.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:22:54 -0700 (PDT)
Message-ID: <62da6efb-24d0-4a6b-9a52-c8f981f09d30@linaro.org>
Date: Wed, 15 Oct 2025 22:22:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 05:42, Hangxiang Ma wrote:
> Replace the hardcoded buffer count value with a macro to enable
> operating on these buffers elsewhere in the CAMSS driver based on this
> count. Some of the hardware architectures require deferring the AUP and
> REG update until after the CSID configuration and this macro is expected
> to be useful in such scenarios.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> This change use a global macro to specify the initial buffer count. It
> meets the requirement that some hardware architectures need to defer the
> AUP and REG update to CSID configuration stage.

Both the commit message and the explanation above brings no clarity on
the necessity of this change at all.

This is a dangling useless commit, if you'd like to connect it to
something meaningful, please include it into a series.

> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   drivers/media/platform/qcom/camss/camss.h     | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 09b29ba383f1..2753c2bb6c04 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -541,7 +541,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   
>   	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
>   
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
>   		output->buf[i] = vfe_buf_get_pending(output);
>   		if (!output->buf[i])
>   			break;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc3..901f84efaf7d 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -41,6 +41,7 @@
>   	(to_camss_index(ptr_module, index)->dev)
>   
>   #define CAMSS_RES_MAX 17
> +#define CAMSS_INIT_BUF_COUNT 2
>   
>   struct camss_subdev_resources {
>   	char *regulators[CAMSS_RES_MAX];
> 

-- 
Best wishes,
Vladimir

