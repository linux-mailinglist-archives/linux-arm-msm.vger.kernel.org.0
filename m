Return-Path: <linux-arm-msm+bounces-30493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E99ED969751
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941C91F24FC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623D12101BC;
	Tue,  3 Sep 2024 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hla0dovU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA91A265F;
	Tue,  3 Sep 2024 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352693; cv=none; b=CPJdeJE/33NEoqaAIqRjgSr+93BGgi5aEj0hQkuWrJelUp72NDqB2xRB0F4e415lR+H9E3YUIhKRcKTVMQJlzz+xZU5YsmyycSLyHDjD3P1Ac4dFAZoLs/RD75D65nkQ6t1dBBJBXzq96Wxk10fQlFLMfAxmF5bOccoB5LWTHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352693; c=relaxed/simple;
	bh=XbrhZalToo1tSy22aYkgfedlGGwKm/cH60Z8HE/u53c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n+fxNkgxBZxHDmEcHuosefYTfsOvvAjD5yxVdtH0yN+Qs7YZsU6PSSg+LRZGRpOnVLCkSFq3pz4XFL+1PY2osufMb1hCHa1PERAe9wrd5GdyiePIJeHt7jJnZafM56e7B6KDV1hVApj7OHv3yv2DZCJLnHEAb6RfGRT8E9u8Eps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hla0dovU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482LRSAv028888;
	Tue, 3 Sep 2024 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSiPVPzWfiduYlMyPPYbxX3CLFqvDnkaba/MGBq03C4=; b=hla0dovUsUQyu5i1
	/X4QDlKTV8tinazPua/aAgH1vxaOKLEtC1oPI7vDrWzWSEiYvhgt7tGizGUQ8vpr
	QX8dojdW0fEcLPBxqn8RPSAGtdNicZ/oBts7K5+4Djuq3FhQn0nrcw/0jmg5yn3z
	kQ8+pRyGxzHuOCZuHxoMySNcnZ7AHZk6uYdOgFnoPR/s2q1NMTh6cIAViSrE1nWH
	9NrIAt4SmrGKhFxmsWEAR8NiB3okgPonU24gq14q+q7rJFuxuGz/Xsruqfp9o73W
	FUbWugwXUGC8IpZtgw1UF0Qx7OyDBl21vcsFBkp+slrIRNdTMWszTrEjvZogaCer
	m9tj8w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bud2pnad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 08:38:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4838c62H025569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 08:38:06 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 01:38:04 -0700
Message-ID: <7688ac1c-14da-46a2-a5dc-f01c104485f8@quicinc.com>
Date: Tue, 3 Sep 2024 16:38:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: add num-banks property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-1-228659bdf067@quicinc.com>
 <g7fyt57kzynzpux5nea2v22gcuu24asbr54axzms7mhdh4jq5a@xdyqifloofbk>
 <ac1b3ba2-ac57-411c-acdb-69d288d88355@quicinc.com>
 <21715065-c48a-4172-98ec-ce48c6a1126e@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <21715065-c48a-4172-98ec-ce48c6a1126e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4w54AiTzy5QvcFY8ll7gxavilQIAA0ZG
X-Proofpoint-ORIG-GUID: 4w54AiTzy5QvcFY8ll7gxavilQIAA0ZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030068



On 9/3/2024 4:00 PM, Krzysztof Kozlowski wrote:
> On 03/09/2024 09:30, Jingyi Wang wrote:
>>
>>
>> On 9/3/2024 3:10 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 03, 2024 at 02:21:29PM +0800, Jingyi Wang wrote:
>>>> Add a property "num-banks" for errata.
>>>
>>> This you said in commit subject and we see in the diff. You *MUST*
>>> explain why.
>>>
Usually the num of LLCC banks is read from hardware, but there is errata
on some SoCs to get the wrong bank num from LLCC_COMMON_STATUS0. Add a
property "num-banks" to indicate the accurate data.
>>>>
>>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> index 68ea5f70b75f..03241b719c98 100644
>>>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> @@ -56,6 +56,11 @@ properties:
>>>>      items:
>>>>        - const: multi-chan-ddr
>>>>  
>>>> +  num-banks:
>>>
>>> No vendor prefix? So this is generic property? Then add to some common
>>> schema with proper explanation WHY.
>>>

will qcom,num-banks be okay?

>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      The num of llcc banks
>>>
>>> And what are llcc (or LLCC?) banks?
>>>
>>>

LLCC banks means LLCC register regions with same memory size and reg offset
and different memory base for LLCC configuration.

>> Will add the vendor prefix and description in the next series.
> 
> You did not provide rationale nor answer to concerns so far.
> 
> Best regards,
> Krzysztof
> 
Thanks,
Jingyi

