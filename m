Return-Path: <linux-arm-msm+bounces-39774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB59DF9F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 05:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 818BC160FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 04:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93911D14FA;
	Mon,  2 Dec 2024 04:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFyHAcD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485B28399;
	Mon,  2 Dec 2024 04:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733114086; cv=none; b=ScYWC/liWNncxzfE544ogcH9bhPQZJMvuaSuX5Mfj5bWbHfH3AaSUAuswZ/mpYX9O55qlHmdn22Znn5z87SGoudZARvE+1OrDCYscoHdevd+ixtMk8EDkV9f063Fx2WGlQIb6h/4PoB0z9Z8f2Zp32PuiM8Be42LCHrmYSfjjvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733114086; c=relaxed/simple;
	bh=oCme0MOKqzQQxi7TmLZDxECaBpW0/t9Pl6cMKvqD3hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgQscvXoRrJqHDZGda4TxLC32ozMBaWdNDM+yGefF9jlPpj1wkdgdnXFpp9toK2HMSu9bjapaDxO9O9hetJtIkjY0f1lJ7oN9D1G01zHGUekVzIp8noPP/wIBIMLKcestnn+IiAMdwPAejADgcCMnBYH6myiXunGZasGsVGV40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFyHAcD+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64415C4CED2;
	Mon,  2 Dec 2024 04:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733114086;
	bh=oCme0MOKqzQQxi7TmLZDxECaBpW0/t9Pl6cMKvqD3hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFyHAcD+W1K+9b2zX+8KO1lJ/fnkAkuojJ9RJoJoJ0nBANBaFBFNT6pWvPfPeop0t
	 LD9FsUqhN7Fn5j9Wn11RJf7f7IEcAQtZFBiomWxi0vKSaP4VFbTfjaFeR3N50rIaLb
	 sB+XOyHfwxExrenWo4BQQbxVRgQYpIKlc4z9RPkrPFp6SPyoWC1xVGdlK4726gPgyp
	 EHkKj8pVgMVhjkZz1JgdcDJFUoBkX4tioB8kPKbUISysWhzDpngmVCXnra/GWTn+bP
	 vFE6ESo7ycEDtdlTPMHtgjTzU31SXzm6XMMEePkUStaRU7v0ksrtzHaRuGfmKp5zwL
	 LbclEbGLDCibA==
Date: Sun, 1 Dec 2024 22:34:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	konradybcio@kernel.org, quic_tsoni@quicinc.com, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs615: enable pcie for qcs615
 soc
Message-ID: <jwfqxrfbnbijp7s54e44mzqxlmbq32bs4imnjcyjvvvs7deeza@pkylehjbxqib>
References: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
 <20241122023314.1616353-6-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122023314.1616353-6-quic_ziyuzhan@quicinc.com>

On Fri, Nov 22, 2024 at 10:33:13AM +0800, Ziyue Zhang wrote:

The way we say "this is a DT patch for qcs615" is by prefixing the
subject "arm64: dts: qcom: qcs615: ", there's therefor no reason to
include "for qcs615" in the tail of the subject. You can further drop
the "soc" tail, as you said "qcs615" and not e.g. "qcs615-ride".

> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Patch has wrong Author.

> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 158 +++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 868808918fd2..c56cc30a59f3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -678,6 +678,164 @@ rpmhpd_opp_turbo_l1: opp-9 {
>  		};
>  	};
>  
> +	pcie: pcie@1c08000 {

This node looks to be in the wrong place.

Regards,
Bjorn

> +		compatible = "qcom,pcie-qcs615";
> +		reg = <0x0 0x01c08000 0x0 0x3000>,
> +		      <0x0 0x40000000 0x0 0xf1d>,
> +		      <0x0 0x40000f20 0x0 0xa8>,
> +		      <0x0 0x40001000 0x0 0x1000>,
> +		      <0x0 0x40100000 0x0 0x100000>,
> +		      <0x0 0x01c0b000 0x0 0x1000>;
> +
> +		reg-names = "parf",
> +			    "dbi",
> +			    "elbi",
> +			    "atu",
> +			    "config",
> +			    "mhi";
> +
> +		device_type = "pci";
> +		linux,pci-domain = <0>;
> +		bus-range = <0x00 0xff>;
> +		num-lanes = <1>;
> +
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +			 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> +
> +		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "msi0",
> +				  "msi1",
> +				  "msi2",
> +				  "msi3",
> +				  "msi4",
> +				  "msi5",
> +				  "msi6",
> +				  "msi7",
> +				  "global";
> +
> +		interrupt-map = <0 0 0 0 &intc 0 0 0 140 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> +				<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 0x7>;
> +
> +		interconnects = <&aggre1_noc MASTER_PCIE QCOM_ICC_TAG_ALWAYS
> +				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +				<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +				 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
> +		interconnect-names = "pcie-mem", "cpu-pcie";
> +
> +		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +			 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +			 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +			 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> +			 <&rpmhcc RPMH_CXO_CLK>;
> +
> +		clock-names = "aux",
> +			      "cfg",
> +			      "bus_master",
> +			      "bus_slave",
> +			      "slave_q2a",
> +			      "ref";
> +
> +		assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		operating-points-v2 = <&pcie_opp_table>;
> +
> +		resets = <&gcc GCC_PCIE_0_BCR>;
> +		reset-names = "pci";
> +
> +		phys = <&pcie_phy>;
> +		phy-names = "pciephy";
> +
> +		power-domains = <&gcc PCIE_0_GDSC>;
> +
> +		dma-coherent;
> +
> +		iommu-map = <0x0 &apps_smmu 0x400 0x1>,
> +			    <0x100 &apps_smmu 0x401 0x1>;
> +
> +		status = "disabled";
> +		pcie_opp_table: opp-table {
> +			compatible = "operating-points-v2";
> +
> +			/* GEN 1 x1 */
> +			opp-2500000 {
> +				opp-hz = /bits/ 64 <2500000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +				opp-peak-kBps = <250000 1>;
> +			};
> +
> +			/* GEN 2 x1 */
> +			opp-5000000 {
> +				opp-hz = /bits/ 64 <5000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +				opp-peak-kBps = <500000 1>;
> +			};
> +
> +			/* GEN 3 x1 */
> +			opp-8000000 {
> +				opp-hz = /bits/ 64 <8000000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>;
> +				opp-peak-kBps = <984500 1>;
> +			};
> +		};
> +
> +		pcie@0 {
> +			device_type = "pci";
> +			reg = <0x0 0x0 0x0 0x0 0x0>;
> +			bus-range = <0x01 0xff>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges;
> +		};
> +	};
> +
> +	pcie_phy: phy@1c0e000 {
> +		compatible = "qcom,qcs615-qmp-gen3x1-pcie-phy";
> +		reg = <0x0 0x01c0e000 0x0 0x1000>;
> +
> +		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> +			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +			 <&gcc GCC_PCIE_0_CLKREF_CLK>,
> +			 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>,
> +			 <&gcc GCC_PCIE_0_PIPE_CLK>;
> +		clock-names = "aux",
> +			      "cfg_ahb",
> +			      "ref",
> +			      "refgen",
> +			      "pipe";
> +
> +		clock-output-names = "pcie_0_pipe_clk";
> +		#clock-cells = <0>;
> +
> +		#phy-cells = <0>;
> +
> +		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
> +		reset-names = "phy";
> +
> +		assigned-clocks = <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
> +		assigned-clock-rates = <100000000>;
> +
> +		status = "disabled";
> +	};
> +
>  	arch_timer: timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> -- 
> 2.34.1
> 

