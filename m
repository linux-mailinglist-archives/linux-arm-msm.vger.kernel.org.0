Return-Path: <linux-arm-msm+bounces-84252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B99CA0A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 18:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA8334F13FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 17:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADF2358D08;
	Wed,  3 Dec 2025 16:20:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235F03587A1;
	Wed,  3 Dec 2025 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778855; cv=none; b=jetfBdc+tNg1c3opsTAUT3QSMeI2IOgVqFXdVrB8oV6Lyontouoh9Cmq1L12W6NFLpy6cKrHyEsJ4wkPgsYrWYrHwSxqAIzeCjlkDiCO5xV8a1zIkpskyh+LygGo/RfKOaGG/o1vMPXdzHl4BPyVc3HlbqweHJizEhZrxn76ZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778855; c=relaxed/simple;
	bh=fZMwO4ZImiY5AYgAI7ScUieP1N0kV9afO6GzczmTTZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uDEZrozY6TIz1OoLhNwCHA25fwycRZvuiaX4tcKSdNxlZAEoCK12/kUoW4h0HaHAdX14J5ZhxAaZepc6cziCkQZ5ExSdCp4//oVxoXv6he4hy0YJqFV6iZ2dmmTYp6beXg19IVtfHEEujvqSW/aRR8atMkp7VxoXCmgyp+CQusI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FA33339;
	Wed,  3 Dec 2025 08:20:43 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09AB03F66E;
	Wed,  3 Dec 2025 08:20:48 -0800 (PST)
Message-ID: <9d163813-068b-4921-87fe-8e229692ba2b@arm.com>
Date: Wed, 3 Dec 2025 16:20:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] coresight: tmc: add etr_buf_list to store
 allocated etr_buf
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2025 03:01, Jie Gan wrote:
> Add a list to store allocated etr_buf.
> 
> The byte-cntr functionality requires two etr_buf to receive trace data.
> The active etr_buf collects the trace data from source device, while the
> byte-cntr reading function accesses the deactivated etr_buf after is
> has been filled and synced, transferring data to the userspace.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

This patch alone doesn't make any sense. Please fold it with a proper 
user (i.e. later patches). I can't make any sense of how this will be
used TBH without the following patches and on its own, it doesn't do
much anyways.

Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index be964656be93..4d249af93097 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		idr_init(&drvdata->idr);
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = &etr_devs;
> +		INIT_LIST_HEAD(&drvdata->etr_buf_list);
>   		break;
>   	case TMC_CONFIG_TYPE_ETF:
>   		desc.groups = coresight_etf_groups;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..292e25d82b62 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>   	s64		len;
>   };
>   
> +/**
> + * @sysfs_buf:	Allocated sysfs_buf.
> + * @is_free:	Indicates whether the buffer is free to choose.
> + * @pos:	Position of the buffer.
> + * @node:	Node in etr_buf_list.
> + */
> +struct etr_buf_node {
> +	struct etr_buf		*sysfs_buf;
> +	bool			is_free;
> +	loff_t			pos;
> +	struct list_head	node;
> +};
> +
>   /**
>    * struct tmc_drvdata - specifics associated to an TMC component
>    * @pclk:	APB clock if present, otherwise NULL
> @@ -242,6 +255,8 @@ struct tmc_resrv_buf {
>    *		(after crash) by default.
>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>    *		 Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
> + * @reading_node: Available buffer for byte-cntr reading.
>    */
>   struct tmc_drvdata {
>   	struct clk		*pclk;
> @@ -271,6 +286,8 @@ struct tmc_drvdata {
>   	struct etr_buf		*perf_buf;
>   	struct tmc_resrv_buf	resrv_buf;
>   	struct tmc_resrv_buf	crash_mdata;
> +	struct list_head        etr_buf_list;
> +	struct etr_buf_node     *reading_node;
>   };
>   
>   struct etr_buf_operations {
> 


