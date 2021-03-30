Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50E334DF7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhC3Dl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhC3DlG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:41:06 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1F3C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:41:05 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 125-20020a4a1a830000b02901b6a144a417so3451519oof.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R5DnXj5JMwGYgLeYbNNzgz0sybFWEJe/tT4bzed1uWw=;
        b=JZQqRbpd4dZ8jRSO7uxccTyXYklG+14Kb4jf+rvC8nOXnSkx1xIw05zeegfmUkbn65
         vO1v5RKkqzmP4YxNpgGJEltv8FtAArebTr1dTnvpjReugBegj37uZHJlzUdMlAoFezxI
         RZQGrKZNCaTK+Nwo1+QG3I+WuCn+nGgQ3PPBTp2Pd0d/IENX0qVuRf4kzU+rY6pPpUqG
         cnJCyGM+rVswIpCEIBsL4l2zb3CX3WeLS3KTxDnd1zdq6ntZhflOzrVoYEobO62yLs0g
         QkhIFzekjvEKt0sb0zlcCatNk7z4La28eLIw6bES+EDYZsvCpMwcHOMmd7JXQK33vPGD
         z3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R5DnXj5JMwGYgLeYbNNzgz0sybFWEJe/tT4bzed1uWw=;
        b=P+wcLIrwnm+ChJLwcFTUQtdo0ZMASPnEHpCeFp6UU3rWdv3h10RrWGEC+207gGU0GT
         OLoM7BnoprQgGui8Y2KMwz24yP8PaqVvYbRiEqxxjEyQI6I3yikPmjzssa+EN6B2tbv/
         TQjsKubEqLpdoyUX/3MsPrG+DYDudsBoj7dNX/io8PsfaroUhwRxOBNn+K2U+OU5HqDm
         BNh3gGmg3ALSlpzF5V5Zynrq/EpSooPtGCZkng6eb2V40KdQpCvSosMI8E2MceLpcyW4
         iBUOOuw7zySH7tRJv/iBked9SIuln70lJPbiI0Xd5Ygv/PKNJFIAJYrg2vjh1n19Yzxx
         8mIA==
X-Gm-Message-State: AOAM530GjcFlT5iIXnraLqq4oKoMuz7zC6FD8bCjO5E7g+TVh8ppwqaX
        a72iDhAjUbCYJ89CdSciV62kww==
X-Google-Smtp-Source: ABdhPJw2rOmcLo28VVQMtOuGXcfGwY870/kcdcwRU5b0o22efAkukGUJDHRjiiXJgfEK0i35yIKJvg==
X-Received: by 2002:a4a:45d5:: with SMTP id y204mr23766808ooa.33.1617075664341;
        Mon, 29 Mar 2021 20:41:04 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 62sm3075739oto.60.2021.03.29.20.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:41:03 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:41:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] arm: dts: qcom: Add support for MSM8226 SoC
Message-ID: <YGKdzliUKqd38uLw@builder.lan>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
 <20210326145816.9758-4-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326145816.9758-4-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 26 Mar 09:58 CDT 2021, Bartosz Dudziak wrote:

> This patch adds basic device tree support for MSM8226 SoC which belongs
> to the Snapdragon 400 family. For now, this file adds the basic nodes
> like gcc, pinctrl and other required configuration for booting up to
> the serial console.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 152 ++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> new file mode 100644
> index 0000000000..81bb19398e
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0

Can you please make this BSD license?

> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-msm8974.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	model = "Qualcomm Technologies, Inc. MSM8226";
> +	compatible = "qcom,msm8226";

model and compatible should always be specified in the .dts, so the ones
specified here would be overwritten. So drop them here.

> +	interrupt-parent = <&intc>;
> +
> +	chosen { };
> +
> +	memory {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg = <0x0 0x0>;
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		compatible = "simple-bus";
> +
> +		intc: interrupt-controller@f9000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0xF9000000 0x1000>,
> +			      <0xF9002000 0x1000>;
> +		};
> +
> +		gcc: clock-controller@fc400000 {
> +			compatible = "qcom,gcc-msm8226";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			reg = <0xfc400000 0x4000>;
> +		};
> +
> +		msmgpio: pinctrl@fd510000 {

Rename the label "tlmm"

> +			compatible = "qcom,msm8226-pinctrl";
> +			reg = <0xfd510000 0x4000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&msmgpio 0 0 117>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		blsp1_uart3: serial@f991f000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0xf991f000 0x1000>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			status = "disabled";
> +		};
> +
> +		restart@fc4ab000 {
> +			compatible = "qcom,pshold";
> +			reg = <0xfc4ab000 0x4>;
> +		};
> +
> +		rng@f9bff000 {
> +			compatible = "qcom,prng";
> +			reg = <0xf9bff000 0x200>;
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "core";
> +		};
> +
> +		timer@f9020000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";

It's nice to have compatible & reg first in the nodes.

Regards,
Bjorn

> +			reg = <0xf9020000 0x1000>;
> +			clock-frequency = <19200000>;
> +
> +			frame@f9021000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xf9021000 0x1000>,
> +				      <0xf9022000 0x1000>;
> +			};
> +
> +			frame@f9023000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xf9023000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@f9024000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xf9024000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@f9025000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xf9025000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@f9026000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xf9026000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@f9027000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xf9027000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@f9028000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xf9028000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 2
> +				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 3
> +				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 4
> +				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 1
> +				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <19200000>;
> +	};
> +};
> -- 
> 2.25.1
> 
