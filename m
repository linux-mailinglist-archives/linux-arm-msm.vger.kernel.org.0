Return-Path: <linux-arm-msm+bounces-35103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B89A4E5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AAE8285DF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 13:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5408B2B9A1;
	Sat, 19 Oct 2024 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kw/Lqr5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA6C153
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729345699; cv=none; b=eI1wm4mDyOyf9Gz5eNWCOCUrTukDTKoHJLAVd0z0y3WX9UcZQGVOauqdOWJf8CpaM7hIyZR3Ye8oy+qLpXwyIQrntR2k0BC/C5Ce6/pSRIneSVMytNdgyimzfI7FDTOpcC9gSKGuJW/iNUCthTdsSR76HOU9XbRzQudDUNl8/fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729345699; c=relaxed/simple;
	bh=4n4MDIGsB9Spnw3RFqAqbHVaogMhzkqd10PZBPMdCrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUOqEIsqRRqQr8Klyz+Viqb6liYPsgOOMcXgbecoUgNkaJv9YVp4GyHmJs23/vRMH+RlWhFCpXzpx78cPcil9M0MRdP2jJCpMLRehEpRlkHvUc8ezYCYXkc0p1KJwFTw378pF0yR0fH9tweyhh6p8lgVqCwF72hlnqiqSbzDTBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kw/Lqr5M; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so27302821fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729345694; x=1729950494; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZF+3PSfcTB2UDavtYip93HP4kFxDmgaXd2qMwKIPLX0=;
        b=kw/Lqr5Mr2v+mab+93UUjL62ZSatQKi1AvBjXI5kuEPKPuNiVQqBW9NOsLa5FHoGb3
         E1cgVHD7bc84Gv6jWmzqrLfCQaq3q/M1oCuGgES23ptrLZV9dnPMyL4lEHpcY+3K52WZ
         95QpLb6RKehFPyOzQbUP/Xug0KlQ98u8SEdfbrH4bdWH040xcHrGWNOcd07tsZ+dmjXj
         xxYbofUO9k0EY7Ljy6ki3ibP4mUelGyeWhZMOy3C4nne9H1l9wd2xChpx2GEAYvXNqP2
         41Xy7Ze1HcYPxLlYjmitMY0xiIDI29idYvVIYOaW0lJc8F/tpqU9SBhtaEyAYh1PFUMr
         Ir5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729345694; x=1729950494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF+3PSfcTB2UDavtYip93HP4kFxDmgaXd2qMwKIPLX0=;
        b=ghfMcY2NtQMhKqdlHh7R40Oo6A16owbdxG1MXakKWwfrCgJvSLu5J+MAFNB4StibXB
         uvfKjeZMcpYXWqs2VTxptCG0c2rlUR3OB6cNuwsJ7gfIsnDwsMDC4DXppaQCcHZ+bf/x
         KMfXs9G/Wwae5qxzwDFBlbJpGtWA1q9RYru8QLJLqEKVzGLSHzlrjqhhGk2+Cxg96Lbi
         5GH5XRM2qXpAL9Pv6M2hYr+juzhWVa11Iin02jxAzQXkxtBPtWWQ/Eu/4KOa69hCwOX9
         YAqAX37IJIqg7VV6vWVus3ljkjNxFkEJQMgjSuPbFj3A9nbXX85UfsvGvDBTsOJ08B6M
         bt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2cJmI0Ko+R2uBJjtqeyaW4/HiczslZxi0Zqqv/3O8O6g0z6jQ+hf9D3fYQp1q95BJEOWzcL0uZkhQI0cW@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUMNsXnzlH7vG0f7yEdabXHU5NHTjQ8EN+SfM/5qbJssQRC4n
	21dPu1Zuugu77SrKIbNL8S/+yzv2X8GsEoHupzfcoBMPy89gssKQynDWa2ZhILU=
X-Google-Smtp-Source: AGHT+IHZH0/QDC6nai6IqvI7l/SISX6Cr3HJY8vpF2UAC+FhTHL0xpnRDeU//bb+OlwsbM1uk2Yb9w==
X-Received: by 2002:a05:6512:6d1:b0:539:a2f5:2f1d with SMTP id 2adb3069b0e04-53a154afc13mr3133309e87.61.1729345693715;
        Sat, 19 Oct 2024 06:48:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b01a8sm534826e87.50.2024.10.19.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 06:48:12 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:48:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH RFC 14/14] arm64: dts: qcom: Add Xiaomi Redmi 5A
