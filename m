Return-Path: <linux-arm-msm+bounces-86224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E901CD5C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B371300C376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628563164C7;
	Mon, 22 Dec 2025 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KRJhjtXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D912313285
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766402381; cv=none; b=jm1TKvpIe7sxLeskYakSKz2Xle1WeYoP1dfA+yHgD2sRHf+Lqkm5XHqxZ6so1SZW7JU1EHXM1Zy50ZeuoR6o5D5nkIJlf/9cRaxZNHI9LREKkJs766iePdBdCvI2cSkFfPZoTgTnTWmBCLCN4klGDzVhZRL4CPt+lPkZ/QfIFE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766402381; c=relaxed/simple;
	bh=NYySMlRB1fJNBjIZgFY+gQqMAE3gSi8WFM84eavaktQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dfk6v7bXhxwd5L40AInYWVEfmfLwdOpQ6nXthgmz5sN9IB2VApXPVk6piWb2WCvNBNGmFZ3aJjHSeLcOMAY332xTppXkv4M2h4D5y3fB6fEpMvS3QomXj/rMPJ1PenmyjWYSkdCkx9QWq47m/qPBJVcb8jdkjPfyds8k2QcAMXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KRJhjtXG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59474f1308cso261295e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766402376; x=1767007176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nCdSVdtRzhabw5OEkxzKxb9YUm3JF1zKMZaKA3BdGo=;
        b=KRJhjtXGkj8awhLFIZkPDoPUQ/JYNo4ux2GN0K1rTruCXdjlmmNp2NBmLolb5XR+j/
         kHxjOM494mOeIkApxuoO/O1XS7158ngk8P7+LXkE+BX+5QycKz5TLH0U89sxN2ne9/Vi
         1MjhvmwYgt/WrKlrOkDVYQhFbdsyVUr5oF5y9N0zOFA/cTn9Y88z5cu6kV39aA738sHv
         EevVYaqXdnMA8jxL/o0/OOJ2wuAvSjgT4858OOISiLMmDTKN2zX0T9EvJf5nuPJ2vx3C
         VoZV1hj+ZBHCn8KRgroQHao3ar9lDfNQwDlP0kruubcTSvsSCfluOce42N/kbqVUOIzs
         sASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766402376; x=1767007176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nCdSVdtRzhabw5OEkxzKxb9YUm3JF1zKMZaKA3BdGo=;
        b=A8S18FYHAkvc3a0L0s1172lO4nyHCQQX1gV/xMbTHIN2SpEPSoI90qPgYpFiinvHfU
         UosLi0cdarcC0cZNRzXvIksdiuqOyvHnyKtoiuV7ube6LbtyHQYB4jO56mhA50GzShMv
         FPbI8sTyj2txhwaYIrDdfLxP3g9BUAaNj40kaZwFMOgQVrN4F3pN6MsBHFM7ORBSve5Y
         RRIgACADzKULwM49lwabFFeplmsgLEw256Mw5Ifb2mgMlEwUWuJZdIHGppFvPfQ6qlpF
         R/eEivwyIY16j8smQoUXMmBco1morCTavCaTNfNTChu4EkotZyganNOJrRGJsESbyAEY
         zP3g==
X-Gm-Message-State: AOJu0YzFWvxIPvZpl/quVMvIjaNIc9ystB28ajtpSV/XUBAWgx6ylqwW
	L2ibxnaArJGmvjPJQhYRRwPw4v/fVEkqcHJCahStUH3HRKqHlpkFzdNJMwD01oFcuTE=
X-Gm-Gg: AY/fxX6ZCjRUtcy+UphBuRtoYJYjaFJetZEfZsbudH6MQ/Ecz8dVch0wd71Pap8Qw97
	1JpBfmzs5lXv5CLwl2e6S3iolkIR0hAI35GUt12TFybPk7J4wUrxDSY/KPusp8jewaOMFMqCvLv
	sp7FSPNPRTsGri13Kdk8tr2tTT+ne+8pq93AGysYKiXNseEcSgChgMvGbg3Entm9gizUyugaRXb
	CZcc1ZyHEHbo/PyHRhoFdEceQB6qIhgz0pkpCIv8myXtkAyuIRk6H+e8uSHz8mTbH4HNVmh7/OO
	8v8jgz6gr1hUG9xhvShNacFXQZWx2L9uKlljdgh1pOqdin3ExPRmBKu7SU+SJ4L1ug/cyEWATXa
	TeSxQpnu5YvfzHWT6YNQw4MJ1UXe2D5N5j8yZ4zxGeCsoOKDWsY7OW87hiyqgkpQGjdiiJaSNoo
	U0M0R1t0pu2G5/xEs55fBwpB90qoqtkmroUk1tujaaGgH4bwhRRUXrICXhPKW4lzp+Cg==
X-Google-Smtp-Source: AGHT+IFHwXMzFpo+8uZ8eDR6Lk00sHETgxWpEEajBWiAtPVohEtLXk0F+nt4In8Dh7Nww7AyT8N4jw==
X-Received: by 2002:a05:6512:3a84:b0:592:f383:3aad with SMTP id 2adb3069b0e04-59a17df4092mr2238574e87.8.1766402376164;
        Mon, 22 Dec 2025 03:19:36 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186280bcsm3119201e87.90.2025.12.22.03.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:19:35 -0800 (PST)
Message-ID: <cfb8f192-b327-4bb9-993e-a28184571712@linaro.org>
Date: Mon, 22 Dec 2025 13:19:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 10:44, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in talos-evk-camera.dtso, rather than
> modifying the base talos-evk.dts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile              |  2 +
>   arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 64 ++++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/talos.dtsi            | 21 +++++++++

Please split QCS615 MCLK definitions change into a separate commit.

>   3 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 60121f133078b2754f98e6f45a3db4031b478cc8..b1d85b1f4a94714f2a5c976d162482d70ae920f2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +talos-evk-camera-dtbs		:= talos-evk.dtb talos-evk-camera.dtbo
>   talos-evk-lvds-auo,g133han01-dtbs	:= talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..ae1a02295b4dc48212aad40980a329ff458fe69a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Please add a missing year of the change.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&vreg_l11a>;
> +	vdd-csiphy-1p8-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				clock-lanes = <7>;

Please remove 'clock-lanes' property.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;

Just one voltage supply?

> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ebb1807f0222c075d4207163ed4359a55616d903..3626312f138f2e8f1888eb6aa43fa474cdee884f 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1550,6 +1550,27 @@ tlmm: pinctrl@3100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				pins = "gpio28";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio29";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				pins = "gpio30";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +

Please add to the list another pad with MCLK function, which is GPIO31.

>   			cci_default: cci0-default-state {
>   				cci_i2c0_default: cci-i2c0-default-pins {
>   					/* SDA, SCL */
> 

-- 
Best wishes,
Vladimir

