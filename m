Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2C335A227
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 17:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhDIPkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 11:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbhDIPkH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 11:40:07 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDB2C061763
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 08:39:54 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so6067399otb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wBXCbSaC1Hxateqn/Ch5WAilYWAoC2JMMq7UEAHR1do=;
        b=y/XdHrgvkAtzZG4AEcQgWJ2CwiXYpD1fnlwtOQEyXqzYlSYIKrCJIeG80oC52ceTuo
         GpKSfBehqO9Ca7EDiS0O8CtX8s7xVc8OFZ03vEPINOBcZXGnsMAjuXg5i3EUfpbcHTh8
         WjEUBL/LpwQpBEPtUHss4TwrxwLjzYqEUn5MNg4p7+l3zGmSiFLHDHcO99yZofocZy3k
         0K1i8EQ29byWJ885cgVddwi5H/epqwQLwISzLoft7HYuMzTVBZSrM+K6UPKnKWgOsi5e
         1z4NW9Ly2Lfm9xmlqAEgjtHvhSqTUiUZZM+ndDY1j7/88xQf5FiVBTOi6blV4wDzxLch
         /nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wBXCbSaC1Hxateqn/Ch5WAilYWAoC2JMMq7UEAHR1do=;
        b=kbKSmXciqoE8hND83lqfeueSOppEY34+0a++6+Gkwso+xF/3sat0qdAMH9TOmUD0G8
         tjrn/FKD5re1p4Cd3IXXp7GKpI47Jy+oR/H7eDX7kRgQDv3NPAGzSldF4xCN1D1Xe0Uz
         xNyMY8Z0tQF3DAMLr/9oB0uCKIgbA/GC9jRZDiJt99fJpu6X9bhxv3D+qHtKF+mrD4E4
         ZHm7plBZlkMe4sl0rlUKzLvQFLzgwtiXQXemhtKTlLHjH1z7c7SydwmjW9dZMeeD4ONB
         C2tMXn01BNr67bkuPNAFMmsYIyDpRg15BKkqE5ekndaJoAXGeToRn7c7dMKFz0kv6/My
         Cr1Q==
X-Gm-Message-State: AOAM530Wyk8w0aIg+jj0FaT8P5A4fHOQ+7559wtt3DtEb2C6fehHdtZV
        K4xdC7hudjPhyvaIHUVHyt4lww==
X-Google-Smtp-Source: ABdhPJxW16/9QODLB8PSfvdHzKuZFOygXqK3suhuuOHQu2vj0b4/CucGEoBVjs8lW6qQh/bZy+rYEQ==
X-Received: by 2002:a9d:4808:: with SMTP id c8mr12915189otf.181.1617982793540;
        Fri, 09 Apr 2021 08:39:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v1sm653560otk.67.2021.04.09.08.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:39:53 -0700 (PDT)
Date:   Fri, 9 Apr 2021 10:39:51 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Andy Gross <agross@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 7/7] arm64: dts: qcom: Harmonize DWC USB3 DT
 nodes name
Message-ID: <YHB1RxbkXYeLDiz5@builder.lan>
References: <20210409113029.7144-1-Sergey.Semin@baikalelectronics.ru>
 <20210409113029.7144-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409113029.7144-8-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Apr 06:30 CDT 2021, Serge Semin wrote:

> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

As mentioned previously, I would like to merge this through the qcom soc
tree to avoid conflicts with other activities, but need the driver code
(patch 6) to land first.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi        | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi        | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8998.dtsi        | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi     | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404.dtsi         | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi         | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8150.dtsi         | 2 +-
>  9 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index defcbd15edf9..34e97da98270 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -1064,7 +1064,7 @@ &usb2 {
>  	status = "okay";
>  	extcon = <&usb2_id>;
>  
> -	dwc3@7600000 {
> +	usb@7600000 {
>  		extcon = <&usb2_id>;
>  		dr_mode = "otg";
>  		maximum-speed = "high-speed";
> @@ -1075,7 +1075,7 @@ &usb3 {
>  	status = "okay";
>  	extcon = <&usb3_id>;
>  
> -	dwc3@6a00000 {
> +	usb@6a00000 {
>  		extcon = <&usb3_id>;
>  		dr_mode = "otg";
>  	};
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index a32e5e79ab0b..7df4eb710aae 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -427,7 +427,7 @@ usb_0: usb@8af8800 {
>  			resets = <&gcc GCC_USB0_BCR>;
>  			status = "disabled";
>  
> -			dwc_0: dwc3@8a00000 {
> +			dwc_0: usb@8a00000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x8a00000 0xcd00>;
>  				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> @@ -468,7 +468,7 @@ usb_1: usb@8cf8800 {
>  			resets = <&gcc GCC_USB1_BCR>;
>  			status = "disabled";
>  
> -			dwc_1: dwc3@8c00000 {
> +			dwc_1: usb@8c00000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x8c00000 0xcd00>;
>  				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index ce430ba9c118..9eb31b3e6ee7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1772,7 +1772,7 @@ usb3: usb@6af8800 {
>  			power-domains = <&gcc USB30_GDSC>;
>  			status = "disabled";
>  
> -			dwc3@6a00000 {
> +			usb@6a00000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x06a00000 0xcc00>;
>  				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1983,7 +1983,7 @@ usb2: usb@76f8800 {
>  			power-domains = <&gcc USB30_GDSC>;
>  			status = "disabled";
>  
> -			dwc3@7600000 {
> +			usb@7600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x07600000 0xcc00>;
>  				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 1f2e93aa6553..9141c5d09b59 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1962,7 +1962,7 @@ usb3: usb@a8f8800 {
>  
>  			resets = <&gcc GCC_USB_30_BCR>;
>  
> -			usb3_dwc3: dwc3@a800000 {
> +			usb3_dwc3: usb@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x0a800000 0xcd00>;
>  				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index a80c578484ba..f8a55307b855 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -337,7 +337,7 @@ &usb2_phy_sec {
>  &usb3 {
>  	status = "okay";
>  
> -	dwc3@7580000 {
> +	usb@7580000 {
>  		dr_mode = "host";
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 339790ba585d..9c4be020d568 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -544,7 +544,7 @@ usb3: usb@7678800 {
>  			assigned-clock-rates = <19200000>, <200000000>;
>  			status = "disabled";
>  
> -			dwc3@7580000 {
> +			usb@7580000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x07580000 0xcd00>;
>  				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> @@ -573,7 +573,7 @@ usb2: usb@79b8800 {
>  			assigned-clock-rates = <19200000>, <133333333>;
>  			status = "disabled";
>  
> -			dwc3@78c0000 {
> +			usb@78c0000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x078c0000 0xcc00>;
>  				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 1ea3344ab62c..8b83ffbb5b2a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2869,7 +2869,7 @@ usb_1: usb@a6f8800 {
>  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3 0>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			usb_1_dwc3: dwc3@a600000 {
> +			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xe000>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 454f794af547..809be2c67d7a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3769,7 +3769,7 @@ usb_1: usb@a6f8800 {
>  					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			usb_1_dwc3: dwc3@a600000 {
> +			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> @@ -3817,7 +3817,7 @@ usb_2: usb@a8f8800 {
>  					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			usb_2_dwc3: dwc3@a800000 {
> +			usb_2_dwc3: usb@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a800000 0 0xcd00>;
>  				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index e5bb17bc2f46..e4c3edc13676 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1719,7 +1719,7 @@ usb_1: usb@a6f8800 {
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> -			usb_1_dwc3: dwc3@a600000 {
> +			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.30.1
> 
