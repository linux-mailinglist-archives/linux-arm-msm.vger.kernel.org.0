Return-Path: <linux-arm-msm+bounces-49491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E9A45E00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4C861885B66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CF52192F0;
	Wed, 26 Feb 2025 11:55:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F8F212D67;
	Wed, 26 Feb 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740570951; cv=none; b=O69vMa7uAoR4DnVFKyNgoZioCWga5FV0N6F29aef7Hs+nTjTjlPvJJfHb8wodHBJVqgggMewtOyCYshUxv9aJ3LWdaMXyK989y5qCpGXNPH5ZySedcRkCtu1WW9FQ/GAgf3+NwYnx0ZxKXa7jOf3iJNimpdNy7swwYR7oabN7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740570951; c=relaxed/simple;
	bh=jbHQK301dzYzqlCeR9tMhQ7C/BKSlI9rFj3QbZTlF9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exH6OewDXeArKGKAUqgN8EXSS2JKicu116f4cSmsr5Dp66tMSRY670nsA2GoI1PopcDU7uXt8t+i198u547KWRnk4+VxDMQo0cM4hTMgdEEuBl6kGrBAPmFJKs6PMNpUuXI+Fw7gNCZiqmfp4jHjBeOwdprH4XrxvUgw1Pziig8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD60106F;
	Wed, 26 Feb 2025 03:56:03 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB17A3F6A8;
	Wed, 26 Feb 2025 03:55:45 -0800 (PST)
Message-ID: <abad8cd1-2436-416b-9db8-3c5e9eb38d73@arm.com>
Date: Wed, 26 Feb 2025 11:55:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 02/10] Coresight: Add trace_id function to retrieving
 the trace ID
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250226041342.53933-1-quic_jiegan@quicinc.com>
 <20250226041342.53933-3-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250226041342.53933-3-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/2025 04:13, Jie Gan wrote:
> Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
> the device's trace ID.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 27 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-dummy.c | 13 ++++++++-
>   .../coresight/coresight-etm3x-core.c          |  1 +
>   .../coresight/coresight-etm4x-core.c          |  1 +
>   drivers/hwtracing/coresight/coresight-stm.c   | 11 ++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 ++++++++
>   include/linux/coresight.h                     |  5 ++++
>   7 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0a9380350fb5..6cad777757f3 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -23,6 +23,7 @@
>   #include "coresight-etm-perf.h"
>   #include "coresight-priv.h"
>   #include "coresight-syscfg.h"
> +#include "coresight-trace-id.h"
>   
>   /*
>    * Mutex used to lock all sysfs enable and disable actions and loading and
> @@ -1515,6 +1516,32 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>   }
>   EXPORT_SYMBOL_GPL(coresight_remove_driver);
>   
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +			       struct coresight_device *sink)
> +{
> +	int trace_id;
> +	int cpu = source_ops(csdev)->cpu_id(csdev);
> +
> +	switch (mode) {
> +	case CS_MODE_SYSFS:
> +		trace_id = coresight_trace_id_get_cpu_id(cpu);
> +		break;
> +	case CS_MODE_PERF:

Please could we handle a case where "sink" may be passed NULL ?

		if (WARN_ON(!sink))
			return -EINVAL;

Sorry, didn't spot that in the last review.

Suzuki


> +		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);

> +		break;
> +	default:
> +		trace_id = -EINVAL;
> +		break;
> +	}
> +
> +	if (!IS_VALID_CS_TRACE_ID(trace_id))
> +		dev_err(&csdev->dev,
> +			"Failed to allocate trace ID on CPU%d\n", cpu);
> +
> +	return trace_id;
> +}
> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
> +
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index 9be53be8964b..b5692ba358c1 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
>   	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>   }
>   
> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +				 __maybe_unused struct coresight_device *sink)
> +{
> +	struct dummy_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->traceid;
> +}
> +
>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
>   				void *data)
>   {
> @@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
>   };
>   
>   static const struct coresight_ops dummy_source_cs_ops = {
> -	.source_ops = &dummy_source_ops,
> +	.trace_id	= dummy_source_trace_id,
> +	.source_ops	= &dummy_source_ops,
>   };
>   
>   static const struct coresight_ops_sink dummy_sink_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index c103f4c70f5d..c1dda4bc4a2f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
>   };
>   
>   static const struct coresight_ops etm_cs_ops = {
> +	.trace_id	= coresight_etm_get_trace_id,
>   	.source_ops	= &etm_source_ops,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2c1a60577728..cfd116b87460 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
>   };
>   
>   static const struct coresight_ops etm4_cs_ops = {
> +	.trace_id	= coresight_etm_get_trace_id,
>   	.source_ops	= &etm4_source_ops,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index b581a30a1cd9..aca25b5e3be2 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
>   	}
>   }
>   
> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +			__maybe_unused struct coresight_device *sink)
> +{
> +	struct stm_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->traceid;
> +}
> +
>   static const struct coresight_ops_source stm_source_ops = {
>   	.enable		= stm_enable,
>   	.disable	= stm_disable,
>   };
>   
>   static const struct coresight_ops stm_cs_ops = {
> +	.trace_id	= stm_trace_id,
>   	.source_ops	= &stm_source_ops,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 189a4abc2561..68079169b11b 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
>   	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>   }
>   
> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +			 __maybe_unused struct coresight_device *sink)
> +{
> +	struct tpda_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->atid;
> +}
> +
>   static const struct coresight_ops_link tpda_link_ops = {
>   	.enable		= tpda_enable,
>   	.disable	= tpda_disable,
>   };
>   
>   static const struct coresight_ops tpda_cs_ops = {
> +	.trace_id	= tpda_trace_id,
>   	.link_ops	= &tpda_link_ops,
>   };
>   
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 157c4bd009a1..ce89ad24c2a2 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -335,6 +335,7 @@ enum cs_mode {
>   	CS_MODE_PERF,
>   };
>   
> +#define coresight_ops(csdev)	csdev->ops
>   #define source_ops(csdev)	csdev->ops->source_ops
>   #define sink_ops(csdev)		csdev->ops->sink_ops
>   #define link_ops(csdev)		csdev->ops->link_ops
> @@ -410,6 +411,8 @@ struct coresight_ops_helper {
>   };
>   
>   struct coresight_ops {
> +	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> +			struct coresight_device *sink);
>   	const struct coresight_ops_sink *sink_ops;
>   	const struct coresight_ops_link *link_ops;
>   	const struct coresight_ops_source *source_ops;
> @@ -697,4 +700,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>   
>   void coresight_remove_driver(struct amba_driver *amba_drv,
>   			     struct platform_driver *pdev_drv);
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +			       struct coresight_device *sink);
>   #endif		/* _LINUX_COREISGHT_H */


