Return-Path: <linux-arm-msm+bounces-50359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B155A5008D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 14:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37AF83A6FB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 13:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B19824887E;
	Wed,  5 Mar 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J9uoP7EC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F672E3396;
	Wed,  5 Mar 2025 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181291; cv=none; b=ZcHMSdhCAukBoHUNzePC2h7whMK7/yPsIMEzpRTOoBhHG7Fj43ld9Mf0qNaC7BklFpD9HACg7MsR3i9/j3wtT0xtDTfBZABwOpBXRa2uJ+D2AJTauKw62hkjcMAVYhQgPHtHecIj/5zvEOrrxO8oGdcsvqDfQB7fXniK3AEqnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181291; c=relaxed/simple;
	bh=mx+N4niLWr5+q33WJOrkgXpRGwTX4Uy8hfi8tTGr3gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VVsPq3OJ4vm0c7DaIemfbqoahWJX3chIs3M0YXwEse3TEyHVRuUUfl3zRSuqgNiCvFmy0U3ySE+YRnDeCdPPDqvAyhvT3W8oXDIWGaMNbkZkMr53+HKNQAjVowFeAY0kpO3fMoTlWot2leVDcopFB15OIgyA3ULnMZSFNXd4SF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J9uoP7EC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525B19UP028088;
	Wed, 5 Mar 2025 13:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfWLYP57gVsIyTQR+W3aALSmFfgRt/y1vRXHXiE9DW4=; b=J9uoP7ECC637HiZl
	QtnRPAUvy4H7tYkShruj8LM9vQoCd4Y5XT+0VIRWJH/LkqCcjbrryFEeKAaf3l3P
	YYcW2iv+5gbBwRaPNbjJ//ejBXxhq+Tu/srjibCuZhchzewrw0ohwKaVhGdbJqXz
	oMBfMcWi8kSs+YRXfBLmHEH17RQ5mLUfyHYC2H2RanCRY7+GukKJLck+iGGSCb3C
	RAF4Duf2SgF/x8KVMQ8IbngmncL9xINwscSXcVy+oxNrVSv2/nWVlFKGzKJhk4GM
	o1Q8P72XCo9aLzWj1EhwgSarJ0SzP0TUWK8jDJdhasFAU4mqQHF6x1PGIqKuz6+s
	2crPqg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vdc7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 13:27:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525DRQG7002596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 13:27:26 GMT
Received: from [10.133.33.61] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 05:27:20 -0800
Message-ID: <7fe6c345-85cf-4114-b419-f50d1a6cbef1@quicinc.com>
Date: Wed, 5 Mar 2025 21:27:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 02/10] Coresight: Add trace_id function to retrieving
 the trace ID
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-3-quic_jiegan@quicinc.com>
 <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZX3-QF7poviCcbiF4XHdi-8RCpyBDC1H
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c85153 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=LpQP-O61AAAA:8
 a=_YhmHaDjSWNydp913SEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: ZX3-QF7poviCcbiF4XHdi-8RCpyBDC1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050107



