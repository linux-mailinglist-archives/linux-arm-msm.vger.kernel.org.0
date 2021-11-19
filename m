Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DE24568CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 04:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbhKSDyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 22:54:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234325AbhKSDyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 22:54:17 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C31C061748
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 19:51:16 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id r18-20020a4a7252000000b002c5f52d1834so3302207ooe.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1nj1ASBa7FEq7kZAc1bZKU4KaQNBQCHKjgiWn65lhj0=;
        b=YWAxxAvU5mkLGWGpALQscnzj1Avt3GgAZzmksPC4B1efQ1fQ8u+dWLpXy1kcQ42Mfh
         Z0d7yRqj+hBNH++zPnEdIj4HNo565bNDobn3GV/Sza5C60ViAhyPABgd38bplh/L+Od6
         T+vm4wQw7oTZYgs+dMlG2XulLjrPPOsfiYUP9vr0Mv8iY6AgnIFdMDReUpWf+8upon1H
         K9/7vGH+da6rGvxXcj2abCQrvG+Q4QLh276bBmpENht1LQIfhmQJzP6E7ZB557g7p3sS
         gRRYOA/Y4Z1ax0IhooXDR5Gf+G1u2BDAynzKuarkNKLTQCT07CXSyAg+GE40z+vieEMw
         mm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1nj1ASBa7FEq7kZAc1bZKU4KaQNBQCHKjgiWn65lhj0=;
        b=7qyU5UramWZ5FxCdIZp2DB/mE0EMgtT0wDx+d8PRfyAO4rA+hEsZVHxHnuQPmNciIM
         J1OiKgYAu0ausvAvAcje0j5qnl6ZtvCpir/cvQ82gUV56DqR7JQlcsXiAcoefhh8wJUG
         d9CJFMsdROjeWyLqgQZfG+DAJMwnF3rAP3PGs4535zFCdK+ywjuCXPFxjrEfUW0qs6qb
         XzpAuKujoUbFiBkn3S8WrVfEja5Z5y2svGtuO1JCdL/+MQ3GJcD1o/qfcJtJyQNnWcPS
         QouznF0cxQLg7aN5EYgYWYRl1GuBNhyW6MCLqJQXRiNSMaMOYWEjur5X8eWPaxwBR8bO
         aiiw==
X-Gm-Message-State: AOAM532Jfaij/BNd0tgwQcDGvIaIFzmwMg5klqV1rp0HhtxZ7uXsW8aa
        onfl1C0dg+MFIW7Klj/+CziFiQ==
X-Google-Smtp-Source: ABdhPJzKWLfNAekvebL6fYNjAZQH5eDSesUM9fZjFGBHoGFTycUNF83k3qAz9ZFpiFrd4PbsNLWbWA==
X-Received: by 2002:a4a:9d16:: with SMTP id w22mr16360072ooj.66.1637293875192;
        Thu, 18 Nov 2021 19:51:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z14sm334110otk.36.2021.11.18.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 19:51:14 -0800 (PST)
Date:   Thu, 18 Nov 2021 21:51:10 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Katherine Perez <kaperez@linux.microsoft.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [RESEND PATCH 1/2] arm64: dts: add minimal DTS for Microsoft
 Surface Duo2
Message-ID: <YZcfLkzinKwKhhJK@builder.lan>
References: <20211116235045.3748572-1-kaperez@linux.microsoft.com>
 <20211116235045.3748572-2-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116235045.3748572-2-kaperez@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 16 Nov 17:50 CST 2021, Katherine Perez wrote:

> This is a minimal devicetree for Microsoft Surface Duo 2 with SM8350
> Chipset
> 

Thanks Katherine, really nice to see this initial support. Looking
forward to see it grow. Just two small nits below.

> Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/sm8350-microsoft-surface-duo2.dts    | 363 ++++++++++++++++++
>  2 files changed, 364 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6b816eb33309..a8cc6bd3c423 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -106,4 +106,5 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-microsoft-surface-duo2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> new file mode 100644
> index 000000000000..941eac43614f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> @@ -0,0 +1,363 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (C) 2021, Microsoft Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8350.dtsi"
> +#include "pm8350.dtsi"
> +#include "pm8350b.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"
> +#include "pmr735b.dtsi"
> +
> +/ {
> +	model = "Microsoft Surface Duo 2";
> +	compatible = "microsoft,surface-duo2", "qcom,sm8350";
> +

Can you please add:

	chassis-type = "handset";

> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&adsp {
> +	status = "okay";
> +	firmware-name = "qcom/sm8350/adsp.mbn";

I have hopes that we'll be able to push some engineering signed versions
of these firmware files, for e.g. the SM8350 HDK one day.

When that happens that would conflict with your firmware path and I
don't expect your devices to accept the "invalid" signature of those
files.

So I would prefer if you follow Felipe's naming scheme and put these
(this and the other remoteprocs) in:

  qcom/sm8350/microsoft/*

Thanks,
Bjorn

> +};
> +
> +&apps_rsc {
> +	pm8350-rpmh-regulators {
> +		compatible = "qcom,pm8350-rpmh-regulators";
> +		qcom,pmic-id = "b";
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
> +
> +		vdd-l1-l4-supply = <&vreg_s11b_0p95>;
> +		vdd-l2-l7-supply = <&vreg_bob>;
> +		vdd-l3-l5-supply = <&vreg_bob>;
> +		vdd-l6-l9-l10-supply = <&vreg_s11b_0p95>;
> +		vdd-l8-supply = <&vreg_s2c_0p8>;
> +
> +		vreg_s10b_1p8: smps10 {
> +			regulator-name = "vreg_s10b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		vreg_s11b_0p95: smps11 {
> +			regulator-name = "vreg_s11b_0p95";
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		vreg_s12b_1p25: smps12 {
> +			regulator-name = "vreg_s12b_1p25";
> +			regulator-min-microvolt = <1224000>;
> +			regulator-max-microvolt = <1360000>;
> +		};
> +
> +		vreg_l1b_0p88: ldo1 {
> +			regulator-name = "vreg_l1b_0p88";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p07: ldo2 {
> +			regulator-name = "vreg_l2b_3p07";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3b_0p9: ldo3 {
> +			regulator-name = "vreg_l3b_0p9";
> +			regulator-min-microvolt = <904000>;
> +			regulator-max-microvolt = <904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5b_0p88: ldo5 {
> +			regulator-name = "vreg_l3b_0p9";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <888000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p2: ldo6 {
> +			regulator-name = "vreg_l6b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1208000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p96: ldo7 {
> +			regulator-name = "vreg_l7b_2p96";
> +			regulator-min-microvolt = <2400000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
> +			regulator-name = "vreg_l9b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	pm8350c-rpmh-regulators {
> +		compatible = "qcom,pm8350c-rpmh-regulators";
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
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +
> +		vdd-l1-l12-supply = <&vreg_s1c_1p86>;
> +		vdd-l2-l8-supply = <&vreg_s1c_1p86>;
> +		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
> +		vdd-l6-l9-l11-supply = <&vreg_bob>;
> +		vdd-l10-supply = <&vreg_s12b_1p25>;
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_s1c_1p86: smps1 {
> +			regulator-name = "vreg_s1c_1p86";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1952000>;
> +		};
> +
> +		vreg_s2c_0p8: smps2 {
> +			regulator-name = "vreg_s2c_0p8";
> +			regulator-min-microvolt = <640000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		vreg_s10c_1p05: smps10 {
> +			regulator-name = "vreg_s10c_1p05";
> +			regulator-min-microvolt = <1048000>;
> +			regulator-max-microvolt = <1128000>;
> +		};
> +
> +		vreg_bob: bob {
> +			regulator-name = "vreg_bob";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-name = "vreg_l1c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_1p8: ldo2 {
> +			regulator-name = "vreg_l2c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_3p0: ldo3 {
> +			regulator-name = "vreg_l3c_3p0";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_uim1: ldo4 {
> +			regulator-name = "vreg_l4c_uim1";
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5c_uim2: ldo5 {
> +			regulator-name = "vreg_l5c_uim2";
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c_1p8: ldo6 {
> +			regulator-name = "vreg_l6c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c_3p0: ldo7 {
> +			regulator-name = "vreg_l7c_3p0";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
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
> +		vreg_l9c_2p96: ldo9 {
> +			regulator-name = "vreg_l9c_2p96";
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c_1p2: ldo10 {
> +			regulator-name = "vreg_l10c_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_2p96: ldo11 {
> +			regulator-name = "vreg_l11c_2p96";
> +			regulator-min-microvolt = <2400000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12c_1p8: ldo12 {
> +			regulator-name = "vreg_l12c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13c_3p0: ldo13 {
> +			regulator-name = "vreg_l13c_3p0";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&cdsp {
> +	status = "okay";
> +	firmware-name = "qcom/sm8350/cdsp.mbn";
> +};
> +
> +&ipa {
> +	status = "okay";
> +
> +	memory-region = <&pil_ipa_fw_mem>;
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&slpi {
> +	status = "okay";
> +	firmware-name = "qcom/sm8350/slpi.mbn";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <9 8>;
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	status = "okay";
> +
> +	reset-gpios = <&tlmm 203 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +};
> +
> +&ufs_mem_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l5b_0p88>;
> +	vdda-max-microamp = <91600>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +	vdda-pll-max-microamp = <19000>;
> +};
> +
> +&usb_1 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	status = "okay";
> +
> +	vdda-pll-supply = <&vreg_l5b_0p88>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +	vdda33-supply = <&vreg_l2b_3p07>;
> +};
> +
> +&usb_1_qmpphy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l6b_1p2>;
> +	vdda-pll-supply = <&vreg_l1b_0p88>;
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	status = "okay";
> +
> +	vdda-pll-supply = <&vreg_l5b_0p88>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +	vdda33-supply = <&vreg_l2b_3p07>;
> +};
> +
> +&usb_2_qmpphy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l6b_1p2>;
> +	vdda-pll-supply = <&vreg_l5b_0p88>;
> +};
> -- 
> 2.31.1
> 
