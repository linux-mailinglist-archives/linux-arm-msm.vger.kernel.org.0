Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F562B0CE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 19:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgKLSnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 13:43:17 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:48820 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgKLSnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 13:43:17 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 94E04803017D;
        Thu, 12 Nov 2020 18:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a0u_gBbCrOP8; Thu, 12 Nov 2020 21:43:09 +0300 (MSK)
Date:   Thu, 12 Nov 2020 21:43:08 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 18/18] arm64: dts: qcom: Harmonize DWC USB3 DT nodes
 name
Message-ID: <20201112184308.7xrrpji257ufivx4@mobilestation>
References: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
 <20201111091552.15593-19-Sergey.Semin@baikalelectronics.ru>
 <20201111160844.GJ173948@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201111160844.GJ173948@builder.lan>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn

On Wed, Nov 11, 2020 at 10:08:44AM -0600, Bjorn Andersson wrote:
> On Wed 11 Nov 03:15 CST 2020, Serge Semin wrote:
> 
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 

> Given the risk of merge conflicts with this patch I would prefer to take
> it through the qcom dts tree. Please let me know when patch 17 has been
> merged (or if you prefer that I take it through the same path).

I don't really know through what path the patch was supposed to find
its way into the kernel. Since I haven't got a public repo then for me a
preferred solution would be to merge this patch and the other by means
of the qcom tree.

Thanks
-Sergey

> 
> Regards,
> Bjorn
> 
> > ---
> >  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++--
> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi        | 4 ++--
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi        | 4 ++--
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi        | 2 +-
> >  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi     | 2 +-
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi         | 4 ++--
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 2 +-
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi         | 4 ++--
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi         | 2 +-
> >  9 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > index defcbd15edf9..34e97da98270 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > @@ -1064,7 +1064,7 @@ &usb2 {
> >  	status = "okay";
> >  	extcon = <&usb2_id>;
> >  
> > -	dwc3@7600000 {
> > +	usb@7600000 {
> >  		extcon = <&usb2_id>;
> >  		dr_mode = "otg";
> >  		maximum-speed = "high-speed";
> > @@ -1075,7 +1075,7 @@ &usb3 {
> >  	status = "okay";
> >  	extcon = <&usb3_id>;
> >  
> > -	dwc3@6a00000 {
> > +	usb@6a00000 {
> >  		extcon = <&usb3_id>;
> >  		dr_mode = "otg";
> >  	};
> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > index 96a5ec89b5f0..1129062a4ca1 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > @@ -427,7 +427,7 @@ usb_0: usb@8af8800 {
> >  			resets = <&gcc GCC_USB0_BCR>;
> >  			status = "disabled";
> >  
> > -			dwc_0: dwc3@8a00000 {
> > +			dwc_0: usb@8a00000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0x8a00000 0xcd00>;
> >  				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> > @@ -468,7 +468,7 @@ usb_1: usb@8cf8800 {
> >  			resets = <&gcc GCC_USB1_BCR>;
> >  			status = "disabled";
> >  
> > -			dwc_1: dwc3@8c00000 {
> > +			dwc_1: usb@8c00000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0x8c00000 0xcd00>;
> >  				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 9951286db775..66b6d2f0a093 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -1767,7 +1767,7 @@ usb3: usb@6af8800 {
> >  			power-domains = <&gcc USB30_GDSC>;
> >  			status = "disabled";
> >  
> > -			dwc3@6a00000 {
> > +			usb@6a00000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0x06a00000 0xcc00>;
> >  				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
> > @@ -1978,7 +1978,7 @@ usb2: usb@76f8800 {
> >  			power-domains = <&gcc USB30_GDSC>;
> >  			status = "disabled";
> >  
> > -			dwc3@7600000 {
> > +			usb@7600000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0x07600000 0xcc00>;
> >  				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > index c45870600909..7cc7897e7b83 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > @@ -1678,7 +1678,7 @@ usb3: usb@a8f8800 {
> >  
> >  			resets = <&gcc GCC_USB_30_BCR>;
> >  
> > -			usb3_dwc3: dwc3@a800000 {
> > +			usb3_dwc3: usb@a800000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0x0a800000 0xcd00>;
> >  				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> > index 6422cf9d5855..88d7b7a53743 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> > @@ -337,7 +337,7 @@ &usb2_phy_sec {
> >  &usb3 {
> >  	status = "okay";
> >  
> > -	dwc3@7580000 {
> > +	usb@7580000 {
> >  		dr_mode = "host";
> >  	};
> >  };
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index b654b802e95c..f6ef17553064 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -544,7 +544,7 @@ usb3: usb@7678800 {
> >  			assigned-clock-rates = <19200000>, <200000000>;
> >  			status = "disabled";
> >  
> > -			dwc3@7580000 {
> > +			usb@7580000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0x07580000 0xcd00>;
> >  				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > @@ -573,7 +573,7 @@ usb2: usb@79b8800 {
> >  			assigned-clock-rates = <19200000>, <133333333>;
> >  			status = "disabled";
> >  
> > -			dwc3@78c0000 {
> > +			usb@78c0000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0x078c0000 0xcc00>;
> >  				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index d46b3833e52f..bbc9a2b5c570 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -2673,7 +2673,7 @@ usb_1: usb@a6f8800 {
> >  					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3>;
> >  			interconnect-names = "usb-ddr", "apps-usb";
> >  
> > -			usb_1_dwc3: dwc3@a600000 {
> > +			usb_1_dwc3: usb@a600000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0 0x0a600000 0 0xe000>;
> >  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 2884577dcb77..ca20e4e91f61 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -3573,7 +3573,7 @@ usb_1: usb@a6f8800 {
> >  					<&gladiator_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3_0>;
> >  			interconnect-names = "usb-ddr", "apps-usb";
> >  
> > -			usb_1_dwc3: dwc3@a600000 {
> > +			usb_1_dwc3: usb@a600000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0 0x0a600000 0 0xcd00>;
> >  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > @@ -3621,7 +3621,7 @@ usb_2: usb@a8f8800 {
> >  					<&gladiator_noc MASTER_APPSS_PROC &config_noc SLAVE_USB3_1>;
> >  			interconnect-names = "usb-ddr", "apps-usb";
> >  
> > -			usb_2_dwc3: dwc3@a800000 {
> > +			usb_2_dwc3: usb@a800000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0 0x0a800000 0 0xcd00>;
> >  				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index b86a7ead3006..167d14dda974 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -846,7 +846,7 @@ usb_1: usb@a6f8800 {
> >  
> >  			resets = <&gcc GCC_USB30_PRIM_BCR>;
> >  
> > -			usb_1_dwc3: dwc3@a600000 {
> > +			usb_1_dwc3: usb@a600000 {
> >  				compatible = "snps,dwc3";
> >  				reg = <0 0x0a600000 0 0xcd00>;
> >  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > -- 
> > 2.28.0
> > 
