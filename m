Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66BB1FA8D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 08:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgFPGgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 02:36:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgFPGgw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 02:36:52 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EB0920734;
        Tue, 16 Jun 2020 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592289411;
        bh=MiClSic9tiH3exzOAeHVb53Fy19wA+P/5nm1SXYHs4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kUfxqYU6EGRPw1vd/VF4GAq4hpIDKPjfgIB0rXIUBWVI1jAPy2RAFf/M3GUll85cn
         wIRDUz9ONdpzSFRrBBiSsM2Dcj1XSKsxxu74uuRm5BIlkuF9RMr+mUmbM2uZMrWALl
         /zsp/DImZPBu7SgAT/dlqTZ4+Io8PiIIXXSPfZZI=
Date:   Tue, 16 Jun 2020 12:06:44 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8150: Add USB and PHY device
 nodes
Message-ID: <20200616063644.GA2324254@vkoul-mobl>
References: <1586566362-21450-1-git-send-email-wcheng@codeaurora.org>
 <1586566362-21450-3-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586566362-21450-3-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-04-20, 17:52, Wesley Cheng wrote:
> From: Jack Pham <jackp@codeaurora.org>
> 
> Add device nodes for the USB3 controller, QMP SS PHY and
> SNPS HS PHY.

Bjorn, can you please review/pick this.. I dont see this in -rc1

> 
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Tested-by: Vinod Koul <vinod.koul@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 21 ++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 92 +++++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index 8ab1661..6c6325c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -408,3 +408,24 @@
>  	vdda-pll-supply = <&vreg_l3c_1p2>;
>  	vdda-pll-max-microamp = <19000>;
>  };
> +
> +&usb_1_hsphy {
> +	status = "okay";
> +	vdda-pll-supply = <&vdd_usb_hs_core>;
> +	vdda33-supply = <&vdda_usb_hs_3p1>;
> +	vdda18-supply = <&vdda_usb_hs_1p8>;
> +};
> +
> +&usb_1_qmpphy {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l3c_1p2>;
> +	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 141c21d..a36512d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -621,6 +621,98 @@
>  			};
>  		};
>  
> +		usb_1_hsphy: phy@88e2000 {
> +			compatible = "qcom,sm8150-usb-hs-phy",
> +							"qcom,usb-snps-hs-7nm-phy";
> +			reg = <0 0x088e2000 0 0x400>;
> +			status = "disabled";
> +			#phy-cells = <0>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +		};
> +
> +		usb_1_qmpphy: phy@88e9000 {
> +			compatible = "qcom,sm8150-qmp-usb3-phy";
> +			reg = <0 0x088e9000 0 0x18c>,
> +			      <0 0x088e8000 0 0x10>;
> +			reg-names = "reg-base", "dp_com";
> +			status = "disabled";
> +			#clock-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> +			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
> +
> +			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
> +			reset-names = "phy", "common";
> +
> +			usb_1_ssphy: lanes@88e9200 {
> +				reg = <0 0x088e9200 0 0x200>,
> +				      <0 0x088e9400 0 0x200>,
> +				      <0 0x088e9c00 0 0x218>,
> +				      <0 0x088e9600 0 0x200>,
> +				      <0 0x088e9800 0 0x200>,
> +				      <0 0x088e9a00 0 0x100>;
> +				#phy-cells = <0>;
> +				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +				clock-names = "pipe0";
> +				clock-output-names = "usb3_phy_pipe_clk_src";
> +			};
> +		};
> +
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8150-dwc3", "qcom,dwc3";
> +			reg = <0 0x0a6f8800 0 0x400>;
> +			status = "disabled";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			dma-ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB3_SEC_CLKREF_CLK>;
> +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> +				      "sleep", "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <150000000>;
> +
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hs_phy_irq", "ss_phy_irq",
> +					  "dm_hs_phy_irq", "dp_hs_phy_irq";
> +
> +			power-domains = <&gcc USB30_PRIM_GDSC>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			usb_1_dwc3: dwc3@a600000 {
> +				compatible = "snps,dwc3";
> +				reg = <0 0x0a600000 0 0xcd00>;
> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +			};
> +		};
> +
>  		aoss_qmp: power-controller@c300000 {
>  			compatible = "qcom,sm8150-aoss-qmp";
>  			reg = <0x0 0x0c300000 0x0 0x100000>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod
