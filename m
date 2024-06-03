Return-Path: <linux-arm-msm+bounces-21470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A088E8D7FA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55DD428D7C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549B582885;
	Mon,  3 Jun 2024 10:04:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672B9763E4;
	Mon,  3 Jun 2024 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409080; cv=none; b=mgPT7AX94oXaYcGHogrCOyt7+9gLFh706QB1uTkdVMp0Vr86mRIlWGiMFYudK0wi0ScZsO0lcxPDg/H74D+ziawn+F0pOF88CUsqEmJ76sXMAMUwhMJ2DnGTcAKv9Y+/7x9VkbDSmSpqRbLYgET8mSMw+rNasi8JW5Tg5sqRT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409080; c=relaxed/simple;
	bh=Yyjamq5fVatfQkYUI37mqc24+Gk56/U8JLXV7g9veNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LaU8cRJmkRYmbjdMfBuvvYasEBSl7DVpYKZstKhUa+erqLqFMFbsQ4qU+bocU7CFb3E/vZhhSC17XFByLh5Ljv6p2XDnkkPsqMmqYBG0VoTTXNRG36B046nURyzG+xEYg1dfPKOp70f2OB+jZURux2YvoUk1Tw6Ir06AqCUbigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D12B71042;
	Mon,  3 Jun 2024 03:05:00 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EA083F792;
	Mon,  3 Jun 2024 03:04:34 -0700 (PDT)
Message-ID: <e7c641ee-205f-46ef-9990-90414e50b485@arm.com>
Date: Mon, 3 Jun 2024 11:04:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: Add support to get preferred id for
 system trace sources
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20240603094354.2348-1-quic_jinlmao@quicinc.com>
 <20240603094354.2348-3-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240603094354.2348-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03/06/2024 10:43, Mao Jinlong wrote:
> Dynamic trace id was introduced in coresight subsystem, so trace id is
> allocated dynamically. However, some hardware ATB source has static trace
> id and it cannot be changed via software programming. For such source,
> it can call coresight_get_source_traceid to get the fixed trace id from
> device node and pass id to coresight_trace_id_get_system_id to reserve
> the id.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++++
>  drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
>  .../hwtracing/coresight/coresight-trace-id.c  | 32 ++++++++++++-------
>  .../hwtracing/coresight/coresight-trace-id.h  |  5 ++-
>  include/linux/coresight.h                     |  1 +
>  5 files changed, 53 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 9d550f5697fa..8dd3cbd676b8 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -183,6 +183,17 @@ static int of_coresight_get_cpu(struct device *dev)
>  	return cpu;
>  }
>  
> +/*
> + * of_coresight_get_trace_id: Get the atid of a source device.
> + *
> + * Returns 0 on success.
> + */
> +static int of_coresight_get_trace_id(struct device *dev, u32 *id)
> +{
> +
> +	return of_property_read_u32(dev->of_node, "trace-id", id);
> +}
> +
>  /*
>   * of_coresight_parse_endpoint : Parse the given output endpoint @ep
>   * and fill the connection information in @pdata->out_conns
> @@ -782,6 +793,12 @@ static inline int acpi_coresight_get_cpu(struct device *dev)
>  {
>  	return -ENODEV;
>  }
> +
> +static int of_coresight_get_trace_id(struct device *dev, u32 *id)
> +{
> +	return -ENODEV;
> +}
> +
>  #endif
>  
>  int coresight_get_cpu(struct device *dev)
> @@ -794,6 +811,15 @@ int coresight_get_cpu(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_cpu);
>  
> +int coresight_get_source_traceid(struct device *dev, u32 *id)
> +{
> +	if (!is_of_node(dev->fwnode))
> +		return -EINVAL;
> +
> +	return of_coresight_get_trace_id(dev, id);
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_source_traceid);
> +
>  struct coresight_platform_data *
>  coresight_get_platform_data(struct device *dev)
>  {
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index e1c62820dfda..802f9e4ae570 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -901,7 +901,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
>  		goto stm_unregister;
>  	}
>  
> -	trace_id = coresight_trace_id_get_system_id();
> +	trace_id = coresight_trace_id_get_system_id(0);

I would #define 0 to "TRACE_ID_ANY" or something like that so it's
obvious what it means.

>  	if (trace_id < 0) {
>  		ret = trace_id;
>  		goto cs_unregister;
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index af5b4ef59cea..5c25c75a2f08 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -75,20 +75,23 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
>   * Allocate new ID and set in use
>   *
>   * if @preferred_id is a valid id then try to use that value if available.
> + * if @only_preferred is true, if @preferred_id is used, return error EINVAL.

if @only_preferred is true @preferred_id must be free, otherwise return
error -EINVAL

>   * if @preferred_id is not valid and @prefer_odd_id is true, try for odd id.
>   *
>   * Otherwise allocate next available ID.
>   */
>  static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
> -					   int preferred_id, bool prefer_odd_id)
> +			   int preferred_id, bool prefer_odd_id, bool only_preferred)
>  {
>  	int id = 0;
>  
>  	/* for backwards compatibility, cpu IDs may use preferred value */
> -	if (IS_VALID_CS_TRACE_ID(preferred_id) &&
> -	    !test_bit(preferred_id, id_map->used_ids)) {
> -		id = preferred_id;
> -		goto trace_id_allocated;
> +	if (IS_VALID_CS_TRACE_ID(preferred_id)) {
> +		if (!test_bit(preferred_id, id_map->used_ids)) {
> +			id = preferred_id;
> +			goto trace_id_allocated;
> +		} else if (WARN(only_preferred, "Trace ID %d is used.\n", preferred_id))
> +			return -EINVAL;
>  	} else if (prefer_odd_id) {
>  	/* may use odd ids to avoid preferred legacy cpu IDs */
>  		id = coresight_trace_id_find_odd_id(id_map);
> @@ -175,7 +178,7 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
>  	 */
>  	id = coresight_trace_id_alloc_new_id(id_map,
>  					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
> -					     false);
> +					     false, false);
>  	if (!IS_VALID_CS_TRACE_ID(id))
>  		goto get_cpu_id_out_unlock;
>  
> @@ -222,14 +225,21 @@ static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
>  	DUMP_ID_MAP(id_map);
>  }
>  
> -static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
> +static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
> +				int preferred_id, bool only_preferred)

