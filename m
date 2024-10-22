Return-Path: <linux-arm-msm+bounces-35385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3339A9F16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 137F7282AF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D63186E43;
	Tue, 22 Oct 2024 09:48:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9388198E65;
	Tue, 22 Oct 2024 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590496; cv=none; b=DUWraph5r9UVUOUSu4aCsSWATfORv23UfCaV8oF4j3uBihYeg+aNes0slz1Ei0dOmxjNi3jw3hLhl+IEm/H+m5NIWKB/8ueCZ8yf0db5uJLCXKIWMKu/m5OSS9DxuWyNWJQWsK0n4KB2kzbOPrgDi62pWSgZubpi5qY0Q9fW0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590496; c=relaxed/simple;
	bh=0suzZ39Hj4+KJXxSetbK6Oe2wAkfyYT4JnhGHgvo9lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/IpGvK0z9iEGFMP2IJ+TXbIisBwvuMQ9TJa0p5KVTh8u2NmoOp4YNI+OcmKLpEqcnEruW08F3Th9hnN0l3hXfmICKn89fPGmcosPLIZRZ6x4p31tSbFgaXlVzKzqu4kQjArq4+kSyiJ4gF9JV8pz72TTOOm8RuMz+84h3bYXUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1BD1497;
	Tue, 22 Oct 2024 02:48:43 -0700 (PDT)
