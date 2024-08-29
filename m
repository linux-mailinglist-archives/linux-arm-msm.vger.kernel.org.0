Return-Path: <linux-arm-msm+bounces-29962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B07964184
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68C71C21CAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CFE191F6F;
	Thu, 29 Aug 2024 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BtKSMlW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A98E1917DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926759; cv=none; b=TWe+eyjTAqPjYIrFTdMS5Er8Rfm6PXaA8hemkgHGDcCD9v1hAMTaA2VXvSCzPFff+4G8VgrRzrF4Nf/TFo48NiRYhxHeT1kLuVbLtZoC0Ia+nLTLYIAMN/h4dJlo3GXak8f5D+pgbbMtuzXHh8fDprNnRmxTl7tc+Mjb9IFiMAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926759; c=relaxed/simple;
	bh=NgBGaohZSn2ujQXQ1kODfi5bvv65HVMuTRh6A6bGzVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GawRMgn3ggOSe5eEQQg0PBW/Vsvb7heWms15RgaIaTNQr5K/OfSkfMG4YMvtNsLzvrecWcsHZp6WvjUIMa8jL9P2RXksrZR/nAIcEsbXJIeEWqYlPHXitju0JraXvqn/MDV+zVHxt3e7LZKX0CKfc126PRNz7boZEtA6T0AASdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BtKSMlW7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86859e2fc0so46281366b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926756; x=1725531556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nopjZOiXiccCurmPDi4lhpMiSpQ7X9/bOex7t+lHZIA=;
        b=BtKSMlW7XZr4Lm1FTEzEuYL3fXKE5eGRH61E/NLz/rpLx/sioXTyJ/Vv+Sld6sa5em
         WtDUuSRBQxVlacSJy3uvHA9QNDUGOuuEyItOE74V4vPIOP1Dlcztc0j0mjfqbp1diBpz
         TqchM1et8b7eomaF4CZy7d+P9Kgy2smIRv2iGUIBPSpXxUvDi4m54TkkovYAeeDO58u+
         uMAZD0c0DTrJ3OkVUqgNgm/2IQmhEl9ruCh+TN1hM1Rw4Ru5DFOkLaOGQni+/5ntlqvy
         0V/o495Llx+KAYfGyfpHhYX/XtRfsqSIiXxaj2O2MW9bWq9MhNMp40EUkUFODN5Ul3Km
         SPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926756; x=1725531556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nopjZOiXiccCurmPDi4lhpMiSpQ7X9/bOex7t+lHZIA=;
        b=suPlvukDix2D2ZDCgNLPpm7xeP9J35ea2jNg+5QCVYfkK/xvISVmuS3qYhYb3CmgP8
         IcdYsvnNIl2azayyTE4jsix23gv+GCX0oCCfrN1dx6e58Bb9OVRDUIl+87mWleN2X6an
         Wjc0NpVJ9lJkPyKOUDrSkaRV9BgDyfrimaca7DbSE1gNbHYE5vP25D1tIGwWJqz4wSfL
         lEGopuTo4tAUqvGSu7QfIrWPDW9aeut9lq/0kY84jct+Ld7smndd1xjeOeK4Y67V8PD3
         ItmQIhlerlAaILhIn7HyUVMwm6Z7eVexyvqn+S097x2a0vvN5qRolMfm58UkZhPayC3k
         jDBw==
X-Forwarded-Encrypted: i=1; AJvYcCVm0diZXaY3xQnZowuRM95jG9CSSd5w/CuOZ669JbKgYnhEEXv3n1oPcjy8G6EZQufGfN4a568IJdAizepa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9oLaA3rP/0lDuTzr17v2PquAvQ11fZT4Wt/MIBGSuYdZUTc75
	UIuqEWvfeJUBHSVk4A80jNCJm2Xv21Y1MEVNSeqomQeCdCZZnU3geuQdiMydiEQ=
X-Google-Smtp-Source: AGHT+IETKZnM5+V8q/IAwppa+3QG8CZq/4HYaD9qYC2EdM3dOtcZyyhQ65wHS4u5dtwJxEHeX73Mvw==
X-Received: by 2002:a17:907:7216:b0:a86:bb5f:ebbd with SMTP id a640c23a62f3a-a897fad70f8mr137210866b.63.1724926755889;
        Thu, 29 Aug 2024 03:19:15 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefb60sm60432366b.43.2024.08.29.03.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:19:15 -0700 (PDT)
Message-ID: <45298600-beaf-438f-979a-3cb9e207a32e@linaro.org>
Date: Thu, 29 Aug 2024 11:19:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] soc: qcom: geni-se: Export function
 geni_se_clks_off()
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-4-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240829092418.2863659-4-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
> Currently driver provides geni_se_resources_off() function to turn
> off SE resources like clocks, pinctrl. But we don't have function to
> control clock separately, hence export function geni_se_clks_off()
> to turn off clocks separately without disturbing GPIO.
> 
> The client drivers like i2c requires this function for use case where
> i2c SE is shared between two subsystems.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

Suggest:

Currently the driver provides a function called 
geni_serial_resources_off() to turn off resources like clocks and 
pinctrl. We don't have a function to control clocks separately hence, 
export the function geni_se_clks_off() to turn off clocks separately 
without disturbing GPIO.

Client drivers like I2C require this function for use-cases where the 
I2C SE is shared between two subsystems.

> ---
>   drivers/soc/qcom/qcom-geni-se.c  | 4 +++-
>   include/linux/soc/qcom/geni-se.h | 3 +++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 2e8f24d5da80..20166c8fc919 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   
>   /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>   #define __DISABLE_TRACE_MMIO__
> @@ -482,13 +483,14 @@ void geni_se_config_packing(struct geni_se *se, int bpw, int pack_words,
>   }
>   EXPORT_SYMBOL_GPL(geni_se_config_packing);
>   
> -static void geni_se_clks_off(struct geni_se *se)
> +void geni_se_clks_off(struct geni_se *se)
>   {
>   	struct geni_wrapper *wrapper = se->wrapper;
>   
>   	clk_disable_unprepare(se->clk);
>   	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>   }
> +EXPORT_SYMBOL_GPL(geni_se_clks_off);
>

Does it make sense to have geni_se_clks_off() exported without having 
geni_se_clks_on() similarly exported ?

Two exported functions already appear to wrapper this functionality for you.

geni_se_resources_off -> gensi_se_clks_off
geni_se_resources_on -> gensi_se_clks_on

Seems like a usage violation to have geni_se_resources_on() switch the 
clocks on but then have something else directly call gensi_se_clks_off() 
without going through geni_se_resources_off();

?

---
bod

