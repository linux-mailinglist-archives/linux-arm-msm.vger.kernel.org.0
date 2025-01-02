Return-Path: <linux-arm-msm+bounces-43809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249AA00183
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 00:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08B197A1AAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 23:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E861B6CF3;
	Thu,  2 Jan 2025 23:24:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B87EC13D;
	Thu,  2 Jan 2025 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735860254; cv=none; b=XVRGExNphQt4d5oguvfhF4FsUFeOXVqYv7aHlotOiS7wOdorvcOzzB6glhK6kyYmyQgfZEj+7BQitnKdIksBfdVlenfwxD9v5tQY2zL86R5p7fvfDCHDSL+12FfUKDW7Ev+4KF546CTMBbcUeUGw6dOMNh36x7WS2gyYdS4VnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735860254; c=relaxed/simple;
	bh=avrt1v3y88rkmOw+rb92zRpftGeG6Cjs+XOu6XL5mi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkV0pzlXhUZJxEWikf27jIsCL6lyet4GV5TcpJWLuEWP667HFtcXxtDiT9nbYrcvV8uZYEqOoaEWWsXS2WkY03DzyFUpO+YHDoaEAf/c6OXpkG4gTn8kRpwfME9SB+IOCBrwnOI6z5eW0SxnWp6cQKJaQce+R/mONXuQlo++oB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id d13cec59;
	Fri, 3 Jan 2025 00:17:28 +0100 (CET)
Date: Fri, 3 Jan 2025 00:17:28 +0100
From: Marcus Glocker <marcus@nazgul.ch>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Daniel Gomez <d@kruces.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add UFS node
Message-ID: <srqwbf4teujrcvovxglsibvhtq6wpv2ojclf4joc6hwvszhbir@2gxtczxhqlc7>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
 <cd9d5a7c-ec0b-4f0a-bac2-f747799bf295@kernel.org>
 <l5vwputpefdkweti56em37i5asrd3vb7pxhwlzir7webfuk3fl@afcqm3faq2gt>
 <D5I1G5K85QLC.FP6NF7M20KXQ@kruces.com>
 <f5676c71-9e15-4733-aacc-2d194e2567fd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5676c71-9e15-4733-aacc-2d194e2567fd@quicinc.com>

On Thu, Jan 02, 2025 at 01:38:10PM GMT, Wesley Cheng wrote:

> 
> On 11/9/2024 3:31 PM, Daniel Gomez wrote:
> > On Fri Aug 30, 2024 at 7:25 PM CEST, Marcus Glocker wrote:
> >> On Fri, Aug 30, 2024 at 02:05:48AM +0200, Konrad Dybcio wrote:
> >>
> >>> On 17.08.2024 10:38 PM, Marcus Glocker wrote:
> >>>> Add the UFS Host Controller node.  This was basically copied from the
> >>>> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> >>>>
> >>>> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> >>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 72 ++++++++++++++++++++++++++
> >>>>  1 file changed, 72 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi 
> >>>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>> index 7bca5fcd7d52..9f01b3ff3737 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>> @@ -2878,6 +2878,78 @@ mmss_noc: interconnect@1780000 {
> >>>>  			#interconnect-cells = <2>;
> >>>>  		};
> >>>>
> >>>> +		ufs_mem_hc: ufs@1d84000 {
> >>>> +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
> >>>> +				     "jedec,ufs-2.0";
> >>>> +			reg = <0 0x01d84000 0 0x3000>;
> >>>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> >>>> +			phys = <&ufs_mem_phy>;
> >>>> +			phy-names = "ufsphy";
> >>>> +			lanes-per-direction = <1>;
> >>>> +			#reset-cells = <1>;
> >>>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> >>>> +			reset-names = "rst";
> >>>> +
> >>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> >>>> +
> >>>> +			iommus = <&apps_smmu 0xa0 0x0>;
> >>> Looks like this should be 0x1a0 maybe
> >>>> +
> >>>> +			clock-names = "core_clk",
> >>>> +				      "bus_aggr_clk",
> >>>> +				      "iface_clk",
> >>>> +				      "core_clk_unipro",
> >>>> +				      "ref_clk",
> >>>> +				      "tx_lane0_sync_clk",
> >>>> +				      "rx_lane0_sync_clk";
> >>>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> >>>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> >>>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> >>>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> >>>> +				 <&rpmhcc RPMH_CXO_CLK>,
> >>>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> >>>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> >>> You also want
> >>>
> >>> <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>
> >>>
> >>>> +			freq-table-hz = <50000000 200000000>,
> >>> 25000000 300000000
> >>>
> >>>> +					<0 0>,
> >>>> +					<0 0>,
> >>>> +					<37500000 150000000>,
> >>> 75000000 300000000
> >>>
> >>>> +					<0 0>,
> >>>> +					<0 0>,
> >>>> +					<0 0>;
> >>>> +
> >>>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> >>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> >>>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> >>>> +			interconnect-names = "ufs-ddr", "cpu-ufs";
> >>>> +
> >>>> +			qcom,ice = <&ice>;
> >>>> +
> >>>> +			status = "disabled";
> >>>> +		};
> >>>> +
> >>>> +		ufs_mem_phy: phy@1d87000 {
> >>>> +			compatible = "qcom,x1e80100-qmp-ufs-phy";
> >>>> +			reg = <0 0x01d87000 0 0x1000>;
> >>> most definitely should be 0x01d80000 with a size of 0x2000
> >>>
> >>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> >>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> >>>> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
> >>>> +			clock-names = "ref",
> >>>> +				      "ref_aux",
> >>>> +				      "qref";
> >>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> >>>> +			resets = <&ufs_mem_hc 0>;
> >>>> +			reset-names = "ufsphy";
> >>>> +			#phy-cells = <0>;
> >>>> +			status = "disabled";
> >>>> +		};
> >>>> +
> >>>> +		ice: crypto@1d90000 {
> >>>> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> >>>> +				     "qcom,inline-crypto-engine";
> >>>> +			reg = <0 0x01d90000 0 0x8000>;
> >>> 0x1d88000
> >>>
> >>>
> >>> All this combined means you probably wrote your init sequence into some
> >>> free(?) register space and the one left over from the bootloader was
> >>> good enough :P
> >>>
> >>> Konrad
> >> I have not done anything special in our sub-system to boot this DTB.
> >> Changing the values as suggested by you also doesn't make any difference
> >> to me.
> >>
> >> Anyway, I think I'll give up at this point, since this process is
> >> getting too time consuming for me.  We'll go ahead with out downstream
> >> patches, which works for us so far.
> 
> 
> Hi Marcus,
> 
> 
> Do you mind if I take over this series??? I started working on getting at least the UFS and USB portions of the DT file to work on my Samsung Galaxy book4 with your patches, along with some required modifications.?? If you're OK, I'll keep you as the author for the main DT file, and submit my changes on top.
> 
> 
> Thanks
> 
> Wesley Cheng

Hi Wesley,

Perfectly fine for me.  I'm glad if there is progress.

Thanks and Regards,
Marcus

