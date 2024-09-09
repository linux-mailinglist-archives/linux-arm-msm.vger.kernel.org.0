Return-Path: <linux-arm-msm+bounces-31290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F299716DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B1E1C21A51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFDB1B3725;
	Mon,  9 Sep 2024 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOmJ4eCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768791AD410
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881374; cv=none; b=N/G1o0m7JXvrM5Lwdz5JNwn15OvLUq06lgdgKeuI9xgn6t6JztncWCPda9/d89RmSAoVz1uXjipECDQ1G38eJ5nJIQ3ntJ6RIXh4Mg2lF3pRFHYwxXor5EH9ik9AmhYcl3uaXolEOiGiLpemm/yFn0cNPIsuBEORkK6SFu1mFN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881374; c=relaxed/simple;
	bh=h9uvuHJtAEfett+JZRlDTHmYC+8YTREKfGVzpB/kOKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdXICT1ZC4DWT9oQfxv1O3UZFSAb1nz83kzPWloaV1c/2BxC1x/lbBhOA2t+MpDHVKXN8qHcSzjnP86xW0iZCYZwaLvJ8hYJt/Vv+gKxNoiuaeXK/0zs1osbRZt1XiRFIbwKy0d7FeX4becKArxd/+4WA84a/1HkRGDV2dFd/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOmJ4eCR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso493991066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725881371; x=1726486171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktNPaZ1KCv6Ld2rAfA4PfuySfO5io0j80rdw8Alh41g=;
        b=fOmJ4eCR1j1050JVUxneiRQ8wdwdfjgbxWwKVPKh8WCt+d81hG4X+uNdD2aXdG/RxN
         jqB3PLcha43bnr54oJDDrmFrbNIHEId3HRoSBExqdt90pzM3jL/+qYe5pxKCSWTilZb8
         ySlqK2BupvrA2WZSRSYdWGPtrd5Ed7f/oU5UQzWhIPLsgcbkJhJpxu0WI8xK0K4AaxvT
         q0DtOMqAn6g13ntPr9sjZv3ZV+179en0QPUlse8gUpltqYP3btvdFgEg4f7Ou1E+mEAT
         i+HcjEdX9GSWqnOklXixmThvVbDoHqPyU1aGPwz37e4TomVFzSZe0Q3y4UB2w68l776t
         YAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725881371; x=1726486171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktNPaZ1KCv6Ld2rAfA4PfuySfO5io0j80rdw8Alh41g=;
        b=ffR9EOt/OwNFy3T58OQhLv1wTKDIBipQyfOemEbukduC7lKMAY/w/MIiL1lHV7hNKp
         Spr4LzVkSDjE32UHzvuCRdDynRsKS3ktUfdUDy+hzeqmVgJadr+XqBPeS2zOYH6kLa9V
         CnFEZTJKOEo0G0HPbOjURMzUF035Sq8os3JcqMpS6KGvN4ATm20fIltqNnu6VYM7YQen
         JN3S7gYP6tYZZQ96NR/FM6lU7Bkx7DVUtKSlVmAfpSrzSYHA/UjGhFwNw17aB5nJ2UD0
         z87F7wObPk6c5dg6z9q3UeVyOsjavVO4ytghkMFqCGa/5Qq3sL41sTnkVnBWFBGephNz
         q/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqwqJCV7uYCvMSgcBTND6IybMMfWb6Wx65f6cg5C9fX2cbSDeLsBA1K5duCowOYlD1qaGUvFqHMR2Y922I@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEzwz7/DD96knrcMTGZoaGQTwHECk9YNOnY2fsvs5ArR8ogTQ
	ypcfzGZPSXSlV/tPJj//yk/wSGMusgmCyqvaQiEQZI8WlTZiLj6ISqqCkUZtY1E=
X-Google-Smtp-Source: AGHT+IHbyHiLLgCYAMG5Cp2xwyx3SxxsX41JowYhZLgV7ph6A6W/CyNOjt92TccFXBfzecj10YSGFg==
X-Received: by 2002:a17:907:5083:b0:a8a:926a:d024 with SMTP id a640c23a62f3a-a8a926ad4e4mr481677066b.26.1725881370683;
        Mon, 09 Sep 2024 04:29:30 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8db? ([2a02:8109:aa0d:be00::8db])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c61240sm327835766b.133.2024.09.09.04.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 04:29:30 -0700 (PDT)
