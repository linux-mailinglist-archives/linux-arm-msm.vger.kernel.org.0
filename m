Return-Path: <linux-arm-msm+bounces-77844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDFBEBF0F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 00:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FEDC6E5DFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C552D94BC;
	Fri, 17 Oct 2025 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1QiSTzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B8E354AC2;
	Fri, 17 Oct 2025 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760741321; cv=none; b=Owx2MqhLMDh1r+M+dCIkBABK36xBdZLavF/2MNDv4WP7lHtl1q8nnjSSHMKsJXDloTtRCD0v2g2aW/Fer1rckO2dEvj7eGYzSFqnH0imlGzCZTygvQfaC7g2HaIOrJbVY81hPu1/GyAFz0r0uhFFvr4AWWkdwp+8qOyahyMTMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760741321; c=relaxed/simple;
	bh=zbmvSr84SjB/AG7+xOYNcFL8wwxEJ7CQL6TjSv0xA9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMtnnqHaeuQKjFXqP4Xz4CWlJ3FrVSLMHmpuFFBIJuanDCCCjR1fKuIE4TN7VnxzZUnE2D1ykAqF6J3Z6A1oh0UE9Jir7f0jyisaNxWRJh032xd1Wqx9uMa/6khfhDpp5J42v8sjKDtDxWDnxqiCMMGPKx3uqOxrdtoMjpCT/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1QiSTzF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C656DC4CEE7;
	Fri, 17 Oct 2025 22:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760741320;
	bh=zbmvSr84SjB/AG7+xOYNcFL8wwxEJ7CQL6TjSv0xA9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1QiSTzFQmEoBk+dzBldRK3Wi5gfJDu/ukdCclu0Sq/Y2r3+WZ6kxpDQfzG48/csg
	 xOpACdxgTxwf4jLa+Ooso4AjpfvZnN31Kfr2VwqBx8TCB4LQlV9cD+O6sO69yv6m6h
	 tZt8deyOBCEmEdOTAwT+N76jZxYZ6Y2ZRhqn4N2QnbrOLK7NF4AualuoXLRbXz8nBg
	 IVL1jVV0V7+ayp6i+9RXxKLnS/ESHepCingKFfk0Z4Bjg/iRywSwGhPb6an73Ofgdh
	 BsE8j9Lj7iL9/sUJuqDJ/5BEAK6x/+PKXSfuknoEV+lA8+vN7pzLIRG3RmeyHERHUD
	 UQqEpzsIUiOVw==
Date: Fri, 17 Oct 2025 15:50:34 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: add DT changes to enable MDSS1
 and DPU
Message-ID: <p2pjxm5tpxcbgweehwqxhvuovff2p3elfm2nbu2pet74lub6wt@hhr4x7v2h6uj>
References: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
 <nnvjazbxpywrmjnt67isba6m3ld6rqdaiid4qeczunmuablntz@vlbrjnxj5r2k>
 <d451f8f0-d2ab-44eb-bfcc-ec1e9dbba060@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d451f8f0-d2ab-44eb-bfcc-ec1e9dbba060@oss.qualcomm.com>

On Fri, Sep 26, 2025 at 02:54:17PM +0530, Mahadevan P wrote:
> 
> On 9/26/2025 3:11 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 02:28:07PM +0530, Mahadevan wrote:
> > > Add devicetree changes to enable second Mobile Display
> > > Subsystem (MDSS1) and its Display Processing Unit(DPU) for
> > > Qualcomm LEMANS platform.
> > No outputs? Should it be enabled on any of the devices?
> 
> Outputs  and enablement are include as part of this series:
> https://lore.kernel.org/all/20250926085956.2346179-1-quic_mkuntuma@quicinc.com/
> I will update the commit message to use the phrase "to support" for better
> clarity.
> 

Have Mani include your patch in his series, with you as author and him
adding his signed-off-by after yours.

That way you're managing the dependency on your side, rather than
relying on others doing that work for you.

Thank you,
Bjorn

