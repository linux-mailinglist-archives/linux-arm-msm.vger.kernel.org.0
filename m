Return-Path: <linux-arm-msm+bounces-50201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587DA4E282
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 16:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFC644207B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1097D27933A;
	Tue,  4 Mar 2025 14:58:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D58238D25;
	Tue,  4 Mar 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100290; cv=none; b=HY0diqg1UsIh5vvfAdRMpKGEd+Mx5as4YQBYzie67JVfR34pAnH3rucXl2VCGTwMkBw0UcykM9sZqDWZ1zRJnExVYTV01ihIaln385e3xYi2qj6fCTxiyow/+6GEjMfbq0fO7/bapa6gXjjk19b3BlwezcWWFm36gAe0OHdjcwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100290; c=relaxed/simple;
	bh=Y3y5h144NLzUZfdA9H0nPD4iEVA9WsnNbmlS50uj06A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/asVRFbj0ACIweIA23npCJZB2emmzSGoVH7qBspb1hsSF+HhYJEbBp/4MgVSsDSOs2fZ5evgYA9cuVt/AznPcqckjohmHJI3A1BU902TTby43nHXihUQUj0b9/bonV1q6KfgdhDEj0ENjKuZcswm1syvXgDjMAAAxEHkferYWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57825FEC;
	Tue,  4 Mar 2025 06:58:20 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60E813F66E;
	Tue,  4 Mar 2025 06:58:03 -0800 (PST)
Message-ID: <8efe6176-44a2-4b3d-b9b5-855b26f00187@arm.com>
Date: Tue, 4 Mar 2025 14:58:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/10] Coresight: Allocate trace ID after building the
 path
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
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-6-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250303032931.2500935-6-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 03:29, Jie Gan wrote:
> The trace_id will be stored in coresight_path instead of being declared
> everywhere and allocated after building the path.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 44 +++++++++++++++++++
>   .../hwtracing/coresight/coresight-etm-perf.c  |  5 +--
>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +
>   drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++
>   4 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ed0e9368324d..6adc06995d76 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -655,6 +655,50 @@ static void coresight_drop_device(struct coresight_device *csdev)
>   	}
>   }
>   
> +/*
> + * coresight device will read their existing or alloc a trace ID, if their trace_id
> + * callback is set.
> + *
> + * Return 0 if the trace_id callback is not set.
> + * Return the result of the trace_id callback if it is set. The return value
> + * will be the trace_id if successful, and an error number if it fails.
> + */
> +static int coresight_get_trace_id(struct coresight_device *csdev,
> +				  enum cs_mode mode,
> +				  struct coresight_device *sink)
> +{
> +	if (coresight_ops(csdev)->trace_id)
> +		return coresight_ops(csdev)->trace_id(csdev, mode, sink);
> +
> +	return 0;
> +}
> +
> +/*
> + * Call this after creating the path and before enabling it. This leaves
> + * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
> + */
> +void coresight_path_assign_trace_id(struct coresight_path *path,
> +				    enum cs_mode mode)
> +{
> +	struct coresight_device *sink = coresight_get_sink(&path->path_list);
> +	struct coresight_node *nd;
> +	int trace_id;
> +
> +	list_for_each_entry(nd, &path->path_list, link) {
> +		/* Assign a trace ID to the path for the first device that wants to do it */
> +		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
> +
> +		/*
> +		 * 0 in this context is that it didn't want to assign so keep searching.
> +		 * Non 0 is either success or fail.
> +		*/

checkpatch complains:

WARNING: Block comments should align the * on each line 

#65: FILE: drivers/hwtracing/coresight/coresight-core.c:694: 

+                * Non 0 is either success or fail.
+               */


Please make sure to run the checkpatch on individual patches before 
submitting in the future. I will fix this up locally for now.

Kind regards
Suzuki



> +		if (trace_id != 0) {
> +			path->trace_id = trace_id;
> +			return;
> +		}
> +	}
> +}
> +
>   /**
>    * _coresight_build_path - recursively build a path from a @csdev to a sink.
>    * @csdev:	The device to start from.
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index b0426792f08a..134290ab622e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -319,7 +319,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   {
>   	u32 id, cfg_hash;
>   	int cpu = event->cpu;
> -	int trace_id;
>   	cpumask_t *mask;
>   	struct coresight_device *sink = NULL;
>   	struct coresight_device *user_sink = NULL, *last_sink = NULL;
> @@ -409,8 +408,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   		}
>   
>   		/* ensure we can allocate a trace ID for this CPU */
> -		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> -		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> +		coresight_path_assign_trace_id(path, CS_MODE_PERF);
> +		if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
>   			cpumask_clear_cpu(cpu, mask);
>   			coresight_release_path(path);
>   			continue;
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 27b7dc348d4a..2bea35bae0d4 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -152,6 +152,8 @@ int coresight_make_links(struct coresight_device *orig,
>   void coresight_remove_links(struct coresight_device *orig,
>   			    struct coresight_connection *conn);
>   u32 coresight_get_sink_id(struct coresight_device *csdev);
> +void coresight_path_assign_trace_id(struct coresight_path *path,
> +				   enum cs_mode mode);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>   extern int etm_readl_cp14(u32 off, unsigned int *val);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index cb4c39732d26..d03751bf3d8a 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -209,6 +209,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> +	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> +		goto err_path;
> +
>   	ret = coresight_enable_path(&path->path_list, CS_MODE_SYSFS, NULL);
>   	if (ret)
>   		goto err_path;


