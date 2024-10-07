Return-Path: <linux-arm-msm+bounces-33354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385A0992A0B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53CB28285D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 11:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B5B1D1E64;
	Mon,  7 Oct 2024 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wdq3JO2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81B62AD05;
	Mon,  7 Oct 2024 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728299451; cv=none; b=lkxrl435PYadM6Drs4Cn0baFbf9wflo3ZWvGTlqwsk5ykaoQHxfk40c0osDczTbxjLnbpG9NeYHLRYM4xFan+hUE89PqzmOwSjJIVA2phqfweNUvqPbU6G+lLlGdjD4Z2T9iyfa9AV97FedSTfx4hA4AuwqcBKZO4a5l8fp1nT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728299451; c=relaxed/simple;
	bh=DPw/i0fQU/HCtCgevxtbq1DqCidN2VAZSI9MfLpetCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PyzAUMyTFUxTtMJ39i6hd8FXBb6hRVQNUo41ylZnyqx7cIFolKV9yDKtxcqDeI4zsySNgqBzAvaz3TDKesXtswfhFg5Cs9XbP45VgIG3CFpUGQyr0/CbFrmCzP2fdpUuAHUPn69Qt1c4VLC2D18WdpmQNsOfoM+CNBRrtBmpRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wdq3JO2Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974U2YH001579;
	Mon, 7 Oct 2024 11:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4sc+jBbySbohD4ebG15LOw3R2QgYKqut6vBxb4LWBA=; b=Wdq3JO2YvFGz0yai
	J8KZmW+sVFe3KXHyEwZDwCN/ziVfoebj91x2yjkQMvQJAMhRSBpYUNb8i2u2wVsr
	v6APP78fB82nVYUeuBYmDrqJC6smRWw7/jxzNBHS/wLr09Kz5Y2/PMYl59rAnlMT
	LD3dQ2e5Q+2dr3C/Mol5+H36NHsBZas+UKd2Pm0ARqIxMh7sbL5ltJht1A02HrVs
	+DOtRB0xVxRFqYNz1APdyXMG9iQsR3FqrkkHLzPCRY4UYbYvjIfHEsi8Od0y7Fq/
	pZM75UGh3VtRFUUE0pI3/20G0d9L99qWbVpqscElR6jYvysk4EoT0QVQW+/S3rMP
	P37AmA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8btcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 11:10:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497BAhFX010705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 11:10:43 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 04:10:39 -0700
Message-ID: <d5919434-3ee6-4b79-8912-7749119e69c0@quicinc.com>
Date: Mon, 7 Oct 2024 16:40:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: add DisplayPort device node
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_riteshk@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_abhinavk@quicinc.com>
References: <20240916091344.27607-1-quic_mukhopad@quicinc.com>
 <cofwijgk2dgg5i5xhvhq3exug4o77mttmozw5amtc3myn4zzq5@m5x44hswwsmt>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <cofwijgk2dgg5i5xhvhq3exug4o77mttmozw5amtc3myn4zzq5@m5x44hswwsmt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: smLrojDkRxyeb6VG8YSKG-CTmJfEbyzy
X-Proofpoint-GUID: smLrojDkRxyeb6VG8YSKG-CTmJfEbyzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070079


On 9/17/2024 12:59 PM, Bjorn Andersson wrote:
> On Mon, Sep 16, 2024 at 02:43:44PM GMT, Soutrik Mukhopadhyay wrote:
>> Add device tree node for the DisplayPort controller
>> and eDP PHY found on the Qualcomm SA8775P SoC.
>>
> Please split this in a change for the platform (.dtsi) which defines
> _all_ the DPTX and DP PHYs, and then a ride dts change which enables all
> the ports available on the Ride.
>
> If there are platform ports that are not accessible on any hardware,
> state in the commit message which ones you tested and which ones you
> didn't test.


Sure, we will be splitting the change for platform, consisting of all 
the DPTX and DP PHY

definitions and a ride dts, for enabling the ports available, in two 
different patches with updated

commit messages, in the next version.


>
>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> ---
>> This patch depends on following series:
>> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
>> https://lore.kernel.org/all/20240912071437.1708969-1-quic_mahap@quicinc.com/
>> https://lore.kernel.org/all/20240913103755.7290-1-quic_mukhopad@quicinc.com/
> Please hold off resubmitting this series until there's conclusion on
> these dependencies.
>
>>   
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
> Is this really a eDP PHY, not a DP/eDP combo phy?
>
> I would prefer that we keep the label prefix "mdssM_dpN" on the DP TX
> and DP PHY nodes, to keep them neatly sorted in the dts. (If you name
> half mdssM_edp_phyN and half mdssM_dp_phyN we're going to have a mess)


Can we use the following naming conventions for clarity :

mdssM_dpN_phy to refer to any DP PHY nodes and mdssM_dpN to refer to DP 
TX nodes.

For example, the phy being used by dp0 on mdss0 can be referred by 
mdss0_dp0_phy,

whereas the phy being used by dp1 on mdss0 can be referred by 
mdss0_dp1_phy.


>
>> +
>> +				reg = <0x0 0xaec2a00 0x0 0x200>,
>> +					<0x0 0xaec2200 0x0 0xd0>,
>> +					<0x0 0xaec2600 0x0 0xd0>,
>> +					<0x0 0xaec2000 0x0 0x1c8>;
>> +
>> +				clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
>> +				clock-names = "aux",
>> +					      "cfg_ahb";
>> +
>> +				vdda-phy-supply = <&vreg_l1c>;
>> +				vdda-pll-supply = <&vreg_l4a>;
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
> Don't make references from .dtsi to labels defined in .dts.
>
> Regards,
> Bjorn


Sure, we will make the necessary changes in the next version.


>
>> +				pinctrl-names = "default";
>> +
>> +				reg = <0x0 0xaf54000 0x0 0x104>,
>> +					<0x0 0xaf54200 0x0 0x0c0>,
>> +					<0x0 0xaf55000 0x0 0x770>,
>> +					<0x0 0xaf56000 0x0 0x09c>;
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

