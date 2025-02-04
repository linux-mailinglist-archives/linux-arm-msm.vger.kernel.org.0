Return-Path: <linux-arm-msm+bounces-46875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A583A275A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 16:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEADB18802CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66845214208;
	Tue,  4 Feb 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eW7ZgJ6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBCF213E84
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682371; cv=none; b=QVQGGVnIdjHMn30qJNGHB337IKRybXE84XvVbUqWnDr2BmuHv3Cb4m2rBRxX9FepKOgqhEdKlDLXTrGDfWp6z6IXrgImDHiZokzo/Zj3Xg3oNjJZGqt/E4FLGwzknJgp2mK8PSZt72K/6eu1bPLVEWxoHKJIgvdKBe5tcNztyEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682371; c=relaxed/simple;
	bh=NbSqlF/6R91OVHOYruWqHeNzoGj0pygDRXAJ6C41ebk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeJenrc3Rwl9IczVD4YD+ib4rA0FxWxKR8AXOS0BfIBjw8aY/rsnXb/57kBjFRpY9dQi81M9dg1JOhLJ+gJqHaHqgt9PPvYqVdKc6FBrOWlcUlg34OWZvOfB78WLPr5hVSjkvMC6GL8/3FEFTAgKgGWTh/A96XoOTUMTpH9leiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eW7ZgJ6B; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6832so6258698e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 07:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738682367; x=1739287167; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptWJ7zdNtWBMDj+P9H5d/yhoNBNJZeSvROVnxn8+Cy0=;
        b=eW7ZgJ6BAdvmWHdhDY2kxifplNZx985Q8//FVAJulrtLi/v4ypJ69iaryJ/eiH5oox
         Fnxh4aFXmOSK80+lmhndN+M9U4kw8tpktzQCqa++iLE/Vc2NwQSMUlORYUoY8nfHtE0s
         2nny+0YiL9/uf03RSysovFhDFaVHB7cf/3D1Fs5h3Ss4zpvkODdpcUA5wqorBqsxSrKg
         0YT5+8p71XamPtllwsHhbLLNPt+/VaswUukGj74BliTzkK9zwHry4fASyd+s5XMKJhLL
         3WKZSz6TSDzKrOtnCPdhzVTmgdloiwJHn4xWdR6vT+NgYYdknaFyoexXWWjO98fLm2bO
         m42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682367; x=1739287167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptWJ7zdNtWBMDj+P9H5d/yhoNBNJZeSvROVnxn8+Cy0=;
        b=KzkYgyuS8dYw6+UIbRWtXzQtBa3FeOw23dN1vd3lAcW/oO7mKZF+AVuveBMBBBxXDB
         yBPq6h/fCmQkbgBN7Vn+OdRYIc/CLfHOTIPFOYMMzMeXUttwwcp12k2dkzs0W+CCvHml
         pDxp0HVSpMcNfbO9ET9HanB12IZcWI4s3EiiahCOEvU8x8w/v42PsTBZ+EFofMARztsS
         rGUVFpZTgAg2cO3mTnLddwMzydUdOl8PsEKQenpib6CJWHpgQSmN6QFL3LMZl/sfyEyj
         AHrLLywotZvPMma7++g2rcieKJBqcgNW3vkaEajuD5VKGdzPWrpAput23q4q3Uok+wLv
         paxw==
X-Forwarded-Encrypted: i=1; AJvYcCWAl745PbTO9nsjz2XJjxqleHEjryiENwitVJbDJiksVZEVWjVhVPv2K9vGoTZ+VNumNqowKkEodf9FKf53@vger.kernel.org
X-Gm-Message-State: AOJu0YzuP/urLnpBHJsMgaNgzb1ZLDQcgvymjMXIgY7BKMktK5xofNLZ
	TjIa5mNNju9sRV0+TCMhu6H/qRKzWp46Ny8SkLZXYxyd35nenTjGkMT7oIRyKBI=
X-Gm-Gg: ASbGncujdkMT8yNG9QwwxiFhRaYNh2L+H5HHFrGXQYTMiJr+z7CktdNe2hITy/O5ueo
	XXrcxakmYoBrsvmKIz5weTAIP8megnx+1svslXymZWPebZMt6NjhhO2VWVBuX3Ly26o/hqna3he
	XQ5aSFHTe3X8TZzAgGV7V6d+NDgLD/iQ0GG4eMqrZF4ap7+Qufzy11CW0YKOhCPxMS2dfcQZo7M
	T313XijW+i4QXm31MwqqJ+Pb6Ry8nEzopcS5nBUDiOjNqc3ihLBtjWJh9D/Krx3SfYIdTm/JD8a
	lrboOe/0uU6T/wFzIR2rbH4IFiy31iLmJtw4G4rTHA6ULJmK7gQmGbC35ilzcBrLar+MiZY=
