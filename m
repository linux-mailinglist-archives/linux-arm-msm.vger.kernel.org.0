Return-Path: <linux-arm-msm+bounces-33670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 748139965EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 960D31C20F39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B72018B470;
	Wed,  9 Oct 2024 09:50:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA8D18871D;
	Wed,  9 Oct 2024 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467434; cv=none; b=kM5isv4GdbFCd4UEEYIhaAPZUWYcKmdIOQ8oDXzWC0kY1xJDKc6AJNlaCqsmJdKABSLbIo2XG9FzkjApwEJeqIz8xfq9bPmI/GDsnnUG/k9bzGcBAv455j0wLa5i9mQ3UCcb5jdajuRDEWA6QpAbp6r7FRM7B1w+pGSjUVw3xDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467434; c=relaxed/simple;
	bh=FJSzfAm3LV03EFSa4ogCZb+9mDS+3lvz3Rd35hjGnI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0zx6Re8f3STy6LpeEDWy/chS8Ckz6Ltdlkf1sF3/xeod3WeQGrrQDALonynF+/78qvaJZFC11eyiUYyLkzVArLTS0rFSdAiYtijymzYjdRXxKPYnGeiRxlucXvHuy5mMQmlb8fOyXejQ2YJrRx1hO+CzP8xm3VRaNSFS/iRXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5655FEC;
	Wed,  9 Oct 2024 02:51:01 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF44F3F64C;
	Wed,  9 Oct 2024 02:50:30 -0700 (PDT)
Message-ID: <43612930-6c17-4c6f-bc4e-954bcfd7977e@arm.com>
Date: Wed, 9 Oct 2024 10:50:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 2/3] coresight: Add support to get static id for
 system trace sources
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
 <20240910100127.8948-3-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240910100127.8948-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2024 11:01, Mao Jinlong wrote:
> Dynamic trace id was introduced in coresight subsystem, so trace id is
> allocated dynamically. However, some hardware ATB source has static trace
> id and it cannot be changed via software programming. For such source,
> it can call coresight_get_static_trace_id to get the fixed trace id from
> device node and pass id to coresight_trace_id_get_static_system_id to
> reserve the id.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

This patch is technically doing two different things :

1. Support for reading the static traceid from the firmware. (users of 
which comes later in Dummy)

2. Support for allocating a "specific" traceid for system sources.


Both the names are a bit similar and could be confusing.

For (1), I don't think we need to add a helper like that. See my 
comments below, and drop all of that from here this patch.


