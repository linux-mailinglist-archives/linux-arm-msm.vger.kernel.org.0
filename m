Return-Path: <linux-arm-msm+bounces-73637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF31FB58E1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 741142A6B68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 05:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1752DCF62;
	Tue, 16 Sep 2025 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1l0zY/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66E51E9B12
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001930; cv=none; b=Jh4Kc7kKR2ODvOFP7+wqfb+V6GTW+TBon6QwQC90ugqpkNGeks78+ynYFPA+1QuM9fVlzEPILULrN/QadIHb+L9zUn/ri65WX3iro1cRr2dQPQESI7xziTi7WHg+wQAfCTVLIFSm789IbehvkrAxbt+NPRlRnfxU28jYfgVcBMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001930; c=relaxed/simple;
	bh=B1oUZP8waaEIk7UTkyk/mKdtup1ZwGy+j1eXPDksBZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhScK9hLYUV0rY+2ksafF4CWyiZbVL5KpxQM4yo85i4RJ3TfCEN3un+lUko1bMJSJ0um3NC+RbLBuH/HEiB0m4nOJ8hXLlVygvOcqSw3j+Nt2Ijx7MLCUjI6FnDG9kAhEZ6ff5zadg/zO1KKgfcnXeIXcmLCjKZM1X3ygGGyHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1l0zY/p; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7724df82cabso5179560b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 22:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001928; x=1758606728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpZRIFoTAHmXmcz+RPeHFyLEepqUsFQgFiLuliI0yME=;
        b=U1l0zY/pNulIaXPUYgRXC8uk5Y3GmomIeSXuVMwrA/vjLwQ0sSYcmw/H0WYYrQNRu+
         BI92dXBBymItA8fr1XNQKEcoONJ5PJLmETBRevFtxQbkY53NgCcYYWYcQmDagwArajdE
         IOaLs6VKu1Bd41xuj83802zwMhLSc8RON5TSYD7hYPwASwksAx60r9/DLEOfVpFHSmSE
         INM4MLDn1FrCT6ldChByceEi4OPPq0O5uKMev5qdFnDHnzLZtNT1+vv+itHBqW146BGq
         xMIuz9oIfiK2rQEs2dhaKXO2Rw43e4F8rpFXgWEPgt4CpGKshX6EBLa+r4K1CV9nM9TI
         q9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001928; x=1758606728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpZRIFoTAHmXmcz+RPeHFyLEepqUsFQgFiLuliI0yME=;
        b=nXYlHgQVCdx9/jlMHNojVK1Llm+HdkHHLwm2d09AU5+IMUSG5a/UUnx8sdIotRNej3
         Be7p2NvU7RCC5a3xtdKc/REn8ZWD83fNhWfyTqyTsw0Uauj7pirPJOXtee8+UwPQW/LS
         sYnNTsfVo9J52KX78KXsjltpxgAOyAgzL9A7Zx42bPwiyBEE/JRHiJiMdKWGZM3G+CqP
         UJCU6HlXiVdEXfkHaYppgqroV8Pkxd1Bl4PM0ZLZney6PHG4RMDtfTjmgD9POl4RfVK8
         ihUT282HhMeTl1Zke6nO7qpsZBMU936r6q2XVry+3rAXOA/i7f2xtePHvbnVpszVY5cE
         tOHw==
X-Forwarded-Encrypted: i=1; AJvYcCU7R0SEDAzs/gNF7me5spYnPADLLZkBoGWjbHAFLFNwKUAkAYpMsT8qIZHWiDUGbT+9wKdQium14NJdu8a6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fvGciyOqLhqEJB4Iwq7dgHuCcu5ZVE8zFGfneMXK28TLaVef
	GQcZ8Wv1zctB5dFdnCCq5/e3L4r0xYsYUHbPwSZ/mi5bd17lIrrXmDPl
X-Gm-Gg: ASbGncsIR6Ta2JR9raXFD0mmnHyRDPwqkY6Pthc+IbBYFWhWT2rHZWDMrVIWiQ7XgXi
	syYn90NTYDhuvYoIVU8otf8hqJGm6kcY6v5g5W2tjhOpGprPX4RgZSe3fmo7UCdfqfcw7PYHcCz
	PfKg5F3LiJYqmtyfJ4lrbEHMwwfMVozH4ESqbz00J1Vs6HW2PYn6/wQw9b0q8Ba8T9i7Xw9lGch
	YhRp+nCL9zoKegs4m19G3fgL8TQH0xWWfy3RAgZfEv2AOZ2DzFKz7x3YfkX0LkmWyvh5qOBYqJU
	+qZPqL7rBBnF6XCRD5JS+w/CF5vAApa+9QePTxPrHHeqft1mr4tuhGa9j9e6MDHAqSde36+niYP
	+T6TjQUbK+id7d/WkR+xHAlBtZbl1b5qvK3tngzXMhUc=
