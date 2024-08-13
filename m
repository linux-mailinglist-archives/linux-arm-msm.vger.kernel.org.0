Return-Path: <linux-arm-msm+bounces-28364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08439500A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 11:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E60E11C22CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 09:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950D517A584;
	Tue, 13 Aug 2024 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PB4vsCF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF86170A18;
	Tue, 13 Aug 2024 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539590; cv=none; b=sl88jxMmJCJdhMrLCZxLXDYbhLG1r8KsdgraAY/v5FUqlfGimLxhf84plT2JXcPnpTo5t8cz7Y9NnJdXhSJ7YTKsfUrgyHoCNsdVGjhyX/JQYhe6uxjgffn7vQHxBe4MFzDdFzZL9m1pG5OmVtlCR0RroIIRH2kzNfJkVuqTYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539590; c=relaxed/simple;
	bh=0uNafAcjTUIswRlZd7alQFxJCH3U2zk37KAlOg//AkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F01qO6IXOahd4BT9kMckSjCsb9zUm3Wsq8mZf45jOFfvi0zrPALIBjm5xTiSTc40HPaHRBwI97kQcjpmPVyL/kHW2H3/SE89+ECgOzGWvH4OSTIFPPSs/Ay9ln3SckXLzrNL672lABgc+q9s8+ZeVWn00SNvuO2IGJpt8T32VKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PB4vsCF5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D8XdrM026773;
	Tue, 13 Aug 2024 08:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wf+xQ3wWS3PreoxrbGzblnSn9IAqkU3lFqA/v/vy3MA=; b=PB4vsCF57P9nqMcn
	nAxQYc4G2Swru6MVB0oTm16c0x9eLE9AEtMn6OwPgevZak4tBR9v24HeeKWx9Ugn
	Asmz/PNG736MVWwAncVQUGmz5axvntvr2biZhjFAM9dX7W31KMEDxjtgdjJfZ8UE
	gKRO0F9XDaIvXN/CjafBkawzdZwnyK87ya/3F9a3zWZZLYHuvxF/L3rL8nUbTY5Y
	UlWk4jMDvlfCWqDmnjgY2+SOf/zz846nD2Ey8Q/9JectMU7oXzQwZp7SeElxk6q7
	vjWUovzdei0nnrDKxwr43D/MZDAaPzF2R7MDNhLrg2wsP4KpGKM80mZfo16l99sD
	i7aC8Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410437r2m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 08:59:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D8xhDP021875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 08:59:43 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 01:59:37 -0700
Message-ID: <2229cc1a-0fa0-4291-874e-43b31f82ef50@quicinc.com>
Date: Tue, 13 Aug 2024 16:59:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sa8775p-ride: Add QCS9100
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
 <20240806-add_qcs9100_soc_id-v1-4-04d14081f304@quicinc.com>
 <90eae361-7d5d-440f-a85d-dfd81b384fe7@kernel.org>
 <4a350e94-3c95-48e1-9ea8-ced483c1aa45@quicinc.com>
 <14ec06bd-0c27-4930-8bce-d3f5b68067ed@kernel.org>
 <ace5b3e1-f4a2-4c04-821a-e797d0f55cae@quicinc.com>
 <9323127a-e6b5-4835-afa0-4ce0086fd9d1@kernel.org>
 <0d1c44b9-3d5f-4d93-af64-1756e52f4fe3@quicinc.com>
 <47c966c7-8736-44a2-8ec7-4d7989efa9cd@kernel.org>
 <72b2d710-a7cb-45cf-9dad-e9fbd876697b@quicinc.com>
 <d9060b49-66fe-4001-86cd-dda5e213e454@kernel.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <d9060b49-66fe-4001-86cd-dda5e213e454@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BF6k1lOAP8RYqrrHq8EUNjZCnsof3ufv
X-Proofpoint-GUID: BF6k1lOAP8RYqrrHq8EUNjZCnsof3ufv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_01,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 mlxlogscore=989 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130063



On 8/13/2024 4:34 PM, Krzysztof Kozlowski wrote:
> On 12/08/2024 09:07, Tingwei Zhang wrote:
>> 在 8/12/2024 2:15 PM, Krzysztof Kozlowski 写道:
>>> On 12/08/2024 04:16, Tingwei Zhang wrote:
>>>> On 8/8/2024 7:05 PM, Krzysztof Kozlowski wrote:
>>>>> On 07/08/2024 13:04, Tingwei Zhang wrote:
>>>>>> On 8/7/2024 5:35 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 07/08/2024 11:17, Tengfei Fan wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 8/7/2024 3:28 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 06/08/2024 06:19, Tengfei Fan wrote:
>>>>>>>>>> Add QCS9100 compatible in sa8775p ride and sa8775p ride r3 board DTS.
>>>>>>>>>> QCS9100 references SA8775p, they share the same SoC DTSI and board DTS.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I don't understand this. You claim here that QCS9100 references SA8775p
>>>>>>>>> but your diff says other way: SA8775p references QCS9100.
>>>>>>>>>
>>>>>>>>> Sorry, that's confusing.
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>> Krzysztof
>>>>>>>>>
>>>>>>>>
>>>>>>>> I will update the compatible as follows to indicate that QCS9100
>>>>>>>> references SA8775p.
>>>>>>>>
>>>>>>>> compatible = "qcom,sa8775p-ride", "qcom,qcs9100", "qcom,sa8775p";
>>>>>>>
>>>>>>> Is this still correct, though? sa8775p won't come with qcs9100 SoC.
>>>>>> We have a new board. Hardware is same as sa877p-ride except sa8775p is
>>>>>> replaced with qcs9100. We add qcs9100 SoC compatible to sa8775p-ride
>>>>>
>>>>> Does "new board" mean that "old board" disappears? No users to care
>>>>> about it? Or just the existing board is being changed (like new revision)?
>>>>
>>>> We will support both boards. Sa8775p-ride board with sa8775p chipset and
>>>> sa8775p-ride board with qcs9100 chipset. Both of them can be used for
>>>> development.
>>>
>>> Patch does something else then - changes compatibles for the existing
>>> (old) board.
>>
>> Can you educate us the right way to add the qcs9100 SoC support in 
>> sa8775p-ride board? We don't want to duplicate whole device tree file 
>> since all the hardwares are same except the SoC, so we add qcs9100 SoC 
>> compatible to sa8775p-ride board and still keep sa8775p SoC compatible.
> 
> Split board DTS into shared DTSI (just don't forget about proper
> -M/-C/-B arguments for format-patch) and include it in relevant boards.
> You also need new SoC DTSI. This will be unusual code, but it matches
> what you want to achieve.

If we create two additional DTSs, a total of four DTBs will be generated.
Should we update the current board DTSs (sa8775p-ride-r3.dts and
sa8775p-ride.dts) to support the pin-to-pin compatible QCS9100 and
SA8775p SoCs?

Considering the higher usage of QCS9100 boards in IoT compared to
SA8775p in automotive for these DTBs, perhaps we should prioritize the
'qcom,qcs9100' compatibility before 'qcom,sa8775p'.
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu

