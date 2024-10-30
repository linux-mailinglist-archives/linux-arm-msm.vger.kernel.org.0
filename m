Return-Path: <linux-arm-msm+bounces-36418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F69B61D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292C81C2089B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317501E767D;
	Wed, 30 Oct 2024 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ustrsrEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE401E5000
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287759; cv=none; b=P1ZXrySeNE4u2vtVsSEzdMjlwpkk6MY6K/7F0OT8edbmMYw4CZHIbDXrx1rGiHB60VijGz/xOvXVSY83y5KUrKaPwV9I+q9jsyFjEonzVI64hq0PLxjHo8HxeShtaUebDmgInCUZ8geqMhiE5eTO/u4sV5TNJ8T7vDnRbnu1NMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287759; c=relaxed/simple;
	bh=Ok/ZgMhS3QqWbhoqGvYYxN0jmiHdH4h2aMc5rX14/RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dppVe2J56JhQTY2Iowz+Eyuz3h35QJsAOARiWqltJJbr1oKl9y5uLa7uB6VMcgkIcYuiGIENZwpOGkd+kSurhq+QrRM6vYYeE7/xSNrr7p8lr327PK4+7g83Wb6WkESqDk6jzPiSZjgKP5rihhrPGASecAAAcn7yWwX74If+nOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ustrsrEZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53b13eae3b3so852379e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 04:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287754; x=1730892554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOujfd/jy87aIKSPb/EWr7De3J+KJ9M7N5naEu8TlmM=;
        b=ustrsrEZfqFWhmG9DXsK3pMbUoDdprM4c9YgUkCKD9bXn4MkGKG12nJmjWgpIdSOZe
         /DMf4lIiu4yn1pdKrZ0k0cBouV7aXGqvaKQMDGuIkh/9QEN1ZK90hgjECCDixjbC4fPN
         tzkK9KtZDP0KOGFFwW/oY64GRWNN1y9DdVaTdaSkwIGBdOoR9Yjnq9qC/NZ88utanyOq
         3C5COZ9fneDqvZm+k82He1sRYmRIauPsERmAjHo0tboe4convuyAsf39Tqg5fk8mzUqO
         Ccw/mg+P+CzbFuxiSK1+P3ByNs823fyxfx6f4LyEiSFoNfElRDxBbSURQGESysHMW5nU
         o2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287754; x=1730892554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOujfd/jy87aIKSPb/EWr7De3J+KJ9M7N5naEu8TlmM=;
        b=JSSXKuBseXdKpu9++Sd68CqY+QZn7G7hec9sKo10k9+axqAlo0WVSdl3bFfmylsds3
         iaT/CSKJO2k8LLNZik7iM0HP2Kbw3WVrJYMS64BPnMSA5sll3RjYm8BpCNnNHw3iM3b8
         mib4cDYUiX+6pNkikDfWP+DG1z66ipakAKfdXkMObWwb3yvhTSBO7NMVPJ3S/KfU0p/Y
         8BpjaRZVyxeLfIKcgMoqKQznMGpwLN4vOKmAfWMPkCe+JwCqcumanzsmwy911FugzUaO
         EVIXxPwWAFMCOqjYDMmJH1twiNIztEYTQG7WZ0pg+lAE+Zao+MBiPjh919sZ5KELX6M5
         bsrw==
X-Forwarded-Encrypted: i=1; AJvYcCWewwcyVgbEF0oyCqy/B9JSaAL1ii5S+VSCJY5JulJVu6JT4e79CdpSjI7//okEB3KNVzJO6yHxmQ1VgHEf@vger.kernel.org
X-Gm-Message-State: AOJu0YwpV0OPTt10EnEMy0mamKr3sq4ufm0851ZmvO15Y1c/a4dfhoKh
	Xo6Kjz1gDmXLyeBIxlYV4nFGKt8aBt6ycn1nSw5Whc6e6BRyFBTlP6fHkod545o=
X-Google-Smtp-Source: AGHT+IEs+M3/oYcPjpUBi7NneafgUbQNOPFL1rEspdaMuGFpvZkF8vlz4NG+YG9NTMCNUDafH8g+Sw==
X-Received: by 2002:a05:6512:3b85:b0:539:e0e6:cf4d with SMTP id 2adb3069b0e04-53b34b3c2fbmr2092672e87.11.1730287753768;
        Wed, 30 Oct 2024 04:29:13 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d52e61sm224296e87.120.2024.10.30.04.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:29:13 -0700 (PDT)
Message-ID: <cce5f27d-912c-4386-babe-b963aa65deda@linaro.org>
Date: Wed, 30 Oct 2024 13:29:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-7-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241030105347.2117034-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/24 12:53, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 73 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sc7280.dtsi          | 33 +++++++++
>   3 files changed, 110 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index ac199f809b0d..186768f7c696 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -111,6 +111,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> new file mode 100644
> index 000000000000..cd3fe65fa971
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Camera Sensor overlay on top of rb3gen2 core kit.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&camcc {
> +	status = "okay";
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* The port index denotes CSIPHY id i.e. csiphy3 */
> +		port@3 {
> +			reg = <3>;
> +			csiphy3_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-1 = <&cam2_suspend>;
> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply  = <&vreg_l18b_1p8>;
> +
> +		port {
> +			imx577_ep: endpoint {
> +				clock-lanes = <7>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 690051708dec..8130c1374722 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5115,6 +5115,39 @@ tlmm: pinctrl@f100000 {
>   			gpio-ranges = <&tlmm 0 0 175>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam2_default: cam2-default-state {
> +				rst-pins {
> +					pins = "gpio78";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				mclk-pins {
> +					pins = "gpio67";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};

SoC-specific change of adding new pin functions into the platform dtsi
file shall be separated from the rest of the mezzanine board change,
send it as its own change, you may wish add all MCLK pins at once.

And the camera sensor reset "gpio" pin goes into the mezzanine specific
change.

> +
> +			cam2_suspend: cam2-suspend-state {
> +				rst-pins {
> +					pins = "gpio78";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					output-low;
> +				};
> +
> +				mclk-pins {
> +					pins = "gpio67";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +

Same as above.

>   			cci0_default: cci0-default-state {
>   				pins = "gpio69", "gpio70";
>   				function = "cci_i2c";

--
Best wishes,
Vladimir

