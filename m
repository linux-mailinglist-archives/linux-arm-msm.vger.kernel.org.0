Return-Path: <linux-arm-msm+bounces-37785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5F9C70AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 14:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14927B22C81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE0E1E0E09;
	Wed, 13 Nov 2024 13:27:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BEB1DF992;
	Wed, 13 Nov 2024 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504432; cv=none; b=YIDXCbTQmJZkDwHnf7vgC8FXOhoYxpvizlmPwxLzh/aJKkFKlkDPovsW8rqgO7umuOEp2Wwlcs6gQlvXe4NGZPY2TCiOoycZuIue7Fv5vtqwkB9FLN8d+9fh2VGnjJxQmutnztKspOdICrXDtJ1L8JVIHm78BZDJKx8r4zLe8cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504432; c=relaxed/simple;
	bh=9d+e3lBIDxZImn7IN5EFIXhLnDccxYDpONKaPnp7V9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZkcYJRO1R5uR4o/n1/kpgiPZPuaKAZQTStIyap2j3wllJnJ1sCQ2U2JxrVTWT8dWyFkQ9Y93tTKT9rm5DOWZLC10JAG1ne3swWCedljSFgFAZ1HeZZ0A7GgLQqJ2jcl6pfRJwJHFuWv9nVy61f5/hUg75bsz6Q5daOhQrmgXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E1BC1655;
	Wed, 13 Nov 2024 05:27:38 -0800 (PST)
Received: from [10.1.29.78] (Suzukis-MBP.cambridge.arm.com [10.1.29.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAF6B3F66E;
	Wed, 13 Nov 2024 05:27:06 -0800 (PST)
Message-ID: <6424c536-2f2c-4a59-8b6d-f610201dc7a7@arm.com>
Date: Wed, 13 Nov 2024 13:27:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] coresight: Add support to get static id for system
 trace sources
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
 <20241104115604.14522-3-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241104115604.14522-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2024 11:56, Mao Jinlong wrote:
> Dynamic trace id was introduced in coresight subsystem, so trace id is
> allocated dynamically. However, some hardware ATB source has static trace
> id and it cannot be changed via software programming. For such source,
> it can call coresight_get_static_trace_id to get the fixed trace id from
> device node and pass id to coresight_trace_id_get_static_system_id to
> reserve the id.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> ---
>   .../hwtracing/coresight/coresight-platform.c  |  6 +++
>   .../hwtracing/coresight/coresight-trace-id.c  | 39 +++++++++++++------
>   .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
>   include/linux/coresight.h                     |  1 +
>   4 files changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 64e171eaad82..633d96b9577a 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -796,6 +796,12 @@ int coresight_get_cpu(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_cpu);
>   
> +int coresight_get_static_trace_id(struct device *dev, u32 *id)
> +{
> +	return fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", id);
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
> +
>   struct coresight_platform_data *
>   coresight_get_platform_data(struct device *dev)
>   {
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index d98e12cb30ec..df8fe50b413f 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -12,6 +12,12 @@
>   
>   #include "coresight-trace-id.h"
>   
> +enum trace_id_flags {
> +	TRACE_ID_ANY = 0x0,
> +	TRACE_ID_PREFER_ODD = 0x1,
> +	TRACE_ID_REQ_STATIC = 0x2,
> +};
> +
>   /* Default trace ID map. Used in sysfs mode and for system sources */
>   static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
>   static struct coresight_trace_id_map id_map_default = {
> @@ -74,16 +80,18 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
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
> +		} else if (flags & TRACE_ID_REQ_STATIC)
> +			return -EINVAL;

nit: EBUSY sounds like a better choice here ? Requested ID is not
available.

Additionally, do we need to handle a case where the preferred_id is
not valid ? I think we silently allocate a new trace id in such case ?

Rest looks good to me.

Suzuki




> +	} else if (flags & TRACE_ID_PREFER_ODD) {
>   	/* may use odd ids to avoid preferred legacy cpu IDs */
>   		id = coresight_trace_id_find_odd_id(id_map);
>   		if (id)
> @@ -153,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>   	 */
>   	id = coresight_trace_id_alloc_new_id(id_map,
>   					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
> -					     false);
> +					     TRACE_ID_ANY);
>   	if (!IS_VALID_CS_TRACE_ID(id))
>   		goto get_cpu_id_out_unlock;
>   
> @@ -188,14 +196,14 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
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
>   	spin_lock_irqsave(&id_map->lock, flags);
> -	/* prefer odd IDs for system components to avoid legacy CPU IDS */
> -	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
> +	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
>   	spin_unlock_irqrestore(&id_map->lock, flags);
>   
>   	DUMP_ID(id);
> @@ -255,10 +263,19 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
>   
>   int coresight_trace_id_get_system_id(void)
>   {
> -	return coresight_trace_id_map_get_system_id(&id_map_default);
> +	/* prefer odd IDs for system components to avoid legacy CPU IDS */
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
> index 9aae50a553ca..db68e1ec56b6 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -116,6 +116,15 @@ int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *i
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
> index c13342594278..129795873072 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -662,6 +662,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
>   void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
>   
>   extern int coresight_get_cpu(struct device *dev);
> +extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
>   
>   struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
>   struct coresight_connection *


