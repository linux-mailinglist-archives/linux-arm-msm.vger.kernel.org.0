Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDEF616E1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 20:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbiKBT6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 15:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKBT6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 15:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1221036
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667419039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1GBqETIHeBRQQRDVGwUN6VbwWc/Wj9P3JX87LoZg1Z0=;
        b=T7xdre18IaUCJTDbW6n/OAKbDOn9xDTAVlV+RAYgJw7o1Op7kcSjWwPT26w47zseKriRGO
        PKWmWpOj5p7Z6Wpq+Cm+0TJ5lk0k+qJPoeVb+U/SRrtBwctB8d0TQMqP3PADAl0veq1Ypk
        WU5hlBUqqN787IBLCWq8+EJTnMQGU4Q=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-MTSW9Q9ZNemCBAvCRMQ79w-1; Wed, 02 Nov 2022 15:57:17 -0400
X-MC-Unique: MTSW9Q9ZNemCBAvCRMQ79w-1
Received: by mail-oi1-f197.google.com with SMTP id h129-20020acab787000000b00355945065aeso8382311oif.20
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 12:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GBqETIHeBRQQRDVGwUN6VbwWc/Wj9P3JX87LoZg1Z0=;
        b=2zHlfxoUtEvfkX2HKjRcYklV9oI6s8ZyHe/juyU1e+BoDK73lfHya5YWk+Z0x1iLJK
         E+CKSfSVz38/w1k1Pq6LDYGWs+v16fFY/ShCpeEv0aNXjq9Sx+ue+/1Ikr6tfsnjuGqJ
         SBz6yQT5sLOr49Xw6F/QJkl2gmA7jXg97MKJX0ifnIM5TvDw0vCO+32godumKzQnjfew
         ZvL1QJKMTnmc5vC1Vp+kkjBn30KM4AjgZPol1J2aquq1zPOC7Db8V+BfeVmI9VjyAagv
         dB7Q9dUQAr3xKB3yTHy5q7nSNAjwbDGuH+nJS7V4CXXCoBNIJR6hGux9BUvehn+xoFR4
         kLuA==
X-Gm-Message-State: ACrzQf0lzh3XCEGriOghEyjwNwBfM8z5QJzPA+JeLgv/slWXoEKd5pE/
        /+1zSuL4Iw9NQ4YfAM1/UowC1QhJ7NNwJSIAe3pBwAqz6/JgvVnTV0uaThE+s7v3NkXcXtnS/3q
        Y2zqjW/ZUMT3w026LA8FbwPrC1w==
X-Received: by 2002:a05:6808:14c5:b0:355:2938:d13e with SMTP id f5-20020a05680814c500b003552938d13emr22681623oiw.147.1667419036546;
        Wed, 02 Nov 2022 12:57:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66Td+6C3VQEBkO/uY1gqeJZF1l+0kqKbbOWppGydWDPkAyutm9lGNrD9jZcNMJQljAbp5Omg==
X-Received: by 2002:a05:6808:14c5:b0:355:2938:d13e with SMTP id f5-20020a05680814c500b003552938d13emr22681609oiw.147.1667419036292;
        Wed, 02 Nov 2022 12:57:16 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id v16-20020a05687105d000b00136cfb02a94sm6444754oan.7.2022.11.02.12.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:57:15 -0700 (PDT)
Date:   Wed, 2 Nov 2022 14:57:13 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Brian Masney <bmasney@redhat.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: add SA8540P ride(Qdrive-3)
Message-ID: <20221102195713.7x2weffekly5paaq@halaney-x13s>
References: <20221102103552.29388-1-quic_ppareek@quicinc.com>
 <20221102103552.29388-3-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102103552.29388-3-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 02, 2022 at 04:05:52PM +0530, Parikshit Pareek wrote:
