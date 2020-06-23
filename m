Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D10206848
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387495AbgFWXYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388184AbgFWXY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:24:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBF3C061795
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:24:28 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bh7so136146plb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8fzLV49rwc6HteDopoFd5P9ELY2p4Gi3numED+Uv9BA=;
        b=J1WRdMQo3tMT6lt9rRruoEsm17NNfmZNN7u1nb5PWRZfYtDFUzsS55zwRoWqmGXCXm
         wGL4ZSPcjfeWDfYcMPhs7D1VtLEQ9oxRY0+Qfs/L7kGIHpVmT2fYL3Lmnc428g0dFcrD
         Dw3VwImHw7KgVPaMqlRIyC6VL9nk/zFDeHZQjNEt41JPMszZLLMk0tSFmlKdiv/ZThOt
         bwIdYYjsvoy1I4ZwVbHr1UiXWq6vP6MNE+cciougt2nkBw2o2p3W99hH3AL8ybzyQjeE
         3vepYUUcZZHJp7zmQRYVpGPrAX3ZtTQ11Ae8UmqjjkYmKyL8Sk8WSK462WbpnU/O/2Ve
         BwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8fzLV49rwc6HteDopoFd5P9ELY2p4Gi3numED+Uv9BA=;
        b=LqYDt4HYCEGOctWgk/NKq/kTBvhnIOsmMOfxtCCoAT3eBdy7/tFIk7mFVMPZHBbqNh
         mIOBCsP4TIf2UUAcvydJQoB/5ooTAgLHx8NR0LHBukm4XC2YDZAS2iKTcXJ3MvqXNUyv
         VV7nmHK+T8kqGXt6q+rttUETEoV2TKgVn9cnQo4hQXCElkMnIWNHmHDeFsIH8njw+j1R
         qLLtvZCb94fjE6ItMBsdx1ziFYjFpJ8WzyOcm/D96jDPQN6aSQA64bpkp5JhmxQjPA6B
         ilV7R2Nfen2TY7vHU2w7ISg8G2jn9KdEYNlNb0AUgKB25RklUozSfkUrUk4Ngufn+lCv
         bFPg==
X-Gm-Message-State: AOAM532fg4FUxxKD06WGlIboZXIkttbj6w6/xdoH4xfCqcJZ9VlXRCjJ
        PQjmstcE5+RhSwrTETPcwDY+8/KAs/Y=
X-Google-Smtp-Source: ABdhPJz33AauuyIlTr6KN63pCV+xlTxVN1HOLbCRpMxf2FEZfFIoFUUnyuzl6/JM4iV8gg/bCmT8iA==
X-Received: by 2002:a17:90a:d250:: with SMTP id o16mr26294760pjw.199.1592954667889;
        Tue, 23 Jun 2020 16:24:27 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x1sm3464151pju.3.2020.06.23.16.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:24:27 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:21:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/12] arm64: dts: qcom: msm8994: Add I2C, SPI and
 BLSP DMA nodes
Message-ID: <20200623232144.GM128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-8-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-8-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:

> Add support for I2C and SPI buses to enable peripherals
> such as touchscreens or sensors. Also add DMA nodes,
> configuration and BLSP2 UART2 interface.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Applied, thanks

> ---
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 156 +++++++++++++++++++++++++-
>  1 file changed, 155 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 838ffc0d9c16..8af01ebe73f7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -365,14 +365,168 @@ sdhc1: sdhci@f9824900 {
>  			status = "disabled";
>  		};
>  
> +		blsp1_dma: dma@f9904000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0xf9904000 0x19000>;
> +			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <18>;
> +			qcom,num-ees = <4>;
> +		};
> +
>  		blsp1_uart2: serial@f991e000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0xf991e000 0x1000>;
>  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "disabled";
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&blsp1_uart2_default>;
> +			pinctrl-1 = <&blsp1_uart2_sleep>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c1: i2c@f9923000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0xf9923000 0x500>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			clock-frequency = <400000>;
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c1_default>;
> +			pinctrl-1 = <&i2c1_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_spi0: spi@f9923000 {
> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0xf9923000 0x500>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			spi-max-frequency = <19200000>;
> +			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&blsp1_spi0_default>;
> +			pinctrl-1 = <&blsp1_spi0_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c2: i2c@f9924000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0xf9924000 0x500>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +						<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			clock-frequency = <355000>;
> +			dmas = <&blsp1_dma 14>, <&blsp1_dma 15>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c2_default>;
> +			pinctrl-1 = <&i2c2_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		/* I2C3 doesn't exist */
> +
> +		blsp_i2c4: i2c@f9926000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0xf9926000 0x500>;
> +			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +						<&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			clock-frequency = <355000>;
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c4_default>;
> +			pinctrl-1 = <&i2c4_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp2_dma: dma@f9944000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0xf9944000 0x19000>;
> +			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			num-channels = <18>;
> +			qcom,num-ees = <4>;
> +		};
> +
> +		/* According to downstream kernels, i2c6
> +		 * comes before i2c5 address-wise...
> +		 */
> +
> +		blsp_i2c6: i2c@f9928000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0xf9928000 0x500>;
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +						<&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			clock-frequency = <355000>;
> +			dmas = <&blsp1_dma 22>, <&blsp1_dma 23>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c6_default>;
> +			pinctrl-1 = <&i2c6_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		blsp2_uart2: serial@f995e000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0xf995e000 0x1000>;
> +			interrupts = <GIC_SPI 146 IRQ_TYPE_EDGE_FALLING>;
> +			clock-names = "core", "iface";
> +			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
> +					<&gcc GCC_BLSP2_AHB_CLK>;
> +			dmas = <&blsp2_dma 2>, <&blsp2_dma 3>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&blsp2_uart2_default>;
> +			pinctrl-1 = <&blsp2_uart2_sleep>;
> +			status = "disabled";
> +		};
> +
> +		blsp_i2c5: i2c@f9967000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0xf9967000 0x500>;
> +			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
> +						<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			clock-frequency = <355000>;
> +			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
> +			dma-names = "tx", "rx";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c5_default>;
> +			pinctrl-1 = <&i2c5_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
>  		};
>  
>  		gcc: clock-controller@fc400000 {
> -- 
> 2.27.0
> 
