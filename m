Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF33A8CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 01:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFOXsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 19:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhFOXr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 19:47:59 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24278C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 16:45:53 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so650698oth.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 16:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nuYoqTIAzRrihVCVrYQ2bpvzH0ZCKvgvxnUTC4QZzZg=;
        b=TwrUOLF1DPhXdoBbGd67znieBTsE7wHcD7IEXGHg+o1NPNs66nCOohumbAMqACzZ3v
         DHEYjUm53Q+0jo3k0rQoKaV3Jab0tFIYk+rIdnqjNt3egZAixt/OzMJ6F6rF+LSGtZiU
         YGEv539hmFFMWREAQCJTuJUD4tDwT+qVc/Kr79hhX0wwXK4dOC+3uUf98FD6pEWwEK4L
         IcvPSr2O+m4ap0dMO/RCLMUA5fo/JGaA/uY44oayXGeTWZ5ynIZRAX0XjlBhMhQfgVn0
         oHrHtW7+f+wTk+0A451VfD9T6XOoUW47yFEdJdV1yN8tk9QeoL0JOEiR1pPr47afQRf1
         fm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nuYoqTIAzRrihVCVrYQ2bpvzH0ZCKvgvxnUTC4QZzZg=;
        b=B+prXW0kczpd3m6tIISUjB82gS86ILBM7SUhWDA0f7Lii/afGdFWhK11p2WF6MegmL
         SwtSX7fLjeKoCbBeSJuU7Pk7Z7vUHI+cIu1LYgj7uophOPOr+53xSGxacf8O1jEmcmID
         dUnrXCbG1qtibRTXhMU1NYPI04dndheQieqSItVwl9bNqsCX1iO0ZcwzjmVZiPG6FBa4
         WwSDMnLALeREP0hBL62AkSQZFW/bRtxGBRyjXSWxEt14Q2rVNi0IGXpYGmwA4QzlZSLC
         mQOXtl8wxrd6/bav2CudWHlhzFSa/cfd20hXQCpR40leDtvsXlVPAYHfVVb07JuAeQri
         u4rw==
X-Gm-Message-State: AOAM532fkiQQkfG0/EXZjnNExXNwbPqO/AaUUdt6zpMAFbzjLrLAFy/9
        1Dbvdca/npDCSsidncXDZTnBfg==
X-Google-Smtp-Source: ABdhPJyyF7GQi0K6DdkkS6NhONnYG8Dl+VKeKYRGcCH6qrbq2dIzbF3OOtgbLgaN9y8v6yMi4vAwiQ==
X-Received: by 2002:a05:6830:18c1:: with SMTP id v1mr1398694ote.275.1623800752390;
        Tue, 15 Jun 2021 16:45:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p7sm123759otq.9.2021.06.15.16.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:45:51 -0700 (PDT)
Date:   Tue, 15 Jun 2021 18:45:49 -0500
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for SONY Xperia 1
 II / 5 II (Edo platform)
Message-ID: <YMk7rf4/03AcIghT@builder.lan>
References: <20210612192358.62602-1-konrad.dybcio@somainline.org>
 <20210612192358.62602-3-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612192358.62602-3-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 12 Jun 14:23 CDT 2021, Konrad Dybcio wrote:

> Add support for SONY Xperia 1 II and 5 II smartphones (read one/five mark two).
> They are based on the Qualcomm SM8250 chipset and both feature 5G modems. There
> also exists a third Edo board, namely the Xperia PRO (PDX204), but it's $2500
> and no developers have obtained it so far (to my knowledge).
> 
> The devices are affected by a scary UFS behaviour where sending a certain UFS
> command (which is worked around on downstream) renders the device unbootable,
> by effectively erasing the bootloader. Therefore UFS AND UFSPHY are strictly
> disabled for now.
> 

Ouch, that's expensive paper weights. Let's hope someone can shed some
light on the UFS situation.


