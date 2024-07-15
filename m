Return-Path: <linux-arm-msm+bounces-26129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C6930FB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075AA1F21D46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E461849DD;
	Mon, 15 Jul 2024 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J6Juv3uR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0074184133
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721032045; cv=none; b=F5gCVDgVkqg+007nGgNyaDot94GrrfDuIb5RX8WsjTZ9NPoCXaNwxzw2ceYIgpdgnEWcTa0/72ABRuHax9sOwRxJkDT5UZL380Z3KWqUQy7R3GLbbercKd6Xro5fMIfbPaKRHNoXgxUPB0tmgHMSJhGVwLn29xvZBZU/CmshVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721032045; c=relaxed/simple;
	bh=xPt1Z4/QrPj45lHHQ+z1yKk6szG6GZLaSvg2pK6D0+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvIy8j2aIeYboEYS0Z1CHnzL9w8UiogQUjMp+iYy221BJT+SvuB0dfCEGIjT8uoCDwzMqPLTYQLE1527BVC84XMpY9qeaQvoQT8LZgaBAiqCk3JCc4QR8s8/BbRnylpIzZO0DEtvfqXhfD6tweUG2wcDAT/v/OQhfw+g7FeoK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J6Juv3uR; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-595856e2332so5100376a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721032042; x=1721636842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vH42OgTir5lpTjIEL32sZU+fMD4smaCACyobL2oetIk=;
        b=J6Juv3uRs3cmZ5cPGpgLQ35ghpJ0w2EAweglXwnNQwZuxregz16f6a/oo63oejul8f
         AymlE72zyP8J1tvZcxi8YkzOe6Q39PDSQgFroGEt1C7thfTPvZct9bKYbHRJhNq2ugdx
         LRjI+A8CzsdA9r3udHzxXpB9sddaxgHGrt3kKNMYS3rQHC4bbh8LixQ/bKTgRFQt/kmP
         EUpazk0yYa6jWcalrpysIUVBKHokHx31ptS2a2+/vxA3Sa/RCnJ9YYi5Oc0EUTcqTYkV
         kHnfgN4J3/FMJSEfo11aJA2kvUVD6jlKR/AgXLgs8k5nJtTEYprmc0WpOqD2CCAPsRdj
         MopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721032042; x=1721636842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH42OgTir5lpTjIEL32sZU+fMD4smaCACyobL2oetIk=;
        b=LxIzSISRsPN0/WTbM5tTsz+h5DlR8+F/JSaouvrWNG1Ee6ndSeb0i/g9Cv3YXaO8rq
         itHFzq5oNSctPHiwv0nxmg3MZqEhn/ebp/7GWP8ATJYJn56W8jxugt3e5PJYpa858RrD
         uZ8mlkAIKCOhrytXI+I0YY10d2dkuS/0+IrDEDnz5KANTdzSF07svwu4dUZxyvOOzTLH
         IRT1DHRsMS446Dr8S+iuQzcCSTChxdObEw+rGp4K9S86SMUPgbFXfRShSI8C0AhMNmwV
         Hl5rE95eFOv7HwpMuvzI1CsvAOGKdgDSKcNiJWRpoME0NX0SXxY1L3w+qRfys5JSx6RS
         FqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKT2CIIvf83IP0xMuTBGBOFzjmsKfSI9/HM2P3ujsf3AFJpSjR7gYIVRnSPszmFDHlDsDg3jpVQ/h8xoy8ygoNTZ3rP0ZPC0q1kYW1WQ==
X-Gm-Message-State: AOJu0Yyy7VMj3rvoINrSa18x5pD7DvyvgqUeON02N5Uju+qRId/VhRdG
	NhUN3Ky9wUlLXNA0axualJClzXeTW42H1r7kwcN0i/QkCQ/dkCh5Wz3ztRwevPA=
X-Google-Smtp-Source: AGHT+IFzdvl3B9AxqHjWluHugFbIxtu9xYFJDlTlYL0FpBWNc4yVnBvcybVukz4DV/+ZODXebMPUKA==
X-Received: by 2002:a05:6402:3551:b0:58f:748f:9dca with SMTP id 4fb4d7f45d1cf-594ba98f21cmr13543634a12.1.1721032042079;
        Mon, 15 Jul 2024 01:27:22 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59e2b7c7d75sm92623a12.29.2024.07.15.01.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:27:21 -0700 (PDT)
Message-ID: <bfb9b823-0414-400d-87ec-c2eb588f61f5@linaro.org>
Date: Mon, 15 Jul 2024 10:27:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-grandmax: Add
 touchscreen
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240713172724.34658-1-linmengbo06890@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240713172724.34658-1-linmengbo06890@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.07.2024 7:27 PM, Lin, Meng-Bo wrote:
> Grand Max uses an Imagis IST3038 touchscreen that is connected to
> blsp_i2c5. Add it to the device tree.
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---
>  .../dts/qcom/msm8916-samsung-grandmax.dts     | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
> index 135df1739dbd..5806a28b7bec 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
> @@ -47,12 +47,34 @@ &battery {
>  	constant-charge-voltage-max-microvolt = <4400000>;
>  };
>  
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	touchscreen@50 {
> +		compatible = "imagis,ist3038";
> +		reg = <0x50>;
> +
> +		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
> +
> +		touchscreen-size-x = <720>;
> +		touchscreen-size-y = <1280>;
> +
> +		vdd-supply = <&reg_vdd_tsp_a>;
> +		vddio-supply = <&pm8916_l6>;
> +
> +		pinctrl-0 = <&ts_int_default>;
> +		pinctrl-names = "default";
> +
> +		linux,keycodes = <KEY_APPSELECT KEY_BACK>;
> +	};
> +};
> +
>  &reg_motor_vdd {
>  	gpio = <&tlmm 72 GPIO_ACTIVE_HIGH>;
>  };
>  
>  &reg_touch_key {
> -	status = "disabled";
> +	status = "disabled"; /* Using Imagis touch key*/

key */

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