Message-ID: <pyr3t3kcpjj5zor226fwembjsbpp5zh7mpe2a3bqmwnbqccj7h@a55efscym3s7>
References: <20241019-msm8917-v1-0-f1f3ca1d88e5@mainlining.org>
 <20241019-msm8917-v1-14-f1f3ca1d88e5@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241019-msm8917-v1-14-f1f3ca1d88e5@mainlining.org>

On Sat, Oct 19, 2024 at 01:50:51PM +0200, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 5A (riva).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 295 +++++++++++++++++++++++
>  2 files changed, 296 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 065bb19481c16db2affd291826d420c83a89c52a..79add0e07d8a5f3362d70b0aaaaa9b8c48e31239 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -59,6 +59,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..7553f73603fc87797b0d424a2af6f2da65c90f5f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Barnabas Czeman
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
> +#include "msm8917.dtsi"
> +#include "pm8937.dtsi"
> +
> +/ {
> +	model = "Xiaomi Redmi 5A (riva)";
> +	compatible = "xiaomi,riva", "qcom,msm8917";
> +	chassis-type = "handset";
> +
> +	qcom,msm-id = <QCOM_ID_MSM8917 0>;
> +	qcom,board-id = <0x1000b 2>, <0x2000b 2>;

Is this required to boot?

> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +		charge-full-design-microamp-hours = <3000000>;
> +		energy-full-design-microwatt-hours = <11500000>;
> +		constant-charge-current-max-microamp = <1000000>;
> +		constant-charge-voltage-max-microvolt = <4400000>;
> +		precharge-current-microamp = <256000>;
> +		charge-term-current-microamp = <60000>;
> +		voltage-min-design-microvolt = <3400000>;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "framebuffer0";
> +
> +		framebuffer0: framebuffer@90001000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
> +			width = <720>;
> +			height = <1280>;
> +			stride = <(720 * 3)>;
> +			format = "r8g8b8";
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>,
> +				 <&gcc GCC_MDSS_MDP_CLK>,
> +				 <&gcc GCC_MDSS_BYTE0_CLK>,
> +				 <&gcc GCC_MDSS_PCLK0_CLK>,
> +				 <&gcc GCC_MDSS_ESC0_CLK>;
> +			power-domains = <&gcc MDSS_GDSC>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		key-volup {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		/delete-node/ reserved@85b00000;
> +		qseecom_mem: reserved@84a00000 {
> +			reg = <0x0 0x84a00000 0x0 0x1900000>;
> +			no-map;
> +		};
> +
> +		framebuffer_mem: memory@90001000 {
> +			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
> +			no-map;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {

regulator-vph-pwr, please

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&blsp_i2c3 {
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <65 0x2008>;
> +		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&pm8937_l10>;
> +		iovcc-supply = <&pm8937_l5>;
> +
> +		touchscreen-size-x = <720>;
> +		touchscreen-size-y = <1280>;
> +	};
> +};
> +
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	bq27426@55 {
> +		compatible = "ti,bq27426";
> +		reg = <0x55>;
> +		monitored-battery = <&battery>;
> +	};
> +
> +	bq25601@6b{
> +		compatible = "ti,bq25601";
> +		reg = <0x6b>;
> +		monitored-battery = <&battery>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <61 IRQ_TYPE_EDGE_FALLING>;
> +
> +		input-voltage-limit-microvolt = <4400000>;
> +		input-current-limit-microamp = <1000000>;
> +	};
> +};
> +
> +&pm8937_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};
> +
> +&pm8937_spmi_regulators {
> +	pm8937_s5: s5 {

Which regulator is this?

> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1350000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +

[..]

> +
> +&wcnss {
> +	vddpx-supply = <&pm8937_l5>;
> +	status = "okay";
> +

rogue empty line

> +};
> +
> +&wcnss_iris {
> +	compatible = "qcom,wcn3620";
> +	vddxo-supply = <&pm8937_l7>;
> +	vddrfa-supply = <&pm8937_l19>;
> +	vddpa-supply = <&pm8937_l9>;
> +	vdddig-supply = <&pm8937_l5>;
> +};
> +
> +&wcnss_mem {
> +	status = "okay";
> +};
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

