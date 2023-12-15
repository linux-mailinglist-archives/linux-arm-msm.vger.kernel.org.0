Return-Path: <linux-arm-msm+bounces-4920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E726C814798
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 13:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 250F71C21624
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 12:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29228288B6;
	Fri, 15 Dec 2023 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WkKIP2Mg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52BD2575D;
	Fri, 15 Dec 2023 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BFBZ5Yt024275;
	Fri, 15 Dec 2023 12:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aE0c1EkjLW/+RUIzVcz6aNx+2hD6djlO8gcFyOrHy7s=; b=Wk
	KIP2MgSQtTV0PA+MRvtTe1J1N6LEWkbxRCMlQxMNtoaLGz+Re2Z89P9O5Xa/zI1O
	TfT/E4DM8aUThABs6f9uhEz/fQA8SW6ZWjFiq22Z2o4ZbUgpSJWkVUMLEjTYDYIN
	fYZ81dGcRia1/0A1ULNgmbDFlDTCrGpskLdMKIlrUd6EYgK07ya9WPP5bTRygmyT
	dkYh5jBNCEQWUud8IvNEkh/gDqFCdqzLKUUFwBpoDxM2GoSy3dhPprYeD6ILNrCC
	l10ZuR54/p9DObkpHG9kTXCR4paXoFPcrLPHoox6AJOkwM6/X+wqTGdlJNaagIci
	bGrT98YwEgJhdym6dyCg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0p1001kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 12:03:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BFC3ZGE010291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 12:03:35 GMT
Received: from [10.253.13.71] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Dec
 2023 04:03:27 -0800
Message-ID: <f16dfe78-2e31-45fb-b2fe-f72b7e6c51a5@quicinc.com>
Date: Fri, 15 Dec 2023 20:03:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
References: <20231214090304.16884-1-quic_luoj@quicinc.com>
 <20231214090304.16884-6-quic_luoj@quicinc.com>
 <1e4c55c8-8ed6-4f2e-8328-8a173f09b62f@linaro.org>
 <3c8e33b4-6ebc-476f-a00f-15cc8a1ad9e4@quicinc.com>
 <b89abf8c-57f8-46a6-a071-b1591340fbdf@linaro.org>
 <3de98516-9a28-4f58-8951-2a7752621fee@quicinc.com>
 <1fa2d219-63d7-45cf-9e05-b85dbce24076@linaro.org>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <1fa2d219-63d7-45cf-9e05-b85dbce24076@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YTWMcRTNNJL9kwHQLhgDz2vXrZzLq2Fq
X-Proofpoint-ORIG-GUID: YTWMcRTNNJL9kwHQLhgDz2vXrZzLq2Fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=925 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150080



On 12/15/2023 6:21 PM, Krzysztof Kozlowski wrote:
> On 15/12/2023 11:03, Jie Luo wrote:
>>>>>> +  cmn-reference-clock:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>
>>>>> Nothing improved here
>>>>
>>>> With this change, the warning is not reported when i run
>>>> dt_binding_check, looks the new added property needs
>>>> the type ref to avoid the warning reported.
>>>
>>> Nothing improved in the property name, nor its style, nor in the actual
>>> contents/values.
>>
>> This property is for CMN PLL block reference clock configuration,
>> so i use this property name.
>>
>> it will be appreciated if you can suggest a suitable name, thanks.
> 
> See example-schema about naming. Read writing-bindings. You need vendor
> prefix for custom properties.

Ok, thanks.

> 
>>
>>>
>>> ...
>>>
>>>>>> +  reset-gpios:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  reset-assert-us:
>>>>>> +    maxItems: 1
>>>>>
>>>>> This does not look related to ipq5332.
>>>>
>>>> The reset gpio properties are needed on ipq5332, since qca8084 phy is
>>>> connected, which uses the MDIO bus level gpio reset.
>>>
>>> I am talking about this property, not these properties.
>>
>> ok.
>>
>>>
>>>>
>>>> Without declaring these gpio properties, the warning will be reported
>>>> by dt_binding_check.
>>>
>>> How is it even possible to have warnings if there is no such node in
>>> DTS? We do not care about warnings in your downstream code.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> If i do not declare the property "reset-assert-us" and
>> "reset-deassert-us", the warning will be reported by "make
>> dt_binding_check" since i
>> add a example in this file.
> 
> This argument does not make sense, sorry. Obviously if property is not
> allowed, it should be removed.
> 
> Provide rationale, in terms of hardware, why this property must be added
> and why it cannot be deduced from the compatible.
> 
> Best regards,
> Krzysztof
> 

So i can remove "reset-assert-us" and "reset-deassert-us" from the added
example to avoid the dt check warning? even these two properties are
needed to be defined in the device tree to make this driver working
correctly.

