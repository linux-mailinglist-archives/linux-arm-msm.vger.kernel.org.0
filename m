Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B76012C005
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2019 03:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfL2Cvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 21:51:43 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38433 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfL2Cvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 21:51:43 -0500
Received: by mail-pg1-f193.google.com with SMTP id a33so16421508pgm.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2019 18:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lWvbdmgw5+0Kgfn29wsDIzOWOFPb80gRZ1Wrt5sVywo=;
        b=DgCUI/QKpT9hccWASQUnnS9++Ie0vAMVNtm75cIE0RUI6nJQhqT0ioiqHj1ytXsZgd
         SIl+nDy3VQSf3iQ68h18bjIfMbs5XX5ZbV5yJGfI5yZ5AsfqSikVyzQ69+IKmzv8e2sp
         HhTcZN2HIU2JxzzeRSnAUhyaiT2dtLL9Ard65tqLyuD6K7VeIwEGdL4tUC/DwsM3M7Nx
         CHUOFY4ATQaIMpx1tdGc5irLzZs+7cjPV74Luy3LhoiBWlW+gAcNtDigFXqxpJbUC8UH
         ZIyj8Y1GcCKudN00HO0O8FmGHIqR2mSw2sHlrCAmX9GC7yWMT0efAGki3yQBJdOcEjrY
         AUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lWvbdmgw5+0Kgfn29wsDIzOWOFPb80gRZ1Wrt5sVywo=;
        b=LVxcQLMbO5aEk4YuZK6cihiBwLM+fQUDvavGCefJUCPRv8WJzLuWqPURWWMuuZOt6x
         dqstD0WspXoZ+qVAG+fnzIgiu46gMIDCCfvqw/ooppJX3af/txxLPaxj434NZ047TFlY
         dKyHkg1Fvabouy27kE7vWRNE2x3kTKR8T4gmDI0cGqGMLWWp+b41e5+rHF2FJhZpIfFs
         eJjheLfP6fHSc09d1Xbz2ucWNk/96hd9ILbWlUHvEgYy0hAMubFFCRK4Dkr2v8DWccgI
         grkF2NXggcv5rhGy52Pbhml9XJwIqKVEwJcWArPigg3V+cbAmCJLFP+DvdHQjutSVYyk
         RG2g==
X-Gm-Message-State: APjAAAUJb6SYmxctdUawfeFSFGk+SQDskU84MS0hY60CSVdxUvWl8O5z
        QzHa/r9Ck50dCN2ny32YPVkdo9khILM=
X-Google-Smtp-Source: APXvYqzdUYshGfVEKkyY06qz6UNtTZPi2CJOh1TLjleWUGSf/p/FhSBRjC1iSOHou0Jj5Q7gAGc2/Q==
X-Received: by 2002:aa7:9218:: with SMTP id 24mr62727996pfo.145.1577587902245;
        Sat, 28 Dec 2019 18:51:42 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y203sm25524258pfb.65.2019.12.28.18.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 18:51:41 -0800 (PST)
Date:   Sat, 28 Dec 2019 18:51:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Victhor Foster <victhor.foster@ufpe.br>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        agross <agross@kernel.org>, robh+dt <robh+dt@kernel.org>,
        mark rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm: dts: apq8084: Remove all instances of IRQ_TYPE_NONE
Message-ID: <20191229025139.GI3755841@builder>
References: <1723137502.9510958.1577059595123.JavaMail.zimbra@ufpe.br>
 <1238987932.9511963.1577060836760.JavaMail.zimbra@ufpe.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1238987932.9511963.1577060836760.JavaMail.zimbra@ufpe.br>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 22 Dec 16:27 PST 2019, Victhor Foster wrote:

> This patch removes all instances of IRQ_TYPE_NONE, which fixes warning messages during boot. It also changes interrupt types to their corresponding macros, as defined in arm-gic.h.
> 
> Signed-off by: Victhor Foster <victhor.foster@ufpe.br>

