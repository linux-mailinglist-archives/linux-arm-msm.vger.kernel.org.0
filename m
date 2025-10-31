Return-Path: <linux-arm-msm+bounces-79941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB00C25D3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 16:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BB3B4F6210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0347B191F92;
	Fri, 31 Oct 2025 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcRk+NBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B022C234B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761924288; cv=none; b=p7tFN/oWBseFekyF34hI6fIgA1vrO1xPSYiA0Xn7YNH/sQvz/hGbVNjyATSC2JryyNCp1ZlhGBRC1i8e3DRFNNZk/jKANw3OGgShLESLxiMJ7VYiawsFuk3dbvcZ20CtzEK8mTIROlf3nD4aGiVuTCENlaHwsQ+ILoJo1O5alA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761924288; c=relaxed/simple;
	bh=sXyHsYmf1zJi+epAbQTrggcfqq3rdxGk6DOCOqIvIjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBT6NPCDMj9wM8AcBM20kGFMB+RKKO4lxJ5rc39J67k3uM9hpTjDvxO4VH7UpLXykmm8DZRPU1EfDXt8d3WQyVEn+0w5x2EyEoBVvKcnki55celPa/Rb90KgdViijKwJAsu9ex+1/KL0qg8ujqkKAo6a4F0fah1NBR0ezAgJZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcRk+NBC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3402942e79cso3254547a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761924286; x=1762529086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=p8N8RoulrjA/gbuloP+iGqTYNsmWXF6Jc8hp5p5NLs8=;
        b=GcRk+NBCdSgqyJz1OF9qVn8amU4ImnAPxu65J/ZDJM7M7teGrmgaHBPMu5vSMbNgY4
         BoSnkx7RIsBUjKctcGolwk9AY674mmf36rFYr72Pp+ekFA5MIQ5qXC05SP//xI+kOFqC
         KKi25w7qvFkvdvti3z0H231qLUHWaKOqX7ynv0azz3s42xOV3lSM4fzjjjSFW9ja73nm
         gXpxbNFM3h1r+9/lEsBlECckH6ZOYqK8tp/DRdCqfWaonavcxxGkTH8dykU1e0mOhjzk
         uXnI8qENV4AQipqqzwwzQrmCRvlMxjA7hXPBgUd/JhnREegzACqLQgajtwlB8QcKhjGG
         QUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761924286; x=1762529086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8N8RoulrjA/gbuloP+iGqTYNsmWXF6Jc8hp5p5NLs8=;
        b=MYAQA0rpV08Obv3F/1NWo8ch/MkluWSmGH2Z16VfzqpG9YaysE7ZXKDclkQHB15lwz
         RylvdNGyu8OnUx6/cnBjv40hskyCqUre/STX/hHs/lPjnlrsjRrG1pYQoQjBPe1ZeOyF
         rjKKUFOtURmIiK6d44kcOMiO0jB30jzYx4JSNnk+1kE7kTsKTGnSAgkiVjwm102u3NqF
         cyjbEuvr32+jzv9PmJRoDLwuF8cd7k3cj+n1kIXmWCQ0ZZBkKVMzH6JvN0JSPW8ELKNp
         AU6SXPJjLc2wHSStHlXC4cKnftGn0P/tBm2Rg3JM5ObaoPE36trOT77bHGlMqPgSGcuq
         aCJA==
X-Gm-Message-State: AOJu0Ywl0u90QfUnyBjyxzzjBqlMHe7uGil6Ud8dZf9K0eyV+cjcrhoL
	1rPPpog8xHb3rQuaNXlw/HAD2RuAXuOZ6uybyAC0H4QP+oiWxcdIIhDG
X-Gm-Gg: ASbGnctiCjUBQC43xNPRdbJry9eMA6rBZdI03Sie7j7t8Ln1DdXfbYpowc3pckWPaGe
	NMK0564c4nh2OzBOkA13eymzlL9p3syID+KW+CkR4WjiHHGSgHPPb1CFkkPjpEpO+t9Qa+XD7Al
	rlZG06OuDYhUSZDDr6h4VS6Gb0VPzijg61I2qV79CME0lZawqwLrk/A/L55ruRFTCVrfLt6ciQN
	JhZ6pPTtWE6bUUvJ0RZWJ1QWmZ2fGh5OiQJCYP9lLrVMsrPAlIRAWJ1mofp8bJSRbKSnzEXzNv/
	aWmW0vtpM7XrFyLoeHE4E8jeZXoRrcvx3ZQtV0HI50tCPhAvruzz0nKvKVIICtDFQXq2OLVrL6K
	XDTuR6A0CvB5S+b26PX/sJ3iGFD+l1dFjmWuA4sHZLSmU9n0NKpBZeyw8v61j6izSWUz0hI6wbR
	pgWbVzatGEdDvscgiZYBGTbevFeAsT7Z9a+ddYpDsld4Zr/gg/qkRINuEkVok=
X-Google-Smtp-Source: AGHT+IHcp1aMGPZOSqLWFP8KYca/EJPlwipa6iW7O1eXICdkd6tk5kBMgLGUgtnu9RGMPCWyUWBQ1A==
X-Received: by 2002:a17:90b:1642:b0:32b:94a2:b0d5 with SMTP id 98e67ed59e1d1-340830adc96mr5905671a91.37.1761924286261;
        Fri, 31 Oct 2025 08:24:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3409288c910sm2527372a91.8.2025.10.31.08.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 08:24:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9421ff80-bd86-4b29-baca-c86da90c91aa@roeck-us.net>
Date: Fri, 31 Oct 2025 08:24:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 03:18, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict gunyah watchdog initialization to Qualcomm platforms,
> register the watchdog device in the SMEM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based
> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> present in the devicetree. If none of these device nodes are detected,
> we register the SMC-based Gunyah watchdog device.
> 

There should also be an explanation why there is no "qcom,gunyah-wdt"
devicetree node, both here and in the file.

> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index cf425930539e..40e4749fab02 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>   	return 0;
>   }
>   
> +static int register_gunyah_wdt_device(void)
> +{
> +	struct platform_device *gunyah_wdt_dev;
> +	struct device_node *np;
> +
> +	/*
> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> +	 * the case.
> +	 */
> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> +							 NULL, 0);
> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
> +}
> +
>   static int qcom_smem_probe(struct platform_device *pdev)
>   {
>   	struct smem_header *header;
> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>   	if (IS_ERR(smem->socinfo))
>   		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>   
> +	ret = register_gunyah_wdt_device();
> +	if (ret)
> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
> +
>   	return 0;
>   }
>   
>   static void qcom_smem_remove(struct platform_device *pdev)
>   {
> +	/*
> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
> +	 * watchdog device is not unregistered.
> +	 */
> +

Odd explanation. I would assume that the smem device is supposed to be
persistent as well. Since  that is not the case, what happens if _this_
device is unregistered and registered again ?

Guenter

>   	platform_device_unregister(__smem->socinfo);
>   
>   	hwspin_lock_free(__smem->hwlock);
> 


