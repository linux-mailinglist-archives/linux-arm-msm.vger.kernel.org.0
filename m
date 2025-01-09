Return-Path: <linux-arm-msm+bounces-44537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C01A07225
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E5C77A489D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA088215F73;
	Thu,  9 Jan 2025 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YwyYDwRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604B216388;
	Thu,  9 Jan 2025 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416070; cv=none; b=OIFnNZkzHyb33u4FGKZeHCMfWI5jzCAjlBRmmDCxH2Mm+ZjjE9w2zJjKb7zD3cII5a64oQUvUFMIHGAbYeKR7dCF0aawimE3Vw/H9OlmceTO48qvs+DAGVp06yWYouvcpgcqFFZhqjLyz2LJSffgtssszDmF7Yfcr/k34+B4Fl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416070; c=relaxed/simple;
	bh=zK4v9I3f+UYpZWSLOKpiNuCAvZKtt7CcKQsscyXJbfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OhAi8kKUBvnBlwsJD7Ir7gHU523go0m8c+uYl2oZ4t+RQNcONLdr5aQ97Mu3TbyF6TDB1KdEw0XqrF2rVKr/9tWr5CdkDYswo4dC+udyP2P/K/VKnmPWOFHzMoCAMramtueMnohDHFKrAp0K9EIWHYIE4VSWxUwCuWPizCSgQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YwyYDwRm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096hfOh022354;
	Thu, 9 Jan 2025 09:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nv93r9SftHibZEEuZLNp9EmlUvJ2gisPmBYhHiJXM0U=; b=YwyYDwRmGvTnHqqN
	D6ycftXA9qA/Yl3jtjpUi2TsZItkb2XDOrJBbjmoAgCzELVnkDpE8eHXkx97txZ3
	ECekmwTWmdGLz//9681mlTZ7Kiq/OswSUjTl8iSCpBZ953Jeybqx0UqL/D03zdph
	lWrIwtKg5RnYglBcKJ+PPzT6KVNWSAaYFpP2FK7SAucW7hNGY2FaRcplByaFQ0UW
	FTizizxBxVHLgPDvR82WZwZvEoydJfx5Wn2Ocm8NphhKVBZk5wcTDLa/El+ffk9F
	3VpvTqQHTED6mPeOaZzV4d1dnsZ5UbwLzfvTfbgjyuXSIIYtzqdrVspEtsoFYJno
	4mNxIQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429epgegy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:47:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5099liUm018709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 09:47:44 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 01:47:40 -0800
Message-ID: <07f09c8a-c797-4142-a339-6c0bdff466e7@quicinc.com>
Date: Thu, 9 Jan 2025 17:47:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: add DisplayPort device
 nodes
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
 <3kiih4tfuvr3lgczqnkrropmzs64na7nx37zo7bp3336cz5zje@22nwstjqwrvu>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <3kiih4tfuvr3lgczqnkrropmzs64na7nx37zo7bp3336cz5zje@22nwstjqwrvu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fYNFrn2AbrdfHBGJTt5ZkkHnmJbiAwTX
X-Proofpoint-ORIG-GUID: fYNFrn2AbrdfHBGJTt5ZkkHnmJbiAwTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=848 phishscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090079



On 2025/1/9 7:06, Bjorn Andersson wrote:
> On Wed, Nov 27, 2024 at 06:45:13PM +0800, Yongxing Mou wrote:
>> Add device tree nodes for the DPTX0 controller with their
>> corresponding PHYs found on Qualcomm QCS8300 SoC.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> 
> Please rebase, test and resubmit this together, in the same series, with
> the mdss patch.
> 
> Regards,
> Bjorn
> 
sure. got it. I will integrate the mdss dts change with this and submit 
it together.thanks.
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 115 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 114 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 1642e2863affd5af0b4f68118a47b7a74b76df95..28deba0a389641b4dddbf4505d6f44c6607aa03b 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -987,6 +987,19 @@ mdss_mdp: display-controller@ae01000 {
>>   				interrupt-parent = <&mdss>;
>>   				interrupts = <0>;
>>   
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +
>> +						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&mdss_dp0_in>;
>> +						};
>> +					};
>> +				};
>> +
>>   				mdp_opp_table: opp-table {
>>   					compatible = "operating-points-v2";
>>   
>> @@ -1011,6 +1024,104 @@ opp-650000000 {
>>   					};
>>   				};
>>   			};
>> +
>> +			mdss_dp0_phy: phy@aec2a00 {
>> +				compatible = "qcom,qcs8300-edp-phy";
>> +
>> +				reg = <0x0 0x0aec2a00 0x0 0x200>,
>> +				      <0x0 0x0aec2200 0x0 0xd0>,
>> +				      <0x0 0x0aec2600 0x0 0xd0>,
>> +				      <0x0 0x0aec2000 0x0 0x1c8>;
>> +
>> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
>> +				clock-names = "aux",
>> +					      "cfg_ahb";
>> +
>> +				#clock-cells = <1>;
>> +				#phy-cells = <0>;
>> +
>> +				status = "disabled";
>> +			};
>> +
>> +			mdss_dp0: displayport-controller@af54000 {
>> +				compatible = "qcom,qcs8300-dp";
>> +
>> +				reg = <0x0 0x0af54000 0x0 0x104>,
>> +				      <0x0 0x0af54200 0x0 0x0c0>,
>> +				      <0x0 0x0af55000 0x0 0x770>,
>> +				      <0x0 0x0af56000 0x0 0x09c>;
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <12>;
>> +
>> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +				clock-names = "core_iface",
>> +					      "core_aux",
>> +					      "ctrl_link",
>> +					      "ctrl_link_iface",
>> +					      "stream_pixel";
>> +				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> +						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss_dp0_phy 0>,
>> +							 <&mdss_dp0_phy 1>;
>> +				phys = <&mdss_dp0_phy>;
>> +				phy-names = "dp";
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
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
>> +
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +
>> +						mdss_dp0_out: endpoint { };
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
>>   		dispcc: clock-controller@af00000 {
>> @@ -1020,7 +1131,9 @@ dispcc: clock-controller@af00000 {
>>   				 <&rpmhcc RPMH_CXO_CLK>,
>>   				 <&rpmhcc RPMH_CXO_CLK_A>,
>>   				 <&sleep_clk>,
>> -				 <0>, <0>, <0>, <0>,
>> +				 <&mdss_dp0_phy 0>,
>> +				 <&mdss_dp0_phy 1>,
>> +				 <0>, <0>,
>>   				 <0>, <0>, <0>, <0>;
>>   			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>   			#clock-cells = <1>;
>>
>> -- 
>> 2.34.1
>>