Thanks for fixing this up Victhor. I've applied both patches, with the
commit message wrapped to 72 chars.

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 40 ++++++++++++++---------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 0a0fb147ebb9..1724a87afc4f 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /dts-v1/;
>  
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-apq8084.h>
>  #include <dt-bindings/gpio/gpio.h>
>  
> @@ -184,7 +185,7 @@ cpu_crit3: trip1 {
>  
>  	cpu-pmu {
>  		compatible = "qcom,krait-pmu";
> -		interrupts = <1 7 0xf04>;
> +		interrupts = <GIC_PPI 7 0xf04>;
>  	};
>  
>  	clocks {
> @@ -203,10 +204,10 @@ sleep_clk: sleep_clk {
>  
>  	timer {
>  		compatible = "arm,armv7-timer";
> -		interrupts = <1 2 0xf08>,
> -			     <1 3 0xf08>,
> -			     <1 4 0xf08>,
> -			     <1 1 0xf08>;
> +		interrupts = <GIC_PPI 2 0xf08>,
> +			     <GIC_PPI 3 0xf08>,
> +			     <GIC_PPI 4 0xf08>,
> +			     <GIC_PPI 1 0xf08>;
>  		clock-frequency = <19200000>;
>  	};
>  
> @@ -258,7 +259,6 @@ tsens: thermal-sensor@fc4a8000 {
>  			nvmem-cell-names = "calib", "calib_backup";
>  			#thermal-sensor-cells = <1>;
>  		};
> -
>  		timer@f9020000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -269,50 +269,50 @@ timer@f9020000 {
>  
>  			frame@f9021000 {
>  				frame-number = <0>;
> -				interrupts = <0 8 0x4>,
> -					     <0 7 0x4>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9021000 0x1000>,
>  				      <0xf9022000 0x1000>;
>  			};
>  
>  			frame@f9023000 {
>  				frame-number = <1>;
> -				interrupts = <0 9 0x4>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9023000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9024000 {
>  				frame-number = <2>;
> -				interrupts = <0 10 0x4>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9024000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9025000 {
>  				frame-number = <3>;
> -				interrupts = <0 11 0x4>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9025000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9026000 {
>  				frame-number = <4>;
> -				interrupts = <0 12 0x4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9026000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9027000 {
>  				frame-number = <5>;
> -				interrupts = <0 13 0x4>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9027000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9028000 {
>  				frame-number = <6>;
> -				interrupts = <0 14 0x4>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9028000 0x1000>;
>  				status = "disabled";
>  			};
> @@ -404,13 +404,13 @@ tlmm: pinctrl@fd510000 {
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -			interrupts = <0 208 0>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
>  		blsp2_uart2: serial@f995e000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0xf995e000 0x1000>;
> -			interrupts = <0 114 0x0>;
> +			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
>  			clock-names = "core", "iface";
>  			status = "disabled";
> @@ -420,7 +420,7 @@ sdhci@f9824900 {
>  			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
> -			interrupts = <0 123 0>, <0 138 0>;
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hc_irq", "pwr_irq";
>  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&gcc GCC_SDCC1_AHB_CLK>,
> @@ -433,7 +433,7 @@ sdhci@f98a4900 {
>  			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
> -			interrupts = <0 125 0>, <0 221 0>;
> +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hc_irq", "pwr_irq";
>  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&gcc GCC_SDCC2_AHB_CLK>,
> @@ -449,7 +449,7 @@ spmi_bus: spmi@fc4cf000 {
>  			      <0xfc4cb000 0x1000>,
>  			      <0xfc4ca000 0x1000>;
>  			interrupt-names = "periph_irq";
> -			interrupts = <0 190 0>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>  			qcom,ee = <0>;
>  			qcom,channel = <0>;
>  			#address-cells = <2>;
> @@ -463,7 +463,7 @@ smd {
>  		compatible = "qcom,smd";
>  
>  		rpm {
> -			interrupts = <0 168 1>;
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>  			qcom,ipc = <&apcs 8 0>;
>  			qcom,smd-edge = <15>;
>  
> -- 
> 2.24.0
