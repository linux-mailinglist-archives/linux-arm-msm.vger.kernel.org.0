Return-Path: <linux-arm-msm+bounces-72789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750AB4FE75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A8A43AA688
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1021C3203BE;
	Tue,  9 Sep 2025 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPSA3fko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467323F422
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426303; cv=none; b=J1As/edFrOG1+bWva9tcqEzUYbkU9htl85Y/f/pRefmcUyIPy0DSt0RBfyucU7RmpNG83W9cvfSqczhjKozcXvAsefVpeVdSVudH/DoZ2O4q7Ut6COXlqCD4+xREYzNr+V+njL24ulqc0esk5ykqYYNB459V3Pxl9qM/lv1QojY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426303; c=relaxed/simple;
	bh=PgEJ45UJtPICark1e/7RDZ5nOcozoYdm/Xxwlyoz9wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIqAchFXN2XBE/bY1MUrsx8wMW/XtbXnmCdK/d+D4gIN1s7+CBZ2oG60BpFm1w7O5gJLPbOA1D2KvytD5d8QmLSVRIW76UgvVnMifkUHRoJn3CNmRy/azYUClw7sk5Ejw2nHzQUagOvMbend0oBWc0BqIqSPokIng2q4hXwssJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPSA3fko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSS4011055
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 13:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4+Tyfry4n7jkL3G9X/UV2jFu
	N4hJLP4hnjij+SQIUAE=; b=aPSA3fkowUiN78w64fVKoplzyuEL8NI6dFfpJSFU
	XkDRxowuHBhmKazsSpn99zbi0wY0ual7eybtvoiOadxnLIJ9vJepN1JLS/+RsVRh
	ocAOCcBjnYTmBhqlyQ6DnyU4gkb5q8fjdGTlUYiZ14MaNc7uLCTKTERCfGOByn9l
	BpAko8UofnvhcDiQsGxtHNsp6xZ46eEIDcpk5JE0Ie/nvvjkACHZYQ86oQQZVNJ3
	yIHBW5ovvG/mu+nBaEZTb/hN8kF9aJGCUdfMPo7SYM78BTJZoLGahLx4d08SJX1H
	KhJCbAfp771kzq64VLSK1aeNiBRNqms0TkCO30Nr4x7dkw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0rdsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 13:58:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-71ff3e1256cso136303736d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 06:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426298; x=1758031098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+Tyfry4n7jkL3G9X/UV2jFuN4hJLP4hnjij+SQIUAE=;
        b=DeVVVMoBLEm/LLpSnpvNQWY5y/4vF8/kucJf4Kon3NS+DuOJmWuBIyvw6amd6GtFIa
         oJJryU8ZLms6LV3iEwoKdMNivp9QN0Bc4/pHQLyRot1bwfny5cXIZPntzCrKyC5ak5zB
         CKvtcrGYCGas224PPZMBRAD60i0T9YMPbuBubUjfByNU9fm6tTBHOtTQYLxwk/v557rr
         OiVOAfm8Sssm6ZKOvikrIjSS43Zy0CgsY6jaSLxVUDQK+TSOPj9+cHiYv9feezxXe4CJ
         2amguTVPD4yB7tgndjl5b2t0W5eoIepK/NMEY9+2/7thZ8dI80qJ8KCJbCQEu4kevdUR
         4DRA==
X-Forwarded-Encrypted: i=1; AJvYcCVXxDtepPazxwJaUlWOoDAQsgoC5nwIQfWVmwmxtLYUpvYB8HoEKKDk+Jd9NGpuxciezTv30x5nNZyZfzqy@vger.kernel.org
X-Gm-Message-State: AOJu0YzO93Asilj7VFRn7Z21wE2DiWZvw1ODHS03+fjHu9eSRpsNNRm1
	m6JvQgd7zytUg9nAgMn9rcZXVz4cFJ04Z8c/FoIkYykGnWoDtAsGzmJSG9OcVWxrvJAEJO/5+Ro
	bG/Lv98UKODr8gFqRZ21tP8HeaasfZWZdC+yjAoj1Ond/msyWzt3oiU/97RZ/BcVHEy61
