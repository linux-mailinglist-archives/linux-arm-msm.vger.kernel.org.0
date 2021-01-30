Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CA43094C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 12:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhA3L2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 06:28:49 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:27078 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhA3L2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 06:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612005950;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
        From:Subject:Sender;
        bh=4gdInHCqX7vX65f1KM3rkTzRiaL+BG2XcHddUeo+x5o=;
        b=NTHYXN1aeTZdargrpx40wPD23CupY3SmzMpE7APwrLUM4DB3UWuhWmNJd/Hb3YwTMN
        xkx1CxBp7U+QcfbcjadxPnWn0W76HSeJfxHKX0CtrNT+AgopKFQ8UL9wqOfDkXGju5Rh
        Gd/096a8ildiR/V/add5GnYYsIpqQJ1K6vvAlKaxaAaDPunNuLY8I0Ec16ozfyAe45I1
        tZWn74Vr+vi8O7SxVq+Ma67WDOU5j+xtO1CCpZCWHQSnhGLzolWWx+gQaUZt6TkLiWyL
        XVbR3Bcfpq2nvQoNkgFq6jbMsLxYvUgFTck3QRSbrfqu18e8sYBia+jzRjob8CQC9Spf
        2fhw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczGbYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.16.0 DYNA|AUTH)
        with ESMTPSA id j0a9bax0UBPQ80v
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 30 Jan 2021 12:25:26 +0100 (CET)
Date:   Sat, 30 Jan 2021 12:25:18 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        allen <allen.chen@ite.com.tw>,
        Max Merchel <Max.Merchel@tq-group.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: Add device tree for Alcatel
 Idol 3 (4.7")
Message-ID: <YBVCHvGy5VwTThZ4@gerhold.net>
References: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
 <20210130105717.2628781-3-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130105717.2628781-3-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 30, 2021 at 11:57:11AM +0100, Vincent Knecht wrote:
> The Alcatel Idol 3 (4.7") is a smartphone based on MSM8916.
> Add a device tree with support for USB, eMMC, SD-Card, WiFi,
> BT, power/volume buttons, vibrator and the following sensors:
> magnetometer, accelerometer, gyroscope, ambient light+proximity
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 291 ++++++++++++++++++
>  2 files changed, 292 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 59455db7b493..0feeedb712cc 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> new file mode 100644
> index 000000000000..540b1fa4b260
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "msm8916-pm8916.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Alcatel OneTouch Idol 3 (4.7)";
> +	compatible = "alcatel,idol347", "qcom,msm8916";
> +
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;
> +
> +		label = "GPIO Buttons";
> +
> +		volume-up {
> +			label = "Volume Up";
> +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	usb_id: usb-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&msmgpio 69 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_id_default>;
> +	};
> +};
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	magnetometer@c {
> +		compatible = "asahi-kasei,ak09911";
> +		reg = <0x0c>;
> +		vdd-supply = <&pm8916_l17>;
> +		vid-supply = <&pm8916_l6>;
> +		reset-gpios = <&msmgpio 8 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mag_reset_default>;
> +		mount-matrix = "0", "1", "0",
> +			       "-1", "0", "0",
> +			       "0", "0", "1";
> +	};
> +
> +	accelerometer@f {
> +		compatible = "kionix,kxtj21009";
> +		reg = <0x0f>;
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&accel_int_default>;
> +		mount-matrix = "-1", "0", "0",
> +			       "0", "1", "0",
> +			       "0", "0", "-1";
> +	};
> +
> +	proximity@48 {
> +		compatible = "sensortek,stk3310";
> +		reg = <0x48>;
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&proximity_int_default>;
> +	};
> +
> +	gyroscope@68 {
> +		compatible = "bosch,bmg160";
> +		reg = <0x68>;
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <97 IRQ_TYPE_EDGE_RISING>,
> +			     <98 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gyro_int_default>;
> +	};
> +};
> +
> +&pm8916_resin {
> +	status = "okay";
> +	linux,code = <KEY_VOLUMEDOWN>;
> +};
> +
> +&pm8916_vib {
> +	status = "okay";
> +};
> +
> +&pronto {
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
> +	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> +
> +	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
> +};
> +
> +&usb {
> +	status = "okay";
> +	extcon = <&usb_id>, <&usb_id>;
> +};
> +
> +&usb_hs_phy {
> +	extcon = <&usb_id>;
> +};
> +
> +&smd_rpm_regulators {
> +	vdd_l1_l2_l3-supply = <&pm8916_s3>;
> +	vdd_l4_l5_l6-supply = <&pm8916_s4>;
> +	vdd_l7-supply = <&pm8916_s4>;
> +
> +	s3 {
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1300000>;
> +	};
> +
> +	s4 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2100000>;
> +	};
> +
> +	l1 {
> +		regulator-min-microvolt = <1225000>;
> +		regulator-max-microvolt = <1225000>;
> +	};
> +
> +	l2 {
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +	};
> +
> +	l4 {
> +		regulator-min-microvolt = <2050000>;
> +		regulator-max-microvolt = <2050000>;
> +	};
> +
> +	l5 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l6 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l7 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l8 {
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2900000>;
> +	};
> +
> +	l9 {
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l10 {
> +		regulator-min-microvolt = <2700000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
> +	l11 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +		regulator-allow-set-load;
> +		regulator-system-load = <200000>;
> +	};
> +
> +	l12 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +	};
> +
> +	l13 {
> +		regulator-min-microvolt = <3075000>;
> +		regulator-max-microvolt = <3075000>;
> +	};
> +
> +	l14 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l15 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l16 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l17 {
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2850000>;
> +	};
> +
> +	l18 {
> +		regulator-min-microvolt = <2700000>;
> +		regulator-max-microvolt = <2700000>;
> +	};
> +};
> +
> +&msmgpio {
> +	accel_int_default: accel-int-default {
> +		pins = "gpio31";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	gpio_keys_default: gpio-keys-default {
> +		pins = "gpio107";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	gyro_int_default: gyro-int-default {
> +		pins = "gpio97", "gpio98";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	mag_reset_default: mag-reset-default {
> +		pins = "gpio8";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	proximity_int_default: proximity-int-default {
> +		pins = "gpio12";
> +		function = "gpio";
> +
> +		drive-strength = <6>;
> +		bias-pull-up;
> +	};
> +
> +	usb_id_default: usb-id-default {
> +		pins = "gpio69";
> +		function = "gpio";
> +
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +};
> -- 
> 2.29.2
> 
> 
> 
