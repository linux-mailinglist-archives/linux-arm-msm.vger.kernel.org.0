Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080AF39CC47
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 04:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhFFC2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 22:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhFFC2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 22:28:33 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B16C061767
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jun 2021 19:26:33 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id k21-20020a4a2a150000b029024955603642so1113054oof.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 19:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L5RSFvWpwscbW8EJXefKLBodp6kt5+ekrJRbIpzGRb0=;
        b=mzxnCweQCCqXxF2UEGlf8fD2NrNAdQIey7r0ghy1LTmnSlnUaQIRn52+WX8LnGy08T
         wf+I2LaEOAckeP5rBxGt0hcdc9K5b6PgQe28ggfeoRVtznmoA4EaerjXnYyQFp+c4E75
         gfxVxoFUC1RFPyrUYSLyaoPQhCyI2saXIsBi5ihqwT5QHK2gMhXDfHolnbslPtrayQmT
         mlDyGAjwlbGZrBbjqK72ANdcYRb7OGqAYN0onXp/XsHHN3XoEh+uFzzOeV9mUGoXmJFh
         TbqDANs8R+mpit6tAu6Je2Gu0yKAbHCEqK5DYQSQ9ZC/TZZm2TgxJephh51T60naI1Sh
         tJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L5RSFvWpwscbW8EJXefKLBodp6kt5+ekrJRbIpzGRb0=;
        b=R/1hnzKqIA6drFaYa6KDyS4F7RYBD9f0RLzNuf0UeQ7/tPd+nKL0giOV/bPrz4jG+2
         i9wUmzE8Hqb9VpthKrcBxr5PbMw+rEqdtXP83m6ULt2XFTZLzXrVJYLCF8DOEXX+Ze0b
         4U36dPZ2+z2RpLK3t7zMf1XoaOitB83nwU5F9uItMPAkM5VHDTxli0/ULWtnaUGf3ij9
         /U2dd/a3C5Rry/qP9zJyEiRCUx4FJPsV51C7H5OQdIW+PFefwMCzvZfj8AfqykAeQh1F
         Kac3Wd6umtj40Nt4tVPdtNYcj1UTIYu9ytIgxu/J5+uz3cfIcaCgJTMLvP8vrAI/qpW1
         JUZA==
X-Gm-Message-State: AOAM531ohO15kOnOyQ1iJ+AEVU2hTJ7nZQ5Oz7hWyxZ810Aqykes/rVO
        IOAke394brqHBiQ5hncNHvABjA==
X-Google-Smtp-Source: ABdhPJwxvAnwpTOe+kA3y/aSnYBlwu4+M8fSqa3bOnEhTi34bHFDCLt9s0jgWmVkM17niJLj8K5U8A==
X-Received: by 2002:a4a:9bcb:: with SMTP id b11mr9026361ook.44.1622946392524;
        Sat, 05 Jun 2021 19:26:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n13sm1380237oop.8.2021.06.05.19.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 19:26:32 -0700 (PDT)
Date:   Sat, 5 Jun 2021 21:26:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bhelgaas@google.com, robh+dt@kernel.org,
        swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, sanm@codeaurora.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY
 related nodes
Message-ID: <YLwyVh4xyEyvXKDU@builder.lan>
References: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org>
 <1622904059-21244-3-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622904059-21244-3-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 05 Jun 09:40 CDT 2021, Prasad Malisetty wrote:

> Add PCIe controller and PHY nodes for sc7280 SOC.
> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 138 +++++++++++++++++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 0b6f119..9e8414d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -484,6 +485,117 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		pcie1: pci@1c08000 {

Does this name imply that you have a pcie0 as well? Please introduce it
while you're at it.

> +			compatible = "qcom,pcie-sc7280", "qcom,pcie-sm8250", "snps,dw-pcie";
> +			reg = <0 0x01c08000 0 0x3000>,
> +			      <0 0x40000000 0 0xf1d>,
> +			      <0 0x40000f20 0 0xa8>,
> +			      <0 0x40001000 0 0x1000>,
> +			      <0 0x40100000 0 0x100000>;
> +
> +			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			device_type = "pci";
> +			linux,pci-domain = <1>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <2>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> +
> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +
> +			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
> +				 <&pcie1_lane 0>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_PCIE_1_AUX_CLK>,
> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
> +				 <&gcc GCC_DDRSS_PCIE_SF_CLK>;
> +
> +			clock-names = "pipe",
> +				      "pipe_src",
> +				      "pipe_ext",
> +				      "ref",
> +				      "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "tbu",
> +				      "ddrss_sf_tbu";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> +			assigned-clock-rates = <19200000>;
> +
> +			resets = <&gcc GCC_PCIE_1_BCR>;
> +			reset-names = "pci";
> +
> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
> +
> +			phys = <&pcie1_lane>;
> +			phy-names = "pciephy";
> +
> +			perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pcie1_default_state>;
> +
> +			iommus = <&apps_smmu 0x1c80 0x1>;
> +
> +			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> +				    <0x100 &apps_smmu 0x1c81 0x1>;
> +
> +			status = "disabled";
> +		};
> +
> +		pcie1_phy: phy@1c0e000 {
> +			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";

No, you don't have a sm8250-qmp-gen3x2-pcie-phy in your sc7280.

> +			status = "disabled";
> +			reg = <0 0x01c0e000 0 0x1c0>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_CLKREF_EN>,
> +				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
> +			clock-names = "aux", "cfg_ahb", "ref", "refgen";
> +
> +			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
> +			reset-names = "phy";
> +
> +			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			pcie1_lane: lanes@1c0e200 {
> +				reg = <0 0x01c0e200 0 0x170>,
> +				      <0 0x01c0e400 0 0x200>,
> +				      <0 0x01c0ea00 0 0x1f0>,
> +				      <0 0x01c0e600 0 0x170>,
> +				      <0 0x01c0e800 0 0x200>,
> +				      <0 0x01c0ee00 0 0xf4>;
> +				clocks = <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "pipe0";
> +
> +				#phy-cells = <0>;
> +				#clock-cells = <1>;
> +				clock-output-names = "pcie_1_pipe_clk";
> +			};
> +		};
> +
>  		stm@6002000 {
>  			compatible = "arm,coresight-stm", "arm,primecell";
>  			reg = <0 0x06002000 0 0x1000>,
> @@ -1102,6 +1214,32 @@
>  				pins = "gpio46", "gpio47";
>  				function = "qup13";
>  			};
> +
> +			pcie1_default_state: pcie1-default {

Per the binding the name has to end with "-pins", although I would like
us to change that to "-state". Either way, this is not correct.

> +				clkreq {
> +					pins = "gpio79";
> +					function = "pcie1_clkreqn";
> +				};
> +
> +				reset-n {
> +					pins = "gpio2";
> +					function = "gpio";
> +
> +					drive-strength = <16>;
> +					output-low;
> +					bias-disable;
> +				};
> +
> +				wake-n {
> +					pins = "gpio3";
> +					function = "gpio";
> +				};
> +
> +				nvme-n {

This doesn't look like a standard PCIe pin, is it perhaps the enable pin
for the regulator powering your NVME, or something along those lines?

If so you should describe it as a fixed-regulator...and either way I
suspect it should be moved to the device specific file.

Regards,
Bjorn

> +					pins = "gpio19";
> +					function = "gpio";
> +				};
> +			};
>  		};
>  
>  		apps_smmu: iommu@15000000 {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