Received: from [10.1.35.72] (Suzukis-MBP.cambridge.arm.com [10.1.35.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 474B33F73B;
	Tue, 22 Oct 2024 02:48:12 -0700 (PDT)
Message-ID: <2f928199-3190-4c44-9e0b-d02c8b140f9c@arm.com>
Date: Tue, 22 Oct 2024 10:48:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] coresight: Add support to get static id for system
 trace sources
Content-Language: en-GB
To: Mike Leach <mike.leach@linaro.org>
Cc: Mao Jinlong <quic_jinlmao@quicinc.com>, James Clark
 <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241018032217.39728-1-quic_jinlmao@quicinc.com>
 <20241018032217.39728-3-quic_jinlmao@quicinc.com>
 <67ff561d-cc24-47d7-b983-3cd20bdf289b@arm.com>
 <CAJ9a7VgQX0ZGxLyVDtBrymi0tpqS_r1TKx3k4Wo1Ea35j9k+dA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAJ9a7VgQX0ZGxLyVDtBrymi0tpqS_r1TKx3k4Wo1Ea35j9k+dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2024 10:42, Mike Leach wrote:
> On Mon, 21 Oct 2024 at 13:09, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> On 18/10/2024 04:22, Mao Jinlong wrote:
>>> Dynamic trace id was introduced in coresight subsystem, so trace id is
>>> allocated dynamically. However, some hardware ATB source has static trace
>>> id and it cannot be changed via software programming. For such source,
>>> it can call coresight_get_static_trace_id to get the fixed trace id from
>>> device node and pass id to coresight_trace_id_get_static_system_id to
>>> reserve the id.
>>>
>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>> ---
>>>    .../hwtracing/coresight/coresight-platform.c  |  9 +++++
>>>    .../hwtracing/coresight/coresight-trace-id.c  | 38 ++++++++++++++-----
>>>    .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
>>>    include/linux/coresight.h                     |  1 +
>>>    4 files changed, 47 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>>> index 64e171eaad82..b03aa43d3cba 100644
>>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>>> @@ -796,6 +796,15 @@ int coresight_get_cpu(struct device *dev)
>>>    }
>>>    EXPORT_SYMBOL_GPL(coresight_get_cpu);
>>>
>>> +int coresight_get_static_trace_id(struct device *dev, u32 *id)
>>> +{
>>> +     if (!is_of_node(dev->fwnode))
>>> +             return -EINVAL;
>>> +
>>
>> You don't need this check, with the fwnode_property_read(). Rest looks
>> fine to me.
>>
>> Suzuki
>>
>>
>>
>>> +     return fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", id);
>>> +}
>>> +EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
>>> +
>>>    struct coresight_platform_data *
>>>    coresight_get_platform_data(struct device *dev)
>>>    {
>>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
>>> index d98e12cb30ec..269a5f7b279f 100644
>>> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
>>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
>>> @@ -12,6 +12,12 @@
>>>
>>>    #include "coresight-trace-id.h"
>>>
>>> +enum trace_id_flags {
>>> +     TRACE_ID_ANY = 0x0,
>>> +     TRACE_ID_PREFER_ODD = 0x1,
>>> +     TRACE_ID_REQ_STATIC = 0x2,
>>> +};
>>> +
>>>    /* Default trace ID map. Used in sysfs mode and for system sources */
>>>    static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
>>>    static struct coresight_trace_id_map id_map_default = {
>>> @@ -74,16 +80,19 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
>>>     * Otherwise allocate next available ID.
>>>     */
>>>    static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
>>> -                                        int preferred_id, bool prefer_odd_id)
>>> +                                        int preferred_id, unsigned int flags)
>>>    {
>>>        int id = 0;
>>>
>>>        /* for backwards compatibility, cpu IDs may use preferred value */
>>> -     if (IS_VALID_CS_TRACE_ID(preferred_id) &&
>>> -         !test_bit(preferred_id, id_map->used_ids)) {
>>> -             id = preferred_id;
>>> -             goto trace_id_allocated;
>>> -     } else if (prefer_odd_id) {
>>> +     if (IS_VALID_CS_TRACE_ID(preferred_id)) {
>>> +             if (!test_bit(preferred_id, id_map->used_ids)) {
>>> +                     id = preferred_id;
>>> +                     goto trace_id_allocated;
>>> +             } else if (WARN((flags & TRACE_ID_REQ_STATIC), "Trace ID %d is used.\n",
> 
> If another version of this set is done, then consider making this
> message more specific - e.g.  "Requested Static Trace ID %d is not
> available"

Actually this reminds me, we shouldn't WARN() here, and that too for
such minor error case. WARN() could result in panic() and as such the 
system is functional with this error and should be avoided.
We should leave it to the user of the call to log the error, so that
it is easier to understand which device failed to probe and why.

Agree with the rest of the comments from Mike

Suzuki


> 
>>> +                                     preferred_id))
>>> +                     return -EINVAL;
>>> +     } else if (flags & TRACE_ID_PREFER_ODD) {
>>>        /* may use odd ids to avoid preferred legacy cpu IDs */
>>>                id = coresight_trace_id_find_odd_id(id_map);
>>>                if (id)
>>> @@ -153,7 +162,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>>>         */
>>>        id = coresight_trace_id_alloc_new_id(id_map,
>>>                                             CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
>>> -                                          false);
>>> +                                          TRACE_ID_ANY);
>>>        if (!IS_VALID_CS_TRACE_ID(id))
>>>                goto get_cpu_id_out_unlock;
>>>
>>> @@ -188,14 +197,15 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
>>>        DUMP_ID_MAP(id_map);
>>>    }
>>>
>>> -static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
>>> +static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
>>> +                                     int preferred_id, unsigned int traceid_flags)
>>>    {
>>>        unsigned long flags;
>>>        int id;
>>>
>>>        spin_lock_irqsave(&id_map->lock, flags);
>>>        /* prefer odd IDs for system components to avoid legacy CPU IDS */
> 
> This comment now belongs in coresight_trace_id_get_system_id()
> 
>>> -     id = coresight_trace_id_alloc_new_id(id_map, 0, true);
>>> +     id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
>>>        spin_unlock_irqrestore(&id_map->lock, flags);
>>>
>>>        DUMP_ID(id);
>>> @@ -255,10 +265,18 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
>>>
>>>    int coresight_trace_id_get_system_id(void)
>>>    {
>>> -     return coresight_trace_id_map_get_system_id(&id_map_default);
>>> +     return coresight_trace_id_map_get_system_id(&id_map_default, 0,
>>> +                     TRACE_ID_PREFER_ODD);
>>>    }
>>>    EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
>>>
>>> +int coresight_trace_id_get_static_system_id(int trace_id)
>>> +{
>>> +     return coresight_trace_id_map_get_system_id(&id_map_default,
>>> +                     trace_id, TRACE_ID_REQ_STATIC);
>>> +}
>>> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
>>> +
>>>    void coresight_trace_id_put_system_id(int id)
>>>    {
>>>        coresight_trace_id_map_put_system_id(&id_map_default, id);
>>> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
>>> index 9aae50a553ca..db68e1ec56b6 100644
>>> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
>>> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
>>> @@ -116,6 +116,15 @@ int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *i
>>>     */
>>>    int coresight_trace_id_get_system_id(void);
>>>
>>> +/**
>>> + * Allocate a CoreSight static trace ID for a system component.
>>> + *
>>> + * Used to allocate static IDs for system trace sources such as dummy source.
>>> + *
>>> + * return: Trace ID or -EINVAL if allocation is impossible.
>>> + */
>>> +int coresight_trace_id_get_static_system_id(int id);
>>> +
>>>    /**
>>>     * Release an allocated system trace ID.
>>>     *
>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>> index c13342594278..129795873072 100644
>>> --- a/include/linux/coresight.h
>>> +++ b/include/linux/coresight.h
>>> @@ -662,6 +662,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
>>>    void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
>>>
>>>    extern int coresight_get_cpu(struct device *dev);
>>> +extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
>>>
>>>    struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
>>>    struct coresight_connection *
>>
> 
> Other than minor issues above...
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 