The rest looks really nice!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> Downstream workaround:
> https://github.com/kholk/kernel/commit/2e7a9ee1c91a016baa0b826a7752ec45663a0561
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Separate the sdhci2 pinctrl part
> - Fix up some regulator settings and comments
> - Add Marijn's t-b
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../qcom/sm8250-sony-xperia-edo-pdx203.dts    |  15 +
>  .../qcom/sm8250-sony-xperia-edo-pdx206.dts    |  24 +
>  .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 494 ++++++++++++++++++
>  4 files changed, 535 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 456502aeee49..a3b832d9fc0c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -73,5 +73,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
> new file mode 100644
> index 000000000000..79afeb07f4a2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm8250-sony-xperia-edo.dtsi"
> +
> +/ {
> +	model = "Sony Xperia 1 II";
> +	compatible = "sony,pdx203-generic", "qcom,sm8250";
> +};
> +
> +/delete-node/ &vreg_l7f_1p8;
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
> new file mode 100644
> index 000000000000..999b662f4679
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm8250-sony-xperia-edo.dtsi"
> +
> +/ {
> +	model = "Sony Xperia 5 II";
> +	compatible = "sony,pdx206-generic", "qcom,sm8250";
> +};
> +
> +&framebuffer {
> +	width = <1080>;
> +	height = <2520>;
> +	stride = <(1080 * 4)>;
> +};
> +
> +&vreg_l2f_1p3 {
> +	regulator-min-microvolt = <1200000>;
> +	regulator-max-microvolt = <1200000>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> new file mode 100644
> index 000000000000..df251b51b106
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -0,0 +1,494 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8250.dtsi"
> +#include "pm8150.dtsi"
> +#include "pm8150b.dtsi"
> +#include "pm8150l.dtsi"
> +#include "pm8009.dtsi"
> +
> +/delete-node/ &adsp_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &cdsp_secure_heap;
> +
> +/ {
> +	qcom,msm-id = <356 0x20001>; /* SM8250 v2.1 */
> +	qcom,board-id = <0x10008 0>;
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer: framebuffer@9c000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9c000000 0 0x2300000>;
> +			width = <1644>;
> +			height = <3840>;
> +			stride = <(1644 * 4)>;
> +			format = "a8r8g8b8";
> +			/*
> +			 * That's a lot of clocks, but it's necessary due
> +			 * to unused clk cleanup & no panel driver yet..
> +			 */
> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&gcc GCC_DISP_SF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +				 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +				 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +				 <&dispcc DISP_CC_MDSS_ESC0_CLK>;
> +			power-domains = <&dispcc MDSS_GDSC>;
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
> +	/* S6c is really ebi.lvl but it's there for supply map completeness sake. */
> +	vreg_s6c_0p88: smpc6-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s6c_0p88";
> +
> +		regulator-min-microvolt = <880000>;
> +		regulator-max-microvolt = <880000>;
> +		regulator-always-on;
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +	reserved-memory {
> +		adsp_mem: memory@8a100000 {
> +			reg = <0x0 0x8a100000 0x0 0x2500000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@8c600000 {
> +			reg = <0x0 0x8c600000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_secure_heap: memory@8c700000 {
> +			reg = <0x0 0x8c700000 0x0 0x4600000>;
> +			no-map;
> +		};
> +
> +		cont_splash_mem: memory@9c000000 {
> +			reg = <0x0 0x9c000000 0x0 0x2300000>;
> +			no-map;
> +		};
> +
> +		ramoops@ffc00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xffc00000 0x0 0x100000>;
> +			record-size = <0x1000>;
> +			console-size = <0x40000>;
> +			msg-size = <0x20000 0x20000>;
> +			ecc-size = <16>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	pm8150-rpmh-regulators {
> +		compatible = "qcom,pm8150-rpmh-regulators";
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
> +		vdd-l1-l8-l11-supply = <&vreg_s6c_0p88>;
> +		vdd-l2-l10-supply = <&vreg_bob>;
> +		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p6>;
> +		vdd-l6-l9-supply = <&vreg_s8c_1p2>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p9>;
> +		vdd-l13-l16-l17-supply = <&vreg_bob>;
> +
> +		/* (S1+S2+S3) - cx.lvl (ARC) */
> +
> +		vreg_s4a_1p8: smps4 {
> +			regulator-name = "vreg_s4a_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5a_1p9: smps5 {
> +			regulator-name = "vreg_s5a_1p9";
> +			regulator-min-microvolt = <1824000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6a_0p6: smps6 {
> +			regulator-name = "vreg_s6a_0p6";
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <1128000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2a_3p1: ldo2 {
> +			regulator-name = "vreg_l2a_3p1";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a_0p9: ldo3 {
> +			regulator-name = "vreg_l3a_0p9";
> +			regulator-min-microvolt = <928000>;
> +			regulator-max-microvolt = <932000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L4 - lmx.lvl (ARC) */
> +
> +		vreg_l5a_0p88: ldo5 {
> +			regulator-name = "vreg_l5a_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6a_1p2: ldo6 {
> +			regulator-name = "vreg_l6a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L7 is unused. */
> +
> +		vreg_l9a_1p2: ldo9 {
> +			regulator-name = "vreg_l9a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L10 is unused, L11 - lcx.lvl (ARC) */
> +
> +		vreg_l12a_1p8: ldo12 {
> +			regulator-name = "vreg_l12a_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L13 is unused. */
> +
> +		vreg_l14a_1p8: ldo14 {
> +			regulator-name = "vreg_l14a_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L15 & L16 are unused. */
> +
> +		vreg_l17a_3p0: ldo17 {
> +			regulator-name = "vreg_l17a_3p0";
> +			regulator-min-microvolt = <2496000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18a_0p9: ldo18 {
> +			regulator-name = "vreg_l18a_0p9";
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/*
> +	 * Remaining regulators that are not yet supported:
> +	 * OLEDB: 4925000-8100000
> +	 * ab: 4600000-6100000
> +	 * ibb: 800000-5400000
> +	 */
> +	pm8150l-rpmh-regulators {
> +		compatible = "qcom,pm8150l-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
> +		vdd-l2-l3-supply = <&vreg_s8c_1p2>;
> +		vdd-l4-l5-l6-supply = <&vreg_bob>;
> +		vdd-l7-l11-supply = <&vreg_bob>;
> +		vdd-l9-l10-supply = <&vreg_bob>;
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-name = "vreg_bob";
> +			regulator-min-microvolt = <3350000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		/*
> +		 * S1-S6 are ARCs:
> +		 * (S1+S2) - gfx.lvl,
> +		 * S3 - mx.lvl,
> +		 * (S4+S5) - mmcx.lvl,
> +		 * S6 - ebi.lvl
> +		 */
> +
> +		vreg_s7c_0p35: smps7 {
> +			regulator-name = "vreg_s7c_0p35";
> +			regulator-min-microvolt = <348000>;
> +			regulator-max-microvolt = <1000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8c_1p2: smps8 {
> +			regulator-name = "vreg_s8c_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1400000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-name = "vreg_l1c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L2-4 are unused. */
> +
> +		vreg_l5c_1p8: ldo5 {
> +			regulator-name = "vreg_l5c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c_2p9: ldo6 {
> +			regulator-name = "vreg_l6c_2p9";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l7c_2p85: ldo7 {
> +			regulator-name = "vreg_l7c_2p85";
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c_1p8: ldo8 {
> +			regulator-name = "vreg_l8c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c_2p9: ldo9 {
> +			regulator-name = "vreg_l9c_2p9";
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l10c_3p3: ldo10 {
> +			regulator-name = "vreg_l10c_3p3";
> +			regulator-min-microvolt = <3296000>;
> +			regulator-max-microvolt = <3296000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_3p0: ldo11 {
> +			regulator-name = "vreg_l11c_3p0";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	pm8009-rpmh-regulators {
> +		compatible = "qcom,pm8009-rpmh-regulators";
> +		qcom,pmic-id = "f";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vreg_bob>;
> +		vdd-l2-supply = <&vreg_s8c_1p2>;
> +		vdd-l5-l6-supply = <&vreg_bob>;
> +		vdd-l7-supply = <&vreg_s4a_1p8>;
> +
> +		vreg_s1f_1p2: smps1 {
> +			regulator-name = "vreg_s1f_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2f_0p5: smps2 {
> +			regulator-name = "vreg_s2f_0p5";
> +			regulator-min-microvolt = <512000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L1 is unused. */
> +
> +		vreg_l2f_1p3: ldo2 {
> +			regulator-name = "vreg_l2f_1p3";
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* L3 & L4 are unused. */
> +
> +		vreg_l5f_2p8: ldo5 {
> +			regulator-name = "vreg_l5f_2p85";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6f_2p8: ldo6 {
> +			regulator-name = "vreg_l6f_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7f_1p8: ldo7 {
> +			regulator-name = "vreg_l7f_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* NXP PN553 NFC @ 28 */
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	clock-frequency = <1000000>;
> +
> +	/* Dual Cirrus Logic CS35L41 amps @ 40, 41 */
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* Dialog SLG51000 CMIC @ 75 */
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* AMS TCS3490 RGB+IR color sensor @ 72 */
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* Samsung touchscreen @ 48 */
> +};
> +
> +&i2c15 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	/* Qcom SMB1390 @ 10 */
> +	/* Silicon Labs SI4704 FM Radio Receiver @ 11 */
> +	/* Qcom SMB1390_slave @ 18 */
> +	/* HALO HL6111R Qi charger @ 25 */
> +	/* Richwave RTC6226 FM Radio Receiver @ 64 */
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
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	vmmc-supply = <&vreg_l9c_2p9>;
> +	vqmmc-supply = <&vreg_l6c_2p9>;
> +	bus-width = <4>;
> +	no-sdio;
> +	no-emmc;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <40 4>, <52 4>;
> +};
> +
> +&uart12 {
> +	status = "okay";
> +};
> +
> +/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
> +&ufs_mem_hc { status = "disabled"; };
> +&ufs_mem_phy { status = "disabled"; };
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	status = "okay";
> +
> +	vdda-pll-supply = <&vreg_l5a_0p88>;
> +	vdda18-supply = <&vreg_l12a_1p8>;
> +	vdda33-supply = <&vreg_l2a_3p1>;
> +};
> +
> +&usb_1_qmpphy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l9a_1p2>;
> +	vdda-pll-supply = <&vreg_l18a_0p9>;
> +};
> -- 
> 2.32.0
> 
