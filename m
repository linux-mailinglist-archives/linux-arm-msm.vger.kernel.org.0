Return-Path: <linux-arm-msm+bounces-48779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EAFA3E9E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 02:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D05887A9ABD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 01:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C156088F;
	Fri, 21 Feb 2025 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VwxPFtEx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3E38F9C;
	Fri, 21 Feb 2025 01:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740101059; cv=none; b=ddB5HPvJ48yFzFJbbT8zkcxf/8N0Jw/qYXzAn4s88F+kjwTMZpWwGpsjzMndH28MpJjL1S6yI1jrQPhHK82PL9pezUIz9CfmB7WtyAPLJQmS2MjZkI2/1rAvzp4fHTQh7RtGbqvHmqfsma7Wk6tKnRjHH+QHuehoq3m6ihJrt/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740101059; c=relaxed/simple;
	bh=TEfAd7HsAZOFHcIsdN/PiGBEMnhR/7RCqIf9fF5nf6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=luD+dUMBhdoECVUyhwY2qTjJssWpMTRLLfcfwIgYDqd5oT4hUfXkB0QvCvTEPoVxaajuG6KedjzAUmsg7RgGtzNbGzGCCEoK3ZEWlm5fPxNTjpoJp5bpr5GOYY2NpskVq3C08JHJz1u7kfLcwKWmiUx6Hfy5nWratV0EU03czyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VwxPFtEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KFawHn016354;
	Fri, 21 Feb 2025 01:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmhIMgW1+wbY5wABjJwWKdRq5lYl5yQJv/t2v68ssUs=; b=VwxPFtExn9neAZTm
	Twa+THI9F1o8veLbZ70ceBQjfne0pHefvJpKmDLtrq51NBYHkoVKUz5/oHlbH4de
	LICDbWLQ1OhT8sZemzWjZvVVPBcGh7RTsf6oOmYwXtZjnTpeAqX21RaCldt39/dh
	amvJp5MALdyrblcibIDzEjVWsnHw69wB7qEe856T+3clf+uUMTS7qxWCdFsKA+7c
	H8wjK8qaE3D4AIoICMOoAPEL6Em57cmwQL/VvRleStmcj/ezo5THUZwqvsSZv9Vq
	Pm62H4BHzrAshEoIDbOkIFGnvPI2vUyyO0AgzekEP686mJ2tpg7qoRUBhR5NsyjP
	gKlipw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy17xq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 01:23:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L1NssZ016847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 01:23:54 GMT
Received: from [10.133.33.30] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 17:23:49 -0800
Message-ID: <06bed294-0d48-412b-a844-42d7fea6e4b1@quicinc.com>
Date: Fri, 21 Feb 2025 09:23:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/7] Coresight: Add trace_id function to retrieving
 the trace ID
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
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-3-quic_jiegan@quicinc.com>
 <168c214a-38a5-45d4-a776-d7819cbab9f3@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <168c214a-38a5-45d4-a776-d7819cbab9f3@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qItzYiTwEx2WAB_2YfQxST5jayKuMeM7
X-Proofpoint-ORIG-GUID: qItzYiTwEx2WAB_2YfQxST5jayKuMeM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210008



On 2/21/2025 1:34 AM, Suzuki K Poulose wrote:
> On 17/02/2025 09:30, Jie Gan wrote:
>> Add 'trace_id' function pointer in ops. It's responsible for
>> retrieving the device's trace ID.
>>
>> Co-developed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> 
> 
> minor nit: Given this is an optional callback, we could as well make
> this a generic ops and avoid checking if it is a link/source etc. We
> anyway check if the op is available before calling it.
> 
> i.e.:
> 
> struct coresight_ops {
> +    int (*trace_id)(struct coresight *csdev,...);
> 
>      ...
> };
>
Hi Suzuki,

Thanks for comment. Looks a good idea because the trace_id is a generic
function for the coresight_deivce, which can simplify our codes.

Will update a new version to acheive the idea.

Thanks,
Jie