> ---
>   .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++
>   .../hwtracing/coresight/coresight-trace-id.c  | 38 ++++++++++++++-----
>   .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
>   include/linux/coresight.h                     |  1 +
>   4 files changed, 64 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 64e171eaad82..703abf0fa3f9 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -183,6 +183,18 @@ static int of_coresight_get_cpu(struct device *dev)
>   	return cpu;
>   }
>   
> +/*
> + * of_coresight_get_trace_id: Get the atid of a source device.
> + *
> + * Returns 0 on success.
> + */
> +static int of_coresight_get_static_trace_id(struct device *dev, u32 *id)
> +{
> +
> +	return of_property_read_u32(dev->of_node, "arm,static-trace-id", id);
> +}
> +
> +
>   /*
>    * of_coresight_parse_endpoint : Parse the given output endpoint @ep
>    * and fill the connection information in @pdata->out_conns
> @@ -317,6 +329,11 @@ static inline int of_coresight_get_cpu(struct device *dev)
>   {
>   	return -ENODEV;
>   }
> +
> +static inline int of_coresight_get_static_trace_id(struct device *dev, u32 *id)
> +{
> +	return -ENODEV;
> +}
>   #endif


>   
>   #ifdef CONFIG_ACPI
> @@ -796,6 +813,15 @@ int coresight_get_cpu(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_cpu);
>   
> +int coresight_get_static_trace_id(struct device *dev, u32 *id)
> +{
> +	if (!is_of_node(dev->fwnode))
> +		return -EINVAL;
> +
> +	return of_coresight_get_static_trace_id(dev, id);

Please could we not directly use :

fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", 
&traceid) in the dummy driver ?

The rest looks fine to me.

Suzuki


> +}
> +EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
> +
>   struct coresight_platform_data *
>   coresight_get_platform_data(struct device *dev)
>   {
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index af5b4ef59cea..ca3c3de4683e 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -11,6 +11,12 @@
>   
>   #include "coresight-trace-id.h"
>   
> +enum trace_id_flags {
> +	TRACE_ID_ANY = 0x0,
> +	TRACE_ID_PREFER_ODD = 0x1,
> +	TRACE_ID_REQ_STATIC = 0x2,
> +};
> +
>   /* Default trace ID map. Used on systems that don't require per sink mappings */
>   static struct coresight_trace_id_map id_map_default;
>   
> @@ -80,16 +86,19 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
>    * Otherwise allocate next available ID.
>    */
>   static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
> -					   int preferred_id, bool prefer_odd_id)
> +					   int preferred_id, unsigned int flags)
>   {
>   	int id = 0;
>   
>   	/* for backwards compatibility, cpu IDs may use preferred value */
> -	if (IS_VALID_CS_TRACE_ID(preferred_id) &&
> -	    !test_bit(preferred_id, id_map->used_ids)) {
> -		id = preferred_id;
> -		goto trace_id_allocated;
> -	} else if (prefer_odd_id) {
> +	if (IS_VALID_CS_TRACE_ID(preferred_id)) {
> +		if (!test_bit(preferred_id, id_map->used_ids)) {
> +			id = preferred_id;
> +			goto trace_id_allocated;
> +		} else if (WARN((flags & TRACE_ID_REQ_STATIC), "Trace ID %d is used.\n",
> +					preferred_id))
> +			return -EINVAL;
> +	} else if (flags & TRACE_ID_PREFER_ODD) {
>   	/* may use odd ids to avoid preferred legacy cpu IDs */
>   		id = coresight_trace_id_find_odd_id(id_map);
>   		if (id)
> @@ -175,7 +184,7 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
>   	 */
>   	id = coresight_trace_id_alloc_new_id(id_map,
>   					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
> -					     false);
> +					     TRACE_ID_ANY);
>   	if (!IS_VALID_CS_TRACE_ID(id))
>   		goto get_cpu_id_out_unlock;
>   
> @@ -222,14 +231,15 @@ static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
>   	DUMP_ID_MAP(id_map);
>   }
>   
> -static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
> +static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
> +					int preferred_id, unsigned int traceid_flags)
>   {
>   	unsigned long flags;
>   	int id;
>   
>   	spin_lock_irqsave(&id_map_lock, flags);
>   	/* prefer odd IDs for system components to avoid legacy CPU IDS */
> -	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
> +	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
>   	spin_unlock_irqrestore(&id_map_lock, flags);
>   
>   	DUMP_ID(id);
> @@ -271,10 +281,18 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
>   
>   int coresight_trace_id_get_system_id(void)
>   {
> -	return coresight_trace_id_map_get_system_id(&id_map_default);
> +	return coresight_trace_id_map_get_system_id(&id_map_default, 0,
> +			TRACE_ID_PREFER_ODD);
>   }
>   EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
>   
> +int coresight_trace_id_get_static_system_id(int trace_id)
> +{
> +	return coresight_trace_id_map_get_system_id(&id_map_default,
> +			trace_id, TRACE_ID_REQ_STATIC);
> +}
> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
> +
>   void coresight_trace_id_put_system_id(int id)
>   {
>   	coresight_trace_id_map_put_system_id(&id_map_default, id);
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
> index 3797777d367e..ca2fdf31c835 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -122,6 +122,15 @@ int coresight_trace_id_read_cpu_id(int cpu);
>    */
>   int coresight_trace_id_get_system_id(void);
>   
> +/**
> + * Allocate a CoreSight static trace ID for a system component.
> + *
> + * Used to allocate static IDs for system trace sources such as dummy source.
> + *
> + * return: Trace ID or -EINVAL if allocation is impossible.
> + */
> +int coresight_trace_id_get_static_system_id(int id);
> +
>   /**
>    * Release an allocated system trace ID.
>    *
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index f09ace92176e..2cdc0b1cd536 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -643,6 +643,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
>   void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
>   
>   extern int coresight_get_cpu(struct device *dev);
> +extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
>   
>   struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
>   struct coresight_connection *


