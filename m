Return-Path: <linux-arm-msm+bounces-28651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697E9538AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A844CB22A26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 16:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DD31BA88F;
	Thu, 15 Aug 2024 16:59:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6322A8D0;
	Thu, 15 Aug 2024 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723741173; cv=none; b=G8Xp5ITPxQ/iS2qyGAzFRmdJ46lYDqWuQ8lhLzISyOlpdBFUXWwL1ulC5zEu6qIddm0OL/Yqbv9BNea/2l+jk+LG+rifQKUOm/ZdXblrPovnBtH9nw0mxI5NNl/VrFhsZPPLLhc3/CHAqQt3ynmqIwRC33AfZeOMKlr9TNiafQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723741173; c=relaxed/simple;
	bh=on6i+i2WSTP0p94a05unth8gSFCNITMCJ7fy8bQbogg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTyOiJWQNJr5Ey3mO6e49IiPNlPLbAkHiP2RHb4Th5+2Eg57JzDYWB/eFhRvMmcEfcq7fGcTYUW/6GZ3m2Dn4ilhsboHdmFezeIt5y8fuyoIEcn7r2ThXIWZQXofM/9Jmi6qXYerBQLu2mInUXYZRbSvhGt4G9475HAKdXRb1C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 27f318bc;
	Thu, 15 Aug 2024 18:59:25 +0200 (CEST)
Date: Thu, 15 Aug 2024 18:59:25 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: Add UFS node
Message-ID: <zyhqlafrhfytjfcwf6jmhc233sikezskls54sgfchfvylqt5gj@fklz4yyrhobo>
References: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
 <ejeph4wspggkmvhl7qmpvw5jlojyvma7epqd67i6vk5p6fncrk@de56nvgi6vzi>
 <Zr3cuxv4EdxMQa9C@linaro.org>
 <kt5mrxse7dirsjgu3ldv4rzasgbmykluul7ie26zlavhlmfz4r@bo4fd4ybt7bx>
 <Zr4AHoPpAXJM6AC+@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr4AHoPpAXJM6AC+@linaro.org>

On Thu, Aug 15, 2024 at 04:18:22PM +0300, Abel Vesa wrote:

> On 24-08-15 13:54:01, Marcus Glocker wrote:
> > On Thu, Aug 15, 2024 at 01:47:23PM +0300, Abel Vesa wrote:
> > 
> > > On 24-08-15 12:42:29, Marcus Glocker wrote:
> > > > Add the UFS Host Controller node.  This was basically copied from the
> > > > arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> > > > 
> > > > Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 71 ++++++++++++++++++++++++++
> > > >  1 file changed, 71 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > index 7bca5fcd7d52..235e20e4b51f 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > @@ -2878,6 +2878,77 @@ mmss_noc: interconnect@1780000 {
> > > >  			#interconnect-cells = <2>;
> > > >  		};
> > > >  
> > > > +		ufs_mem_hc: ufs@1d84000 {
> > > > +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
> > > > +				     "jedec,ufs-2.0";
> > > > +			reg = <0 0x01d84000 0 0x3000>;
> > > > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			phys = <&ufs_mem_phy>;
> > > > +			phy-names = "ufsphy";
> > > > +			lanes-per-direction = <1>;
> > > > +			#reset-cells = <1>;
> > > > +			resets = <&gcc GCC_UFS_PHY_BCR>;
> > > > +			reset-names = "rst";
> > > > +
> > > > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > > > +
> > > > +			iommus = <&apps_smmu 0xa0 0x0>;
> > > > +
> > > > +			clock-names = "core_clk",
> > > > +				      "bus_aggr_clk",
> > > > +				      "iface_clk",
> > > > +				      "core_clk_unipro",
> > > > +				      "ref_clk",
> > > > +				      "tx_lane0_sync_clk",
> > > > +				      "rx_lane0_sync_clk";
> > > > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > > > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > > > +				 <&rpmhcc RPMH_CXO_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> > > > +			freq-table-hz = <50000000 200000000>,
> > > > +					<0 0>,
> > > > +					<0 0>,
> > > > +					<37500000 150000000>,
> > > > +					<0 0>,
> > > > +					<0 0>,
> > > > +					<0 0>;
> > > > +
> > > > +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> > > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > > > +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> > > > +			interconnect-names = "ufs-ddr", "cpu-ufs";
> > > > +
> > > > +			qcom,ice = <&ice>;
> > > > +
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > > +		ufs_mem_phy: phy@1d87000 {
> > > > +			compatible = "qcom,x1e80100-qmp-ufs-phy";
> > > 
> > > Can't find any phy patch that adds this compatible to the driver.
> > 
> > That might well be, since this is pretty new hardware.  But the goal
> > of this submission is only to describe the hardware, not to add
> > immediate support to the OS drivers.  Whether the drivers will make use
> > of it, is a different story, and up to the people who maintain the
> > respective drivers.
> > 
> > Getting the right DTB in, at least opens the possibility to continue
> > development in the driver area to further support this new hardware.
> > 
> > But I won't touch your drivers, not my goal.
> 
> Presumably, you do have the UFS working on your Book4 laptop, right?

That's right, but ...
 
> If so, I would expect you do have the PHY working as well and therefore
> a patch that adds the X Elite compatible, right?

... I'm not using Linux on that laptop but OpenBSD.  Hence, my UFS
driver patch will be useless for you.  If one of your developers gets
his hand on that laptop, enabling UFS based on that DTB should be
fairly straight forward.

The reason why we are interested to get new DTS' in your tree, is
because we're using the Linux DTS tree as a base, and then patch over
it as of our requirements.  The less patches we need to apply, the
easier the maintenance is.

> > > > +			reg = <0 0x01d87000 0 0x1000>;
> > > > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> > > > +			clock-names = "ref",
> > > > +				      "ref_aux",
> > > > +				      "qref";
> > > > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > > > +			resets = <&ufs_mem_hc 0>;
> > > > +			reset-names = "ufsphy";
> > > > +			#phy-cells = <0>;
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > > +		ice: crypto@1d90000 {
> > > > +			compatible = "qcom,x1e80100-inline-crypto-engine",
> > > > +				     "qcom,inline-crypto-engine";
> > > > +			reg = <0 0x01d90000 0 0x8000>;
> > > > +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> > > > +		};
> > > > +
> > > >  		pcie6a: pci@1bf8000 {
> > > >  			device_type = "pci";
> > > >  			compatible = "qcom,pcie-x1e80100";
> > > > -- 
> > > > 2.39.2
> > > > 

