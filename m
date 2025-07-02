Return-Path: <linux-arm-msm+bounces-63420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4AAF5C39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6289188E73E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EC430B9B8;
	Wed,  2 Jul 2025 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrYPB2hP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524C2C08B1
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468842; cv=none; b=umAL6EDP68MXJ+0p0MT+hgZK1XezR+RCBf4WRmilFjRMC2bOysXr8mvxOw10neVDXfBHE7EyqVfYH5WG1RANj48TvYUpu72vRstFBng7TNXNdWcugjdL3AjHbAJkdWVqKjN/pDCvIdSf2VgliLGmYGwPDYFcQ7TY81vGKlv4H20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468842; c=relaxed/simple;
	bh=RA/GMUkKsIQ+lZ9UfzwqcIT00K6fR3Accy7HzYB6+/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UWZTIVbiytSTFNHGBeYsVUkAQrhfC+RCSmcdWzKCncz+OwA44ft1o9C6p0BefalN9y2C+hakxCPIY3cYS7uP/3Z+XF0xuauSw3tVyzwKMO51PjH3Uhqd2vwleeJ0EYSoMviJEpGsoMn0pY7T9+SJFvAeV0SHOKvLp3UBdcHUf34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrYPB2hP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so36343005e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751468838; x=1752073638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fdmc6yakPu/5WDUcMb8FRc7nipfiDb99vi6NT3hqQ5c=;
        b=xrYPB2hPyOYYlYkXxu7A6WLfegqBU6EQ94+NaTRhLRmGW+EkeI6AQbQiVMOO0djSlW
         HebsGpf5q9tE3x8k6dMPzXJXCqLxkH+UV3CRDHGx9SLq+GDEGNXNoy4J+/n0nJQEVSQU
         tPRlPOGXeZ/d5TTETJb0+XgcVQe4RTDdN8gEDYj3ueTls7IES4sGxsR2jSJODkVQhYkM
         +b14jAGt2M6o0rkxDqAApX49H9/8XQeBKLqXVIrY0PGCLJt9od2D4FjFaBQkixAyTCEF
         KbNsS8e9mfiyynN2txZrn0im9WN5LEZ0H3Po14XZ/jpj3f6JANCI9rZygvZtw0AJczRf
         XDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468838; x=1752073638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdmc6yakPu/5WDUcMb8FRc7nipfiDb99vi6NT3hqQ5c=;
        b=OqzDoMjqOhps5pIlaqP8p8w4amoHUJRygsFUNzLLj8aTIONuyGW94inhIjBj4ION7x
         3vEfozhWEkT6Tr1mRP5V3lyvG+ZpahNDAgjjYwla35uHYUTeCkbFEj/K0F9CDjAYhhu0
         GdI4gyGLrVz5j79IcowB1eA3S4TRx8sWB72IoQ/r6TB9Wn+jexZzFUd0G77DpfRqUxAd
         6Bg8LmGMl83HVFJOLKWYmVA+hHyRk4iiS1EEtjlqxsoBz3Px+8g4O2EZS1Ln+i+EkeWd
         CSnWlHlidB1NqAA7H6+VtvzkoWOTVDYf6ilnenwmWuDbHoAIxlKE9L0ykqxEO4wVCd0J
         /ORg==
X-Forwarded-Encrypted: i=1; AJvYcCWVOEEHQMW9jKstjTo97RCdIxpafg25WutKuDEkk4YCT1wtOF2ZCnvUqRZoHijzVPGLenMjIANfmwGAhsZs@vger.kernel.org
X-Gm-Message-State: AOJu0YwTz0AVAPBtcJVl6yHmNwJaCk16WRmDlBpLlik0lU2oe879P/tT
	m38bXS/GtL9H5hUcLHmTSNZjJ+XCcnb0xGBbqD6ujTHhQwcnrLZGPm8vLyI2RP+jaS0=
X-Gm-Gg: ASbGncsLWhLCFgRbykqiNoReLDjQyjKq4CdXAGeGuOiLTEUIqMlDE6o8h8yooH/pGz8
	G4KAHY6/YtaolyPJ0Wi1ChPzl419GBcekUFXbfQ4GafwfZofFVnqUTnPqRgf6oaK1UIzWcsIY2L
	QXZwRpG2+ilfUjiRsy2VM+mtYlHicF8kJS+SqfCR+K/ZnvJe92vqx/eqHaxN4XtP4pXVDLu3BRT
	EU74uQcgU5kJp4PAEfCbRloowtgoIog4dp8vj/S89rS65NFWXr3zWhQR6Y6nsqQcJgE9znVrDsr
	521Lgixjdc/1t8J+iQyFwBMqpMPffQz1rQIh/KzMmWqgu4jxqs6ASx9lu3g86wJ0h3CgetibPLG
	M1p69eX/t4Y7aSYcrkaYhPCVI1ATO