X-Google-Smtp-Source: AGHT+IE/kLdbOgpWgBTLrdiu4noVgOkN/CCFxQ3NkHPaboe1sSNvoUGI3AbYiDUAH4rSbt5mulq2BQ==
X-Received: by 2002:a05:6a00:2307:b0:772:4b05:78c1 with SMTP id d2e1a72fcca58-77612079eeamr16347975b3a.3.1758001927877;
        Mon, 15 Sep 2025 22:52:07 -0700 (PDT)
Received: from [172.17.44.75] ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-776158bc82fsm11695898b3a.23.2025.09.15.22.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 22:52:07 -0700 (PDT)
Message-ID: <70c2f78b-c3ce-4b7b-a961-9f3957ce40f8@gmail.com>
Date: Tue, 16 Sep 2025 11:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <v2d4e6py34xb2hjrfnmlrmd7xme45equ76zb2c5cmftgylk7w6@5lmexwfupj4e>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <v2d4e6py34xb2hjrfnmlrmd7xme45equ76zb2c5cmftgylk7w6@5lmexwfupj4e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/09/25 19:28, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
>> Introduce the device tree support for the QCS615-based talos-evk
>> platform, which follows the SMARC (Smart Mobility ARChitecture)
>> standard. The platform is composed of two main hardware
>> components: the IQ-QCS615-SOM and the talos-evk carrier board.
>>
>> The IQ-QCS615-SOM is a compact System on Module that integrates the
>> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
>> SMARC standard, which defines a modular form factor allowing the SoM
>> to be paired with different carrier boards for varied applications.
>>
>> The talos-evk is one such carrier board, designed for evaluation
>> and development purposes. It provides additional peripherals
>> such as UART, USB, and other interfaces to enable rapid
>> prototyping and hardware bring-up.
>>
>> This initial device tree provides the basic configuration needed
>> to boot the platform to a UART shell. Further patches will extend
>> support for additional peripherals and subsystems.
>>
>> The initial device tree includes basic support for:
>>
>> - CPU and memory
>>
>> - UART
>>
>> - GPIOs
>>
>> - Regulators
>>
>> - PMIC
>>
>> - Early console
>>
>> - AT24MAC602 EEPROM
>>
>> - MCP2515 SPI to CAN
> 
> No WiFi/BT/ethernet?

Networking peripherals such as WiFi/BT and Ethernet will be enabled in follow-up patches.
> 
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>
>> This series depend on the below patch changes
>> https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
>> https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/
> 
> This has been merged 9 months ago. Why do you mention it here?
> 
>> https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t
> 
> This one has been picked up in June.
> 
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>  arch/arm64/boot/dts/qcom/qcs615-som.dtsi | 414 +++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts   |  42 +++
>>  3 files changed, 457 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4bfa926b6a08..588dc55995c5 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -117,6 +117,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>  
>>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-som.dtsi b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>> new file mode 100644
>> index 000000000000..1b9b2581af42
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
> 
> talos-evk-som.dtsi?