X-Google-Smtp-Source: AGHT+IE2qVzH17AZUiAiSfRIP9fn/n6qJoeyUN6d/KnBt+D7ZA4ynyd5JH2BepJz0FL+EGOxxpTguA==
X-Received: by 2002:a19:ee07:0:b0:540:206b:c355 with SMTP id 2adb3069b0e04-543e4beaca5mr6791855e87.19.1738682367068;
        Tue, 04 Feb 2025 07:19:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0b40sm1604056e87.112.2025.02.04.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:19:26 -0800 (PST)
Date: Tue, 4 Feb 2025 17:19:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add USB support to SM8750
 platforms
Message-ID: <flwitkfqnrrz7kq7qwzxfjauxvysegpxhxtftofalfmgdde57t@cwtoj3s2676z>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
 <lk26ltslmijj7tj2kst2wsvd6d2hyj3zjzcwavwl63evjhcgdh@ewqliiijispu>
 <4a18ddb1-a7f4-41ae-b115-516b1710cbde@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a18ddb1-a7f4-41ae-b115-516b1710cbde@quicinc.com>

On Mon, Feb 03, 2025 at 07:21:52PM -0800, Wesley Cheng wrote:
> 
> On 1/14/2025 2:38 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:13PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> >> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  24 ++++++
> >>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  24 ++++++
> >>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 134 ++++++++++++++++++++++++++++++++
> > Separate SoC and board patches.
> >
> >>  3 files changed, 182 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..059eccbbc3fb05fc8806e36d35dc469d44443a26 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> @@ -792,3 +792,27 @@ &tlmm {
> >>  &uart7 {
> >>  	status = "okay";
> >>  };
> >> +
> >> +&usb_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +	dr_mode = "peripheral";
> >> +};
> >> +
> >> +&usb_1_hsphy {
> >> +	vdd-supply = <&vreg_l2d_0p88>;
> >> +	vdda12-supply = <&vreg_l3g_1p2>;
> >> +
> >> +	phys = <&pmih0108_eusb2_repeater>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_dp_qmpphy {
> >> +	vdda-phy-supply = <&vreg_l3g_1p2>;
> >> +	vdda-pll-supply = <&vreg_l2d_0p88>;
> >> +
> >> +	status = "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> >> index f77efab0aef9bab751a947173bcdcc27df7295a8..01c0af643626917614fbd68cf8962ef947ca6548 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> >> @@ -790,3 +790,27 @@ &tlmm {
> >>  &uart7 {
> >>  	status = "okay";
> >>  };
> >> +
> >> +&usb_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +	dr_mode = "peripheral";
> >> +};
> >> +
> >> +&usb_1_hsphy {
> >> +	vdd-supply = <&vreg_l2d_0p88>;
> >> +	vdda12-supply = <&vreg_l3g_1p2>;
> >> +
> >> +	phys = <&pmih0108_eusb2_repeater>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_dp_qmpphy {
> >> +	vdda-phy-supply = <&vreg_l3g_1p2>;
> >> +	vdda-pll-supply = <&vreg_l2d_0p88>;
> >> +
> >> +	status = "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..54522fd3d0e11c3cff02beaf1d249fe654cacc0f 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> @@ -10,6 +10,7 @@
> >>  #include <dt-bindings/interconnect/qcom,icc.h>
> >>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> >>  #include <dt-bindings/power/qcom,rpmhpd.h>
> >>  #include <dt-bindings/power/qcom-rpmpd.h>
> >>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >> @@ -1966,6 +1967,139 @@ lpass_lpicx_noc: interconnect@7420000 {
> >>  			#interconnect-cells = <2>;
> >>  		};
> >>  
> >> +		usb_1_hsphy: phy@88e3000 {
> >> +			compatible = "qcom,sm8750-m31-eusb2-phy";
> >> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> >> +
> >> +			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> >> +			clock-names = "ref";
> >> +
> >> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> >> +
> >> +			#phy-cells = <0>;
> >> +
> >> +			status = "disabled";
> >> +		};
> >> +
> >> +		usb_dp_qmpphy: phy@88e8000 {
> >> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> >> +			reg = <0x0 0x088e8000 0x0 0x3000>;
> >> +
> >> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> >> +				 <&rpmhcc RPMH_CXO_CLK>,
> >> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> >> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> >> +			clock-names = "aux",
> >> +				      "ref",
> >> +				      "com_aux",
> >> +				      "usb3_pipe";
> >> +
> >> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> >> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> >> +			reset-names = "phy",
> >> +				      "common";
> >> +
> >> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> >> +
> >> +			#clock-cells = <1>;
> >> +			#phy-cells = <1>;
> > Missing orientation-switch and ports{} description.
> 
> At least for this initial submission/series, we haven't yet defined the PMIC GLINK connections yet, so does it make sense to include these now?  Basically, even if we define that connection, since I'm not aware if the enablement of PMIC GLINK has been added, it would be nil, as it would be the one responsible for registering the type C port. 

Note, I haven't said anything about PMIC GLINK. The QMP is still an
orientation-switch, no matter if there is a PMIC GLINK, native TCPM
implementation or any other external Type-C controller. Likewise the QMP
still has 3 ports, one going to DP, one going to USB3 controller and the
last one being empty.

Also, please wrap your comments, it's hard to read them otherwise. The
recommended width is 72-75 chars.

> 
> >> +
> >> +			status = "disabled";
> >> +		};
> >> +
> >> +		usb_1: usb@a6f8800 {
> >> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> >> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> >> +			status = "disabled";
> >> +			#address-cells = <2>;
> >> +			#size-cells = <2>;
> >> +			ranges;
> >> +
> >> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> >> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> >> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> >> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> >> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> >> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
> >> +			clock-names = "cfg_noc",
> >> +				      "core",
> >> +				      "iface",
> >> +				      "sleep",
> >> +				      "mock_utmi",
> >> +				      "xo";
> >> +
> >> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> >> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> >> +			assigned-clock-rates = <19200000>, <200000000>;
> >> +
> >> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> >> +						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> >> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> >> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> >> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "pwr_event",
> >> +					  "hs_phy_irq",
> >> +					  "dp_hs_phy_irq",
> >> +					  "dm_hs_phy_irq",
> >> +					  "ss_phy_irq";
> >> +
> >> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> >> +			required-opps = <&rpmhpd_opp_nom>;
> >> +
> >> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> >> +
> >> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
> >> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
> >> +			interconnect-names = "usb-ddr", "apps-usb";
> >> +
> >> +			usb_1_dwc3: usb@a600000 {
> >> +				compatible = "snps,dwc3";
> >> +				reg = <0x0 0x0a600000 0x0 0xe000>;
> >> +
> >> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> >> +
> >> +				iommus = <&apps_smmu 0x40 0x0>;
> >> +
> >> +				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> >> +				phy-names = "usb2-phy", "usb3-phy";
> >> +
> >> +				snps,hird-threshold = /bits/ 8 <0x0>;
> >> +				snps,usb2-gadget-lpm-disable;
> >> +				snps,dis_u2_susphy_quirk;
> >> +				snps,dis_enblslpm_quirk;
> >> +				snps,dis-u1-entry-quirk;
> >> +				snps,dis-u2-entry-quirk;
> >> +				snps,is-utmi-l1-suspend;
> >> +				snps,usb3_lpm_capable;
> >> +				snps,usb2-lpm-disable;
> >> +				snps,has-lpm-erratum;
> >> +				tx-fifo-resize;
> >> +
> >> +				dr_mode = "peripheral";
> > This goes to the board files.
> >
> >> +
> >> +				dma-coherent;
> >> +
> >> +				ports {
> >> +					#address-cells = <1>;
> >> +					#size-cells = <0>;
> >> +
> >> +					port@0 {
> >> +						reg = <0>;
> >> +
> >> +						usb_1_dwc3_hs: endpoint {
> >> +						};
> >> +					};
> >> +
> >> +					port@1 {
> >> +						reg = <1>;
> >> +
> >> +						usb_1_dwc3_ss: endpoint {
> > QMP endpoint.
> 
> Same as above comment.

It is independent of Type-C integration, so it should be linked to the
QMP PHY.

> 
> Thanks
> 
> Wesley Cheng
> 

-- 
With best wishes
Dmitry

