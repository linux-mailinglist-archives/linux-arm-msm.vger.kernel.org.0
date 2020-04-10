Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CAF1A4BD0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 00:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgDJWRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 18:17:41 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55832 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgDJWRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 18:17:41 -0400
Received: by mail-pj1-f66.google.com with SMTP id a32so1251328pje.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 15:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aBM0JvbqWYuuDuKdg2sRDaJkIAtEpOI0+fVr3eUzNbI=;
        b=EfAPKpe35MWh5pUF9LO2mbcSEKvxpQeIjspkKeugTfqP7m7xqA8N1nDlTqG0ftkh4A
         BFEJP9IQB/LuM2g0K3H2/6GE7UNUxDOMDqstuvnEjfUZNVnuCV4WgsDPpgtlehFdimbd
         OOdOSGvjcTswp+92XK2fQeDGqoYNyQc6khyDOkZQYiWXJ5MfC3K2tGXJGRwKrmFqr2ca
         GIZelc7qkQK4QP+rKi481Yzmb9jTB+A/EDJj3FBJ0xbdCjjgYzIhedmx0bqyaTVTEa/Q
         DSQhaL+sEPwNcVwvflx2hxCXzyibd74HFJQouKB3R590mavXuIFjhnwt6NcdcAGkwRKm
         hE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aBM0JvbqWYuuDuKdg2sRDaJkIAtEpOI0+fVr3eUzNbI=;
        b=S0Q99Vu2V9sz4zJobf+c261tesHChIA7x9M3gFBfZWiF8+N32AxkVlj5YhkwZhqk7q
         S8oXhtXcDFGNI39Yi4w0nDpGiAIGmTeAV7096ESxa0dZ5MxoS/KSazrU4bhL6RDeVYhc
         RmEyDHk29dZlMHNLKpFIadHDRgn3E2ilPC7jjf1IDTRWOS0c/KckyUXhWY2SIN9CcLRR
         2RB7N5UhTPAnwxz4DwOqybnjHeA2nEPpaJV1v1qEkYJ8HK0zp/tIRkxDSwA3rayvrwfI
         sb45LLDPsHx0r/gKy/mcYSk5sJMs4v+nZgrFdSs/gPWb46rQaihPmluuaETlr3vZR1uh
         Cbsg==
X-Gm-Message-State: AGi0Pubx26HF6QKzL4QhnB85oBKCZIOnn3l5EMh9X/37Lr9opu+54Q5G
        nZGP9M3M5eUbT4tHBTl6GqMkKg==
X-Google-Smtp-Source: APiQypKeoudHe6QJ82givqFbZgM5/4bnta8RZQw/sOt5Gm96dEo0w1t6kb5ma0j7lmKJrq2JcQa8qg==
X-Received: by 2002:a17:90a:8cf:: with SMTP id 15mr7929464pjn.136.1586557058876;
        Fri, 10 Apr 2020 15:17:38 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r23sm2672414pfh.162.2020.04.10.15.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:17:38 -0700 (PDT)
Date:   Fri, 10 Apr 2020 15:17:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, kishon@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH 3/3] arm64: dts: ipq8074: enable USB support
Message-ID: <20200410221748.GD20625@builder.lan>
References: <1586543372-13969-1-git-send-email-sivaprak@codeaurora.org>
 <1586543372-13969-4-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586543372-13969-4-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 10 Apr 11:29 PDT 2020, Sivaprakash Murugesan wrote:

> IPQ8074 has two super speed usb ports, add phy and dwc3 nodes
> to enable them.
> 

Thanks Sivaprakash, your patch looks good, just some comments on the
style below.