X-Google-Smtp-Source: AGHT+IEmwUS6XFEShtw6PZtQHOeYmfpo1hOEG9/PMGEWUTVc1nuwADqyGo/1EWh8Hv5mWdqbx+CR6w==
X-Received: by 2002:a05:600c:1c02:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-454a5c67c8cmr25403565e9.0.1751468837111;
        Wed, 02 Jul 2025 08:07:17 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b3542838sm34842315e9.1.2025.07.02.08.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:07:14 -0700 (PDT)
Message-ID: <dd5717a7-9476-4207-967f-a30e7cb3b3e7@linaro.org>
Date: Wed, 2 Jul 2025 16:07:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2025 14:42, Krzysztof Kozlowski wrote:
> Driver implements different callbacks for power off hardware
> (.power_off_hw) and power off controller (.power_off_controller):
> 
>   - iris_vpu_power_off_hw + iris_vpu_power_off_controller,
>   - iris_vpu3_power_off_hardware,
>   - iris_vpu33_power_off_hardware + iris_vpu33_power_off_controller,
> 
> The first group (iris_vpu_power_off_hw() and
> iris_vpu_power_off_controller()) is used on older VPU2 designs but also
> called from newer ones: iris_vpu3_power_off_hardware() calls
> iris_vpu_power_off_controller().
> 
> In the same time there is wrapper iris_vpu_power_off() which calls
> respective callbacks (the VPU2, VPU3 etc).
> 
> Let's make it more obvious which function is a generic wrapper over
> specific VPU/platform callbacks (iris_vpu_power_off()) and which one is
> the callback by adding "2" to callbacks used on VPU2.  No functional
> changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 6 +++---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 4 ++--
>   4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 7cf1bfc352d3..2570e65816f6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -33,7 +33,7 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>   }
>   
>   const struct vpu_ops iris_vpu2_ops = {
> -	.power_off_hw = iris_vpu_power_off_hw,
> -	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_off_hw = iris_vpu2_power_off_hw,
> +	.power_off_controller = iris_vpu2_power_off_controller,
>   	.calc_freq = iris_vpu2_calc_freq,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee..a2c8a1650153 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -104,7 +104,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>   	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>   
>   disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu2_power_off_hw(core);
>   }
>   
>   static void iris_vpu33_power_off_hardware(struct iris_core *core)
> @@ -142,7 +142,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>   
>   disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu2_power_off_hw(core);
>   }
>   
>   static int iris_vpu33_power_off_controller(struct iris_core *core)
> @@ -264,7 +264,7 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
>   
>   const struct vpu_ops iris_vpu3_ops = {
>   	.power_off_hw = iris_vpu3_power_off_hardware,
> -	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_off_controller = iris_vpu2_power_off_controller,
>   	.calc_freq = iris_vpu3x_calculate_frequency,
>   };
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 42a7c53ce48e..22f190e0c7c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>   	return -EAGAIN;
>   }
>   
> -int iris_vpu_power_off_controller(struct iris_core *core)
> +int iris_vpu2_power_off_controller(struct iris_core *core)
>   {
>   	u32 val = 0;
>   	int ret;
> @@ -253,7 +253,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>   	return 0;
>   }
>   
> -void iris_vpu_power_off_hw(struct iris_core *core)
> +void iris_vpu2_power_off_hw(struct iris_core *core)
>   {
>   	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 93b7fa27be3b..8f63f243dd0d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -24,8 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>   int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>   int iris_vpu_prepare_pc(struct iris_core *core);
>   int iris_vpu_power_on(struct iris_core *core);
> -int iris_vpu_power_off_controller(struct iris_core *core);
> -void iris_vpu_power_off_hw(struct iris_core *core);
> +int iris_vpu2_power_off_controller(struct iris_core *core);
> +void iris_vpu2_power_off_hw(struct iris_core *core);
>   void iris_vpu_power_off(struct iris_core *core);
>   
>   #endif

I prefer these names with an explicit v2 more logical/consistent with 
the hw names.

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

