Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4E432F824
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 04:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhCFDi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 22:38:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhCFDh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 22:37:57 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12583C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 19:37:46 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id x20so4805260oie.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 19:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rHZ5FvfODielV3865BOdOPXLrgDutB9qVkI03AEdwD0=;
        b=JUOf9T69RwsyubIa9dd8IAYn+3NTYgb3686aVzJpFzA8fuuUpeY9d+dgaYpAMqvyTp
         Rvp9Jf2ZtJqVhFjiyslVHY8ohHJ4bPl9XnqjTuCS31KhJ5EA75+Begg/ENDNz7aPr3U5
         NOsBAvluJoQHqvE+0iCb+MZ224+XamSGlKTQRWG0tP4kXZPMJTSpCQRat2QuSYOCSvs2
         OPq1Pkjd3AGk/gwFdhHOT26gcVmoPn2ZsK4m+mXa3IF8hI2k1YwUZkJF6xcdH66htuMf
         YJy+7L74DpEYxDmbWwSSZ/EvAkuT2KCpbxF9WmddyabOvDUY/5+WJVhAInyVt+7Pi1aD
         Wfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rHZ5FvfODielV3865BOdOPXLrgDutB9qVkI03AEdwD0=;
        b=Mg7JQwTsw0X7MUbkXW2c1MRo/HqJ9q2LUSUnZ/92OO3bDjH3QN6GNuTrjXyUXYqQQt
         lK+6NRT9SWzsSabq53KwnMk4s8Ll8J1hjpdkWqzV4HNx47rXqxx/pPxIaEmAvroHnOlX
         T9y/tJILlJJisp/UrfKyurNx0S/HhvHmgn4m8R5RiY0cgjyrISwxGDG6Ru0GI8W4962A
         Hy4J46I5tkO1KluFhmBHtmRMze5O5zCys6FCtNY6LcZVE+irLIGmdlExkkk/E4Io9z46
         FFbDv/ikeMmjxmIVJUZUgZMST3k1AVL+oZrXV28KcoY8OaCVWetc5CSy8rZ5UFpTqqJd
         GH9A==
X-Gm-Message-State: AOAM5338HlxkKOWt4515UO30rEijIcAblOuiEwGh/pLnJzLHbCEY2LWj
        GRx1ZNJLz+aQYBq+pq89MRACug==
X-Google-Smtp-Source: ABdhPJwIkZgBOOpKWfQgb//5e3dgWoueQE0112J073vzGiQvAQbiZqluUYFWF34EYSzhj7QLOGrDIw==
X-Received: by 2002:aca:ea83:: with SMTP id i125mr9688989oih.18.1615001865201;
        Fri, 05 Mar 2021 19:37:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u19sm1041795ote.15.2021.03.05.19.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 19:37:44 -0800 (PST)
Date:   Fri, 5 Mar 2021 21:37:42 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: add support for the Pixel 2 XL
Message-ID: <YEL5BuaivN5LgZyG@builder.lan>
References: <20210305213235.398252-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305213235.398252-1-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 05 Mar 15:35 CST 2021, Caleb Connolly wrote:

Please add "qcom: " to $subject as well.

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

So it's not possible to just erase the dto, like on most other devices?

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

Would you be willing to release these as BSD-3-Clause instead?

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
> +	qcom,msm-id = <0x124 0x20001>;
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

Please drop earlycon from this list (user should be able to add it if
they care later?) and use stdout-path to set the console, like we do on
other devices.

> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> + 		#size-cells = <2>;
> + 		ranges;
> +
> +		mpss_mem: memory@8cc00000 {
> +			reg = <0 0x8cc00000 0 0x7800000>;
> +			no-map;
> +		};
> +
> +		venus_mem: memory@94400000 {
> +			reg = <0 0x94400000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		mba_mem: memory@94100000 {
> +			reg = <0 0x94900000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: memory@94b00000 {
> +			reg = <0 0x94b00000 0 0x700000>;
> +			no-map;
> +		};
> +
> +		ramoops: ramoops@a1810000 {
> +			compatible = "ramoops";
> +			reg = <0 0xa1810000 0 0x200000>;
> +			record-size = <0x20000>;
> +			console-size = <0x100000>;
> +			pmsg-size = <0x80000>;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
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
> +
> +&pcie0 {
> +	status = "disabled";

Isn't &pcie0 already disabled, from msm8998.dtsi?

> +};
> +
> +&pm8005_lsid1 {
> +	pm8005-regulators {
> +		compatible = "qcom,pm8005-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +
> +		pm8005_s1: s1 { /* VDD_GFX supply */
> +			regulator-min-microvolt = <524000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-enable-ramp-delay = <500>;
> +
> +			/* hack until we rig up the gpu consumer */
> +			regulator-always-on;
> +		};
> +	};
> +};
> +
> +&qusb2phy {
> +	status = "okay";
> +
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +};
> +
> +&remoteproc_adsp {
> +	status = "okay";
> +
> +	firmware-name = "qcom/pixel2/adsp.mdt";
> +};
> +
> +&remoteproc_mss {
> +	firmware-name = "qcom/pixel2/mba.mbn",
> +	                "qcom/pixel2/modem.mdt";
> +};
> +
> +&remoteproc_slpi {
> +	status = "okay";
> +
> +	firmware-name = "qcom/pixel2/slpi_v2.mdt";
> +};
> +
> +&rpm_requests {
> +	pm8998-regulators {
> +		compatible = "qcom,rpm-pm8998-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3-supply = <&vph_pwr>;
> +		vdd_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +		vdd_s7-supply = <&vph_pwr>;
> +		vdd_s8-supply = <&vph_pwr>;
> +		vdd_s9-supply = <&vph_pwr>;
> +		vdd_s10-supply = <&vph_pwr>;
> +		vdd_s11-supply = <&vph_pwr>;
> +		vdd_s12-supply = <&vph_pwr>;
> +		vdd_s13-supply = <&vph_pwr>;
> +		vdd_l1_l27-supply = <&vreg_s7a_1p025>;
> +		vdd_l2_l8_l17-supply = <&vreg_s3a_1p35>;
> +		vdd_l3_l11-supply = <&vreg_s7a_1p025>;
> +		vdd_l4_l5-supply = <&vreg_s7a_1p025>;
> +		vdd_l6-supply = <&vreg_s5a_2p04>;
> +		vdd_l7_l12_l14_l15-supply = <&vreg_s5a_2p04>;
> +		vdd_l9-supply = <&vreg_bob>;
> +		vdd_l10_l23_l25-supply = <&vreg_bob>;
> +		vdd_l13_l19_l21-supply = <&vreg_bob>;
> +		vdd_l16_l28-supply = <&vreg_bob>;
> +		vdd_l18_l22-supply = <&vreg_bob>;
> +		vdd_l20_l24-supply = <&vreg_bob>;
> +		vdd_l26-supply = <&vreg_s3a_1p35>;
> +		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
> +
> +		vreg_s3a_1p35: s3 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +		};
> +		vreg_s4a_1p8: s4 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-allow-set-load;
> +		};
> +		vreg_s5a_2p04: s5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +		vreg_s7a_1p025: s7 {
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <1028000>;
> +		};
> +		vreg_l1a_0p875: l1 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +		};
> +		vreg_l2a_1p2: l2 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +		vreg_l3a_1p0: l3 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +		vreg_l5a_0p8: l5 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +		vreg_l6a_1p8: l6 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <1808000>;
> +		};
> +		vreg_l7a_1p8: l7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +		vreg_l8a_1p2: l8 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +		vreg_l9a_1p8: l9 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <2960000>;
> +		};
> +		vreg_l10a_1p8: l10 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <2960000>;
> +		};
> +		vreg_l11a_1p0: l11 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +		vreg_l12a_1p8: l12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +		vreg_l13a_2p95: l13 {
> +			regulator-min-microvolt = <1808000>;
> +			regulator-max-microvolt = <2960000>;
> +		};
> +		vreg_l14a_1p88: l14 {
> +			regulator-min-microvolt = <1880000>;
> +			regulator-max-microvolt = <1880000>;
> +		};
> +		vreg_15a_1p8: l15 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +		vreg_l16a_2p7: l16 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +		};
> +		vreg_l17a_1p3: l17 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +		};
> +		vreg_l18a_2p7: l18 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +		};
> +		vreg_l19a_3p0: l19 {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +		};
> +		vreg_l20a_2p95: l20 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-allow-set-load;
> +		};
> +		vreg_l21a_2p95: l21 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-allow-set-load;
> +			regulator-system-load = <800000>;
> +		};
> +		vreg_l22a_2p85: l22 {
> +			regulator-min-microvolt = <2864000>;
> +			regulator-max-microvolt = <2864000>;
> +		};
> +		vreg_l23a_3p3: l23 {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3312000>;
> +		};
> +		vreg_l24a_3p075: l24 {
> +			regulator-min-microvolt = <3088000>;
> +			regulator-max-microvolt = <3088000>;
> +		};
> +		vreg_l25a_3p3: l25 {
> +			regulator-min-microvolt = <3104000>;
> +			regulator-max-microvolt = <3312000>;
> +		};
> +		vreg_l26a_1p2: l26 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-allow-set-load;
> +		};
> +		vreg_l28_3p0: l28 {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +		};
> +
> +		vreg_lvs1a_1p8: lvs1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		vreg_lvs2a_1p8: lvs2 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +	};
> +
> +	pmi8998-regulators {
> +		compatible = "qcom,rpm-pmi8998-regulators";
> +
> +		vdd_bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmic@0 {
> +		compatible = "qcom,pm8994", "qcom,spmi-pmic";

qcom,pm8994?

Per the include of pm8998.dtsi I think you already have pmic@0 defined,
with compatible of qcom,pm8998 here (which you override).

> +		reg = <0x0 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pon@800 {

But pmic@0 already has pon@800 defined as &pm8998_pon, which seems to be
defined identically to yours.

So I think you should be able to drop this entire &spmi_bus node and its
children, but perhaps I'm just missing something obvious here?

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
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +};
> +
> +/*
> + * The device does contain a USB3 capable type-c port,
> + * however it doesn't seem to work when superspeed mode is
> + * enabled.
> + */
> +&usb3 {
> +	status = "okay";
> +
> +	/* Operate "GCC_USB30_MASTER_CLK" in HS mode (>=60 MHz) */
> +	assigned-clock-rates = <19200000>, <60000000>;
> +
> +	/* Disable USB3 pipe_clk requirement */
> +	qcom,select-utmi-as-pipe-clk;
> +};
> +
> +&usb3_dwc3 {
> +	/* Drop USB 3 SuperSpeed PHY to bring up the "usb0" interface */
> +	phys = <&qusb2phy>;
> +	phy-names = "usb2-phy";
> +
> +	/* We can only operate at USB 2.0 speeds */
> +	maximum-speed = "high-speed";
> +
> +	/* Force to peripheral until we have Type-C hooked up */
> +	dr_mode = "peripheral";
> +};
> +
> +&ufshc {
> +	vcc-supply = <&vreg_l20a_2p95>;
> +	vccq-supply = <&vreg_l26a_1p2>;
> +	vccq2-supply = <&vreg_s4a_1p8>;
> +	vcc-max-microamp = <750000>;
> +	vccq-max-microamp = <560000>;
> +	vccq2-max-microamp = <750000>;
> +};
> +
> +&ufsphy {
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l2a_1p2>;
> +	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
> +	vdda-phy-max-microamp = <51400>;
> +	vdda-pll-max-microamp = <14600>;
> +	vddp-ref-clk-max-microamp = <100>;
> +	vddp-ref-clk-always-on;
> +};
> +
> +&wifi {
> +	status = "okay";
> +

Can you please disable diag-router and try adding this here instead:

	clocks = <&rpmcc RPM_SMD_RF_CLK2_PIN>, <&rpmcc RPM_SMD_QDSS_CLK>;
	clock-names = "cxo_ref_clk_pin", "qdss";

What you describe in your comment above seems like what I saw on sm8150,
that launching diag-router would cause something on the modem side to
keep the debug subsystem clock on - which in turn caused WiFi not to
crash during loading.


I don't know why this was required, or if it's just working around
some other issue we're having.

Regards,
Bjorn

> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +};
> -- 
> 2.29.2
> 
> 