> Co-developed-by: Balaji Prakash J <bjagadee@codeaurora.org>
> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074-hk01.dts |  24 +++++
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi     | 168 ++++++++++++++++++++++++++++++
>  2 files changed, 192 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> index 70be3f9..dd27d84 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> @@ -26,6 +26,22 @@
>  	};
>  
>  	soc {
> +		ssphy@58000 {

Please reference these by label, like we do in e.g. sdm845-mtp.dts.

> +			status = "ok";
> +		};
> +
> +		qusb@59000 {
> +			status = "ok";
> +		};
> +
> +		ssphy@78000 {
> +			status = "ok";
> +		};
> +
> +		qusb@79000 {
> +			status = "ok";
> +		};
> +
>  		serial@78b3000 {
>  			status = "ok";
>  		};
> @@ -65,6 +81,14 @@
>  			};
>  		};
>  
> +		usb3@8A00000 {
> +			status = "ok";
> +		};
> +
> +		usb3@8C00000 {
> +			status = "ok";
> +		};
> +
>  		phy@86000 {
>  			status = "ok";
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 2b31823..47bb9ad 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -16,6 +16,92 @@
>  		ranges = <0 0 0 0xffffffff>;
>  		compatible = "simple-bus";
>  
> +		ssphy_1: ssphy@58000 {

Please use the generic name of "phy" here (i.e. ssphy_1: phy@58000 {)

> +			compatible = "qcom,ipq8074-qmp-usb3-phy";
> +			reg = <0x00058000 0x1c4>;
> +			status = "disabled";
> +			#clock-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_USB1_AUX_CLK>,
> +				 <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
> +				 <&xo>;
> +			clock-names = "aux", "cfg_ahb", "ref";
> +
> +			resets =  <&gcc GCC_USB1_PHY_BCR>,
> +				 <&gcc GCC_USB3PHY_1_PHY_BCR>;
> +			reset-names = "phy","common";
> +
> +			usb1_ssphy: lane@58200 {
> +				reg = <0x00058200 0x130>,	/* Tx */
> +				      <0x00058400 0x200>,	/* Rx */
> +				      <0x00058800 0x1F8>,	/* PCS  */
> +				      <0x00058600 0x044>;	/* PCS misc */
> +				#phy-cells = <0>;
> +				clocks = <&gcc GCC_USB1_PIPE_CLK>;
> +				clock-names = "pipe0";
> +				clock-output-names = "gcc_usb1_pipe_clk_src";
> +			};
> +		};
> +
> +		qusb_phy_1: qusb@59000 {

phy@

> +		    compatible = "qcom,msm8996-qusb2-phy";

Please add and use a ipq8074 compatible to the driver (.data can point
to msm8996_phy_cfg still).

> +		    reg = <0x00059000 0x180>;
> +		    status = "disabled";
> +		    #phy-cells = <0>;
> +
> +		    clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
> +			     <&xo>;
> +		    clock-names = "cfg_ahb", "ref";
> +
> +		    resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
> +		};
> +
> +		ssphy_0: ssphy@78000 {

phy@

> +			compatible = "qcom,ipq8074-qmp-usb3-phy";
> +			reg = <0x00078000 0x1c4>;
> +			status = "disabled";
> +			#clock-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_USB0_AUX_CLK>,
> +				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +				 <&xo>;
> +			clock-names = "aux", "cfg_ahb", "ref";
> +
> +			resets =  <&gcc GCC_USB0_PHY_BCR>,
> +				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
> +			reset-names = "phy","common";
> +
> +			usb0_ssphy: lane@78200 {
> +				reg = <0x00078200 0x130>,	/* Tx */
> +				      <0x00078400 0x200>,	/* Rx */
> +				      <0x00078800 0x1F8>,	/* PCS  */
> +				      <0x00078600 0x044>;	/* PCS misc */
> +				#phy-cells = <0>;
> +				clocks = <&gcc GCC_USB0_PIPE_CLK>;
> +				clock-names = "pipe0";
> +				clock-output-names = "gcc_usb0_pipe_clk_src";
> +			};
> +		};
> +
> +		qusb_phy_0: qusb@79000 {

phy@

> +		    compatible = "qcom,msm8996-qusb2-phy";
> +		    reg = <0x00079000 0x180>;
> +		    status = "disabled";
> +		    #phy-cells = <0>;
> +
> +		    clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +			     <&xo>;
> +		    clock-names = "cfg_ahb", "ref";
> +
> +		    resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +		};
> +
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,ipq8074-pinctrl";
>  			reg = <0x1000000 0x300000>;
> @@ -272,6 +358,88 @@
>  			status = "disabled";
>  		};
>  
> +		usb3_0: usb3@8A00000 {

usb@ and please lower case and make sure the unit address matches the
reg.

> +			compatible = "qcom,dwc3";
> +			reg = <0x08af8800 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
> +				<&gcc GCC_USB0_MASTER_CLK>,
> +				<&gcc GCC_USB0_SLEEP_CLK>,
> +				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +			clock-names = "sys_noc_axi",
> +				"master",
> +				"sleep",
> +				"mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
> +					  <&gcc GCC_USB0_MASTER_CLK>,
> +					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +			assigned-clock-rates = <133330000>,
> +					       <133330000>,
> +					       <19200000>;
> +
> +			resets = <&gcc GCC_USB0_BCR>;
> +			status = "disabled";
> +
> +			dwc_0: dwc3@8A00000 {

Please lowercase the address

> +				compatible = "snps,dwc3";
> +				reg = <0x8A00000 0xcd00>;

Ditto.

> +				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&qusb_phy_0>, <&usb0_ssphy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				tx-fifo-resize;
> +				snps,is-utmi-l1-suspend;
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_u3_susphy_quirk;
> +				dr_mode = "host";
> +			};
> +		};
> +
> +		usb3_1: usb3@8C00000 {

usb@, lowercase and match reg.

> +			compatible = "qcom,dwc3";
> +			reg = <0x08cf8800 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
> +				<&gcc GCC_USB1_MASTER_CLK>,
> +				<&gcc GCC_USB1_SLEEP_CLK>,
> +				<&gcc GCC_USB1_MOCK_UTMI_CLK>;
> +			clock-names = "sys_noc_axi",
> +				"master",
> +				"sleep",
> +				"mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_SYS_NOC_USB1_AXI_CLK>,
> +					  <&gcc GCC_USB1_MASTER_CLK>,
> +					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
> +			assigned-clock-rates = <133330000>,
> +					       <133330000>,
> +					       <19200000>;
> +
> +			resets = <&gcc GCC_USB1_BCR>;
> +			status = "disabled";
> +
> +			dwc_1: dwc3@8C00000 {

Please lowercase

> +				compatible = "snps,dwc3";
> +				reg = <0x8C00000 0xcd00>;

Ditto.

> +				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&qusb_phy_1>, <&usb1_ssphy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				tx-fifo-resize;
> +				snps,is-utmi-l1-suspend;
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_u3_susphy_quirk;
> +				dr_mode = "host";
> +			};
> +		};
> +
>  		pcie_phy0: phy@86000 {
>  			compatible = "qcom,ipq8074-qmp-pcie-phy";
>  			reg = <0x86000 0x1000>;

If you could send a separate patch (after this is merged is okay) that
sort the nodes in this file by address, it would be much appreciated.

Regards,
Bjorn

> -- 
> 2.7.4
> 