Ack, will rename it to talos-evk-som.dtsi, Thanks
> 
>> @@ -0,0 +1,414 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "sm6150.dtsi"
>> +#include "pm8150.dtsi"
>> +/ {
>> +	aliases {
>> +		mmc0 = &sdhc_1;
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	clocks {
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32764>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		xo_board_clk: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <38400000>;
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	regulator-usb2-vbus {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USB2_VBUS";
>> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&usb2_en>;
>> +		pinctrl-names = "default";
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_v3p3_can: regulator-v3p3-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v3p3-can";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_v5p0_can: regulator-v5p0-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v5p0-can";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +};
>> +
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pm8150-rpmh-regulators";
>> +		qcom,pmic-id = "a";
>> +
>> +		vreg_s3a: smps3 {
>> +			regulator-name = "vreg_s3a";
>> +			regulator-min-microvolt = <600000>;
>> +			regulator-max-microvolt = <650000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s4a: smps4 {
>> +			regulator-name = "vreg_s4a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1829000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s5a: smps5 {
>> +			regulator-name = "vreg_s5a";
>> +			regulator-min-microvolt = <1896000>;
>> +			regulator-max-microvolt = <2040000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s6a: smps6 {
>> +			regulator-name = "vreg_s6a";
>> +			regulator-min-microvolt = <1304000>;
>> +			regulator-max-microvolt = <1404000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l1a: ldo1 {
>> +			regulator-name = "vreg_l1a";
>> +			regulator-min-microvolt = <488000>;
>> +			regulator-max-microvolt = <852000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2a: ldo2 {
>> +			regulator-name = "vreg_l2a";
>> +			regulator-min-microvolt = <1650000>;
>> +			regulator-max-microvolt = <3100000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3a: ldo3 {
>> +			regulator-name = "vreg_l3a";
>> +			regulator-min-microvolt = <1000000>;
>> +			regulator-max-microvolt = <1248000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l5a: ldo5 {
>> +			regulator-name = "vreg_l5a";
>> +			regulator-min-microvolt = <875000>;
>> +			regulator-max-microvolt = <975000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7a: ldo7 {
>> +			regulator-name = "vreg_l7a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1900000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l8a: ldo8 {
>> +			regulator-name = "vreg_l8a";
>> +			regulator-min-microvolt = <1150000>;
>> +			regulator-max-microvolt = <1350000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l10a: ldo10 {
>> +			regulator-name = "vreg_l10a";
>> +			regulator-min-microvolt = <2950000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l11a: ldo11 {
>> +			regulator-name = "vreg_l11a";
>> +			regulator-min-microvolt = <1232000>;
>> +			regulator-max-microvolt = <1260000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l12a: ldo12 {
>> +			regulator-name = "vreg_l12a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1890000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l13a: ldo13 {
>> +			regulator-name = "vreg_l13a";
>> +			regulator-min-microvolt = <3000000>;
>> +			regulator-max-microvolt = <3230000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l15a: ldo15 {
>> +			regulator-name = "vreg_l15a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1904000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l16a: ldo16 {
>> +			regulator-name = "vreg_l16a";
>> +			regulator-min-microvolt = <3000000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l17a: ldo17 {
>> +			regulator-name = "vreg_l17a";
>> +			regulator-min-microvolt = <2950000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +};
>> +
>> +&gcc {
>> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +		 <&rpmhcc RPMH_CXO_CLK_A>,
>> +		 <&sleep_clk>;
> 
> Why do you need this?

This block is already present in sm6150.dtsi, will drop this in v2 patch.
> 
>> +};
>> +
>> +&i2c5 {
>> +	status = "okay";
>> +
>> +	eeprom@57 {
>> +		compatible = "atmel,24c02";
>> +		reg = <0x57>;
>> +		pagesize = <16>;
>> +	};
>> +
>> +	eeprom@5f {
>> +		compatible = "atmel,24mac602";
>> +		reg = <0x5f>;
>> +		pagesize = <16>;
>> +	};
>> +};
>> +
>> +&pcie {
>> +	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
>> +
>> +	pinctrl-0 = <&pcie_default_state>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie_phy {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pm8150_gpios {
>> +	usb2_en: usb2-en-state {
>> +		pins = "gpio10";
>> +		function = "normal";
>> +		output-enable;
>> +		power-source = <0>;
>> +	};
>> +};
>> +
>> +&qupv3_id_0 {
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/qcs615/adsp.mbn";
>> +	status = "okay";
> 
> Empty line before status, please.

Sure, will take care in v2 patch.
> 
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/qcs615/cdsp.mbn";
>> +	status = "okay";
>> +};
>> +
>> +&rpmhcc {
>> +	clocks = <&xo_board_clk>;
> 
> Why do you need this?

This block is already present in sm6150.dtsi, will drop this in v2 patch.
> 
>> +};
>> +
>> +&tlmm {
>> +	pcie_default_state: pcie-default-state {
>> +		clkreq-pins {
>> +			pins = "gpio90";
>> +			function = "pcie_clk_req";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-pins {
>> +			pins = "gpio101";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-down;
>> +		};
>> +
>> +		wake-pins {
>> +			pins = "gpio100";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +};
>> +
>> +&sdhc_1 {
>> +	pinctrl-0 = <&sdc1_state_on>;
>> +	pinctrl-1 = <&sdc1_state_off>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	bus-width = <8>;
>> +	mmc-ddr-1_8v;
>> +	mmc-hs200-1_8v;
>> +	mmc-hs400-1_8v;
>> +	mmc-hs400-enhanced-strobe;
>> +	vmmc-supply = <&vreg_l17a>;
>> +	vqmmc-supply = <&vreg_s4a>;
>> +
>> +	non-removable;
>> +	no-sd;
>> +	no-sdio;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&spi6 {
>> +	status = "okay";
>> +
>> +	mcp2515@0 {
>> +		compatible = "microchip,mcp2515";
>> +		reg = <0>;
>> +		clock-frequency = <20000000>;
>> +		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
>> +		spi-max-frequency = <10000000>;
>> +		vdd-supply = <&vreg_v3p3_can>;
>> +		xceiver-supply = <&vreg_v5p0_can>;
>> +	};
>> +};
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "host";
> 
> Is it actually the host-only interface?

Yes, It is host-only interface.
> 
>> +};
>> +
>> +&usb_hsphy_2 {
>> +	vdd-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_2 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_2_dwc3 {
>> +	dr_mode = "host";
> 
> And this one?

Yes, It is host-only interface.
> 
>> +};
>> +
>> +&ufs_mem_hc {
>> +	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
>> +	vcc-supply = <&vreg_l17a>;
>> +	vcc-max-microamp = <600000>;
>> +	vccq2-supply = <&vreg_s4a>;
>> +	vccq2-max-microamp = <600000>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_phy {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&watchdog {
>> +	clocks = <&sleep_clk>;
> 
> Why do you need this?

This block is already present in sm6150.dtsi, will drop this in v2 patch.
> 
>> +};
> 


