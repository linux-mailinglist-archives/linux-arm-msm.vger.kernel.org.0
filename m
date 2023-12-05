Return-Path: <linux-arm-msm+bounces-3436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 491058051DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B11281405
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA69056750;
	Tue,  5 Dec 2023 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Be41f6x4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53E09A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 03:17:18 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54cd8f5bb5cso2121810a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 03:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701775037; x=1702379837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bFWvbHdZ+yBWjkG2AjCOWgUeQFJsO6N0KpFAtG5kgs=;
        b=Be41f6x48JSYW40Nf+sf7VQmx2ksdDqrd/auftSDo6qYt9rI/nCKTELdIumiJFxfZx
         Fk9m6piQfiWC/wyJnkTFjQEN0NXLRWcDFqft/mqgywFzC4KnxM0z9G/tKbUMJP3mluyk
         NeUK2uCOI4cMpKbzKWdiRQfDPRJHI6gRbjyEnAcum0BNdGOcmibzwjRFyG4lSwQ15rNy
         BcfG6RPFvcronsd0X1hYtisZxk3s8SqOGEOH/BlnRAK7Tx71baqlTK1f7DPFJcVH4gN1
         vfpoThtPAJXofP0UNflMxmeiPGraklWHmMl1c/p4nf7tcayFy88iicVLQH3ijWn/N2xv
         153Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701775037; x=1702379837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bFWvbHdZ+yBWjkG2AjCOWgUeQFJsO6N0KpFAtG5kgs=;
        b=pJMq+CY84/lFG4HA3vY4v5ZrP+QevFFJuiFoeq6x/dTgUoIQ9TVQZ1RIOa8NPyd8ry
         TENUJ2jmv1QllnbHEMH5vN8+WV4IDSiRSem+9hpVqb7UzBCD588fXER5CVDcimm+cpYU
         gznVBKHqcupx+x/TYAPRINKkNVBp7FYvMW7uBDwm+JIC+QhAoJTsELfIO96Pv9zQ/XJm
         UBEEdQn4dd8Ct+PN3gYUUHsA6ppsc9MN6vksQt0si4bM85kP0Kl72z1O1+h8LVwDvvpi
         bT6533aPiZD1TJ3IURH49SQEQB9KLvfWumv5eJ0VmNcLxoDtxFrM2hMpYxna3H7WKIbj
         mP1Q==
X-Gm-Message-State: AOJu0Yw7hN4PVzKgR7Aercxagh0DK4sIAGJKXbY00PtYofOGigbJlOPo
	+RVBayDZKe0us2SOsiekJq2LYQ==
X-Google-Smtp-Source: AGHT+IFxEB0bUAN14B30xmG0RvzRxnAklPYvA45XIZ8ORyABH1tKv+IfQodqEJ35m4YFxPMADQHx5A==
X-Received: by 2002:a05:6402:5190:b0:54c:c744:da7e with SMTP id q16-20020a056402519000b0054cc744da7emr1929309edd.40.1701775037298;
        Tue, 05 Dec 2023 03:17:17 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id g21-20020aa7c595000000b0054b3d8e65d7sm935118edq.47.2023.12.05.03.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 03:17:16 -0800 (PST)
Message-ID: <1c62dd8b-72b2-4204-8284-a1dd90d4f909@linaro.org>
Date: Tue, 5 Dec 2023 12:17:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916/39-samsung-a2015: Add PMIC and
 charger
Content-Language: en-US
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jakob Hauser <jahau@rocketmail.com>,
 Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20231205093841.24325-1-raymondhackley@protonmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231205093841.24325-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2023 10:38, Raymond Hackley wrote:
> The phones listed below have Richtek RT5033 PMIC and charger.
> Add them to the device trees.
> 
> - Samsung Galaxy A3/A5/A7 2015
> - Samsung Galaxy E5/E7
> - Samsung Galaxy Grand Max
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>   .../qcom/msm8916-samsung-a2015-common.dtsi    | 59 +++++++++++++++++-
>   .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  6 ++
>   .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |  6 ++
>   .../qcom/msm8916-samsung-e2015-common.dtsi    |  6 ++
>   .../boot/dts/qcom/msm8916-samsung-e5.dts      |  6 ++
>   .../boot/dts/qcom/msm8916-samsung-e7.dts      |  7 +++
>   .../dts/qcom/msm8916-samsung-grandmax.dts     |  6 ++
>   .../boot/dts/qcom/msm8939-samsung-a7.dts      | 62 ++++++++++++++++++-
>   8 files changed, 156 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> index 2937495940ea..e6355e5e2177 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> @@ -28,6 +28,12 @@ tz-apps@85500000 {
>   		};
>   	};
>   
> +	battery: battery {
> +		compatible = "simple-battery";
> +		precharge-current-microamp = <450000>;
> +		precharge-upper-limit-microvolt = <3500000>;
> +	};
> +
>   	clk_pwm: pwm {
>   		compatible = "clk-pwm";
>   		#pwm-cells = <2>;
> @@ -128,6 +134,12 @@ muic: extcon@25 {
>   
>   			pinctrl-names = "default";
>   			pinctrl-0 = <&muic_int_default>;
> +
> +			usb_con: connector {
> +				compatible = "usb-b-connector";
> +				label = "micro-USB";
> +				type = "micro";
> +			};

It would be nice to break this up into individual patches

One patch for the battery, one patch for the usb-b-connector per device 
you are targetting.

More work but better practice to have more granular commits.


> +		regulators {
> +			rt5033_reg_safe_ldo: SAFE_LDO {
> +				regulator-min-microvolt = <4900000>;
> +				regulator-max-microvolt = <4900000>;
> +				regulator-always-on;
> +			};
> +
> +			/*
> +			 * Needed for camera, but not used yet.
> +			 * Define empty nodes to allow disabling the unused
> +			 * regulators.
> +			 */
> +			LDO {};
> +			BUCK {};
> +		};

Aren't the camera regulators off until enabled ?

---
bod


