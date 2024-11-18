Return-Path: <linux-arm-msm+bounces-38205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC59D0E85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE107B2AB51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C286193428;
	Mon, 18 Nov 2024 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oPyh/LeJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FCF193427;
	Mon, 18 Nov 2024 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924898; cv=none; b=XJGNWJihgQb9rpyA1o4hRHc+qv8MzhNxglWHWh6Ut/AUeuY0zN04YV9nU9Ddk6jGH/NMyJmM0nppVMhPJ6+ZLJ1W3Rj2bIS1PEnbziEUQrmN5UKu+aLrHXLkArN+DEhtBf8W7yJiQOfegsRQMqsChLsuLdK9pxUtSoHKVd+aCn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924898; c=relaxed/simple;
	bh=ut5KPWPA1vOjsTE2pdurJqeJ2DSbGDmhBL19Qm5/4ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=op3f0h19Rk8u511ZE4w0sRjgImzNERMj24PRdJM338sJq+fdTatOx/BOz2dgDbM7YuH3BWtG7RNXA/Qiem3i+JWmFRAfu44WU6MD62rgNyqpjs0p00c30tPPyLJSnYtB2h/sUCZuRUy1lvE5tyYRHhNJwVIjS9YfIF4S62SVku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oPyh/LeJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5ReHp009605;
	Mon, 18 Nov 2024 10:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLCGYl7aeIAUgHUj7JXGwXqKfANL+dqFqE4tm+aKFvw=; b=oPyh/LeJPpOhsj8h
	9zXGrb/WGQwOnBVyKewrBPyVD0KEghqdYU/HGxDFWiSL5IOtRQ2zeZXellbYK3BM
	FkebV4PLjS64xrDy2823PA1LF1knjQrvgStosBS91eJlIhnHIsBBTox5FdFLjN2Z
	PYWltA3Gc5PQ9rFatvgMUG+dnJuMEfc72ePoTI7pWMrlUUsbh4jWidlNQc79jZ05
	v6EWh/14Hf7RhJvLr98ul+7iw30T+WqCGs1pGlsJ0pv+RHvI7+BDAboOrfh6TcNP
	mJDdE5KICcXojxbFDzzhDWWPQZT07WuVHVCzPNLYw0MNuClZaWpc8GWAAltwCTYN
	8UR9Pw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkrm44rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 10:14:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIAEgKZ014729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 10:14:42 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 02:14:38 -0800
Message-ID: <6a8e10fc-a231-467a-8056-d291e237fec1@quicinc.com>
Date: Mon, 18 Nov 2024 18:14:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] coresight: Add support to get static id for system
 trace sources
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
References: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
 <20241104115604.14522-3-quic_jinlmao@quicinc.com>
 <6424c536-2f2c-4a59-8b6d-f610201dc7a7@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <6424c536-2f2c-4a59-8b6d-f610201dc7a7@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9OnMXSI3uNOE7pXzGCrZsVlLR6dzIOpY
X-Proofpoint-ORIG-GUID: 9OnMXSI3uNOE7pXzGCrZsVlLR6dzIOpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411180084



