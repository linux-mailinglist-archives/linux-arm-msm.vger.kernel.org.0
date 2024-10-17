Return-Path: <linux-arm-msm+bounces-34701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA49A1B9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A63FB20CAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 07:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA51C3036;
	Thu, 17 Oct 2024 07:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PSec7g9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F231BAECA;
	Thu, 17 Oct 2024 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729149840; cv=none; b=fp6/NJCr3rYk2VBKpUw7FvAdnLJH8kJIMlszsSoVdTfw9IjkXGIsDeEf01uyjrhqAq+cZAx3J1Dtm+IuZXXT1gHEe1VheU1KAZh/ceu3kru0v1gOuUkxiVHsFn5t9MVip2n2vACAurRY0rdNaxWDGNBpjpgIaGkHHZnH3tB6HBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729149840; c=relaxed/simple;
	bh=yX3e4TKzIrVEwp8sW9oOV14a9OdpyUXolL7KpLixKYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TmKSMp20T6+DpMqedavWsKobpNsu4DhSjUT1ajP4Gkm0FTAaXTZNDMLLJZAv7SHTAKfelmQOHsJn6NcT+7XsbMyps4Wk2F8A8hCQ0EBrXSLT18iQmEpGTAsqyoHd43OaZnO4iB0H5EpX2QnoYJsnQ0M8ZWFAbesgZTScXWZwhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PSec7g9M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GH1CPX007441;
	Thu, 17 Oct 2024 07:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPwdW77Lo0NmiaAPuloraC1OFMcSfxRib07uJikPt8E=; b=PSec7g9M5pGBGKFJ
	NFWb1qk2r79wmwPj6YlT9eOjNT7ilL9eSaWFUXT0hnv+n6DQX4Ro8wN3Qdipr7ZE
	Sjw3UFmG43nlEgZPQd2OkQTYO+lt4DCCapeoAL5gkj+xk+l4OYXCMaBUXuVjA7fK
	vMhR/CyBlVtgtRlLVH/rax4ECkzSvKRqLKLz9ZC7TdFLRqusuEjUXT2Qls1Ln+H5
	dyVWdpJdJ/RndLcJ6v9GzT83CHGFso3MrADesXJsAtz6Nc6I1uzJZ7qnzF2BBNqM
	NP9gITaZmHtY+KDpOr6eg6lLC57Jk942yl/EnQz+GWok5iOCZC+3z3y36l+BZknb
	wxOipQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy79fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 07:23:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H7NIav007517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 07:23:18 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 00:23:15 -0700
Message-ID: <6e408062-9a74-4a2a-8b67-b83244c4ca95@quicinc.com>
Date: Thu, 17 Oct 2024 15:23:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240821031348.6837-1-quic_taozha@quicinc.com>
 <20240821031348.6837-2-quic_taozha@quicinc.com>
 <a01d2f2f-d963-4eb1-98ee-3dc6f86c9397@arm.com>
 <xmijaayxveghxx76nnudo5mlpxv6tpxvooiox7wj2jyojf3xpe@ntm67lxikfop>
 <44e2617c-62b0-436f-ac6a-0bd3e3855473@arm.com>
 <53ec46af-3438-44e0-82b2-9432fc7f0fcb@arm.com>
 <4a6066ed-ead4-4387-8c66-b3e7631c5e90@arm.com>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <4a6066ed-ead4-4387-8c66-b3e7631c5e90@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VsWjjilMT3hdvL05HuqmwK8Fx5k6z9bu
X-Proofpoint-ORIG-GUID: VsWjjilMT3hdvL05HuqmwK8Fx5k6z9bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170048