Looks like "only_preferred" was left on here by mistake and it's not
used. For this function preferred_id != 0 means the same.

>  {
>  	unsigned long flags;
>  	int id;
>  
>  	spin_lock_irqsave(&id_map_lock, flags);
> -	/* prefer odd IDs for system components to avoid legacy CPU IDS */
> -	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
> +
> +	if (preferred_id > 0) {
> +		/* use preferred id if it is available */
> +		id = coresight_trace_id_alloc_new_id(id_map, preferred_id, false, true);
> +	} else {
> +		/* prefer odd IDs for system components to avoid legacy CPU IDS */
> +		id = coresight_trace_id_alloc_new_id(id_map, 0, true, false);

prefer_odd_id is different in each of these calls which I think is a
mistake?

You could do one function call to avoid that:

  only_preferred = preferred_id > 0
  coresight_trace_id_alloc_new_id(id_map, preferred_id, true,
                                  only_preferred);


> +	}
>  	spin_unlock_irqrestore(&id_map_lock, flags);
>  
>  	DUMP_ID(id);
> @@ -269,9 +279,9 @@ int coresight_trace_id_read_cpu_id(int cpu)
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
>  
> -int coresight_trace_id_get_system_id(void)
> +int coresight_trace_id_get_system_id(int id)
>  {
> -	return coresight_trace_id_map_get_system_id(&id_map_default);
> +	return coresight_trace_id_map_get_system_id(&id_map_default, id, true);
>  }
>  EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
>  
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
> index 3797777d367e..9189a33c5857 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -118,9 +118,12 @@ int coresight_trace_id_read_cpu_id(int cpu);
>   *
>   * Used to allocate IDs for system trace sources such as STM.
>   *
> + * @id: Preferred id value. If id is 0, get a free id from id map. If id is greater

0 -> TRACE_ID_ANY

> + *      than 0, get a preferred id.
> + *
>   * return: Trace ID or -EINVAL if allocation is impossible.
>   */
> -int coresight_trace_id_get_system_id(void);
> +int coresight_trace_id_get_system_id(int id);
>  
>  /**
>   * Release an allocated system trace ID.
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index f09ace92176e..0599303be326 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -643,6 +643,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
>  void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
>  
>  extern int coresight_get_cpu(struct device *dev);
> +extern int coresight_get_source_traceid(struct device *dev, u32 *id);
>  
>  struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
>  struct coresight_connection *

