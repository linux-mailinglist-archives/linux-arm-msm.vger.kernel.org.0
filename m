Return-Path: <linux-arm-msm+bounces-28576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 325CA9527E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 04:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42EAC1C20F6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 02:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E5A1804A;
	Thu, 15 Aug 2024 02:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ifAYX/T9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39F214290;
	Thu, 15 Aug 2024 02:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723688858; cv=none; b=bedL0YlgQ2yID4Ot/l3CwP3BAlQj0coUgmT287n0WOayDxEEWMETeT+LSybG7nBK6mC+LXsCQV+eXFBC/8Kd89480kKNBuZX33SkdF9/89m+bqyI4A1vkctTmWONq8ccuVtAy+XciYC76cmh/SH54q9AGC5bJpZD3FkdLakCbLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723688858; c=relaxed/simple;
	bh=DzRNDrOySOzTjHv2ZeWrilIiEAiE3HdVNDg2lL5CG20=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n00v7hGU7kFftZf6FRCHYm6dOTwwcQK6AlHuFwy7eTPPxaN6ijh0eoX8lQ1Ov8hN4o6m5uYcln8DZhrOHbdL6em+pECsLm7U0VSSkkPKslvb3e7Io4EmWXFzwHq77PGCeocY7x94+sPg0wsygWXiGl6bJwgU5w7MmPEaSS4J3+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ifAYX/T9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47F0USox032757;
	Thu, 15 Aug 2024 02:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nXyyuUlp9P/usd0QtRZ5HLVKq5Lzrskm7u3X6OZ7KA=; b=ifAYX/T9/2Q9qV2m
	BTOvalSdQFk3s12lpZUqpCuM+wG5ZkE0v7Qgao/F0nkLs0GGFnQeiL5OzwA+Z2MN
	w3CIeJ/dx+DNdjd8NaztNCOHAjsJM7JTPjiuzoX7b3EWeYz7wZF/kQeHFywe4DOZ
	gs8z9HraMa3QdnwIgf7OrPtZzlxbwGS/sAceY297xeE7yqkHJfybQBJojTnziTPh
	P3Z6qURZflLzI6UisXNKZmqRR26OA4oAwt4uf8Rg9AvOnvgSQOXY5fYC75WPHEUe
	kxE4XeLFiKo0T9eYj8UKneM+quvs1AqAheZwEWnJTgJiI8Y7FxoFl3dNTbONVYNs
	11x7nw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410437x8ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 02:27:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47F2RVG6032397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 02:27:31 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 19:27:28 -0700
Message-ID: <184424ce-638c-4075-9bb8-683b6b9abaa9@quicinc.com>
Date: Thu, 15 Aug 2024 10:27:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: document QCS8275/QCS8300 SoC
 and reference board
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>
References: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
 <20240814072806.4107079-2-quic_jingyw@quicinc.com>
 <3fd0fa88-eee0-45f8-bd8b-f5b2bc15c25a@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <3fd0fa88-eee0-45f8-bd8b-f5b2bc15c25a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1pNGP41rkr0MqTLkPBOhuaQuI0cSj0pY
X-Proofpoint-GUID: 1pNGP41rkr0MqTLkPBOhuaQuI0cSj0pY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_22,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 mlxlogscore=959 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408150016



On 8/14/2024 4:56 PM, Krzysztof Kozlowski wrote:
> On 14/08/2024 09:28, Jingyi Wang wrote:
>> Document the QCS8275/QCS8300 SoC and its reference board QCS8300 RIDE.
>> QCS8300 is an Industrial Safe SoC, while QCS8275 is the Industrial
>> Non-Safe version which can share the same SoC dtsi and board DTS.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index f08e13b61172..3952e1579767 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -42,6 +42,8 @@ description: |
>>          msm8996
>>          msm8998
>>          qcs404
>> +        qcs8275
>> +        qcs8300
>>          qcs8550
>>          qcm2290
>>          qcm6490
>> @@ -884,6 +886,12 @@ properties:
>>            - const: qcom,qcs404-evb
>>            - const: qcom,qcs404
>>  
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-ride
> 
> This is not used. You miss DTS patch. Look how people upstream things:
> such binding *never* goes separate from the DTS.
> 
> Best regards,
> Krzysztof
Thanks，I will remove that.

Thanks,
Jingyi

