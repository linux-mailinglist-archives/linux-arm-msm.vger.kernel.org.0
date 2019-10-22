Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79E1ADF94C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2019 02:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730468AbfJVAIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 20:08:37 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42494 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387479AbfJVAIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 20:08:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id q12so9450711pff.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 17:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aAwx47eAV/iD+3KkVPyczVOoFOM8ks8n8LvoxjpLCAk=;
        b=VmOjvcpM1lqPd0TTAB++M+TGi5KQwKaa+mV62OeIc67I3iBIFqujePKdin5JN6MpSM
         e2WzDegKua6cOkdA1l9dp+yte9tAqeAlUWG+j2FuON586fFA89mP5+9t0je29JZbApB6
         fkjv11kqWNl8Ca+44hd00cQmAdLUx+AqkEaNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aAwx47eAV/iD+3KkVPyczVOoFOM8ks8n8LvoxjpLCAk=;
        b=saQCQM8vAAvVwT/Uy1g4Q70pTSUh+OXB+AcB4SmXkogm/M1x7sKA3oo4DwUMCj29rB
         uU34n+5zEbf2o31dyOuHW9jj+4Fyloh4vv7V6kFXccvY25kVirw/G+ag9WlTKAEaHlYT
         s5hWqYEr3WR3SBdcI6b/A5OzRY8otABewzGR4KF9cOt17JVRoi8GWICbKfVNqAxF6MEZ
         cw3F8PfvT9/ypMY6usy9gVKh36XGxFD986V7/9R2prZUiIYhzQqAINw2zB5JikEXWx7q
         SWk0fh38bHtdyOSkHg9IDJlkyLLauN+qJJe9lNcqEibmvF5suurqTXuz6Kgp1OducfEE
         Rzag==
X-Gm-Message-State: APjAAAVMv4rXUen9ddOqYAH5zxI1CslRepwxHW4BMz7YDtzMHdvNY20E
        URnoSH88OCogmnnJOLaLjirobw==
X-Google-Smtp-Source: APXvYqybn5q5R28ruRql3U/b82jLl+EY0VJbxDNYiksVKj4UNaGQP/UKPRS8cRREZ+rkTK62wrxwoA==
X-Received: by 2002:a65:628e:: with SMTP id f14mr624588pgv.114.1571702915472;
        Mon, 21 Oct 2019 17:08:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id cx22sm13860740pjb.19.2019.10.21.17.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 17:08:34 -0700 (PDT)
Date:   Mon, 21 Oct 2019 17:08:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 02/13] arm64: dts: sc7180: Add minimal dts/dtsi files
 for SC7180 soc
Message-ID: <20191022000833.GI20212@google.com>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
 <20191021065522.24511-3-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191021065522.24511-3-rnayak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

I don't have all the hardware documentation for a full review, but
find a few comments inline.

On Mon, Oct 21, 2019 at 12:25:11PM +0530, Rajendra Nayak wrote:
> Add skeletal sc7180 SoC dtsi and idp board dts files.
> 
> Co-developed-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> v2:
> * Sorted the nodes in alphabetical order
> * Dropped the bi_tcxo/bi_tcxo_ao nodes
> 
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  47 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 300 ++++++++++++++++++++++++
>  3 files changed, 348 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-idp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6498a1ec893f..7a5c2f7fe37f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> new file mode 100644
> index 000000000000..f8b7e098f5b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * SC7180 IDP board device tree source
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SC7180 IDP";
> +	compatible = "qcom,sc7180-idp";
> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +/* PINCTRL - additions to nodes defined in sc7180.dtsi */
> +
> +&qup_uart2_default {
> +	pinconf-tx {
> +		pins = "gpio44";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	pinconf-rx {
> +		pins = "gpio45";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};

This config seems reasonable as default for a UART in general.
Would it make sense to configure these in the SoC .dtsi?

> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> new file mode 100644
> index 000000000000..82bf7cdce6b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * SC7180 SoC device tree source
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/clock/qcom,gcc-sc7180.h>

Note: depends on "Add Global Clock controller (GCC) driver for SC7180"
(https://patchwork.kernel.org/project/linux-arm-msm/list/?submitter=179717)
which isn't merged yet.

> +#include <dt-bindings/interrupt-controller/arm-gic.h>
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
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			clock-output-names = "xo_board";
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32764>;
> +			clock-output-names = "sleep_clk";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +			L2_0: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +				L3_0: l3-cache {
> +					compatible = "cache";
> +				};
> +			};
> +		};
> +
> +		CPU1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_100>;
> +			L2_100: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x200>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_200>;
> +			L2_200: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x300>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_300>;
> +			L2_300: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x400>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_400>;
> +			L2_400: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x500>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_500>;
> +			L2_500: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x600>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_600>;
> +			L2_600: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x700>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_700>;
> +			L2_700: l2-cache {
> +				compatible = "cache";
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg = <0 0x80000000 0 0>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	soc: soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0  0x10 0>;
> +		compatible = "simple-bus";
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,gcc-sc7180";



> +			reg = <0 0x00100000 0 0x1f0000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		qupv3_id_0: geniqup@ac0000 {

The QUP enumeration is a bit confusing. The Hardware Register
Description has QUPV3_0_QUPV3_ID_0 at 0x00800000 and
QUPV3_1_QUPV3_ID_0 at 0x00a00000. This QUP apparently is
the latter. In the SDM845 DT the QUP @ac0000 has the label
'qupv3_id_1', I guess this should be the same here.

> +			compatible = "qcom,geni-se-qup";
> +			reg = <0 0x00ac0000 0 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			uart2: serial@a88000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0 0x00a88000 0 0x4000>;

Related to the comment above: on SDM845 this UART has the label
'uart10'. I understand these are different SoCs, but could you
please clarify the enumeration of the SC7180 QUPs and their ports?

> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_uart2_default>;
> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		tlmm: pinctrl@3500000 {
> +			compatible = "qcom,sc7180-pinctrl";
> +			reg = <0 0x03500000 0 0x300000>,
> +			      <0 0x03900000 0 0x300000>,
> +			      <0 0x03d00000 0 0x300000>;
> +			reg-names = "west", "north", "south";
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 120>;
> +
> +			qup_uart2_default: qup-uart2-default {
> +				pinmux {
> +					pins = "gpio44", "gpio45";
> +					function = "qup12";
> +				};
> +			};
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0 0x17a00000 0 0x10000>,     /* GICD */
> +			      <0 0x17a60000 0 0x100000>;    /* GICR * 8 */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			gic-its@17a40000 {
> +				compatible = "arm,gic-v3-its";
> +				msi-controller;
> +				#msi-cells = <1>;
> +				reg = <0 0x17a40000 0 0x20000>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		timer@17c20000{
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0 0x17c20000 0 0x1000>;
> +
> +			frame@17c21000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0 0x17c21000 0 0x1000>,
> +				      <0 0x17c22000 0 0x1000>;
> +			};
> +
> +			frame@17c23000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0 0x17c23000 0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c25000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0 0x17c25000 0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c27000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0 0x17c27000 0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c29000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0 0x17c29000 0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c2b000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0 0x17c2b000 0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c2d000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0 0x17c2d000 0 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
