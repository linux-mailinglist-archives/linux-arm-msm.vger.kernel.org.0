Return-Path: <linux-arm-msm+bounces-84341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B27CA3302
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 749CE30FD3CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D343346BC;
	Thu,  4 Dec 2025 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5VT0h5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2013112D2
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843186; cv=none; b=M4pguYrhu+FtG++lBd8IXZK3z8zu7esv16ucgb5hd7wTLOlR6b0CbW2uusYXZzVf5juTuIC0kaNpjYlELwjvLZ88J0HVddHO+5bLbONPYjzhupJlRSR4iKE+mPAum2ho25jogt0yVbsoPnDo+GlTOXScYYux5F9CzUkhi2CCetQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843186; c=relaxed/simple;
	bh=uufo6f/Ee5aTtBa+npjKMAOBZVU7mzp+8psYi1cKyq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ura5qtIbUmEvPNDkhaLqKYDLlvDCYWuocVT5yPiJbOQKqSBJ979RqAiwjCdrTRWSfIYwGJwQn4A5fPSR3a3kA0coYlkpTW7duPURZs9RM6XCztEFATibpJ0RMcUGrjIAeqeksAkv0MJtokY3pyHNippL732NyYrWSNz++LUp12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W5VT0h5o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477632d9326so5149465e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764843183; x=1765447983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laKWGGjDNrFf/rpSwSowd4wZR8PRhBfH9jS/Nxhk/S0=;
        b=W5VT0h5oDtEARHAjVyqnDUXcUK+fj7lyWp8a31P/CPrigveTCRAfpmo3OHibM9m6nq
         gFpkbOEXjFXGkL9FIj8hYxItEuIRTzBhxY2bf2NxhIZyJvRFve8Ee+8o3dOVox+V/dtE
         HoMTqRoSaQu2Sb/F7lcG6/rh0vJYPzKZAaT0ryAw2G7gxG1GrGUO7m4o+ZSg3bt5bsYF
         +nPWc3I7o8rMZh+QMRwqTbHuTmwTpZ9Fw9PUqagv1/svDfdyasZt0CV/Vu7hm7n7+Khz
         SKYe5/AloxHoaxGJUqCTK7c4A2+/Aq3ANEa9vpeMZwVEs9W6ssmYyVktjyI2bIakukIk
         nlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843183; x=1765447983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laKWGGjDNrFf/rpSwSowd4wZR8PRhBfH9jS/Nxhk/S0=;
        b=i101UyK3Wd+46Bbcka8JVUCDKUslrP1pbMuZgCcrfAhWodf3MY6lk8jxn57nYQkdML
         WrjxJFCffKLkDXqymhRMfW5SresfKDbCth4TUXXFYePjsQStiyTRXnzfa5YndAevgUWf
         AbOzgdjJRKnA6biSNW83LnqEuTSz93atDeoBpS2Vf39SjPDQex8wFTtU9/fe4W51vSvb
         Jz5mR3XbsA9IJNwYsx2WaHAnpT+n/9wLgOHqMJNSnzxwufzKEZNtyKfsP7z3QXBReWB5
         oGPJmEUModZLFKzRpdhSfnMJkXawCtAjRvGcIgbYgWJfPBhNc1Bz5j80q+Q6CNVTdNzE
         ej6w==
X-Forwarded-Encrypted: i=1; AJvYcCVOzcbfbLE7OXFwXtR6mj0cLhzTDm5/V3tJyuin/Wni6RYy6UbBH/cPg4IdH0ThUgQOussVqHPP3Acd341e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Wjc8PYUnRf63Y37UCKeg/tQun91JjTms5iA6FjcofFVWQcs5
	SHXdv+r0oXMgXyfSsqDwEhIj5n84TJXezuHDLHJBazANfJubk1qSCSUlEuBsxYTE6z0=
X-Gm-Gg: ASbGncu+dktFyDRWimm0h/ZxaZAWomNrQNixKCxUnYvX4rmHEKWWvvaRQRhNfWCmBV+
	nwua8QohwxDxBNt7wTQg9awtcyeoCwxgfSYpNunwMod5NwrGYL8w44z0IPdCAqpzpSwS2QFJQt8
	B+uvq/zSrhMEu00O7vNbGMJFiKjN52zG3QvwaTpQQzclqogi46CWYgxJj+ex4mhIruPUOfFWRO5
	6LoowoXnOFTpNjLPViN9/5vzTf8e26r0Ak3/zvyMdNVy+7vT2/yOmZhtNyYAfBMIP3rgoqo57MI
	ubL74vmNju47e2kmxL7jb/AVDKv5WDxxuK/jVbtvqWtfH8TFo2qgH3NrGbkhnHE8qR7OVPvx2Os
	+RYo1e/H8k1AUoO4yQyiDYxngqxp8xJYyckDwPmGNEwpWM6i7UdM5a+/L809nC4zbFba/UoK9Ed
	UnB0/Mc9kynSocFysZT9imx6d6IS96Nl7LYAQDuPx6mGQMMiVXKs7BaTWL+Ytyq78=
X-Google-Smtp-Source: AGHT+IGzFITX5AHreOCkeOY6BVksP8l8VgjlqPPE8PLLhLKRFkxyTw9uZc0n1AjDE0j++FPJT7Bvkg==
X-Received: by 2002:a05:6000:1889:b0:42b:47da:c316 with SMTP id ffacd0b85a97d-42f7318763amr5947412f8f.26.1764843182842;
        Thu, 04 Dec 2025 02:13:02 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d3319ccsm2241938f8f.34.2025.12.04.02.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 02:13:02 -0800 (PST)
Message-ID: <2025c0cc-9899-42ce-8550-a7b4742bc0ed@linaro.org>
Date: Thu, 4 Dec 2025 10:13:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and
 Samsung S5KJN1 camera sensor
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
 <20251204041505.131891-4-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204041505.131891-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 04:15, Vladimir Zapolskiy wrote:
> Add support of Samsung S5KJN1 camera sensor connected to CSIPHY3 over
> MIPI D-PHY interface.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 43 +++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index b2feac61a89f..f990e68c7a87 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -741,6 +741,49 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
>   
> +&camss {
> +	vdd-csiphy35-0p9-supply = <&vreg_l2i_0p88>;
> +	vdd-csiphy35-1p2-supply = <&vreg_l3i_1p2>;
> +	status = "okay";
> +
> +	ports {
> +		port@3 {
> +			csiphy3_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&cam_tele>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	sensor@56 {
> +		compatible = "samsung,s5kjn1";
> +		reg = <0x56>;
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam3_default>;
> +		pinctrl-names = "default";
> +		afvdd-supply = <&vreg_l7m_2p96>;
> +		vdda-supply = <&vreg_l4m_2p8>;
> +		vddd-supply = <&vreg_l2m_1p056>;
> +		vddio-supply = <&vreg_l3n_1p8>;
> +
> +		port {
> +			cam_tele: endpoint {
> +				link-frequencies = /bits/ 64 <700000000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +};
> +
>   &gpi_dma1 {
>   	status = "okay";
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

