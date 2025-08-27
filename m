Return-Path: <linux-arm-msm+bounces-70994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA1B37EA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 11:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC0D1B669C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 09:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85DE343D7D;
	Wed, 27 Aug 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HS/yE1n+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036373431E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286489; cv=none; b=ZVArkxU97XtPxd0C2re8y1YDE/DBmkgrvf73L03CUrLP6FG/mngOoqxfEJ2sudjyQ8mTfo4+gcZ5hqDT2Hhhf/7t/uzLgEybYnJDna4L+dI72RHUm6xmWGy/MEJIYlqhpTI0d5SRTrGu1oKrDbhPUlf/C5vt0UAz0CrURNrlms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286489; c=relaxed/simple;
	bh=UYHRh0nnf5/4PfZfTpjBoaA1YeifpOFb2r0eI6/SlwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUUvtXMETE0HC+U5phopHJt9fka8mRZQxfGlN4KjZGhvqnVGqlhdwpF5DajELGOxiK90c/+LSjLqXcFeCPdVjj1orK9CmPywXM6K5M7TijdhV5NGjTpaKM864zW6gn9fQ233DodfUwThsC9Gx+wc7Hgcbw1V4hXgOQlDoTogawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HS/yE1n+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c854b644c1so2455932f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756286486; x=1756891286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mker59khNl9LO6XVA193w6BS5zlp+w383B89UYOvyb4=;
        b=HS/yE1n+5NTaDm4mGxRBgJVsxsxzwDfQ15YEo/KJpQQekCMObkiT2JYX0vUhxePwF6
         Y1VeuV2OB7D90tOtN81Q1Q81HfBlmoY/mIYVRnkFTWWsu4yc3RAHE8yBq7B/ugSXFB+N
         lXznf0exYygNhTcLd8UMVO1SetzxZv9YKsRSNwRkwrCFnnGvtBD183f5DN8eMNeKKDiz
         yKb01C5d6mJdqT7V+lh+8gLqV3evMzhuAYp1WTlN6d24Qp9MvTcRX4jzX0ItvBAxm3Ke
         t/CW/CbKyqImbpeQegxvMDTyJ8cSKq7Or/MJQVL/Tdn+UF2J3F5fXqN3PzY5QWCBJrZY
         uXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286486; x=1756891286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mker59khNl9LO6XVA193w6BS5zlp+w383B89UYOvyb4=;
        b=Ls20KQy4B+O9hUuBbY4+n9BPUpErZekFz5SIQTfGam3rt1iQgiRLe8NFMmsygy63qg
         BLzq25qWKxwd9Kg5XqpLJ5QBylMfBNEdiCZwdhuoJwigFFoJL5gkHGPlSVjMqLeq8BCQ
         hrmUCy/HlvdQhErprFWpcQfeLGJj8ugATx8OmLbLC/E4CUP/AsfZqSuZfGKg1MSexYPz
         OD/ZqbE6o3AgKQbo9ZR1Z8rmCO7NDXs6ucaFGoQ5ig2DQXeMSjxox3BDWAHC8SQsTOdR
         WV498E0i8snoTFt5mq3QbpwdAvZ96dMuyAR9iroQl3jBUS7e+ZwKunoSY/3HSTQqmsJH
         Twkw==
X-Forwarded-Encrypted: i=1; AJvYcCX37Dk0gm/pGT0b3u/3sQFt71bDm8Ni2VfK+NxhDuYXg1fjdO+HtfGX95Nrfe0xq0NaX/pAtBQ/SNKY1JFb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6Fe2DhA88y9cJ5YKpd2xgqibNEFUColAJE7lK6uhgAxM/Lzm
	vJEcEnuLci+6sDh1WZM7CJHLj7dk9218ZalFIewbAK/MEv2d0ymaOaz0gJahTl1Q078=
X-Gm-Gg: ASbGncuYUg7/fsbtxdJKCIeb5GaGIHRDg9jw918XnPXnyt28E24RJvQzKRtH1tOD2K4
	jD1jLEUqiYmS4Arz3s2/prcc5APjMYKBw8ZgTya8SOjdXNJR22v780hHrtMnqEt6nzi1nMdrius
	Fah+A4knATESnKJgd55bMrmEbTy8UNOhbYbwdCjE2INqI4SgBCfJXNE5m9bjqB9PlccIGiQwXxl
	Ig3YGKSBPAJQeGns/Fl7IGKnl7xukC+hBYqxKBOnSdnbvf90My93NsDxFH7MOJcV4LV2dUAda41
	TU/pcUa84rHpaE0tXSZ1gY5rTbLAENf12pfk/qmnsoknoHzgoYMSVMn4biXYPP+RgmbAE7PT0ve
	ldwZYiC4sBKDMqy3IFp8iYiYfkVE=
X-Google-Smtp-Source: AGHT+IFvRqEa1ogDaSXzE5145n6AsbEdzn4jkuxQuGsQWp+ChfJK8nOqGUjd3LT9Dxkf37baNqI9Dw==
X-Received: by 2002:a05:6000:26c8:b0:3c7:6348:4089 with SMTP id ffacd0b85a97d-3c7634846admr10821566f8f.11.1756286486239;
        Wed, 27 Aug 2025 02:21:26 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc7b699d5dsm2665466f8f.48.2025.08.27.02.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:21:25 -0700 (PDT)
Message-ID: <4ca657cf-1c8e-4d51-aba9-c894c32a23b3@linaro.org>
Date: Wed, 27 Aug 2025 10:21:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2025 5:20 am, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> The TPDA_SYNCR register defines the frequency at which TPDA generates
> ASYNC packets, enabling userspace tools to accurately parse each valid
> packet.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
>   drivers/hwtracing/coresight/coresight-tpda.h | 6 ++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 647ab49a98d7..430f76c559f2 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   	 */
>   	if (drvdata->trig_flag_ts)
>   		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
> +
> +	/* Program the counter value for TPDA_SYNCR */
> +	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
> +	/* Clear the mode */
> +	val &= ~TPDA_SYNCR_MODE_CTRL;
> +	val |= FIELD_PREP(TPDA_SYNCR_COUNTER_MASK, TPDA_SYNCR_MAX_COUNTER_VAL);

Just use the mask directly if you want to set all the bits. This makes 
it seem like the MAX_COUNTER_VAL is something different.

val |= TPDA_SYNCR_COUNTER_MASK

> +	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 0be625fb52fd..8e1b66115ad1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -9,6 +9,7 @@
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
> +#define TPDA_SYNCR		(0x08C)
>   
>   /* Cross trigger FREQ packets timestamp bit */
>   #define TPDA_CR_FREQTS		BIT(2)
> @@ -27,6 +28,11 @@
>   #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)
> +/* TPDA_SYNCR mode control bit */
> +#define TPDA_SYNCR_MODE_CTRL		BIT(12)
> +/* TPDA_SYNCR counter mask */
> +#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
> +#define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)

No need to define a numeric value that's the same as the mask. It also 
opens the possibility of making a mistake.

>   
>   #define TPDA_MAX_INPORTS	32
>   


