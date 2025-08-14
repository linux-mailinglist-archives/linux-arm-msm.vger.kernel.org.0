Return-Path: <linux-arm-msm+bounces-69097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E51B25992
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 04:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 118C51C8573E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 02:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB65256C6F;
	Thu, 14 Aug 2025 02:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKSv53dd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B0A24C68B;
	Thu, 14 Aug 2025 02:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755139350; cv=none; b=ijdqSR52skSKB5QQEs0T4U5i140cEqXF8BA2vvEtj5u95IMEiOTtYnx05Q+BP+D96tT9Lgmd6NSlVLtHp+Gd2fMWycj4B8tujXDanPLkC8q4QRsJDNTxfEHu6T7IvtFhZBwB+8QcFhIeDmoEm45/o1IHoKYSfeFXdjRA46ypZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755139350; c=relaxed/simple;
	bh=gO3lJXgabc7AUPzva2vdMGiplMe6IOlcwtjT6/u0L4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iM7Qse65lbYRApOBSIJ2oB1QhXvsHDkMgEiJqxeH78yFeBv5P66Qw4Lp1UOJCiKuKrqAvDu4my5IlQ/jsTKzOFO2xV9NGXNo23NCJVsj1I+LkwCaPtRm0WocrNa1hGaalJbrKbR3B1+pOpM6mJRml3187Qtjl4VLIh6TPLCijlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKSv53dd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94629C4CEEB;
	Thu, 14 Aug 2025 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755139349;
	bh=gO3lJXgabc7AUPzva2vdMGiplMe6IOlcwtjT6/u0L4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKSv53ddCeFZktY6OTHrIsl/pgos9p00zm1sqO2e4PozAJ2sBskiudD4873TCmr/F
	 0GZMdS/bl9LHR4T1vDPy0fBzdVA7ftX7HTxsyetASg9t0jLT/18/EWl2CVWv3bSTqy
	 8v9DcoQ1yNCsd+45madOmFEVYNIt2LVTGVPqr0QooP2BGuKbt3OhGOBhdXQf/M2HHX
	 Z//mD73GnVVHdhFNKPGFeY+l7dJt8YUs/6Q4tbSW/5N2OHydmvfkRDLX3hb0cBCI/V
	 4dw4a2ic2Xm4QREt25fdp2ZSzZS+SYvzbb7t3V+rACvq33MnArlB/Ikq7UI54dC0b9
	 86W8UyaTdGbnw==
Date: Wed, 13 Aug 2025 21:42:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: marcus@nazgul.ch, kirill@korins.ky, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
Message-ID: <tlkv63ccpnti367am47ymhaw3agjnyuonqstgtfaazhhptvgsp@q4wzuzdph323>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814005904.39173-4-harrison.vanderbyl@gmail.com>

On Thu, Aug 14, 2025 at 10:59:04AM +1000, Harrison Vanderbyl wrote:

Welcome to LKML, Harrison. Some small things to improve.

Please extend the subject prefix to match other changes in the files of
each patch, e.g. this one would be "arm64: dts: qcom: x1e80100: ".

"git log --oneline -- file" is your friend here.

> Describe device tree entry for x1e80100 ufs device

A blank line here please.

> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 91 ++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a9a7bb676c6f..effa776e3dd0 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2819,6 +2819,97 @@ tsens3: thermal-sensor@c274000 {
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> +

Watch out for unnecessary white spaces, we want to keep things neat and
tidy.

> +		ufs_mem_hc: ufs@1d84000 {

Please place nodes sorted based on address, then name, then label (i.e.
in this case, only address).

> +			compatible = "qcom,x1e80100-ufshc",
> +			"qcom,ufshc", "jedec,ufs-2.0";

This line break is a bit weird, please indent it.

Regards,
Bjorn

> +			reg = <0 0x01d84000 0 0x3000>;     
> +			
> +			
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +
> +			lanes-per-direction = <2>;
> +
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +
> +			reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +			reset-names = "rst";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			iommus = <&apps_smmu 0x1a0 0x0>;
> +
> +			clock-names = "core_clk",
> +				      "bus_aggr_clk",
> +				      "iface_clk",
> +				      "core_clk_unipro",
> +				      "ref_clk",
> +				      "tx_lane0_sync_clk",
> +				      "rx_lane0_sync_clk",
> +				      "rx_lane1_sync_clk";
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +
> +			freq-table-hz = <100000000 403000000>,
> +					<0 0>,
> +					<0 0>,
> +					<100000000 403000000>,
> +					<100000000 403000000>,
> +					<0 0>,
> +					<0 0>,
> +					<0 0>;
> +
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ufs-ddr", "cpu-ufs";
> +
> +			qcom,ice = <&ice>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,x1e80100-qmp-ufs-phy";
> +			reg = <0 0x01d80000 0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> +
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ice: crypto@1d90000 {
> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x1d88000 0 0x8000>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};
> +
>  		usb_1_ss0_hsphy: phy@fd3000 {
>  			compatible = "qcom,x1e80100-snps-eusb2-phy",
>  				     "qcom,sm8550-snps-eusb2-phy";
> -- 
> 2.48.1
> 

