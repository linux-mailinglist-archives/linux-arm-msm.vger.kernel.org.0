Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53B4817F068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 07:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgCJGRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 02:17:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37042 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgCJGRg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 02:17:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id p14so6000210pfn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 23:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xSBzT/Nb7gaIK9fzoLfEg/u0ShbVNm8kh2wotDP5Sks=;
        b=HFkGluTFPPZ1qGwUfq4B6e/yS1E1m6SJFjdUCB2LZp9wxBLcuVqAOLTPKZ2Gokrehi
         2gg8WwiPCkvAx5TyuDdvDxcXd2Vj1vm5sPGYlKYEuDO9Hhps64/mby+Q+SWSvPMqNCfT
         sITZJakudN+5ZtM4Ljh7f7A7GqT6FKd0uLDsssVs3t2t+HlRwT0swpYtp7WKGLlMSpla
         IGENN8iTcdtDxo+0kW2wR/B3Uso1/vshP17Vz/NZfJLbdf4pBkmhglsVGVLxdNavnGAd
         qrJ+Max/AiVGxdY9TOkGCbd6vjPAYNEfEisD2XehDsUdFD2Oc0UkS6sAHdcpbD96VBvb
         06Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xSBzT/Nb7gaIK9fzoLfEg/u0ShbVNm8kh2wotDP5Sks=;
        b=pgvxTt0TdEZfhGbmU117OP3BiL+khIFeti+n6ljM8mD7ZpNhRe67hmdfykjngaPv6w
         4ub7WbaQPr6xv+ENM73BunZuducFyYIpMVsd4gIeJuAo32nholpCy2RwGRru8tRBmmAR
         hOwELA/mrjqwjkJfeXTx7r77q76pQuaT8BkPvJAmstwyvdxKSPOsEjy80Cj3pfSJn8DP
         2tfrNpkk5vTqce9zuOjVPy6k3bFLHYi8ZiEBkieCv5kAJS4QDN2KwBUoQjJ8pB2XU6r7
         wOXFfqoU05o5J4Z3OSnlaT/s8mOVgW//XSS4UIv3b9huI5cx7RkwnhkT5kPkxMgldW93
         Rh3w==
X-Gm-Message-State: ANhLgQ060kW0I+d0rxyvzlwhrobO0QzsyL5oQXHaM8ZLevmtXDy6rbRs
        Jz6WCqa344t7whlwmpttAOtJEA==
X-Google-Smtp-Source: ADFU+vvf5ZWZHt/ybM5B96/HvojAnJSU4rVLuRTXuCkqSJc5kbZpVFsq46Eo0zxjJ09mRhjD1dPrVA==
X-Received: by 2002:a62:1905:: with SMTP id 5mr19381313pfz.191.1583821054783;
        Mon, 09 Mar 2020 23:17:34 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c15sm1337897pja.30.2020.03.09.23.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:17:34 -0700 (PDT)
Date:   Mon, 9 Mar 2020 23:17:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add sm8250 dts file
Message-ID: <20200310061731.GF1098305@builder>
References: <20200310050910.506854-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310050910.506854-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 09 Mar 22:09 PDT 2020, Vinod Koul wrote:

