Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EADE62C352
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbiKPQBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiKPQB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:01:29 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F11151C01
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:01:24 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z18so27219173edb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIV75wNnCPbzwvH7ChYo7kSS0/eQ3KOW9AfeTJ6iGkc=;
        b=FrLLVNjTm4SqrVKr+XuSt7/T63gbvCEBLNffS8eurew5YXwp8dSbM6qWjPf2R+qRxM
         evhqVXYtbyvuc8I0qtzi/bzBHD5qLur7CxBuVV2R4JIR6BcIF+SuTh/tD/URKNRtY2JT
         RsFvGiiwBB2xNAkrhqYhKY22RB7+G6Nrh7p5MKs0FIkDP66B/uk7+YVB6EZ41dXSBlRY
         Yk2dd6krHNLkdefhgzPjPB2J83Qj/LGRW6Ps0l7b7WrZ1xWleCvldL7HQUkda4OYFJpM
         3rmZI7jn7JSa1+O/nZVwwOxvIz1Z/GfvqA4ldPmD5zywQfhC2XHC+0ckrsRang2p/Fp7
         DkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VIV75wNnCPbzwvH7ChYo7kSS0/eQ3KOW9AfeTJ6iGkc=;
        b=kjp6+V4Ai8lRN0dYPB4dM46hvn1IA9SwZ9wES7BO4Rf1Xrj+Bks4N8MnidL4XQvTyl
         cxnOywzcmWmJvlrnqm2JesOR4sgVOjflaJlapM2pgxPd0NkJz+E1wIlaAAPQa9XCOunF
         pBCvfOZrw31TdfzYx5IRjj6NqpMefxsPW/jaziQYWdPWO3QDhn+C9CZ2EhWRJo7DSbwv
         D+WrbWvjxGkIBtCiz+RNuefuZm0gUdHsO1FM+sPKClT20g9YGUmzJ7c7BfuiSF9kZ+wb
         Ri1CMWhWA7Gew4CcesWpc3mzC6s0gDXkIqnPRnyeptZAx1IsRKGRZVi6I+CDY58nsYGQ
         IaJA==
X-Gm-Message-State: ANoB5plPo0L5TMypGZnytX93j989tChFaTSkPjC49vpahIOuv1l2jL/k
        C9FdD/FNZvobdCwnXkd3gTgazQ==
X-Google-Smtp-Source: AA0mqf6BXOrEVM2K+Vd+t/gDm6LdCdIqqZ49jzDZrRXjHcilB7s2fKW+8tFqgFtUCZws1HXnb05rDQ==
X-Received: by 2002:aa7:c446:0:b0:468:74:9820 with SMTP id n6-20020aa7c446000000b0046800749820mr10284055edr.288.1668614482738;
        Wed, 16 Nov 2022 08:01:22 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id lv18-20020a170906bc9200b007415f8ffcbbsm7056799ejb.98.2022.11.16.08.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:01:22 -0800 (PST)
Message-ID: <df407bc1-63af-c188-3ae2-622641abcbf6@linaro.org>
Date:   Wed, 16 Nov 2022 17:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: add SA8540P ride(Qdrive-3)
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Brian Masney <bmasney@redhat.com>,
        Johan Hovold <johan@kernel.org>
References: <20221116154932.17127-1-quic_ppareek@quicinc.com>
 <20221116154932.17127-3-quic_ppareek@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116154932.17127-3-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 16:49, Parikshit Pareek wrote:
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
> Tested-by: Eric Chanudet <echanude@redhat.com>
> Reviewed-by: Eric Chanudet <echanude@redhat.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile         |   1 +
>   arch/arm64/boot/dts/qcom/pm8450a.dtsi     |  77 ++++++++
>   arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 219 ++++++++++++++++++++++
>   3 files changed, 297 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/pm8450a.dtsi
>   create mode 100644 arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index afe496a93f94..87a681f15643 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
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
> index 000000000000..5262a7cc7fcd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -0,0 +1,219 @@
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
> +	regulators-0 {
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
> +	regulators-1 {
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
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
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
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +		};
> +	};
> +
> +	regulators-2 {
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
These -microamp properties do not exist upstream.

With that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
