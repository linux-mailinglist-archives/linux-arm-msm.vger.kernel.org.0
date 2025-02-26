Return-Path: <linux-arm-msm+bounces-49427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBACBA45663
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F1D16D16F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 07:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3F726A0CB;
	Wed, 26 Feb 2025 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ANC0BXXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F11267B7C;
	Wed, 26 Feb 2025 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740553696; cv=none; b=R2dy4Gqy60z/UVfjbQ5Ht7UFwr+jFeXZoQpx1R88h87eQbytqN9NdJYuJ80ce+ynHMlSugsbGfnstJlBKxdqUkPfqrl6Pi5OedmeyH8bW1NwMNj7gVzMgsqi3LaNnWSkaMvU/a5ZrdR/BRNCYhe9OTPFgVxam3mdYyEG7jqJKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740553696; c=relaxed/simple;
	bh=ILXOXM3GUWaIRgldxRSPGXU22v5YqI/NahDV4X1YUjQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=N+pU6Y0u8Rf3RJxy9OKx8ECu43ylnbQf0ORdf6fZ+zJYCfqm9nyUx8Zo2HLQHVcmuq6FilMzSNxcV6armq86HiKR60rLXGh2t8dcKgxkceWrBq2Rmzu0vWddPtZra/1/dlXgxBEM6DKbKADYyDhlCDTSiI+d6juWTnpa7Y/Bgxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ANC0BXXJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWs2n021581;
	Wed, 26 Feb 2025 07:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMg9Yh0EDtaJzfyyWdQsd1c3MrDq4N+t66FnN116ebA=; b=ANC0BXXJm4ermLfz
	ZSVN2zrmxKUxQXobVmcCk0BOm0DgsBLj5zCNUPvA2xMdTPgKO1ASn4qalgBKKZDh
	pDidFJ/S8gCXtmnqMzuPM+95lnrwy9YF6ZNNtNPFl0NG9fb/MyNjOf+Yj7jQ8cSX
	KBpdFh3XnPBD5BEkLuItWAh9EO8yHtUSrCYJ4nSUD1MBNnVPkqKs0jPQ4rgpzpWu
	Ol3uX9KOjpiE8k+yZmW8gLugAQsB27dYIATpsEv8DacaVscfj277Qns3vnJVysEm
	YwYQpwqExhg6KRQQynDBoF+r2bOJBpB2b0EAZ/t7/GIwD7lW8CdNZFxwQbaTy+i7
	OiyjrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkh232-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:07:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q77v0R026586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:07:57 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 23:07:52 -0800
Message-ID: <ffb2fdb8-7aa3-4e2b-aec7-07dc7fe26f7e@quicinc.com>
Date: Wed, 26 Feb 2025 15:07:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/10] Coresight: Change to read the trace ID from
 coresight_path
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250226041342.53933-1-quic_jiegan@quicinc.com>
 <20250226041342.53933-7-quic_jiegan@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250226041342.53933-7-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zLeOCtMhU4E7S7pJhyAPu-_YG5FpF6zC
X-Proofpoint-ORIG-GUID: zLeOCtMhU4E7S7pJhyAPu-_YG5FpF6zC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260056



On 2/26/2025 12:13 PM, Jie Gan wrote:
> The source device can directly read the trace ID from the coresight_path
> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id being
> deleted.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

Correct tags:
Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

