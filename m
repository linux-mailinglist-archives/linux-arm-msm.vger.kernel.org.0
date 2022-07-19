Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3235457A660
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 20:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbiGSSVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 14:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240069AbiGSSVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 14:21:37 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE8E5C373;
        Tue, 19 Jul 2022 11:21:34 -0700 (PDT)
Received: from g550jk.localnet (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 7B200D0A4C;
        Tue, 19 Jul 2022 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1658254888; bh=yNpsCPGDUanSFxi0uyJcAWJyGtglJmc0S7f/ELPIoUk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=SGvBzu96ITlnxBYX6kUI+U8prandMG9rscf8d7l5wjMVaF7PsttY7X1BfLiuTD9cP
         S6Hy9SdoOQ7gChezP8YwiBL2qYGk9injAu/VTxO3tZSTBlbrbJ9MntM3wYKz7fEQpb
         Zeu+OuxhGMFflUIWNhLljSxHFuRU/+ucrxkeu2DY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] ARM: dts: qcom: msm8226: Add ADSP node
Date:   Tue, 19 Jul 2022 20:21:26 +0200
Message-ID: <2683836.mvXUDI8C0e@g550jk>
In-Reply-To: <20220423155059.660387-3-luca@z3ntu.xyz>
References: <20220423155059.660387-1-luca@z3ntu.xyz> <20220423155059.660387-3-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Samstag, 23. April 2022 17:50:57 CEST Luca Weiss wrote:
> Add a node for the adsp found on msm8226.
> 

it seems the dt-bindings and driver patch has landed in 5.19 but I don't think 
the 3 dts(i) patches are applied yet.

Could you please check and maybe apply them?

Regards
Luca

> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../boot/dts/qcom-apq8026-asus-sparrow.dts    |  2 +
>  arch/arm/boot/dts/qcom-msm8226.dtsi           | 65 +++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts
> b/arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts index
> ace8cea27949..818c1a201227 100644
> --- a/arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts
> +++ b/arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts
> @@ -8,6 +8,8 @@
>  #include "qcom-msm8226.dtsi"
>  #include "qcom-pm8226.dtsi"
> 
> +/delete-node/ &adsp_region;
> +
>  / {
>  	model = "ASUS ZenWatch 2";
>  	compatible = "asus,sparrow", "qcom,apq8026";
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi
> b/arch/arm/boot/dts/qcom-msm8226.dtsi index 28eca15b5712..3016035d5e21
> 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8974.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8974.h>
> 
>  / {
> @@ -60,6 +61,11 @@ smem_region: smem@3000000 {
>  			reg = <0x3000000 0x100000>;
>  			no-map;
>  		};
> +
> +		adsp_region: adsp@dc00000 {
> +			reg = <0x0dc00000 0x1900000>;
> +			no-map;
> +		};
>  	};
> 
>  	smd {
> @@ -115,6 +121,31 @@ smem {
>  		hwlocks = <&tcsr_mutex 3>;
>  	};
> 
> +	smp2p-adsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
> +
> +		qcom,ipc = <&apcs 8 10>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <2>;
> +
> +		adsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		adsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> @@ -512,6 +543,40 @@ tcsr_mutex_block: syscon@fd484000 {
>  			compatible = "syscon";
>  			reg = <0xfd484000 0x2000>;
>  		};
> +
> +		adsp: remoteproc@fe200000 {
> +			compatible = "qcom,msm8226-adsp-pil";
> +			reg = <0xfe200000 0x100>;
> +
> +			interrupts-extended = <&intc GIC_SPI 162 
IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 
0 IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 
1 IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 
2 IRQ_TYPE_EDGE_RISING>,
> +					      <&adsp_smp2p_in 
3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", 
"handover", "stop-ack";
> +
> +			power-domains = <&rpmpd MSM8226_VDDCX>;
> +			power-domain-names = "cx";
> +
> +			clocks = <&xo_board>;
> +			clock-names = "xo";
> +
> +			memory-region = <&adsp_region>;
> +
> +			qcom,smem-states = <&adsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			smd-edge {
> +				interrupts = <GIC_SPI 156 
IRQ_TYPE_EDGE_RISING>;
> +
> +				qcom,ipc = <&apcs 8 8>;
> +				qcom,smd-edge = <1>;
> +
> +				label = "lpass";
> +			};
> +		};
>  	};
> 
>  	timer {




