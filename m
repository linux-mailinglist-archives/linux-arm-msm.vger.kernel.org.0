Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90599305C95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 14:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238278AbhA0NKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 08:10:40 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:11672 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238188AbhA0NIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 08:08:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611752876; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7cWTLuH5ERj6GxbgJIPmvVwUQxWQw1SM2QluezgaKTI=;
 b=MmokkKZvaM5mWoJwxx1VMOwWiJ1vX6wNAdWMESiiJqcgsddWkWovjAUKcOe8peiV5fBiIIcb
 OrhVM42JRb0G3OQLcdcNYizPO4VTR00CLrfgQ2QnYnLfs85HN46xYLQnNrzHcH7lc6DnV5fD
 5pk43G36HFXGG00gnWxWGnMi/6c=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 601165892c36b2106dad35b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 13:07:21
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF929C43462; Wed, 27 Jan 2021 13:07:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9EC18C433ED;
        Wed, 27 Jan 2021 13:07:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 27 Jan 2021 18:37:19 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add basic devicetree support for
 SM8350 SoC
In-Reply-To: <20210127123054.263231-6-vkoul@kernel.org>
References: <20210127123054.263231-1-vkoul@kernel.org>
 <20210127123054.263231-6-vkoul@kernel.org>
Message-ID: <194d2ebe26a9420f842c97738adb0443@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On 2021-01-27 18:00, Vinod Koul wrote:
> Add basic devicetree support for Qualcomm Technologies, Inc SM8350 SoC.
> This adds gcc, pinctrl, reserved memory, uart, cpu nodes for this SoC.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 499 +++++++++++++++++++++++++++
>  1 file changed, 499 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8350.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> new file mode 100644
> index 000000000000..29af0b931690
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -0,0 +1,499 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Linaro Limaited
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,kryo685";
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
> +			compatible = "qcom,scm-sm8350", "qcom,scm";
> +			#reset-cells = <1>;
> +		};
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
> +	reserved_memory: reserved-memory {
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
> +			no-map;
> +			reg = <0x0 0x80700000 0x0 0x160000>;
> +		};
> +
> +		cmd_db: memory@80860000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x80860000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		reserved_xbl_uefi_log: memory@80880000 {
> +			reg = <0x0 0x80880000 0x0 0x14000>;
> +			no-map;
> +		};
> +
> +		smem_mem: memory@80900000 {
> +			reg = <0x0 0x80900000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		cpucp_fw_mem: memory@80b00000 {
> +			reg = <0x0 0x80b00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_secure_heap: memory@80c00000 {
> +			reg = <0x0 0x80c00000 0x0 0x4600000>;
> +			no-map;
> +		};
> +
> +		pil_camera_mem: mmeory@85200000 {
> +			reg = <0x0 0x85200000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		pil_video_mem: memory@85700000 {
> +			reg = <0x0 0x85700000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		pil_cvp_mem: memory@85c00000 {
> +			reg = <0x0 0x85c00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		pil_adsp_mem: memory@86100000 {
> +			reg = <0x0 0x86100000 0x0 0x2100000>;
> +			no-map;
> +		};
> +
> +		pil_slpi_mem: memory@88200000 {
> +			reg = <0x0 0x88200000 0x0 0x1500000>;
> +			no-map;
> +		};
> +
> +		pil_cdsp_mem: memory@89700000 {
> +			reg = <0x0 0x89700000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_ipa_fw_mem: memory@8b500000 {
> +			reg = <0x0 0x8b500000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		pil_ipa_gsi_mem: memory@8b510000 {
> +			reg = <0x0 0x8b510000 0x0 0xa000>;
> +			no-map;
> +		};
> +
> +		pil_gpu_mem: memory@8b51a000 {
> +			reg = <0x0 0x8b51a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		pil_spss_mem: memory@8b600000 {
> +			reg = <0x0 0x8b600000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		pil_modem_mem: memory@8b800000 {
> +			reg = <0x0 0x8b800000 0x0 0x10000000>;
> +			no-map;
> +		};
> +
> +		hyp_reserved_mem: memory@d0000000 {
> +			reg = <0x0 0xd0000000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		pil_trustedvm_mem: memory@d0800000 {
> +			reg = <0x0 0xd0800000 0x0 0x76f7000>;
> +			no-map;
> +		};
> +
> +		qrtr_shbuf: memory@d7ef7000 {
> +			reg = <0x0 0xd7ef7000 0x0 0x9000>;
> +			no-map;
> +		};
> +
> +		chan0_shbuf: memory@d7f00000 {
> +			reg = <0x0 0xd7f00000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		chan1_shbuf: memory@d7f80000 {
> +			reg = <0x0 0xd7f80000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		removed_mem: memory@d8800000 {
> +			reg = <0x0 0xd8800000 0x0 0x6800000>;
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
> +			compatible = "qcom,gcc-sm8350";
> +			reg = <0x0 0x00100000 0x0 0x1f0000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			clock-names = "bi_tcxo", "sleep_clk";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
> +		};
> +
> +		ipcc: mailbox@408000 {
> +			compatible = "qcom,sm8350-ipcc", "qcom,ipcc";
> +			reg = <0 0x00408000 0 0x1000>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			#mbox-cells = <2>;
> +		};
> +
> +		qupv3_id_1: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x009c0000 0x0 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc 121>,
> +				 <&gcc 122>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			uart2: serial@98c000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0 0x0098c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc 83>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_uart3_default_state>;
> +				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x0 0x01f40000 0x0 0x40000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sm8350-pdc", "qcom,pdc";
> +			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 
> 4>,
> +					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
> +					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
> +					  <156 716 12>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		aoss_qmp: qmp@c300000 {
> +			compatible = "qcom,sm8350-aoss-qmp";
> +			reg = <0 0x0c300000 0 0x100000>;
> +			interrupts-extended = <&ipcc IPCC_CLIENT_AOP 
> IPCC_MPROC_SIGNAL_GLINK_QMP
> +						     IRQ_TYPE_EDGE_RISING>;
> +			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +			#clock-cells = <0>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		tlmm: pinctrl@f100000 {
> +			compatible = "qcom,sm8350-tlmm";
> +			reg = <0 0x0f100000 0 0x300000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 203>;
> +
> +			qup_uart3_default_state: qup-uart3-default-state {
> +				rx {
> +					pins = "gpio18";
> +					function = "qup3";
> +				};
> +				tx {
> +					pins = "gpio19";
> +					function = "qup3";
> +				};
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
> +		timer@17c20000 {
> +			compatible = "arm,armv7-timer-mem";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
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
> +				compatible = "qcom,sm8350-rpmh-clk";
> +				#clock-cells = <1>;
> +				clock-names = "xo";
> +				clocks = <&xo_board>;
> +			};
> +
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | 
> IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;

The last interrupt should be hypervisor physical interrupt(10) not 
12(hyp virtual).
It works currently with android bootloaders because the host linux 
kernel will run
at EL1 and will use EL1 physical timer interrupt(14), but if we ever 
have the host
kernel run in EL2(for example, chrome) then we will not receive any 
timer interrupts.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