> Introduce the Qualcomm SA8540P ride automotive platform, also known as
> Qdrive-3 development board.
> 
> This initial contribution supports SMP, CPUFreq, cluster idle, UFS, RPMh
> regulators, debug UART, PMICs, remoteprocs and USB.
> 
> The SA8540P ride contains four PM8450 PMICs. A separate DTSI file has
> been created for PMIC, so that it can be used for future SA8540P based
> boards.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Tested-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile         |   1 +
>  arch/arm64/boot/dts/qcom/pm8450a.dtsi     |  77 ++++++++
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 227 ++++++++++++++++++++++
>  3 files changed, 305 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8450a.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index b0558d3389e5..c89d44756791 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
> diff --git a/arch/arm64/boot/dts/qcom/pm8450a.dtsi b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
> new file mode 100644
> index 000000000000..34fc72896761
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Linaro Limited
> + */
> +
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pm8450a: pmic@0 {
> +		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> +		reg = <0x0 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8450a_gpios: gpio@c000 {
> +			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8450a_gpios 0 0 10>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pm8450c: pmic@4 {
> +		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> +		reg = <0x4 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8450c_gpios: gpio@c000 {
> +			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8450c_gpios 0 0 10>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pm8450e: pmic@8 {
> +		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> +		reg = <0x8 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8450e_gpios: gpio@c000 {
> +			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8450e_gpios 0 0 10>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pm8450g: pmic@c {
> +		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> +		reg = <0xc SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8450g_gpios: gpio@c000 {
> +			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8450g_gpios 0 0 10>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> new file mode 100644
> index 000000000000..b480b4927549
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sa8540p.dtsi"
> +#include "pm8450a.dtsi"
> +
> +/ {
> +	model = "Qualcomm SA8540P Ride";
> +	compatible = "qcom,sa8540p-ride", "qcom,sa8540p";
> +
> +	aliases {
> +		serial0 = &qup2_uart17;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&apps_rsc {
> +	pmm8540-a-regulators {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_l3a: ldo3 {
> +			regulator-name = "vreg_l3a";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1208000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5a: ldo5 {
> +			regulator-name = "vreg_l5a";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a: ldo7 {
> +			regulator-name = "vreg_l7a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a: ldo13 {
> +			regulator-name = "vreg_l13a";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	pmm8540-c-regulators {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vreg_l1c: ldo1 {
> +			regulator-name = "vreg_l1c";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c: ldo2 {
> +			regulator-name = "vreg_l2c";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c: ldo4 {
> +			regulator-name = "vreg_l4c";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1208000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c: ldo6 {
> +			regulator-name = "vreg_l6c";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l7c: ldo7 {
> +			regulator-name = "vreg_l7c";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17c: ldo17 {
> +			regulator-name = "vreg_l17c";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allowed-modes =
> +			    <RPMH_REGULATOR_MODE_LPM
> +			     RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +		};
> +	};
> +
> +	pmm8540-g-regulators {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "g";
> +
> +		vreg_l3g: ldo3 {
> +			regulator-name = "vreg_l3g";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7g: ldo7 {
> +			regulator-name = "vreg_l7g";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8g: ldo8 {
> +			regulator-name = "vreg_l8g";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&qup2 {
> +	status = "okay";
> +};
> +
> +&qup2_uart17 {
> +	compatible = "qcom,geni-debug-uart";
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sa8540p/adsp.mbn";
> +	status = "okay";

Is this actually on the SoC? I thought I had heard it was not.

> +};
> +
> +&remoteproc_nsp0 {
> +	firmware-name = "qcom/sa8540p/cdsp.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_nsp1 {
> +	firmware-name = "qcom/sa8540p/cdsp1.mbn";
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17c>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l6c>;
> +	vccq-max-microamp = <900000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l8g>;
> +	vdda-pll-supply = <&vreg_l3g>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0 {
> +	status = "okay";
> +};
> +
> +&usb_0_dwc3 {
> +	/* TODO: Define USB-C connector properly */

Is this really TODO? It seems like copy-pasta from other
dts's.

> +	dr_mode = "peripheral";
> +};
> +
> +&usb_0_hsphy {
> +	vdda-pll-supply = <&vreg_l5a>;
> +	vdda18-supply = <&vreg_l7a>;
> +	vdda33-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +	vdda-phy-supply = <&vreg_l3a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy0 {
> +	vdda-pll-supply = <&vreg_l5a>;
> +	vdda18-supply = <&vreg_l7g>;
> +	vdda33-supply = <&vreg_l13a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l3a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&xo_board_clk {
> +	clock-frequency = <38400000>;
> +};
> -- 
> 2.17.1
> 

