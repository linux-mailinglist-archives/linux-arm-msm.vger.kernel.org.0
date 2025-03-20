Return-Path: <linux-arm-msm+bounces-52122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AAEA6B03A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 23:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97979482120
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 22:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625F91F7074;
	Thu, 20 Mar 2025 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnuqufDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E332236E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 22:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508103; cv=none; b=s1gFhiFuXeFqyEDCZjO9clEzI6QorkN6IxnDI8d0ZJxFELyMMkPsfAkalAhZwIMYyWn1/Uk2aRs6U8Y1Ucnz+x+iwiV+Kck7oVDwqlYTo2sOWJ6UTxYLLtsL9b8P6U0w784KMOfs3mjDjNbOgSPxUZXorBDE0i4vrLYMxWqJY7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508103; c=relaxed/simple;
	bh=UBLaD4Nq5xNwf400rlM/sUNn9F560QUZ1XyT2uZZub8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nTedvI6Eb6I/KMN9TDw/Ft7peDj/ldURNMNdFAm9tRRkSGAYFRYOXxxzTCvIq/LEcQ9l7MCOiqB2ArqzNjh4bWn2dO+Q/uqsHBefTX8zo/dxkpIDa4H99yRVcSEZXMMldk+o8Udt1sgEClF42BTG+jBXRHD1eZZZgKby9wUFAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnuqufDd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso8848785e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742508100; x=1743112900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8yT7bxx+POTQPmMty55njjk/M6SEwDhRgh0uxWleRk=;
        b=LnuqufDdNc0xgPOLrTPivBZCBviALYxIZERpaM9Wc3DDGtpUVHQDAh4XsT+IbtW3/e
         fHzLQJ3CXVL5RAg9OTwLtY0oAh5yCT80jgy4PUlJYlp0mZ4lKqCm2zuVIq7CcCkno3/r
         rbAO+yVYYQsRFRTumBiOiw/AYR8UVgj6Oz7F53O5I4SvD/EjB9iag3Xvvt3WAF/3wubF
         BDfA/BjEcAr1fsrknqDXoOoI3cKuMhnu3ipzglTJuxET2WWCgeQk6n6VMLjRG6TB/bYV
         8Uu+Z1tPleNrFM8Ev/Yrj3Usnr0vKb9qR0OKtx0mXIsht0DpmkRC2LvFchuetfihg8Vq
         OqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742508100; x=1743112900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8yT7bxx+POTQPmMty55njjk/M6SEwDhRgh0uxWleRk=;
        b=Lm7ZBxtOuU9bXiJsK68hns7ZmP508yqXJWtgURcjpE7KEclV9Hgo3hCOEwFqYFC6KD
         TLmQA5B4/hswNEpbUUzmwADuc/2T0QWl50RJTgxNBaLE6rfutaVcYXiMUZ3aQ3o9R4eg
         C8w1LmigAq8hhILBcjeSKL7DD0oFiS5Wwp6M/lZBvmaiXIcbIQNg3H+QEyjUBVXrsv2c
         w5ugXfeE9tPrjVeEe1qUxzVqMJG2kRUN21zE30PyZJtOv6tWlSF0g91GEKJrbX9fYgiV
         ZqoSSRqe4UQ5+/I4+ODUrHpPGqkFIJHm0EgOw2lwY5ISYr3pKVILITsYo2DoHCj0rFf7
         g0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/6K8pb/U/oY/q6yFec5G+rrdD5YlL6ny3ihxfyVRdx7ATyXBXFu87ijbTMt0wuKBAxMvhM9n36URy26QB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1fRU4GhuaIzcXVVlClLAHU4o+TN1CWATktpxc7LKnF/GT9Ah
	cTXSmzw7ojasFTmpzZuAC8ySY+OPOuvrhs/y+dQ6N39ayc84acpmJnZO3MF6V3E=
X-Gm-Gg: ASbGncu1O2DCh1KPvZtyTTXzqzy0PaSOJxW++8a2U0xdQcnHixs5T3qmYxTC2ASvBX/
	PUC5EfLP5sYUI3t/sJ7SoEgvodPAwAvjwlALTxNYewKf5al4WnsIrbV7xKS+ScxDtgRKsVdIo9i
	P3Vi4Ynxo3FmbNxo1sK2V2pMxhAuHF9tGb0QOrsWOGOLLceu0LMdhACBZbR75nWrB2dS9O7KgA4
	sO8QXjcg0pKfpIpV8tZQmW53q5RHrsCPqlid8YDllZDjnAc/1BZAmPn1KQom1YYuYHmOWS7BSoi
	R31Oz3kV9ivM2ydasoXCgwh9Cm55Nz6MDk65EqxVzgL9Q7AP2tnfZF0b5PkanPaRPiOYZnnILhM
	xVEWJ75ARNA==
X-Google-Smtp-Source: AGHT+IGz8sDCfiUcMrh3ZaHqynp/YtvdJQNLTBk+X4KzsimZeV2pCXU70QJKuqlDD/aS804bEebyZA==
X-Received: by 2002:a05:600c:1e8f:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43d502e4332mr11888305e9.4.1742508099644;
        Thu, 20 Mar 2025 15:01:39 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm8939025e9.40.2025.03.20.15.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:01:39 -0700 (PDT)
Message-ID: <fff943a6-4322-43d0-9821-08375bc5376c@linaro.org>
Date: Thu, 20 Mar 2025 22:01:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
 sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <zqBb_94gbwLzHgbAiLqgbuGg9wmeV1jUxHOsMXDdZToeTtRrtUimm8ra7GB48DXWU-ZOvC5mO8EY0uvxz46ISg==@protonmail.internalid>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320055502.274849-2-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2025 05:55, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Enable the pwrctrl driver, which is utilized to manage the power supplies
> of the devices connected to the PCI slots. This ensures that the voltage
> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
> on/off if they are described under PCIe port device tree node.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 85ec2fba1..de86d1121 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>   CONFIG_PCI_ENDPOINT=y
>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>   CONFIG_PCI_EPF_TEST=m
> +CONFIG_PCI_PWRCTL_SLOT=y
>   CONFIG_DEVTMPFS=y
>   CONFIG_DEVTMPFS_MOUNT=y
>   CONFIG_FW_LOADER_USER_HELPER=y
> --
> 2.34.1
> 
> 

PCI_PWRCTL_SLOT is a tristate symbol why be a "y" instead of an "m" i.e. 
compile this into the kernel instead of having it be a module ?

---
bod

