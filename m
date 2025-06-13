Return-Path: <linux-arm-msm+bounces-61251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39830AD90EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581EA1BC3479
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 15:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4D61E8353;
	Fri, 13 Jun 2025 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbIdonJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C241E5729
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827659; cv=none; b=IExGpgG1l0/SneF9LXV+1xod0qnZUDSO+1/FfKp+4v8eDfuqCNRmYU5Xnqm2hZpXodxi3DKaSEyLY0Yv6cVG46CEXcs4NVmkOMgrGFPS+a/WwYbWlGeNyRC9BQPrVzp6VArze/XbwoGFtdj/QKHa9A2Rd4Yc8yo+00zHhaSzPwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827659; c=relaxed/simple;
	bh=yigUz7BHxw8QBhJm4Z5XVyp2Bokda5y8lA60GXi8/tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ka2n9A9dGIMGgD2J0e8+EGD7BHeppuw7KilNvyzukhF1+3+DP0wiLGCk/FQgyDbVCLrHfWWC+Kqt8ofaYYo+qPiLxDZrAJ9KcOx3EDxCFX5zDAbLTAuRp2eqI3yDUJrovnqfhN+F4xzC4+H7dEiVZ9zaR01/ygW+FdOTTgrlzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbIdonJd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so26813265e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749827656; x=1750432456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5YL1/PTWX9ntjACVUMCkmmCdXN1AOyN6/cgs5Z/ZJw=;
        b=AbIdonJdKmaOhTw+HXKauFkWJvbpj+j7oM7WcX5IA546PTlfLWEan5zIhU6ipW/pQl
         Z85CYmmRdaBOAHGo0shOCsUX57CQauRLEdin4j109j2jlHJWMdsI/7/V1gzmlSoT7nAg
         aj2mMDoNXIbYX2gd+C+lV2QzFj1ZLXdPqXIvVHaMhGTz6z8pDHU6k3wXTZERlhFj2Jve
         4Bkdo2aBlIcqMqFPR3gJPMhb2lZdUwFCUZHrXpxbg/manM9WpUQQw9uK+PXv1sUkymuo
         4vnRF+w4BZRnp+ofRd4zcJegXTfUVdxRi6GYiMk3GpyPcJ7FwR4ehup1CX2WTCt3qqFF
         lqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827656; x=1750432456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5YL1/PTWX9ntjACVUMCkmmCdXN1AOyN6/cgs5Z/ZJw=;
        b=lVUul1w4KJOZse0G0sddkiBCyDIocs6eaJOkcTRNDE+q818NY1aRI2sRNhWnkALLKA
         S9nRTDKbZgR1JdLYxf7aBwGZ8n07VNYVSaPNTgni4OpsfWjvfehz6D5YMVVl8mv9Ix7m
         sokPVhHsxkzQqqfi8GEtCB7fgcHo+Q+RzKqy+raGdaMhwX+IZBLaV8f/aCrWE4dn0xVQ
         L1AGkqzmIbkwv2hF8bHLg0bVhvwF3wpBDUD2Q992KtwgRx3sDGhWsX3s6ivzguuUgTdT
         6IcC5+gW3OieJ7KOpRgntE/IT33It2eDiks0vPi1E0py5778HTSuvCUyjdJdu5pqEzoy
         iqmg==
X-Forwarded-Encrypted: i=1; AJvYcCWfk9obxmE0YBZ1JbSBwjqB3hxd2QfXzI/qCrXlAcBUHmmknyHrMq6EAMeRyB15Mx3XRnJvYNxByyFk/csL@vger.kernel.org
X-Gm-Message-State: AOJu0YxCY6sIkHeLpZXlpZew1KZteWCTgMLvADvSm5HL5vS+FkRwptG2
	wwcM2HXL9TUD1z5VPYxbjSaaPb/973b0c8dfHWDAuiNFeBJ1MaytSkEKIiN7EXCa9KA=
X-Gm-Gg: ASbGnctvS0T5K68jtYyYeiOVj9Dh3gWiZjMNFAahyQgyvcVTKjHQsewT61G8jMoXUAN
	eQUXiAtmFsOl7+pEleJCisqWSBKR4+FEA8N60ndYWH1WGf0BEV1X61grz7Up+h1g77J3tA9DjnE
	Qp7IsWD36gHIDJ7SZsXZQUAA3019LkBIjyHdHoV+/iBxR/RqZEO75uvjwJN1aqIp3UOTG6j63Va
	dt5r6JPLj1D9/lpSiB54SRw035OBlRatPMoQd2Tl3r+WIK05n0SN5l9delz4mXdpdNgzGZHhfmW
	ej2ILsuHwnafq7PGyN+iRvRXabqHwjjS6QTA2shy8wEwiNCZIyLngdYXjJfZ+hKT72JArm2BEpd
	NGXLYLr02zQGRh9fqE4l8Oj6It20=
X-Google-Smtp-Source: AGHT+IE5BqWkTcV/YtfSzruju0bqO5TpxF/6X93NQ6kxh0a7Xc5nDXiCwJmre3t2cwX6AdTEyT0K5A==
X-Received: by 2002:a05:600c:1c23:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-45334ac72d5mr36043655e9.8.1749827655647;
        Fri, 13 Jun 2025 08:14:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14f283sm55321915e9.27.2025.06.13.08.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:14:15 -0700 (PDT)
Message-ID: <069d5c16-f3a9-408b-aa61-4bc060ec2771@linaro.org>
Date: Fri, 13 Jun 2025 16:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] media: venus: protect against spurious interrupts
 during probe
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 16:25, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   v3:
>      Added Fixes tag
>   v2:
>      Fix authorship
>      Fix spelling mistake
>   
>   drivers/media/platform/qcom/venus/core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..5bd99d0aafe4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
>   	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>   	init_waitqueue_head(&core->sys_err_done);
>   
> -	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -					"venus", core);
> +	ret = hfi_create(core, &venus_core_ops);
>   	if (ret)
>   		goto err_core_put;
>   
> -	ret = hfi_create(core, &venus_core_ops);
> +	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					"venus", core);
>   	if (ret)
>   		goto err_core_put;
>   

@Dikshita @Vikash.

Good/happy with this patch ? Looks right to me.

---
bod

