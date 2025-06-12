Return-Path: <linux-arm-msm+bounces-61068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97312AD693C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6608C17F6AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 07:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A53721CC7B;
	Thu, 12 Jun 2025 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypM+PAJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113531F5435
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713832; cv=none; b=tIgaQeckas1Wg4c0I1Wd8r2IzVsyEy00gAVPs723ZrFimlbV+DFoUNfLbIGpvoEKqP/kLKIyor3IHDuiXXBZ7jvOGi9C/edZ8qRm+1hEI2euaCuMpSnt8oc/w3/pOiZzLSvW463AokBmGcN92RqM+OmCbz8aVsvIPDG0qM/XFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713832; c=relaxed/simple;
	bh=IU1p/IhvhGd0RyDOhdF8b84u2MP0frN/i4FGc+o9J5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+JdvX7ElFvnAew/1d9cZEgdltyCgvMRnWdmNQbtUQGrumYkSuo2t6BKlULty9p0y707mqkcI/9XM1C1h6Vb1B7BYnw8MBX5X7Al72LJGNn/kayBlipU5ij6nn5e8O4pyF75cJnTTX4PQJkVzyCqcqkMGeECdbtaoyJ3YTiPmLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypM+PAJf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so378887f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749713828; x=1750318628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W43XvGoEP8mkSB47crpooGunoOi4UYJdDSFj0MKmJkw=;
        b=ypM+PAJflQXGCo1+0omtyB45HfCOLs5kgLtB6/L+hEfrGkRdTR91llsn+fMLmfc2BE
         6aZ68JwcZmQ+3NfVtuUFN50zDlWjY0zxZeCViuxLghwFWojNvsMCdTjqEnIr9Snwv0MI
         6tRWLxYQHduxSsRB+FVt12CIqXb8ZE3X0O+7b8EsPmMLCXA5Aq2IM74BzEkSn4xk+v1y
         uHNsLibhlZpMoLQFOC7GzkIWZu+JYhUAj8mk0Oi3bvjqhZd9CGTNNe0X09Ru1RyQTGPd
         93Vwgo3u2exUUurkZAroXbCbZfVPNoj0Tx7yt+/wQsgjUCJv3tLi4+8NFlKXyMsD4kjH
         X0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713828; x=1750318628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W43XvGoEP8mkSB47crpooGunoOi4UYJdDSFj0MKmJkw=;
        b=ehMFcDUQPhewuZswU4fYJPT7gFI3qLGzu4qMJG2wMy3S6h/ZZJiy+d1nVchhLsBx3k
         tX5dj2qWcRpgQIE2DT+RkpeGtPFu/36IiHR2ookVfjZaxovyELvm7iP82TK4nhjWJrgG
         u1rHmmI5TGF4JRF5JEcdna2L5ZpjGRCJ2v2OIgM4pHynQkg2C3t1ZxdzKZFVeYpDP72R
         kz5k0Y4SEoywVZFEEY8qXOVHxu+JTNh5mSBngyajErApRWNBNtCCt1FLPKNhEjisWOeJ
         cWwQJUrPfwkJCZ2pVtCbE+Y2YxmU7+hCEwZ9vUGf5NO7Z/JA+sX5xWP8IWMVbBgDAeEW
         En8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWaQtQOW3XlGmpNa22Q3EPFmkLoZafkIIYRnh6JMUPaf19wtkSiphNcGgICKlTa/u710anvJZW+4YX2TU7@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTTtTQQX2d4yIetGd3hEKqneWio0XNEIcYC+5hHhg+Z1zAExY
	yQqAMwM1mAOPfSU/PAlEBzOhU42qdLxQpWoeN9SVtWH43wIOco7fZ1WAyCs7IEBq+qQ=
X-Gm-Gg: ASbGncszKi6MtOIAhYkaHWTrssyztRGsEAtSQQBrUqXLGO5uF9NFzhbNR2k2rGwbmQ+
	ZSOMel628CIIrdaqUVnqStWy/yrRYC5WOrqlG0IUwJVVjLj4P+z0NcBeP0SFnogxXDtlwBtEASy
	TkLy/8W17pVkq7AAQuDp/6qNbE6lhvle8ycvq0yQNCDv+PcbJBSHkAcu8kHMNrPxbcq8HCTKOiP
	I1yqIUw8notqtWzrN3qwm1rx+WlMfhCYSWIPq+VGwS6/SwA8nEtyTL/KV8HJZqd6/+UxNruG70u
	9mW8z6fih0uFX21+3/o9q3x6iFW/iksiuo3vkXixEQ4sTzl66OIR3BgWkVcTTW/YXIxqQ6AyRYV
	6DEfVK/OrLtdjKL3xlBt17I2+604=
X-Google-Smtp-Source: AGHT+IHL4AezVSzGCixMV23SR740pNZ45p8eWh/53EzPvM97Z+b2K3Gong4H2VnocQPS1Igv8w15Jw==
X-Received: by 2002:a05:6000:248a:b0:3a4:c6bc:995b with SMTP id ffacd0b85a97d-3a56075a226mr1774989f8f.35.1749713828299;
        Thu, 12 Jun 2025 00:37:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm11881445e9.24.2025.06.12.00.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:37:07 -0700 (PDT)
Message-ID: <9e992d51-1939-48b5-9798-7811a0c50033@linaro.org>
Date: Thu, 12 Jun 2025 08:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] media: qcom: camss: remove subdev resource argument
 from msm_csiphy_subdev_init()
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250612011531.2923701-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
> The removed argument is directly and unambiguously derived from other
> ones.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 6 +++---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 5 +----
>   drivers/media/platform/qcom/camss/camss.c        | 1 -
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae..1ba3fc2e33ac 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -569,16 +569,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>   
>   /*
>    * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
> + * @camss: CAMSS device
>    * @csiphy: CSIPHY device
> - * @res: CSIPHY module resources table
>    * @id: CSIPHY module id
>    *
>    * Return 0 on success or a negative error code otherwise
>    */
>   int msm_csiphy_subdev_init(struct camss *camss,
> -			   struct csiphy_device *csiphy,
> -			   const struct camss_subdev_resources *res, u8 id)
> +			   struct csiphy_device *csiphy, u8 id)
>   {
> +	const struct camss_subdev_resources *res = &camss->res->csiphy_res[id];
>   	struct device *dev = camss->dev;
>   	struct platform_device *pdev = to_platform_device(dev);
>   	int i, j;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c44..d82dafd1d270 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -113,11 +113,8 @@ struct csiphy_device {
>   	struct csiphy_device_regs *regs;
>   };
>   
> -struct camss_subdev_resources;
> -
>   int msm_csiphy_subdev_init(struct camss *camss,
> -			   struct csiphy_device *csiphy,
> -			   const struct camss_subdev_resources *res, u8 id);
> +			   struct csiphy_device *csiphy, u8 id);
>   
>   int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   			       struct v4l2_device *v4l2_dev);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0d05f52a6e92..695f113472a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3074,7 +3074,6 @@ static int camss_init_subdevices(struct camss *camss)
>   
>   	for (i = 0; i < camss->res->csiphy_num; i++) {
>   		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -					     &res->csiphy_res[i],
>   					     res->csiphy_res[i].csiphy.id);
>   		if (ret < 0) {
>   			dev_err(camss->dev,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

