Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50BD5123F8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 07:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfLRG23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 01:28:29 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55032 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfLRG23 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 01:28:29 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so398673pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 22:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fziCYHKMFGHsNNkb3erFLyDFxVdCoJ51kiuuQ1qt9Kc=;
        b=kW22feBUWfPB/kASEVMgzJn2QdKFoWWWeI67fHE0GTQczcpANL+r5Y1l+I4bIh11fu
         l3qVbyQ7u2prTTODSULlbCJLGLytdTJvyEJ91Ue2deuxD9sGpn60w2HgxjpvygK3Qd/q
         3WkWecayTLDHH9dNRDt+RRcuBM4c14hgodrhcLI8DC0TpyyX2XEs1m3rHnVsiuLJK1Qi
         Al3NyGIfpUjalE2kH5pxnVQTKOusWx9GfQbL64tcxJ5KqeMZwarQNVmxD5fop0n8U2+p
         o/umlfpCRrVER55UalRcc8sWOXVfzYy83kYFWYomJFUDexQd1OT/d6GHpXlRiCkc+ttG
         kmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fziCYHKMFGHsNNkb3erFLyDFxVdCoJ51kiuuQ1qt9Kc=;
        b=CAF5cUfHyjR5vNwGLWojRg3QZHiVhcidGPaZOzhQa3m3goQLMO7GobOXGsoHw8vmI7
         tJidCgH0XyVJdKiK14ihrDX32NoQg40e0LtQwXer4+OCGzyMTBEH+huuGof9NNeLLBcw
         qhHKWF/LauZ8kPOV8I8uovNIXEySxWsbjYaCfgvUbA4UrfOvh9zx6I/ntAkLiYs8nVJp
         4vdHXc8UV9qxdtnNAgP0TnVJtEvqbd5YXQzDfCOniV/E9gr75HuK8f4kvL+cIrC1vguf
         SVPAgvZkUmdPgTUnGI3Fz6Wfr23rmhm1UN3WZK/tUYbnEKTothofmdm1C464X0L2v6At
         F4tw==
X-Gm-Message-State: APjAAAWChdczl/VdBaJGGC/h611EeMbU9lMMvz+dYmaXdKvS6qKp7+i2
        bC/jsy7lw/GxUyhVZEGxha+zAQ==
X-Google-Smtp-Source: APXvYqw09rCC+r58pnI4mLp/hhbh2GNoXV+2C8tiw+f7MCtjIXKEwA5+2HLBZyEyUtKnq+pNtSP7xg==
X-Received: by 2002:a17:902:ba8c:: with SMTP id k12mr98163pls.329.1576650508476;
        Tue, 17 Dec 2019 22:28:28 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a69sm1300253pfa.129.2019.12.17.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 22:28:27 -0800 (PST)
Date:   Tue, 17 Dec 2019 22:28:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Victhor Foster <victhor.foster@ufpe.br>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm: dts: apq8084: Fix tsens kernel panic during boot
 and kernel warnings due to IRQ_TYPE_NONE interrupt type
Message-ID: <20191218062825.GA3755841@builder>
References: <587764682.8806511.1576626759806.JavaMail.zimbra@ufpe.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587764682.8806511.1576626759806.JavaMail.zimbra@ufpe.br>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Dec 15:52 PST 2019, Victhor Foster wrote:

> This patch fixes a kernel panic on the tsens driver that prevented APQ8084 platforms from booting, by adding a missing register property and the number of sensors

I was under the impression that the tsens driver did maintain backwards
compatibility wrt a single reg cell...

> , corrects all instances of IRQ_TYPE_NONE in interrupts, to avoid causing kernel warnings during boot, and also changes most interrupt properties to their respective macros, as defined by arm-gic.h.
> 
> Signed-off by: Victhor Foster <victhor.foster@ufpe.br>

The content looks good, but can you please split it in two; one for the
tsens change and one for the interrupts cells? And please limit your
commit message to 72 chars.

Thanks,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 43 +++++++++++++++--------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 0a0fb147ebb9..dc4ea3a8dc6d 100644
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
> @@ -184,7 +185,7 @@
>  
>  	cpu-pmu {
>  		compatible = "qcom,krait-pmu";
> -		interrupts = <1 7 0xf04>;
> +		interrupts = <GIC_PPI 7 0xf04>;
>  	};
>  
>  	clocks {
> @@ -203,10 +204,10 @@
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
> @@ -253,9 +254,11 @@
>  
>  		tsens: thermal-sensor@fc4a8000 {
>  			compatible = "qcom,msm8974-tsens";
> -			reg = <0xfc4a8000 0x2000>;
> +			reg = <0xfc4a9000 0x1000>, /* TM */
> +			      <0xfc4a8000 0x1000>; /* SROT */
>  			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>  			nvmem-cell-names = "calib", "calib_backup";
> +			#qcom,sensors = <11>;
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> @@ -269,50 +272,50 @@
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
> @@ -404,13 +407,13 @@
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
> @@ -420,7 +423,7 @@
>  			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
> -			interrupts = <0 123 0>, <0 138 0>;
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hc_irq", "pwr_irq";
>  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&gcc GCC_SDCC1_AHB_CLK>,
> @@ -433,7 +436,7 @@
>  			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
> -			interrupts = <0 125 0>, <0 221 0>;
> +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hc_irq", "pwr_irq";
>  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&gcc GCC_SDCC2_AHB_CLK>,
> @@ -449,7 +452,7 @@
>  			      <0xfc4cb000 0x1000>,
>  			      <0xfc4ca000 0x1000>;
>  			interrupt-names = "periph_irq";
> -			interrupts = <0 190 0>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>  			qcom,ee = <0>;
>  			qcom,channel = <0>;
>  			#address-cells = <2>;
> @@ -463,7 +466,7 @@
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
