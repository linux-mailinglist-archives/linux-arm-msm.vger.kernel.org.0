Return-Path: <linux-arm-msm+bounces-46441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDCA215DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 01:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5D78188899C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CAB15445D;
	Wed, 29 Jan 2025 00:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S/ncro+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538A17C208;
	Wed, 29 Jan 2025 00:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738112273; cv=none; b=YLFO5dBEm+iCSnTnn4u7dvFy9g6xJ9kxb+vTeBiIChNDowV0jhVWrZH4vjyAYBn/1VQhJLD00P6cF9h9YKFqpBM+11+uNhmunYeI6VaSU984qMzl9aOLL3zyqlemKqP+st/4jUx63Dt77JgZ1hyANDDsyq1n+WRuy1uaU6L1Xjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738112273; c=relaxed/simple;
	bh=kXNBtubWSLYua7K0WgZtUGs1DjaGH7vAHICNXmS/Y3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nE0X/pGokeIphaaT3iaqbU8nHM66e10G8xDzefWBEbexIzdt2K/b9cwFiuVQjGEMJ/71ijrfvQTotNRuALHyJQ7BNL9bMhfvdPbHcPtNAwa8uFDcdXN2p6PcyjFsFAXZ4fFgH8T5XTDp5bFs8UlbbF8fUJh/fntA0Voc4lQ8Gp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S/ncro+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SGIWKT023412;
	Wed, 29 Jan 2025 00:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQQkxtJswJ6G6AZ+K3wO4Z+prFLWuSaEOoIOI5kw36U=; b=S/ncro+YUYOUfehw
	3qe9Aeht3KdfZgEirTupGm5ioCXnmoyAdIrzu/wqx0UjQiy2k/qEMMNnEcMmxKTU
	eWjTYdGcZY3Gk2WcmpQAUz5KeONX1Js1p/L1c4WoMN5ehPd3+MbmSal1lkGiVxdE
	gQdZi5mfoPM69A4GnHWrm1i85PicvJZd2n/UfylePBqVk30R5KZ8tZZkhu4Sge+P
	4xXFrHmVUN+9kaUw9QV+q0hWKfRguuam7dtNQN4lyhlIrlpO6Tdoj+Sl5L20rUqb
	8RZHvltRPyZ0CeQcV5L/gdJozg60VuOWL5EH1H5qZD1GQ56tJFO5i5ydNx/8vsek
	3Lj9vg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f2mps0hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 00:57:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T0vN0i023408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 00:57:23 GMT
Received: from [10.133.33.41] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 16:57:17 -0800
Message-ID: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
Date: Wed, 29 Jan 2025 08:57:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] Coresight: Introduce a new struct coresight_path
To: James Clark <james.clark@linaro.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
 <538ae543-4c43-4df2-8adc-911096fe14dd@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <538ae543-4c43-4df2-8adc-911096fe14dd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eovWIWCKTdy6jmzv7fp1hOTXOvYeS8PS
X-Proofpoint-ORIG-GUID: eovWIWCKTdy6jmzv7fp1hOTXOvYeS8PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290006



On 1/28/2025 7:54 PM, James Clark wrote:
> 
> 
> On 24/01/2025 7:25 am, Jie Gan wrote:
>> Add 'struct coresight_path' to store the data that is needed by
>> coresight_enable_path/coresight_disable_path. The structure
>> will be transmitted to the helper and sink device to enable
>> related funcationalities.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 87 ++++++++++++++-----
>>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>>   .../hwtracing/coresight/coresight-etm-perf.c  | 52 ++++++-----
>>   .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
>>   drivers/hwtracing/coresight/coresight-priv.h  | 21 +++--
>>   drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++----
>>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>>   10 files changed, 137 insertions(+), 76 deletions(-)
>>
> 
> [...]
> 
> 
>>       INIT_LIST_HEAD(path);
>> +    cs_path->path = path;
>> +    /*
>> +     * Since not all source devices have a defined trace_id function,
>> +     * make sure to check for it before use.
>> +     *
>> +     * Assert the mode is CS_MODE_SYSFS, the trace_id will be assigned
>> +     * again later if the mode is CS_MODE_PERF.
>> +     */
>> +    if (source_ops(source)->trace_id != NULL) {
>> +        rc = source_ops(source)->trace_id(source, CS_MODE_SYSFS, NULL);
> 
> I don't think we should do this. Doesn't this consume two trace IDs for 
> each session? And I'm not even sure if it's released properly if it's 
> overwritten.
Yes, you are right, we may waste our trace ID here.
> 
> It should be possible to consolidate the all the trace ID allocation to 
> a single step when building the path, or another function that gets 
> called just after the path is built. At the moment the ID can be 
> allocated from about 5 different places and it's quite hard to 
> understand, especially with these new changes. I have some of it coded 
> up, let me finish it off and I can share it.
Waiting for your update. I am also looking forward to another solution.

> 
>> +        if(IS_VALID_CS_TRACE_ID(rc))
>> +            cs_path->trace_id = rc;
>> +        else
>> +            cs_path->trace_id = 0;
>> +    }
>> +    else
>> +        cs_path->trace_id = 0;
> 
> [...]
> 
>> +/**
>> + * struct coresight_path - data needed by enable/disable path
>> + * @handle:        perf aux handle for ETM.
>> + * @path:        path from source to sink.
>> + * @trace_id:        trace_id of the whole path.
>> + */
>> +struct coresight_path {
>> +    struct perf_output_handle    *handle;
> 
> This is only needed to avoid adding *handle to the enable function call 
> signature, but having it here implies it needs to be stored. And then we 
> need to manage the lifecycle of it by nulling it on deletion. All of 
> this can be avoided by just adding handle to enable().
> 
> Unrelated to this patch, but I'm not sure why we were passing around 
> void* for handle either. It just makes the code hard to read and implies 
> some flexibility that doesn't exist. It's always "struct 
> perf_output_handle", so we can change void* to that in the enable 
> functions. I also have a patch for this that I'll share in a bit.
> 
Thanks for support. I am totally agree with you. It's not related to the 
patch series and it looks like a hack here.

Waiting for your update.

>> +    struct list_head        *path;
>> +    u8                trace_id;
>> +};
>> +
>>   static inline void coresight_insert_barrier_packet(void *buf)
>>   {
>>       if (buf)
>> @@ -132,16 +144,15 @@ static inline void CS_UNLOCK(void __iomem *addr)
>>       } while (0);
>>   }
>> -void coresight_disable_path(struct list_head *path);
>> -int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>> -              void *sink_data);
>> +void coresight_disable_path(struct coresight_path *cs_path);
>> +int coresight_enable_path(struct coresight_path *cs_path, enum 
>> cs_mode mode);
>>   struct coresight_device *coresight_get_sink(struct list_head *path);
> 
> This needs to be exported otherwise the build fails because you use it 
> in a module in another commit. I assume you are building as static?
> 
> 
Yes, you are right. I made a mistake here. I did not test it with build 
as module. Sorry about the mistake.

Thanks,
Jie