> > 
> > > Signed-off-by: Mahadevan <mahadevan.p@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/lemans.dtsi | 88 ++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 88 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > index 48f753002fc459a3e9fac0c0e98cbec6013fea0f..45c11c050d3f8853701fd20cf647aef5c6a9a8c9 100644
> > > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > @@ -6751,6 +6751,94 @@ compute-cb@3 {
> > >   			};
> > >   		};
> > > +		mdss1: display-subsystem@22000000 {
> > Why do you need this label?
> 
> display-controller@22001000 is using mdss1 as interrupt parent.
> 
> > 
> > > +			compatible = "qcom,sa8775p-mdss";
> > > +			reg = <0x0 0x22000000 0x0 0x1000>;
> > > +			reg-names = "mdss";
> > > +
> > > +			/* same path used twice */
> > > +			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > +					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > > +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> > > +			interconnect-names = "mdp0-mem",
> > > +					     "mdp1-mem",
> > > +					     "cpu-cfg";
> > > +
> > > +			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
> > > +
> > > +			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> > > +
> > > +			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > > +				 <&gcc GCC_DISP1_HF_AXI_CLK>,
> > > +				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
> > > +
> > > +			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-controller;
> > > +			#interrupt-cells = <1>;
> > > +
> > > +			iommus = <&apps_smmu 0x1800 0x402>;
> > > +
> > > +			#address-cells = <2>;
> > > +			#size-cells = <2>;
> > > +			ranges;
> > > +
> > > +			status = "disabled";
> > > +
> > > +			mdss1_mdp: display-controller@22001000 {
> > Why do you need this label?
> 
> will remove.
> 
> > 
> > > +				compatible = "qcom,sa8775p-dpu";
> > > +				reg = <0x0 0x22001000 0x0 0x8f000>,
> > > +				      <0x0 0x220b0000 0x0 0x3000>;
> > > +				reg-names = "mdp", "vbif";
> > > +
> > > +				clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
> > > +					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > > +					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> > > +					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
> > > +					 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> > > +				clock-names = "nrt_bus",
> > > +					      "iface",
> > > +					      "lut",
> > > +					      "core",
> > > +					      "vsync";
> > > +
> > > +				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> > > +				assigned-clock-rates = <19200000>;
> > > +
> > > +				operating-points-v2 = <&mdss1_mdp_opp_table>;
> > > +				power-domains = <&rpmhpd SA8775P_MMCX>;
> > > +
> > > +				interrupt-parent = <&mdss1>;
> > > +				interrupts = <0>;
> > > +
> > > +				mdss1_mdp_opp_table: opp-table {
> > > +					compatible = "operating-points-v2";
> > > +
> > > +					opp-375000000 {
> > > +						opp-hz = /bits/ 64 <375000000>;
> > > +						required-opps = <&rpmhpd_opp_svs_l1>;
> > > +					};
> > > +
> > > +					opp-500000000 {
> > > +						opp-hz = /bits/ 64 <500000000>;
> > > +						required-opps = <&rpmhpd_opp_nom>;
> > > +					};
> > > +
> > > +					opp-575000000 {
> > > +						opp-hz = /bits/ 64 <575000000>;
> > > +						required-opps = <&rpmhpd_opp_turbo>;
> > > +					};
> > > +
> > > +					opp-650000000 {
> > > +						opp-hz = /bits/ 64 <650000000>;
> > > +						required-opps = <&rpmhpd_opp_turbo_l1>;
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +
> > >   		dispcc1: clock-controller@22100000 {
> > >   			compatible = "qcom,sa8775p-dispcc1";
> > >   			reg = <0x0 0x22100000 0x0 0x20000>;
> > > 
> > > ---
> > > base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> > > change-id: 20250923-lemans_dual-c03ad5c84a84
> > > 
> > > Best regards,
> > > -- 
> > > Mahadevan <mahadevan.p@oss.qualcomm.com>
> > > 
> Thanks,
> Mahadevan

