Return-Path: <linux-arm-msm+bounces-31549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87267976038
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BBAC1F2310C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 05:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E7B2C190;
	Thu, 12 Sep 2024 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJXy0BZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89980B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 05:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726117608; cv=none; b=lC0HJ3Fd/TUiYjYpN/SRyEURRM4mzXh+Q6AVaK0VWF18ZPn2rRerqrRncZoqsZKi7POx73FQsKPCpFLb/HI0T/zndsuvfdUTYQDScXcr/NjGNrX/OmDH2F0drIDPkBiRBljpi0jijTE1MPvQfDKaK39O1gFD/79VAprvullgCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726117608; c=relaxed/simple;
	bh=2xvzjT4dSbsg2ca75RZWrZFakdrpq4/4OFC66iOgqrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kUHpC4dxciNtaaJ7RWjX9lRYp75fL7MzVyUQegWS6QDOYB1o0A8m6tVgwP/qvUPIkZzkrT9b3d10PWM3D8CZ4iekXE9X5cAWuZw5IU+DSuG+eytgY01kvFnea6M/3MHZp+r0kNuJGLnPNKvy7x0Oy8rFdG47QV/FeuoeBnIBVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJXy0BZs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53567019df6so70583e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 22:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726117604; x=1726722404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhaj3N3I8dBKCbVeu0u/BT29RxFxQBADjkDC/gT+hV4=;
        b=pJXy0BZsvxcp820tp4myRbTogZUtqB3P5XSinL04h4xxKtP4ZSZbW5CzKtiqgZsh97
         O1VyHlSZM4//gP1GMQ2aSpzTWP8aDdWV9ao1uaOmVllffxm+c4DGqs81VBjqZ27GHt2h
         8IoOVXVlztKF6wX5iXvYGzkhos/9FLzWVGqbc9wJhDOmfJZFrAgv+ijJ5LaYVY9pzS9Z
         GgvgYXuxPdXd+G6JhGOCtt0UtmBLTIjSUeVIKjD9kNr1CLxzNc/3COOISCbS3oyowPZn
         L0GxydTMl8skaIQuh+L3Uu4wukHdCWuK7ftWCp4wiUU/lleGmg0wP9itkbz6u+0eNqVS
         8EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726117604; x=1726722404;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhaj3N3I8dBKCbVeu0u/BT29RxFxQBADjkDC/gT+hV4=;
        b=lVfk1oGoaJJPDlGbZVIxJHis7ofoTQQcRYeQ7+OsRuvz6OszQF4CnqsykXJVJrNuje
         fbkFvJPfyb/shWl4nrNtoxRvQUJnXqcabwXUNH4DLpDDTl1WI9xpagb1XUFJESCEVR/N
         fc2QdGyFhjI/kbxQslxbdTUXmRliC80x21YhPt5qJf1TUs0e6UVuUy2lR9l5hG1QImhr
         7KAnLQVPX2RVYGKDUMyJbkKkvkp+R0RjpnkNHOD1xs5dhqg6ZhAqd2zPd1Gh+08+VVP9
         4oDlGZ7/wFrDbrJp58fO1vSi7A+hz5yJoZixxz+EFyYeoycuzo2m276kKeM0fJQsjxFn
         McyA==
X-Forwarded-Encrypted: i=1; AJvYcCUBgZWXT5xUXwapfzM+KeFSc9NPjeGq7bxa+3W+YpUkXZ4/g4YiE2JLjtEbLlRN+CZZP7zY7t9zNavShkmj@vger.kernel.org
X-Gm-Message-State: AOJu0YyggXJdrHUEG+kZVkcS4zP5Jou2+TmZt9mPrEN4/0GH6lsgEYoE
	MpFDmKIPhwnuwZE3ma6sWkg5lI6npz+/gBQOJr+bvs9wCisB9arvJVaQ/Blk+xA=
X-Google-Smtp-Source: AGHT+IG1zAhxqCSnphVS4knrQ7lzHdY0hkkCl/xfW2+M2LrSeIS20G5k+mnES++w75TRcLNSM/0jNg==
X-Received: by 2002:a05:6512:282a:b0:535:4144:e682 with SMTP id 2adb3069b0e04-53678fffd64mr200928e87.11.1726117604333;
        Wed, 11 Sep 2024 22:06:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f86fcb4sm1791631e87.74.2024.09.11.22.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 22:06:43 -0700 (PDT)
Message-ID: <9dd00bbc-9a4b-4e00-8bdf-757221813f04@linaro.org>
Date: Thu, 12 Sep 2024 08:06:37 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, andi.shyti@kernel.org,
 swboyd@chromium.org, wsa@kernel.org, sdharia@codeaurora.org,
 girishm@codeaurora.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240912033459.3013904-1-ruanjinjie@huawei.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240912033459.3013904-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 06:34, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 06e836e3e877..4c9050a4d58e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -818,15 +818,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	init_completion(&gi2c->done);
>   	spin_lock_init(&gi2c->lock);
>   	platform_set_drvdata(pdev, gi2c);
> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>   			       dev_name(dev), gi2c);
>   	if (ret) {
>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>   			gi2c->irq, ret);
>   		return ret;
>   	}
> -	/* Disable the interrupt so that the system can enter low-power mode */
> -	disable_irq(gi2c->irq);
>   	i2c_set_adapdata(&gi2c->adap, gi2c);
>   	gi2c->adap.dev.parent = dev;
>   	gi2c->adap.dev.of_node = dev->of_node;

Thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