> From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> 
> Add sm8250 devicetree file for SM8250 SoC and SM8250 MTP platform.
> This file adds the basic nodes like cpu, psci and other required
> configuration for booting up to the serial console.
> 
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Thanks for resending Vinod, applied.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts |  29 ++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi    | 444 ++++++++++++++++++++++++
>  3 files changed, 474 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 973c0f079659..c6014c0340ed 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -22,5 +22,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> new file mode 100644
> index 000000000000..224d0f1ea6f9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "sm8250.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SM8250 MTP";
> +	compatible = "qcom,sm8250-mtp";
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
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> new file mode 100644
> index 000000000000..1373bc53dec9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
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
> +			#clock-cells = <0>;
> +			clock-frequency = <38400000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <1>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +			L2_0: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +				L3_0: l3-cache {
> +				      compatible = "cache";
> +				};
> +			};
> +		};
> +
> +		CPU1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_100>;
> +			L2_100: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x200>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_200>;
> +			L2_200: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x300>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_300>;
> +			L2_300: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x400>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_400>;
> +			L2_400: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x500>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_500>;
> +			L2_500: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +			};
> +
> +		};
> +
> +		CPU6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x600>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_600>;
> +			L2_600: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "qcom,kryo485";
> +			reg = <0x0 0x700>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_700>;
> +			L2_700: l2-cache {
> +			      compatible = "cache";
> +			      next-level-cache = <&L3_0>;
> +			};
> +		};
> +	};
> +
> +	firmware {
> +		scm: scm {
> +			compatible = "qcom,scm";
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	tcsr_mutex: hwlock {
> +		compatible = "qcom,tcsr-mutex";
> +		syscon = <&tcsr_mutex_regs 0 0x1000>;
> +		#hwlock-cells = <1>;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg = <0x0 0x80000000 0x0 0x0>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		hyp_mem: memory@80000000 {
> +			reg = <0x0 0x80000000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_aop_mem: memory@80700000 {
> +			reg = <0x0 0x80700000 0x0 0x160000>;
> +			no-map;
> +		};
> +
> +		cmd_db: memory@80860000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x80860000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: memory@80900000 {
> +			reg = <0x0 0x80900000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		removed_mem: memory@80b00000 {
> +			reg = <0x0 0x80b00000 0x0 0x5300000>;
> +			no-map;
> +		};
> +
> +		camera_mem: memory@86200000 {
> +			reg = <0x0 0x86200000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: memory@86700000 {
> +			reg = <0x0 0x86700000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@86800000 {
> +			reg = <0x0 0x86800000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@86810000 {
> +			reg = <0x0 0x86810000 0x0 0xa000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@8681a000 {
> +			reg = <0x0 0x8681a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		npu_mem: memory@86900000 {
> +			reg = <0x0 0x86900000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		video_mem: memory@86e00000 {
> +			reg = <0x0 0x86e00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		cvp_mem: memory@87300000 {
> +			reg = <0x0 0x87300000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@87800000 {
> +			reg = <0x0 0x87800000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: memory@88c00000 {
> +			reg = <0x0 0x88c00000 0x0 0x1500000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8a100000 {
> +			reg = <0x0 0x8a100000 0x0 0x1d00000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@8be00000 {
> +			reg = <0x0 0x8be00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_secure_heap: memory@8bf00000 {
> +			reg = <0x0 0x8bf00000 0x0 0x4600000>;
> +			no-map;
> +		};
> +	};
> +
> +	smem: qcom,smem {
> +		compatible = "qcom,smem";
> +		memory-region = <&smem_mem>;
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +
> +	soc: soc@0 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
> +		compatible = "simple-bus";
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,gcc-sm8250";
> +			reg = <0x0 0x00100000 0x0 0x1f0000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			clock-names = "bi_tcxo", "sleep_clk";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
> +		};
> +
> +		qupv3_id_1: geniqup@ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x00ac0000 0x0 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc 133>, <&gcc 134>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			uart2: serial@a90000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x00a90000 0x0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc 113>;
> +				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sm8250-pdc";
> +			reg = <0x0b220000 0x30000>, <0x17c000f0 0x60>;
> +			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
> +					  <125 63 1>, <126 716 12>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		spmi: qcom,spmi@c440000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x0 0x0c440000 0x0 0x0001100>,
> +			      <0x0 0x0c600000 0x0 0x2000000>,
> +			      <0x0 0x0e600000 0x0 0x0100000>,
> +			      <0x0 0x0e700000 0x0 0x00a0000>,
> +			      <0x0 0x0c40a000 0x0 0x0026000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> +
> +		apps_rsc: rsc@18200000 {
> +			label = "apps_rsc";
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x18200000 0x0 0x10000>,
> +				<0x0 0x18210000 0x0 0x10000>,
> +				<0x0 0x18220000 0x0 0x10000>;
> +			reg-names = "drv-0", "drv-1", "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
> +					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
> +
> +			rpmhcc: clock-controller {
> +				compatible = "qcom,sm8250-rpmh-clk";
> +				#clock-cells = <1>;
> +				clock-names = "xo";
> +				clocks = <&xo_board>;
> +			};
> +		};
> +
> +		tcsr_mutex_regs: syscon@1f40000 {
> +			compatible = "syscon";
> +			reg = <0x0 0x01f40000 0x0 0x40000>;
> +		};
> +
> +		timer@17c20000 {
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x0 0x17c20000 0x0 0x1000>;
> +			clock-frequency = <19200000>;
> +
> +			frame@17c21000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x17c21000 0x0 0x1000>,
> +				      <0x0 0x17c22000 0x0 0x1000>;
> +			};
> +
> +			frame@17c23000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x17c23000 0x0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c25000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x17c25000 0x0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c27000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x17c27000 0x0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c29000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x17c29000 0x0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c2b000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x17c2b000 0x0 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17c2d000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0 0x17c2d000 0x0 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};
> -- 
> 2.24.1
> 
