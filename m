Return-Path: <linux-arm-msm+bounces-29330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9A95C660
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56B8CB25297
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 07:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1EA13C827;
	Fri, 23 Aug 2024 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mw+6YZ1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9DB13B7BC;
	Fri, 23 Aug 2024 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724397396; cv=none; b=tjW98l4AWXe7gj1k4+Ssi1mhHqlGEpXH3dXkOqGpmG+UqHpPP7Wm806KjUOghb/tb24Qe/6pwm+mHMn50bYSa52YssFwC933F6z/It38yv48nuEO7caSyZU+Ku9qgS23a+XkDnRztY32VBDMxo1qk6KCI7/I9Yrqol1Lb9ZTCIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724397396; c=relaxed/simple;
	bh=SmD2pAgg2Cga/t5bFDBOFnKZxjdDUcoMeuUuhKrJUN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UcMvcc11ZmZMOWgLBiq7wArKKtiFkIlJNravfPzaey2RCg6uDxH0Ii/KSB/ahJ+8C9bPymaVFE1/Azvd00JJhE6qnrj3x1ccq9EGBXcpHL4ySh+l0rZXXSY6+ulXlwb9FagjMejCNTzoHQkG0mYv9+brhnY2zqWLwaX4nYS7REs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mw+6YZ1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N0q4wX001725;
	Fri, 23 Aug 2024 07:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvvmRzjjGmzJRu2QtaD2yqG7o8BFSxdAfyKmQ8OGQcs=; b=Mw+6YZ1N8M8rR9Jf
	X8NPvg30YWIm0tHNwHZvEUkQ+IKOcKW+6n5qnurlXoSM9/9RLC+ER1cDDdOP4NH/
	sR9P/86A1MTReubX3cLFbk7J48xoc671SOrEEYT6ljwZCydeKuJbDxWCHEmuuGqX
	qCAQj/dfromoGUbp9JV8rglWvbeLloiUy1kVgaiMzy5ChFcFC4x3zuxMqSsCUUnM
	LBwRet/APr+IlYv3HdLpoIlL+UV4oTEIl+I5prdGkZM1q/b5WbgWm9/57g5ZxEbh
	rl+dzuzgyzhsdzMgOaaS1qos9kE5cKplrH7k/dsUqHGV3iqu4s1XkY34w8ot3Djb
	c51yMw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdn2fdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 07:16:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47N7GD8O029109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 07:16:13 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 Aug
 2024 00:16:10 -0700
Message-ID: <13ac63cb-8ef8-41e4-8758-82635cbfade4@quicinc.com>
Date: Fri, 23 Aug 2024 15:16:07 +0800
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
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <x45dqaramqjwqjmwf5fbagzsrzb4f4qaohpaaohrdfjkmq2oil@x3sz4jeqnmj5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OyOa49kwiLNuUPASs-1kIOjy-lAoPgOG
X-Proofpoint-GUID: OyOa49kwiLNuUPASs-1kIOjy-lAoPgOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_04,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230051



On 2024/8/22 15:41, Krzysztof Kozlowski wrote:
> On Wed, Aug 21, 2024 at 11:41:18PM -0700, Mao Jinlong wrote:
>> qcom,qmi-id is the instance id used by qmi API to communicate with
>> remote processor.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> index 4fd5752978cd..27e5f18bfedf 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> @@ -20,6 +20,13 @@ properties:
>>     compatible:
>>       const: qcom,coresight-remote-etm
>>   
>> +  qcom,qmi-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      This id is used by qmi API to communicate with remote processor for
>> +      enabling and disabling remote etm. Each processor has its unique instance
>> +      id.
>> +
>>     out-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       additionalProperties: false
>> @@ -31,6 +38,7 @@ properties:
>>   
>>   required:
>>     - compatible
>> +  - qcom,qmi-id
> 
> That's an ABI break.
> 
> Best regards,
> Krzysztof
Hi Krzysztof,

Sorry, I didn't get your point.
Could you please share more details ?

Thanks
Jinlong Mao

> 
> 

