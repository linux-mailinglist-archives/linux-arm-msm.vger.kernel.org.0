Return-Path: <linux-arm-msm+bounces-33352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C430992974
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C1C51C225F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85A91D174C;
	Mon,  7 Oct 2024 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AGPCYMh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E1B189F45;
	Mon,  7 Oct 2024 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728297979; cv=none; b=MU+rZGIhSmOJx0eoIfgckU9nPh4cRwhMTViDHchDx3wXedPpZG6p69wZz6+jt0PFMZe03zdQJ51ac0AiuocNT0ReqR2KLsXbtUG021ndRhPDDHNtLUV8RcEnI7tPjZVrTZ5fTr10/rUs2Xt2yMWFBoXZAlkM+m/mW9dtO/rWj04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728297979; c=relaxed/simple;
	bh=TYsEkfepbCZdErIu2NfT2dISmUS7pXdEvW/rZUxqYiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LU9tVCutrNzH6vlHuZN3MJ6PZq1EwTQLh6jGKJaw+VGQl4Ft+qeSyZYxgm550CgOwUyBZpo3yBieJfdOjP4tEh0kuYVyJLYRRlu/sfnOmnkM4vgsLo4h1hM5d9QiepiP8ja/OWPr308buF1VQHqzprpH5+CQThxvkrGdROOfRgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AGPCYMh7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974U2WI027767;
	Mon, 7 Oct 2024 10:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbYJ8+FuVIgRJiyjUwsy1Afi5089OjBmCHmQ/ieEfBE=; b=AGPCYMh7QZvoarro
	Ziskqllws3jj6255WOvheUbymxIs6FuQLKidiruJzviNXY7A+1QgpeondV5Umn6Y
	tBuQvDO+kzAbrvzUbRT7cjgtb9WuizFgTIQ+DP+kfRptIGUi11kdN8j8uHsUyCGF
	EGgqy/FHiNa+t0KV7rZEEdi8d1hHYRfot2/6EIWUDqQ6ON6pKszeJYwT79a5qKc3
	GGenseFVOC1XeNXIRajr5qzcs0Ggvp97n0vUauv1IIVB3YWjorBDObG6bX/dwbYo
	S91psZd+lMJvr78jv4cPY8Mcn3oyCZczwJm1oU9+nyniMWTF4ReNzFQSeCk32KDj
	oeKicw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs83sa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 10:46:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497AkCI4007868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 10:46:12 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 03:46:08 -0700
Message-ID: <0311a312-11fe-48a5-86b5-bf3af21e5b7a@quicinc.com>
Date: Mon, 7 Oct 2024 16:16:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: add DisplayPort device node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_abhinavk@quicinc.com>
References: <20240916091344.27607-1-quic_mukhopad@quicinc.com>
 <ivbohyezb57mcqgfnjot3j2olgj4kvyoq2fjstgugscagsmlg7@vav3cbokzg7q>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <ivbohyezb57mcqgfnjot3j2olgj4kvyoq2fjstgugscagsmlg7@vav3cbokzg7q>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V_kdbg6MwQO4ih3cc7m5yHoBueDDb5FE
X-Proofpoint-ORIG-GUID: V_kdbg6MwQO4ih3cc7m5yHoBueDDb5FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070076


On 9/16/2024 7:31 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 16, 2024 at 02:43:44PM GMT, Soutrik Mukhopadhyay wrote:
>> Add device tree node for the DisplayPort controller
>> and eDP PHY found on the Qualcomm SA8775P SoC.
> Not quite. You are also enabling it for the RIDE platforms, not just the
> SA8775p SoC.


Sure , we will update this accordingly in the next version.


>
>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> ---
>> This patch depends on following series:
>> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
>> https://lore.kernel.org/all/20240912071437.1708969-1-quic_mahap@quicinc.com/
>> https://lore.kernel.org/all/20240913103755.7290-1-quic_mukhopad@quicinc.com/
> Also please provide mdss_dp1 device nodes, you have documented them in
> the patch "drm/msm/dp: Add DisplayPort controller for SA8775P"


Sure, we will include both the mdss_dp0 and mdss_dp1 device nodes, as 
per the

documentation, in the next version.


