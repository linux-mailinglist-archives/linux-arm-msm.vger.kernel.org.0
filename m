Return-Path: <linux-arm-msm+bounces-26064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606993011E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 21:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76BE11C22730
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 19:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE0F3A1BA;
	Fri, 12 Jul 2024 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVtLZ6G4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE36D381A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720814012; cv=none; b=DTlfnrlNtqKf+bMPNRgCrhnu4sbSYcmrT4fqk0kElNEehXrazzbiSDjfNHx6sATkWtQMyXOE+qg2I7zHpDMyZHEy+ddaKMu2McdzBPk6P840OPBELx328OzyfH+64GZ+KuntEmsujknSTy8OdFYiIwcqv7Dv4SvzMepQ4uEILJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720814012; c=relaxed/simple;
	bh=StUJdV7TFg7NGKUMdDCwe2aGMaXQXh1UOAGwUqGnrkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I16vh9HKDLOfP8W8QiokfwSvFvzYjrTmCijXtsvho+eJJxgzsyFrSjZOYQRjyPdy1eJaXtQkqoazvb3rM6VEescekdATF2IzChnplmakl+/GeRJoNLp3SQ6WQZTwVWSThkWrqjFRD9Vp4DkT5dbyMze70X3Zyzzt5jOSJkB9NvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVtLZ6G4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-595856e2332so3058892a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 12:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720814009; x=1721418809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CD9Gf2WFD/32n/g3oQVjierG/CJPtNZszx3tKsXb1rc=;
        b=LVtLZ6G4KOHaaC2LmGk0n4LQn3QtScvHgY4BZzTL6DAMkIuldcqg+90wAJ7z20/YhS
         nbo9bWT5LAKZMCgUo+yGgfvujb0xUgYwXjOaC5T6aN92PjXV2XfG7v4gUenRDTsDJSQa
         KPSSMaZVRT31Y8rz/nEHH8W6SJ0e4iBzqcD3MvQOYmsapM8fRunpQeTW6BgBclLDv60T
         pRjlDvLkSVJJ/oDLhBDCQKYNqRjJ1JzOBD5tzbjmTQEdnU6Xhq77ZSSz4AnDCLYJ6s67
         c4WaQZwr4/+mVmAzrQQxnaEHhH7iRYT1cvNivH2ASTz7ruEEfqSYmwfRoyNMXjgkoYpt
         27aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720814009; x=1721418809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD9Gf2WFD/32n/g3oQVjierG/CJPtNZszx3tKsXb1rc=;
        b=XPfEnGWHuKsHnCoZSiD4o9AzhKP61qA5LrcZeTOBAYqQP/Qm/ZGOZxSbMXmHs3nEnw
         jlfT0uiyX7LhgjbX+/fSgLSsXt4UAsOiGLNV7vivPqEjBIBDvbptGUBkcbSb8UQT1ZzT
         YGAEEpo2QKApEETiorZB3NtTPu0bodt7T6o40Ga0qmBjGV/H14hQsdHM4rqA75Kisynt
         wLbwPDY6rLW2Ezjsf09R5P+mwn+OOdHRsO5CDz8uQi4nYYO5lC+HbNphmCltCR5BzbrE
         aHU7/a4hmB97YJelqC8yHSYqPuV7aDWYO0SS+TpvRitx3Gls5TpFNyflZFCKuzu2gj0V
         jQeQ==
X-Gm-Message-State: AOJu0YyDFSr2Nga9hJIz1pPxKWboFNxllCtWC8xAxoiGJt+/9dWyZ6r4
	KRmmzyIGJeVvQ+W8kHzgMuqzJaylIKttzADFoYo+KR1g8Fi1Xf8on0uovMP6mjM=
X-Google-Smtp-Source: AGHT+IGzHghaUPM+/bov9+aj6s70/HQdZmAWPCba2bpobclhNx22aZiNLnZzv0YAXaDzEBtl4s4OAA==
X-Received: by 2002:a17:906:2650:b0:a6f:5698:ab5b with SMTP id a640c23a62f3a-a780b6882camr908158566b.8.1720814008716;
        Fri, 12 Jul 2024 12:53:28 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a854592sm375063466b.146.2024.07.12.12.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 12:53:28 -0700 (PDT)
Message-ID: <2146ca56-6c2c-48a3-8e77-75aa04cb2b4c@linaro.org>
Date: Fri, 12 Jul 2024 21:53:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
To: Nikita Travkin <nikita@trvn.ru>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 =?UTF-8?B?QWRhbSBTxYJhYm/FhA==?= <asaillen@protonmail.com>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
 <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.07.2024 6:04 PM, Nikita Travkin wrote:
> From: Adam Słaboń <asaillen@protonmail.com>
> 
> This commit introduces multiple hardware variants of Lenovo Vibe K5.
> 
> - A6020a40 (msm8929-wingtech-wt82918hd)
> - A6020a46/A6020l36 (msm8939-wingtech-wt82918)
> - A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)
> 
> These devices are added with support for many features, notably:
> 
> - Basic features like USB, mmc/sd storage, wifi, buttons, leds;
> - Accelerometer;
> - Touchscreen;
> - Sound and modem.
> 
> Note that "HD" variant of K5 is based on msm8929 which is a lower bin
> of msm8939 SoC. A simple dtsi is added for this soc along with the new
> devices.
> 
> Unfortunately, despite the heavy similarities, the combination of minor
> differences between variants make them incompatible between each other.
> 
> Signed-off-by: Adam Słaboń <asaillen@protonmail.com>
> [Nikita: Minor cleanup, commit message]
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   3 +
>  .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
>  arch/arm64/boot/dts/qcom/msm8929.dtsi              |   5 +
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  16 ++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 254 +++++++++++++++++++++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  16 ++
>  6 files changed, 311 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index fd4c7c41ddc4..48ec781fa1d8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -58,10 +58,13 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
> new file mode 100644
> index 000000000000..f9a358e852f8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "msm8939-wingtech-wt82918.dtsi"
> +#include "msm8929.dtsi"
> +
> +/ {
> +	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
> +	compatible = "wingtech,wt82918hd", "qcom,msm8929";
> +	chassis-type = "handset";
> +};
> +
> +&touchscreen {
> +	touchscreen-size-x = <720>;
> +	touchscreen-size-y = <1280>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
> new file mode 100644
> index 000000000000..c3d1d1ace2f6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +&opp_table {

No way somebody called the gpu opp table "opp table"..

> +	/delete-node/ opp-550000000;

Looking at downstream, seems like there isn't a speedbin fuse for
this :(

[...]

> +
> +&blsp_i2c2 {
> +	status = "okay";
> +
> +	accelerometer@68 {
> +		compatible = "invensense,icm20608";
> +		reg = <0x68>;
> +
> +		pinctrl-0 = <&accelerometer_default>;
> +		pinctrl-names = "default";

interesting choice to stick pintrl before interrupts

> +
> +		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_FALLING>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +
> +		mount-matrix = "-1", "0", "0",
> +				"0", "1", "0",
> +				"0", "0", "1";
> +	};
> +};

[...]

> +&pm8916_mpps {
> +	pwm_out: mpp4-state {
> +		pins = "mpp4";
> +		function = "digital";
> +		power-source = <PM8916_MPP_VPH>;
> +		output-low;
> +		qcom,dtest = <1>;

I think you meant qcom,dtest-output

looks good otherwise

Konrad