X-Gm-Gg: ASbGncvW6z263NU8f+Veu7G/NxOUnl2YVhPFIotiEUS2Db2ok6GMTJSP5NR23hncEdo
	a0pz/8Zddyza7nQd7knPJdRbDq8AsKAXundZu8oZ58UfNAqBStYRfw/+8SynHteZLhM6hY1CiEo
	uSMCrEMVeQbdbhk9AS7bcsejncqOflPSK5OOTkXvAtpUsK6iQ0wpvb07VrAkrso4LsoC2Z2+sYn
	P7e9CA+qy5AYj0b7esoIjwOKQGEPtuccZpIUs550gWG2YDQ5zSfVEaYfWd51k/zBCnmz5VXpLio
	xwePYqeV4i1fXmS+dKnUJSRc6k9SS8AScEVwhcPy1sXq6p3e1iUwJBoJHLBMNWKsglyQdO9dvuY
	8fjyRuRSskvi7s12UQZnMGbtNjUKUcp8+zv7hMouz4CfSq8hVHcuh
X-Received: by 2002:a05:6214:f07:b0:70d:ea79:b37f with SMTP id 6a1803df08f44-73941de2a7fmr125677506d6.62.1757426298014;
        Tue, 09 Sep 2025 06:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcX3jzVhz2Tn8rXwi//XvzR6Rz7TztTKfLaewV2ZphZDbaA4o9z85uGfi3nAG22FDs+jJbwA==
X-Received: by 2002:a05:6214:f07:b0:70d:ea79:b37f with SMTP id 6a1803df08f44-73941de2a7fmr125676866d6.62.1757426297118;
        Tue, 09 Sep 2025 06:58:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c424fb2sm548204e87.11.2025.09.09.06.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:58:15 -0700 (PDT)
Date: Tue, 9 Sep 2025 16:58:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
Message-ID: <v2d4e6py34xb2hjrfnmlrmd7xme45equ76zb2c5cmftgylk7w6@5lmexwfupj4e>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909125255.1124824-2-tessolveupstream@gmail.com>
X-Proofpoint-ORIG-GUID: B0qrE2jpY5QuBnZkEx2Nr_3Z6T_fbNQ-
X-Proofpoint-GUID: B0qrE2jpY5QuBnZkEx2Nr_3Z6T_fbNQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxkRowmAtMW6M
 jI5iu9HXFO9kwnfyTKCcWO+bIvfv/k4YbXnTZ0dBCIRh7YuvNefOFolT15inv924hkWk2kO93MA
 avRRU/g90Ne8dBaZNC/hIVMRHjVEiQS7Tsg7zI+QJwvtvJ4n+F07aLPzs52N9s0zsOLo9fWB8Ll
 LPHU8YlE9wEygfJ4+7PeIn/623OfvGRTyIgkSjBLo492h76x9u0Nwej8srhwjQpaVTTgq1SiMdS
 frr3sQT0Quk7h/0/BSSBNWep8/Gy5qprQ4FhMAmc+6xeNABL/BB/f2w4vEolYSGtJFEEuUIXxjE
 8eeIo6+KLfYFzCV2fT7HOSwugTMENyecPDxIqrIzI1Fi6vysiEBcUXonzhTKBIMNVsdKl5annOe
 8irA7b4y
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c0327b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=4VVReye912hw2JQymqkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
> Introduce the device tree support for the QCS615-based talos-evk
> platform, which follows the SMARC (Smart Mobility ARChitecture)
> standard. The platform is composed of two main hardware
> components: the IQ-QCS615-SOM and the talos-evk carrier board.
> 
> The IQ-QCS615-SOM is a compact System on Module that integrates the
> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> SMARC standard, which defines a modular form factor allowing the SoM
> to be paired with different carrier boards for varied applications.
> 
> The talos-evk is one such carrier board, designed for evaluation
> and development purposes. It provides additional peripherals
> such as UART, USB, and other interfaces to enable rapid
> prototyping and hardware bring-up.
> 
> This initial device tree provides the basic configuration needed
> to boot the platform to a UART shell. Further patches will extend
> support for additional peripherals and subsystems.
> 
> The initial device tree includes basic support for:
> 
> - CPU and memory
> 
> - UART
> 
> - GPIOs
> 
> - Regulators
> 
> - PMIC
> 
> - Early console
> 
> - AT24MAC602 EEPROM
> 
> - MCP2515 SPI to CAN

No WiFi/BT/ethernet?

> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
> 
> This series depend on the below patch changes
> https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
> https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/

This has been merged 9 months ago. Why do you mention it here?

> https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t

This one has been picked up in June.

> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-som.dtsi | 414 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts   |  42 +++
>  3 files changed, 457 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs615-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a08..588dc55995c5 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -117,6 +117,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  
>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-som.dtsi b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
> new file mode 100644
> index 000000000000..1b9b2581af42
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi

talos-evk-som.dtsi?

> @@ -0,0 +1,414 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "sm6150.dtsi"
> +#include "pm8150.dtsi"
> +/ {
> +	aliases {
> +		mmc0 = &sdhc_1;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32764>;
> +			#clock-cells = <0>;
> +		};
> +
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB2_VBUS";
> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb2_en>;
> +		pinctrl-names = "default";
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v3p3_can: regulator-v3p3-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v3p3-can";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vreg_v5p0_can: regulator-v5p0-can {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg-v5p0-can";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_s3a: smps3 {
> +			regulator-name = "vreg_s3a";
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <650000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4a: smps4 {
> +			regulator-name = "vreg_s4a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1829000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5a: smps5 {
> +			regulator-name = "vreg_s5a";
> +			regulator-min-microvolt = <1896000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6a: smps6 {
> +			regulator-name = "vreg_s6a";
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1404000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1a: ldo1 {
> +			regulator-name = "vreg_l1a";
> +			regulator-min-microvolt = <488000>;
> +			regulator-max-microvolt = <852000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2a: ldo2 {
> +			regulator-name = "vreg_l2a";
> +			regulator-min-microvolt = <1650000>;
> +			regulator-max-microvolt = <3100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a: ldo3 {
> +			regulator-name = "vreg_l3a";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1248000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5a: ldo5 {
> +			regulator-name = "vreg_l5a";
> +			regulator-min-microvolt = <875000>;
> +			regulator-max-microvolt = <975000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a: ldo7 {
> +			regulator-name = "vreg_l7a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8a: ldo8 {
> +			regulator-name = "vreg_l8a";
> +			regulator-min-microvolt = <1150000>;
> +			regulator-max-microvolt = <1350000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10a: ldo10 {
> +			regulator-name = "vreg_l10a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11a: ldo11 {
> +			regulator-name = "vreg_l11a";
> +			regulator-min-microvolt = <1232000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12a: ldo12 {
> +			regulator-name = "vreg_l12a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1890000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a: ldo13 {
> +			regulator-name = "vreg_l13a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3230000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15a: ldo15 {
> +			regulator-name = "vreg_l15a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16a: ldo16 {
> +			regulator-name = "vreg_l16a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17a: ldo17 {
> +			regulator-name = "vreg_l17a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
> +		 <&rpmhcc RPMH_CXO_CLK_A>,
> +		 <&sleep_clk>;

Why do you need this?

> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	eeprom@57 {
> +		compatible = "atmel,24c02";
> +		reg = <0x57>;
> +		pagesize = <16>;
> +	};
> +
> +	eeprom@5f {
> +		compatible = "atmel,24mac602";
> +		reg = <0x5f>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&pcie {
> +	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&pm8150_gpios {
> +	usb2_en: usb2-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs615/adsp.mbn";
> +	status = "okay";

Empty line before status, please.

> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs615/cdsp.mbn";
> +	status = "okay";
> +};
> +
> +&rpmhcc {
> +	clocks = <&xo_board_clk>;

Why do you need this?

> +};
> +
> +&tlmm {
> +	pcie_default_state: pcie-default-state {
> +		clkreq-pins {
> +			pins = "gpio90";
> +			function = "pcie_clk_req";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio101";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio100";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&sdhc_1 {
> +	pinctrl-0 = <&sdc1_state_on>;
> +	pinctrl-1 = <&sdc1_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	vmmc-supply = <&vreg_l17a>;
> +	vqmmc-supply = <&vreg_s4a>;
> +
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	status = "okay";
> +};
> +
> +&spi6 {
> +	status = "okay";
> +
> +	mcp2515@0 {
> +		compatible = "microchip,mcp2515";
> +		reg = <0>;
> +		clock-frequency = <20000000>;
> +		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vreg_v3p3_can>;
> +		xceiver-supply = <&vreg_v5p0_can>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "host";

Is it actually the host-only interface?

> +};
> +
> +&usb_hsphy_2 {
> +	vdd-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";

And this one?

> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l17a>;
> +	vcc-max-microamp = <600000>;
> +	vccq2-supply = <&vreg_s4a>;
> +	vccq2-max-microamp = <600000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
> +&watchdog {
> +	clocks = <&sleep_clk>;

Why do you need this?

> +};

-- 
With best wishes
Dmitry

