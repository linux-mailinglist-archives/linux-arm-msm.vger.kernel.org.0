Return-Path: <linux-arm-msm+bounces-73635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54865B58E0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CF211697DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 05:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3752BE051;
	Tue, 16 Sep 2025 05:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+CNLsA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CFC2417D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 05:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001660; cv=none; b=OuMms6FA4CkooEHoMq62hB7lMjLuvnxCeJwaS5DHGants1htzN/ZzXwEOT7xXk4KguQpGEg2g3coxVcl7YNrf74ec8FKkFv73DxbCVqjoKnvghE+as2KIPvaKpDBmr5JkvqOjXPZiWw8fwlaRlbBAkooQeMxGEd3zfD90X+oRVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001660; c=relaxed/simple;
	bh=+lsaphoMQuQ3s01hYSJIzZ3cMHaDBtWRUADgh8fqpKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQGZq7u+CaHy7van9n01YxnOQSLiuSDRicyX+ktCFMe+EGQsEha4ENeBrUCPHS6Zt1Y6HwZc0iJONlupCGccpsOHWeyFnbhiuoqyCGeF/Rc/cBMJn5L8TOJ3Wv1GhyYU9OUXHpFVYHNJ2gT0Vy+c72Zd0JVn4H9b33nQc+yzjgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+CNLsA6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b523fb676efso3579597a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001657; x=1758606457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3z1kIls+XLkqZ+rCu1kC1Wj9NHeh9KxgN0P8MgwWRLE=;
        b=T+CNLsA6IPfSd6D26BSu2ZeXSmp03o4mSi7chxuzdbURv5Hm7hWaQF3gkApwHcMntr
         b8pjB2bk/gV/ugFjJrgv9lpFE8J35HxVeowjARSL5U4K5qF8OpGQ81F4wMpyuw5YrvSi
         D8PxzRDu8LTF+r1jwFJjaz7Xa0NU/h1av+H0hqgxBk1YhoIJ5MSOIjpSOvX3S66lX2Jh
         TLaS238zogb4mQcXhrOeiN5Pae2Dj7OGpImQt2KXbEPQciI1MouZ125pFjtK2Wo2KxDh
         RJ8qCFQ+3rT5+CCGI2jNja5zfXxUs9pOIJPCvpDNpKzVyDbbAlW3XbG/mbIXEbF1WOXd
         5kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001657; x=1758606457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3z1kIls+XLkqZ+rCu1kC1Wj9NHeh9KxgN0P8MgwWRLE=;
        b=ZoOC4a8OoF9OBJMWAkYDLI+Pej6W5XgAzmbPUfiIAuD4yO6PBUni0nq77g90z0BFQz
         Fj3XWC8ul2spo6yLPc69usIl7CuSaVRRWtQ+2pciZ1XW38Z/5yjEUGQn+kMHNKJeLKaa
         7LfdhNvo8Y8M3vN/jkeM22LksMu1R9VZpM2KU1Rjwt71soq40nTqCm1B1BamPN5vTjEz
         wdJtLiz0MoztK83z68QZzccdiddqpT89ipUPQGkB4SZEwp7PR/rlo+lcfvE8qLhGefqT
         HpyJhVk1tGFRAq9eAjQxUdeCfcWwmC2Rfay2iI7g7KClxmFmP2D5n6ccSAOFWScVvnOy
         ZWyg==
X-Forwarded-Encrypted: i=1; AJvYcCW73xlMnPCG4PTtEuABpxTC0e98taP1uZ8hf2O5L21SwLdlqx20li06OBxdURCY8mNkQ9Vcd3igWNFb9ieC@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgnsdWK9ivmO0F9cJXqa8IDbl1hi5YP/jIKlL3oxVOrUiE6eU
	jFSo1qXdjSg/SBrAt0H08aeEjV86TO4H8trN5i0+2QaeDSWAYWkuoehh
X-Gm-Gg: ASbGncuLo1Q9WxCcszEklflCCE/LkEUQw3kIIgfKD6hbB0ekNgsAtWp3+dpv0jpvy5K
	GepM7IgNUScEf4y53PSpag/U/FDYeFEKt9AJIe64x9zFoCEAWX5c5nCOyojAouI7tvfXrHK7r8s
	RLMM/0MSZuAf+WUVTaR4UbJ07n31w6Cb0TuPfjJe9+j8Gjxhv0232Y9ZfcQqkaM7HLtF+5mxbgl
	AtFCQo2BbR8KQzWW/5JyOctXxwLpjT25ux9EMaAfXKVpzH2l9xh+M40FARF/XfPdqLoQFiK4pjx
	mxfv3AO3fTRxji4tLWNQDbP2kVPibE10cOeOBFOBQzJ0UU8uFtTdk49BBV7yMrJiL3138gmo8tE
	UOiJQvrzQW3P1r4+BB7CRIvi2mNsccFM5