> ---
>   drivers/hwtracing/coresight/coresight-dummy.c |  2 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  8 +--
>   drivers/hwtracing/coresight/coresight-etm.h   |  1 -
>   .../coresight/coresight-etm3x-core.c          | 54 +++----------------
>   .../coresight/coresight-etm4x-core.c          | 54 +++----------------
>   drivers/hwtracing/coresight/coresight-etm4x.h |  1 -
>   drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  7 +--
>   drivers/hwtracing/coresight/coresight-tpdm.c  |  2 +-
>   include/linux/coresight.h                     |  2 +-
>   10 files changed, 25 insertions(+), 108 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index b5692ba358c1..aaa92b5081e3 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -24,7 +24,7 @@ DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
>   
>   static int dummy_source_enable(struct coresight_device *csdev,
>   			       struct perf_event *event, enum cs_mode mode,
> -			       __maybe_unused struct coresight_trace_id_map *id_map)
> +			       __maybe_unused struct coresight_path *path)
>   {
>   	if (!coresight_take_mode(csdev, mode))
>   		return -EBUSY;
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 134290ab622e..300305d67a1d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -461,7 +461,6 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
>   	struct coresight_path *path;
>   	u64 hw_id;
> -	u8 trace_id;
>   
>   	if (!csdev)
>   		goto fail;
> @@ -504,8 +503,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		goto fail_end_stop;
>   
>   	/* Finally enable the tracer */
> -	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
> -				      &sink->perf_sink_id_map))
> +	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
>   		goto fail_disable_path;
>   
>   	/*
> @@ -515,13 +513,11 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
>   		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
>   
> -		trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
> -
>   		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
>   				CS_AUX_HW_ID_MAJOR_VERSION);
>   		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
>   				CS_AUX_HW_ID_MINOR_VERSION);
> -		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
> +		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
>   		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
>   
>   		perf_report_aux_output_id(event, hw_id);
> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> index e02c3ea972c9..171f1384f7c0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm.h
> +++ b/drivers/hwtracing/coresight/coresight-etm.h
> @@ -284,6 +284,5 @@ extern const struct attribute_group *coresight_etm_groups[];
>   void etm_set_default(struct etm_config *config);
>   void etm_config_trace_mode(struct etm_config *config);
>   struct etm_config *get_etm_config(struct etm_drvdata *drvdata);
> -int etm_read_alloc_trace_id(struct etm_drvdata *drvdata);
>   void etm_release_trace_id(struct etm_drvdata *drvdata);
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index c1dda4bc4a2f..8927bfaf3af2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -455,26 +455,6 @@ static int etm_cpu_id(struct coresight_device *csdev)
>   	return drvdata->cpu;
>   }
>   
> -int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
> -{
> -	int trace_id;
> -
> -	/*
> -	 * This will allocate a trace ID to the cpu,
> -	 * or return the one currently allocated.
> -	 *
> -	 * trace id function has its own lock
> -	 */
> -	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
> -	if (IS_VALID_CS_TRACE_ID(trace_id))
> -		drvdata->traceid = (u8)trace_id;
> -	else
> -		dev_err(&drvdata->csdev->dev,
> -			"Failed to allocate trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -	return trace_id;
> -}
> -
>   void etm_release_trace_id(struct etm_drvdata *drvdata)
>   {
>   	coresight_trace_id_put_cpu_id(drvdata->cpu);
> @@ -482,38 +462,22 @@ void etm_release_trace_id(struct etm_drvdata *drvdata)
>   
>   static int etm_enable_perf(struct coresight_device *csdev,
>   			   struct perf_event *event,
> -			   struct coresight_trace_id_map *id_map)
> +			   struct coresight_path *path)
>   {
>   	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	int trace_id;
>   
>   	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
>   		return -EINVAL;
>   
>   	/* Configure the tracer based on the session's specifics */
>   	etm_parse_event_config(drvdata, event);
> -
> -	/*
> -	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
> -	 * the allocated ID. This reads the current version without allocation.
> -	 *
> -	 * This does not use the trace id lock to prevent lock_dep issues
> -	 * with perf locks - we know the ID cannot change until perf shuts down
> -	 * the session
> -	 */
> -	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
> -	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> -		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -		return -EINVAL;
> -	}
> -	drvdata->traceid = (u8)trace_id;
> +	drvdata->traceid = path->trace_id;
>   
>   	/* And enable it */
>   	return etm_enable_hw(drvdata);
>   }
>   
> -static int etm_enable_sysfs(struct coresight_device *csdev)
> +static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
>   {
>   	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etm_enable_arg arg = { };
> @@ -521,10 +485,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
>   
>   	spin_lock(&drvdata->spinlock);
>   
> -	/* sysfs needs to allocate and set a trace ID */
> -	ret = etm_read_alloc_trace_id(drvdata);
> -	if (ret < 0)
> -		goto unlock_enable_sysfs;
> +	drvdata->traceid = path->trace_id;
>   
>   	/*
>   	 * Configure the ETM only if the CPU is online.  If it isn't online
> @@ -545,7 +506,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
>   	if (ret)
>   		etm_release_trace_id(drvdata);
>   
> -unlock_enable_sysfs:
>   	spin_unlock(&drvdata->spinlock);
>   
>   	if (!ret)
> @@ -554,7 +514,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
>   }
>   
>   static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
> -		      enum cs_mode mode, struct coresight_trace_id_map *id_map)
> +		      enum cs_mode mode, struct coresight_path *path)
>   {
>   	int ret;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> @@ -566,10 +526,10 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
>   
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		ret = etm_enable_sysfs(csdev);
> +		ret = etm_enable_sysfs(csdev, path);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = etm_enable_perf(csdev, event, id_map);
> +		ret = etm_enable_perf(csdev, event, path);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index cfd116b87460..1ed957f5df61 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -233,25 +233,6 @@ static int etm4_cpu_id(struct coresight_device *csdev)
>   	return drvdata->cpu;
>   }
>   
> -int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
> -{
> -	int trace_id;
> -
> -	/*
> -	 * This will allocate a trace ID to the cpu,
> -	 * or return the one currently allocated.
> -	 * The trace id function has its own lock
> -	 */
> -	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
> -	if (IS_VALID_CS_TRACE_ID(trace_id))
> -		drvdata->trcid = (u8)trace_id;
> -	else
> -		dev_err(&drvdata->csdev->dev,
> -			"Failed to allocate trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -	return trace_id;
> -}
> -
>   void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
>   {
>   	coresight_trace_id_put_cpu_id(drvdata->cpu);
> @@ -788,9 +769,9 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   
>   static int etm4_enable_perf(struct coresight_device *csdev,
>   			    struct perf_event *event,
> -			    struct coresight_trace_id_map *id_map)
> +			    struct coresight_path *path)
>   {
> -	int ret = 0, trace_id;
> +	int ret = 0;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
>   	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
> @@ -803,22 +784,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>   	if (ret)
>   		goto out;
>   
> -	/*
> -	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
> -	 * the allocated ID. This reads the current version without allocation.
> -	 *
> -	 * This does not use the trace id lock to prevent lock_dep issues
> -	 * with perf locks - we know the ID cannot change until perf shuts down
> -	 * the session
> -	 */
> -	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
> -	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> -		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -	drvdata->trcid = (u8)trace_id;
> +	drvdata->trcid = path->trace_id;
>   
>   	/* And enable it */
>   	ret = etm4_enable_hw(drvdata);
> @@ -827,7 +793,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>   	return ret;
>   }
>   
> -static int etm4_enable_sysfs(struct coresight_device *csdev)
> +static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
>   {
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etm4_enable_arg arg = { };
> @@ -844,10 +810,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
>   
>   	spin_lock(&drvdata->spinlock);
>   
> -	/* sysfs needs to read and allocate a trace ID */
> -	ret = etm4_read_alloc_trace_id(drvdata);
> -	if (ret < 0)
> -		goto unlock_sysfs_enable;
> +	drvdata->trcid = path->trace_id;
>   
>   	/*
>   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> @@ -864,7 +827,6 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
>   	if (ret)
>   		etm4_release_trace_id(drvdata);
>   
> -unlock_sysfs_enable:
>   	spin_unlock(&drvdata->spinlock);
>   
>   	if (!ret)
> @@ -873,7 +835,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
>   }
>   
>   static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
> -		       enum cs_mode mode, struct coresight_trace_id_map *id_map)
> +		       enum cs_mode mode, struct coresight_path *path)
>   {
>   	int ret;
>   
> @@ -884,10 +846,10 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>   
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		ret = etm4_enable_sysfs(csdev);
> +		ret = etm4_enable_sysfs(csdev, path);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = etm4_enable_perf(csdev, event, id_map);
> +		ret = etm4_enable_perf(csdev, event, path);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 1119762b5cec..2b92de17b5a2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1066,6 +1066,5 @@ static inline bool etm4x_is_ete(struct etmv4_drvdata *drvdata)
>   	return drvdata->arch >= ETM_ARCH_ETE;
>   }
>   
> -int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata);
>   void etm4_release_trace_id(struct etmv4_drvdata *drvdata);
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index aca25b5e3be2..26f9339f38b9 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -195,7 +195,7 @@ static void stm_enable_hw(struct stm_drvdata *drvdata)
>   
>   static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
>   		      enum cs_mode mode,
> -		      __maybe_unused struct coresight_trace_id_map *trace_id)
> +		      __maybe_unused struct coresight_path *path)
>   {
>   	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index d03751bf3d8a..3ac5b52413a6 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -53,7 +53,8 @@ ssize_t coresight_simple_show32(struct device *_dev,
>   EXPORT_SYMBOL_GPL(coresight_simple_show32);
>   
>   static int coresight_enable_source_sysfs(struct coresight_device *csdev,
> -					 enum cs_mode mode, void *data)
> +					 enum cs_mode mode,
> +					 struct coresight_path *path)
>   {
>   	int ret;
>   
> @@ -64,7 +65,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
>   	 */
>   	lockdep_assert_held(&coresight_mutex);
>   	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
> -		ret = source_ops(csdev)->enable(csdev, data, mode, NULL);
> +		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
>   		if (ret)
>   			return ret;
>   	}
> @@ -217,7 +218,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   	if (ret)
>   		goto err_path;
>   
> -	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, NULL);
> +	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, path);
>   	if (ret)
>   		goto err_source;
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index c38f9701665e..fec49a537658 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -440,7 +440,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
>   
>   static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>   		       enum cs_mode mode,
> -		       __maybe_unused struct coresight_trace_id_map *id_map)
> +		       __maybe_unused struct coresight_path *path)
>   {
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 00404ba19352..8f76e7c45b38 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -400,7 +400,7 @@ struct coresight_ops_link {
>   struct coresight_ops_source {
>   	int (*cpu_id)(struct coresight_device *csdev);
>   	int (*enable)(struct coresight_device *csdev, struct perf_event *event,
> -		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
> +		      enum cs_mode mode, struct coresight_path *path);
>   	void (*disable)(struct coresight_device *csdev,
>   			struct perf_event *event);
>   };


