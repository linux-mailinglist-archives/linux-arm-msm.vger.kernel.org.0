Return-Path: <linux-arm-msm+bounces-35825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9A9AFD25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97997285CA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF851D4604;
	Fri, 25 Oct 2024 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PafydGFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D941D3654;
	Fri, 25 Oct 2024 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846198; cv=none; b=HjMOQeaHdl8yPq+bSF9yHhHMo8SFFIH5gY7LjAoEfELmtmsBwgbYMxOSjkluC8EPbiuGCtjkGcR3ClCKQHO0vFIFBiI9vdvyZpbasL+w4fWVtv0qa6CXxV743/TJEakCsfyW1qeUwesaF20ssa8T4Q4ebTrzw6lpeMOSKXB/YuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846198; c=relaxed/simple;
	bh=KLWsmyUHLH+2dGzb4aPydzisVeloXAQNY8qiiEdLCFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YvFGt1O/nJbXzTh9mhqXgWtlVRbdTSKJCNS6MZX08qWJcaBqd0lGi1NiaboxDoCL1iNgkM2Bb57CWnbxS09OKu7iyK2WgIR2/BEf6hwRkcuubd5QfEeZCHTMDl294WfDNUNTEjjrs3u7QBhXCuZrZ4f1IxcEsDzuvAhpvM7jZqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PafydGFW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OM1hHM016692;
	Fri, 25 Oct 2024 08:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Emno/2I/l0IzFWF2K304eS8BLKckkToED8YDgtnv20M=; b=PafydGFWEJU80/1X
	7qfNBLHYOVnByBDljBubkRVkJhV3/Wuvnh5R6ZGmj8zqzatP4Hr3GHDT0jpn2u/a
	dVwVmDxrbuzPR2j66rsjY6X5xm5rAY0kNOOYq5b9nW5UQTAhjK/3npRh6qCt3Ws3
	jq12KuNs4DtyDdDDRm1o8138b9cilJCZiy84W+ylD0jSymLnH7QdIE6qfLGnJ7UJ
	JBDcN2bkASgxuQvWiy18Lhm71ONwYoNTcsB6t1CHKSAENwZVzD9X/VPL2d2unysN
	UB4iaGIPNACKamrdgvcErDE0SGILHwRgUj47cNS+R5vkx7gsoAdfnsH1GV8JLDmy
	smO2qg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xravt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:49:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P8npn7000994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:49:51 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 01:49:47 -0700
Message-ID: <09ef69ee-e437-43bc-a262-3e009003d916@quicinc.com>
Date: Fri, 25 Oct 2024 14:19:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] arm64: dts: qcom: Add support for multimedia clock
 controllers
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
 <20241011-sa8775p-mm-v4-resend-patches-v5-8-4a9f17dc683a@quicinc.com>
 <m26rnkivudsbvhb3ocofizwpoq3erndnt6jdhrwa6kurxjkr3d@mrocbpeniuqk>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <m26rnkivudsbvhb3ocofizwpoq3erndnt6jdhrwa6kurxjkr3d@mrocbpeniuqk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q8F4QPBmdyDruS2xXxG0uwxLn12u3AG-
X-Proofpoint-ORIG-GUID: Q8F4QPBmdyDruS2xXxG0uwxLn12u3AG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250067



On 10/23/2024 4:03 AM, Bjorn Andersson wrote:
> On Fri, Oct 11, 2024 at 12:28:38AM GMT, Taniya Das wrote:
>> Add support for video, camera, display0 and display1 clock
>> controllers on SA8775P platform.
>>
> 
> Patch subject doesn't match expectations and for some reason commit
> message is wrapped at 60 characters. Please fix.
> 
> Also please mention why dispcc1 is disabled (I'm not questioning the
> fact that it is, I just want you to document your decision)
> 

Will fix in the next series of the patch.

> Regards,
> Bjorn
> 
>> Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 57 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index e8dbc8d820a64f45c62edebca7ce4583a5c716e0..e56a725128e5ec228133a1b008ac2114a4682bef 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -3254,6 +3254,47 @@ llcc: system-cache-controller@9200000 {
>>   			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>   		};
>>   
>> +		videocc: clock-controller@abf0000 {
>> +			compatible = "qcom,sa8775p-videocc";
>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,sa8775p-camcc";
>> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		dispcc0: clock-controller@af00000 {
>> +			compatible = "qcom,sa8775p-dispcc0";
>> +			reg = <0x0 0x0af00000 0x0 0x20000>;
>> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>,
>> +				 <0>, <0>, <0>, <0>,
>> +				 <0>, <0>, <0>, <0>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>>   		pdc: interrupt-controller@b220000 {
>>   			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
>>   			reg = <0x0 0x0b220000 0x0 0x30000>,
>> @@ -3876,6 +3917,22 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>   			};
>>   		};
>>   
>> +		dispcc1: clock-controller@22100000 {
>> +			compatible = "qcom,sa8775p-dispcc1";
>> +			reg = <0x0 0x22100000 0x0 0x20000>;
>> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>,
>> +				 <0>, <0>, <0>, <0>,
>> +				 <0>, <0>, <0>, <0>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +			status = "disabled";
>> +		};
>> +
>>   		ethernet1: ethernet@23000000 {
>>   			compatible = "qcom,sa8775p-ethqos";
>>   			reg = <0x0 0x23000000 0x0 0x10000>,
>>
>> -- 
>> 2.45.2
>>

-- 
Thanks & Regards,
Taniya Das.

