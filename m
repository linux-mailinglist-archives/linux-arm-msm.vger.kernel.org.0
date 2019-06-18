Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC27B4AD58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 23:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbfFRV2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 17:28:11 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34706 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729196AbfFRV2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 17:28:11 -0400
Received: by mail-io1-f68.google.com with SMTP id k8so3133824iot.1;
        Tue, 18 Jun 2019 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eYcncqC3cdwmVt8XYAWxqjjlZ+I3NdDdHIwTbBvJXf0=;
        b=kz4TpxC5tGOLHbnbCJsDQx8GV6Q+Yl3uPF3Ks6d2/j0ahCpDCVKaEJHdppP9O+Uwyz
         2liomODsXHBnnKk3FXggd16axVxwO1cXfmz5sjT4Xft7GjAW1OcYiz/ksb0CvytWqLO9
         J1MBvySn/Fy0cwiRFYNJUNU+ifTF0wRPYj43p1eJcISqaafA2gglMNnLCDY56kV0fjR5
         hbsTNMnuJo2Gm53VuhYtQWd1jm2uTCI5V6mR76W5l+zhbjMk1EJ+Pb2IbuiBmfClkS9F
         OrqavcZUMajfFnsB1fTkkvIE9sjdy2PVJIaEyDDAz42SqqAMwdlZIOYGnGuE7R5csuEE
         2eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYcncqC3cdwmVt8XYAWxqjjlZ+I3NdDdHIwTbBvJXf0=;
        b=A6LLDnijl+5vXlwlJTmCwY5hLryWnSLAMTxI93VFaPyMvO8vgyWNk8o//QVjQSQxQg
         IvOdLFE/TlJR09Jb05Ej4nKFY1FlBVDO8TlxTWbYBTAMBYUmKN5Sai09sGXXfDEf6+e7
         VbW2hcM3L3hFoa7oI9Vyr4HiJx1TCCV+nf8NFylmYY4ZIc0jPcjQu6az7mJPhd7ZsY3i
         spJQPTSHrWr58yAMnTeOTKs3CrpqnOHPF4RorhTx3FGAuwZjlVzeE0Ow2oAcyLjKE2yu
         CI8rWDC8KBkcbyPnTRCLhwh2bpmBXMyBfdO6MZm80DuhRJ+xo+V1292/o7trgpcARfXG
         ZZEA==
X-Gm-Message-State: APjAAAX5DxPx/rBayzFjiWN/ixkt3R3xMYqI2hJVDVGLufUUQX6j3+Y4
        fEZ2VHm5g1Zd6rtihCqiVhVA2Unk03ziEFRBDO97WQ==
X-Google-Smtp-Source: APXvYqylOXJ57s+0hykOjGRhpkaLrOa9cnkyLb1CI8MOAuJiIUSnLNeeTdrCcOHJXt+ZxI0V7BzSNrRCHdpGhKzPVH8=
X-Received: by 2002:a6b:1494:: with SMTP id 142mr84072188iou.72.1560893290187;
 Tue, 18 Jun 2019 14:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190618211945.27431-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190618211945.27431-1-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 18 Jun 2019 15:27:58 -0600