X-Google-Smtp-Source: AGHT+IGxSPiGM/tTPVWQyrm1/2BC8WaFamiHb8GxojcLncFyrSY4eb0VUFQkEooDpjy31OtboyJztA==
X-Received: by 2002:a17:903:2ecc:b0:25c:e895:6a75 with SMTP id d9443c01a7336-25d260792damr180404015ad.28.1758001656782;
        Mon, 15 Sep 2025 22:47:36 -0700 (PDT)
Received: from [172.17.44.75] ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25d9c7e5b16sm118147875ad.87.2025.09.15.22.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 22:47:36 -0700 (PDT)
Message-ID: <98a92bff-db74-4b14-8a19-1171e60e87bd@gmail.com>
Date: Tue, 16 Sep 2025 11:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <f6kaau5sxgleuim7cgdw6hsvlwl73ye7emwjtrxwvtpl3pxsvr@frxbvtv6ixho>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <f6kaau5sxgleuim7cgdw6hsvlwl73ye7emwjtrxwvtpl3pxsvr@frxbvtv6ixho>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/25 19:56, Bjorn Andersson wrote:
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
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>
>> This series depend on the below patch changes
>> https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
> 
> This was merged August 11.
> 
>> https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/
> 
> This was merged December 27.
> 
>> https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t
> 
> This was merged July 16.
> 
> You just wasted 5 minutes of my time, tracking down the status of these
> dependencies. Don't list dependencies that are already in linux-next (or
> actual releases), or even better, only send patches once the
> dependencies has landed (or send them together with the dependencies).
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
> 
> If you look a little bit harder, you can see that all other entries in
> this file is sorted alphabetically.

Yes, Will sort it in v2 patch. 
> 
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>  
>>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-som.dtsi b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>> new file mode 100644
>> index 000000000000..1b9b2581af42
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>> @@ -0,0 +1,414 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> This is not the correct copyright statement.

Thanks for the review. 
I used above copyright since qcs615-ride.dts in the same platform tree already follows this format.
If you’d prefer me to switch to The Linux Foundation for consistency with older DTS files, I can respin the patch accordingly.
> 
>> + */
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include <dt-bindings/gpio/gpio.h>
> 
> Once is probably sufficient.

Yes, will update in v2 patch.
> 
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
> 
> I forget where we are on this, but is there no way you can describe this
> to be the vbus for the connector and have it be consumed and enabled
> properly?

Thanks for the comment. I followed the approach used in qcs615-ride.dts, where the VBUS regulator is defined as always-on.
I understand your point about describing it as the VBUS supply for the connector so that it can be consumed/enabled properly. I’ll need to test whether the USB controller/connector on this platform works correctly if I switch to the vbus-supply model instead of forcing it on.

If it works, I’ll update the patch in v2. If not, could you advise whether keeping the current style (as in qcs615-ride.dts) is acceptable for now?
> 
>> +	};
>> +
>> +	vreg_v3p3_can: regulator-v3p3-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v3p3-can";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> Why can't the MCP2515 driver enable these when it's needed?

They reflecting the always-on rails that are downstream from the
main DC/battery input, and the supplies always-on by design.
> 
>> +	};
>> +
>> +	vreg_v5p0_can: regulator-v5p0-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v5p0-can";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> Ditto

They reflecting the always-on rails that are downstream from the
main DC/battery input, and the supplies always-on by design.
> 
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
> 
> Are you 100% certain that you (in contrast to all other boards) are
> ready to enable LPM - and make it the default mode?
> 
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
> This is already specified in sm6150.dtsi, why repeat them here?
> 
> PS. This list is incomplete and needs to be corrected.

Thanks for pointing this out. I copied the clocks list here from an earlier reference, but you’re right — it’s already defined in sm6150.dtsi. Since I don’t need to override or extend it for this board, I’ll drop this block in v2.
> 
>> +};
>> +
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
>> new file mode 100644
>> index 000000000000..7500f051783f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> Fix this please.

Thanks for the review. 
I used above copyright since qcs615-ride.dts in the same platform tree already follows this format.
If you’d prefer me to switch to The Linux Foundation for consistency with older DTS files, I can respin the patch accordingly.
> 
> Regards,
> Bjorn
> 
>> + */
>> +/dts-v1/;
>> +
>> +#include "qcs615-som.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm QCS615 IQ 615 EVK";
>> +	compatible = "qcom,qcs615-iq-615-evk", "qcom,qcs615", "qcom,sm6150";
>> +	chassis-type = "embedded";
>> +
>> +	aliases {
>> +		mmc1 = &sdhc_2;
>> +	};
>> +};
>> +
>> +&pon_pwrkey {
>> +	status = "okay";
>> +};
>> +
>> +&pon_resin {
>> +	linux,code = <KEY_VOLUMEDOWN>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&sdhc_2 {
>> +	pinctrl-0 = <&sdc2_state_on>;
>> +	pinctrl-1 = <&sdc2_state_off>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	bus-width = <4>;
>> +	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>> +
>> +	vmmc-supply = <&vreg_l10a>;
>> +	vqmmc-supply = <&vreg_s4a>;
>> +
>> +	status = "okay";
>> +};
>> -- 
>> 2.34.1
>>


