Return-Path: <linux-arm-msm+bounces-48750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27EA3E2DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC7C702263
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB44C212B0B;
	Thu, 20 Feb 2025 17:34:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92291D63D9;
	Thu, 20 Feb 2025 17:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072895; cv=none; b=AdzjBzhb8AECxSAmkTEOK+mjaQ1Vuh4ueQP7gq3eqyvaDuqoBQCHdAdfGilLPOfN0yBDX+slFrfQRwbBdwkBT7XTpDG6zbI6h6NBztS31i+/29vZW0qfIlHNgTg7gK0Vkk1WHJEeHUW2wuTUW9J0VoKFvEBWJfdh+27udPUYHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072895; c=relaxed/simple;
	bh=v4RRrtRPTGJ4wM00sp+dZ79bWBJClYQwZFtoZghwpek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLlQt3fpyd/SXgBlgOVY+KxRW+0j4vWonwukP0AbkHpEbJYSLCyVvtUdLVF4rd1itEgpjVb0/BmFZpxvKLm6W3lDAZN0fYx28cYLOLGuS5QTzAY22UHLQIjQwBJNJiYWMiTiVAErzG/P+aQcNULUokNdazP5XWgIxIMT++rNGzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4642716F3;
	Thu, 20 Feb 2025 09:35:10 -0800 (PST)
Received: from [10.57.36.38] (unknown [10.57.36.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AF4D3F5A1;
	Thu, 20 Feb 2025 09:34:49 -0800 (PST)
Message-ID: <168c214a-38a5-45d4-a776-d7819cbab9f3@arm.com>
Date: Thu, 20 Feb 2025 17:34:48 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/7] Coresight: Add trace_id function to retrieving
 the trace ID
Content-Language: en-GB
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
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-3-quic_jiegan@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250217093024.1133096-3-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/02/2025 09:30, Jie Gan wrote:
> Add 'trace_id' function pointer in ops. It's responsible for
> retrieving the device's trace ID.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>


minor nit: Given this is an optional callback, we could as well make
this a generic ops and avoid checking if it is a link/source etc. We
anyway check if the op is available before calling it.

i.e.:

struct coresight_ops {
+	int (*trace_id)(struct coresight *csdev,...);

	...
};


Suzuki



> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 27 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-dummy.c | 11 ++++++++
>   .../coresight/coresight-etm3x-core.c          |  1 +
>   .../coresight/coresight-etm4x-core.c          |  1 +
>   drivers/hwtracing/coresight/coresight-stm.c   | 11 ++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 ++++++++
>   include/linux/coresight.h                     |  8 ++++++
>   7 files changed, 70 insertions(+)
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
> index 9be53be8964b..c47f0382b943 100644
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
> @@ -59,6 +69,7 @@ static int dummy_sink_disable(struct coresight_device *csdev)
>   static const struct coresight_ops_source dummy_source_ops = {
>   	.enable	= dummy_source_enable,
>   	.disable = dummy_source_disable,
> +	.trace_id = dummy_source_trace_id,
>   };
>   
>   static const struct coresight_ops dummy_source_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index c103f4c70f5d..a38e72ef8e79 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -701,6 +701,7 @@ static const struct coresight_ops_source etm_source_ops = {
>   	.cpu_id		= etm_cpu_id,
>   	.enable		= etm_enable,
>   	.disable	= etm_disable,
> +	.trace_id	= coresight_etm_get_trace_id,
>   };
>   
>   static const struct coresight_ops etm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2c1a60577728..1a993d5380e7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1064,6 +1064,7 @@ static const struct coresight_ops_source etm4_source_ops = {
>   	.cpu_id		= etm4_cpu_id,
>   	.enable		= etm4_enable,
>   	.disable	= etm4_disable,
> +	.trace_id	= coresight_etm_get_trace_id,
>   };
>   
>   static const struct coresight_ops etm4_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index b581a30a1cd9..64fcfa916562 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -281,9 +281,20 @@ static void stm_disable(struct coresight_device *csdev,
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
> +	.trace_id	= stm_trace_id,
>   };
>   
>   static const struct coresight_ops stm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 189a4abc2561..d80b6427e5a6 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -241,9 +241,20 @@ static void tpda_disable(struct coresight_device *csdev,
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
> +	.trace_id	= tpda_trace_id,
>   };
>   
>   static const struct coresight_ops tpda_cs_ops = {
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 157c4bd009a1..70407d61262e 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -368,6 +368,7 @@ struct coresight_ops_sink {
>    * Operations available for links.
>    * @enable:	enables flow between iport and oport.
>    * @disable:	disables flow between iport and oport.
> + * @trace_id:	alloc or read the traceid.
>    */
>   struct coresight_ops_link {
>   	int (*enable)(struct coresight_device *csdev,
> @@ -376,6 +377,8 @@ struct coresight_ops_link {
>   	void (*disable)(struct coresight_device *csdev,
>   			struct coresight_connection *in,
>   			struct coresight_connection *out);
> +	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> +			struct coresight_device *sink);
>   };
>   
>   /**
> @@ -385,6 +388,7 @@ struct coresight_ops_link {
>    *		is associated to.
>    * @enable:	enables tracing for a source.
>    * @disable:	disables tracing for a source.
> + * @trace_id:	alloc or read the traceid.
>    */
>   struct coresight_ops_source {
>   	int (*cpu_id)(struct coresight_device *csdev);
> @@ -392,6 +396,8 @@ struct coresight_ops_source {
>   		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
>   	void (*disable)(struct coresight_device *csdev,
>   			struct perf_event *event);
> +	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> +			struct coresight_device *sink);
>   };
>   
>   /**
> @@ -697,4 +703,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>   
>   void coresight_remove_driver(struct amba_driver *amba_drv,
>   			     struct platform_driver *pdev_drv);
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +			       struct coresight_device *sink);
>   #endif		/* _LINUX_COREISGHT_H */


