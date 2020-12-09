Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BB92D4E9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 00:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgLIXRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 18:17:11 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46309 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728541AbgLIXRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 18:17:11 -0500
Received: by mail-oi1-f194.google.com with SMTP id k2so3613133oic.13;
        Wed, 09 Dec 2020 15:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N/2xsxFfQ+Ilf7cwB3nPH6ptlpewBAhxOfqNmniGrZk=;
        b=ZKrUQjWWCM2q1y82OUxx1tfP5vAIoc5wtgZdU8jIo4ZmbIeTBO+HS3RYFh1LYxYUGx
         kGkhQYthYDw/njNz/1v+Ux2GdyXLMz+FetVGp9R0jf06B0jfafUYaWUW6zz2vZZZQrPU
         qNm7b401XdXDh6MsiFgiLxL7Mly+RbP3V85tGWALqSs7EqYda4C1uoPBpgiqbqO9RgY4
         smJ6GQcRlIj78vK1TtzsD8XseVfG5FFgmsdjqKeNh8iVfLsEWinqAEfeTfFggjRoGLFw
         rhqDMqH7uejCSLy2ZZ49nsvRYYnXtx3cv6DLxKtY7V+Yp6JYC0ZdHOce+nE3G6zEMMrY
         jnrg==
X-Gm-Message-State: AOAM530wwwtUkVMxEhWRgFymKWbJxYC6HTtI61HgOLaJPpSiWOBPuAGf
        sVjtoav0HnzHj5N7WUYqsSThvQNo+g==
X-Google-Smtp-Source: ABdhPJyl7qvZkLXrf/OJTwcL2KWpIwkRGGvAuU2dtB0+To6FdG7VRIlcvw8XuIa2thDl6G4HoxZ74A==
X-Received: by 2002:aca:b686:: with SMTP id g128mr3566116oif.82.1607555789523;
        Wed, 09 Dec 2020 15:16:29 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t3sm623328oon.14.2020.12.09.15.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 15:16:28 -0800 (PST)
Received: (nullmailer pid 1263068 invoked by uid 1000);
        Wed, 09 Dec 2020 23:16:27 -0000
Date:   Wed, 9 Dec 2020 17:16:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add basic devicetree support for
 SM8350-MTP board
Message-ID: <20201209231627.GA1258791@robh.at.kernel.org>
References: <20201204054347.2877857-1-vkoul@kernel.org>
 <20201204054347.2877857-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204054347.2877857-5-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 04, 2020 at 11:13:47AM +0530, Vinod Koul wrote:
> Add basic devicetree support for Qualcomm Technologies, Inc SM8350 SoC
> MTP board. This enabled uart node and adds rpmh-regulators present for
> this board.

Please make sure this is warning free with dtbs_check.

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 246 ++++++++++++++++++++++++
>  2 files changed, 247 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index fb4631f898fd..cad6a1413c8b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -43,3 +43,4 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> new file mode 100644
> index 000000000000..d7b2448530ff
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8350.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. sm8350 MTP";
> +	compatible = "qcom,sm8350-mtp";
> +
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
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		vreg_s11b_0p95: smps11 {
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		vreg_s12b_1p25: smps12 {
> +			regulator-min-microvolt = <1224000>;
> +			regulator-max-microvolt = <1360000>;
> +		};
> +
> +		vreg_l1b_0p88: ldo1 {
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p07: ldo2 {
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3b_0p9: ldo3 {
> +			regulator-min-microvolt = <904000>;
> +			regulator-max-microvolt = <904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5b_0p88: ldo5 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <888000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p2: ldo6 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1208000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p96: ldo7 {
> +			regulator-min-microvolt = <2400000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
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
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1952000>;
> +		};
> +
> +		vreg_s2c_0p8: smps2 {
> +			regulator-min-microvolt = <640000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		vreg_s10c_1p05: smps10 {
> +			regulator-min-microvolt = <1048000>;
> +			regulator-max-microvolt = <1128000>;
> +		};
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_1p8: ldo2 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_3p0: ldo3 {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_uim1: ldo4 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5c_uim2: ldo5 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c_1p8: ldo6 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c_3p0: ldo7 {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c_1p8: ldo8 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c_2p96: ldo9 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c_1p2: ldo10 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_2p96: ldo11 {
> +			regulator-min-microvolt = <2400000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12c_1p8: ldo12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13c_3p0: ldo13 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> -- 
> 2.26.2
> 