>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  23 +++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 114 ++++++++++++++++++++-
>>   2 files changed, 136 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 0c1b21def4b6..728b4cda8353 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -421,6 +421,23 @@
>>   	status = "okay";
>>   };
>>   
>> +&mdss0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss0_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss0_dp0_out {
>> +	data-lanes = <0 1 2 3>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss0_edp_phy0 {
>> +	status = "okay";
>> +};
>> +
>>   &pmm8654au_0_gpios {
>>   	gpio-line-names = "DS_EN",
>>   			  "POFF_COMPLETE",
>> @@ -527,6 +544,12 @@
>>   };
>>   
>>   &tlmm {
>> +	dp_hot_plug_det: dp-hot-plug-det-state {
>> +		pins = "gpio101";
>> +		function = "edp0_hot";
>> +		bias-disable;
>> +	};
>> +
>>   	ethernet0_default: ethernet0-default-state {
>>   		ethernet0_mdc: ethernet0-mdc-pins {
>>   			pins = "gpio8";
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 7747965e7e46..a04150c29565 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -3339,6 +3339,18 @@
>>   				interrupt-parent = <&mdss0>;
>>   				interrupts = <0>;
>>   
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&mdss0_dp0_in>;
>> +						};
>> +					};
>> +				};
>> +
>>   				mdss0_mdp_opp_table: opp-table {
>>   					compatible = "operating-points-v2";
>>   
>> @@ -3363,6 +3375,106 @@
>>   					};
>>   				};
>>   			};
>> +
>> +			mdss0_edp_phy0: phy@aec2a00 {
>> +				compatible = "qcom,sa8775p-edp-phy";
>> +
>> +				reg = <0x0 0xaec2a00 0x0 0x200>,
>> +					<0x0 0xaec2200 0x0 0xd0>,
>> +					<0x0 0xaec2600 0x0 0xd0>,
>> +					<0x0 0xaec2000 0x0 0x1c8>;
> Please ident on the angle bracket.


Sure, we will update this in the next version.


>
>> +
>> +				clocks = <&rpmhcc RPMH_CXO_CLK>,
> It it really CXO?


Sure, we will address the necessary clock changes for both "aux" and 
"cfg_ahb"

in the next version.


>
>> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
> And this isn't cfg_ahb.
>
>> +				clock-names = "aux",
>> +					      "cfg_ahb";
>> +
>> +				vdda-phy-supply = <&vreg_l1c>;
>> +				vdda-pll-supply = <&vreg_l4a>;
> regulators are not a part of the SoC


Sure, we will move the regulators to a different file where all the 
board specific changes

are a part of, in the next version.


>
>> +				#clock-cells = <1>;
>> +				#phy-cells = <0>;
>> +
>> +				status = "disabled";
>> +			};
>> +
>> +			mdss0_dp0: displayport-controller@af54000 {
>> +				compatible = "qcom,sa8775p-dp";
>> +
>> +				pinctrl-0 = <&dp_hot_plug_det>;
>> +				pinctrl-names = "default";
>> +
>> +				reg = <0x0 0xaf54000 0x0 0x104>,
>> +					<0x0 0xaf54200 0x0 0x0c0>,
>> +					<0x0 0xaf55000 0x0 0x770>,
>> +					<0x0 0xaf56000 0x0 0x09c>;
> Wrong indentation.


Sure, we will update with the correct indentation at all places in the 
next version.


>
>> +
>> +				interrupt-parent = <&mdss0>;
>> +				interrupts = <12>;
>> +
>> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +				clock-names = "core_iface",
>> +						"core_aux",
>> +						"ctrl_link",
>> +						"ctrl_link_iface",
>> +						"stream_pixel";
> And here.
>
>> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_edp_phy0 0>, <&mdss0_edp_phy0 1>;
>> +				phys = <&mdss0_edp_phy0>;
>> +				phy-names = "dp";
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +				power-domains = <&rpmhpd SA8775P_MMCX>;
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss0_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss0_dp0_out: endpoint { };
>> +					};
>> +				};
>> +
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-810000000 {
>> +						opp-hz = /bits/ 64 <810000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +				};
>> +			};
>>   		};
>>   
>>   		dispcc0: clock-controller@af00000 {
>> @@ -3372,7 +3484,7 @@
>>   				 <&rpmhcc RPMH_CXO_CLK>,
>>   				 <&rpmhcc RPMH_CXO_CLK_A>,
>>   				 <&sleep_clk>,
>> -				 <0>, <0>, <0>, <0>,
>> +				 <&mdss0_edp_phy0 0>, <&mdss0_edp_phy0 1>, <0>, <0>,
>>   				 <0>, <0>, <0>, <0>;
>>   			power-domains = <&rpmhpd SA8775P_MMCX>;
>>   			#clock-cells = <1>;
>> -- 
>> 2.17.1
>>

