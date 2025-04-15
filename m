Return-Path: <linux-arm-msm+bounces-54295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F3A892B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 06:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F076B1898F57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 04:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77531188A0C;
	Tue, 15 Apr 2025 04:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kyJ4FqAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F212DFA5B;
	Tue, 15 Apr 2025 04:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744689926; cv=none; b=uE/tXPN71vETBhxSGorRa6zTMwmnZIBxNnrD9AQ/ljp9gbG5Z7PSwp+Cj6NFkmiF7jDi1QknX26p6BO3IFhMZjGzLISemFzXces+vARkT8zVGZ3/T7O9hG1B/cemfJBQMt4yaJyU5sx11SVrdrZ5vo/L2rqqvvk2RvMLvIonsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744689926; c=relaxed/simple;
	bh=5onrEStEUDN1ilDvDavwzaUS7EYoBW9R6M/pH0wIpFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=byzYWUw99xTYXPt0SkYbXcGg/teOAynPVBdiuON1eY/ZYZQc+8SQL3IlgV5FCm8Cp+5Ft7qlJO76Dd/4qbwQXE9UL2+38Bb/NwDL8zvWc0iHaUwZp4R04r9BrqzSz8ctZj9jfqaJ8xJ3ds8RMoNQHl3lniIeJUairp6EuUD9TyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kyJ4FqAx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15qKk016117;
	Tue, 15 Apr 2025 04:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Z/ubR0bHVlEbalLwcZhfcjQS1Ooe1tunvKxpZnMAE0=; b=kyJ4FqAxG0wxTqIZ
	+RRcGPR4dcthiw6HhEIaZ58fyuN+1AQkzp0JaGFboD9TpJYz1bURj+pWg+rK9B0N
	FZw9xv1dfTD54a0iIVk2ZKVRqOQtBQO1TfBasjEqLaG6DAMmY51wlw+DDPTnojUI
	zq72wrXwWLkFE75QIjpFBCk0OHeGQc3EL+4Go9ec8YG6Nhc3gmrYJMK8m6uH1Wpf
	+WZA/OFsxgKGq0A4yxNgA13+KuiDraNH7vXI1bbJR7t9FsjiwPdFb85gGuQHsc4x
	Guky79WjFYh18FX66O53j8iovFDmny3SWNH8Ct2ResxpHCTIV4stLQrO5YSOmiZC
	O2VLgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcxfwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:05:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F45FUG018011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:05:15 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 21:05:10 -0700
Message-ID: <0db798bf-04b3-40b5-af90-7dda5b606727@quicinc.com>
Date: Tue, 15 Apr 2025 09:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
 <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
 <9eb6dfd7-2716-4150-9392-98e26892d82d@quicinc.com>
 <e3dda8bf-e19e-4dde-83a4-7876ca81e5e6@oss.qualcomm.com>
 <69fba227-ed47-4004-9451-777ca19b687f@quicinc.com>
 <cfa4003c-e8b0-40f6-821d-07f8d44752af@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <cfa4003c-e8b0-40f6-821d-07f8d44752af@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fddafb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8
 a=hCl-885K2BfM0JJyIxAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: _tEFsNCWhbbuowJCJmuc1XYFWd2n2vik
X-Proofpoint-ORIG-GUID: _tEFsNCWhbbuowJCJmuc1XYFWd2n2vik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150024



On 4/12/2025 12:56 AM, Konrad Dybcio wrote:
> On 4/11/25 1:37 PM, Jagadeesh Kona wrote:
>>
>>
>> On 4/11/2025 2:42 PM, Konrad Dybcio wrote:
>>> On 4/11/25 9:15 AM, Jagadeesh Kona wrote:
>>>>
>>>>
>>>> On 4/1/2025 10:03 PM, Konrad Dybcio wrote:
>>>>> On 3/24/25 9:41 AM, Luca Weiss wrote:
>>>>>> Add a node for the videocc found on the SM6350 SoC.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>>>>  1 file changed, 14 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>>> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>>>>  			};
>>>>>>  		};
>>>>>>  
>>>>>> +		videocc: clock-controller@aaf0000 {
>>>>>> +			compatible = "qcom,sm6350-videocc";
>>>>>> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>>>>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>>>> +				 <&sleep_clk>;
>>>>>> +			clock-names = "iface",
>>>>>> +				      "bi_tcxo",
>>>>>> +				      "sleep_clk";
>>>>>> +			#clock-cells = <1>;
>>>>>> +			#reset-cells = <1>;
>>>>>> +			#power-domain-cells = <1>;
>>>>>> +		};
>>>>>
>>>>> You'll probably want to hook up some additional power domains here, see
>>>>>
>>>>> https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com/
>>>>>
>>>>
>>>> On SM6350, videocc doesn't need multiple power domains at HW level, it is only on CX rail which would be ON
>>>> when system is active, hence power-domains are not mandatory here.
>>>
>>> 6350 doesn't have either MMCX nor a split MX - shouldn't both normal
>>> CX and MX be in there?
>>>
>>
>> All clocks & GDSC's of SM6350 videocc are only on CX rail, so it requires only CX power domain. But when HLOS
>> is active, CX rail will be ON and operate at a level above retention, which is sufficient for videocc to operate.
>> Hence clock driver don't need to explicitly vote on CX rail.
>>
>> The same is not true for other rails like MMCX and Split MX(MXC), hence clock drivers had to explicitly vote on
>> those rails.
> 
> I'm worried about MX being undervolted for higher OPPs
> 

From a videocc PoV there is no requirement of Mx on SM6350. The CX
levels would be taken care by Video SW driver from their defined OPP. Mx
at system level would be catered via the BW votes.

> Konrad


