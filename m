Return-Path: <linux-arm-msm+bounces-53544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E0A80C52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 364A77B93F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6661EA65;
	Tue,  8 Apr 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3L3W2OO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFFB86358
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119051; cv=none; b=TpekuyXfAFWAlP+yk32jiGzYMWvB+GYTFahxzpQ5mYt4ufH4CeuweNIWLUcTGTeMahZll43PJDwJJ3VQwtpaee/V2k39ull5wgG/aEbROLKzvmjNpvuZVcDwWOHKXEdKUVi/9fCaQ84loAYjHqEghX7sDjwHNRWoLHZ8TQARBWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119051; c=relaxed/simple;
	bh=wbXIV8fD5EsgsdW9CNBtdLwY/+j7rS217N7ZSoYjoQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpUnVgcvBvChBA3iKorrE2cYG4Xfu5jqEYPiR+f8KNV7tZZ5qQcwe5J1UfVxfOyaPv38Co23VeXD6gdEcrZLLCjx+Bgvuw6+JbWiXm2AObydmCO4gD/d4g/FBOjSObZ0DVSDSYltE+mJyxz8NQLF0amOSdJr5hifqHJgrqWQJFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3L3W2OO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BgwnU014104
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 13:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nja2Tn/hbf3f+kd28RTjUYmIevE/H1W2OAgxtQp+p7M=; b=S3L3W2OOUUyW00bZ
	Nzbzrk3MBXFvNF5Zk5rcD8GJWasFlTywL2YOLrQaeACw1b+9uAngLF0ZNhVrVyQj
	6bd+1Dke3kdf4f7tppnvCpuY1aEZY7U0rA1P7IyeDd++4VPGNzLJynU6KvreHfDr
	27TpF+3Mhcn8eorLN3NZPyKv+ApMtUczA4sJi04WuBowb1Eoxa/sLBhmpDdOqgra
	5ZCk5vta36r+q04M406KfJwQNdJj66xpogSdkvE5ulZlEHU3W3AgM/W9AwL155Mp
	BDjQEgIWIQnUD+LB8SQrTgCCnXijhWLMKm4G/I7MXCyznj6skKRH0Q2IAinmIdMK
	ioXn4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm7um7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 13:30:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54767e507so933990185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 06:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119047; x=1744723847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nja2Tn/hbf3f+kd28RTjUYmIevE/H1W2OAgxtQp+p7M=;
        b=wUnQKvYISusEG0+rJbQmbVl5o3pYiupxlg5jPytZCkPGr9adR9LRHrji9EkdOTLzWA
         /9pw8ytoC85+30hsWGRRIB3XcQkdQKx6ySMxOzoryq+bWltsD0ghN0G80VoQCLJyyOWQ
         axofaQRrVBMKTCAbYgrxnyjwgn/9FmJpw+tvFrKp/IbvXsf1aKP9PN5B3uDoqwCOCycx
         OReH1xhD5jUUQt8wr51YP2j15bdHRqeR1bgoRl8la3fgidlbQ7T7DujFMvdMcGmMXUoZ
         LugZLMCFkOFVwEEytvIq0GhkT61Eu1q7y9LCrLuXNHnCFu+lGfRnW4NeGE/uFZgSYfOu
         RbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRhZNJm6bEjsKrJ9DBql0ItmFhVnn/OZ9N4Qga2d9qm4sHj6Wme3gd7DVyid3qw7d1c52A03mmvgnQVNh3@vger.kernel.org
X-Gm-Message-State: AOJu0YyBhQMBs/D2cX0rzh+YJBxdIJgpNkLZntq+lnKDkydtahrfT3Go
	C8B7fLHlptso5pHAhr0DFc0dJysWFtnq/0tfoBNdpjm0S0dQvnu4cUrN9XeOmfYuFsOVMTqyyoj
	3HeeLR4UK+FsBhjPIDzRl1+P2hBHyeeXTrxcqd90IaTCRBbmDmt0nXS7AsedCvSuq
