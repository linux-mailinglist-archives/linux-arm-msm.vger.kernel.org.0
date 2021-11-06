Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9D3447015
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Nov 2021 20:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbhKFT1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Nov 2021 15:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbhKFT1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Nov 2021 15:27:25 -0400
X-Greylist: delayed 348 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 06 Nov 2021 12:24:43 PDT
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB47C061570;
        Sat,  6 Nov 2021 12:24:43 -0700 (PDT)
Received: from [192.168.1.169] (adsl-d210.84-47-0.t-com.sk [84.47.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AE56A3F1D1;
        Sat,  6 Nov 2021 20:18:50 +0100 (CET)
Date:   Sat, 06 Nov 2021 20:18:45 +0100
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C
 / XZ3 (Tama platform)
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <9B062R.R4BER7XFAKY31@somainline.org>
In-Reply-To: <20211106191437.84943-1-konrad.dybcio@somainline.org>
References: <20211106191437.84943-1-konrad.dybcio@somainline.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Martin Botka <martin.botka@somainline.org>

On Sat, Nov 6 2021 at 08:14:36 PM +0100, Konrad Dybcio 
<konrad.dybcio@somainline.org> wrote:
> Add support for SONY Xperia XZ2, XZ2 Compact and XZ3 smartphones, all 
> based on
> the Qualcomm SDM845 chipset. There also exists a fourth Tama device, 
> the XZ2
> Premium (Aurora) with a 4K display, but it's relatively rare.
> 
> The devices are affected by a scary UFS behaviour where sending a 
> certain UFS
> command (which is worked around on downstream) renders the device 
> unbootable,
> by effectively erasing the bootloader. Therefore UFS AND UFSPHY are 
> strictly
> disabled for now.
> 
> Downstream workaround:
> https://github.com/kholk/kernel/commit/2e7a9ee1c91a016baa0b826a7752ec45663a0561
> 
> This platform's bootloader is not very nice either. To boot mainline 
> you need
> to flash a bogus DTBO (fastboot erasing may cut it, but it takes an 
> inhumane
> amount of time) - one that's just 4 bytes (all zeroes) seems to work 
> just fine.
> 
> Of course, one can also provide a "normal" DTBO (device-specific DT 
> overlayed
> on top of the SoC DT), but that's not yet supported by the mainline 
> kernel
> build system.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   3 +
>  .../qcom/sdm845-sony-xperia-tama-akari.dts    |  13 +
>  .../qcom/sdm845-sony-xperia-tama-akatsuki.dts |  29 ++
>  .../qcom/sdm845-sony-xperia-tama-apollo.dts   |  13 +
>  .../dts/qcom/sdm845-sony-xperia-tama.dtsi     | 442 
> ++++++++++++++++++
>  5 files changed, 500 insertions(+)
>  create mode 100644 
> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
>  create mode 100644 
> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
>  create mode 100644 
> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
>  create mode 100644 
> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
> b/arch/arm64/boot/dts/qcom/Makefile
> index 59ece83abad0..6f5c97548aa2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -81,6 +81,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-akari.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-akatsuki.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-apollo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
> diff --git 
> a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts 
> b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
> new file mode 100644
> index 000000000000..34f84f1f1eb4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-sony-xperia-tama.dtsi"
> +
> +/ {
> +	model = "Sony Xperia XZ2";
> +	compatible = "sony,akari-row", "qcom,sdm845";
> +};
> diff --git 
> a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts 
> b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> new file mode 100644
> index 000000000000..8a0d94e7f598
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-sony-xperia-tama.dtsi"
> +
> +/ {
> +	model = "Sony Xperia XZ3";
> +	compatible = "sony,akatsuki-row", "qcom,sdm845";
> +};
> +
> +/* For the future: WLED + LAB/IBB/OLEDB are not used on Akatsuki */
> +&vreg_l14a_1p8 {
> +	regulator-min-microvolt = <1840000>;
> +	regulator-max-microvolt = <1840000>;
> +};
> +
> +&vreg_l22a_2p8 {
> +	regulator-min-microvolt = <2700000>;
> +	regulator-max-microvolt = <2700000>;
> +};
> +
> +&vreg_l28a_2p8 {
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +};
> diff --git 
> a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts 
> b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
> new file mode 100644
> index 000000000000..c9e62c72f60e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-sony-xperia-tama.dtsi"
> +
> +/ {
> +	model = "Sony Xperia XZ2 Compact";
> +	compatible = "sony,apollo-row", "qcom,sdm845";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi 
> b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> new file mode 100644
> index 000000000000..6b088675f4b9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -0,0 +1,442 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sdm845.dtsi"
> +#include "pm8005.dtsi"
> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +
> +/ {
> +	qcom,msm-id = <321 0x20001>; /* SDM845 v2.1 */
> +	qcom,board-id = <8 0>;
> +
> +	gpio-keys {
> +		cam-focus {
> +			label = "cam_focus";
> +			gpios = <&pm8998_gpio 2 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_CAMERA_FOCUS>;
> +			debounce-interval = <15>;
> +			gpio-key,wakeup;
> +		};
> +
> +		vol-down {
> +			label = "volume_down";
> +			gpios = <&pm8998_gpio 5 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			debounce-interval = <15>;
> +			gpio-key,wakeup;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_s4a_1p8: pm8998-smps4 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +	reserved-memory {
> +		/* SONY was cool and didn't diverge from MTP this time, yay! */
> +		cont_splash_mem: memory@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x2400000>;
> +			no-map;
> +		};
> +
> +		ramoops@ffc00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xffc00000 0x0 0x100000>;
> +			record-size = <0x10000>;
> +			console-size = <0x60000>;
> +			ftrace-size = <0x10000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	pm8998-rpmh-regulators {
> +		compatible = "qcom,pm8998-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +		vdd-s11-supply = <&vph_pwr>;
> +		vdd-s12-supply = <&vph_pwr>;
> +		vdd-s13-supply = <&vph_pwr>;
> +		vdd-l1-l27-supply = <&vreg_s7a_0p9>;
> +		vdd-l2-l8-l17-supply = <&vreg_s3a_1p3>;
> +		vdd-l3-l11-supply = <&vreg_s7a_0p9>;
> +		vdd-l4-l5-supply = <&vreg_s7a_0p9>;
> +		vdd-l6-supply = <&vph_pwr>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p9>;
> +		vdd-l9-supply = <&vreg_s5a_1p9>;
> +		vdd-l10-l23-l25-supply = <&src_vreg_bob>;
> +		vdd-l13-l19-l21-supply = <&src_vreg_bob>;
> +		vdd-l16-l28-supply = <&src_vreg_bob>;
> +		vdd-l18-l22-supply = <&src_vreg_bob>;
> +		vdd-l20-l24-supply = <&src_vreg_bob>;
> +		vdd-l26-supply = <&vreg_s3a_1p3>;
> +		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
> +
> +		vreg_s2a_1p1: smps2 {
> +			regulator-min-microvolt = <1100000>;
> +			regulator-max-microvolt = <1100000>;
> +		};
> +
> +		vreg_s3a_1p3: smps3 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +		};
> +
> +		vreg_s5a_1p9: smps5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		vreg_s7a_0p9: smps7 {
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <1028000>;
> +		};
> +
> +		vreg_l1a_0p9: ldo1 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2a_1p2: ldo2 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +		};
> +
> +		vreg_l3a_1p0: ldo3 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5a_0p8: ldo5 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6a_1p8: ldo6 {
> +			regulator-min-microvolt = <1856000>;
> +			regulator-max-microvolt = <1856000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a_1p8: ldo7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8a_1p2: ldo8 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1248000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9a_1p7: ldo9 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10a_1p7: ldo10 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11a_1p0: ldo11 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1048000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12a_1p8: ldo12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a_1p8: ldo13 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14a_1p8: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15a_1p8: ldo15 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16a_2p7: ldo16 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17a_1p3: ldo17 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18a_2p7: ldo18 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l19a_2p7: ldo19 {
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <2700000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			/*
> +			 * The driver *really* doesn't want this regualtor to exist,
> +			 * saying that it could not get the current voltage 
> (-ENOTRECOVERABLE)
> +			 * even though it surely is used on these devices (as a voltage
> +			 * source for camera autofocus)
> +			 */
> +			status = "disabled";
> +		};
> +
> +		vreg_l20a_2p7: ldo20 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l21a_2p7: ldo21 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l22a_2p8: ldo22 {
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l23a_3p0: ldo23 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l24a_3p1: ldo24 {
> +			regulator-min-microvolt = <3088000>;
> +			regulator-max-microvolt = <3088000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l25a_3p0: ldo25 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l26a_1p2: ldo26 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l28a_2p8: ldo28 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_lvs1a_1p8: lvs1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_lvs2a_1p8: lvs2 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	pmi8998-rpmh-regulators {
> +		compatible = "qcom,pmi8998-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		src_vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	pm8005-rpmh-regulators {
> +		compatible = "qcom,pm8005-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +
> +		vreg_s3c_0p6: smps3 {
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <600000>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	protected-clocks = <GCC_QSPI_CORE_CLK>,
> +			<GCC_QSPI_CORE_CLK_SRC>,
> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +			<GCC_LPASS_Q6_AXI_CLK>,
> +			<GCC_LPASS_SWAY_CLK>;
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* Synaptics touchscreen @ 2c, 3c */
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* Qcom SMB1355 @ 8, c */
> +	/* NXP PN547 NFC @ 28 */
> +	/* Renesas IDTP9221 Qi charger @ 61 */
> +};
> +
> +&i2c14 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* SONY ToF sensor @ 52 */
> +	/* AMS TCS3490 RGB+IR color sensor @ 72 */
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	vmmc-supply = <&vreg_l21a_2p7>;
> +	vqmmc-supply = <&vreg_l13a_1p8>;
> +	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
> +	pinctrl-0 = <&sdc2_default_state>;
> +	pinctrl-names = "default";
> +	bus-width = <4>;
> +	no-sdio;
> +	no-emmc;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +
> +	sdc2_default_state: sdc2-default-state {
> +		clk {
> +			pins = "sdc2_clk";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +
> +		cmd {
> +			pins = "sdc2_cmd";
> +			drive-strength = <10>;
> +			bias-pull-up;
> +		};
> +
> +		data {
> +			pins = "sdc2_data";
> +			drive-strength = <10>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&uart6 {
> +	status = "okay";
> +};
> +
> +&uart9 {
> +	status = "okay";
> +};
> +
> +/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
> +&ufs_mem_hc { status = "disabled"; };
> +&ufs_mem_phy { status = "disabled"; };
> +
> +&usb_1 {
> +	status = "okay";
> +
> +	qcom,select-utmi-as-pipe-clk;
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +};
> +
> +&usb_1_hsphy {
> +	status = "okay";
> +
> +	vdd-supply = <&vreg_l1a_0p9>;
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p1>;
> +};
> --
> 2.33.0
> 


