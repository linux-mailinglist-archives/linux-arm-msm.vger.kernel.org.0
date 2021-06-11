Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7BB3A39B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 04:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhFKC2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 22:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbhFKC2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 22:28:07 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEF7C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 19:25:57 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 102-20020a9d0eef0000b02903fccc5b733fso1740208otj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IjaHeZmvkpeFh6CIfGhXwuSQrGCOdALjcUAdiW8WWjU=;
        b=E25Jh+rCQJyItREai2cRgb2J7R0Ev1dQp5dFjeAHzXlTacCQbjNGk0qfn7EPM0nlBk
         hgfQqzTqhtG0XnL4gQjZah4JG8VQF8LAtppcLhE6cn2YNIahQbArzjF7wRJ3J2UsfXme
         T9pSVFzQZoIbu0V+FOqYWwoKTsv13aBxM12vnm4+8pua8IEBAZQRM0i8n6flrHrik92H
         2T0monIFdXDRe8t0z+KaBLLY2mmk1o268DMLjuLqUcAGeqS63pMVfA5Pujg+Nf/ehNpR
         BydTl3tiSCrvruHINMwLtZRLoyhg0CqlOk+3/amD0xnEXPEpKRHGTAh/Ybm+nC6G3sZr
         Stzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IjaHeZmvkpeFh6CIfGhXwuSQrGCOdALjcUAdiW8WWjU=;
        b=FgxJUU8QVgcAT5MFxOBItXRKZWX4NUKA5axSnDBiH3RgAt7PTLm0EafP0sI06AODZn
         2FZO9x83F6URsHVzwHgXA6aozpmEUxzNI8wIyIg2z+oRkmq3L+VqkCm60RnbdHvwXECm
         xhm209QOHt6azscIWgVdEqFV7FJzbIhOD+nuudm4idJJBJt7MibdRiwFOXam4CN/4TRk
         rDQa/L/aX5cKVxqpcWHT/chUVr0JSmZcpq5GsMKwVeHX+3m2fDbyZv+Br6ZmhsmY+tjr
         iK8DhGQv6vsWkY46LNFLGLDB3oGgZL5MpK0n1WOIJNZCyBdUxHPwjLxH5rlgfvdWaM3x
         GcWw==
X-Gm-Message-State: AOAM5337DeotNFN72f6v3PuwbCEKsdni3DzEPaMTzpRxvfGjppxXfJyl
        /J2doo2HsBni8s7iDoqcuGHs1g==
X-Google-Smtp-Source: ABdhPJyH9UXs091VevqePZMC9ooFDYkYXbSPKywR4X4SSB7g9iwor+mOFv6s8k0fSAczLDFlO7F+fg==
X-Received: by 2002:a9d:589:: with SMTP id 9mr1051074otd.65.1623378356510;
        Thu, 10 Jun 2021 19:25:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x2sm878974oog.10.2021.06.10.19.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:25:56 -0700 (PDT)
Date:   Thu, 10 Jun 2021 21:25:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sa8155p-adp: Add base dts file
Message-ID: <YMLJsieGd+G+/kxK@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-9-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-9-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> Add base DTS file for sa8155p-adp and enable boot to console,

Please spell out "sa8155-adp", i.e. "Add base DTS for SA8155p Automotive
Development Platform."

> tlmm reserved range and also include pmic file(s).
> 
> SA8155p-adp board is based on sm8150 Qualcomm Snapdragon SoC.
> 

It's not based on sm8150, it's based on sa8155p, so let's express this
as "The SA8155p platform is similar to the SM8150, so use this as base
for now", to document why we decided to do this.

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: bhupesh.linux@gmail.com

This would go into the git history as "I specifically asked for input
from these people", so please keep this list shorter (but for a change
like this it's probably better to omit it completely)

> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 363 +++++++++++++++++++++++
>  2 files changed, 364 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 456502aeee49..38d3a4728871 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -71,6 +71,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> new file mode 100644
> index 000000000000..470d740e060a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> @@ -0,0 +1,363 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "sm8150.dtsi"
> +#include "pmm8155au_1.dtsi"
> +#include "pmm8155au_2.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SA8155P ADP";
> +	compatible = "qcom,sa8155p-adp";
> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	vreg_3p3: vreg_3p3_regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	/*
> +	 * Apparently RPMh does not provide support for PM8150 S4 because it
> +	 * is always-on; model it as a fixed regulator.
> +	 */

You can reduce this to

	/* S4A is always on and not controllable through RPMh */

> +	vreg_s4a_1p8: smps4 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vreg_3p3>;
> +	};
> +};
> +
> +&apps_rsc {
> +	pmm8155au-1-rpmh-regulators {
> +		compatible = "qcom,pmm8155au-1-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vdd-s1-supply = <&vreg_3p3>;
> +		vdd-s2-supply = <&vreg_3p3>;
> +		vdd-s3-supply = <&vreg_3p3>;
> +		vdd-s4-supply = <&vreg_3p3>;
> +		vdd-s5-supply = <&vreg_3p3>;
> +		vdd-s6-supply = <&vreg_3p3>;
> +		vdd-s7-supply = <&vreg_3p3>;
> +		vdd-s8-supply = <&vreg_3p3>;
> +		vdd-s9-supply = <&vreg_3p3>;
> +		vdd-s10-supply = <&vreg_3p3>;
> +
> +		vdd-l1-l8-l11-supply = <&vreg_s6a_0p92>;
> +		vdd-l2-l10-supply = <&vreg_3p3>;
> +		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p92>;
> +		vdd-l6-l9-supply = <&vreg_s6a_0p92>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> +		vdd-l13-l16-l17-supply = <&vreg_3p3>;
> +
> +		vreg_s5a_2p04: smps5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2000000>;
> +		};
> +
> +		vreg_s6a_0p92: smps6 {
> +			regulator-min-microvolt = <920000>;
> +			regulator-max-microvolt = <1128000>;
> +		};
> +
> +		vdda_wcss_pll:

This is the "label" of the pad which the regulator typically is
connected to (rather than a denotion of which regulator it is). So even
though we have these in some of the other boards, I would prefer if you
skip them and only use the vreg_xyz_abc variant.

> +		vreg_l1a_0p752: ldo1 {
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <752000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
[..]
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";

We have enough pieces to handle mode switching on this platform, but as
discussed, lets leave it as "peripheral" until your local setup is back
online.

Thanks,
Bjorn

> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> -- 
> 2.31.1
> 