Message-ID: <CAOCk7Nq7X=3LdzQF83J1QDRnrQtWmjRcySyLZ-3M321HtHxHfg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add Dragonboard 845c
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 3:21 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> This adds an initial dts for the Dragonboard 845. Supported
> functionality includes Debug UART, UFS, USB-C (peripheral), USB-A
> (host), microSD-card and Bluetooth.
>
> Initializing the SMMU is clearing the mapping used for the splash screen
> framebuffer, which causes the board to reboot. This can be worked around
> using:
>
>   fastboot oem select-display-panel none
>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Tested-by: Vinod Koul <vkoul@kernel.org>
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v2:
> - Added copyright
> - Sorted gpio_keys and leds nodes
>
>  arch/arm64/boot/dts/qcom/Makefile          |   1 +
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 557 +++++++++++++++++++++
>  2 files changed, 558 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 21d548f02d39..b3fe72ff2955 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM) += msm8992-bullhead-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += msm8994-angler-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += msm8996-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += msm8998-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-4000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> new file mode 100644
> index 000000000000..71bd717a4251
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -0,0 +1,557 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sdm845.dtsi"
> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +
> +/ {
> +       model = "Thundercomm Dragonboard 845c";
> +       compatible = "thundercomm,db845c", "qcom,sdm845";

Is "thundercomm" a legal vendor prefix?

> +
> +       aliases {
> +               serial0 = &uart9;
> +               hsuart0 = &uart6;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       dc12v: dc12v-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "DC12V";
> +               regulator-min-microvolt = <12000000>;
> +               regulator-max-microvolt = <12000000>;
> +               regulator-always-on;
> +       };
> +
> +       gpio_keys {
> +               compatible = "gpio-keys";
> +               autorepeat;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&vol_up_pin_a>;
> +
> +               vol-up {
> +                       label = "Volume Up";
> +                       linux,code = <KEY_VOLUMEUP>;
> +                       gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               user4 {
> +                       label = "green:user4";
> +                       gpios = <&pm8998_gpio 13 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "panic-indicator";
> +                       default-state = "off";
> +               };
> +
> +               wlan {
> +                       label = "yellow:wlan";
> +                       gpios = <&pm8998_gpio 9 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "phy0tx";
> +                       default-state = "off";
> +               };
> +
> +               bt {
> +                       label = "blue:bt";
> +                       gpios = <&pm8998_gpio 5 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "bluetooth-power";
> +                       default-state = "off";
> +               };
> +       };
> +
> +       lt9611_1v8: lt9611-vdd18-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "LT9611_1V8";
> +
> +               vin-supply = <&vdc_5v>;
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +
> +               gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
> +       lt9611_3v3: lt9611-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "LT9611_3V3";
> +
> +               vin-supply = <&vdc_3v3>;
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               // TODO: make it possible to drive same GPIO from two clients
> +               // gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +               // enable-active-high;
> +       };
> +
> +       pcie0_1p05v: pcie-0-1p05v-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "PCIE0_1.05V";
> +
> +               vin-supply = <&vbat>;
> +               regulator-min-microvolt = <1050000>;
> +               regulator-max-microvolt = <1050000>;
> +
> +               // TODO: make it possible to drive same GPIO from two clients
> +               // gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +               // enable-active-high;
> +       };
> +
> +       pcie0_3p3v_dual: vldo-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VLDO_3V3";
> +
> +               vin-supply = <&vbat>;
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pcie0_pwren_state>;
> +       };
> +
> +       v5p0_hdmiout: v5p0-hdmiout-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "V5P0_HDMIOUT";
> +
> +               vin-supply = <&vdc_5v>;
> +               regulator-min-microvolt = <500000>;
> +               regulator-max-microvolt = <500000>;
> +
> +               // TODO: make it possible to drive same GPIO from two clients
> +               // gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +               // enable-active-high;
> +       };
> +
> +       vbat: vbat-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VBAT";
> +
> +               vin-supply = <&dc12v>;
> +               regulator-min-microvolt = <4200000>;
> +               regulator-max-microvolt = <4200000>;
> +               regulator-always-on;
> +       };
> +
> +       vbat_som: vbat-som-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VBAT_SOM";
> +
> +               vin-supply = <&dc12v>;
> +               regulator-min-microvolt = <4200000>;
> +               regulator-max-microvolt = <4200000>;
> +               regulator-always-on;
> +       };
> +
> +       vdc_3v3: vdc-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VDC_3V3";
> +               vin-supply = <&dc12v>;
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       vdc_5v: vdc-5v-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VDC_5V";
> +
> +               vin-supply = <&dc12v>;
> +               regulator-min-microvolt = <500000>;
> +               regulator-max-microvolt = <500000>;
> +               regulator-always-on;
> +       };
> +
> +       vreg_s4a_1p8: vreg-s4a-1p8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vreg_s4a_1p8";
> +
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +       };
> +
> +       vph_pwr: vph-pwr-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vph_pwr";
> +
> +               vin-supply = <&vbat_som>;
> +       };
> +};
> +
> +&adsp_pas {
> +       status = "okay";
> +
> +       firmware-name = "qcom/db845c/adsp.mdt";
> +};
> +
> +&apps_rsc {
> +       pm8998-rpmh-regulators {
> +               compatible = "qcom,pm8998-rpmh-regulators";
> +               qcom,pmic-id = "a";
> +               vdd-s1-supply = <&vph_pwr>;
> +               vdd-s2-supply = <&vph_pwr>;
> +               vdd-s3-supply = <&vph_pwr>;
> +               vdd-s4-supply = <&vph_pwr>;
> +               vdd-s5-supply = <&vph_pwr>;
> +               vdd-s6-supply = <&vph_pwr>;
> +               vdd-s7-supply = <&vph_pwr>;
> +               vdd-s8-supply = <&vph_pwr>;
> +               vdd-s9-supply = <&vph_pwr>;
> +               vdd-s10-supply = <&vph_pwr>;
> +               vdd-s11-supply = <&vph_pwr>;
> +               vdd-s12-supply = <&vph_pwr>;
> +               vdd-s13-supply = <&vph_pwr>;
> +               vdd-l1-l27-supply = <&vreg_s7a_1p025>;
> +               vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
> +               vdd-l3-l11-supply = <&vreg_s7a_1p025>;
> +               vdd-l4-l5-supply = <&vreg_s7a_1p025>;
> +               vdd-l6-supply = <&vph_pwr>;
> +               vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> +               vdd-l9-supply = <&vreg_bob>;
> +               vdd-l10-l23-l25-supply = <&vreg_bob>;
> +               vdd-l13-l19-l21-supply = <&vreg_bob>;
> +               vdd-l16-l28-supply = <&vreg_bob>;
> +               vdd-l18-l22-supply = <&vreg_bob>;
> +               vdd-l20-l24-supply = <&vreg_bob>;
> +               vdd-l26-supply = <&vreg_s3a_1p35>;
> +               vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
> +
> +               vreg_s3a_1p35: smps3 {
> +                       regulator-min-microvolt = <1352000>;
> +                       regulator-max-microvolt = <1352000>;
> +               };
> +
> +               vreg_s5a_2p04: smps5 {
> +                       regulator-min-microvolt = <1904000>;
> +                       regulator-max-microvolt = <2040000>;
> +               };
> +
> +               vreg_s7a_1p025: smps7 {
> +                       regulator-min-microvolt = <900000>;
> +                       regulator-max-microvolt = <1028000>;
> +               };
> +
> +               vreg_l1a_0p875: ldo1 {
> +                       regulator-min-microvolt = <880000>;
> +                       regulator-max-microvolt = <880000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l5a_0p8: ldo5 {
> +                       regulator-min-microvolt = <800000>;
> +                       regulator-max-microvolt = <800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l12a_1p8: ldo12 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l7a_1p8: ldo7 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l13a_2p95: ldo13 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <2960000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l17a_1p3: ldo17 {
> +                       regulator-min-microvolt = <1304000>;
> +                       regulator-max-microvolt = <1304000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l20a_2p95: ldo20 {
> +                       regulator-min-microvolt = <2960000>;
> +                       regulator-max-microvolt = <2968000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l21a_2p95: ldo21 {
> +                       regulator-min-microvolt = <2960000>;
> +                       regulator-max-microvolt = <2968000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l24a_3p075: ldo24 {
> +                       regulator-min-microvolt = <3088000>;
> +                       regulator-max-microvolt = <3088000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l25a_3p3: ldo25 {
> +                       regulator-min-microvolt = <3300000>;
> +                       regulator-max-microvolt = <3312000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l26a_1p2: ldo26 {
> +                       regulator-min-microvolt = <1200000>;
> +                       regulator-max-microvolt = <1200000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       pmi8998-rpmh-regulators {
> +               compatible = "qcom,pmi8998-rpmh-regulators";
> +               qcom,pmic-id = "b";
> +
> +               vdd-bob-supply = <&vph_pwr>;
> +
> +               vreg_bob: bob {
> +                       regulator-min-microvolt = <3312000>;
> +                       regulator-max-microvolt = <3600000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +                       regulator-allow-bypass;
> +               };
> +       };
> +};
> +
> +&cdsp_pas {
> +       status = "okay";
> +       firmware-name = "qcom/db845c/cdsp.mdt";
> +};
> +
> +&gcc {
> +       protected-clocks = <GCC_QSPI_CORE_CLK>,
> +                          <GCC_QSPI_CORE_CLK_SRC>,
> +                          <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
> +};
> +
> +&pm8998_gpio {
> +       vol_up_pin_a: vol-up-active {
> +               pins = "gpio6";
> +               function = "normal";
> +               input-enable;
> +               bias-pull-up;
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +       };
> +};
> +
> +&pm8998_pon {
> +       resin {
> +               compatible = "qcom,pm8941-resin";
> +               interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +               debounce = <15625>;
> +               bias-pull-up;
> +               linux,code = <KEY_VOLUMEDOWN>;
> +       };
> +};
> +
> +&qupv3_id_0 {
> +       status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +       status = "okay";
> +};
> +
> +&sdhc_2 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
> +
> +       vmmc-supply = <&vreg_l21a_2p95>;
> +       vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +       bus-width = <4>;
> +       cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
> +};
> +
> +&tlmm {
> +       pcie0_pwren_state: pcie0-pwren {
> +               pins = "gpio90";
> +               function = "gpio";
> +
> +               drive-strength = <2>;
> +               bias-disable;
> +       };
> +
> +       sdc2_default_state: sdc2-default {
> +               clk {
> +                       pins = "sdc2_clk";
> +                       bias-disable;
> +
> +                       /*
> +                        * It seems that mmc_test reports errors if drive
> +                        * strength is not 16 on clk, cmd, and data pins.
> +                        */
> +                       drive-strength = <16>;
> +               };
> +
> +               cmd {
> +                       pins = "sdc2_cmd";
> +                       bias-pull-up;
> +                       drive-strength = <10>;
> +               };
> +
> +               data {
> +                       pins = "sdc2_data";
> +                       bias-pull-up;
> +                       drive-strength = <10>;
> +               };
> +       };
> +
> +       sdc2_card_det_n: sd-card-det-n {
> +               pins = "gpio126";
> +               function = "gpio";
> +               bias-pull-up;
> +       };
> +};
> +
> +&uart6 {
> +       status = "okay";
> +
> +       bluetooth {
> +               compatible = "qcom,wcn3990-bt";
> +
> +               vddio-supply = <&vreg_s4a_1p8>;
> +               vddxo-supply = <&vreg_l7a_1p8>;
> +               vddrf-supply = <&vreg_l17a_1p3>;
> +               vddch0-supply = <&vreg_l25a_3p3>;
> +               max-speed = <3200000>;
> +       };
> +};
> +
> +&uart9 {
> +       status = "okay";
> +};
> +
> +&usb_1 {
> +       status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +       dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +       status = "okay";
> +
> +       vdd-supply = <&vreg_l1a_0p875>;
> +       vdda-pll-supply = <&vreg_l12a_1p8>;
> +       vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +
> +       qcom,imp-res-offset-value = <8>;
> +       qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> +       qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +       qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +};
> +
> +&usb_1_qmpphy {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vreg_l26a_1p2>;
> +       vdda-pll-supply = <&vreg_l1a_0p875>;
> +};
> +
> +&usb_2 {
> +       status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +       dr_mode = "host";
> +};
> +
> +&usb_2_hsphy {
> +       status = "okay";
> +
> +       vdd-supply = <&vreg_l1a_0p875>;
> +       vdda-pll-supply = <&vreg_l12a_1p8>;
> +       vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +
> +       qcom,imp-res-offset-value = <8>;
> +       qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
> +};
> +
> +&usb_2_qmpphy {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vreg_l26a_1p2>;
> +       vdda-pll-supply = <&vreg_l1a_0p875>;
> +};
> +
> +&ufs_mem_hc {
> +       status = "okay";
> +
> +       vcc-supply = <&vreg_l20a_2p95>;
> +       vcc-max-microamp = <800000>;
> +};
> +
> +&ufs_mem_phy {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vreg_l1a_0p875>;
> +       vdda-pll-supply = <&vreg_l26a_1p2>;
> +};
> +
> +&wifi {
> +       status = "okay";
> +
> +       vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +       vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +       vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +       vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +};
> +
> +/* PINCTRL - additions to nodes defined in sdm845.dtsi */
> +
> +&qup_uart6_default {
> +       pinmux {
> +               pins = "gpio45", "gpio46", "gpio47", "gpio48";
> +               function = "qup6";
> +       };
> +
> +       cts {
> +               pins = "gpio45";
> +               bias-disable;
> +       };
> +
> +       rts-tx {
> +               pins = "gpio46", "gpio47";
> +               drive-strength = <2>;
> +               bias-disable;
> +       };
> +
> +       rx {
> +               pins = "gpio48";
> +               bias-pull-up;
> +       };
> +};
> +
> +&qup_uart9_default {
> +       pinconf-tx {
> +               pins = "gpio4";
> +               drive-strength = <2>;
> +               bias-disable;
> +       };
> +
> +       pinconf-rx {
> +               pins = "gpio5";
> +               drive-strength = <2>;
> +               bias-pull-up;
> +       };
> +};
> --
> 2.18.0
>
