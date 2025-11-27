Return-Path: <linux-arm-msm+bounces-83643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFFC8FCF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3AD83A9DAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6102ECD1D;
	Thu, 27 Nov 2025 17:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXTvrBSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B3D3B2A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266024; cv=none; b=tYV7G1rrHDK8P0RSYZjfmjpEY8Z28gb+sEJmjIJEvsVZkCV34wSYJB5i0C14uDwmQzpVdw//ciUH7Tm6ZSBLMVo+pce6EIx2550Kyl36QsMY0AsvI519nOveA2a5PX2TDwaUUotnPsUlxwoqNWjmia5SVFf84c7X4lLM7UPpcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266024; c=relaxed/simple;
	bh=nEj2rUx8G9gla85oszVk7WefBks8vjxYZLcGA4NKCZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsgpEucd5k495MlMdraYUJ1pdjDD9ngUXTMALlBsUvjNQ5pBWDOwttuDhhbJhEg+ZCEmm68QK93W4d3mOi3tti5y7H5qGIl++g4Um2rZx0nhr2i3Wc1dkF7sT+GDoT50ZRhamBO8lyBuZWWv3I20R2RYkse/1tlvuhpOJKsCW3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXTvrBSL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso9022525e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764266021; x=1764870821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETweoxGWZm2ziwTrSjwftUK80iZE4y2BuRacSXs/oVk=;
        b=cXTvrBSLRu//G1uEOfJgmZMZuu1swGKTUfHUrYQIH5KALFTMeO1dJ6OlO+mxtcutZA
         Xw0J9FxnkFtJbbEwzXurObhNlfrGQFPmTGqiwcU3DbLp6wYSakVij065Iv1upwP606Ry
         Z00jNN0GebI8uu8WEhvn69S1x0VFxgEtEvODkii/dIK5zn1L9QmNForyLi40tRO8uriN
         zhFmjuu0V/cMkX507V/O+Mc8wxqCeFb1ds6XHnB4kpvflP7F/jgUDMXR/Mmx54Da74Ll
         mM21Svm8U3YWoVyFZQSaurmG6rXLL9RRWolCWpXcpNooFIC53JBpiCBLPCXb6NJVG9Im
         cAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266021; x=1764870821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETweoxGWZm2ziwTrSjwftUK80iZE4y2BuRacSXs/oVk=;
        b=exCHraZ0OSG5PVi7HvEgqJfYNfxQobnwp2xLDL4UmxAmNsE2cIMWA3ixXUX2g/bSI0
         hiInQnKEq5Dysq6s05MSZknYFQGQnRKtBXqTRqSNp4EehGExas/qoGwkbiBA+aaNoPAv
         RbvvijRIQK3mQx1MNGTOWflnskP/q5xD4M5jW7ragKtKEIEjqM4Ja2M7Ihpp0ubpr6lg
         fH7ASHDy7twS/KqUZzfmaox3BuMrLEU/IyISFDc+tv+A/5T/sP4xua0fb0l3zAo2364q
         iAZaupLlu63ZVfUgnuzg00o7gAD1RK0Jvh6EWssQGD7meyfqOV4vnDFWogslkJtNJd+9
         xJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0g+rU2gq2foXJfEv823H5JOBoNc9VmMMLetxFg2RXW6oFT++XlkZ6MSVCVzI8DAQ4cFcNQf7KA/YCofwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAG6DoF34BRDkDyCutvZQ7Z/ndLWCF0AESA8Q2XoKkmRdnGkAS
	MA5xP0/NbqFvPR5DBfCXyKt/Bxav1gB3IBwi8g+h+J7vy+2/7sFB06pvxQ1uAuKPQtM=
X-Gm-Gg: ASbGnct4ENYmYlb5nNvPUVwvHz6EBOsJD1AGSGa5cx+wNdB0FR1kdrdSKWqGAutQUW7
	VJtpVpmn52Nl3JGIp75q99Jill9Yt05tclTcHv1e+7WlraZ0gWsbaRZVbriL17KYty0tJASaASM
	326DX51WLTpYxPCSB44zGAOmtnExNdeNAjV/ofeUH5tKLSjUmxvC2CWVTzZiU/aoAtkTLR7Lfqq
	GsC/rckChJoQ/ajlizTNyDgSKWAYnbvuW7eoKi8bf3FDYQCp8BYpx5/vpOElNzIUcTXAJp8wODZ
	SZ87pd6E+RD248LLP5aNheq93+MT9iIIjOAHk0euRHyFWZnaF5mnbbmcKlBy2pEkW6GSQuCNbOJ
	QWSnvaQfS9YQIyJqCq2l92vjbvpv5RGj7HMiCrO3pfxep87MpEKjHJjFtd1VQ5ourTGAjX2YF3O
	CGvIWVyHZv2KVOPHd5+V0Q48GpNOnFs97HahIwBEo2/FulOum7LloK
X-Google-Smtp-Source: AGHT+IGfQcg2rnX4fdDDkIwWfOlTxEg1XWFtGmpFpSHYpBftRve1U7d6ObiP5sKkjk0IWCH4pIYGKg==
X-Received: by 2002:a05:600c:3595:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-477c0184b34mr251138045e9.8.1764266020721;
        Thu, 27 Nov 2025 09:53:40 -0800 (PST)
Received: from [192.168.1.36] (p549d4195.dip0.t-ipconnect.de. [84.157.65.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052b3f5fsm72574625e9.4.2025.11.27.09.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 09:53:40 -0800 (PST)
Message-ID: <a9ba3370-ddff-4b69-b2b9-9244f759b6f0@linaro.org>
Date: Thu, 27 Nov 2025 18:53:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/8] arm64: dts: qcom: pmi8998: Add fuel gauge
Content-Language: en-US
To: david@ixit.cz, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexander Martinz <amartinz@shiftphones.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-3-dd3791f61478@ixit.cz>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-3-dd3791f61478@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/11/2025 22:53, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Introduce the fuel gauge node for pmi8998.
> 

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>>
Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd420..ab3bc66502657 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -44,6 +44,17 @@ pmi8998_rradc: adc@4500 {
>  			reg = <0x4500>;
>  			#io-channel-cells = <1>;
>  		};
> +
> +		pmi8998_fg: fuel-gauge@4000 {
> +			compatible = "qcom,pmi8998-fg";
> +			reg = <0x4000>;
> +
> +			interrupts = <0x2 0x40 0x3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "soc-delta";

I think it makes sense to add all the interrupts here, even if thr
driver only uses one of them currently.

			interrupts = <0x2 0x40 0x0 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x1 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x2 IRQ_TYPE_EDGE_RISING>,
				     <0x2 0x40 0x3 IRQ_TYPE_EDGE_RISING>,
				     <0x2 0x40 0x4 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x5 IRQ_TYPE_EDGE_RISING>,
				     <0x2 0x40 0x6 IRQ_TYPE_EDGE_BOTH>,
				     <0x2 0x40 0x7 IRQ_TYPE_EDGE_BOTH>;
			interrupt-names = "soc-update",
					  "soc-ready",
					  "bsoc-delta",
					  "msoc-delta",
					  "msoc-low",
					  "msoc-empty",
					  "msoc-high",
					  "msoc-full";

https://github.com/LineageOS/android_kernel_oneplus_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/qcom/pmi8998.dtsi#L292

Not sure what the difference is between bsoc-delta and msoc-delta, maybe
Richard or Yassine can recall? DT bindings would need updating too.

> +
> +			status = "disabled";
> +		};
> +
>  	};
>  
>  	pmi8998_lsid1: pmic@3 {
> 

-- 
// Casey (she/her)