X-Gm-Gg: ASbGncvISch3XngA0I4byFXzV9vF82/80g5497KYiZ8IVdFmB4Styx0GBc7hYv5fqVx
	h4aGZ6txCRpKp428Y/IiYgmRPwltDOCbQHUBEBfS9fbrqpEPIZ5silQ8H39YWgYfDBkcKbO0OR3
	uVM849gQGHAQA/peJ0PkyhBddRs8BznI+0fsbQvBstZVEDrl8c1NINMoRoQlrWnFttCsu1Kh22/
	l8mezVn/CZ5hYK3X/FQN39zdZzPUr8UzDK1rU++nbzXYZXf7EV8ibvLrOD+Bvq1xPDocdoNxJD0
	3u35GozGpCpq7aMsJKZHSZBdIEOv803fB+z1+dIw3IWriR3dcZJSX9Dp3ka7bNeeVi2d0PFkH3+
	Kaptgjn14CnCyV1COcqeWW9f4bv8GO+6Ybx2/c07s7StO9nM1Cck47LpJp0wMDikPlbUc88zr
X-Received: by 2002:a05:620a:438d:b0:7c5:9a4f:adf0 with SMTP id af79cd13be357-7c775a3a31bmr2266252585a.33.1744119047446;
        Tue, 08 Apr 2025 06:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbMmp3CfVKfd6hjxj4wFX4JzUWBBnXDkMhXPHpNvTKDffs5k7umGwLhGsCMYlEiCZzHxRmIQ==
X-Received: by 2002:a05:620a:438d:b0:7c5:9a4f:adf0 with SMTP id af79cd13be357-7c775a3a31bmr2266248085a.33.1744119047104;
        Tue, 08 Apr 2025 06:30:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:67f:3161:8c52:493e:b4d8:ba34? (2001-14bb-67f-3161-8c52-493e-b4d8-ba34.rev.dnainternet.fi. [2001:14bb:67f:3161:8c52:493e:b4d8:ba34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03124530sm19668361fa.9.2025.04.08.06.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 06:30:46 -0700 (PDT)
Message-ID: <3831073d-fcc4-46a5-bdb7-ec19702a08be@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 16:30:44 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
 <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
 <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
 <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
 <769be701-afd1-4c14-8e44-fbb25a0c3f24@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <769be701-afd1-4c14-8e44-fbb25a0c3f24@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WxJvIRzX5mxYjBf8ukV4aALEaPuISomk
X-Proofpoint-ORIG-GUID: WxJvIRzX5mxYjBf8ukV4aALEaPuISomk
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f52508 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=TZ-J8J8rxNrT4oVwbdUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=989 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080095

On 08/04/2025 15:49, Manikanta Mylavarapu wrote:
> 
> 
> On 4/3/2025 3:02 PM, Dmitry Baryshkov wrote:
>> On Thu, 3 Apr 2025 at 08:08, Manikanta Mylavarapu
>> <quic_mmanikan@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
>>>>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>>>>
>>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>>> ---
>>>>> Changes in V6:
>>>>>       - No change.
>>>>>
>>>>>   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>>>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>> index 0fd0ebe0251d..1f89530cb035 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>>> @@ -82,6 +82,32 @@ &dwc_1 {
>>>>>       dr_mode = "host";
>>>>>   };
>>>>>
>>>>> +&pcie2 {
>>>>> +    pinctrl-0 = <&pcie2_default_state>;
>>>>> +    pinctrl-names = "default";
>>>>> +
>>>>> +    perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>>>>
>>>>
>>>> No wake-gpios? Please document it in the commit message.
>>>>
>>>
>>> Hi Dmitry,
>>>
>>> Thank you for reviewing the patch.
>>>
>>> The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
>>> I will document this information in the commit message and post the next version.
>>
>> If the GPIO is routed on the PCB I think it should still be described in the DT.
>>
>>
> 
> Hi Dmitry,
> 
> 	I have confirmed with the hardware team that the wake GPIO is not routed on the PCB.

Sad. Please mention it in the commit message.

> 
> Thanks & Regards,
> Manikanta.
> 


-- 
With best wishes
Dmitry

