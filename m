Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E910C1730BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 07:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgB1GDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 01:03:03 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:33080 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgB1GDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 01:03:03 -0500
Received: by mail-pj1-f66.google.com with SMTP id m7so4016752pjs.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 22:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Bx7FKUqBl+pikWXJC8Ci/RTA0QPl708mO+nTbW2tjhA=;
        b=N0FaEjzqBiB3xU/dYegXQLHTLMbh1vSzY+ZHmj/ZI2Osw8im0W5BB8lakphRbi5i5U
         R01lbMbWmIo6w5lRwsc8tRFlwyJ7r4cPPdgfduudx1OYJBVm5L8vTl62rjI4lnQab96Q
         obMEEyh3FkkSECYe66hjH1nwoGHguC4kl40fqufs99aqG6gVLQnq5tpY4bnYvrZH9lWj
         TMlnVrBGROjMq2kxX09rSmIjh3Ypy4CYuI7jy9qrBOos9ka2IJJok/o826uB98sFolnQ
         UVHvTbVulY1xwrKzaO093+oO4oNURLCcIcgxpInbK/79S15AtuTXA2+BkCclPLhHFWZZ
         5b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Bx7FKUqBl+pikWXJC8Ci/RTA0QPl708mO+nTbW2tjhA=;
        b=YQ13WMDe2cBBkUB2DO+c2VQNflzU4kDUz/4x88ypw0mNis9WVz6sXOVU+8uX8RbvQP
         PHmPOQ6fSv1HiLRQLsiazumXRM1738dPah9FDmDswmq6VF4O14cCoqiwK30ZW9Ih2EIy
         w2hHMQ2h6ehMcp/SLQKY2xq5nzmrxthvhnlzxKlxAuRuywNkmj1H/RQ0m3Doz2Gt8e3P
         BVnrnTD9xfs5V1nYGkbpnmar0aXIvKO7ASV6+gh8G9S1okx9JPOWSQ8ZbR3KTkcQLoC8
         MnPXNjsvJHlE4ICW7QJFr0mQ40ZsGoR6XsKvAkF3nJv8Y1N60bP0BS49evItmhIf/Sam
         UyVQ==
X-Gm-Message-State: APjAAAV+tXQmry8UdahYs7M7aZOxMrXxE0sEj2j+36qGOZD22GgwEuWg
        VySYgEQYgxcvOjik5UPbgW1QuQ==
X-Google-Smtp-Source: APXvYqyIIQDKOX6jpvNbAxI2RmfZbE37pbs705Zbx2jqSS2x4qcH0kbbwioQ/QI5s12ELiSmVg9h/w==
X-Received: by 2002:a17:902:a416:: with SMTP id p22mr2520670plq.107.1582869779652;
        Thu, 27 Feb 2020 22:02:59 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z127sm8426912pgb.64.2020.02.27.22.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 22:02:59 -0800 (PST)
Date:   Thu, 27 Feb 2020 22:02:57 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: ipq6018: Add a few device nodes
Message-ID: <20200228060257.GZ3948@builder>
References: <1582199446-29890-1-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582199446-29890-1-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 20 Feb 03:50 PST 2020, Sivaprakash Murugesan wrote:

> add i2c, spi, crypto, rng, watchdog, peripheral nodes, also add
> support for wcss Q6 remoteproc driver and enable hw mutex, smem,
> mailbox, smp2p and rpmsg drivers
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>

Applied, thank you.

