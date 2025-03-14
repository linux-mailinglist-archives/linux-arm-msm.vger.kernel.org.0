Return-Path: <linux-arm-msm+bounces-51446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D499A616E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED72219C666A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC2D204096;
	Fri, 14 Mar 2025 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M21f8F4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9A318B494;
	Fri, 14 Mar 2025 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741971479; cv=none; b=OFFsTZTreWBXVK/vwMldl7hcQGeFdBzDyIm5VJ43HIGuQzETIKx4eawjyIUdHAx/0FGgsZfjDhzk1V8XtF5Y6kLJFp0CWDb1ZrO/2apnf2+FLdLUEzW6qFhbroI1zDQTfbsX+LX0txv1VGFAEoeAt7RYmUA0waqkdZhYZNgGmRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741971479; c=relaxed/simple;
	bh=cPt7SdV0PHnGhuw/+jo6rBbvEgxfEdHwGV+fCLCMuHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtVfvoMD2Ou0kbYLemurgxYBHg4shW1xt4d/XywJK+PCcrKlzKLyUEuovekEU3hg3I5YOu3eO8TTebayAczIg67sm3h1ya/KeQrXpGDlgnLCzq7eCs1FPBUNmZJSAAs4duHck5BEC9hZSgvRaPz4+t5IJPssBsjzxHiCSz/hf00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M21f8F4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26A5C4CEE3;
	Fri, 14 Mar 2025 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741971478;
	bh=cPt7SdV0PHnGhuw/+jo6rBbvEgxfEdHwGV+fCLCMuHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M21f8F4OGQuLss/KtVs5aqgiBFY3Dc4UT8uR9MR6CsmWm2MBYc+dNdnUYnZl3HrhU
	 hbKhicKHqG9hTXjsDY7jDy6FEdAhySLRM0/gcShMY632oyaTC0F2TjPomJu4RYAdQZ
	 /BOH6tRHnjMqoQl6u14iNh85u4J4KoVlxn26lXVC+0j+kJ0Wm6rbvQBOEH/YOv5HJG
	 1PGJLosr8R822ntZcLt4s72Gixb4OQx+VpkD4LlikNeNd66OqCTKotYSye+zYK+u/1
	 OTOBWy+y15XLTwr7wrEnmaPMluXH4AfNOfwyORzId5CtB0yAz+PjbIKDFfmfh04JXD
	 wrMW89stSMc/w==
Date: Fri, 14 Mar 2025 11:57:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
Message-ID: <vfwoxjrfhakkkunl4wktn4muzj46vunjzc75j7zeu4wvpwbkkg@sh6d7zlp52ea>
References: <20250306111610.3313495-1-quic_mmanikan@quicinc.com>
 <20250306111610.3313495-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306111610.3313495-2-quic_mmanikan@quicinc.com>

On Thu, Mar 06, 2025 at 04:46:09PM +0530, Manikanta Mylavarapu wrote:
> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

When validating this against linux-next DT bindings I get:

arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg: [[0, 1015808, 0, 12288], [0, 1073741824, 0, 3868], [0, 1073745696, 0, 168], [0, 1073745920, 0, 4096], [0, 1074790400, 0, 4096], [0, 1040384, 0, 4096]] is too long
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:0: 'dbi' was expected
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:1: 'elbi' was expected
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:2: 'atu' was expected
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names:3: 'parf' was expected
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: pcie@f8000: reg-names: ['parf', 'dbi', 'elbi', 'atu', 'config', 'mhi'] is too long

Are we still missing something?

Regards,
Bjorn

