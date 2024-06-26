Return-Path: <linux-arm-msm+bounces-24387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BA919A1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32CB31C20F32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66DC193098;
	Wed, 26 Jun 2024 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4vJZdyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8DD1922C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438730; cv=none; b=FQtT2ZbLbJ47qXLNKadjneiuQep4Bb15lbj1RlQTDRiGyeY9lHf6bv5Ce7CUo3AlWAiT2ALHGQd96r+R9CzjkSkPvMIaJC0/xBlqTJ1YebUvEyuGjTUrmELrHg6bJsgUp+sMvRMsM7wCafPeidwBPXC0gkJwvofrGNNRZo2dyJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438730; c=relaxed/simple;
	bh=Twt3Sm6ibvFAc9dg0Psyp0VpLNwcNtULJOXuU69/SZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H//Dx8vqLvIpNTjPsSiwDlsj6to9jCCGzEoZxb+z3rMpnuB5Co29SLLeHO6Pe50/XdsKrW6SeXCK2I2JkwTKgcSdnDhjOwq3KYSBclu/kbZ3z40ZUDIDv02Hti8Tg9aNQ75YVTmNLJUU/HsOKYfRZBboz2uTgWFKMPRJE8h43p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y4vJZdyW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d07673185so992127a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719438727; x=1720043527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YE3RprsT9yRDoX4gwdoigkfM2CSBZvv3p/0dCbH2Hv8=;
        b=Y4vJZdyWnaiDr1lk+jxTOP0YET+SbP7uiVnK+tJnI0W80qHsJkuxeEmOYLoN5GxRK2
         h8UbysK8pGuF/aOPuvWEtMRbtYQtChmkh7ZeWr0Un2qYxl8p7R4nIxkBo0wK9oKL8i+P
         ylcJEqqiSPk9RLFspc2buLc3eIHUY/rJvH0uxEbPTZoSpb1yTEWIGKLegzTmK0NnPnSR
         J0dR8OBX/J5WmsFVtQaVJvfgajUPlcwVRqA9TrN5RcTcUvt8yQpxMGhEQqCYXmCPEaTr
         CBaYa0ztKXAcueOYixIoVjoYAJrk3vrLMpKA+WoVyrUHe97xxeETvCGrZITRJRZJ8103
         SvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719438727; x=1720043527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE3RprsT9yRDoX4gwdoigkfM2CSBZvv3p/0dCbH2Hv8=;
        b=no8nLgINhuABdC21Y3v9g8msKLwFpGe2JWwXnpbtGiEMVheXoueB+tMaBw7QvUaDvV
         kYH8PPjWMrBZYD9uZp5Ku9bVeNGJF3lDEXqPZ/hUJO1zhrCMzeagv89O4teGcn6+X9+n
         ZhntBk/dqw1hrph7WjgKLgjE06/BfEdxDK3oc3zy+YRj2bv13BgOS8k/jq5QssmZa8aY
         comMguy+XejnC3KE8pjfCOjVwbV59Ue/IFIrQTSix9GJniaRb/gyIq/2y+yJL306HS2B
         ah1rxR/L5J2U+KeRmhN6OkIhYqNGptmEt11qJkmMdgYqEZguUDV/H9E29k6AgD+Krsnj
         tgng==
X-Forwarded-Encrypted: i=1; AJvYcCW4KMfMP1yRKER311Gi4m6mDiExsBq9aS1UlI+Q2lWFg5oD7EQiC07tPxA+BDpEnEkJRq6zYL4WM/6PtdfWEzFaINeRRz0rQB4LQ+IVNA==
X-Gm-Message-State: AOJu0Yzyzgoc0JMkH6Xs9cTqRDoXro3mn+UYty2/NpLTIJiXa2XwaD8t
	Xt2DWdQ9n6WEPagxNGZk06yR71q3K+2MUZI3eEbm/dW7mWKmcdNyloOGCv1Xt6k=
X-Google-Smtp-Source: AGHT+IHXKih3yrKlJhMpJvkHBx6qYdd1mLPTf8ccO5adSdDeiKVGq4aFCbSdt0FphjxXXo9DCYrn3w==
X-Received: by 2002:a50:bac3:0:b0:57c:7471:a0dd with SMTP id 4fb4d7f45d1cf-57d4a2815a6mr11210281a12.12.1719438727097;
        Wed, 26 Jun 2024 14:52:07 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d0c9f684sm26321a12.10.2024.06.26.14.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 14:52:06 -0700 (PDT)
Message-ID: <5021ca42-f8d8-4dff-b0e2-21c7f9d680fa@linaro.org>
Date: Wed, 26 Jun 2024 23:52:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial
 device tree
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240626191829.280611-1-raymondhackley@protonmail.com>
 <20240626191829.280611-3-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240626191829.280611-3-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 9:18 PM, Raymond Hackley wrote:
> Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
> other Samsung devices based on MSM8226 with only a few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - UART (on USB connector via the TI TSU6721 MUIC)
>  - Regulators
>  - Touchscreen
>  - Accelerometer
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---

[...]

> +	reserved-memory {

'r' > 'g'

> +		smem_region: smem@fa00000 {
> +			reg = <0x0fa00000 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-hall-sensor {

[...]

> +&sdhc_1 {
> +	vmmc-supply = <&pm8226_l17>;
> +	vqmmc-supply = <&pm8226_l6>;

At least vqmmc could use regulator-allow-set-load (this and below)

> +
> +	bus-width = <8>;
> +	non-removable;
> +
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply = <&pm8226_l18>;
> +	vqmmc-supply = <&pm8226_l21>;
> +
> +	bus-width = <4>;
> +	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&sdhc2_default_state &sdhc2_cd_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};

Konrad

