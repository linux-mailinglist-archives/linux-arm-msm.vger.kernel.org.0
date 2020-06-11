Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FE71F6133
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 07:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgFKFNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 01:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgFKFNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 01:13:46 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BD8C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 22:13:46 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d10so2035945pgn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1lZ+o3q7XLnEN5aP3nOACJDtemtRdOGJmickSPYw8pQ=;
        b=oFrvFH1wweh7KB1pdEopEH3HC5UE393WA5gVDTympP3BoRkLDHZ7MFIRnesthVWznL
         4VgVAcOiJ8BGZktLnJxOLuUjNo66xAAlx9cZkAF8lYhqqp6YerKmtwn8lwK5C2jBkfux
         wyshUFPT9r12jaVZmmyqz4LnLX/MWDFZKtM1Awslc+QmLh0lM9mC6BvgashdXplsAlko
         mc4DJb2ocXqToBuUYuW1F00eb6qrvG2uAqkaybSKnJWu6+02SJG3YyJPslGFKLjWmr2B
         XhqQoMDpw7TCBcV85FapuXK9XlWQsWJHKnaTJTGzvDgWKa3McfaigAdgFrIWOKqxCFAj
         /qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1lZ+o3q7XLnEN5aP3nOACJDtemtRdOGJmickSPYw8pQ=;
        b=bMXEoJ+tLe/Ht8iCu5NpvXl+PZq/OWttZnLWpi2AWCJwGun4fFYXYc9eOXmYSk0v4d
         LsTbmXF7y9I0opigXH+1QepS5EpQh+3eucXigLyNmfX3JIaSX3aSSA5Lho373i1ftVcm
         G3O9r7mhLJm+Zo6d2N24/HpPVs/tDewdkS+cTJm/zUGM6jz3mYBZziUokna7cOEQosAQ
         ECeG23VvlewdtWF80keZIRWIXlGEpIkMFlrWpmTX3Yt2ZQTAPggd2oCze0Nxa7dLrx0E
         8d1GCNo6B32uNxHil1KTI+4Qj/mH0jfIui957vioH3e4EVlcZAVI57uawPbD93W54hzS
         xbfQ==
X-Gm-Message-State: AOAM533YLKaFUkszX2UNQcE+7s1LPrmyNzuQsblyvC6XKiKtvGG0FmCW
        MjcUWoDur/EAORmsV4sqQh0T
X-Google-Smtp-Source: ABdhPJyKrQb6l8tUWdFT7097IPMi2Tg3MbG+WNL3ADE0twmnvWwA12shhT8S/r2ACos8COcqLOOyAA==
X-Received: by 2002:a65:5902:: with SMTP id f2mr5158322pgu.283.1591852425619;
        Wed, 10 Jun 2020 22:13:45 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:71e:5c7c:bd75:cbe3:d192:328f])
        by smtp.gmail.com with ESMTPSA id i191sm1650996pfe.99.2020.06.10.22.13.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 22:13:44 -0700 (PDT)
