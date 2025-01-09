Return-Path: <linux-arm-msm+bounces-44536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FB4A071E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345EC167CC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B64E215F4A;
	Thu,  9 Jan 2025 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qx4vbTQK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6F2594BA;
	Thu,  9 Jan 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415843; cv=none; b=US/J5OrRebEnRg+DSwMGpAVLj7Jx0JBtQF48jziGVB/esCOQMOblaStwESWitc6MVX07bJjVbhcm8QPdGxK8l8NyrGCmIeo6VgUUiJjcvUpdvSVgGBIUI/CPYgwjBh8IjXftk7R3/vjc2ZxNCvQlPh9N+qwF9uxYRgOxEq/gOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415843; c=relaxed/simple;
	bh=nsQyhGoaQLXw2qSVb//aqPbyuDOfD11N3n4PJju0rfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lRntAh2CwbWN/NCwZoFiJ8NbSAHMpIpwa3dCWnj3yuCJYW8YqV5o2kl9x/CBgNHGiJ/XXB115EXGmC7HmgKBy0DMV8gAG7lnLO23jxjIThbQATbT6ehvZjeEzahlR6t0rHT0Uuv8/7uPqpWe/hodEBQ0ODdTfud53+oI5sNI41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qx4vbTQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096hdpb022335;
	Thu, 9 Jan 2025 09:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z94bWyW9CvPwiZS3eqs9OEzmqL01I+uvzlcVZnz4Ia8=; b=Qx4vbTQKsVfVGPUv
	xbMshr5spy8devzEicFJPyzAclNOsafV++igMZG2HsiO2hotv9dOG1uaPyA//9GR
	kOwPBOTQGnPBPmZTz+vg+3YHEg6eSL5PEaPRk6W2ytkpiIJxV7YKpVKT858KxFAc
	xORZRRQQnp+V+XSMycIKRC5OzDALqpkwPtaIL4U2qIEReRqWSInLR2nG5q6vIjq1
	xqxbxKDB1ATeS5TE88hPM9L0jrZrAK+tB557ppFCs6QPjuIleLnP0I4SpwzzCb6C
	UVm4ADPNDrdWb2Gyj5Ngz4eUOy++uZtFDhlnITLNNhFvjJLaqJ4Eafo6dYxawj5I
	1u2xng==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429epge60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:43:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5099hvKg012875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 09:43:57 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 01:43:53 -0800
Message-ID: <7585ba2b-589c-4f85-98cd-76a989b537d7@quicinc.com>
Date: Thu, 9 Jan 2025 17:43:51 +0800
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
 <d536bbf0-4e8a-424b-b885-a22870bfbf31@quicinc.com>
 <71c6609e-e853-4680-939e-f3c9ec15233e@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <71c6609e-e853-4680-939e-f3c9ec15233e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L5PQXoebQu0nL2a5ghQQs3UGSjnCBkBF
X-Proofpoint-ORIG-GUID: L5PQXoebQu0nL2a5ghQQs3UGSjnCBkBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=886 phishscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090078



On 2024/12/30 21:27, Konrad Dybcio wrote:
> On 26.12.2024 8:03 AM, Yongxing Mou wrote:
>>
>>
>> On 2024/12/6 5:36, Konrad Dybcio wrote:
>>> On 27.11.2024 11:45 AM, Yongxing Mou wrote:
>>>> Add device tree nodes for the DPTX0 controller with their
>>>> corresponding PHYs found on Qualcomm QCS8300 SoC.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
> 
> [...]
> 
>>>> +            mdss_dp0_phy: phy@aec2a00 {
>>>> +                compatible = "qcom,qcs8300-edp-phy";
>>>> +
>>>> +                reg = <0x0 0x0aec2a00 0x0 0x200>,
>>>
>>> 0x19c
>>>
>> got it.thanks.
>>>> +                      <0x0 0x0aec2200 0x0 0xd0>,
>>>
>>> 0xec
>> got it.thanks.
>>>> +                      <0x0 0x0aec2600 0x0 0xd0>,
>>>
>>> 0xec
>>>
>>> For lengths
>> got it.thanks.
>>>
>>>> +                      <0x0 0x0aec2000 0x0 0x1c8>;
>>>
>>> This one's correct
>>>
>>>> +
>>>> +                clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>>> +                     <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
>>>> +                clock-names = "aux",
>>>> +                          "cfg_ahb";
>>>
>>> power-domains = <&rpmhpd RPMHPD_MX>;
>>>
>> emm,we use RPMHPD_MMCX in qcs8300 mdss and dpu..
>>> (or maybe even MXC?)
> 
> Please verify what backs the PHY and update accordingly
> 
> Konrad

Thank you for the reminder. it should use RPMHPD_MX.My previous 
understanding that using MMCX was incorrect.





