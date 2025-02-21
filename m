Return-Path: <linux-arm-msm+bounces-48889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9571A3F697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 14:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381001889457
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 13:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D21D20D4E8;
	Fri, 21 Feb 2025 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqzNB9be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F9520A5DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740146112; cv=none; b=s64GYuWG478I9izmM2RuTuj8EQHfeTPml0CUS51YVYsDyIW3OrPtYmnjaxfg9kzFW/PE7Ye2uRdXsF0SKMy8KAbIlOoAB8Fy08U8/yGrrqOM7pa9CyP2Ton1fe+zt4ZljwC7SUhMbYOcdLNaeiJCrSPPasZ0TbAcH5XwYv9c3Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740146112; c=relaxed/simple;
	bh=HO7i7XxZkxelkKOIDkBkNovHj3SjDp4B3C/5v6f+hnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9Ht5tvHnIZkoKQMpOFCXodB7Z1mp763THdq+skIlT0dImr0FuGcHYjwfTVGcRrfHoco7P4iyZdK64oQosdsSUJ0EhvBOBWchIZrSuj5e8O5Ubpa1ATB+/BcNbmQ2nLnbKQlBURlj/U+RXSU+akAqcCF1BCZyNoIYvMCyGPCuP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqzNB9be; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a59so21606781fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 05:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740146108; x=1740750908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wNJiZKSoKPVlfFfRZ9OJ6JR74GVm4JTrMp+TJUPtiw=;
        b=OqzNB9beJMATa+jmK/3+y42ZLvQNd483fXxOjn8mae909RDFMGv+f5YSUU/6RbM/oQ
         RlIGUfcw7SSeo9cR48naWmpM4tWIcwISouhli1qgWygwPhZHGMQlTfgFu7mb0YXgf+wT
         wcSk5BS2TgE82tX9ybWd+RcvjWB/lhpxUpcUPuYKjhtGFT3p/yrL5NX7XWeXz0LtEJbU
         NDRbwunNMevnRNqcW1Bu/mB8b3JO9awcb2vrBkPqQf+kZSqmrymk+qIKqNFN93E3z/Mv
         N9Xo7yyWKK2r0sVHAn7pg4Mgnn8EjckACdbsyg1G16ABLN7TggyqGYE5U+bbTmNOeIyb
         EQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740146108; x=1740750908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wNJiZKSoKPVlfFfRZ9OJ6JR74GVm4JTrMp+TJUPtiw=;
        b=CJPSrY8HTH+9SGeWGE+g82sHj8byPzzxhmJaZZFAdHo+Ldl+ZFDXnyzX+QavPhYuXV
         9yqcPC9kgHTjukpRVJeXMEe85IklSCT/mNMT4wOInHnQ9uoG76EcnOf4jQ20Hw5y8QKj
         mlLGGtIia0W9ryRbo7Rlspx3I8yVgnQydJkZBMX+Jo2Cmb0DRXo0tUz2ehDNAuGCUt0p
         /vc/PQrwrs9d426lGS73ZMr582GSxUfi/1s/dz9mrnKX3HGVcp+mnFjWUZ0pMnBnpx7Y
         VFYJlSu3HY4txZySOjml1x9MyDTdzuQyCCn/r0Sd6+x6cJFYjcTWUEnhl5D5LsQzNmmp
         quLw==
X-Forwarded-Encrypted: i=1; AJvYcCVoKLKRtWijdMIeyLrfw+R+2vRMAxbHnJQc/HbzKpnwp7GJJetLSj7UPyYnzxelL0+p/5tRGqqeHLIphlrd@vger.kernel.org
X-Gm-Message-State: AOJu0YzhkwXCcHw4ni+G6boq8TLT8X0QHTMc2PBoPeDmnnVnnLiGNhFJ
	BGC23B9M5HkGA/+bLUHPUx9VNvwKcwsaVEz1n1vgB6CqSqxNG2C7bLibmat6KPs=
X-Gm-Gg: ASbGnctgtPBiUPugAiIQOLH/Zh6MVacKqfh9vhIAxl46qnlCGYXnudyPz8j+aSCR1aA
	eqpY0IAA0+tkuZooIFZz0Vhe6aXn+dFtXG45PMXrn24b+4Ix6W4pxGLorDKp/m1ry3VIrnM5e0x
	GSxNF1GSdwz7RNRNnbh/RvqDtMv6467wPFRmrcnA+q3kcOK8rExGuH9H3nceaqKNFksY6YaKlCy
	clmDIWdj5Ov6FJLDCWW12TxSZLLkQDDfe2tNt1LTisTuDCuUc04Q1kha8mY0ihgJfsvqI7FJH2r
	TiOlLBKqkrfWVRN29aWnlvdi9YrNyktX1IDctr0M52jtFGvgfaTd5fwuuIWLaEAOPSMLVQrJHJB
	gTgRAcw==