> ---
> Changes in V5:
> 	- Pick up R-b tag.
> 	- Updated pcie node order based on unit address.
> 	- Updated the dbi address space size from 0xf1d to 0xf1c
> 	  in all pcie controller nodes.
> 	- Rebased on linux-next tip.
> 
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 514 +++++++++++++++++++++++++-
>  1 file changed, 510 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 7a7ad700a382..ff6faffc3b48 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
>  #include <dt-bindings/reset/qcom,ipq5424-gcc.h>
> +#include <dt-bindings/interconnect/qcom,ipq5424.h>
>  #include <dt-bindings/gpio/gpio.h>
>  
>  / {
> @@ -152,6 +153,258 @@ soc@0 {
>  		#size-cells = <2>;
>  		ranges = <0 0 0 0 0x10 0>;
>  
> +		pcie0: pcie@80000 {
> +			compatible = "qcom,pcie-ipq5424", "qcom,pcie-ipq9574";
> +			reg = <0x0 0x00080000 0x0 0x3000>,
> +			      <0x0 0x70000000 0x0 0xf1c>,
> +			      <0x0 0x70000f20 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x1000>,
> +			      <0x0 0x70100000 0x0 0x1000>,
> +			      <0x0 0x00086000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <0>;
> +			num-lanes = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x00100000>,
> +				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x0fd00000>;
> +
> +			msi-map = <0x0 &intc 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 436 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 437 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE0_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE0_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE0_AHB_CLK>,
> +				 <&gcc GCC_PCIE0_AUX_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng",
> +				      "ahb",
> +				      "aux";
> +
> +			assigned-clocks = <&gcc GCC_PCIE0_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			resets = <&gcc GCC_PCIE0_PIPE_ARES>,
> +				 <&gcc GCC_PCIE0_CORE_STICKY_RESET>,
> +				 <&gcc GCC_PCIE0_AXI_S_STICKY_RESET>,
> +				 <&gcc GCC_PCIE0_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE0_AXI_M_STICKY_RESET>,
> +				 <&gcc GCC_PCIE0_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE0_AUX_ARES>,
> +				 <&gcc GCC_PCIE0_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "sticky",
> +				      "axi_s_sticky",
> +				      "axi_s",
> +				      "axi_m_sticky",
> +				      "axi_m",
> +				      "aux",
> +				      "ahb";
> +
> +			phys = <&pcie0_phy>;
> +			phy-names = "pciephy";
> +			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
> +					<&gcc MASTER_CNOC_PCIE0	&gcc SLAVE_CNOC_PCIE0>;
> +			interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie0_phy: phy@84000 {
> +			compatible = "qcom,ipq5424-qmp-gen3x1-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
> +			reg = <0x0 0x00084000 0x0 0x2000>;
> +			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
> +				 <&gcc GCC_PCIE0_AHB_CLK>,
> +				 <&gcc GCC_PCIE0_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> +			assigned-clock-rates = <20000000>;
> +
> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
> +
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		pcie1: pcie@88000 {
> +			compatible = "qcom,pcie-ipq5424", "qcom,pcie-ipq9574";
> +			reg = <0x0 0x00088000 0x0 0x3000>,
> +			      <0x0 0x60000000 0x0 0xf1c>,
> +			      <0x0 0x60000f20 0x0 0xa8>,
> +			      <0x0 0x60001000 0x0 0x1000>,
> +			      <0x0 0x60100000 0x0 0x1000>,
> +			      <0x0 0x0008e000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <1>;
> +			num-lanes = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x00100000>,
> +				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x0fd00000>;
> +
> +			msi-map = <0x0 &intc 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 449 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 450 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 451 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 452 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE1_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_AUX_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng",
> +				      "ahb",
> +				      "aux";
> +
> +			assigned-clocks = <&gcc GCC_PCIE1_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
> +				 <&gcc GCC_PCIE1_CORE_STICKY_RESET>,
> +				 <&gcc GCC_PCIE1_AXI_S_STICKY_RESET>,
> +				 <&gcc GCC_PCIE1_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_M_STICKY_RESET>,
> +				 <&gcc GCC_PCIE1_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE1_AUX_ARES>,
> +				 <&gcc GCC_PCIE1_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "sticky",
> +				      "axi_s_sticky",
> +				      "axi_s",
> +				      "axi_m_sticky",
> +				      "axi_m",
> +				      "aux",
> +				      "ahb";
> +
> +			phys = <&pcie1_phy>;
> +			phy-names = "pciephy";
> +			interconnects = <&gcc MASTER_ANOC_PCIE1	&gcc SLAVE_ANOC_PCIE1>,
> +					<&gcc MASTER_CNOC_PCIE1	&gcc SLAVE_CNOC_PCIE1>;
> +			interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie1_phy: phy@8c000 {
> +			compatible = "qcom,ipq5424-qmp-gen3x1-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
> +			reg = <0x0 0x0008c000 0x0 0x2000>;
> +			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
> +				 <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
> +			assigned-clock-rates = <20000000>;
> +
> +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
> +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie1_pipe_clk_src";
> +
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		efuse@a4000 {
>  			compatible = "qcom,ipq5424-qfprom", "qcom,qfprom";
>  			reg = <0 0x000a4000 0 0x741>;
> @@ -209,6 +462,259 @@ tsens_base1: base1@41a {
>  			};
>  		};
>  
> +		pcie2: pcie@f0000 {
> +			compatible = "qcom,pcie-ipq5424", "qcom,pcie-ipq9574";
> +			reg = <0x0 0x000f0000 0x0 0x3000>,
> +			      <0x0 0x50000000 0x0 0xf1c>,
> +			      <0x0 0x50000f20 0x0 0xa8>,
> +			      <0x0 0x50001000 0x0 0x1000>,
> +			      <0x0 0x50100000 0x0 0x1000>,
> +			      <0x0 0x000f6000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <2>;
> +			num-lanes = <2>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x50200000 0x0 0x00100000>,
> +				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0x0fd00000>;
> +
> +			msi-map = <0x0 &intc 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 464 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 465 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 466 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 467 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE2_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE2_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE2_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE2_AHB_CLK>,
> +				 <&gcc GCC_PCIE2_AUX_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng",
> +				      "ahb",
> +				      "aux";
> +
> +			assigned-clocks = <&gcc GCC_PCIE2_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			resets = <&gcc GCC_PCIE2_PIPE_ARES>,
> +				 <&gcc GCC_PCIE2_CORE_STICKY_RESET>,
> +				 <&gcc GCC_PCIE2_AXI_S_STICKY_RESET>,
> +				 <&gcc GCC_PCIE2_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_M_STICKY_RESET>,
> +				 <&gcc GCC_PCIE2_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE2_AUX_ARES>,
> +				 <&gcc GCC_PCIE2_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "sticky",
> +				      "axi_s_sticky",
> +				      "axi_s",
> +				      "axi_m_sticky",
> +				      "axi_m",
> +				      "aux",
> +				      "ahb";
> +
> +			phys = <&pcie2_phy>;
> +			phy-names = "pciephy";
> +			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
> +					<&gcc MASTER_CNOC_PCIE2 &gcc SLAVE_CNOC_PCIE2>;
> +			interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie2_phy: phy@f4000 {
> +			compatible = "qcom,ipq5424-qmp-gen3x2-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> +			reg = <0x0 0x000f4000 0x0 0x2000>;
> +			clocks = <&gcc GCC_PCIE2_AUX_CLK>,
> +				 <&gcc GCC_PCIE2_AHB_CLK>,
> +				 <&gcc GCC_PCIE2_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE2_AUX_CLK>;
> +			assigned-clock-rates = <20000000>;
> +
> +			resets = <&gcc GCC_PCIE2_PHY_BCR>,
> +				 <&gcc GCC_PCIE2PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie2_pipe_clk_src";
> +
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		pcie3: pcie@f8000 {
> +			compatible = "qcom,pcie-ipq5424", "qcom,pcie-ipq9574";
> +			reg = <0x0 0x000f8000 0x0 0x3000>,
> +			      <0x0 0x40000000 0x0 0xf1c>,
> +			      <0x0 0x40000f20 0x0 0xa8>,
> +			      <0x0 0x40001000 0x0 0x1000>,
> +			      <0x0 0x40100000 0x0 0x1000>,
> +			      <0x0 0x000fe000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <3>;
> +			num-lanes = <2>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x00100000>,
> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x0fd00000>;
> +
> +			msi-map = <0x0 &intc 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 479 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 480 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 481 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 482 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE3_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE3_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE3_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE3_AHB_CLK>,
> +				 <&gcc GCC_PCIE3_AUX_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng",
> +				      "ahb",
> +				      "aux";
> +
> +			assigned-clocks = <&gcc GCC_PCIE3_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			resets = <&gcc GCC_PCIE3_PIPE_ARES>,
> +				 <&gcc GCC_PCIE3_CORE_STICKY_RESET>,
> +				 <&gcc GCC_PCIE3_AXI_S_STICKY_RESET>,
> +				 <&gcc GCC_PCIE3_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_M_STICKY_RESET>,
> +				 <&gcc GCC_PCIE3_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE3_AUX_ARES>,
> +				 <&gcc GCC_PCIE3_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "sticky",
> +				      "axi_s_sticky",
> +				      "axi_s",
> +				      "axi_m_sticky",
> +				      "axi_m",
> +				      "aux",
> +				      "ahb";
> +
> +			phys = <&pcie3_phy>;
> +			phy-names = "pciephy";
> +			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
> +					<&gcc MASTER_CNOC_PCIE3 &gcc SLAVE_CNOC_PCIE3>;
> +			interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie3_phy: phy@fc000 {
> +			compatible = "qcom,ipq5424-qmp-gen3x2-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> +			reg = <0x0 0x000fc000 0x0 0x2000>;
> +			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
> +				 <&gcc GCC_PCIE3_AHB_CLK>,
> +				 <&gcc GCC_PCIE3_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE3_AUX_CLK>;
> +			assigned-clock-rates = <20000000>;
> +
> +			resets = <&gcc GCC_PCIE3_PHY_BCR>,
> +				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie3_pipe_clk_src";
> +
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		tsens: thermal-sensor@4a9000 {
>  			compatible = "qcom,ipq5424-tsens";
>  			reg = <0 0x004a9000 0 0x1000>,
> @@ -276,10 +782,10 @@ gcc: clock-controller@1800000 {
>  			reg = <0 0x01800000 0 0x40000>;
>  			clocks = <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
> +				 <&pcie2_phy>,
> +				 <&pcie3_phy>,
>  				 <0>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.34.1
> 

