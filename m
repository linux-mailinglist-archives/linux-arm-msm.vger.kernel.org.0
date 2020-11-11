Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB302AE790
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 05:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgKKEo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 23:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKKEoz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 23:44:55 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D95BC0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:44:55 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id n11so1024815ota.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oqA0yoRPjntpyzT4jdy42xhn5i7OiwBFi2GcPG8ggM4=;
        b=nmzM9juq26dDLRUhYk5tZHQq5y5pZ96w/xDDVcLz9IiyrRDW1cxKroj1M6TwmnCvWM
         xyBZI5KSg48waquuuvol4nibpy5BKNzXg0RuNkPLAuAQ2Iioec/asmYLjoNBqg+Ajy9g
         z+UBlPUhG2hfMr7opL0XrSzrMTcW1SA9utVzNphYj11DYOWTYfB26feX41ht74TBNM/m
         azsQPGRMiKOEa95PT3vNUTU0L6flEJtKW34uSVgfAOFljbaEFE1sasVkCREzmnlNlFI/
         LR5TlsKrl6Nj4dBS0lGKPiOGJwK0NG7vP75M2Om0C3OmljeU3hfwmF7goeyMkaStPSXQ
         UCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oqA0yoRPjntpyzT4jdy42xhn5i7OiwBFi2GcPG8ggM4=;
        b=S0rhRDf25budeUWcYRqyCy8T5diAiNEc6urOEcn+E/qxX2xGMGPxokIh1+8VITvvxY
         rdcdWVzUU2k5SnayQ4uHim6TIhfyBx/M+DwdV6TuCTP4BP7EZOFP/NTcM4w+wUVF58nv
         y9XN+flpZhOezz0nPdSGH0yV7+cOTN+ALJeht0AhB3/DI2qoeeILNjOw7F1HaThuPGlr
         T2FJHYdlO1uoAjoNpNjBrVAMp2bZeEMRGu6tml8eOqRTnEjijo7cGOCh2g8PJ3zGdLzt
         ua4zmj3J6hNiS3qYo8EmccSVhUsEtLAEorLJE4kH66jBxlsmIEkQ8sV1ule4sD2cXWw7
         OjLw==
X-Gm-Message-State: AOAM530BqtV4dvD1fIlMNdiNX/krW3fNxJ/jdlEJtAInS/olL8TPqXfB
        QBTCyqJBZJJaZaRtX/PqPOYlwQ==
X-Google-Smtp-Source: ABdhPJztTsv4NZ6Tn3+LfD6F5BhOrJTIJYHFkQxSKoG7uhRTCl5TUH+2fzlf+8aGBpARiEhBTdhuZQ==
X-Received: by 2002:a9d:6c4e:: with SMTP id g14mr17001870otq.120.1605069894248;
        Tue, 10 Nov 2020 20:44:54 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r24sm271015otq.77.2020.11.10.20.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 20:44:53 -0800 (PST)
Date:   Tue, 10 Nov 2020 22:44:51 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: clear the warnings caused by
 empty dma-ranges
Message-ID: <20201111044451.GD173948@builder.lan>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016090833.1892-3-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Oct 04:08 CDT 2020, Zhen Lei wrote:

> The scripts/dtc/checks.c requires that the node have empty "dma-ranges"
> property must have the same "#address-cells" and "#size-cells" values as
> the parent node. Otherwise, the following warnings is reported:
> 
> arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning \
> (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but \
> its #address-cells (1) differs from / (2)
> arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning \
> (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but \
> its #size-cells (1) differs from / (2)
> 
> Arnd Bergmann figured out why it's necessary:
> Also note that the #address-cells=<1> means that any device under
> this bus is assumed to only support 32-bit addressing, and DMA will
> have to go through a slow swiotlb in the absence of an IOMMU.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Thanks for fixing this up Zhen!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

and applied for 5.11.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 72 +++++++++++++++++------------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index a94dac76bf3fbdd..59e0cbfa2214305 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -179,22 +179,22 @@
>  	};
>  
>  	soc: soc {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0 0 0 0xffffffff>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x0 0xffffffff>;
>  		dma-ranges;
>  		compatible = "simple-bus";
>  
>  		prng: qrng@e1000 {
>  			compatible = "qcom,prng-ee";
> -			reg = <0xe3000 0x1000>;
> +			reg = <0x0 0xe3000 0x0 0x1000>;
>  			clocks = <&gcc GCC_PRNG_AHB_CLK>;
>  			clock-names = "core";
>  		};
>  
>  		cryptobam: dma@704000 {
>  			compatible = "qcom,bam-v1.7.0";
> -			reg = <0x00704000 0x20000>;
> +			reg = <0x0 0x00704000 0x0 0x20000>;
>  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
>  			clock-names = "bam_clk";
> @@ -206,7 +206,7 @@
>  
>  		crypto: crypto@73a000 {
>  			compatible = "qcom,crypto-v5.1";
> -			reg = <0x0073a000 0x6000>;
> +			reg = <0x0 0x0073a000 0x0 0x6000>;
>  			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
>  				<&gcc GCC_CRYPTO_AXI_CLK>,
>  				<&gcc GCC_CRYPTO_CLK>;
> @@ -217,7 +217,7 @@
>  
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,ipq6018-pinctrl";
> -			reg = <0x01000000 0x300000>;
> +			reg = <0x0 0x01000000 0x0 0x300000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
> @@ -235,7 +235,7 @@
>  
>  		gcc: gcc@1800000 {
>  			compatible = "qcom,gcc-ipq6018";
> -			reg = <0x01800000 0x80000>;
> +			reg = <0x0 0x01800000 0x0 0x80000>;
>  			clocks = <&xo>, <&sleep_clk>;
>  			clock-names = "xo", "sleep_clk";
>  			#clock-cells = <1>;
> @@ -244,17 +244,17 @@
>  
>  		tcsr_mutex_regs: syscon@1905000 {
>  			compatible = "syscon";
> -			reg = <0x01905000 0x8000>;
> +			reg = <0x0 0x01905000 0x0 0x8000>;
>  		};
>  
>  		tcsr_q6: syscon@1945000 {
>  			compatible = "syscon";
> -			reg = <0x01945000 0xe000>;
> +			reg = <0x0 0x01945000 0x0 0xe000>;
>  		};
>  
>  		blsp_dma: dma@7884000 {
>  			compatible = "qcom,bam-v1.7.0";
> -			reg = <0x07884000 0x2b000>;
> +			reg = <0x0 0x07884000 0x0 0x2b000>;
>  			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "bam_clk";
> @@ -264,7 +264,7 @@
>  
>  		blsp1_uart3: serial@78b1000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> -			reg = <0x078b1000 0x200>;
> +			reg = <0x0 0x078b1000 0x0 0x200>;
>  			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>,
>  				<&gcc GCC_BLSP1_AHB_CLK>;
> @@ -276,7 +276,7 @@
>  			compatible = "qcom,spi-qup-v2.2.1";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			reg = <0x078b5000 0x600>;
> +			reg = <0x0 0x078b5000 0x0 0x600>;
>  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>  			spi-max-frequency = <50000000>;
>  			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
> @@ -291,7 +291,7 @@
>  			compatible = "qcom,spi-qup-v2.2.1";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			reg = <0x078b6000 0x600>;
> +			reg = <0x0 0x078b6000 0x0 0x600>;
>  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  			spi-max-frequency = <50000000>;
>  			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
> @@ -306,7 +306,7 @@
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			reg = <0x078b6000 0x600>;
> +			reg = <0x0 0x078b6000 0x0 0x600>;
>  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
>  				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
> @@ -321,7 +321,7 @@
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			reg = <0x078b7000 0x600>;
> +			reg = <0x0 0x078b7000 0x0 0x600>;
>  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
>  				<&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
> @@ -336,24 +336,24 @@
>  			compatible = "qcom,msm-qgic2";
>  			interrupt-controller;
>  			#interrupt-cells = <0x3>;
> -			reg =   <0x0b000000 0x1000>,  /*GICD*/
> -				<0x0b002000 0x1000>,  /*GICC*/
> -				<0x0b001000 0x1000>,  /*GICH*/
> -				<0x0b004000 0x1000>;  /*GICV*/
> +			reg =   <0x0 0x0b000000 0x0 0x1000>,  /*GICD*/
> +				<0x0 0x0b002000 0x0 0x1000>,  /*GICC*/
> +				<0x0 0x0b001000 0x0 0x1000>,  /*GICH*/
> +				<0x0 0x0b004000 0x0 0x1000>;  /*GICV*/
>  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
>  		watchdog@b017000 {
>  			compatible = "qcom,kpss-wdt";
>  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
> -			reg = <0x0b017000 0x40>;
> +			reg = <0x0 0x0b017000 0x0 0x40>;
>  			clocks = <&sleep_clk>;
>  			timeout-sec = <10>;
>  		};
>  
>  		apcs_glb: mailbox@b111000 {
>  			compatible = "qcom,ipq6018-apcs-apps-global";
> -			reg = <0x0b111000 0x1000>;
> +			reg = <0x0 0x0b111000 0x0 0x1000>;
>  			#clock-cells = <1>;
>  			clocks = <&a53pll>, <&xo>;
>  			clock-names = "pll", "xo";
> @@ -362,7 +362,7 @@
>  
>  		a53pll: clock@b116000 {
>  			compatible = "qcom,ipq6018-a53pll";
> -			reg = <0x0b116000 0x40>;
> +			reg = <0x0 0x0b116000 0x0 0x40>;
>  			#clock-cells = <0>;
>  			clocks = <&xo>;
>  			clock-names = "xo";
> @@ -377,68 +377,68 @@
>  		};
>  
>  		timer@b120000 {
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
>  			ranges;
>  			compatible = "arm,armv7-timer-mem";
> -			reg = <0x0b120000 0x1000>;
> +			reg = <0x0 0x0b120000 0x0 0x1000>;
>  			clock-frequency = <19200000>;
>  
>  			frame@b120000 {
>  				frame-number = <0>;
>  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x0b121000 0x1000>,
> -				      <0x0b122000 0x1000>;
> +				reg = <0x0 0x0b121000 0x0 0x1000>,
> +				      <0x0 0x0b122000 0x0 0x1000>;
>  			};
>  
>  			frame@b123000 {
>  				frame-number = <1>;
>  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0xb123000 0x1000>;
> +				reg = <0x0 0xb123000 0x0 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@b124000 {
>  				frame-number = <2>;
>  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x0b124000 0x1000>;
> +				reg = <0x0 0x0b124000 0x0 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@b125000 {
>  				frame-number = <3>;
>  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x0b125000 0x1000>;
> +				reg = <0x0 0x0b125000 0x0 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@b126000 {
>  				frame-number = <4>;
>  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x0b126000 0x1000>;
> +				reg = <0x0 0x0b126000 0x0 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@b127000 {
>  				frame-number = <5>;
>  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x0b127000 0x1000>;
> +				reg = <0x0 0x0b127000 0x0 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@b128000 {
>  				frame-number = <6>;
>  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> -				reg = <0x0b128000 0x1000>;
> +				reg = <0x0 0x0b128000 0x0 0x1000>;
>  				status = "disabled";
>  			};
>  		};
>  
>  		q6v5_wcss: remoteproc@cd00000 {
>  			compatible = "qcom,ipq8074-wcss-pil";
> -			reg = <0x0cd00000 0x4040>,
> -				<0x004ab000 0x20>;
> +			reg = <0x0 0x0cd00000 0x0 0x4040>,
> +			      <0x0 0x004ab000 0x0 0x20>;
>  			reg-names = "qdsp6",
>  				    "rmb";
>  			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
> -- 
> 1.8.3
> 
> 
