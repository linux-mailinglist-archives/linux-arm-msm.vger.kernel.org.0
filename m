Return-Path: <linux-arm-msm+bounces-46839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C482A26A90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 04:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6E73A325C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 03:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D241552FA;
	Tue,  4 Feb 2025 03:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WLi4VETt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3425A642;
	Tue,  4 Feb 2025 03:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639344; cv=none; b=gJXcCKjr4dNw85ERYjMA/dB9sKi+u/rYTEwzOjYoglZ4wXpSVCX6NRIYcd+fM94/fkySwDNdm9Yr4jzozvCTmIxu1Oc09Jgwkfvy54qcZEVg+HgKfwJDUH2TfIyMDmGiBC44sTO8qx796oUr+bOSqLwrT4HtRzrkQP58i9Mj5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639344; c=relaxed/simple;
	bh=nCXAnrUP9N8+x3kpeBz5EX2rRV2CFmekJYL7ldnnfkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MdC+ohixFrjJFTrCaVXpk6lI33NKeGSAIvblukYoZnSXMVM7B0oqc+DK/f758gDdyZCfnqkPUtYywgdJhGX15cOIhWEYJBYi34R25FRKi0BN0oQVg+/Z99y1OrAnin00fYZf5TSa9Pp2KbgQf6OvdE5XZzvtcXg3vBAmmU0TAO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WLi4VETt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GFHMu011894;
	Tue, 4 Feb 2025 03:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAqS3bI/nZNWijByPRTKJVUN97hHHkCl5lQJzeIb+ao=; b=WLi4VETtAWct4DCY
	e0865jVE7ezCdHQKwZTkQKcc71eTsKLHt98yk01nMYHfw/ZZRvZPx4x35nigG5yE
	RK0KDwJwiMmj8RgwX7zGNYfvvpxH9D3lHv5QxwnfKi/fZGUuP//1SbKl3io/3y7P
	FFUz+oaAQ1xmSxprk1p9ghQQ7MUwy/kgMUl0qID4b9lonDyuCLTw5Ti2UHHMY8+U
	fzF1ljB0hIK9kwtQB3TkLV36axTj88YGg5jnAUSRh0BiCUsMb0/p744Y+FhVvHhr
	o5YyUeSOlhCareh7abe0rt46/+FPLdhnR/uGV6GdDSqAKUTVyzaUZ7ouTltNT+jU
	btYM2w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k159h94t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 03:22:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5143M0SN003203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 03:22:00 GMT
Received: from [10.110.45.144] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 19:21:59 -0800
Message-ID: <4a18ddb1-a7f4-41ae-b115-516b1710cbde@quicinc.com>
Date: Mon, 3 Feb 2025 19:21:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add USB support to SM8750
 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
 <lk26ltslmijj7tj2kst2wsvd6d2hyj3zjzcwavwl63evjhcgdh@ewqliiijispu>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <lk26ltslmijj7tj2kst2wsvd6d2hyj3zjzcwavwl63evjhcgdh@ewqliiijispu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Zy9C0otC3fT2aMT_4_uaNVuK6dCyJmDa
X-Proofpoint-ORIG-GUID: Zy9C0otC3fT2aMT_4_uaNVuK6dCyJmDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040024


On 1/14/2025 2:38 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:52:13PM -0800, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
>> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  24 ++++++
>>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  24 ++++++
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 134 ++++++++++++++++++++++++++++++++
> Separate SoC and board patches.
>
>>  3 files changed, 182 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..059eccbbc3fb05fc8806e36d35dc469d44443a26 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -792,3 +792,27 @@ &tlmm {
>>  &uart7 {
>>  	status = "okay";
>>  };
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&vreg_l2d_0p88>;
>> +	vdda12-supply = <&vreg_l3g_1p2>;
>> +
>> +	phys = <&pmih0108_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3g_1p2>;
>> +	vdda-pll-supply = <&vreg_l2d_0p88>;
>> +
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> index f77efab0aef9bab751a947173bcdcc27df7295a8..01c0af643626917614fbd68cf8962ef947ca6548 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> @@ -790,3 +790,27 @@ &tlmm {
>>  &uart7 {
>>  	status = "okay";
>>  };
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&vreg_l2d_0p88>;
>> +	vdda12-supply = <&vreg_l3g_1p2>;
>> +
>> +	phys = <&pmih0108_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3g_1p2>;
>> +	vdda-pll-supply = <&vreg_l2d_0p88>;
>> +
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..54522fd3d0e11c3cff02beaf1d249fe654cacc0f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -10,6 +10,7 @@
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> @@ -1966,6 +1967,139 @@ lpass_lpicx_noc: interconnect@7420000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		usb_1_hsphy: phy@88e3000 {
>> +			compatible = "qcom,sm8750-m31-eusb2-phy";
>> +			reg = <0x0 0x88e3000 0x0 0x29c>;
>> +
>> +			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
>> +			clock-names = "ref";
>> +
>> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		usb_dp_qmpphy: phy@88e8000 {
>> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
>> +			reg = <0x0 0x088e8000 0x0 0x3000>;
>> +
>> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "ref",
>> +				      "com_aux",
>> +				      "usb3_pipe";
>> +
>> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
>> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
>> +			reset-names = "phy",
>> +				      "common";
>> +
>> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <1>;
> Missing orientation-switch and ports{} description.

At least for this initial submission/series, we haven't yet defined the PMIC GLINK connections yet, so does it make sense to include these now?  Basically, even if we define that connection, since I'm not aware if the enablement of PMIC GLINK has been added, it would be nil, as it would be the one responsible for registering the type C port. 

>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		usb_1: usb@a6f8800 {
>> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
>> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
>> +			status = "disabled";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
>> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
>> +			clock-names = "cfg_noc",
>> +				      "core",
>> +				      "iface",
>> +				      "sleep",
>> +				      "mock_utmi",
>> +				      "xo";
>> +
>> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>> +			assigned-clock-rates = <19200000>, <200000000>;
>> +
>> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
>> +						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
>> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
>> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "pwr_event",
>> +					  "hs_phy_irq",
>> +					  "dp_hs_phy_irq",
>> +					  "dm_hs_phy_irq",
>> +					  "ss_phy_irq";
>> +
>> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +
>> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
>> +
>> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
>> +			interconnect-names = "usb-ddr", "apps-usb";
>> +
>> +			usb_1_dwc3: usb@a600000 {
>> +				compatible = "snps,dwc3";
>> +				reg = <0x0 0x0a600000 0x0 0xe000>;
>> +
>> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +				iommus = <&apps_smmu 0x40 0x0>;
>> +
>> +				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
>> +				phy-names = "usb2-phy", "usb3-phy";
>> +
>> +				snps,hird-threshold = /bits/ 8 <0x0>;
>> +				snps,usb2-gadget-lpm-disable;
>> +				snps,dis_u2_susphy_quirk;
>> +				snps,dis_enblslpm_quirk;
>> +				snps,dis-u1-entry-quirk;
>> +				snps,dis-u2-entry-quirk;
>> +				snps,is-utmi-l1-suspend;
>> +				snps,usb3_lpm_capable;
>> +				snps,usb2-lpm-disable;
>> +				snps,has-lpm-erratum;
>> +				tx-fifo-resize;
>> +
>> +				dr_mode = "peripheral";
> This goes to the board files.
>
>> +
>> +				dma-coherent;
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +
>> +						usb_1_dwc3_hs: endpoint {
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +
>> +						usb_1_dwc3_ss: endpoint {
> QMP endpoint.

Same as above comment.

Thanks

Wesley Cheng


