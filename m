Return-Path: <linux-arm-msm+bounces-69765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B61B2C5BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 15:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDFB61B6275B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BC633EAE9;
	Tue, 19 Aug 2025 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXWYcuVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB525524D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610376; cv=none; b=UaJ0HWxDVItMsBn0ZasECypKfA/qTPlE2guLTL4jjMWB8j9o/Eht6fRhc143ehf6ivkfahiOZtiypZARGJUzgzD+VeY1w9KMugO9MwG/ac3D7aytwv7PRPhNM1XJ1Hb7If+HD0QyXPbhDEpfXkMf5NoJNqnJnI8bTt2uYhQDY7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610376; c=relaxed/simple;
	bh=pSC5IgqyzZtG96ClfbXrgt5sbg1AohobwZVoz25rj/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bUwFdS9KpyS+lK1hFwJ1dMxW3VklaAUjqUJt/kkPYOeUoUD7dpz9USXzRdI8FmWj/iNHbq8L/zNAn/rdj/IHA/qIAkRqFlX2AlDrQVnBIhQ6IVU9nZl+ttK1C592O6QhjvVbYN9uHzXU84ufy6QjuOiOUA2OOGBOXciKLpW32JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXWYcuVe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9dc55d84bso3688402f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755610373; x=1756215173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FygJPUitZkmXwlp1RpWscijGjGvi5AqEQa7JO2lBl9w=;
        b=XXWYcuVeZdjKkQpbmgtiXlCYl2P3uKIwc5vk/Jo460Xd8ezzS8QFMCAjkC3CFcBkq5
         VW4Ej+rGwFUzbGHTZiSEUcXRxH6+omwQMCHHQ8UZ8F212Fj5ItogE2fwUBn64JLw3rRc
         8petYKOwLYhlUHEw/L0Z9ZkyRbzgU5K8/LHZhpS/DUO7f0Invi60piAGW9odGopSSq7g
         GVkdZ0Lts9g0aYG0WPYT9hmGl3junTZPCBRSZM25yU8Fk94+YxU6IPQKdt+hzTCB0lnR
         xGN35RYy8u9zLJ95wGvXczvsAiCr7Pkl5/T5dANheglI9ftTOEttnFCJRH/7s+WebjJ0
         VqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610373; x=1756215173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FygJPUitZkmXwlp1RpWscijGjGvi5AqEQa7JO2lBl9w=;
        b=IHPclDlbeur/MPZ6rU0HmaIUGCt6qsboFhP6bZTG5cEPFiHEHGtxXBZFxWyG/U5blr
         fIzztnlpytgTdMay3OGwg9KjtkpjxA7GNwu9F1rzaCSGM8f7/AP4DHwlHm6GzUv2KsF/
         q6WOoY0RQQjC9e8w74sv6CZYkfbOKbkxLsSVtr3p0jW2NJlwVrnkrwW+zyCG5TXJYz/7
         Pz/XjoUJsDXUNqgTo32mXX+cMgMZLrn2LGk3nuKoPS5MrLYF6fDc81m+bkseCJp2Tq7+
         Fn4q83Wg/lJ2RUoflryqWon8uubvQxDCKC0y4IOW6XWIjyCQizOsZ/le29dFoTu4w585
         wkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD9reAsoFEAS5RDEb+Mt8aKHMK38UaR+Oy6RzupBM4qOBBTOX+UBTkTh0R1re1iXtr0r8ug/SM1snenEOE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwme3z9Rs4jz++HgPmUf65szZZpeSqAlM16l0/6DIzRN0pwjps
	ZXs5+Trgx1OcurKdPakCUibDYZfcSL8xlTZkMSXlOivaYYDvjh2oHlju+qk0wVdUQy4=
X-Gm-Gg: ASbGncsuQsjFgxkPlP4QH5OnWEMzb6m+bUQWl0Ky6xKfO0ZvkIdfpmkYFuY/Hp+T7gH
	AshJn0AOqT8fNQ+vSCem8JF5BKHXx+AirYzpI5AAlGAKk9xr99rGlTnqL+kSQxSqWu6d9kk5Hpm
	zavsFwmfTc5CzH5V7ZxF6I0zpPuWB2wZbA0j5cF+zfV0P4t/2saKVuza0/635F3v18XynCOxd/W
	2UpRq01E5f3xEygnQYibGaVPdavegnS/JTzcIJ0eePKY/H+VimQwkpGZbGSubN1J5gvkbt84VjD
	D+HsbqaK9l8BAJiUYoiJNOSKh4nfg2MeBNZvkY4pRctrC7O8VPJ0fRJF4jSklI8W5CGwX/pZztz
	Rtay5v44RRdU/Ntucd8+qVkSRw+gB28JSHfJcS8rKoUzNG26VElLdOU0x+PnEv6U=
X-Google-Smtp-Source: AGHT+IHE3eWuGDJbAuuWclWDGhvbLd8+Nrm3L1V5+JQsqdxDxBiVDMEcNaBhcDl9yr9xN8B6hHRBKQ==
X-Received: by 2002:a05:6000:24c3:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3c0ea3cf081mr2302142f8f.3.1755610373108;
        Tue, 19 Aug 2025 06:32:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c5776fsm3708064f8f.61.2025.08.19.06.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:32:52 -0700 (PDT)
Message-ID: <bee2fce1-facb-44c2-8eed-2bb396f9c204@linaro.org>
Date: Tue, 19 Aug 2025 14:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: use kcalloc() instead of
 kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250819090125.540682-1-rongqianfeng@vivo.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819090125.540682-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 10:01, Qianfeng Rong wrote:
> Replace devm_kzalloc() with devm_kcalloc() in qcom_pmic_typec_pdphy_probe()
> and qcom_pmic_typec_port_probe() for safer memory allocation with built-in
> overflow protection.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 18303b34594b..c8b1463e6e8b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -567,7 +567,7 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
>   	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
>   		return -EINVAL;
>   
> -	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
> +	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
>   				GFP_KERNEL);
>   	if (!irq_data)
>   		return -ENOMEM;
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 4fc83dcfae64..8051eaa46991 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -713,7 +713,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>   	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
>   		return -EINVAL;
>   
> -	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
> +	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
>   				GFP_KERNEL);
>   	if (!irq_data)
>   		return -ENOMEM;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

