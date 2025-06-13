Return-Path: <linux-arm-msm+bounces-61252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A8AD917F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DBCC3AAE42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 15:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383AC1EEA47;
	Fri, 13 Jun 2025 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GyJq3AGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E291F3FC6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828989; cv=none; b=cLjypHhZVf1Ro4LqmUp3H+2e6IJiTi2E89cuuaHxd1+YLaR5j626iKhaVJfy3lyNfotdlCEfN8tGVU2DyalDD3UWkqprAjx3WiZaZZOuta5Wq6S57I6dbDt0AUGvY86Cq5hxBUJ24XW4wA8GfBDwgVuE+Oy1/WEK6fKP5yWefnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828989; c=relaxed/simple;
	bh=mQPr3lx+oLsQJZVsqTLtsRDGu+1Ha23dzIO1vBurXIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fh8769je+dJPWVcvEzeZ8N+JFnwqrINOaCTZeurxTrUNfHt4bggaCHuKYB8Ss2sX45EXfFthIY/uAMbmbqLdZ4SnXg2yB1HnkqYKd2hI5p1vD0kclIrd5iiNZTdGbuzBr/juaQz5phSE817651gVktLIYnVhhZ6DP2uluk8RUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GyJq3AGI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4532ff4331cso6387725e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749828986; x=1750433786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWv4UeFVj2hILiovDcCHvWzMoWMBEkghmUzZ6WsdBWo=;
        b=GyJq3AGI6b8mYByxX5TlBcvjJ2lmuHO0xrCsukpP6gEyhVfZUsOVwdTSyTfAHFXBCR
         fabh2eXpz6aPF+QESWBIm1zVZXD+CfdFcNwzkITHvCWXQMiKzel8IqgYeG68L50C8cZu
         Gj+BIHrX7xctNLG0gFKKHQ6Ypdhp1dZUiztCmrAU506PO8O8B7FzOLHbwO5bs34Txl2r
         q/TZeoixowfh3yBeMbOrek1yjJeW3je5vG+WuO4/q3snquXRsf/2MwS/sRvrvSiIw6lO
         Zp7/WB4JlUprOv5KtlWmST95Zt2T2x2gK+0WOpVDF2VXukYgTlwLFTBgI7RjHRga0BaY
         AI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828986; x=1750433786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWv4UeFVj2hILiovDcCHvWzMoWMBEkghmUzZ6WsdBWo=;
        b=W2t5TOWpvScpSyKOw2k4OkFVoS+AdjOLG/73+Uda0uPaiyps7421iZCY8RYyJZH7nK
         uGxWHBf3nZq3ZqNO9zkC9YVqmtA32YNatUQLhv3BJ4U3iNqRfkVU87KV21DfuMZq9wqL
         oa/1v3KK2mAJyD9dTLCpirlgh+jQlanFNYVyZMsB86mviHVT+3kymsmcz8ZdiM9J96JX
         /936FWNu9bg2h60O+NCw6XywEppOoh7WG/lMtr+cWx+xLaC3LNyJkTF7ZzrbUo5CryY3
         sxj/5uggMYmGBdWwMREPrLk2bFOoKTV14JTIuGBTAczQxbBJyjUPhU1gU7GFZ/uml8XV
         LwCA==
X-Forwarded-Encrypted: i=1; AJvYcCW3X49ZncN8fE/FBNZHpmgVODwyB5xTxuahdKCbaALt1gBaPNnn4TZOb7ErKxiRY7wtzIu2mk0B85qhvuJP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyphm7cUNXovv4pLvRkUvNlW304yB/hzm6s5CgIa533iE08xAS
	xiQS2RVI1WoSXXDOWngkTWXMLVr0OXmsKvqZMA0aqtPMMJ2YJqY6Y/XTRjdgcClv+Ak=
X-Gm-Gg: ASbGncsGeQ2sj7JMoXWQFaLYmndGbt5KxdAtUpAd9emfKNIYtddH6bXtLr05oYe0mET
	yOf3YDyihLMhvs5/j2WKcYTvMPoW7QHSfHyDzLsHTtYxSQ0e9PN0D3WIBiMvG9M/IWoWBly8Q8R
	xJ/hEzZAnb9aKVb/YJ+380G+YtCRkN+Qa/XZwzTWWWNEHF1LBqc5Cue5nD+CpTzTIDNhhT5sYmh
	r3A1acEQD4aa30sw5fO6H3RGcA2r+S7cIk9OG97Ozxigk7p2UTRsRuB7JBjIZv0AcONw5+vB502
	RUtudoH05ezAkPRxO40tdzxOYlhLfHGBDAWlUrjuoypLiuR9DEuX+eecx7enrHd7Vu/8Ihef/3q
	x8hudHHfAiMsyXNhCFEp+iYX/DeE=
X-Google-Smtp-Source: AGHT+IEdPQZ+kMct/mFrIqWxhQP7ARSC+kL3lHuKH4nuAFPPB0GmSIcXahH+K6ef7TZ3V7gCc7y8vA==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3a572e92c50mr144867f8f.50.1749828985372;
        Fri, 13 Jun 2025 08:36:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2a6a5sm2644199f8f.74.2025.06.13.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:36:24 -0700 (PDT)
Message-ID: <0798f626-0ed7-47ad-bd9c-39732cd4aa19@linaro.org>
Date: Fri, 13 Jun 2025 16:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] media: qcom: camss: cleanup media device allocated
 resource on error path
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <QSZ_UJl8EdHC4ZGWyIbBtFJFp1xi6HoqNXYRJCBhInwieOERlOo8Wkk-NERxAYIY_WJ9rWwnlGR31zI25yVqcg==@protonmail.internalid>
 <20250513142353.2572563-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> A call to media_device_init() requires media_device_cleanup() counterpart
> to complete cleanup and release any allocated resources.
> 
> This has been done in the driver .remove() right from the beginning, but
> error paths on .probe() shall also be fixed.
> 
> Fixes: a1d7c116fcf7 ("media: camms: Add core files")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f..f76773dbd296 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3625,7 +3625,7 @@ static int camss_probe(struct platform_device *pdev)
>   	ret = v4l2_device_register(camss->dev, &camss->v4l2_dev);
>   	if (ret < 0) {
>   		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
> -		goto err_genpd_cleanup;
> +		goto err_media_device_cleanup;
>   	}
> 
>   	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
> @@ -3680,6 +3680,8 @@ static int camss_probe(struct platform_device *pdev)
>   	v4l2_device_unregister(&camss->v4l2_dev);
>   	v4l2_async_nf_cleanup(&camss->notifier);
>   	pm_runtime_disable(dev);
> +err_media_device_cleanup:
> +	media_device_cleanup(&camss->media_dev);
>   err_genpd_cleanup:
>   	camss_genpd_cleanup(camss);
> 
> --
> 2.45.2
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

