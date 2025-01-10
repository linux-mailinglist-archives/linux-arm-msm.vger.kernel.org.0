Return-Path: <linux-arm-msm+bounces-44711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E96A08964
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 08:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05A7E16563C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 07:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45D02066E5;
	Fri, 10 Jan 2025 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEGBKOnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B6B1ACEBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736495328; cv=none; b=uNKCctk7bj+pxwmoMmBGiOk/0k/JCGR7fR77KNxyT+QSkZcpE0ziv/R9mFJhrmgzee7iz1aUCnr4ujPrwhJcRn315PQrwFSmYhPGwembaPjqtoqG4SpfBKtx0a+ZEqpurMnoIyA8D4Ls52VgCWyLhyIC380KJxTs5pbmh1++HVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736495328; c=relaxed/simple;
	bh=Izz+6Uu4SH988u733K3thDg1rdYTPuCnOFVFZGIo/0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaV3uWNfYCY/KCNuITBx56LtmWOlmb9LpcuB9zTFOckxq/ZgpGdj/zYMy/sSk5Xa6GPFdEOlT/rsBwjIUu9PE6iaN9vVdjSnRI8Dgyos/k8mNIfwIiQuKhAIXvoKQGgsptjJDsWxcLQQCb/6kIhr4urXhe02MWvsjf0X16HvLyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEGBKOnr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38625aa01b3so175938f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 23:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736495325; x=1737100125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f3HgF2rjfLZjHLpI0+IwIRqlrnqNDQ6nm19mXOYOUjY=;
        b=sEGBKOnrPmm87l4mZfZdaRh05pRyqCT/FVwev26c/yo2O8nm/JhlJfqJq7xa6rDz/J
         aV2jpEsPog0PUiTW4UJOfsIcCtzsKvbNvkECOz2n8IJUc7Sdz3gjJZbL+ZCeu0gTjV5a
         nkm7Yd9HRL75b+m2tnQws0kwlNvVHzHuqLPi7d8tW+D3kfIa/eqO995ShPTs6XbgQr7E
         HV+GuGgGLYRmLTAHQfDdSgK9gjKSoXI0GpCivXNbI1/nIHbChyPpSZl/xh6qWhjnFsTb
         iLuh2Yo32Bsb1Lu2Ixn8lgwFsfVKyQc+s119RCtbhPh/XyQKvIFe8f3pB5qSRT0pYZeg
         E2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736495325; x=1737100125;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3HgF2rjfLZjHLpI0+IwIRqlrnqNDQ6nm19mXOYOUjY=;
        b=mIo2h/oRPL7pmdp5TZPZ1Vmpb7IeImjrksBdxVnxrMROKinHCSUVd9dbeQvF4Yiqn1
         iYTpBO6FPxTdDfnUklOGBKxWAt3vH3uDfdTQVLcx9Su5kxJFkhZK4jkB2sABdLkZ5iEa
         qFBTEZeQsIuivClfCz4LcOgv8t+VxH5eoc9vbxL816LIA2nvmgwFoVlGYlKRsRepYn66
         7C9uy81FIrFW5kXYZJmA5OrGtHjNIHsuAK0nZmNh9MsL1+Lm+AfQDK/YDEmx+lgHJzfG
         YEWC/hFB3F0OWUGLLEbTZF/4BASG/oB/nYBVRAkedchlNJ8clJ29Dok3BrWsjv0Ewfob
         fSGA==
X-Forwarded-Encrypted: i=1; AJvYcCXW+W4pTtkZ6/CfKK42aUpEoy6Wa3vlAsLPJ7O5zZnypoi+FHntQOn0JgbYClFQPTICaUMRTrXxo8FbXxXD@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR47Mo8t7wL2cL4OwV+4ku/GNyxjVZvr4/HlZhUNUZhKxUPg2
	J+G+6njYTznoRfsd1EOs2ll/OfnuknCdwClUaMkfM3rVKB76ljJAsrbR/0HCUfQ=
X-Gm-Gg: ASbGncsb6um/uJxFFWdWxV1MgDzleuzc9Pm1Vzi6jk6kWwumY9wC+9dCrCkZHoKZTYv
	WjBHFtBitJwBbzpJbFxY/0A+V/93J4O5fj6KGOE0S2chkFUGMLfiq3eCDjej+Ggsj04FCvuVwAK
	gzheewSP8ZPLrXqklBQdzI8yqFbe/DOX8qNgp44UZnJ383xfdY+K9jj3wE3N3LemGy4/8r7sPC0
	ZlojyX4xqxlYNDfpQkJd6gILXU9MpuZGnnVm7hENELceRZmabasFEwhqwHrHlxh2gY7a9d9PHyT
X-Google-Smtp-Source: AGHT+IEElU4Vuit1Ap+kSW5DGrn7fsVqX1i9PgpIc5fGkSurilI2rdOFlmRYwB9wM3nj28bc730/0Q==
X-Received: by 2002:a05:6000:1f88:b0:385:ee59:44f3 with SMTP id ffacd0b85a97d-38a872d2d94mr3354172f8f.3.1736495325172;
        Thu, 09 Jan 2025 23:48:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38f176sm3870395f8f.63.2025.01.09.23.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 23:48:44 -0800 (PST)
Message-ID: <8ccf63bb-810a-47e2-bf93-4bf9317fe050@linaro.org>
Date: Fri, 10 Jan 2025 08:48:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/11] drm/msm/mdss: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
 <kn7gsm4nnp372t56ocbzkv6uw7o3ww2qel7jlcwvgxsugdk46w@d34hujbcswcw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <kn7gsm4nnp372t56ocbzkv6uw7o3ww2qel7jlcwvgxsugdk46w@d34hujbcswcw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2025 23:39, Dmitry Baryshkov wrote:
> On Thu, Jan 09, 2025 at 02:08:37PM +0100, Krzysztof Kozlowski wrote:
>> Add support for the Qualcomm SM8750 platform.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/msm_mdss.h |  1 +
>>  2 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>>  	}
>>  }
>>  
>> +static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>> +{
>> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
>> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
>> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
>> +
>> +	if (data->ubwc_bank_spread)
>> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
>> +
>> +	if (data->macrotile_mode)
>> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
>> +
>> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
>> +
>> +	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
>> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> 
> Nit: this probably can be folded into the msm_mdss_setup_ubwc_dec_40(),
> but I would not require it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

That was my initial try, but the resulting code was getting big with all
the if-then.

Best regards,
Krzysztof

