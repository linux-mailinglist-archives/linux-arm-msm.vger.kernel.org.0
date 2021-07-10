Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0353C322E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 05:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhGJDO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 23:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbhGJDO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 23:14:27 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BDDC0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 20:11:42 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so11547153otl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 20:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JHwCfhdD0AHFgWMmvY2wwKVFwA0MMu5pCgrz5HZJBjY=;
        b=tlDEudereI+w6gskgoJSStEeHnIkLhlMt3tdadZ71KQyXjsGUfm+w2WF9mD6eeLXwU
         aRaJruTwJs2gL82yXIr+dAlEJv5VP5LTg1sxc5odPEca2QSqFoyATXo2FYRaRlGDYatf
         YRAAvkED2sSPf25bsbx5la1VB6qlocjMLYJkJueBskzIA+hBmQPQvlsel93GE6Ys6Wxe
         T6V8kcxLNNoYbTY/+aG9gzgYkgKSmnQXbUe1qrYs6w6IxUBNFmeWv541z6gKonNx/p8M
         R42US1xpFtliQ/xs0rhFetiXZ1mGAY2ZD+6b525aZV4DAo6D/ebHUCQvFTR8y1Iuyogn
         nZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JHwCfhdD0AHFgWMmvY2wwKVFwA0MMu5pCgrz5HZJBjY=;
        b=Q6AN34WbT6hCluyBxo0N9KpCQlgqocS+p4fFyMmRgj3v6M+X5dtrgpCwm20U75FniY
         HTw8iifw4YofGAek/PABvxFtHQcY528zEE+F/yRTFJwvm+pzEzzq3HgcR3WIvBJcT1L0
         Lun9iIYZOXn1pB1FTK0dMzN8dwHQAyR/MTSybHsww6szOdUKYcwL9GylCTQClncxg5d6
         ntl7khzrNOrc7Xu65jNRFcPcbY8gvaNdQVqeAzHaNh+S6JctzmJsT190fkaBv02LXbFl
         XSIk5OzkymQtLM85T6p8N+pforcbg89ucIkcVM8Wl/3q5y4snQEA05X09xJBcBqyjJaz
         hvkA==
X-Gm-Message-State: AOAM531cQiEwKeouAIz+g9TzH1NYWHV+RFPnRJOfvPx1ECaQwLcrzYA8
        8cCjGBa/uT1RoqVpu4KJ4iD4qA==
X-Google-Smtp-Source: ABdhPJwfj1P/owlRDbsNMufjI4E7EGiaYM6PuPtzRsW2uc16XtrkIoJmG6hZU7Kg/t/COOTMaW4SiQ==
X-Received: by 2002:a9d:7acc:: with SMTP id m12mr31387412otn.27.1625886701749;
        Fri, 09 Jul 2021 20:11:41 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f61sm1549731otb.79.2021.07.09.20.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:11:41 -0700 (PDT)
Date:   Fri, 9 Jul 2021 22:11:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 2/2] ARM: dts: qcom: Add SDX65 platform and MTP board
 support
Message-ID: <YOkP640J7+orJtWm@yoga>
References: <20210709200506.20046-1-quic_vamslank@quicinc.com>
 <20210709200506.20046-3-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200506.20046-3-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 15:05 CDT 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add basic devicetree support for SDX65 platform and MTP board from
