Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138103E9E3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 08:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234506AbhHLGHv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 02:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233511AbhHLGHv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 02:07:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE99C061798
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 23:07:26 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so7091268pje.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 23:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jxvZ4r0pteSM6HzfJsNa9GwmkQjms4iL9SLGUdON+FA=;
        b=L3BNLlV1DJYBzbryMeY/ipN3UsCdCKMYPT1t3MxLhvMYMds6zUVaJ0oVvUnyf0Tvek
         QqY+xVhO9YzYbkUCSBkAXmJI+3+yti9Sk0n44YGISBuk3WWiJfoOONGuxxw4M/l1bXKc
         7gc0t4KK/T00wmoTZqeDxw9OJFXZWMf2kzDpgia/mBMwG2GFc1qa/4hS/jTiqQsVP0KJ
         8WPIX5juf0+6IA7ExogzZ8BwNlQKhx37eGgDaHO9Kuktcjdvn9NaE3WyNt+QndFsnwkG
         yEiqUYUXtB5VyLhxcUhdECrGCQPEVWYlaXOYTHapI5UXIWf72jZf919jabiibrRCg3kg
         v12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jxvZ4r0pteSM6HzfJsNa9GwmkQjms4iL9SLGUdON+FA=;
        b=PYjTXps094Au58fH+tmXJj18AfbXHn23qAnMFvpvmf3JiYhJeJcaWQ+xCQcdDPDIVt
         Hz6ma7ILkqDjdPj0PWHO3muEcllR0LicAzONBA2Yq/aSyI9A/0facuKPqFqLzqWymtgz
         DCfOAa7KvOgBBjwTd3fc0KtZEP3vSUt97KiWoKrAsUPPRDrYcF5uOCaPuqvJhskXw83x
         EihPJSCd3Yu9LOKdFNf93AEc1iCRVIc9xkV2ZsFyUOWp1wsuzJbSjJnvwBN7PuxQcUdR
         VdI0IvGfB8ZmRRP7NA5Q3f9o7FzMB/nk8vBxFNKqzXU4RIZ4jpwncd+kO7eo5JWLhIat
         tx5w==
X-Gm-Message-State: AOAM531pWmDwe5zpQiAveBBfKSL4MMM2TnIgLIes+gt1ZUQTBDWWmNfp
        W250rRpzlIPjKp7VtjqfH/jc
X-Google-Smtp-Source: ABdhPJytJCiYCZMVQB30pm7a5Wf2Kx9WqwfjKNHdBjNKY9En3Mx2K+TLR7Tzz2FN3vjkJZEyndxE7w==
X-Received: by 2002:a17:90a:cb12:: with SMTP id z18mr2693481pjt.84.1628748445743;
        Wed, 11 Aug 2021 23:07:25 -0700 (PDT)
Received: from thinkpad ([2409:4072:99a:700c:52f1:f031:1fc2:c301])
        by smtp.gmail.com with ESMTPSA id e31sm1521612pjk.19.2021.08.11.23.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 23:07:25 -0700 (PDT)
Date:   Thu, 12 Aug 2021 11:37:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY
 related nodes
Message-ID: <20210812060715.GA72145@thinkpad>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
 <1628568516-24155-3-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628568516-24155-3-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 10, 2021 at 09:38:34AM +0530, Prasad Malisetty wrote:
> Add PCIe controller and PHY nodes for sc7280 SOC.
> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 126 +++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 53a21d0..4500d88 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -586,6 +587,119 @@
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		pcie1: pci@1c08000 {
> +			compatible = "qcom,pcie-sc7280", "qcom,pcie-sm8250", "snps,dw-pcie";

Why 2 fallbacks? Fallbacks are meant to be used when the "fallback" compatible
driver can fully support the hw. In this case, neither "qcom,pcie-sm8250" nor "snps,dw-pcie"
can work properly, right?

I did the same mistake for SM8250 though... But please get rid of them.

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
> +			pipe-clk-source-switch;

Did you document this property in binding? You need to add "qcom" prefix since
this is a qcom specific one and not a generic PCI property.

Thanks,
Mani

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
> +			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>;
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
> +				      "pipe_mux",
> +				      "phy_pipe",
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
> +			status = "disabled";
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
>  		ipa: ipa@1e40000 {
>  			compatible = "qcom,sc7280-ipa";
>  
> @@ -1598,6 +1712,18 @@
>  					bias-bus-hold;
>  				};
>  			};
> +
> +			pcie1_default_state: pcie1-default-state {
> +				clkreq {
> +					pins = "gpio79";
> +					function = "pcie1_clkreqn";
> +				};
> +
> +				wake-n {
> +					pins = "gpio3";
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