On 2024/11/13 21:27, Suzuki K Poulose wrote:
> On 04/11/2024 11:56, Mao Jinlong wrote:
>> Dynamic trace id was introduced in coresight subsystem, so trace id is
>> allocated dynamically. However, some hardware ATB source has static trace
>> id and it cannot be changed via software programming. For such source,
>> it can call coresight_get_static_trace_id to get the fixed trace id from
>> device node and pass id to coresight_trace_id_get_static_system_id to
>> reserve the id.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> ---
>>   .../hwtracing/coresight/coresight-platform.c  |  6 +++
>>   .../hwtracing/coresight/coresight-trace-id.c  | 39 +++++++++++++------
>>   .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
>>   include/linux/coresight.h                     |  1 +
>>   4 files changed, 44 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/ 
>> drivers/hwtracing/coresight/coresight-platform.c
>> index 64e171eaad82..633d96b9577a 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -796,6 +796,12 @@ int coresight_get_cpu(struct device *dev)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_cpu);
>> +int coresight_get_static_trace_id(struct device *dev, u32 *id)
>> +{
>> +    return fwnode_property_read_u32(dev_fwnode(dev), "arm,static- 
>> trace-id", id);
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
>> +
>>   struct coresight_platform_data *
>>   coresight_get_platform_data(struct device *dev)
>>   {
>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/ 
>> drivers/hwtracing/coresight/coresight-trace-id.c
>> index d98e12cb30ec..df8fe50b413f 100644
>> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
>> @@ -12,6 +12,12 @@
>>   #include "coresight-trace-id.h"
>> +enum trace_id_flags {
>> +    TRACE_ID_ANY = 0x0,
>> +    TRACE_ID_PREFER_ODD = 0x1,
>> +    TRACE_ID_REQ_STATIC = 0x2,
>> +};
>> +
>>   /* Default trace ID map. Used in sysfs mode and for system sources */
>>   static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = 
>> ATOMIC_INIT(0);
>>   static struct coresight_trace_id_map id_map_default = {
>> @@ -74,16 +80,18 @@ static int coresight_trace_id_find_odd_id(struct 
>> coresight_trace_id_map *id_map)
>>    * Otherwise allocate next available ID.
>>    */
>>   static int coresight_trace_id_alloc_new_id(struct 
>> coresight_trace_id_map *id_map,
>> -                       int preferred_id, bool prefer_odd_id)
>> +                       int preferred_id, unsigned int flags)
>>   {
>>       int id = 0;
>>       /* for backwards compatibility, cpu IDs may use preferred value */
>> -    if (IS_VALID_CS_TRACE_ID(preferred_id) &&
>> -        !test_bit(preferred_id, id_map->used_ids)) {
>> -        id = preferred_id;
>> -        goto trace_id_allocated;
>> -    } else if (prefer_odd_id) {
>> +    if (IS_VALID_CS_TRACE_ID(preferred_id)) {
>> +        if (!test_bit(preferred_id, id_map->used_ids)) {
>> +            id = preferred_id;
>> +            goto trace_id_allocated;
>> +        } else if (flags & TRACE_ID_REQ_STATIC)
>> +            return -EINVAL;
> 
> nit: EBUSY sounds like a better choice here ? Requested ID is not
> available.
> 
> Additionally, do we need to handle a case where the preferred_id is
> not valid ? I think we silently allocate a new trace id in such case ?
> 
> Rest looks good to me.
> 
> Suzuki
> 
> 

If preferred_id is not valid, a random id will be allocated for the 
source. For the normal source, 0 is provided here as preferred_id.

> 
> 
>> +    } else if (flags & TRACE_ID_PREFER_ODD) {
>>       /* may use odd ids to avoid preferred legacy cpu IDs */
>>           id = coresight_trace_id_find_odd_id(id_map);
>>           if (id)
>> @@ -153,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, 
>> struct coresight_trace_id_map
>>        */
>>       id = coresight_trace_id_alloc_new_id(id_map,
>>                            CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
>> -                         false);
>> +                         TRACE_ID_ANY);
>>       if (!IS_VALID_CS_TRACE_ID(id))
>>           goto get_cpu_id_out_unlock;
>> @@ -188,14 +196,14 @@ static void _coresight_trace_id_put_cpu_id(int 
>> cpu, struct coresight_trace_id_ma
>>       DUMP_ID_MAP(id_map);
>>   }
>> -static int coresight_trace_id_map_get_system_id(struct 
>> coresight_trace_id_map *id_map)
>> +static int coresight_trace_id_map_get_system_id(struct 
>> coresight_trace_id_map *id_map,
>> +                    int preferred_id, unsigned int traceid_flags)
>>   {
>>       unsigned long flags;
>>       int id;
>>       spin_lock_irqsave(&id_map->lock, flags);
>> -    /* prefer odd IDs for system components to avoid legacy CPU IDS */
>> -    id = coresight_trace_id_alloc_new_id(id_map, 0, true);
>> +    id = coresight_trace_id_alloc_new_id(id_map, preferred_id, 
>> traceid_flags);
>>       spin_unlock_irqrestore(&id_map->lock, flags);
>>       DUMP_ID(id);
>> @@ -255,10 +263,19 @@ 
>> EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
>>   int coresight_trace_id_get_system_id(void)
>>   {
>> -    return coresight_trace_id_map_get_system_id(&id_map_default);
>> +    /* prefer odd IDs for system components to avoid legacy CPU IDS */
>> +    return coresight_trace_id_map_get_system_id(&id_map_default, 0,
>> +            TRACE_ID_PREFER_ODD);
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
>> +int coresight_trace_id_get_static_system_id(int trace_id)
>> +{
>> +    return coresight_trace_id_map_get_system_id(&id_map_default,
>> +            trace_id, TRACE_ID_REQ_STATIC);
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
>> +
>>   void coresight_trace_id_put_system_id(int id)
>>   {
>>       coresight_trace_id_map_put_system_id(&id_map_default, id);
>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/ 
>> drivers/hwtracing/coresight/coresight-trace-id.h
>> index 9aae50a553ca..db68e1ec56b6 100644
>> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
>> @@ -116,6 +116,15 @@ int coresight_trace_id_read_cpu_id_map(int cpu, 
>> struct coresight_trace_id_map *i
>>    */
>>   int coresight_trace_id_get_system_id(void);
>> +/**
>> + * Allocate a CoreSight static trace ID for a system component.
>> + *
>> + * Used to allocate static IDs for system trace sources such as dummy 
>> source.
>> + *
>> + * return: Trace ID or -EINVAL if allocation is impossible.
>> + */
>> +int coresight_trace_id_get_static_system_id(int id);
>> +
>>   /**
>>    * Release an allocated system trace ID.
>>    *
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index c13342594278..129795873072 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -662,6 +662,7 @@ void coresight_relaxed_write64(struct 
>> coresight_device *csdev,
>>   void coresight_write64(struct coresight_device *csdev, u64 val, u32 
>> offset);
>>   extern int coresight_get_cpu(struct device *dev);
>> +extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
>>   struct coresight_platform_data *coresight_get_platform_data(struct 
>> device *dev);
>>   struct coresight_connection *
> 


