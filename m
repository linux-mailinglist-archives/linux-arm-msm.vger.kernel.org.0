Return-Path: <linux-arm-msm+bounces-19936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA78C7786
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 15:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9B7282CF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 13:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D331474B0;
	Thu, 16 May 2024 13:23:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4490B145FE8;
	Thu, 16 May 2024 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715865798; cv=none; b=UodR9TzTnQPdPNUeRoroaTLH5dfiUHH1EmnFYE/MnuqUaI2s4ZLzfgdPC908RuUwLquVee6NLbyEQ0Wm7r0ef0W2trExMEt1IXTN/cAd5GERFQqZsHwjYvUq8aTOJYY8bA9DqXAA8ALIsanpBweMZ7seXhm/+YjwtX4WAI/WKDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715865798; c=relaxed/simple;
	bh=Y1AvYY7uVUas7KUObzhSPsROD8Q7ZE1ML5mVE5qee3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMgyNdaYWVSbZ8G3zX1vMMSMtpbZFKZF/kXZuhZ2vyXW09Qeku0CeiLyAcq2Fk254fPiW0XzBpkx0fqsi0+6FP/t5pU/2RcwJLC58NTp597WC79ht9DfTRYS1awdAo49HxWQUYB4cXthWM3qQoJ/d9GewaQ9jGUKjd9zbmzH2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FDA3DA7;
	Thu, 16 May 2024 06:23:38 -0700 (PDT)
Received: from [10.91.2.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7B0C3F7A6;
	Thu, 16 May 2024 06:23:11 -0700 (PDT)
Message-ID: <34e8c1b9-e351-46c9-abbc-2cef9d0a71db@arm.com>
Date: Thu, 16 May 2024 15:23:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: Add reserve trace id support
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
References: <20240516025644.4383-1-quic_jinlmao@quicinc.com>
 <20240516025644.4383-3-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240516025644.4383-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/05/2024 04:56, Mao Jinlong wrote:
> Dynamic trace id was introduced in coresight subsystem so trace id is
> allocated dynamically. However, some hardware ATB source has static trace
> id and it cannot be changed via software programming. Reserve trace id
> for this kind of hardware source.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++++++++
>  .../hwtracing/coresight/coresight-trace-id.c  | 24 +++++++++++++++++
>  .../hwtracing/coresight/coresight-trace-id.h  | 11 ++++++++
>  include/linux/coresight.h                     |  1 +
>  4 files changed, 62 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 9d550f5697fa..d3e22a2608df 100644
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
> @@ -315,6 +326,12 @@ static inline int of_coresight_get_cpu(struct device *dev)
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
>  #ifdef CONFIG_ACPI
> @@ -794,6 +811,15 @@ int coresight_get_cpu(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_cpu);
>  
> +int coresight_get_trace_id(struct device *dev, u32 *id)
> +{
> +	if (!is_of_node(dev->fwnode))
> +		return -EINVAL;
> +
> +	return of_coresight_get_trace_id(dev, id);
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_trace_id);
> +
>  struct coresight_platform_data *
>  coresight_get_platform_data(struct device *dev)
>  {
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index af5b4ef59cea..536a34e9de6f 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -110,6 +110,24 @@ static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map
>  	return id;
>  }
>  
> +static int coresight_trace_id_set(int id, struct coresight_trace_id_map *id_map)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&id_map_lock, flags);
> +
> +	if (WARN(!IS_VALID_CS_TRACE_ID(id), "Invalid Trace ID %d\n", id))
> +		return -EINVAL;
> +	if (WARN(test_bit(id, id_map->used_ids), "ID is already used: %d\n", id))
> +		return -EINVAL;

Do these returns not skip unlocking the spinlock?

It might be slightly fewer changes if we update the existing
coresight_trace_id_alloc_new_id() to add a new "only_preferred" option.

Then use the existing system id allocator which already handles the lock
and unlock properly:

  static int coresight_trace_id_map_get_system_id(struct
                             coresight_trace_id_map *id_map, int id,

                             bool only_preferred)
  {
  ...
	spin_lock_irqsave(&id_map_lock, flags);
	/* prefer odd IDs for system components to avoid legacy CPU IDS
	id = coresight_trace_id_alloc_new_id(id_map, id, true,
                                             only_preferred);
        spin_unlock_irqrestore(&id_map_lock, flags);
  ...

I suppose the end result is the same as your implementation, but it
trades making one existing function slightly more complicated instead of
adding some new ones.

