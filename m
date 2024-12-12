Return-Path: <linux-arm-msm+bounces-41698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A20279EE3E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 11:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05EDD167BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 10:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA7220C00E;
	Thu, 12 Dec 2024 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JK/i3slw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1971545027;
	Thu, 12 Dec 2024 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998587; cv=none; b=SlAZZaodYK62hqHk7eSkRtloCVik/yDf4wsO5iFuI7jHjLpiuEa2B5DexEp6WFT8/zw7+5TkQs1Qm4e5KF6ySCb69ZiuivX7G64kf24Oxxbl+d3gUOcDMDNThu6RUylSv67hAWYGirr3XlvsR9XPpCCV0gtks6CDd3At0E6nD5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998587; c=relaxed/simple;
	bh=qo3Rv5arEF3Bj2lIGlIG/vss34EB5qy39uBtzPHP6Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bfqfLDGRf1cUJmGcWpi6Puut/6REUbpcUpcCXHbCm5dEcV6zqEUPu1TGrqS3Eh9q5kSVQXteT+ArYT+y+p62zQoRPYpOUFr4MxxsdbbTfJzJiP7AFMcaO+d4w9GVTI/jl5o/oRduSmBxGugyeE/4mePwkFTpo57J/Eg21iVS+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JK/i3slw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7gVva029034;
	Thu, 12 Dec 2024 10:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YYYW2nbLGoQmKqk5fl+o+ckY9lAaIAA/oyPAHuafN1M=; b=JK/i3slw16jkUlh4
	Wet47N+GP5osyqMP/N9hspmtl6S+7KAn9ixHmaydJ7t67RaIcyP/QoGr0S8x1wdV
	DY0wS6oqaqEg5hYGo/XrrkEBwX4r4Gf+CtSXyOJNRSIdSmhZhn9+vqbOtPYEhmy3
	eZiZkCTQrVH+x7JsBFKeGB99fq9IG/EKpVYbZOT5oldG+Suwt/VkRuN71kp5/cNM
	s5z5kUGX4vmdfpYghv22dgYXkAZCC7OO3bZvNhtNsbh3dEhpuFQho8aUPSTbYbr6
	lfWANzBZ4DzjkFX91gnZQvYHyr/CdNEMMMS/EqTz28Bg502SBgXrSSaepzT1XfmM
	b2Ezng==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xthm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:16:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCAGIFP016708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:16:18 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 02:16:13 -0800
Message-ID: <06566196-f87a-4d66-bea5-83b640651489@quicinc.com>
Date: Thu, 12 Dec 2024 18:16:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
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
 <ecb8535a-d421-4774-88d3-e904bb08a0e4@kernel.org>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <ecb8535a-d421-4774-88d3-e904bb08a0e4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F_uqG9jF01yQDUbVHmxyw8m919_J5m4k
X-Proofpoint-GUID: F_uqG9jF01yQDUbVHmxyw8m919_J5m4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120072

Hi Krzysztof,

On 12/12/2024 3:16 PM, Krzysztof Kozlowski wrote:
> On 11/12/2024 11:16, Cheng Jiang (IOE) wrote:
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
> 
> Instead of replying immediately and pushing this back again on us, read
> other bindings. There are nowhere "fixed strings".
> 
Ack. I will take care of it next time. Thank you!
> 
> Best regards,
> Krzysztof


