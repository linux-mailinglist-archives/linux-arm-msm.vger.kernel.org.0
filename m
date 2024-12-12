Return-Path: <linux-arm-msm+bounces-41655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A63769EDF1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 06:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3877E280C7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 05:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78FD17E900;
	Thu, 12 Dec 2024 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PGdkJSyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DBC16FF4E;
	Thu, 12 Dec 2024 05:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733983025; cv=none; b=DN/1L2Tc67InSlUF/S1bnPAWwm5ShJaXyGZ5R3z+P7TiJBIdHrB3+iXplwLZD8TWU3ob0H/b8oMeNSPh6ivd5ohtH4Uf/K5tIVmhg0bpMF2BOjUwYozuMZ1DKrh8805sk31EVl15vUtfBJzPi6G1aSWENZ5jNl+z5939iYSp43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733983025; c=relaxed/simple;
	bh=aEC+BpFyg/fU45C3s1RDDAxwIsvLISGJxjWa1qHFEFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d81Lcg40pXgluxj9AuBaFimFRtYVVET1NsB1Xj29LYqbik+76hVIohbfZ1MCWQCNr/+sDEWl5T1MXjjDRdNEv5ciYqsJ+1/YVE3DAwSr+wBH3LxczDeElGuMrbxshk5b6PFcA2LEpMLNIKKvJAQChjPB7D4diEwa3dsNuZgmXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PGdkJSyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD3l0032190;
	Thu, 12 Dec 2024 05:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbjMw562UQ6oS5w2TgOnZyuQceG0/z+zGLu1Cs3U6S4=; b=PGdkJSylvx8Vptyc
	0hIJO2f+72+mAyo9H9wDZoD5L8bN18kN3D1R6yRh19B/LSRtDq7jT6rO19ux1L/1
	oPZHdm2o1wnBhsIBqZPdcR2fN6DEZnwl4Gsfuedj+g2U2f3rLDtPhIq82wTReFrL
	PrZdoAj66ueAM9D2u8ru1ZBHFYhk2KMJ24X6goTYuNTZyorLRzIjggm+ROGj25gU
	70q3xeTG9LGf9NMJmBIeGAnVxodYeo6Xn36ImSGyjl3eIAyhtN8h1tm6cVCk5zI9
	iZmPbfFcwPhaTcQIBFlZN9xe/Tz1RhHEg6c/A3moTMBCUK+YQfgTnSO3I71GZoxn
	T62OcQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfb4h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 05:56:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC5uuM0014521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 05:56:56 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 21:56:51 -0800
Message-ID: <789ff383-a8e4-4d54-ac8b-5a14060dd9d6@quicinc.com>
Date: Thu, 12 Dec 2024 13:56:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
 <20241210151636.2474809-2-quic_chejiang@quicinc.com>
 <vbwg7djb4me6i4ow2q74ltqjxvkxeulhzyq4n6ak7aifhtf36f@x66pjje2iu6u>
 <62afbaea-67b1-4572-9e78-d1dbe5fae20a@quicinc.com>
 <f818f089-0490-42da-9aee-1a7006c11978@kernel.org>
 <65fd0932-4519-44ac-ba9d-55ee97b43233@quicinc.com>
 <dukhhbf22w2hcr32jtjuvminpuzgi3a3tkkux7pd32j4d4gzkx@mvgckzd22she>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <dukhhbf22w2hcr32jtjuvminpuzgi3a3tkkux7pd32j4d4gzkx@mvgckzd22she>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s6xCP0_QCJmL0y5azUbmetzi6_6lZgRi
X-Proofpoint-ORIG-GUID: s6xCP0_QCJmL0y5azUbmetzi6_6lZgRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120039

Hi Krzysztof,

On 12/12/2024 3:28 AM, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 06:16:44PM +0800, Cheng Jiang (IOE) wrote:
>> Hi Krzysztof,
>>
>> On 12/11/2024 5:48 PM, Krzysztof Kozlowski wrote:
>>> On 11/12/2024 10:39, Cheng Jiang (IOE) wrote:
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>> index 7bb68311c..2782d2325 100644
>>>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>> @@ -101,7 +101,10 @@ properties:
>>>>>>    max-speed: true
>>>>>>  
>>>>>>    firmware-name:
>>>>>> -    description: specify the name of nvm firmware to load
>>>>>> +    description:
>>>>>> +      If one item is present, specify the name of the NVM firmware to load.
>>>>>> +      If two items are present, the first item specifies the name of the NVM,
>>>>>> +      and the second specifies the name of the rampatch firmware to load.
>>>>>
>>>>> Don't repeat constraints in free form text. Use proper constraints so
>>>>> you can validate your DTS. And then actually do validate your DTS...
>>>>>
>>>> It seems unnecessary to add this description, so I will drop this change. Is that okay?
>>>
>>> You need to list the items and describe them. See how all other bindings
>>> do it.
>>>
>> The firmware names are not fixed strings; they vary depending on the chip, board, or platform.
>>
>> How about the following description? Thank you!
>>
>>   firmware-name:
>>     $ref: /schemas/types.yaml#/definitions/string
>>     description: |
>>       List of firmware names. The first item is the name of the NVM firmware
>>       to load. The second item is the name of the rampatch firmware to load,
>>       if present.
>>     minItems: 1
>>     maxItems: 2
> 
> I think this is better:
> 
> firmware-name:
>   minItems: 1
>   items:
>     - description: NVM firmware to load (extend the desription)
>     - description: rampatch (extend the description)
> 
Ack. Thank you very much for the suggestion. 

>>> Best regards,
>>> Krzysztof
>>
> 


