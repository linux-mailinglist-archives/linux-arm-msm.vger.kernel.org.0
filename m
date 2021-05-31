Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA93C3966F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 19:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbhEaRZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 13:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbhEaRZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 13:25:41 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBF9C059CAE
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 08:58:10 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id x41-20020a05683040a9b02903b37841177eso1974326ott.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aSAgxaA5aZxuO/Fv7i81kY3F2ndtVlw1486mt0v683Y=;
        b=d9hK/wpQccMeIceBxBM5/JlQazT0SQhKi5Xt4XhBKQZuPPlgirwCaSYi/h8rZ4c8B3
         EuBOVZW+ZK+7ut3mcperjpbjlC1AUIQqw0rolcrGIndRMeWZPisJvjUGCPEL/+42Owss
         cIB+Edv243X/uheCXretEdFyrkEGWbe9xZGJbSNIBmwy6rXL+nLKq+85Rr2TS2G2Nc7v
         2kChvFi3qf7oNpnxU5CsnniadmZvnBTLBPdvDLx6pLZoalr51RoVI/OpWZsTwXi7/Jsv
         9IdsFgcjC3pW3ItHWQ0GaHli4/EzUc/e3nQfgC2xUiTAU96OK57HADQZyI+wZiNiWpyV
         LDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aSAgxaA5aZxuO/Fv7i81kY3F2ndtVlw1486mt0v683Y=;
        b=Is/7RjG5BPPJgh/FwqF7+4CaX+CPMX3EuAeodC1HSouK9l14RCdMAuJloslP0nvIhE
         exebMpxxGfc+ZIxQ6TNSA+1woxn+3xduNt/oruqRZW9OpkWu5s//n6jp47XEULNmLEwA
         /8L70a4DYHmfikE2LxYA0eAgokEizXB2ATW3vYNeYq9UxFPELUvFakap0qNJa+5LR3Tg
         bAyLYLoCMGeEroH3WsNVraIzLHm/pMN02Asd+YwEckVBZ8CZbskt3P90DB2r4QK4nFMx
         fnc1WydoU2TBcgWflbKL69Cs/jnAe3BHykIjBwF8MkGJuvmlgZnFKs5y/QeJ3lCuFOkM
         Ycyw==
X-Gm-Message-State: AOAM531ox40L81sUXE4MkGaEbBjeLPZDunUkn/M/z5wP+OlFmzN6UFok
        JOwFNKiSq1+xfcTa3yxm4r/5MQ==
X-Google-Smtp-Source: ABdhPJyAO/Z7p8bb8qM6OrWOMXYxzOoGfOOK/nOeYXlQOadAPGkjUBA26M+WzbwDRO/EaXBXr6roMw==
X-Received: by 2002:a05:6830:109a:: with SMTP id y26mr17500206oto.164.1622476689114;
        Mon, 31 May 2021 08:58:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p9sm514199otl.64.2021.05.31.08.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 08:58:08 -0700 (PDT)
Date:   Mon, 31 May 2021 10:58:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] ARM: dts: qcom: Add USB port definitions to
 ipq806x
Message-ID: <YLUHjtLkkp14HEqH@builder.lan>
References: <cover.1621097174.git.noodles@earth.li>
 <cover.1621531633.git.noodles@earth.li>
 <ad2121defc539abdb339b23eef80a8930b5f086e.1621531633.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2121defc539abdb339b23eef80a8930b5f086e.1621531633.git.noodles@earth.li>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 20 May 12:30 CDT 2021, Jonathan McDowell wrote:

> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 88 +++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 9628092217cb..c66859abdfd5 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -1026,6 +1026,94 @@
>  			status = "disabled";
>  		};
>  
> +		hs_phy_0: hs_phy_0 {

The node name should be some generic-thing@unit-address, so I fixed up
all your phys as "phy@100f8800" while applying your patches.

Thank you,
Bjorn

> +			compatible = "qcom,ipq806x-usb-phy-hs";
> +			reg = <0x100f8800 0x30>;
> +			clocks = <&gcc USB30_0_UTMI_CLK>;
> +			clock-names = "ref";
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ss_phy_0: ss_phy_0 {
> +			compatible = "qcom,ipq806x-usb-phy-ss";
> +			reg = <0x100f8830 0x30>;
> +			clocks = <&gcc USB30_0_MASTER_CLK>;
> +			clock-names = "ref";
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb3_0: usb3@100f8800 {
> +			compatible = "qcom,dwc3", "syscon";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x100f8800 0x8000>;
> +			clocks = <&gcc USB30_0_MASTER_CLK>;
> +			clock-names = "core";
> +
> +			ranges;
> +
> +			resets = <&gcc USB30_0_MASTER_RESET>;
> +			reset-names = "master";
> +
> +			status = "disabled";
> +
> +			dwc3_0: dwc3@10000000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x10000000 0xcd00>;
> +				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&hs_phy_0>, <&ss_phy_0>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				dr_mode = "host";
> +				snps,dis_u3_susphy_quirk;
> +			};
> +		};
> +
> +		hs_phy_1: hs_phy_1 {
> +			compatible = "qcom,ipq806x-usb-phy-hs";
> +			reg = <0x110f8800 0x30>;
> +			clocks = <&gcc USB30_1_UTMI_CLK>;
> +			clock-names = "ref";
> +			#phy-cells = <0>;
> +		};
> +
> +		ss_phy_1: ss_phy_1 {
> +			compatible = "qcom,ipq806x-usb-phy-ss";
> +			reg = <0x110f8830 0x30>;
> +			clocks = <&gcc USB30_1_MASTER_CLK>;
> +			clock-names = "ref";
> +			#phy-cells = <0>;
> +		};
> +
> +		usb3_1: usb3@110f8800 {
> +			compatible = "qcom,dwc3", "syscon";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x110f8800 0x8000>;
> +			clocks = <&gcc USB30_1_MASTER_CLK>;
> +			clock-names = "core";
> +
> +			ranges;
> +
> +			resets = <&gcc USB30_1_MASTER_RESET>;
> +			reset-names = "master";
> +
> +			status = "disabled";
> +
> +			dwc3_1: dwc3@11000000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x11000000 0xcd00>;
> +				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&hs_phy_1>, <&ss_phy_1>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				dr_mode = "host";
> +				snps,dis_u3_susphy_quirk;
> +			};
> +		};
> +
>  		vsdcc_fixed: vsdcc-regulator {
>  			compatible = "regulator-fixed";
>  			regulator-name = "SDCC Power";
> -- 
> 2.20.1
> 