On 10/9/2024 6:52 PM, Suzuki K Poulose wrote:
> Krzysztof
>
> On 22/08/2024 12:50, Suzuki K Poulose wrote:
>> On 22/08/2024 11:34, Suzuki K Poulose wrote:
>>> On 22/08/2024 08:08, Krzysztof Kozlowski wrote:
>>>> On Wed, Aug 21, 2024 at 11:38:55AM +0100, Suzuki K Poulose wrote:
>>>>> On 21/08/2024 04:13, Tao Zhang wrote:
>>>>>> The is some "magic" hard coded filtering in the replicators,
>>>>>> which only passes through trace from a particular "source". Add
>>>>>> a new property "filter-src" to label a phandle to the coresight
>>>>>> trace source device matching the hard coded filtering for the port.
>>>>>
>>>>> Minor nit: Please do not use abbreviate "source" in the bindings.
>>>>> I am not an expert on other changes below and will leave it to
>>>>> Rob/Krzysztof to comment.
>>>>>
>>>>> Rob, Krzysztof,
>>>>>
>>>>> We need someway to "link" (add a phandle) from a "port". The patch 
>>>>> below
>>>>> is extending "standard" port to add a phandle. Please let us know if
>>>>> there is a better way.
>>>>>
>>>>> e.g.:
>>>>>
>>>>> filters = list of tuples of port, phandle. ?
>>>>>
>>>>> e.g.:
>>>>>
>>>>> filters = < 0, <&tpdm_video>,
>>>>>              1, <&tpdm_mdss>
>>>>>        >
>>>>>
>>>>
>>>> Current solution feels like band-aid - what if next time you need some
>>>> second filter? Or "wall"? Or whatever? Next property?
>>>
>>>
>>>
>>>>
>>>> Isn't filter just one endpoint in the graph?
>>>>
>>>> A <--> filter <--> B
>>>
>>> To be more precise, "Filter" is a "port (p0, p1, p2 below)" (among a
>>> multi output ports).
>>>
>>> For clearer example:
>>>
>>> A0 <--> .. <--> ..\                  p0  / --> Filtered for (A1) 
>>> <--> B1
>>> A1 <--> .. <--> .. - < L(filters>    p1  - --> Filtered for (A2) 
>>> <--> B2
>>> A2 <--> .. <--> ../                  p2  \ --> Unfiltered        
>>> <--> B0
>>>
>>>
>>>
>>>> Instead of
>>>>
>>>> A <----through-filter----> B?
>>>
>>> The problem is we need to know the components in the path from A0 to X
>>> through, (Not just A0 and L). And also we need to know "which port 
>>> (p0 vs p1 vs p2)" does the traffic take from a source (A0/A1/A2) out 
>>> of the
>>> link "L".
>>>
>>> So ideally, we need a way to tie p0 -> A1, p1 -> A2.
>>>
>>> would we need something else in the future ? I don't know for sure.
>>> People could design their own things ;-). But this was the first time
>>> ever in the last 12yrs since we supported coresight in the kernel.
>>> (there is always a first time).
>>>
>>> Fundamentally, the "ports" cannot have additional properties today.
>>> Not sure if there are other usecases (I don't see why). So, we have
>>> to manually extend like above, which I think is not nice.
>>
>> Replying to the other thread [0], made me realize that the above is not
>> true. Indeed it is possible to add properties for endpoints, e.g:
>>
>> e.g.: media/video-interfaces.yaml
>>
>> So extending the endpoint node is indeed acceptable (unlike I thought).
>> May be the we it is achieved in this patch is making it look otherwise.
>>
>> Suzuki
>> [0] 
>> https://lkml.kernel.org/r/4b51d5a9-3706-4630-83c1-01b01354d9a4@arm.com
>
> Please could you let us know if it is acceptable to extend "endpoint"
> node to have an optional property ?

Hi Krzysztof,


Kindly reminder, could you help comment on this?


Best,

Tao

>
> Suzuki
>
>
>>
>>
>>
>>>
>>> Happy to proceed with anything that seems acceptable for you folks.
>>>
>>> Suzuki
>>>
>>>
>>>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>
>
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