Date:   Thu, 11 Jun 2020 10:43:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: add I2C and SPI nodes
Message-ID: <20200611051336.GA1208@Mani-XPS-13-9360>
References: <20200606131300.3874987-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200606131300.3874987-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Sat, Jun 06, 2020 at 04:13:00PM +0300, Dmitry Baryshkov wrote:
> Much like SDM845 each serial engine has 4 pins attached. Add all
> possible I2C and SPI nodes for all 20 serial engines.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Also I've tested this patch on an SM8250 based board. So feel free to add,

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1147 ++++++++++++++++++++++++++
>  1 file changed, 1147 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 384839cb036c..37d3abeabf87 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -15,6 +15,49 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +		i2c10 = &i2c10;
> +		i2c11 = &i2c11;
> +		i2c12 = &i2c12;
> +		i2c13 = &i2c13;
> +		i2c14 = &i2c14;
> +		i2c15 = &i2c15;
> +		i2c16 = &i2c16;
> +		i2c17 = &i2c17;
> +		i2c18 = &i2c18;
> +		i2c19 = &i2c19;
> +		spi0 = &spi0;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +		spi3 = &spi3;
> +		spi4 = &spi4;
> +		spi5 = &spi5;
> +		spi6 = &spi6;
> +		spi7 = &spi7;
> +		spi8 = &spi8;
> +		spi9 = &spi9;
> +		spi10 = &spi10;
> +		spi11 = &spi11;
> +		spi12 = &spi12;
> +		spi13 = &spi13;
> +		spi14 = &spi14;
> +		spi15 = &spi15;
> +		spi16 = &spi16;
> +		spi17 = &spi17;
> +		spi18 = &spi18;
> +		spi19 = &spi19;
> +	};
> +
>  	chosen { };
>  
>  	clocks {
> @@ -294,6 +337,394 @@ gcc: clock-controller@100000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
>  		};
>  
> +		qupv3_id_2: geniqup@8c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x008c0000 0x0 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			i2c14: i2c@880000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00880000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c14_default>;
> +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi14: spi@880000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00880000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi14_default>;
> +				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c15: i2c@884000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00884000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c15_default>;
> +				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi15: spi@884000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00884000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi15_default>;
> +				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c16: i2c@888000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00888000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c16_default>;
> +				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi16: spi@888000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00888000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi16_default>;
> +				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c17: i2c@88c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x0088c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c17_default>;
> +				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi17: spi@88c000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x0088c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi17_default>;
> +				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c18: i2c@890000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00890000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c18_default>;
> +				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi18: spi@890000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00890000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi18_default>;
> +				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c19: i2c@894000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00894000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c19_default>;
> +				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi19: spi@894000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00894000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi19_default>;
> +				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		qupv3_id_0: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x009c0000 0x0 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			i2c0: i2c@980000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00980000 0 0x4000>;
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
> +			spi0: spi@980000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00980000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi0_default>;
> +				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@984000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00984000 0 0x4000>;
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
> +			spi1: spi@984000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00984000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi1_default>;
> +				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@988000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00988000 0 0x4000>;
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
> +			spi2: spi@988000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00988000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi2_default>;
> +				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@98c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x0098c000 0 0x4000>;
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
> +			spi3: spi@98c000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x0098c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi3_default>;
> +				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c4: i2c@990000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00990000 0 0x4000>;
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
> +			spi4: spi@990000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00990000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi4_default>;
> +				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c5: i2c@994000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00994000 0 0x4000>;
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
> +			spi5: spi@994000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00994000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi5_default>;
> +				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c6: i2c@998000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00998000 0 0x4000>;
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
> +			spi6: spi@998000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00998000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi6_default>;
> +				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c7: i2c@99c000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x0099c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c7_default>;
> +				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi7: spi@99c000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x0099c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi7_default>;
> +				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
> +
>  		qupv3_id_1: geniqup@ac0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x00ac0000 0x0 0x6000>;
> @@ -304,6 +735,136 @@ qupv3_id_1: geniqup@ac0000 {
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
> +			spi8: spi@a80000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00a80000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi8_default>;
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
> +			spi9: spi@a84000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00a84000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi9_default>;
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
> +			spi10: spi@a88000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00a88000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi10_default>;
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
> +			spi11: spi@a8c000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00a8c000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi11_default>;
> +				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
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
> +			spi12: spi@a90000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00a90000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi12_default>;
> +				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
>  			uart2: serial@a90000 {
>  				compatible = "qcom,geni-debug-uart";
>  				reg = <0x0 0x00a90000 0x0 0x4000>;
> @@ -312,6 +873,32 @@ uart2: serial@a90000 {
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
> +
> +			i2c13: i2c@a94000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00a94000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c13_default>;
> +				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			spi13: spi@a94000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00a94000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi13_default>;
> +				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
>  		};
>  
>  		ufs_mem_hc: ufshc@1d84000 {
> @@ -512,6 +1099,566 @@ tlmm: pinctrl@f100000 {
>  			#interrupt-cells = <2>;
>  			gpio-ranges = <&tlmm 0 0 180>;
>  			wakeup-parent = <&pdc>;
> +
> +			qup_i2c0_default: qup-i2c0-default {
> +				mux {
> +					pins = "gpio28", "gpio29";
> +					function = "qup0";
> +				};
> +
> +				config {
> +					pins = "gpio28", "gpio29";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c1_default: qup-i2c1-default {
> +				pinmux {
> +					pins = "gpio4", "gpio5";
> +					function = "qup1";
> +				};
> +
> +				config {
> +					pins = "gpio4", "gpio5";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c2_default: qup-i2c2-default {
> +				mux {
> +					pins = "gpio115", "gpio116";
> +					function = "qup2";
> +				};
> +
> +				config {
> +					pins = "gpio115", "gpio116";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c3_default: qup-i2c3-default {
> +				mux {
> +					pins = "gpio119", "gpio120";
> +					function = "qup3";
> +				};
> +
> +				config {
> +					pins = "gpio119", "gpio120";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c4_default: qup-i2c4-default {
> +				mux {
> +					pins = "gpio8", "gpio9";
> +					function = "qup4";
> +				};
> +
> +				config {
> +					pins = "gpio8", "gpio9";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c5_default: qup-i2c5-default {
> +				mux {
> +					pins = "gpio12", "gpio13";
> +					function = "qup5";
> +				};
> +
> +				config {
> +					pins = "gpio12", "gpio13";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c6_default: qup-i2c6-default {
> +				mux {
> +					pins = "gpio16", "gpio17";
> +					function = "qup6";
> +				};
> +
> +				config {
> +					pins = "gpio16", "gpio17";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c7_default: qup-i2c7-default {
> +				mux {
> +					pins = "gpio20", "gpio21";
> +					function = "qup7";
> +				};
> +
> +				config {
> +					pins = "gpio20", "gpio21";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c8_default: qup-i2c8-default {
> +				mux {
> +					pins = "gpio24", "gpio25";
> +					function = "qup8";
> +				};
> +
> +				config {
> +					pins = "gpio24", "gpio25";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c9_default: qup-i2c9-default {
> +				mux {
> +					pins = "gpio125", "gpio126";
> +					function = "qup9";
> +				};
> +
> +				config {
> +					pins = "gpio125", "gpio126";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c10_default: qup-i2c10-default {
> +				mux {
> +					pins = "gpio129", "gpio130";
> +					function = "qup10";
> +				};
> +
> +				config {
> +					pins = "gpio129", "gpio130";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c11_default: qup-i2c11-default {
> +				mux {
> +					pins = "gpio60", "gpio61";
> +					function = "qup11";
> +				};
> +
> +				config {
> +					pins = "gpio60", "gpio61";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c12_default: qup-i2c12-default {
> +				mux {
> +					pins = "gpio32", "gpio33";
> +					function = "qup12";
> +				};
> +
> +				config {
> +					pins = "gpio32", "gpio33";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c13_default: qup-i2c13-default {
> +				mux {
> +					pins = "gpio36", "gpio37";
> +					function = "qup13";
> +				};
> +
> +				config {
> +					pins = "gpio36", "gpio37";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c14_default: qup-i2c14-default {
> +				mux {
> +					pins = "gpio40", "gpio41";
> +					function = "qup14";
> +				};
> +
> +				config {
> +					pins = "gpio40", "gpio41";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c15_default: qup-i2c15-default {
> +				mux {
> +					pins = "gpio44", "gpio45";
> +					function = "qup15";
> +				};
> +
> +				config {
> +					pins = "gpio44", "gpio45";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c16_default: qup-i2c16-default {
> +				mux {
> +					pins = "gpio48", "gpio49";
> +					function = "qup16";
> +				};
> +
> +				config {
> +					pins = "gpio48", "gpio49";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c17_default: qup-i2c17-default {
> +				mux {
> +					pins = "gpio52", "gpio53";
> +					function = "qup17";
> +				};
> +
> +				config {
> +					pins = "gpio52", "gpio53";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c18_default: qup-i2c18-default {
> +				mux {
> +					pins = "gpio56", "gpio57";
> +					function = "qup18";
> +				};
> +
> +				config {
> +					pins = "gpio56", "gpio57";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_i2c19_default: qup-i2c19-default {
> +				mux {
> +					pins = "gpio0", "gpio1";
> +					function = "qup19";
> +				};
> +
> +				config {
> +					pins = "gpio0", "gpio1";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi0_default: qup-spi0-default {
> +				mux {
> +					pins = "gpio28", "gpio29",
> +					       "gpio30", "gpio31";
> +					function = "qup0";
> +				};
> +
> +				config {
> +					pins = "gpio28", "gpio29",
> +					       "gpio30", "gpio31";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi1_default: qup-spi1-default {
> +				mux {
> +					pins = "gpio4", "gpio5",
> +					       "gpio6", "gpio7";
> +					function = "qup1";
> +				};
> +
> +				config {
> +					pins = "gpio4", "gpio5",
> +					       "gpio6", "gpio7";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi2_default: qup-spi2-default {
> +				mux {
> +					pins = "gpio115", "gpio116",
> +					       "gpio117", "gpio118";
> +					function = "qup2";
> +				};
> +
> +				config {
> +					pins = "gpio115", "gpio116",
> +					       "gpio117", "gpio118";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi3_default: qup-spi3-default {
> +				mux {
> +					pins = "gpio119", "gpio120",
> +					       "gpio121", "gpio122";
> +					function = "qup3";
> +				};
> +
> +				config {
> +					pins = "gpio119", "gpio120",
> +					       "gpio121", "gpio122";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi4_default: qup-spi4-default {
> +				mux {
> +					pins = "gpio8", "gpio9",
> +					       "gpio10", "gpio11";
> +					function = "qup4";
> +				};
> +
> +				config {
> +					pins = "gpio8", "gpio9",
> +					       "gpio10", "gpio11";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi5_default: qup-spi5-default {
> +				mux {
> +					pins = "gpio12", "gpio13",
> +					       "gpio14", "gpio15";
> +					function = "qup5";
> +				};
> +
> +				config {
> +					pins = "gpio12", "gpio13",
> +					       "gpio14", "gpio15";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi6_default: qup-spi6-default {
> +				mux {
> +					pins = "gpio16", "gpio17",
> +					       "gpio18", "gpio19";
> +					function = "qup6";
> +				};
> +
> +				config {
> +					pins = "gpio16", "gpio17",
> +					       "gpio18", "gpio19";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi7_default: qup-spi7-default {
> +				mux {
> +					pins = "gpio20", "gpio21",
> +					       "gpio22", "gpio23";
> +					function = "qup7";
> +				};
> +
> +				config {
> +					pins = "gpio20", "gpio21",
> +					       "gpio22", "gpio23";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi8_default: qup-spi8-default {
> +				mux {
> +					pins = "gpio24", "gpio25",
> +					       "gpio26", "gpio27";
> +					function = "qup8";
> +				};
> +
> +				config {
> +					pins = "gpio24", "gpio25",
> +					       "gpio26", "gpio27";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi9_default: qup-spi9-default {
> +				mux {
> +					pins = "gpio125", "gpio126",
> +					       "gpio127", "gpio128";
> +					function = "qup9";
> +				};
> +
> +				config {
> +					pins = "gpio125", "gpio126",
> +					       "gpio127", "gpio128";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi10_default: qup-spi10-default {
> +				mux {
> +					pins = "gpio129", "gpio130",
> +					       "gpio131", "gpio132";
> +					function = "qup10";
> +				};
> +
> +				config {
> +					pins = "gpio129", "gpio130",
> +					       "gpio131", "gpio132";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi11_default: qup-spi11-default {
> +				mux {
> +					pins = "gpio60", "gpio61",
> +					       "gpio62", "gpio63";
> +					function = "qup11";
> +				};
> +
> +				config {
> +					pins = "gpio60", "gpio61",
> +					       "gpio62", "gpio63";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi12_default: qup-spi12-default {
> +				mux {
> +					pins = "gpio32", "gpio33",
> +					       "gpio34", "gpio35";
> +					function = "qup12";
> +				};
> +
> +				config {
> +					pins = "gpio32", "gpio33",
> +					       "gpio34", "gpio35";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi13_default: qup-spi13-default {
> +				mux {
> +					pins = "gpio36", "gpio37",
> +					       "gpio38", "gpio39";
> +					function = "qup13";
> +				};
> +
> +				config {
> +					pins = "gpio36", "gpio37",
> +					       "gpio38", "gpio39";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi14_default: qup-spi14-default {
> +				mux {
> +					pins = "gpio40", "gpio41",
> +					       "gpio42", "gpio43";
> +					function = "qup14";
> +				};
> +
> +				config {
> +					pins = "gpio40", "gpio41",
> +					       "gpio42", "gpio43";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi15_default: qup-spi15-default {
> +				mux {
> +					pins = "gpio44", "gpio45",
> +					       "gpio46", "gpio47";
> +					function = "qup15";
> +				};
> +
> +				config {
> +					pins = "gpio44", "gpio45",
> +					       "gpio46", "gpio47";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi16_default: qup-spi16-default {
> +				mux {
> +					pins = "gpio48", "gpio49",
> +					       "gpio50", "gpio51";
> +					function = "qup16";
> +				};
> +
> +				config {
> +					pins = "gpio48", "gpio49",
> +					       "gpio50", "gpio51";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi17_default: qup-spi17-default {
> +				mux {
> +					pins = "gpio52", "gpio53",
> +					       "gpio54", "gpio55";
> +					function = "qup17";
> +				};
> +
> +				config {
> +					pins = "gpio52", "gpio53",
> +					       "gpio54", "gpio55";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi18_default: qup-spi18-default {
> +				mux {
> +					pins = "gpio56", "gpio57",
> +					       "gpio58", "gpio59";
> +					function = "qup18";
> +				};
> +
> +				config {
> +					pins = "gpio56", "gpio57",
> +					       "gpio58", "gpio59";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +
> +			qup_spi19_default: qup-spi19-default {
> +				mux {
> +					pins = "gpio0", "gpio1",
> +					       "gpio2", "gpio3";
> +					function = "qup19";
> +				};
> +
> +				config {
> +					pins = "gpio0", "gpio1",
> +					       "gpio2", "gpio3";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
>  		};
>  
>  		timer@17c20000 {
> -- 
> 2.26.2
> 