X-Google-Smtp-Source: AGHT+IEXHt9PwDCHU7/bbW2hfGATqtM9ttAqItuz3wSuFU98Zngu1NcXX829XFI2rQeO3C89Zh/YMA==
X-Received: by 2002:a05:6512:31c6:b0:545:c7d:1796 with SMTP id 2adb3069b0e04-54838f5be58mr1376208e87.43.1740146108161;
        Fri, 21 Feb 2025 05:55:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5453035f233sm2085404e87.215.2025.02.21.05.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 05:55:07 -0800 (PST)
Date: Fri, 21 Feb 2025 15:55:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org
Subject: Re: [RESEND PATCH v9 1/2] arm64: dts: qcom: qcs6490-rb3gen: add and
 enable BT node
Message-ID: <s36psuynvcak337thjcy6o532mvxrqogwutdinqodco6tzeebu@npaazdpl6qh3>
References: <20250220112945.3106086-1-quic_janathot@quicinc.com>
 <20250220112945.3106086-2-quic_janathot@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220112945.3106086-2-quic_janathot@quicinc.com>

On Thu, Feb 20, 2025 at 04:59:44PM +0530, Janaki Ramaiah Thota wrote:
> Add the PMU node for WCN6750 present on the qcs6490-rb3gen
> board and assign its power outputs to the Bluetooth module.
> 
> In WCN6750 module sw_ctrl and wifi-enable pins are handled
> in the wifi controller firmware. Therefore, it is not required
> to have those pins' entries in the PMU node.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 167 ++++++++++++++++++-
>  1 file changed, 166 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec..0a3243499dfb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  /dts-v1/;
> @@ -34,6 +34,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart5;
> +		serial1 = &uart7;
>  	};
>  
>  	chosen {
> @@ -218,6 +219,63 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-min-microvolt = <3700000>;
>  		regulator-max-microvolt = <3700000>;
>  	};
> +
> +	wcn6750-pmu {
> +		compatible = "qcom,wcn6750-pmu";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en>;

pinctrl-0
(pinctrl-1 etc.)
pinctrl-names


> +		vddaon-supply = <&vreg_s7b_0p972>;
> +		vddasd-supply = <&vreg_l11c_2p8>;
> +		vddpmu-supply = <&vreg_s7b_0p972>;
> +		vddrfa0p8-supply = <&vreg_s7b_0p972>;
> +		vddrfa1p2-supply = <&vreg_s8b_1p272>;
> +		vddrfa1p7-supply = <&vreg_s1b_1p872>;
> +		vddrfa2p2-supply = <&vreg_s1c_2p19>;
> +
> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p7: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p7";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -799,6 +857,39 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&qup_uart7_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	bias-bus-hold;
> +};
> +
> +&qup_uart7_rts {
> +	/* We'll drive RTS, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
> +&qup_uart7_rx {
> +	/*
> +	 * Configure a pull-up on RX. This is needed to avoid
> +	 * garbage data when the TX pin of the Bluetooth module is
> +	 * in tri-state (module powered off or not driving the
> +	 * signal yet).
> +	 */
> +	bias-pull-up;
> +};
> +
> +&qup_uart7_tx {
> +	/* We'll drive TX, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -842,12 +933,86 @@ &sdhc_2 {
>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> +
> +	bt_en: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +	};
> +
> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> +		pins = "gpio28";
> +		function = "gpio";
> +		/*
> +		 * Configure a bias-bus-hold on CTS to lower power
> +		 * usage when Bluetooth is turned off. Bus hold will
> +		 * maintain a low power state regardless of whether
> +		 * the Bluetooth module drives the pin in either
> +		 * direction or leaves the pin fully unpowered.
> +		 */
> +		bias-bus-hold;
> +	};
> +
> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> +		pins = "gpio29";
> +		function = "gpio";
> +		/*
> +		 * Configure pull-down on RTS. As RTS is active low
> +		 * signal, pull it low to indicate the BT SoC that it
> +		 * can wakeup the system anytime from suspend state by
> +		 * pulling RX low (by sending wakeup bytes).
> +		 */
> +		bias-pull-down;
> +	};
> +
> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		/*
> +		 * Configure a pull-up on RX. This is needed to avoid
> +		 * garbage data when the TX pin of the Bluetooth module
> +		 * is floating which may cause spurious wakeups.
> +		 */
> +		bias-pull-up;
> +	};
> +
> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> +		pins = "gpio30";
> +		function = "gpio";
> +		/*
> +		 * Configure pull-up on TX when it isn't actively driven
> +		 * to prevent BT SoC from receiving garbage during sleep.
> +		 */
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart5 {
>  	status = "okay";
>  };
>  
> +&uart7 {
> +	/delete-property/interrupts;

Missing space before 'interrupts'.

> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;

Align by the opening angle bracket.

> +	pinctrl-1 =  <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
> +		<&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;

Align '<' vertically.

> +	pinctrl-names = "default", "sleep";

Vertical list, please, aligned by the opening quote.

Also please add empty line before status.

> +	status = "okay";
> +
> +	bluetooth: bluetooth {
> +		compatible = "qcom,wcn6750-bt";
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		max-speed = <3200000>;
> +	};
> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
With best wishes
Dmitry