Message-ID: <1932646a-b138-48f3-99bc-17354a773586@linaro.org>
Date: Mon, 9 Sep 2024 13:29:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: qcs6490-rb3gen2: Add node for
 qps615
Content-Language: en-US
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 cros-qcom-dts-watchers@chromium.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, quic_vbadigan@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240803-qps615-v2-0-9560b7c71369@quicinc.com>
 <20240803-qps615-v2-3-9560b7c71369@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240803-qps615-v2-3-9560b7c71369@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krishna,

On 03/08/2024 05:22, Krishna chaitanya chundru wrote:
> Add QPS615 PCIe switch node which has 3 downstream ports and in one
> downstream port two embedded ethernet devices are present.
> 
> Power to the QPS615 is supplied through two LDO regulators, controlled
> by two GPIOs, these are added as fixed regulators.
> 
> Add i2c device node which is used to configure the switch.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 121 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
>  2 files changed, 122 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0d45662b8028..59d209768636 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -202,6 +202,30 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-min-microvolt = <3700000>;
>  		regulator-max-microvolt = <3700000>;
>  	};
> +
> +	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_0P9";
> +		gpio = <&pm8350c_gpios 2 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <899400>;
> +		regulator-max-microvolt = <899400>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn_0p9_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <4300>;
> +	};
> +
> +	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_1P8";
> +		gpio = <&pm8350c_gpios 3 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn_1p8_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <10000>;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -595,6 +619,12 @@ lt9611_out: endpoint {
>  			};
>  		};
>  	};
> +
> +	qps615_switch: pcie-switch@77 {
> +		compatible = "qcom,qps615";
> +		reg = <0x77>;
> +		status = "okay";
> +	};
>  };
>  
>  &i2c1 {
> @@ -688,6 +718,75 @@ &pmk8350_rtc {
>  	status = "okay";
>  };
>  
> +&pcie1 {
> +	status = "okay";
> +};

Isn't it also necessary to configure the phy as well? It's also default
disabled and has two regulators.

Kind regards,
> +
> +&pcieport {
> +	pcie@0,0 {
> +		compatible = "pci1179,0623";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		device_type = "pci";
> +		ranges;
> +
> +		vddc-supply = <&vdd_ntn_0p9>;
> +		vdd18-supply = <&vdd_ntn_1p8>;
> +		vdd09-supply = <&vdd_ntn_0p9>;
> +		vddio1-supply = <&vdd_ntn_1p8>;
> +		vddio2-supply = <&vdd_ntn_1p8>;
> +		vddio18-supply = <&vdd_ntn_1p8>;
> +
> +		qcom,qps615-controller = <&qps615_switch>;
> +
> +		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
> +
> +		pcie@1,0 {
> +			reg = <0x20800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +		};
> +
> +		pcie@2,0 {
> +			reg = <0x21000 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +		};
> +
> +		pcie@3,0 {
> +			reg = <0x21800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			ranges;
> +
> +			pcie@0,0 {
> +				reg = <0x50000 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +
> +			pcie@0,1 {
> +				reg = <0x50100 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +		};
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -812,6 +911,28 @@ lt9611_rst_pin: lt9611-rst-state {
>  	};
>  };
>  
> +&pm8350c_gpios {
> +	ntn_0p9_en: ntn-0p9-en-state {
> +		pins = "gpio2";
> +		function = "normal";
> +
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +		power-source = <0>;
> +	};
> +
> +	ntn_1p8_en: ntn-1p8-en-state {
> +		pins = "gpio3";
> +		function = "normal";
> +
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +		power-source = <0>;
> +	};
> +};
> +
>  &tlmm {
>  	lt9611_irq_pin: lt9611-irq-state {
>  		pins = "gpio24";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3d8410683402..3840f056b7f2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2279,7 +2279,7 @@ pcie1: pcie@1c08000 {
>  
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcieport: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> 

-- 
// Caleb (they/them)

