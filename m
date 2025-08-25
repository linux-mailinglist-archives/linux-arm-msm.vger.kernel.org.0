Return-Path: <linux-arm-msm+bounces-70588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4814B3387A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E47817B11C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 08:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5501F29B778;
	Mon, 25 Aug 2025 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aumFNw3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E31F19A;
	Mon, 25 Aug 2025 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756109454; cv=none; b=mXRxjYquFbrb92O43OTtg+J04MVO492gElZBz09BqXtm1V1SvvaLGdjVI4tC/q2DYpqz+h2lid5gZsePXitk+R40+3+/jGONvdXzCq5KDIO4/KkeDk9oWYjNiYzUoIM7xals0GLEdpNO1JhRadlhOpHL0XmkWnCC4wcKYqYO2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756109454; c=relaxed/simple;
	bh=BihhbLsDzRmPKeOAZEC9nAUboJNMLrQjryghluirl+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooZG1s4fJBH8snM9wNHdhLJlYEM+NpRskrRqPtJe1KI0dJ0LeSy5XPOouT1vAjItG/8nklHP/rSJNnVu9juTy92EDkWtH6KYUH7w03qUftD+svBmG4lLCEKdNPHb/GViSpVc17FLNo0tEnNUhlWillR2+9PuseZ/dLPJGTXMacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aumFNw3h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2799C4CEED;
	Mon, 25 Aug 2025 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756109453;
	bh=BihhbLsDzRmPKeOAZEC9nAUboJNMLrQjryghluirl+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aumFNw3h3qQ2VRqJkfw+ukOzuQwleIS2F5k1Chf5Zh2JNibASN8Qskt5lTEE9/Kt5
	 WHwJ8+O5MM90oqEv07eGJZBRCSo/2JYWMv1ypCCeqtXlLiyPxliDodC7aR+ap5Meq/
	 6upBpYFhCL1DHVs7Dy6Ac+5o/JdBFpkMB1axm5JKsDX7SN1SNXw9sh6G1qD57AKKSA
	 3y23k8lfFIhea7x6qeOr1CX6LpdjrgK7TnbIPiz5tT/mJmVUDw5NKCza7voErIBmxM
	 FUSyWGiABGFHcdrMY6QtkRwWzAT8IgId/KGbQ/YVLj4jppFzCZJLw1Ss0y+Gje8mp8
	 nl7xjg0oFTkLA==
Date: Mon, 25 Aug 2025 13:40:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>, krzk+dt@kernel.org
Cc: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>, marcus@nazgul.ch, 
	kirill@korins.ky, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	andersson@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
Message-ID: <cp33qzgnc5i6e3nratfk7p6rhblltmem6nokk3wls3dtpattvt@cb2rbhbbe4vx>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
 <bc001360-1cfe-4886-a023-367a8edc21c5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc001360-1cfe-4886-a023-367a8edc21c5@quicinc.com>

On Thu, Aug 14, 2025 at 12:50:17PM GMT, Nitin Rawat wrote:
> 
> 
> On 8/14/2025 6:29 AM, Harrison Vanderbyl wrote:
> > Describe device tree entry for x1e80100 ufs device
> > Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 91 ++++++++++++++++++++++++++
> >   1 file changed, 91 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index a9a7bb676c6f..effa776e3dd0 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -2819,6 +2819,97 @@ tsens3: thermal-sensor@c274000 {
> >   			#thermal-sensor-cells = <1>;
> >   		};
> > +
> > +		ufs_mem_hc: ufs@1d84000 {
> > +			compatible = "qcom,x1e80100-ufshc",
> > +			"qcom,ufshc", "jedec,ufs-2.0";

This controller is UFS 3.0 based. Also, JEDEC has two specs for UFS:

1. UFSHCI (Host controllers found in SoCs)
2. UFS (UFS devices)

And this compatible 'jedec,ufs-2.0' is mostly for UFS devices, not Host
controllers. So using we should be using 'jedec,ufshc-3.0' here and in other
bindings.

krzk: Is it OK to change the compatible for all bindings and dts? Atleast linux
is not making use of this compatible, but I'm not sure about other DT users.

> > +			reg = <0 0x01d84000 0 0x3000>;
> > +			
> > +			
> > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			phys = <&ufs_mem_phy>;
> > +			phy-names = "ufsphy";
> > +
> > +			lanes-per-direction = <2>;
> > +
> > +			#reset-cells = <1>;
> > +			resets = <&gcc GCC_UFS_PHY_BCR>;
> > +
> > +			reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> > +			reset-names = "rst";
> > +
> > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > +
> > +			iommus = <&apps_smmu 0x1a0 0x0>;
> > +
> > +			clock-names = "core_clk",
> > +				      "bus_aggr_clk",
> > +				      "iface_clk",
> > +				      "core_clk_unipro",
> > +				      "ref_clk",
> > +				      "tx_lane0_sync_clk",
> > +				      "rx_lane0_sync_clk",
> > +				      "rx_lane1_sync_clk";
> > +
> > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> > +
> > +			freq-table-hz = <100000000 403000000>,
> > +					<0 0>,
> > +					<0 0>,
> > +					<100000000 403000000>,
> > +					<100000000 403000000>,
> > +					<0 0>,
> > +					<0 0>,
> > +					<0 0>;
> > +
> Please use OPP table instead of freq-table-hz.
> 
> 
> > +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> 
> For Config Path, use QCOM_ICC_TAG_ACTIVE_ONLY.
> 
> YOu can refer to ICC discussion link for SM8750 - https://lore.kernel.org/linux-devicetree/354f8710-a5ec-47b5-bcfa-bff75ac3ca71@oss.qualcomm.com/
> 

Nitin, question for you: Is this controller cache coherent as like its ancerstor
sm8550?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

