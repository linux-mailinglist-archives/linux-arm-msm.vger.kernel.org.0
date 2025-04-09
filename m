Return-Path: <linux-arm-msm+bounces-53603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA6A81C94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 08:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077921BA3095
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 06:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105D11DE3BE;
	Wed,  9 Apr 2025 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NZTRWDOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5F1DE2CD;
	Wed,  9 Apr 2025 06:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178693; cv=none; b=Qj4XvB2EiwHDALIYmU+ajFq3TSesCkYdo80d9pcXT2BZbRZP7UssqTEGlrJgxGD7AHBhTVMEQMMTmUT0IZlWjPz2qelxjRqZdpz9dzd6Rfx01apcilX/XWDVJX1vnK7Aq6JQ+j6qXZrcpdi7akpiqNzqXtvDAS1NfCAxp5A8mls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178693; c=relaxed/simple;
	bh=Codyw5YmlkC3fudw3hQz5TkETEuZ/SQCmbMdWllAKPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gf3Ep8A0wBShwv2g/P47N4Oy7pIRerw5zCs2NELqHvGagwQmXEZkrvQ8eC9YclExI//eDIlQieykKmpZAsNfbXhnodFby4KqC0hKQEL+YGG9AdCMun3WKrkY84YvqOLarGp9njXv2P7DEPCeW8nVp+K89CxEqX7+3g8+pvd/2KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NZTRWDOS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYxq4014992;
	Wed, 9 Apr 2025 06:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BkldHSIz3yucMyfesi8ioIl7DTyzVa1CkcAw4nPS2I=; b=NZTRWDOSiCH83HHy
	eMI6Y6sMN5BEnPDYYTRe+6Ikx3gD2nXK7UuEgLs+aKvVykyMKWKk1DV3a+h0E+Pb
	5zgc2LwrOG9rjG8ZiguUIwbTBUo/JJGrZkRK1x4IGYGSnKTWYaYXJrz4SGqGKeU8
	O5gH9izMUs2f/+G55o4YsaLU/Ln8NrpoUTeBnf8K2eKNiWWBwCoFdXuLjIeRfV7Y
	b7wEs9MsId7RbatLWQpGL6gjFTdadk5TG1tpNq+ON8cQzcCwhnrvcF2rX3IpW/v7
	QSzR0icTlW5FZxJYI5mKhKe9D/GYvjh/noW/NvMSEm7icSVhPC+OOboubqCAx/on
	uloXyg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuj9va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:04:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53964mLe004200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 06:04:48 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 23:04:44 -0700
Message-ID: <1445a751-b629-4647-ad69-a1efbb471c21@quicinc.com>
Date: Wed, 9 Apr 2025 11:34:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>,
        <quic_srichara@quicinc.com>
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
 <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
 <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
 <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
 <769be701-afd1-4c14-8e44-fbb25a0c3f24@quicinc.com>
 <3831073d-fcc4-46a5-bdb7-ec19702a08be@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <3831073d-fcc4-46a5-bdb7-ec19702a08be@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eIypSpRtmKuTuVVCRs6B5odrFDj9ja1m
X-Proofpoint-ORIG-GUID: eIypSpRtmKuTuVVCRs6B5odrFDj9ja1m
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f60e01 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0PegrSc1pu9fmHWOW4kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=772 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090021



On 4/8/2025 7:00 PM, Dmitry Baryshkov wrote:
> On 08/04/2025 15:49, Manikanta Mylavarapu wrote:
>>
>>
>> On 4/3/2025 3:02 PM, Dmitry Baryshkov wrote:
>>> On Thu, 3 Apr 2025 at 08:08, Manikanta Mylavarapu
>>> <quic_mmanikan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
>>>>>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>>>>>
>>>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>>>> ---
>>>>>> Changes in V6:
>>>>>>       - No change.
>>>>>>
>>>>>>   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>>>>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>>> index 0fd0ebe0251d..1f89530cb035 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>>> @@ -82,6 +82,32 @@ &dwc_1 {
>>>>>>       dr_mode = "host";
>>>>>>   };
>>>>>>
>>>>>> +&pcie2 {
>>>>>> +    pinctrl-0 = <&pcie2_default_state>;
>>>>>> +    pinctrl-names = "default";
>>>>>> +
>>>>>> +    perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>>>>>
>>>>>
>>>>> No wake-gpios? Please document it in the commit message.
>>>>>
>>>>
>>>> Hi Dmitry,
>>>>
>>>> Thank you for reviewing the patch.
>>>>
>>>> The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
>>>> I will document this information in the commit message and post the next version.
>>>
>>> If the GPIO is routed on the PCB I think it should still be described in the DT.
>>>
>>>
>>
>> Hi Dmitry,
>>
>>     I have confirmed with the hardware team that the wake GPIO is not routed on the PCB.
> 
> Sad. Please mention it in the commit message.
> 

Okay, sure.

Thanks & Regards,
Manikanta.

