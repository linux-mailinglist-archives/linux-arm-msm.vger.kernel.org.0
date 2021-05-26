Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6741390EEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 05:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhEZDlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 23:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbhEZDlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 23:41:02 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256ACC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 20:38:48 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so30716367otp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 20:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EmENd3afQMDFunIlFV+w6Ig5j1ODnmDqdx0qo1A2RIg=;
        b=Lub7tlHy4v2eSootNFur5xcImWfW0CFOlXd8kiOWsELAnWfKllhb7iKwczA+c6DMGe
         OdvrTkatQbYze4FyGpjYG9CsxWiTY64zENTDJNwdh9DfZxzf/RBUUR1h0Uuz9WXTCJnF
         sElFCRt1zLAGZNiYaUaSHAXZkk/2CHt3BLNsW8D23hx+xhE1AslFp/Zdo2qH5KVmwXQ+
         GXt/TJPpsyNd6tTWUfatAulCuzNXUytQ4a8Z04CtJp7J/+FpW78XiboIltjwgKUWaWki
         R7NE+Qh7Q0VPw4cARFCPi1Lrd1P7kYMqfn+QET/TYWv3cpbJvb+MKtoZrk9kMyD0R3Ky
         8tGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EmENd3afQMDFunIlFV+w6Ig5j1ODnmDqdx0qo1A2RIg=;
        b=CoShdJXPwA2P0BKkH5apOz0gx11gPwNfJxlTP+Ykrfpk5i+ttTjIvAg12y9l51hnUA
         ciQWZtXo9XSYWvbK8QQswRDtWjM65tir8uP1/iTnEu7odfieFUcpSllsZLN0pYzaPLOC
         jPjNWj+5SC4uCHOoTeALFC/HWiM+JCaLpfdLYEyoJDIeOVPCavIynUvArYLnXhJxo6pY
         0oGHfvgUOXp77cT/Og2sJPu4XoeuuTXMxk9Ft52kZMQnQjDpCU5+9K1ITsQgFyWd9kPZ
         2DpqGd4Y484ThFJCnP1x14M/4QXSbLDb8Q6978of/JedNfhG0kcqzeJJioCUgef5kSrb
         1Gig==
X-Gm-Message-State: AOAM532SDE+EUbIXu0cPM9xyPoxqs96PyeNk98RsC5KaWSpmTTuotX3U
        a7VUcEDddH9foMGQ9ir2weIEBw==
X-Google-Smtp-Source: ABdhPJzonFpb20GOwO/uuI9jdoqBGUjwgIOPc+DDmNcJQhKg3iQ2zUiNYnMKIqgbFKlMSwWPX72xXw==
X-Received: by 2002:a05:6830:164c:: with SMTP id h12mr695618otr.321.1622000326789;
        Tue, 25 May 2021 20:38:46 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y7sm4248222oto.60.2021.05.25.20.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 20:38:46 -0700 (PDT)
Date:   Tue, 25 May 2021 22:38:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add support for SONY Xperia X
 Performance / XZ / XZs (msm8996, Tone platform)
Message-ID: <YK3CxHZELSQzz4Dp@builder.lan>
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
 <20210525200246.118323-7-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525200246.118323-7-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 May 15:02 CDT 2021, Konrad Dybcio wrote:

> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Add support for following boards:
> 
> - Xperia X Performance (dora)
> - Xperia XZ (kagura)
> - Xperia XZs (keyaki)
> 
> They are all based on the SONY Tone platform and feature largely similar hardware
> with the most obvious differences being lack of USB-C and ToF sensor on Dora and
> different camera sensor on Keyaki.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>  .../msm8996-pmi8996-sony-xperia-tone-dora.dts |  11 +
>  ...sm8996-pmi8996-sony-xperia-tone-kagura.dts |  11 +
>  ...sm8996-pmi8996-sony-xperia-tone-keyaki.dts |  11 +
>  .../qcom/msm8996-sony-xperia-tone-dora.dts    |  27 +
>  .../qcom/msm8996-sony-xperia-tone-kagura.dts  |  15 +
>  .../qcom/msm8996-sony-xperia-tone-keyaki.dts  |  26 +
>  .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 980 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  12 +-
>  9 files changed, 1093 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index ca4a7819d2c4..d079dc33d833 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -25,6 +25,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-satsuki.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-sumire.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-suzuran.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-dora.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-kagura.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-keyaki.dtb

