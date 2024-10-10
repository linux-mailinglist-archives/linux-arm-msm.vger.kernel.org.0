Return-Path: <linux-arm-msm+bounces-33830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE699828D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 673C9B27EC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB691BC9EE;
	Thu, 10 Oct 2024 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P08l0GF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041651BBBC3;
	Thu, 10 Oct 2024 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553076; cv=none; b=O6MhG1LgnPOlgLPNzlQUIVYEGz0uvhd+f2MJCYRnp4PLBspHEm3OqHPg8Z2U9O23ntSM79Twk+Glkf1bXC9p/PlRW69pM+6DkWHdDHh9xSILGPqQKJI19wpG7azPPCZOvR+Biei+thYhNNxwbOkq9BEDKvIbsSyfxE/Mq11p8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553076; c=relaxed/simple;
	bh=m1ApGz5SWsGf8l2Br9Vi4t563yjfwKpfWNWwVhcFabw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P2sA9o34VQxMet+9apzY+PJVBL5fX5bnKKplJ7wkjHxmxnMi3s3gVS/CglrPcmPMq2do0M0OFRoEgQNtgBafDIwR6fFdKT6rhNYJIIuaPn0qMChwp70SvZhXUocqaBIYP4XjBGJHFL/ZhMW8IU7/wldAHOMWzTCFVmpSGqGceYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P08l0GF9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bU8x022452;
	Thu, 10 Oct 2024 09:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGKXUFDTCVnVQs1Ljlq5SKzXI659H7V3iBLj4Tn3IOs=; b=P08l0GF9eRGtPUdj
	rE0nGDh57SGXwGQE8/y1aJlGVUoOctGEJBDxQpa0HacuQqLZ2r7L1NMrot79HHzH
	6vbnXC5t2VbU/lA5POVMn04s0GuoV8mP7DJIX0bzoOMAPcohNcKFk9Jb7j7UdQ7w
	bVsIOBfKNLEGxUK7AhdCfeafeHB1Jph1xZGg2yknIYcpOcsXJBbPFR+5q0cVAn1O
	yQ8E7fIA+WzsbXCGSFPIyzwGkGPMh8L8DbUPWTEYmsMEhyTM05p5Nvn6IW7nDe2u
	1+nzXzNxAYVkXf5Tj66coOQOHUedQo9q/Us10h1Gnun+8c5C8mqRzssFY33/bmo4
	WUSaDg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xptt1ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:37:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A9bbZC031865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:37:37 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 02:37:33 -0700
Message-ID: <9f8a6942-4731-4e7e-adcc-e07832d93905@quicinc.com>
Date: Thu, 10 Oct 2024 17:37:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 2/3] coresight: Add support to get static id for
 system trace sources
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
 <20240910100127.8948-3-quic_jinlmao@quicinc.com>
 <43612930-6c17-4c6f-bc4e-954bcfd7977e@arm.com>
 <832497c9-cae2-4531-b911-6f1bfa7ec4c9@quicinc.com>
 <c5830332-e590-413e-a6f7-31b68d6a1932@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <c5830332-e590-413e-a6f7-31b68d6a1932@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: whr56CVcpC8Mfjta0Yzz5xr2zuBe2V2_
X-Proofpoint-GUID: whr56CVcpC8Mfjta0Yzz5xr2zuBe2V2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100063



On 2024/10/10 17:19, Suzuki K Poulose wrote:
> On 09/10/2024 11:37, Jinlong Mao wrote:
>>
>>
>> On 2024/10/9 17:50, Suzuki K Poulose wrote:
>>> On 10/09/2024 11:01, Mao Jinlong wrote:
>>>> Dynamic trace id was introduced in coresight subsystem, so trace id is
>>>> allocated dynamically. However, some hardware ATB source has static 
>>>> trace
>>>> id and it cannot be changed via software programming. For such source,
>>>> it can call coresight_get_static_trace_id to get the fixed trace id 
>>>> from
>>>> device node and pass id to coresight_trace_id_get_static_system_id to
>>>> reserve the id.
>>>>
>>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>>
>>> This patch is technically doing two different things :
>>>
>>> 1. Support for reading the static traceid from the firmware. (users 
>>> of which comes later in Dummy)
>>>
>>> 2. Support for allocating a "specific" traceid for system sources.
>>>
>>>
>>> Both the names are a bit similar and could be confusing.
>>>
>>> For (1), I don't think we need to add a helper like that. See my 
>>> comments below, and drop all of that from here this patch.
>>
>> Hi Suzuki,
>>
>> This helper will be common for other new drivers in future.
>> Some other driver will use it, not only for dummy driver.
> 
> Ok, fair enough. But couldn't we still use the fwnode_xx directly from
> the "helper" rather than defining of_xxx. That way it should work for
> ACPI based systems too.
> 
Sure. I will use the fwnode_xx.

