Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58298165826
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 08:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgBTHGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 02:06:20 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35525 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgBTHGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 02:06:20 -0500
Received: by mail-pg1-f194.google.com with SMTP id v23so1461648pgk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 23:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CO2SRXuJi6TRER/vPdV2Su2zqyTZXsjgtSkLNjMCOEI=;
        b=SgC3LNTZYoJvpgnIaZa+ijv3f9/Vqyoa20yDkptEvzsmGBxdX0w1W+3IaGfYbzsY6F
         7paXw6du+QZ4riPi7Zlp5rtV5KmwWIniL6CSJuKMUUkRMTIkCr24rzuwbGaHv6IY0k7I
         Rntd/3iwCN5ux1snHddBo6JiLaBIRrqsnIlhvyB9XVIMAyDSWj/x7fTYx+LjvFKssq4N
         PqaqsdaV17v/I+9zmKXnUcNcIkk0snVY/pl9YZrKfL/FC3bjIdBzXyzi18VLhAEUcKUb
         h7Ep7ZWtGfNxQOoOsbqZ2ll5RMHLqyAyvnJtSsn8yMhyoN0xiWRkFKB5tS2zKjYRgq/2
         fF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CO2SRXuJi6TRER/vPdV2Su2zqyTZXsjgtSkLNjMCOEI=;
        b=C3CsyUwix4/u426X1l6k8Xpk4PCX+6vjgVFhZFSc5ECUOByDISUPYrsflNNDGiPP/e
         KkXurJ/RNCLFa4S6kJIihTGiICqX6UurnEqoilXg5JJrVN1Cbzs3fJGX40OeBHtNuMqn
         tFup/VUYRFF5sEOtcsPs1nkjCXHqPhvnOY7YNTMq+FYIyaTvG5A80nG8Q0YEvSgpKs9v
         rkZMsXh3kmejNg8XZ963WS0UEFXT5lLwfDOdFbvsFI/bDq6WQHkjpmt72019wNoukkn0
         n4Yr6KwcGrN3oqqQDIQOgLCAkQJDXCeTEP36yrTodqIEmbHgXmpZtcAFMebgamRkTKiC
         CBrw==
X-Gm-Message-State: APjAAAUKZCUfiB2iOBcLfTPYrquyHlsuhKCrLjK25Avo5K4QzSRK5Gog
        44x31I02E8Qkw1RPu+PMnPaSNQ==
X-Google-Smtp-Source: APXvYqzLQ810Qo9mVw0Ebje7H6ADDzNMNYfmRw3ylc6E2I7mkN8Ku38MgyeyHx6e+Zo7u8CuOi1muA==
X-Received: by 2002:a63:d207:: with SMTP id a7mr31972697pgg.225.1582182379501;
        Wed, 19 Feb 2020 23:06:19 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l15sm2016483pgi.31.2020.02.19.23.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 23:06:18 -0800 (PST)
Date:   Wed, 19 Feb 2020 23:06:16 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alexey Minnekhanov <alexey.min@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add SDM660 SoC support
Message-ID: <20200220070616.GF99370@yoga>
References: <20200212170916.7494-1-alexey.min@gmail.com>
 <20200212170916.7494-5-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212170916.7494-5-alexey.min@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Feb 09:09 PST 2020, Alexey Minnekhanov wrote:

> Initial device tree support for Qualcomm SDM660 SoC.
> 
> SDM660 is based off MSM8998 and uses some of its drivers.
> SDM630/636 are based off SDM660 SoC and they are pin
> and software compatible.
> 
> The device tree is based on the CAF 4.4 kernel tree.
> 
> Features:
>  * CPU nodes
>  * Timer nodes
>  * Interrupt controller
>  * Global Clock Controller
>  * Top Level Mode Multiplexer (pin controller)
>  * UART node
> 
> This is inspired by and based on the work of Craig Tatlor in
> https://patchwork.kernel.org/patch/10563667/
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>

The content of the patch looks good, but with the S-o-b like this (which
looks correct) the author of the patch should be Craig - which
would/should be noted by a From: Craig at the beginning of the body.

Can you please update this patch accordingly and resend the two dts
patches?

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 373 +++++++++++++++++++++++++++
>  1 file changed, 373 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm660.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> new file mode 100644
> index 000000000000..1187f2f98bd0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -0,0 +1,373 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2018, Craig Tatlor.
> + * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sdm660.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	clocks {
> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32764>;
> +			clock-output-names = "sleep_clk";
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			next-level-cache = <&L2_1>;
> +			L2_1: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +			};
> +			L1_I_100: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_100: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		CPU1: cpu@101 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x101>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			next-level-cache = <&L2_1>;
> +			L1_I_101: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_101: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		CPU2: cpu@102 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x102>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			next-level-cache = <&L2_1>;
> +			L1_I_102: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_102: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		CPU3: cpu@103 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x103>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
> +			next-level-cache = <&L2_1>;
> +			L1_I_103: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_103: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		CPU4: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <640>;
> +			next-level-cache = <&L2_0>;
> +			L2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +			};
> +			L1_I_0: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_0: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		CPU5: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <640>;
> +			next-level-cache = <&L2_0>;
> +			L1_I_1: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_1: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		CPU6: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <640>;
> +			next-level-cache = <&L2_0>;
> +			L1_I_2: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_2: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		CPU7: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo260";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +			capacity-dmips-mhz = <640>;
> +			next-level-cache = <&L2_0>;
> +			L1_I_3: l1-icache {
> +				compatible = "cache";
> +			};
> +			L1_D_3: l1-dcache {
> +				compatible = "cache";
> +			};
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&CPU4>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU5>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU6>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU7>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&CPU0>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU1>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU2>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm";
> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the reg */
> +		reg = <0 0 0 0>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,gcc-sdm660";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			reg = <0x00100000 0x94000>;
> +		};
> +
> +		tlmm: pinctrl@3100000 {
> +			compatible = "qcom,sdm660-pinctrl";
> +			reg = <0x03100000 0x400000>,
> +			      <0x03500000 0x400000>,
> +			      <0x03900000 0x400000>;
> +			reg-names = "south", "center", "north";
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			gpio-ranges = <&tlmm 0 0 114>;
> +			gpio-reserved-ranges = <8 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			uart_console_active: uart_console_active {
> +				pinmux {
> +					pins = "gpio4", "gpio5";
> +					function = "blsp_uart2";
> +				};
> +
> +				pinconf {
> +					pins = "gpio4", "gpio5";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +		};
> +
> +		spmi_bus: spmi@800f000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x0800f000 0x1000>,
> +			      <0x08400000 0x1000000>,
> +			      <0x09400000 0x1000000>,
> +			      <0x0a400000 0x220000>,
> +			      <0x0800a000 0x3000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +			cell-index = <0>;
> +		};
> +
> +		blsp1_uart2: serial@c170000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0x0c170000 0x1000>;
> +			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			status = "disabled";
> +		};
> +
> +		timer@17920000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x17920000 0x1000>;
> +
> +			frame@17921000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17921000 0x1000>,
> +				      <0x17922000 0x1000>;
> +			};
> +
> +			frame@17923000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17923000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17924000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17924000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17925000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17925000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17926000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17926000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17927000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17927000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17928000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x17928000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x17a00000 0x10000>,
> +			      <0x17b00000 0x100000>;
> +			#interrupt-cells = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +	};
> +};
> -- 
> 2.20.1
> 