's' > 'p', please keep them sorted alphabetically.

That said, perhaps it would look better to move the "pmi8996" part later
in the name?

> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-pmi8996-sony-xperia-tone-dora.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-pmi8996-sony-xperia-tone-kagura.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-pmi8996-sony-xperia-tone-keyaki.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
> new file mode 100644
> index 000000000000..b57ea0824ea5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0

BSD license in all the files please.

> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include "msm8996-sony-xperia-tone-dora.dts"
> +#include "pmi8996.dtsi"
> +
> +/ {
> +	model = "Sony Xperia X Performance (PMI8996)";
> +};
> \ No newline at end of file
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> new file mode 100644
> index 000000000000..4644d5f9d1a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> @@ -0,0 +1,980 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@somainline.org>
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include "msm8996.dtsi"
> +#include "pm8994.dtsi"
> +#include "pmi8994.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/gpio-keys.h>

This seems to be unused for now.

> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> +
> +/delete-node/ &hdmi;
> +/delete-node/ &hdmi_phy;
> +/delete-node/ &mdp5_intf3_out;
> +/delete-node/ &slpi_region;
> +/delete-node/ &venus_region;
> +/delete-node/ &zap_shader_region;
> +
> +/ {
> +	qcom,msm-id = <246 0x30001>; /* MSM8996 V3.1 (Final) */
> +	qcom,pmic-id = <0x20009 0x2000a 0 0>; /* PM8994 + PMI8994 */
> +	qcom,board-id = <8 0>;
> +
> +	chosen {
> +		/*
> +		 * Due to an unknown-for-a-few-years regression,
> +		 * SDHCI only works on MSM8996 in PIO (lame) mode.
> +		 */
> +		bootargs = "sdhci.debug_quirks=0x40 sdhci.debug_quirks2=0x4 maxcpus=2";

What's up with maxcpus=2? Is this simply because the last 2 are really
really slow?

> +	};
> +
> +	reserved-memory {
> +		ramoops@a7f00000 {
> +			compatible = "ramoops";
> +			reg = <0 0xa7f00000 0 0x100000>;
> +			record-size = <0x20000>;
> +			console-size = <0x40000>;
> +			ftrace-size = <0x20000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +		};
> +
> +		cont_splash_mem: memory@83401000 {
> +			reg = <0 0x83401000 0 0x23ff000>;
> +			no-map;
> +		};
> +
> +		zap_shader_region: gpu@90400000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x90400000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		slpi_region: memory@90500000 {
> +			reg = <0 0x90500000 0 0xa00000>;
> +			no-map;
> +		};
> +
> +		venus_region: memory@90f00000 {
> +			reg = <0 0x90f00000 0 0x500000>;
> +			no-map;
> +		};
> +	};
> +
> +	panel_tvdd: tvdd-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_tvdd";
> +		gpio = <&tlmm 50 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&tp_vddio_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	usb3_id: usb3-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&tlmm 25 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_detect>;
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	wlan_en: wlan-en-1-8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan-en-regulator";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wl_reg_on>;
> +
> +		/* WLAN card specific delay */
> +		startup-delay-us = <70000>;
> +		enable-active-high;
> +	};
> +};
> +
> +&blsp1_i2c3 {
> +	status = "okay";
> +	clock-frequency = <355000>;
> +
> +	tof_sensor: vl53l0x@29 {
> +		compatible = "st,vl53l0x";
> +		reg = <0x29>;
> +	};
> +};
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&blsp2_i2c5 {
> +	status = "okay";
> +	clock-frequency = <355000>;
> +
> +	/* FUSB301 USB-C controller */
> +};
> +
> +&blsp2_i2c6 {
> +	status = "okay";
> +	clock-frequency = <355000>;
> +
> +	synaptics@2c {
> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x2c>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&panel_tvdd>;
> +
> +		syna,reset-delay-ms = <220>;
> +		syna,startup-delay-ms = <220>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		rmi4-f01@1 {
> +			reg = <0x1>;
> +			syna,nosleep-mode = <1>;
> +		};
> +
> +		rmi4-f11@11 {
> +			reg = <0x11>;
> +			syna,sensor-type = <1>;
> +		};
> +	};
> +};
> +
> +&blsp2_uart2 {
> +	status = "okay";
> +};
> +
> +&camera0_mclk {
> +	drive-strength = <2>;
> +	output-low;
> +};
> +
> +&camera0_pwdn {
> +	drive-strength = <2>;
> +	output-low;
> +};
> +
> +&camera0_rst {
> +	pins = "gpio30";
> +	drive-strength = <2>;
> +	output-low;
> +};
> +
> +&camera2_mclk {
> +	drive-strength = <2>;
> +	output-low;
> +};
> +
> +&camera2_rst {
> +	drive-strength = <2>;
> +	output-low;
> +};
> +
> +&CPU0 {
> +	cpu-supply = <&pmi8994_s11>;

Isn't this the supply to the CPU-subsystem-internal LDO that actually
feeds the CPU? Is there a benefit to describing this here?

> +};
> +
> +&CPU1 {
> +	cpu-supply = <&pmi8994_s11>;
> +};
> +
> +&CPU2 {
> +	cpu-supply = <&pmi8994_s11>;
> +};
> +
> +&CPU3 {
> +	cpu-supply = <&pmi8994_s11>;
> +};
> +
> +&hsusb_phy1 {
> +	status = "okay";
> +
> +	vdda-pll-supply = <&pm8994_l12>;
> +	vdda-phy-dpdm-supply = <&pm8994_l24>;
> +};
> +
> +&mmcc {
> +	vdd-gfx-supply = <&vdd_gfx>;
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +	perst-gpio = <&tlmm 35 GPIO_ACTIVE_LOW>;
> +	wake-gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +	vddpe-3v3-supply = <&wlan_en>;
> +	vdda-supply = <&pm8994_l28>;
> +};
> +
> +&pcie_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&pm8994_l28>;
> +	vdda-pll-supply = <&pm8994_l12>;
> +};
> +
> +&pm8994_gpios {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pm8994_gpio_1 &pm8994_vol_down_n &pm8994_vol_up_n
> +		     &pm8994_cam_snap_n &pm8994_cam_focus_n &pm8994_gpio_6
> +		     &pm8994_nfc_dload &pm8994_gpio_8 &pm8994_gpio_9
> +		     &pm8994_gpio_nfc_clk &pm8994_gpio_11 &pm8994_gpio_12
> +		     &pm8994_ear_en &pm8994_gpio_14 &pm8994_pm_divclk1
> +		     &pm8994_pmi_clk &pm8994_gpio_17 &pm8994_rome_sleep
> +		     &pm8994_gpio_19 &pm8994_gpio_22>;

Shouldn't several of these reference be done from the relevant nodes?

For the ones that isn't, and that you're not going to ever change I
think it would look better to have a single:

pm8994_gpios_defaults: default-state {
	nc {
		nc pins...
	};

	vol-up {
		...
	};

	...
};

> +
> +	gpio-line-names =
> +		"NC",
> +		"VOL_DOWN_N",
> +		"VOL_UP_N",
> +		"SNAPSHOT_N",
> +		"FOCUS_N",
> +		"NC",
> +		"NFC_VEN",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"EAR_EN",
> +		"NC",
> +		"PM_DIVCLK1",
> +		"PMI_CLK",
> +		"NC",
> +		"WL_SLEEP_CLK",
> +		"NC",
> +		"PMIC_SPON",
> +		"UIM_BATT_ALARM",
> +		"PMK_SLEEP_CLK";
> +
> +	pm8994_gpio_1: pm-gpio1-nc {
> +		pins = "gpio1";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		drive-push-pull;
> +		bias-high-impedance;
> +	};
> +
> +	pm8994_vol_down_n: vol-down-n {
> +		pins = "gpio2";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		drive-push-pull;
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +		power-source = <PM8994_GPIO_S4>;
> +	};
> +
[..]
> +/*
> + * For reasons that are currently unknown
> + * (but probably related to fusb301), USB
> + * takes about 6 minutes to wake up (nothing
> + * interesting in kernel logs), but then it
> + * works as it should.

This is funny (but please make it ~80 chars wide).

Regards,
Bjorn

> + */
> +&usb3 {
> +	status = "okay";
> +	qcom,select-utmi-as-pipe-clk;
> +};
> +
> +&usb3_dwc3 {
> +	extcon = <&usb3_id>;
> +	dr_mode = "peripheral";
> +	phys = <&hsusb_phy1>;
> +	phy-names = "usb2-phy";
> +	snps,hird-threshold = /bits/ 8 <0>;
> +};
