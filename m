Return-Path: <linux-arm-msm+bounces-28625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF21952DC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE1B285C46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 11:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C7A1714AA;
	Thu, 15 Aug 2024 11:54:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0911AC896;
	Thu, 15 Aug 2024 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723722847; cv=none; b=k7vJ73zGdw+fQxdVJZaiPrsXbwgIb24/rLSGs35KMYdEwMKra63e+pmFPsJfIXE8pbB1syRPoQkX8yL13AiXywEPdhiX6lzwNPLA41ZwBi3Nh2smujKdhzxZb/9+k2WUl7AlFj1rW8G9C+YMsqIpv1bMEVtG/3UQWxQf8jSv5HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723722847; c=relaxed/simple;
	bh=7qso/k3Qb44LCExlp+KrrvaSwPBgT4jahUU2JMlnE7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHgoGKpEegoOTwzmUbPvQlBS7dZ1EZoUpf8s0cA65DTYWkAoOLvAQfGHz3gTepfAOcmbVmin23vtLQMQZ2Uhgjof8P3e/8fD62IjbO888BJJh8amVljmI1R7jbg1cERXZIejOtdreFRYTsrfQS3Y9QfEtlCxopz1MRuAGNAe/rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 39366c8a;
	Thu, 15 Aug 2024 13:54:01 +0200 (CEST)
Date: Thu, 15 Aug 2024 13:54:01 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: Add UFS node
Message-ID: <kt5mrxse7dirsjgu3ldv4rzasgbmykluul7ie26zlavhlmfz4r@bo4fd4ybt7bx>
References: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
 <ejeph4wspggkmvhl7qmpvw5jlojyvma7epqd67i6vk5p6fncrk@de56nvgi6vzi>
 <Zr3cuxv4EdxMQa9C@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr3cuxv4EdxMQa9C@linaro.org>

On Thu, Aug 15, 2024 at 01:47:23PM +0300, Abel Vesa wrote:

> On 24-08-15 12:42:29, Marcus Glocker wrote:
> > Add the UFS Host Controller node.  This was basically copied from the
> > arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> > 
> > Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 71 ++++++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 7bca5fcd7d52..235e20e4b51f 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -2878,6 +2878,77 @@ mmss_noc: interconnect@1780000 {
> >  			#interconnect-cells = <2>;
> >  		};
> >  
> > +		ufs_mem_hc: ufs@1d84000 {
> > +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
> > +				     "jedec,ufs-2.0";
> > +			reg = <0 0x01d84000 0 0x3000>;
> > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> > +			phys = <&ufs_mem_phy>;
> > +			phy-names = "ufsphy";
> > +			lanes-per-direction = <1>;
> > +			#reset-cells = <1>;
> > +			resets = <&gcc GCC_UFS_PHY_BCR>;
> > +			reset-names = "rst";
> > +
> > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > +
> > +			iommus = <&apps_smmu 0xa0 0x0>;
> > +
> > +			clock-names = "core_clk",
> > +				      "bus_aggr_clk",
> > +				      "iface_clk",
> > +				      "core_clk_unipro",
> > +				      "ref_clk",
> > +				      "tx_lane0_sync_clk",
> > +				      "rx_lane0_sync_clk";
> > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> > +			freq-table-hz = <50000000 200000000>,
> > +					<0 0>,
> > +					<0 0>,
> > +					<37500000 150000000>,
> > +					<0 0>,
> > +					<0 0>,
> > +					<0 0>;
> > +
> > +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> > +			interconnect-names = "ufs-ddr", "cpu-ufs";
> > +
> > +			qcom,ice = <&ice>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		ufs_mem_phy: phy@1d87000 {
> > +			compatible = "qcom,x1e80100-qmp-ufs-phy";
> 
> Can't find any phy patch that adds this compatible to the driver.

That might well be, since this is pretty new hardware.  But the goal
of this submission is only to describe the hardware, not to add
immediate support to the OS drivers.  Whether the drivers will make use
of it, is a different story, and up to the people who maintain the
respective drivers.

Getting the right DTB in, at least opens the possibility to continue
development in the driver area to further support this new hardware.

But I won't touch your drivers, not my goal.

> > +			reg = <0 0x01d87000 0 0x1000>;
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> > +			clock-names = "ref",
> > +				      "ref_aux",
> > +				      "qref";
> > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > +			resets = <&ufs_mem_hc 0>;
> > +			reset-names = "ufsphy";
> > +			#phy-cells = <0>;
> > +			status = "disabled";
> > +		};
> > +
> > +		ice: crypto@1d90000 {
> > +			compatible = "qcom,x1e80100-inline-crypto-engine",
> > +				     "qcom,inline-crypto-engine";
> > +			reg = <0 0x01d90000 0 0x8000>;
> > +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> > +		};
> > +
> >  		pcie6a: pci@1bf8000 {
> >  			device_type = "pci";
> >  			compatible = "qcom,pcie-x1e80100";
> > -- 
> > 2.39.2
> > 

