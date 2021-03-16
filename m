Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9299F33CDE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 07:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhCPGQm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 02:16:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:46714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229923AbhCPGQI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 02:16:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2443965194;
        Tue, 16 Mar 2021 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615875368;
        bh=dQlTmvmPqShOwY5ctNYesynqJYC1wN4+p7fEUtD/vec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VRkpJ3kOB6XJtX/KSNv5ovCHqh0iSUv7TfIIlryEHCwLNdsgqn/CBeMRUsRYIwXLb
         InvB4xpazMCQLh5swzNGcvjHOEZv/CXbCh5mjAf6FgSCFeIKSsybsGRFfax7Mnb8ex
         zkrfew/MEDNQwlRCX/+vBp39IXKbk/ppysVscjEwZSWTBAi6GW1tLYg/66HNs26eHl
         Q9j7RqbiDYQ2Gp+TxpRfLwjCryBlnXzptlmRGqsCKNzt/NbK5miIKn/awP0XjiADev
         FJhmX8lXdhtz83sxsP1hyuP0RGJcMmcgATW5nQ75rccy4weDVy7KFiLe5YXiUJZ1QA
         x1fIlbQStSBcQ==
Date:   Tue, 16 Mar 2021 11:46:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8150: add i2c nodes
Message-ID: <YFBNJJPLhxZ5Xx7c@vkoul-mobl>
References: <20210310163024.393578-1-caleb@connolly.tech>
 <20210310163024.393578-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310163024.393578-4-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-03-21, 16:31, Caleb Connolly wrote:
> Tested on the OnePlus 7 Pro (including DMA).

Lgtm:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

But missing enabling nodes in board dts ..?

> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 521 +++++++++++++++++++++++++++
>  1 file changed, 521 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 543417d74216..0a38ad54c715 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -588,6 +588,111 @@ qupv3_id_0: geniqup@8c0000 {
>  			#size-cells = <2>;
>  			ranges;
>  			status = "disabled";
> +
> +			i2c0: i2c@880000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00880000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c0_default>;
> +				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@884000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00884000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c1_default>;
> +				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@888000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00888000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c2_default>;
> +				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@88c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x0088c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c3_default>;
> +				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c4: i2c@890000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00890000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c4_default>;
> +				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c5: i2c@894000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00894000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c5_default>;
> +				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c6: i2c@898000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00898000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c6_default>;
> +				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c7: i2c@89c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x0089c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c7_default>;
> +				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
>  		};
>  
>  		qupv3_id_1: geniqup@ac0000 {
> @@ -602,6 +707,58 @@ qupv3_id_1: geniqup@ac0000 {
>  			ranges;
>  			status = "disabled";
>  
> +			i2c8: i2c@a80000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00a80000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c8_default>;
> +				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c9: i2c@a84000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00a84000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c9_default>;
> +				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c10: i2c@a88000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00a88000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c10_default>;
> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c11: i2c@a8c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00a8c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c11_default>;
> +				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
>  			uart2: serial@a90000 {
>  				compatible = "qcom,geni-debug-uart";
>  				reg = <0x0 0x00a90000 0x0 0x4000>;
> @@ -610,6 +767,32 @@ uart2: serial@a90000 {
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
> +
> +			i2c12: i2c@a90000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00a90000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c12_default>;
> +				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c16: i2c@94000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x0094000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c16_default>;
> +				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		qupv3_id_2: geniqup@cc0000 {
> @@ -624,6 +807,84 @@ qupv3_id_2: geniqup@cc0000 {
>  			#size-cells = <2>;
>  			ranges;
>  			status = "disabled";
> +
> +			i2c17: i2c@c80000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00c80000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c17_default>;
> +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c18: i2c@c84000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00c84000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c18_default>;
> +				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c19: i2c@c88000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00c88000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c19_default>;
> +				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "okay";
> +			};
> +
> +			i2c13: i2c@c8c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00c8c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c13_default>;
> +				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c14: i2c@c90000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00c90000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c14_default>;
> +				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c15: i2c@c94000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00c94000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c15_default>;
> +				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		config_noc: interconnect@1500000 {
> @@ -947,6 +1208,266 @@ tlmm: pinctrl@3100000 {
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +
> +			qup_i2c0_default: qup-i2c0-default {
> +				mux {
> +					pins = "gpio0", "gpio1";
> +					function = "qup0";
> +				};
> +
> +				config {
> +					pins = "gpio0", "gpio1";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c1_default: qup-i2c1-default {
> +				mux {
> +					pins = "gpio114", "gpio115";
> +					function = "qup1";
> +				};
> +
> +				config {
> +					pins = "gpio114", "gpio115";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c2_default: qup-i2c2-default {
> +				mux {
> +					pins = "gpio126", "gpio127";
> +					function = "qup2";
> +				};
> +
> +				config {
> +					pins = "gpio126", "gpio127";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c3_default: qup-i2c3-default {
> +				mux {
> +					pins = "gpio144", "gpio145";
> +					function = "qup3";
> +				};
> +
> +				config {
> +					pins = "gpio144", "gpio145";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c4_default: qup-i2c4-default {
> +				mux {
> +					pins = "gpio51", "gpio52";
> +					function = "qup4";
> +				};
> +
> +				config {
> +					pins = "gpio51", "gpio52";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c5_default: qup-i2c5-default {
> +				mux {
> +					pins = "gpio121", "gpio122";
> +					function = "qup5";
> +				};
> +
> +				config {
> +					pins = "gpio121", "gpio122";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c6_default: qup-i2c6-default {
> +				mux {
> +					pins = "gpio6", "gpio7";
> +					function = "qup6";
> +				};
> +
> +				config {
> +					pins = "gpio6", "gpio7";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c7_default: qup-i2c7-default {
> +				mux {
> +					pins = "gpio98", "gpio99";
> +					function = "qup7";
> +				};
> +
> +				config {
> +					pins = "gpio98", "gpio99";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c8_default: qup-i2c8-default {
> +				mux {
> +					pins = "gpio88", "gpio89";
> +					function = "qup8";
> +				};
> +
> +				config {
> +					pins = "gpio88", "gpio89";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c9_default: qup-i2c9-default {
> +				mux {
> +					pins = "gpio39", "gpio40";
> +					function = "qup9";
> +				};
> +
> +				config {
> +					pins = "gpio39", "gpio40";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c10_default: qup-i2c10-default {
> +				mux {
> +					pins = "gpio9", "gpio10";
> +					function = "qup10";
> +				};
> +
> +				config {
> +					pins = "gpio9", "gpio10";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c11_default: qup-i2c11-default {
> +				mux {
> +					pins = "gpio94", "gpio95";
> +					function = "qup11";
> +				};
> +
> +				config {
> +					pins = "gpio94", "gpio95";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c12_default: qup-i2c12-default {
> +				mux {
> +					pins = "gpio83", "gpio84";
> +					function = "qup12";
> +				};
> +
> +				config {
> +					pins = "gpio83", "gpio84";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c13_default: qup-i2c13-default {
> +				mux {
> +					pins = "gpio43", "gpio44";
> +					function = "qup13";
> +				};
> +
> +				config {
> +					pins = "gpio43", "gpio44";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c14_default: qup-i2c14-default {
> +				mux {
> +					pins = "gpio47", "gpio48";
> +					function = "qup14";
> +				};
> +
> +				config {
> +					pins = "gpio47", "gpio48";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c15_default: qup-i2c15-default {
> +				mux {
> +					pins = "gpio27", "gpio28";
> +					function = "qup15";
> +				};
> +
> +				config {
> +					pins = "gpio27", "gpio28";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c16_default: qup-i2c16-default {
> +				mux {
> +					pins = "gpio86", "gpio85";
> +					function = "qup16";
> +				};
> +
> +				config {
> +					pins = "gpio86", "gpio85";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c17_default: qup-i2c17-default {
> +				mux {
> +					pins = "gpio55", "gpio56";
> +					function = "qup17";
> +				};
> +
> +				config {
> +					pins = "gpio55", "gpio56";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c18_default: qup-i2c18-default {
> +				mux {
> +					pins = "gpio23", "gpio24";
> +					function = "qup18";
> +				};
> +
> +				config {
> +					pins = "gpio23", "gpio24";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c19_default: qup-i2c19-default {
> +				mux {
> +					pins = "gpio57", "gpio58";
> +					function = "qup19";
> +				};
> +
> +				config {
> +					pins = "gpio57", "gpio58";
> +					drive-strength = <0x02>;
> +					bias-disable;
> +				};
> +			};
>  		};
>  
>  		remoteproc_mpss: remoteproc@4080000 {
> -- 
> 2.29.2
> 

-- 
~Vinod