> ---
> [V2] * Addressed review comments from Stephen
> This patch depends on Sricharan's ipq6018 dts patch
> https://patchwork.kernel.org/patch/11340681/
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  34 ++++
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 226 +++++++++++++++++++++++++++
>  2 files changed, 260 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index 897b4b2..b31117a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -28,3 +28,37 @@
>  	pinctrl-names = "default";
>  	status = "ok";
>  };
> +
> +&i2c_1 {
> +	pinctrl-0 = <&i2c_1_pins>;
> +	pinctrl-names = "default";
> +	status = "ok";
> +};
> +
> +&spi_0 {
> +	cs-select = <0>;
> +	status = "ok";
> +
> +	m25p80@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0>;
> +		compatible = "n25q128a11";
> +		spi-max-frequency = <50000000>;
> +	};
> +};
> +
> +&tlmm {
> +	i2c_1_pins: i2c-1-pins {
> +		pins = "gpio42", "gpio43";
> +		function = "blsp2_i2c";
> +		drive-strength = <8>;
> +	};
> +
> +	spi_0_pins: spi-0-pins {
> +		pins = "gpio38", "gpio39", "gpio40", "gpio41";
> +		function = "blsp0_spi";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 0fb44e5..1aa8d85 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +#include <dt-bindings/reset/qcom,gcc-ipq6018.h>
>  
>  / {
>  	#address-cells = <2>;
> @@ -69,6 +70,18 @@
>  		};
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm";
> +		};
> +	};
> +
> +	tcsr_mutex: hwlock {
> +		compatible = "qcom,tcsr-mutex";
> +		syscon = <&tcsr_mutex_regs 0 0x80>;
> +		#hwlock-cells = <1>;
> +	};
> +
>  	pmuv8: pmu {
>  		compatible = "arm,cortex-a53-pmu";
>  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
> @@ -89,6 +102,22 @@
>  			reg = <0x0 0x48500000 0x0 0x00200000>;
>  			no-map;
>  		};
> +
> +		smem_region: memory@4aa00000 {
> +			reg = <0x0 0x4aa00000 0x0 0x00100000>;
> +			no-map;
> +		};
> +
> +		q6_region: memory@4ab00000 {
> +			reg = <0x0 0x4ab00000 0x0 0x02800000>;
> +			no-map;
> +		};
> +	};
> +
> +	smem {
> +		compatible = "qcom,smem";
> +		memory-region = <&smem_region>;
> +		hwlocks = <&tcsr_mutex 0>;
>  	};
>  
>  	soc: soc {
> @@ -98,6 +127,36 @@
>  		dma-ranges;
>  		compatible = "simple-bus";
>  
> +		prng: qrng@e1000 {
> +			compatible = "qcom,prng-ee";
> +			reg = <0xe3000 0x1000>;
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "core";
> +		};
> +
> +		cryptobam: dma@704000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x00704000 0x20000>;
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <1>;
> +			qcom,controlled-remotely = <1>;
> +			qcom,config-pipe-trust-reg = <0>;
> +		};
> +
> +		crypto: crypto@73a000 {
> +			compatible = "qcom,crypto-v5.1";
> +			reg = <0x0073a000 0x6000>;
> +			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
> +				<&gcc GCC_CRYPTO_AXI_CLK>,
> +				<&gcc GCC_CRYPTO_CLK>;
> +			clock-names = "iface", "bus", "core";
> +			dmas = <&cryptobam 2>, <&cryptobam 3>;
> +			dma-names = "rx", "tx";
> +		};
> +
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,ipq6018-pinctrl";
>  			reg = <0x01000000 0x300000>;
> @@ -125,6 +184,26 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		tcsr_mutex_regs: syscon@1905000 {
> +			compatible = "syscon";
> +			reg = <0x01905000 0x8000>;
> +		};
> +
> +		tcsr_q6: syscon@1945000 {
> +			compatible = "syscon";
> +			reg = <0x01945000 0xe000>;
> +		};
> +
> +		blsp_dma: dma@7884000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x07884000 0x2b000>;
> +			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +		};
> +
>  		blsp1_uart3: serial@78b1000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0x078b1000 0x200>;
> @@ -135,6 +214,66 @@
>  			status = "disabled";
>  		};
>  
> +		spi_0: spi@78b5000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x078b5000 0x600>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			spi-max-frequency = <50000000>;
> +			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
> +				<&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi_1: spi@78b6000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x078b6000 0x600>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			spi-max-frequency = <50000000>;
> +			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
> +				<&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		i2c_0: i2c@78b6000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x078b6000 0x600>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			clock-frequency  = <400000>;
> +			dmas = <&blsp_dma 15>, <&blsp_dma 14>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2c_1: i2c@78b7000 { /* BLSP1 QUP2 */
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x078b7000 0x600>;
> +			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				<&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			clock-frequency  = <400000>;
> +			dmas = <&blsp_dma 17>, <&blsp_dma 16>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
>  		intc: interrupt-controller@b000000 {
>  			compatible = "qcom,msm-qgic2";
>  			interrupt-controller;
> @@ -146,6 +285,21 @@
>  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		watchdog@b017000 {
> +			compatible = "qcom,kpss-wdt";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
> +			reg = <0x0b017000 0x40>;
> +			clocks = <&sleep_clk>;
> +			timeout-sec = <10>;
> +		};
> +
> +		apcs_glb: mailbox@b111000 {
> +			compatible = "qcom,ipq8074-apcs-apps-global";
> +			reg = <0x0b111000 0xc>;
> +
> +			#mbox-cells = <1>;
> +		};
> +
>  		timer {
>  			compatible = "arm,armv8-timer";
>  			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> @@ -213,5 +367,77 @@
>  			};
>  		};
>  
> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq8074-wcss-pil";
> +			reg = <0x0cd00000 0x4040>,
> +				<0x004ab000 0x20>;
> +			reg-names = "qdsp6",
> +				    "rmb";
> +			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
> +					      <&wcss_smp2p_in 0 0>,
> +					      <&wcss_smp2p_in 1 0>,
> +					      <&wcss_smp2p_in 2 0>,
> +					      <&wcss_smp2p_in 3 0>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			resets = <&gcc GCC_WCSSAON_RESET>,
> +				 <&gcc GCC_WCSS_BCR>,
> +				 <&gcc GCC_WCSS_Q6_BCR>;
> +
> +			reset-names = "wcss_aon_reset",
> +				      "wcss_reset",
> +				      "wcss_q6_reset";
> +
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "prng";
> +
> +			qcom,halt-regs = <&tcsr_q6 0xa000 0xd000 0x0>;
> +
> +			qcom,smem-states = <&wcss_smp2p_out 0>,
> +					   <&wcss_smp2p_out 1>;
> +			qcom,smem-state-names = "shutdown",
> +						"stop";
> +
> +			memory-region = <&q6_region>;
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
> +				qcom,remote-pid = <1>;
> +				mboxes = <&apcs_glb 8>;
> +
> +				qrtr_requests {
> +					qcom,glink-channels = "IPCRTR";
> +				};
> +			};
> +		};
> +
> +	};
> +
> +	wcss: wcss-smp2p {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <435>, <428>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs_glb 9>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <1>;
> +
> +		wcss_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		wcss_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