> 
> 
> 
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 27 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-dummy.c | 11 ++++++++
>>   .../coresight/coresight-etm3x-core.c          |  1 +
>>   .../coresight/coresight-etm4x-core.c          |  1 +
>>   drivers/hwtracing/coresight/coresight-stm.c   | 11 ++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 ++++++++
>>   include/linux/coresight.h                     |  8 ++++++
>>   7 files changed, 70 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 0a9380350fb5..6cad777757f3 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -23,6 +23,7 @@
>>   #include "coresight-etm-perf.h"
>>   #include "coresight-priv.h"
>>   #include "coresight-syscfg.h"
>> +#include "coresight-trace-id.h"
>>   /*
>>    * Mutex used to lock all sysfs enable and disable actions and 
>> loading and
>> @@ -1515,6 +1516,32 @@ void coresight_remove_driver(struct amba_driver 
>> *amba_drv,
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_remove_driver);
>> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum 
>> cs_mode mode,
>> +                   struct coresight_device *sink)
>> +{
>> +    int trace_id;
>> +    int cpu = source_ops(csdev)->cpu_id(csdev);
>> +
>> +    switch (mode) {
>> +    case CS_MODE_SYSFS:
>> +        trace_id = coresight_trace_id_get_cpu_id(cpu);
>> +        break;
>> +    case CS_MODE_PERF:
>> +        trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink- 
>> >perf_sink_id_map);
>> +        break;
>> +    default:
>> +        trace_id = -EINVAL;
>> +        break;
>> +    }
>> +
>> +    if (!IS_VALID_CS_TRACE_ID(trace_id))
>> +        dev_err(&csdev->dev,
>> +            "Failed to allocate trace ID on CPU%d\n", cpu);
>> +
>> +    return trace_id;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
>> +
>>   MODULE_LICENSE("GPL v2");
>>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
>> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/ 
>> hwtracing/coresight/coresight-dummy.c
>> index 9be53be8964b..c47f0382b943 100644
>> --- a/drivers/hwtracing/coresight/coresight-dummy.c
>> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
>> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct 
>> coresight_device *csdev,
>>       dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>>   }
>> +static int dummy_source_trace_id(struct coresight_device *csdev, 
>> __maybe_unused enum cs_mode mode,
>> +                 __maybe_unused struct coresight_device *sink)
>> +{
>> +    struct dummy_drvdata *drvdata;
>> +
>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    return drvdata->traceid;
>> +}
>> +
>>   static int dummy_sink_enable(struct coresight_device *csdev, enum 
>> cs_mode mode,
>>                   void *data)
>>   {
>> @@ -59,6 +69,7 @@ static int dummy_sink_disable(struct 
>> coresight_device *csdev)
>>   static const struct coresight_ops_source dummy_source_ops = {
>>       .enable    = dummy_source_enable,
>>       .disable = dummy_source_disable,
>> +    .trace_id = dummy_source_trace_id,
>>   };
>>   static const struct coresight_ops dummy_source_cs_ops = {
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index c103f4c70f5d..a38e72ef8e79 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -701,6 +701,7 @@ static const struct coresight_ops_source 
>> etm_source_ops = {
>>       .cpu_id        = etm_cpu_id,
>>       .enable        = etm_enable,
>>       .disable    = etm_disable,
>> +    .trace_id    = coresight_etm_get_trace_id,
>>   };
>>   static const struct coresight_ops etm_cs_ops = {
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 2c1a60577728..1a993d5380e7 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1064,6 +1064,7 @@ static const struct coresight_ops_source 
>> etm4_source_ops = {
>>       .cpu_id        = etm4_cpu_id,
>>       .enable        = etm4_enable,
>>       .disable    = etm4_disable,
>> +    .trace_id    = coresight_etm_get_trace_id,
>>   };
>>   static const struct coresight_ops etm4_cs_ops = {
>> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/ 
>> hwtracing/coresight/coresight-stm.c
>> index b581a30a1cd9..64fcfa916562 100644
>> --- a/drivers/hwtracing/coresight/coresight-stm.c
>> +++ b/drivers/hwtracing/coresight/coresight-stm.c
>> @@ -281,9 +281,20 @@ static void stm_disable(struct coresight_device 
>> *csdev,
>>       }
>>   }
>> +static int stm_trace_id(struct coresight_device *csdev, 
>> __maybe_unused enum cs_mode mode,
>> +            __maybe_unused struct coresight_device *sink)
>> +{
>> +    struct stm_drvdata *drvdata;
>> +
>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    return drvdata->traceid;
>> +}
>> +
>>   static const struct coresight_ops_source stm_source_ops = {
>>       .enable        = stm_enable,
>>       .disable    = stm_disable,
>> +    .trace_id    = stm_trace_id,
>>   };
>>   static const struct coresight_ops stm_cs_ops = {
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 189a4abc2561..d80b6427e5a6 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -241,9 +241,20 @@ static void tpda_disable(struct coresight_device 
>> *csdev,
>>       dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>>   }
>> +static int tpda_trace_id(struct coresight_device *csdev, 
>> __maybe_unused enum cs_mode mode,
>> +             __maybe_unused struct coresight_device *sink)
>> +{
>> +    struct tpda_drvdata *drvdata;
>> +
>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    return drvdata->atid;
>> +}
>> +
>>   static const struct coresight_ops_link tpda_link_ops = {
>>       .enable        = tpda_enable,
>>       .disable    = tpda_disable,
>> +    .trace_id    = tpda_trace_id,
>>   };
>>   static const struct coresight_ops tpda_cs_ops = {
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 157c4bd009a1..70407d61262e 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -368,6 +368,7 @@ struct coresight_ops_sink {
>>    * Operations available for links.
>>    * @enable:    enables flow between iport and oport.
>>    * @disable:    disables flow between iport and oport.
>> + * @trace_id:    alloc or read the traceid.
>>    */
>>   struct coresight_ops_link {
>>       int (*enable)(struct coresight_device *csdev,
>> @@ -376,6 +377,8 @@ struct coresight_ops_link {
>>       void (*disable)(struct coresight_device *csdev,
>>               struct coresight_connection *in,
>>               struct coresight_connection *out);
>> +    int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
>> +            struct coresight_device *sink);
>>   };
>>   /**
>> @@ -385,6 +388,7 @@ struct coresight_ops_link {
>>    *        is associated to.
>>    * @enable:    enables tracing for a source.
>>    * @disable:    disables tracing for a source.
>> + * @trace_id:    alloc or read the traceid.
>>    */
>>   struct coresight_ops_source {
>>       int (*cpu_id)(struct coresight_device *csdev);
>> @@ -392,6 +396,8 @@ struct coresight_ops_source {
>>                 enum cs_mode mode, struct coresight_trace_id_map 
>> *id_map);
>>       void (*disable)(struct coresight_device *csdev,
>>               struct perf_event *event);
>> +    int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
>> +            struct coresight_device *sink);
>>   };
>>   /**
>> @@ -697,4 +703,6 @@ int coresight_init_driver(const char *drv, struct 
>> amba_driver *amba_drv,
>>   void coresight_remove_driver(struct amba_driver *amba_drv,
>>                    struct platform_driver *pdev_drv);
>> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum 
>> cs_mode mode,
>> +                   struct coresight_device *sink);
>>   #endif        /* _LINUX_COREISGHT_H */
> 