>>
>> Thanks
>> Jinlong Mao
>>
>>>
>>>
>>>> ---
>>>>   .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++
>>>>   .../hwtracing/coresight/coresight-trace-id.c  | 38 +++++++++++++ 
>>>> +-----
>>>>   .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
>>>>   include/linux/coresight.h                     |  1 +
>>>>   4 files changed, 64 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/ 
>>>> drivers/hwtracing/coresight/coresight-platform.c
>>>> index 64e171eaad82..703abf0fa3f9 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>>>> @@ -183,6 +183,18 @@ static int of_coresight_get_cpu(struct device 
>>>> *dev)
>>>>       return cpu;
>>>>   }
>>>> +/*
>>>> + * of_coresight_get_trace_id: Get the atid of a source device.
>>>> + *
>>>> + * Returns 0 on success.
>>>> + */
>>>> +static int of_coresight_get_static_trace_id(struct device *dev, u32 
>>>> *id)
>>>> +{
>>>> +
>>>> +    return of_property_read_u32(dev->of_node, "arm,static-trace- 
>>>> id", id);
>>>> +}
>>>> +
>>>> +
> 
> Drop these ^^
> 
> 
>>>>   /*
>>>>    * of_coresight_parse_endpoint : Parse the given output endpoint @ep
>>>>    * and fill the connection information in @pdata->out_conns
>>>> @@ -317,6 +329,11 @@ static inline int of_coresight_get_cpu(struct 
>>>> device *dev)
>>>>   {
>>>>       return -ENODEV;
>>>>   }
>>>> +
>>>> +static inline int of_coresight_get_static_trace_id(struct device 
>>>> *dev, u32 *id)
>>>> +{
>>>> +    return -ENODEV;
>>>> +}
>>>>   #endif
>>>
>>>
>>>>   #ifdef CONFIG_ACPI
>>>> @@ -796,6 +813,15 @@ int coresight_get_cpu(struct device *dev)
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(coresight_get_cpu);
>>>> +int coresight_get_static_trace_id(struct device *dev, u32 *id)
>>>> +{
>>>> +    if (!is_of_node(dev->fwnode))
>>>> +        return -EINVAL;
>>>> +
>>>> +    return of_coresight_get_static_trace_id(dev, id);
>>>
>>> Please could we not directly use :
>>>
>>> fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", 
>>> &traceid) in the dummy driver ?
> 
>      return fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace- 
> id", id);
> 
> 
> Suzuki
> 
> 
>>>
>>> The rest looks fine to me.
>>>
>>> Suzuki
>>>
>>>
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
>>>> +
>>>>   struct coresight_platform_data *
>>>>   coresight_get_platform_data(struct device *dev)
>>>>   {
>>>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/ 
>>>> drivers/hwtracing/coresight/coresight-trace-id.c
>>>> index af5b4ef59cea..ca3c3de4683e 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
>>>> @@ -11,6 +11,12 @@
>>>>   #include "coresight-trace-id.h"
>>>> +enum trace_id_flags {
>>>> +    TRACE_ID_ANY = 0x0,
>>>> +    TRACE_ID_PREFER_ODD = 0x1,
>>>> +    TRACE_ID_REQ_STATIC = 0x2,
>>>> +};
>>>> +
>>>>   /* Default trace ID map. Used on systems that don't require per 
>>>> sink mappings */
>>>>   static struct coresight_trace_id_map id_map_default;
>>>> @@ -80,16 +86,19 @@ static int coresight_trace_id_find_odd_id(struct 
>>>> coresight_trace_id_map *id_map)
>>>>    * Otherwise allocate next available ID.
>>>>    */
>>>>   static int coresight_trace_id_alloc_new_id(struct 
>>>> coresight_trace_id_map *id_map,
>>>> -                       int preferred_id, bool prefer_odd_id)
>>>> +                       int preferred_id, unsigned int flags)
>>>>   {
>>>>       int id = 0;
>>>>       /* for backwards compatibility, cpu IDs may use preferred 
>>>> value */
>>>> -    if (IS_VALID_CS_TRACE_ID(preferred_id) &&
>>>> -        !test_bit(preferred_id, id_map->used_ids)) {
>>>> -        id = preferred_id;
>>>> -        goto trace_id_allocated;
>>>> -    } else if (prefer_odd_id) {
>>>> +    if (IS_VALID_CS_TRACE_ID(preferred_id)) {
>>>> +        if (!test_bit(preferred_id, id_map->used_ids)) {
>>>> +            id = preferred_id;
>>>> +            goto trace_id_allocated;
>>>> +        } else if (WARN((flags & TRACE_ID_REQ_STATIC), "Trace ID %d 
>>>> is used.\n",
>>>> +                    preferred_id))
>>>> +            return -EINVAL;
>>>> +    } else if (flags & TRACE_ID_PREFER_ODD) {
>>>>       /* may use odd ids to avoid preferred legacy cpu IDs */
>>>>           id = coresight_trace_id_find_odd_id(id_map);
>>>>           if (id)
>>>> @@ -175,7 +184,7 @@ static int coresight_trace_id_map_get_cpu_id(int 
>>>> cpu, struct coresight_trace_id_
>>>>        */
>>>>       id = coresight_trace_id_alloc_new_id(id_map,
>>>>                            CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
>>>> -                         false);
>>>> +                         TRACE_ID_ANY);
>>>>       if (!IS_VALID_CS_TRACE_ID(id))
>>>>           goto get_cpu_id_out_unlock;
>>>> @@ -222,14 +231,15 @@ static void 
>>>> coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
>>>>       DUMP_ID_MAP(id_map);
>>>>   }
>>>> -static int coresight_trace_id_map_get_system_id(struct 
>>>> coresight_trace_id_map *id_map)
>>>> +static int coresight_trace_id_map_get_system_id(struct 
>>>> coresight_trace_id_map *id_map,
>>>> +                    int preferred_id, unsigned int traceid_flags)
>>>>   {
>>>>       unsigned long flags;
>>>>       int id;
>>>>       spin_lock_irqsave(&id_map_lock, flags);
>>>>       /* prefer odd IDs for system components to avoid legacy CPU 
>>>> IDS */
>>>> -    id = coresight_trace_id_alloc_new_id(id_map, 0, true);
>>>> +    id = coresight_trace_id_alloc_new_id(id_map, preferred_id, 
>>>> traceid_flags);
>>>>       spin_unlock_irqrestore(&id_map_lock, flags);
>>>>       DUMP_ID(id);
>>>> @@ -271,10 +281,18 @@ 
>>>> EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
>>>>   int coresight_trace_id_get_system_id(void)
>>>>   {
>>>> -    return coresight_trace_id_map_get_system_id(&id_map_default);
>>>> +    return coresight_trace_id_map_get_system_id(&id_map_default, 0,
>>>> +            TRACE_ID_PREFER_ODD);
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
>>>> +int coresight_trace_id_get_static_system_id(int trace_id)
>>>> +{
>>>> +    return coresight_trace_id_map_get_system_id(&id_map_default,
>>>> +            trace_id, TRACE_ID_REQ_STATIC);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
>>>> +
>>>>   void coresight_trace_id_put_system_id(int id)
>>>>   {
>>>>       coresight_trace_id_map_put_system_id(&id_map_default, id);
>>>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/ 
>>>> drivers/hwtracing/coresight/coresight-trace-id.h
>>>> index 3797777d367e..ca2fdf31c835 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
>>>> @@ -122,6 +122,15 @@ int coresight_trace_id_read_cpu_id(int cpu);
>>>>    */
>>>>   int coresight_trace_id_get_system_id(void);
>>>> +/**
>>>> + * Allocate a CoreSight static trace ID for a system component.
>>>> + *
>>>> + * Used to allocate static IDs for system trace sources such as 
>>>> dummy source.
>>>> + *
>>>> + * return: Trace ID or -EINVAL if allocation is impossible.
>>>> + */
>>>> +int coresight_trace_id_get_static_system_id(int id);
>>>> +
>>>>   /**
>>>>    * Release an allocated system trace ID.
>>>>    *
>>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>>> index f09ace92176e..2cdc0b1cd536 100644
>>>> --- a/include/linux/coresight.h
>>>> +++ b/include/linux/coresight.h
>>>> @@ -643,6 +643,7 @@ void coresight_relaxed_write64(struct 
>>>> coresight_device *csdev,
>>>>   void coresight_write64(struct coresight_device *csdev, u64 val, 
>>>> u32 offset);
>>>>   extern int coresight_get_cpu(struct device *dev);
>>>> +extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
>>>>   struct coresight_platform_data *coresight_get_platform_data(struct 
>>>> device *dev);
>>>>   struct coresight_connection *
>>>
>>
> 


