Return-Path: <linux-arm-msm+bounces-77463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B7BE0568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85E3D3A4B0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7272D3ECA;
	Wed, 15 Oct 2025 19:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xyvg51jg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1E11FF1B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555727; cv=none; b=TQQ5fGR3m5jXiaIrcV5Mw2Fdih7a2Ai8BOyhfchjYo0FE18hn45rwEsNUaxcQdgtcVARmfPr+IlEsDJPPOc8r6BJIIkmqOLX1P3kR3akwSX/N/OkbGekFgKjTulMShKSMRLTZKnODOacr4uuCJdK1l8k+CzxK9zhqGTgPxZjpEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555727; c=relaxed/simple;
	bh=N4ajDePlS/twOJgwxncquwTj2rTsemHlCNgU1E+c+Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3VF+8WNYnzvOOy7IuatgkaYpd06vH0+9GM0w8BnlLy2jgzE9ixJYou3z7OtNeN9C/BouPOI5S0oQc4OeLoBmvkZeEZfSS0dwj6GgAcKAxbhJzV6wM/ROWrLqifbxDi4oZ/RSyjM7BNCNRq31IA9zzN6xjlJU+gzNEjQ5w0CGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xyvg51jg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-58af7f8b8b3so1032305e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760555723; x=1761160523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYMPELcVaISMPo8LK5uoTYd/MIXJATV+1x3V+joTCO4=;
        b=xyvg51jgOOyzchSw1IdQNDtfVeoTDkxmFmbEjFz5CKmP8+FA/EWflm5HPLca64UO4K
         aM7nSgNddZ9KBj+9VzIafyIMwBZLvUosHXzkDNZAI4lgMLjdTo2rEOoixn1ObTikKAl0
         iq5kGgAU83Uh6akxYSZeks7KRCpE8/6tWX5bdRvQQebbHF7DH90zw/1ZHqj2OMJjAoff
         3n7C8V31OgG+wk9OFN3wSIVMbDCpKW5EtZ40GyhyQlpmvtpSdVeN8mERDRUqNOBxf1bI
         HELnAFT71WLXaXTUkLB5f074xvHsdEZ+8ZCUbL4lkyz7VC7hTF80Pyh/aUwHcYPi5RNz
         Ab7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555723; x=1761160523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AYMPELcVaISMPo8LK5uoTYd/MIXJATV+1x3V+joTCO4=;
        b=Tt3ICcvJOMT0g/zWs4DCIaTO266S6DkNwtkXBCspMelCcHLzdlHtk4v1qwXPVA4PLX
         oJxjosMo3NsDbtnAeJNAVjzlMterHSGoqYFT3d6fcWbCVHeqOnzMmfptz/Z5BHgp+x52
         bbQiAcH0852vLGMplLC/nG9bjI52fpEndl6L+9/OIi8liw4kSbpcofVSFi5vRYTtHgd5
         Bbuzf5k/hCkIsBpxwu6eFR94hsslDY5G0O3jOov8bpfGttEzsQOd8YhA4s4m5M/oywdk
         7jzRXxcs/dVQzG4Zjm1NaUtj8CQLtQgqYfav1QM+aresZgUnc0g6OBiWhbfp0cXil5V/
         xM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWCO62Wqjr31IlW4o+M30WGPeY3YJZBRQHPqhJVD5d3cW20U301gnsdcLRnGlBCOLEDf3pOAbjjuGd4kfE@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPaEzmMHxw8zCO/XpdKO4m+PA7WtOHlYWKviI99LEG2KzcgH2
	DpurCLREFdj4zv5QtyR1L/VhwYo87AIO6sQ0UrFkl5sAvgkSe63q3tupHX9KdidGKtY=
X-Gm-Gg: ASbGncuFSCVXs2PGCKHOfYT7sgwAeIkZRTm0pPNA1jwQlLgTHG4ysO3iXJuiAM3IDu9
	DP3UhM5J4+7MN6FawX1qvliHTa4zIAFjYu0auOno1Pjv7IOS8ifbsU6fhxd8PHB/eORdy/Yvzxp
	HpV2fvq1j92yGjJHQHKCPzo062dZytTV1IcJLoaXZd8BOZJul3CKMtD0ztp8jMIRtmzl36fvKQ1
	CphHeiij8F+qKjsaGkx/Zu28Rjd/yDPuUuCmmnX7IEprwTuEodQ8swnCwiexDep+kC+3C5ca2NI
	ldgtngZ98XCi43WL5xcuLC+cmFFomhj+MEWSlKyijvSSS5/B1aVM5Veui0aX2HVwjF7GOuIZXq7
	aeAqGhY1YM+8ADdEsNWfeoKU7QnjyFEA5WwFKmIazbGMoSFOoKM2HPVrh82QVI2vntHUB4U2N4z
	/KsC6N5mkYtOWWuCL9fy0+9MAU
X-Google-Smtp-Source: AGHT+IFgzACMuHh1h6LF8dPmcEJiKNFPz6aoHpNx1WbuO3O96mp7uLNPRB6iBtFq+qytOvveTnYOOw==
X-Received: by 2002:a05:651c:1547:b0:36b:d9d2:7357 with SMTP id 38308e7fff4ca-37609c974damr44742481fa.1.1760555723317;
        Wed, 15 Oct 2025 12:15:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e7b8f8bsm49637231fa.25.2025.10.15.12.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:15:22 -0700 (PDT)
Message-ID: <ec23a3b2-fb50-4da7-8912-512b0a741ecf@linaro.org>
Date: Wed, 15 Oct 2025 22:15:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 16:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional

s/Introducing/Introduce

> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>

The first expected Signed-off-by tag shall be from the change author, and
it is not.

> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>   .../dts/qcom/monaco-evk-camera-imx577.dtso    | 96 +++++++++++++++++++
>   2 files changed, 100 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..4df3044639a4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -36,6 +36,10 @@ lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx5
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> +
> +monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> new file mode 100644
> index 000000000000..2237f0fc4a14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Year is missing.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l4a>;
> +	vdda-pll-supply = <&vreg_l5a>;
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
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_i2c0_default>;
> +	pinctrl-1 = <&cci1_i2c0_sleep>;
> +
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&expander2 1 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_cam1_2p8>;
> +

Please remove empty lines between individual properties.

> +		port {
> +			imx577_ep1: endpoint {
> +				clock-lanes = <7>;

Remove 'clock-lanes' property, first of all it is non-configurable,
and definitely it's hypothetical value can not be equal to '7'.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam1_default: cam1-default-state {
> +		mclk-pins {
> +			pins = "gpio68";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

I'd suggest to add a description of pins with MCLK function in a separate
change to the SoC specific .dtsi file. It will cover gpio67, gpio68, gpio74
and gpio69, so here it's a MCLK1 pin for instance.

> +
> +		ldo-avdd-pins {
> +			pins = "gpio74";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +};

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