On 3/5/2025 7:07 PM, Mike Leach wrote:
> Hi,
> 
> On Mon, 3 Mar 2025 at 03:30, Jie Gan <quic_jiegan@quicinc.com> wrote:
>>
>> Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
>> the device's trace ID.
>>
>> Co-developed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 30 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++-
>>   .../coresight/coresight-etm3x-core.c          |  1 +
>>   .../coresight/coresight-etm4x-core.c          |  1 +
>>   drivers/hwtracing/coresight/coresight-stm.c   | 11 +++++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 +++++++
>>   include/linux/coresight.h                     |  5 ++++
>>   7 files changed, 71 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index ab55e10d4b79..32aa07f4f8c1 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -24,6 +24,7 @@
>>   #include "coresight-etm-perf.h"
>>   #include "coresight-priv.h"
>>   #include "coresight-syscfg.h"
>> +#include "coresight-trace-id.h"
>>
>>   /*
>>    * Mutex used to lock all sysfs enable and disable actions and loading and
>> @@ -1557,6 +1558,35 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_remove_driver);
>>
>> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>> +                              struct coresight_device *sink)
>> +{
>> +       int trace_id;
>> +       int cpu = source_ops(csdev)->cpu_id(csdev);
>> +
> 
> This is a global funciton so need to check that this csdev is a
> source,. and does provide a cpu  function before calling it.
> 

Hi Mike,

I put this function here because it's required by etm3x and etm4x. It's 
intended to be called only by ETM devices, which are definitely source 
devices and have a cpu function.

Jie

>> +       switch (mode) {
>> +       case CS_MODE_SYSFS:
>> +               trace_id = coresight_trace_id_get_cpu_id(cpu);
>> +               break;
>> +       case CS_MODE_PERF:
>> +               if (WARN_ON(!sink))
>> +                       return -EINVAL;
>> +
>> +               trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
>> +               break;
>> +       default:
>> +               trace_id = -EINVAL;
>> +               break;
>> +       }
>> +
>> +       if (!IS_VALID_CS_TRACE_ID(trace_id))
>> +               dev_err(&csdev->dev,
>> +                       "Failed to allocate trace ID on CPU%d\n", cpu);
>> +
>> +       return trace_id;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
>> +
>>   MODULE_LICENSE("GPL v2");
>>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
>> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
>> index 9be53be8964b..b5692ba358c1 100644
>> --- a/drivers/hwtracing/coresight/coresight-dummy.c
>> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
>> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
>>          dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>>   }
>>
>> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +                                __maybe_unused struct coresight_device *sink)
>> +{
>> +       struct dummy_drvdata *drvdata;
>> +
>> +       drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       return drvdata->traceid;
>> +}
>> +
>>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
>>                                  void *data)
>>   {
>> @@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
>>   };
>>
>>   static const struct coresight_ops dummy_source_cs_ops = {
>> -       .source_ops = &dummy_source_ops,
>> +       .trace_id       = dummy_source_trace_id,
>> +       .source_ops     = &dummy_source_ops,
>>   };
>>
>>   static const struct coresight_ops_sink dummy_sink_ops = {
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index c103f4c70f5d..c1dda4bc4a2f 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
>>   };
>>
>>   static const struct coresight_ops etm_cs_ops = {
>> +       .trace_id       = coresight_etm_get_trace_id,
>>          .source_ops     = &etm_source_ops,
>>   };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 2c1a60577728..cfd116b87460 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
>>   };
>>
>>   static const struct coresight_ops etm4_cs_ops = {
>> +       .trace_id       = coresight_etm_get_trace_id,
>>          .source_ops     = &etm4_source_ops,
>>   };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
>> index b581a30a1cd9..aca25b5e3be2 100644
>> --- a/drivers/hwtracing/coresight/coresight-stm.c
>> +++ b/drivers/hwtracing/coresight/coresight-stm.c
>> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
>>          }
>>   }
>>
>> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +                       __maybe_unused struct coresight_device *sink)
>> +{
>> +       struct stm_drvdata *drvdata;
>> +
>> +       drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       return drvdata->traceid;
>> +}
>> +
>>   static const struct coresight_ops_source stm_source_ops = {
>>          .enable         = stm_enable,
>>          .disable        = stm_disable,
>>   };
>>
>>   static const struct coresight_ops stm_cs_ops = {
>> +       .trace_id       = stm_trace_id,
>>          .source_ops     = &stm_source_ops,
>>   };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
>> index 573da8427428..94c2201fc8d3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
>>          dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>>   }
>>
>> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +                        __maybe_unused struct coresight_device *sink)
>> +{
>> +       struct tpda_drvdata *drvdata;
>> +
>> +       drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       return drvdata->atid;
>> +}
>> +
>>   static const struct coresight_ops_link tpda_link_ops = {
>>          .enable         = tpda_enable,
>>          .disable        = tpda_disable,
>>   };
>>
>>   static const struct coresight_ops tpda_cs_ops = {
>> +       .trace_id       = tpda_trace_id,
>>          .link_ops       = &tpda_link_ops,
>>   };
>>
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index c7cd5886c908..ce9a5e71b261 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -335,6 +335,7 @@ enum cs_mode {
>>          CS_MODE_PERF,
>>   };
>>
>> +#define coresight_ops(csdev)   csdev->ops
>>   #define source_ops(csdev)      csdev->ops->source_ops
>>   #define sink_ops(csdev)                csdev->ops->sink_ops
>>   #define link_ops(csdev)                csdev->ops->link_ops
>> @@ -421,6 +422,8 @@ struct coresight_ops_panic {
>>   };
>>
>>   struct coresight_ops {
>> +       int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
>> +                       struct coresight_device *sink);
>>          const struct coresight_ops_sink *sink_ops;
>>          const struct coresight_ops_link *link_ops;
>>          const struct coresight_ops_source *source_ops;
>> @@ -709,4 +712,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>>
>>   void coresight_remove_driver(struct amba_driver *amba_drv,
>>                               struct platform_driver *pdev_drv);
>> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>> +                              struct coresight_device *sink);
>>   #endif         /* _LINUX_COREISGHT_H */
>> --
>> 2.34.1
>>
> 
> 