> Qualcomm. The SDX65 platform features an ARM Cortex A7 CPU which forms
> the Application Processor Sub System (APSS) along with standard Qualcomm
> peripherals like GCC, TLMM, BLSP, QPIC, and BAM etc... Also, there
> exists the networking parts such as IPA, MHI, PCIE-EP, EMAC, and Modem
> etc..
> 
> This commit adds basic devicetree support that includes GCC, RPMh clock, INTC
> and Debug UART.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  arch/arm/boot/dts/Makefile           |   3 +-
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts |  25 ++++
>  arch/arm/boot/dts/qcom-sdx65.dtsi    | 215 +++++++++++++++++++++++++++
>  3 files changed, 242 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
>  create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8e5d4ab4e75e..1e3f01496cb3 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -929,7 +929,8 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-msm8974-sony-xperia-castor.dtb \
>  	qcom-msm8974-sony-xperia-honami.dtb \
>  	qcom-mdm9615-wp8548-mangoh-green.dtb \
> -	qcom-sdx55-mtp.dtb
> +	qcom-sdx55-mtp.dtb \
> +	qcom-sdx65-mtp.dtb
>  dtb-$(CONFIG_ARCH_RDA) += \
>  	rda8810pl-orangepi-2g-iot.dtb \
>  	rda8810pl-orangepi-i96.dtb
> diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> new file mode 100644
> index 000000000000..59457da8e5f1
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "qcom-sdx65.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SDX65 MTP";
> +	compatible = "qcom,sdx65-mtp", "qcom,sdx65";
> +	qcom,board-id = <0x2010008 0x302>;
> +
> +	aliases {
> +		serial0 = &blsp1_uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&blsp1_uart3 {
> +	status = "ok";
> +};
> diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> new file mode 100644
> index 000000000000..4b5e7248c34d
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * SDX65 SoC device tree source
> + *
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + */
> +
> +#include <dt-bindings/clock/qcom,gcc-sdx65.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	qcom,msm-id = <458 0x10000>, <483 0x10000>, <509 0x10000>;
> +	interrupt-parent = <&intc>;
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0 0>;
> +	};
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <76800000>;
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
> +
> +		pcie_pipe_clk: pcie-0-pipe-clk {

Rather than defining a dummy node to have something to provide in &gcc
you can leave this as just 0 in the clocks property in &gcc until you
introduce the PHY.

> +			compatible = "fixed-clock";
> +			clock-frequency = <1000>;
> +			clock-output-names = "pcie_pipe_clk";
> +			#clock-cells = <0>;
> +		};
> +
> +		usb3_phy_wrapper_gcc_usb30_pipe_clk: usb3-phy-wrapper-gcc-usb30-pipe-clk {

Ditto.

> +			compatible = "fixed-clock";
> +			clock-frequency = <1000>;
> +			clock-output-names = "usb3_phy_wrapper_gcc_usb30_pipe_clk";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	soc: soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		compatible = "simple-bus";
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,gcc-sdx65";
> +			reg = <0x100000 0x1f7400>;

Please pad the address to 8 digits, sto make it easier for me to keep
these sorted by address as we move forward.

> +			reg-name = "cc_base";

We typically don't use a name for the single memory region for &gcc. I
haven't looked at your gcc patch yet, but I think you should drop this.

Regards,
Bjorn

> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
> +			       <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
> +			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
> +				"pcie_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		blsp1_uart3: serial@831000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0x00831000 0x200>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			status = "disabled";
> +		};
> +
> +		pdc: interrupt-controller@b210000 {
> +			compatible = "qcom,sdx65-pdc", "qcom,pdc";
> +			reg = <0xb210000 0x10000>;
> +			qcom,pdc-ranges = <0 147 52>, <52 266 32>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		intc: interrupt-controller@17800000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			interrupt-parent = <&intc>;
> +			#interrupt-cells = <3>;
> +			reg = <0x17800000 0x1000>,
> +			      <0x17802000 0x1000>;
> +		};
> +
> +		timer@17820000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x17820000 0x1000>;
> +			clock-frequency = <19200000>;
> +
> +			frame@17821000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 7 0x4>,
> +					     <GIC_SPI 6 0x4>;
> +				reg = <0x17821000 0x1000>,
> +				      <0x17822000 0x1000>;
> +			};
> +
> +			frame@17823000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 8 0x4>;
> +				reg = <0x17823000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17824000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 9 0x4>;
> +				reg = <0x17824000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17825000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 10 0x4>;
> +				reg = <0x17825000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17826000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 11 0x4>;
> +				reg = <0x17826000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17827000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 12 0x4>;
> +				reg = <0x17827000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17828000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 13 0x4>;
> +				reg = <0x17828000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17829000 {
> +				frame-number = <7>;
> +				interrupts = <GIC_SPI 14 0x4>;
> +				reg = <0x17829000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		apps_rsc: rsc@17830000 {
> +			label = "apps_rsc";
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x17830000 0x10000>,
> +			    <0x17840000 0x10000>;
> +			reg-names = "drv-0", "drv-1";
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				   <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <1>;
> +			qcom,tcs-config = <ACTIVE_TCS  2>,
> +				<SLEEP_TCS   2>,
> +				<WAKE_TCS    2>,
> +				<CONTROL_TCS 1>;
> +
> +			rpmhcc: clock-controller@1 {
> +				compatible = "qcom,sdx65-rpmh-clk";
> +				#clock-cells = <1>;
> +				clock-names = "xo";
> +				clocks = <&xo_board>;
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <1 13 0xf08>,
> +			<1 12 0xf08>,
> +			<1 10 0xf08>,
> +			<1 11 0xf08>;
> +		clock-frequency = <19200000>;
> +	};
> +};
> -- 
> 2.32.0
> 
