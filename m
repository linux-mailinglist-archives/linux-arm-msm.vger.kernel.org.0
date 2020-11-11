Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D2C2AF5C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 17:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgKKQIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 11:08:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKKQIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 11:08:48 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BA9C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 08:08:47 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id z16so2614504otq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1V/kvhUQR5LW+HFLqYBbXQytH+a68CFzS7SDjIsD48M=;
        b=hry/mU8E7MV9CkrCBL13xqCVo2CejWOb+M9NpejIYDSfIGsSmSJztTmcqNt62qz69m
         r5fLZEWnbgXcxjJCbET1WWCg3qPVU69OFuP6BPGzYR4DZ+YL9vN9oKukq4dVLesao4QW
         Fsx42szwkJv6KbKM5gom5+KgneRoeq5VzwAGw7mX3ge9Pl9I3jP/OL66N/zZAsQ6lbBp
         fO9xSeUCci5HwOStzwWdnrb+SIa9keYC7w8tAYUISLQiPVoshsqx1/XsIb7W2iHnfUlv
         L2r2xEPirZNACOcIUjMpvd3KXz2gj3+YKV6BDk4XrJpYHSj1DflmnVHivQUYsLQWH1AK
         F78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1V/kvhUQR5LW+HFLqYBbXQytH+a68CFzS7SDjIsD48M=;
        b=Z6RfRuMKAyYceOmD+yVsteUOXpEO8JEmBwvjp+A5W1wJ3HvKbBwGyH3pQ/g5HuHMTE
         JurgujP99aPhQyhfG6sgI9RceycsYxfRnBulmD4JqBkwDv6LV9aTwA/1uQB+H5dQq5ti
         K4+jTYOms27c2qy9Zxs9vHXzrJtLRfOHT+cIcl924vF2NinK5Yr8VCs5e1O8H2H2ZWXO
         uqgqV5eOr78uNof845SbsSuOLE3DNhTMy5AiqJhKDq/64o3ETYYjpKNQY914DlOJ34vQ
         ONYL4MOcxRy6x7vbDLfBqh32lB5h2m87uOBQJCJCgAcMX/jGnB4B7/6llAj2VbIu4u9U
         CPiA==
X-Gm-Message-State: AOAM532Wl+oHK4k20asRmLwwFMaNMPtn+mvACJ88CvK5Y8YtSDdTbWAe
        iX+kD2rTg7OKO1rDbjripv2Q0w==
X-Google-Smtp-Source: ABdhPJwORquYl43ImR2ldQKNxHQ56oxjYZBJmAkau1L0YZ1T/gewdXHvX+ofzbMzF4MCpL8wvDvA2w==
X-Received: by 2002:a05:6830:1aec:: with SMTP id c12mr17263189otd.227.1605110927203;
        Wed, 11 Nov 2020 08:08:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z7sm483911oib.57.2020.11.11.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:46 -0800 (PST)
Date:   Wed, 11 Nov 2020 10:08:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/18] arm64: dts: qcom: Harmonize DWC USB3 DT nodes
 name
Message-ID: <20201111160844.GJ173948@builder.lan>
References: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
 <20201111091552.15593-19-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111091552.15593-19-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Nov 03:15 CST 2020, Serge Semin wrote:

> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Given the risk of merge conflicts with this patch I would prefer to take
it through the qcom dts tree. Please let me know when patch 17 has been
merged (or if you prefer that I take it through the same path).

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
> index 96a5ec89b5f0..1129062a4ca1 100644
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
> index 9951286db775..66b6d2f0a093 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1767,7 +1767,7 @@ usb3: usb@6af8800 {
>  			power-domains = <&gcc USB30_GDSC>;
>  			status = "disabled";
>  
> -			dwc3@6a00000 {
> +			usb@6a00000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x06a00000 0xcc00>;
>  				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1978,7 +1978,7 @@ usb2: usb@76f8800 {
>  			power-domains = <&gcc USB30_GDSC>;
>  			status = "disabled";
>  
> -			dwc3@7600000 {
> +			usb@7600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x07600000 0xcc00>;
>  				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index c45870600909..7cc7897e7b83 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1678,7 +1678,7 @@ usb3: usb@a8f8800 {
>  
>  			resets = <&gcc GCC_USB_30_BCR>;
>  
> -			usb3_dwc3: dwc3@a800000 {
> +			usb3_dwc3: usb@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x0a800000 0xcd00>;
>  				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 6422cf9d5855..88d7b7a53743 100644
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
> index b654b802e95c..f6ef17553064 100644
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
> index d46b3833e52f..bbc9a2b5c570 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2673,7 +2673,7 @@ usb_1: usb@a6f8800 {
>  					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			usb_1_dwc3: dwc3@a600000 {
> +			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xe000>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 2884577dcb77..ca20e4e91f61 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3573,7 +3573,7 @@ usb_1: usb@a6f8800 {
>  					<&gladiator_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3_0>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			usb_1_dwc3: dwc3@a600000 {
> +			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> @@ -3621,7 +3621,7 @@ usb_2: usb@a8f8800 {
>  					<&gladiator_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3_1>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			usb_2_dwc3: dwc3@a800000 {
> +			usb_2_dwc3: usb@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a800000 0 0xcd00>;
>  				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index b86a7ead3006..167d14dda974 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -846,7 +846,7 @@ usb_1: usb@a6f8800 {
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> -			usb_1_dwc3: dwc3@a600000 {
> +			usb_1_dwc3: usb@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.28.0
> 
