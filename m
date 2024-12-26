Return-Path: <linux-arm-msm+bounces-43344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE50A9FC958
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 08:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D63B77A10C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 07:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D0714C5AF;
	Thu, 26 Dec 2024 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OkIrhE/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC2323D;
	Thu, 26 Dec 2024 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735196644; cv=none; b=cRBPH1sPpyiRdW+KnDR0wx+YbtDyZss/OmN/ZW8ZLBMFt14GRfGrLq3NAd4WXI+f/2NS/qvWNmTryGA+tqeb0chGkqEs1EKl90vIA822PmIrMVSQS+QxXTYe95KU02+UWxqfiu4nKHaAjIzGaRs3nrtZwGub/2DE8tDFrT7FE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735196644; c=relaxed/simple;
	bh=4qBsYZTbb5L1Ba70vpfCTNMU3ePLtKmRITS6cosgflw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TO63ahDoWd1WOflzQIoT0JalUI4PzE46gCZV458KEQoPfFaBXPfGpyxhQhT82j+tA7JVx+MlFIEyxAs9JiwqOcxBldLfKQPQgamgV0M687wFO3S0qqn3p7SM14ZDHuFNcwNOZxtvmiP1G0wVDZ9IGuEmlgEx9z7kjYz3OV+zqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OkIrhE/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ4F2Np009333;
	Thu, 26 Dec 2024 07:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4y+xljEVuwnt7yPLqBqJaw0ak4PI3Vu0cCD7TVMNFI=; b=OkIrhE/TKtJEykbW
	oqSYTW4WNF7eqWSdK1qX3qBbpCtaueaBim521Y1FPS2YmKKnXGsuJQuZnLCT9lhS
	g0+sEGQiGgiVNUh/gOfwuspqmyTl90WcnN4NomcOxIamc9shK+ZyHlSOrEWuYQ7d
	6SrbUqvaQyoB+H7PGnYY52nWT0yCuq2bBISGbW+Te5y4ndeoENR+8btOnPRt+r+F
	j+s4K34APmiVsMIrJI+2jfxrK/md8mKbCYBESBGFxhSqtsIKqUkMLC9wSpeVzopa
	o5NnrF0Yu+fFjiYXsyjzgvjtrIQO3EWTY5uXaM20fOIVmzl5s8bUMm1S4e5OiNRB
	vHa1xA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rffxkgg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 07:03:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ73qRC031975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 07:03:52 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 23:03:48 -0800
Message-ID: <d536bbf0-4e8a-424b-b885-a22870bfbf31@quicinc.com>
Date: Thu, 26 Dec 2024 15:03:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: add DisplayPort device
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
 <45643708-c138-4c77-85ce-fa7d49f2aa72@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <45643708-c138-4c77-85ce-fa7d49f2aa72@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: as4tHQ6aPrFQkrMedIIvBkKDuTbEFXZm
X-Proofpoint-GUID: as4tHQ6aPrFQkrMedIIvBkKDuTbEFXZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=858 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260061



On 2024/12/6 5:36, Konrad Dybcio wrote:
> On 27.11.2024 11:45 AM, Yongxing Mou wrote:
>> Add device tree nodes for the DPTX0 controller with their
>> corresponding PHYs found on Qualcomm QCS8300 SoC.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
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
> 
> 0x19c
> 
got it.thanks.
>> +				      <0x0 0x0aec2200 0x0 0xd0>,
> 
> 0xec
got it.thanks.
>> +				      <0x0 0x0aec2600 0x0 0xd0>,
> 
> 0xec
> 
> For lengths
got it.thanks.
> 
>> +				      <0x0 0x0aec2000 0x0 0x1c8>;
> 
> This one's correct
> 
>> +
>> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
>> +				clock-names = "aux",
>> +					      "cfg_ahb";
> 
> power-domains = <&rpmhpd RPMHPD_MX>;
> 
emm,we use RPMHPD_MMCX in qcs8300 mdss and dpu..
> (or maybe even MXC?)
> 
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
> 0x200
> 
got it. thanks.
>> +				      <0x0 0x0af54200 0x0 0x0c0>,
> 0x200
> 
got it. thanks.
>> +				      <0x0 0x0af55000 0x0 0x770>,
> 0xc00
> 
got it. thanks.
>> +				      <0x0 0x0af56000 0x0 0x09c>;
> 0x400
> 
will modify all the length in patch v2.
> for lengths
> 
> Konrad


