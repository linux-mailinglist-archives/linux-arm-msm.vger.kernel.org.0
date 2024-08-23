Return-Path: <linux-arm-msm+bounces-29341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC395C8D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 11:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 462CD1F228A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48368149C7C;
	Fri, 23 Aug 2024 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N3/8y3e7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7AB149C77;
	Fri, 23 Aug 2024 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404146; cv=none; b=h7bUy19Z/qhb2oH1rv2nIAZnOx++B4BvDOGJAAM+WE+njvRMCYxUyMBlxr7ZdiDEUoiuOVvOFTlbbK4CY7zB4daJB+kSmyGrnZAu1X9fCzgHjWs2eAncZ5NnZ1JbyX0wEp7RJTyOoJgeHC0hryxse1BaVrztl9O9HvQtGo+Pc1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404146; c=relaxed/simple;
	bh=nC7JabQEAEXclAZ0tYB291gajgy3pYW+XW37pG46/II=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q0pMTg6S6DheiEc908GS0JXQtP5U0RlDUoFoLawIxg1++7LP55V+2mHZvEFV5TcjZvtsxyj9TQlyg9tx8qvDwelrphdPUqNc+mSkAwzZbXmY79cSKJ5Ts/hCUMw8A+DlDVggniO5/c81vdqEt4sheOzkM7bjKdgZv1jHn4mzIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N3/8y3e7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MNEqg7003990;
	Fri, 23 Aug 2024 09:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/QA9vtjnV+ijoANR+EULqrbmpErXoAl1ECdyIHLCRA=; b=N3/8y3e7r5wc3yXv
	krSinFUtKKSItjkv31RVhVIAF+exq+gyIL0vVx4lI8Zdjp448si2cq7uYI3VaMUO
	KBIEb+C+FHjB7VuTvCFoPmZgn7SBoD4QW4diKmQ6el2DAJgYcaxBfZD2GxJ00W8u
	fqi3LxlOjHS/3IILHsfs3B/C72P65b7USdWjFFdCae9C4rgY4AIxfmSgc4fRkAOs
	3X5LpObWB2B0b48DFyIG1KnHU+Nm8HdPxmY/oyD9O9F1HIBdAq0xOsYy1TMkIqNw
	hoo3XoG8baThuaAWbmP987tH5oEdq1bBwQ/oQd0PmRDQaeVXPBl0M7nkjnmPcVZN
	iE9btw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4166exame5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 09:08:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47N98oHA030102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 09:08:50 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 Aug
 2024 02:08:46 -0700
Message-ID: <8fcbd8ad-40cc-4800-9170-38c07706fd4f@quicinc.com>
Date: Fri, 23 Aug 2024 17:08:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add qcom,qmi-id for remote etm
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240822064122.5231-1-quic_jinlmao@quicinc.com>
 <20240822064122.5231-2-quic_jinlmao@quicinc.com>
 <x45dqaramqjwqjmwf5fbagzsrzb4f4qaohpaaohrdfjkmq2oil@x3sz4jeqnmj5>
 <13ac63cb-8ef8-41e4-8758-82635cbfade4@quicinc.com>
 <lklauccjrhrnnk7d4i3scpzgdva6isvidt3jjefk7xtpsg6hhb@w4w423apm7in>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <lklauccjrhrnnk7d4i3scpzgdva6isvidt3jjefk7xtpsg6hhb@w4w423apm7in>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c7ixTB0nm1xFOJlskwegalacd05laKq0
X-Proofpoint-ORIG-GUID: c7ixTB0nm1xFOJlskwegalacd05laKq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_06,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408230066



On 2024/8/23 15:39, Krzysztof Kozlowski wrote:
> On Fri, Aug 23, 2024 at 03:16:07PM +0800, Jinlong Mao wrote:
>>
>>
>> On 2024/8/22 15:41, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 21, 2024 at 11:41:18PM -0700, Mao Jinlong wrote:
>>>> qcom,qmi-id is the instance id used by qmi API to communicate with
>>>> remote processor.
>>>>
>>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>>> ---
>>>>    .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>>>> index 4fd5752978cd..27e5f18bfedf 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>>>> @@ -20,6 +20,13 @@ properties:
>>>>      compatible:
>>>>        const: qcom,coresight-remote-etm
>>>> +  qcom,qmi-id:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      This id is used by qmi API to communicate with remote processor for
>>>> +      enabling and disabling remote etm. Each processor has its unique instance
>>>> +      id.
>>>> +
>>>>      out-ports:
>>>>        $ref: /schemas/graph.yaml#/properties/ports
>>>>        additionalProperties: false
>>>> @@ -31,6 +38,7 @@ properties:
>>>>    required:
>>>>      - compatible
>>>> +  - qcom,qmi-id
>>>
>>> That's an ABI break.
>>>
>>> Best regards,
>>> Krzysztof
>> Hi Krzysztof,
>>
>> Sorry, I didn't get your point.
>> Could you please share more details ?
> 
> Adding new required properties is an ABI break. Nothing in commit msg
> explained why this is okay or even needed.
> 
> Best regards,
> Krzysztof

Thank you. I will update in the commit msg.
> 

