Return-Path: <linux-arm-msm+bounces-78408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4EBFE2CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E7834F1AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 20:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E95D2F9DB1;
	Wed, 22 Oct 2025 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/XFtpXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD42F99BE;
	Wed, 22 Oct 2025 20:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165047; cv=none; b=nNsYQB/4EpHVs2Y22R3XXHgblCpuvzDztM0trtQlTrVVfPUnT7TI5GuZ5vQTGxRDBaZ+x2V7ER7BxojvmFvQxbUBk+1VVLLBaY4zs9XDBSyA1Ca5ydhuo+/qQrYPw0deSmXOtKSUa3D4M9ip2ekxRsiDpjbJ+0Al1Y5+HwPxaMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165047; c=relaxed/simple;
	bh=p3vtHu+OYyW/Zzt/f9NNBy3GpdmbITaA6/OStXl00SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3FRUFyeTtJS3dLCPLUlQSCMNXh5E/qgLUhb+8etchk4kIv7rt7NdBqnaW4XgyxlcebH2+8tJuLiQuE+XOcWg93PLwkuve2lQqJNCxZGuNkvZ9Exe2Ug77NHaYz1+8YNCE9qFmBXGBrVqrohGR4laXx5wXYj0ukRv3iSrVK0AA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/XFtpXQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC205C4CEE7;
	Wed, 22 Oct 2025 20:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761165046;
	bh=p3vtHu+OYyW/Zzt/f9NNBy3GpdmbITaA6/OStXl00SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/XFtpXQzWNGZr7q6iPFLHxEc9hPZFeFk0RF2GzWGX/Ica4mIXlTL51V57H/ZTjQo
	 ZhyiQene+BwoyrG32/3L9PteynIFgBnQ7H8kotw6uIBVjHGsT6dipGJFeDxwIuDsDn
	 m6MoZaLQwvZC1l+Vys45y2UpTTYMXUnkdBBFm/0h1KpTWbKkjgTkHHqLylsC4Vy8Qg
	 qXZFMPCLidPQXDb018gfsloq21Dui5K9nNWjqzbtyOcW0WsssniqLHDHDy9gPtS14e
	 2lzA/aSnM2v/ZQWp3rVJY2QFALS3lLHq0AZee9Kb6NpxAphW9zwRXqncVMxIkGhAv/
	 qsVEusOrttexg==
Date: Wed, 22 Oct 2025 15:33:08 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Message-ID: <pr64zyppjyk7zpfsscx2dt6weuskoxyot2ldkhnzkaxrbzgo64@ptvc627f5l5c>
References: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
 <20251022084052.218043-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022084052.218043-2-krishna.kurapati@oss.qualcomm.com>

On Wed, Oct 22, 2025 at 02:10:50PM +0530, Krishna Kurapati wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall

Please start your commit message with the problem description and leave
the description of the "solution" to later.

If you replace "overall" with "SM8750" the second sentence is a good
start.

> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the

"The major difference from previous SoCs is the..."

> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This means "Konrad suggested that I implement this patch".

> [Konrad: Suggestion to flatten DT]

This syntax is for "patch was originally authored by above, but "name"
changed it in so-and-so way".

In other words, while the gesture of giving Konrad credit for his
suggestion during review is nice, you should omit the Suggested-by and
you should cover bigger things you changed since Wesley wrote the patch,
i.e. say:

[krishna: Flattened dwc3 node]

> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 158 +++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index a82d9867c7cb..d933c378bd8d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
> @@ -2581,6 +2582,163 @@ data-pins {
>  			};
>  		};
>  
> +		usb_1_hsphy: phy@88e3000 {
> +			compatible = "qcom,sm8750-m31-eusb2-phy";
> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> +
> +			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x4000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dp_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb_1: usb@a600000 {

Commit message says there's a single USB controller, so why does it need
a _1 suffix? (Same with usb_1_hsphy above)

Regards,
Bjorn

> +			compatible = "qcom,sm8750-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>,
> +					       <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
> +			iommus = <&apps_smmu 0x40 0x0>;
> +
> +			phys = <&usb_1_hsphy>,
> +			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,usb2-gadget-lpm-disable;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,usb3_lpm_capable;
> +			snps,usb2-lpm-disable;
> +			snps,has-lpm-erratum;
> +			tx-fifo-resize;
> +
> +			dma-coherent;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
> +					};
> +				};
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
> -- 
> 2.34.1
> 

