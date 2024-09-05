Return-Path: <linux-arm-msm+bounces-30920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6545B96DA4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A02001C236BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA2E19D09B;
	Thu,  5 Sep 2024 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqn9dJfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F41F19ABDE;
	Thu,  5 Sep 2024 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542954; cv=none; b=TEHqwFzmr63vhpt0AEGuEsHXw2l2tb57MX0yfCGvdK04bmDjW7YWrSJ9JbbHttshpb4N6dtPD79hTH+b7FINnjKd0bNeK2BBMyQ0BgKzJ+slf8Y8K9qYOsY9ol023FPIsyDHjHgnJNOhABnpyIjPfhOGIGC30lG3RPp5015EtgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542954; c=relaxed/simple;
	bh=zwzF3n47IQpixX0LPHL82vmpC1WSMTGaJxZirNPv2Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XeopQ9z3OGUxaF34xm2/SZw8nhckROeJWFM4Tuitp0GTODYBuutJ1ks/+3eQSc8TSn8YagG5gRwqhqDB3SSsh9hbULz6njFmt0CigghOsIcBw1BVBeJD3jIIkxV71r4S5O9JMAMPATPTv98iqCXmuyTCqRH/Xd72b0rt0031fz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqn9dJfd; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53653ee23adso665644e87.3;
        Thu, 05 Sep 2024 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725542951; x=1726147751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+ZNMU+mtXMZOUXhINj9JrbPWX89/nImCgEnep73Qy4=;
        b=lqn9dJfd/HMOqGWyYMiKqQrewWpaMLyWUqjO5OSZsVimUeOQ7TLw5HZYv87BVOiecG
         lphV66s38t+BHNDahC9ERIm45seJJhIQdEh3WE68060fc3aahG8clMhr68UXCPP1yEAJ
         e4qjG7K5Uu1MumW+ujgjPTEPRCZVBtf7gpxKoha25zoy1lp8sToaLJY8zw8zX7BpmQnO
         PM+JoeCstKJbDIpVaJLkRIbQg7zNBFVqv4o9cTKvCDT//rYFA0M5PLWszfaEstlN8PcA
         nne6moaNRHMu0vVXnlySqHXAAdLYYyFgWUj+9EPob8VV++YeO3ZEygvGg0asdgJH02PR
         rwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725542951; x=1726147751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+ZNMU+mtXMZOUXhINj9JrbPWX89/nImCgEnep73Qy4=;
        b=vZNqrQY0MOfQ8zYF6hZYSRSy+d3NNJy4WY1Xkrc3urz0n9i9KEaTV0gsYN92KrM0wz
         pwqwOVLYBaq2kFYeJdw22vpTC2FV6Q0P0juLfBJs0cLiuAlOso3E/pi/FPk6Umjj6jrz
         JKoy23XCXBoNGdU0clgNzpBJ1gRlfNNqz60fJk9sHYPTTleyPjjCVUPQVeAjFODB+Wxm
         6H5AnQiCck8s3BcbF3SSYoi+nV4AuZ9v7glb2+OujtNEzoY5OrJwXFrHlDylOqwf8ScE
         Vy1AYjQG/ENHIiVX1PkYln2SGiOXcvcUVfDo3mebs9EXnWoR1jVgkexYLnXcNLGyYShT
         N+ng==
X-Forwarded-Encrypted: i=1; AJvYcCUDjo4S5pRhnacrnpNUkCjI95YbHS20imJ7KL0AhW3KmG+K4k0YGVSLT8zdFtJ/A+4sBBcImLlJDquB5zHu@vger.kernel.org, AJvYcCUNN3ali2suC2cKWr/uhNDVP7+wo+6AT5kNk7Vq1fjy3CXA3KLx4+xk6HcKFCC1i9FZWJ0Z2CFaFTS3@vger.kernel.org
X-Gm-Message-State: AOJu0YwwfW/X/D7Ob4GmyO5shJYmxVg+k2JEMIe3MCpYLa6A5PagGuP5
	Ehz/u8/61IfnhhDC5Wn8pmGGYTUbYq4n7QgE21KLRNazYjWIREVRpOwwwg==
X-Google-Smtp-Source: AGHT+IHpvTavpyMQBn+HHOCGI8ttAI6AD8ywBOR0vq50vZd3SJxLg6FLRjkiMT0p8KkNKshQDjIUsg==
X-Received: by 2002:a05:6512:2309:b0:52e:9b9e:a6cb with SMTP id 2adb3069b0e04-53546b24bfbmr14932004e87.15.1725542950241;
        Thu, 05 Sep 2024 06:29:10 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623a68ffsm136495966b.161.2024.09.05.06.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 06:29:09 -0700 (PDT)
Message-ID: <bb1a6cd0-42aa-4452-9203-460ba768e6a0@gmail.com>
Date: Thu, 5 Sep 2024 15:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: llcc: add errata to get bank num
To: Jingyi Wang <quic_jingyw@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-3-228659bdf067@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-3-228659bdf067@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.09.2024 8:21 AM, Jingyi Wang wrote:
> Use "num-banks" property to indicate the actual num of banks for
> errata.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 8fa4ffd3a9b5..3fb45e625d82 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -1275,12 +1275,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  		goto err;
>  	cfg = &cfgs->llcc_config[cfg_index];
>  
> -	ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
> -	if (ret)
> -		goto err;
> +	if (unlikely(!of_property_read_u32(dev->of_node, "num-banks", &num_banks))) {
> +		/* errata: get num of llcc banks. */
> +	} else {
> +		ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
> +		if (ret)
> +			goto err;
> +
> +		num_banks &= LLCC_LB_CNT_MASK;
> +		num_banks >>= LLCC_LB_CNT_SHIFT;
> +	}

Is num-banks going to be populated by the bootloader, or hardcoded?

If the latter, we may just do so in the driver, hoping no more SoCs
have this erratum..

Konrad

