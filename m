Return-Path: <linux-arm-msm+bounces-49581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7BDA470B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 02:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922AF3AF278
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 01:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03471758B;
	Thu, 27 Feb 2025 01:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QvVvOTDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FA7ECF;
	Thu, 27 Feb 2025 01:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740618365; cv=none; b=XpoQV8sP7WHJK2e1OKbQc+Wgo+sJwcD9SRSQ6C/4DwLJil2SFr13u302/Kw9Idg4SJ+3fYFnZ9deqlR8NDFnPpm1nnooZDdOO5bMLTlt3ZtCwGvSrMg0u2fKPeSt87qf+CT1Gk1RPYgijwXHNlLu3i49SP1eULf04R0ZngD96LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740618365; c=relaxed/simple;
	bh=u6djUUCuS1OAInC4IJmiZCv7c7SfprcVAax5FLQ2KPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yw5yd+G4ySqrg5gq6EQjK/9cmWaHtsxiZ3ozn4e5Zlnuk4yrL3XUwH6A5fQSfBnP+kuayIlFXgL04vFMeDEZEbCFm85t4tP3OAYb2ja73CfRVG7PmuZ1SwCWaNI7eTwh8XhBN5URrkcDm2HSKqIiMr4Gty9gV0CnyncSrTrtIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QvVvOTDG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QD9A33001059;
	Thu, 27 Feb 2025 01:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pw/qtYKWcNYdrX3Ze/kwVTdo38LzMv+SwIbu4uPn3MY=; b=QvVvOTDG9l8h7qPB
	Cs1R0gJpTRIBeF8i7ZESBmZdWyzVRJ/cuDXABYnh6ifYJAf3paNXQy7vE5W5PeW1
	iGy6/CM8skq9l2RuqelHLNonZiuCTGlimIvdzA7UDDPP4qo9f04ZWxCau1QivHYp
	QAI0xw4PnbWs11SvLZPeCf8unjgnEdCAxnQ9qUYpra/+1EMt53zz58EAcm71D+FQ
	apbqh152ozr/LyxJgPVhs7EskY4zdIrR0nDASNQbKYKhnPkS5U+ZT7k+MdKJx92S
	If/2UIS9HXjyxuQwid5XRs1vbIkh7wgRynDplvl2GWpneEzoy/AC5tD5GHcljkZR
	beh7dw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4523kc9qyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 01:05:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R15j3N032305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 01:05:45 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 17:05:40 -0800
Message-ID: <1ead93cb-863c-471c-8a5a-d8f0bef26f92@quicinc.com>
Date: Thu, 27 Feb 2025 09:05:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 02/10] Coresight: Add trace_id function to retrieving
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
References: <20250226041342.53933-1-quic_jiegan@quicinc.com>
 <20250226041342.53933-3-quic_jiegan@quicinc.com>
 <abad8cd1-2436-416b-9db8-3c5e9eb38d73@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <abad8cd1-2436-416b-9db8-3c5e9eb38d73@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6oUJsxGDNHEPIGhObqUQRvRSIA24JaS8
X-Proofpoint-ORIG-GUID: 6oUJsxGDNHEPIGhObqUQRvRSIA24JaS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270007



On 2/26/2025 7:55 PM, Suzuki K Poulose wrote:
> On 26/02/2025 04:13, Jie Gan wrote:
>> Add 'trace_id' function pointer in coresight_ops. It's responsible for 
>> retrieving
>> the device's trace ID.
>>
>> Co-developed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 27 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-dummy.c | 13 ++++++++-
>>   .../coresight/coresight-etm3x-core.c          |  1 +
>>   .../coresight/coresight-etm4x-core.c          |  1 +
>>   drivers/hwtracing/coresight/coresight-stm.c   | 11 ++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 ++++++++
>>   include/linux/coresight.h                     |  5 ++++
>>   7 files changed, 68 insertions(+), 1 deletion(-)
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
> 
> Please could we handle a case where "sink" may be passed NULL ?
> 
>          if (WARN_ON(!sink))
>              return -EINVAL;
> 
> Sorry, didn't spot that in the last review.

Hi Suzuki,

Thanks for poniting out.

There are two scenarios for current useage:
1. From traceid_show() - this is sysfs mode, so we dont need check sink.
2. From coresight_path_assign_trace_id function, the sink is obtained 
from coresight_path and the "sink" has been verified before building the 
coresight_path.

That's why I did not include the verification for sink before using it.
But I think it's worthwhile to add this code to enhance our code's 
robustness.

Will fix it in next version.

Thanks,
Jie

> 
> Suzuki
> 
> 
>> +        trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink- 
>> >perf_sink_id_map);
> 
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
>> index 9be53be8964b..b5692ba358c1 100644
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
>> @@ -62,7 +72,8 @@ static const struct coresight_ops_source 
>> dummy_source_ops = {
>>   };
>>   static const struct coresight_ops dummy_source_cs_ops = {
>> -    .source_ops = &dummy_source_ops,
>> +    .trace_id    = dummy_source_trace_id,
>> +    .source_ops    = &dummy_source_ops,
>>   };
>>   static const struct coresight_ops_sink dummy_sink_ops = {
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index c103f4c70f5d..c1dda4bc4a2f 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -704,6 +704,7 @@ static const struct coresight_ops_source 
>> etm_source_ops = {
>>   };
>>   static const struct coresight_ops etm_cs_ops = {
>> +    .trace_id    = coresight_etm_get_trace_id,
>>       .source_ops    = &etm_source_ops,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 2c1a60577728..cfd116b87460 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source 
>> etm4_source_ops = {
>>   };
>>   static const struct coresight_ops etm4_cs_ops = {
>> +    .trace_id    = coresight_etm_get_trace_id,
>>       .source_ops    = &etm4_source_ops,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/ 
>> hwtracing/coresight/coresight-stm.c
>> index b581a30a1cd9..aca25b5e3be2 100644
>> --- a/drivers/hwtracing/coresight/coresight-stm.c
>> +++ b/drivers/hwtracing/coresight/coresight-stm.c
>> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device 
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
>>   };
>>   static const struct coresight_ops stm_cs_ops = {
>> +    .trace_id    = stm_trace_id,
>>       .source_ops    = &stm_source_ops,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 189a4abc2561..68079169b11b 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device 
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
>>   };
>>   static const struct coresight_ops tpda_cs_ops = {
>> +    .trace_id    = tpda_trace_id,
>>       .link_ops    = &tpda_link_ops,
>>   };
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 157c4bd009a1..ce89ad24c2a2 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -335,6 +335,7 @@ enum cs_mode {
>>       CS_MODE_PERF,
>>   };
>> +#define coresight_ops(csdev)    csdev->ops
>>   #define source_ops(csdev)    csdev->ops->source_ops
>>   #define sink_ops(csdev)        csdev->ops->sink_ops
>>   #define link_ops(csdev)        csdev->ops->link_ops
>> @@ -410,6 +411,8 @@ struct coresight_ops_helper {
>>   };
>>   struct coresight_ops {
>> +    int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
>> +            struct coresight_device *sink);
>>       const struct coresight_ops_sink *sink_ops;
>>       const struct coresight_ops_link *link_ops;
>>       const struct coresight_ops_source *source_ops;
>> @@ -697,4 +700,6 @@ int coresight_init_driver(const char *drv, struct 
>> amba_driver *amba_drv,
>>   void coresight_remove_driver(struct amba_driver *amba_drv,
>>                    struct platform_driver *pdev_drv);
>> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum 
>> cs_mode mode,
>> +                   struct coresight_device *sink);
>>   #endif        /* _LINUX_COREISGHT_H */
> 


