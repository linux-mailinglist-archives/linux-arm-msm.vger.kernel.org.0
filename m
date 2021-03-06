Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4489C32F977
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 11:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhCFKtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 05:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhCFKtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 05:49:11 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116A6C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Mar 2021 02:49:11 -0800 (PST)
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E9B223E8B8;
        Sat,  6 Mar 2021 11:49:06 +0100 (CET)
Subject: Re: [PATCH] arm64: dts: add support for the Pixel 2 XL
To:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210305213235.398252-1-caleb@connolly.tech>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <2e7178e5-9c97-808e-b2ca-19ef0bb667e3@somainline.org>
Date:   Sat, 6 Mar 2021 11:49:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305213235.398252-1-caleb@connolly.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 05.03.2021 22:35, Caleb Connolly wrote:
> Add a minimal devicetree capable of booting on the Pixel 2 XL MSM8998
> device.
>
> It's currently possible to boot the device into postmarketOS with USB
> networking, however the display panel depends on Display Stream
> Compression which is not yet supported in the kernel.
>
> The bootloader also requires that the dtbo partition contains a device
> tree overlay with a particular id which has to be overlayed onto the
> existing dtb. It's possible to use a specially crafted dtbo partition to
> workaround this, more information is available here:
>
>     https://gitlab.com/calebccff/dtbo-google-wahoo-mainline
>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
> It's possible to get wifi working by running Bjorns diag-router in the
> background, without this the wifi firmware crashes every 10 seconds or
> so. This is the same issue encountered on the OnePlus 5.
>
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/msm8998-google-taimen.dts   |  14 +
>  .../boot/dts/qcom/msm8998-google-wahoo.dtsi   | 391 ++++++++++++++++++
>  3 files changed, 406 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5113fac80b7a..d942d3ec3928 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-msft-lumia-cityman.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-sumire.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-google-taimen.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts b/arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts
> new file mode 100644
> index 000000000000..ffaaafe14037
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, Caleb Connolly <caleb@connolly.tech>
> + */
> +
> +/dts-v1/;
> +
> +#include "msm8998-google-wahoo.dtsi"
> +
> +/ {
> +	model = "Google Pixel 2 XL";
> +	compatible = "google,taimen", "google,wahoo", "qcom,msm8998", "qcom,msm8998-mtp";

Drop the mtp compatible. Also, afaict wahoo is a shared platform name for P2/2XL, so perhaps using the same naming scheme we used for Xperias/Lumias (soc-vendor-platform-board) would clear up some confusion. In this case, I'm not sure about the wahoo compatible, but I reckon it's fine for it to stay so that it's easier to introduce potential quirks that concern both devices.


> +	qcom,msm-id = <0x124 0x20001>;

Move it to the common dtsi, unless the other Pixel ships with a different SoC revision.


> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi b/arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi
> new file mode 100644
> index 000000000000..0c221ead2df7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech> */
> +
> +#include "msm8998.dtsi"
> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +#include "pm8005.dtsi"
> +
> +/delete-node/ &mpss_mem;
> +/delete-node/ &venus_mem;
> +/delete-node/ &mba_mem;
> +/delete-node/ &slpi_mem;
> +
> +/ {
> +	aliases {
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* Add "earlycon" intended to be used in combination with UART serial console */
> +		bootargs = "clk_ignore_unused earlycon console=ttyGS0,115200";// loglevel=10 drm.debug=15 debug";

clk_ignore_unused is a BIG hack!

You should trace which clocks are important for it to stay alive and fix it on the driver side.

What breaks if it's not there? Does it still happen with Angelo's clk patches that got in for the 5.12

window?

Aside from that, //loglevel... should also go.


> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};

Don't you need to specify voltage here?


> +
> +&blsp1_uart3 {
> +	status = "disabled";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l25a_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};

Either enable the UART or rid the bluetooth for now.


> +
> +&pm8005_lsid1 {
> +	pm8005-regulators {
> +		compatible = "qcom,pm8005-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +
> +		pm8005_s1: s1 { /* VDD_GFX supply */

regulator-name = "vdd_gfx";


> +
> +&spmi_bus {
> +	pmic@0 {
> +		compatible = "qcom,pm8994", "qcom,spmi-pmic";
> +		reg = <0x0 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pon@800 {
> +			compatible = "qcom,pm8916-pon";
> +
> +			reg = <0x800>;
> +			mode-bootloader = <0x2>;
> +			mode-recovery = <0x1>;
> +
> +			pwrkey {
> +				compatible = "qcom,pm8941-pwrkey";
> +				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> +				debounce = <15625>;
> +				bias-pull-up;
> +				linux,code = <KEY_POWER>;
> +			};
> +		};
> +	};
> +};

That's a lot of indentation, it would be better to add a label: somewhere instead.. Moreover, the exact same pwrkey node is already present in pm8998.dtsi, so you should just drop this.


Konrad

