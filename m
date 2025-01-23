Return-Path: <linux-arm-msm+bounces-45930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB05CA1A164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D24441630AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CA320C460;
	Thu, 23 Jan 2025 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gxl0bacO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6E5234;
	Thu, 23 Jan 2025 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737626626; cv=none; b=YMrVmX8NqKTYTLZmT+JKoSQD14oC+6d4yYywFIr8O49kk4aZg/7H17j43iaT0KJb5+7+XlTeMJZ57+Z1U0ZjK5sJTm0/UV/XasoRP9w2NW3T70lGrgj46wStwYJwhJaSqfTDY98jrR8jxtJ37c4MfuqWdJOd1zHWmE6IlimAzxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737626626; c=relaxed/simple;
	bh=kLK3wEoH78n7ck6491p6xx1XUZG9xrUeeWCqNnRmK90=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ECjOAoEsMFYv4FaAMzLbHdoyQ4KVf3uOPdh2O1V/rNgsqkRyQ7MkC8j2Dopcf8PYlJJXySOIIoszcdtd4Gr0sbwhSiLnxyWTfqUhSlPRqnnTqWrArMr6RXhx0kL/AauvjMdIvCnbvpfE+Yd5CV2VqyzOYNU29MOT0Zo77qoj3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gxl0bacO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7lXTX010430;
	Thu, 23 Jan 2025 10:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rW5H4hxv/F0HXOs+pkpFmKc8nK3k9rt1UeHgY7baj4=; b=Gxl0bacOcAu+qYp1
	d/AcMsNa8AZBNf5i3YuElF14StXR9yx1+cceH3k6aOwo1SvnxmTOphU5hBM++vsn
	+NnorYy6OpLv1zGhmGNKIQ+t/GDFHZGtKAfl3028tG5tEYMz0MnyrhVvtCRVhy0E
	uXlA7iGBr20ji+Fa11PBS7awuTGAXiLDxN/9+Bfh1pYWt4yJBtFe/UCN3zuC+QjH
	o8/aBH59aAFzUEgU9f9JFy2+5qS8ZFYISVuLLFE0ZXY9IOVSXyikAVH64tu6ziyG
	NInH5m0VGGKrYvpQp2osDfkFG0PnUL58moqI4epU/Wt7GotV1q8CfOAX1ezoLMhF
	xYv9Cg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bhpm8as8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:03:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NA3IGq004827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:03:18 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 02:03:10 -0800
Message-ID: <4e5632fb-87d3-49ab-82ec-1d26cf46d5a4@quicinc.com>
Date: Thu, 23 Jan 2025 18:03:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] Coresight: Add trace_id function to retrieving the
 trace ID
To: James Clark <james.clark@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-3-quic_jiegan@quicinc.com>
 <64731493-4bd1-4707-9452-5ca86744875b@linaro.org>
 <d0c19d60-1043-4ac3-904f-c5b70ed32138@quicinc.com>
 <a0864e05-f4a6-49e1-ae7d-0c471d038210@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <a0864e05-f4a6-49e1-ae7d-0c471d038210@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oBqR9Au92MicKwB8zD_SI8OySB5KnKkt
X-Proofpoint-ORIG-GUID: oBqR9Au92MicKwB8zD_SI8OySB5KnKkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230076



On 1/23/2025 5:47 PM, James Clark wrote:
> 
> 
> On 23/01/2025 6:28 am, Jie Gan wrote:
>>
>>
>> On 1/13/2025 8:02 PM, James Clark wrote:
>>>
>>>
>>> On 26/12/2024 1:10 am, Jie Gan wrote:
>>>> Add 'trace_id' function pointer in ops. It's responsible for
>>>> retrieving the device's trace ID.
>>>>
>>>> Add 'struct cs_sink_data' to store the data that is needed by
>>>> coresight_enable_path/coresight_disable_path. The structure
>>>> will be transmitted to the helper and sink device to enable
>>>> related funcationalities.
>>>>
>>>
>>> The new cs_sink_data struct is quite specific to this change. Can we 
>>> start passing the path around to enable/disable functions, that will 
>>> allow devices to gather anything they want in the future. Because we 
>>> already have coresight_get_sink(path), coresight_get_source(path) etc.
>>>
>>> And see below, but for this case we can also change the path struct 
>>> to contain the trace ID. Then all the new functions, allocations and 
>>> searches for the trace ID are unecessary. The CTCU will have access 
>>> to the path, and by the time its enable function is called the trace 
>>> ID is already assigned.
>>>
>>> It's also easier to understand at which point a trace ID is 
>>> allocated, rather than adding the trace_id() callbacks from 
>>> everywhere which could potentially either read or allocate. I suppose 
>>> that's "safer" because maybe it's not allocated, but I can't see what 
>>> case it would happen in reverse.
>>>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-core.c  | 59 ++++++++++++++ 
>>>> +----
>>>>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>>>>   .../hwtracing/coresight/coresight-etm-perf.c  | 37 ++++++++++--
>>>>   .../coresight/coresight-etm3x-core.c          | 30 ++++++++++
>>>>   .../coresight/coresight-etm4x-core.c          | 29 +++++++++
>>>>   drivers/hwtracing/coresight/coresight-priv.h  | 13 +++-
>>>>   drivers/hwtracing/coresight/coresight-stm.c   | 22 +++++++
>>>>   drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++-
>>>>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 20 +++++++
>>>>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>>>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>>>>   include/linux/coresight.h                     |  6 ++
>>>>   14 files changed, 234 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>>> hwtracing/coresight/coresight-core.c
>>>> index 0a9380350fb5..2e560b425fd4 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>> @@ -23,6 +23,7 @@
>>>>   #include "coresight-etm-perf.h"
>>>>   #include "coresight-priv.h"
>>>>   #include "coresight-syscfg.h"
>>>> +#include "coresight-trace-id.h"
>>>>   /*
>>>>    * Mutex used to lock all sysfs enable and disable actions and 
>>>> loading and
>>>> @@ -331,12 +332,12 @@ static int coresight_enable_helper(struct 
>>>> coresight_device *csdev,
>>>>       return helper_ops(csdev)->enable(csdev, mode, data);
>>>>   }
>>>> -static void coresight_disable_helper(struct coresight_device *csdev)
>>>> +static void coresight_disable_helper(struct coresight_device 
>>>> *csdev, void *data)
>>>>   {
>>>> -    helper_ops(csdev)->disable(csdev, NULL);
>>>> +    helper_ops(csdev)->disable(csdev, data);
>>>>   }
>>>> -static void coresight_disable_helpers(struct coresight_device *csdev)
>>>> +static void coresight_disable_helpers(struct coresight_device 
>>>> *csdev, void *data)
>>>>   {
>>>>       int i;
>>>>       struct coresight_device *helper;
>>>> @@ -344,7 +345,7 @@ static void coresight_disable_helpers(struct 
>>>> coresight_device *csdev)
>>>>       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>>>>           helper = csdev->pdata->out_conns[i]->dest_dev;
>>>>           if (helper && coresight_is_helper(helper))
>>>> -            coresight_disable_helper(helper);
>>>> +            coresight_disable_helper(helper, data);
>>>>       }
>>>>   }
>>>> @@ -361,7 +362,7 @@ static void coresight_disable_helpers(struct 
>>>> coresight_device *csdev)
>>>>   void coresight_disable_source(struct coresight_device *csdev, void 
>>>> *data)
>>>>   {
>>>>       source_ops(csdev)->disable(csdev, data);
>>>> -    coresight_disable_helpers(csdev);
>>>> +    coresight_disable_helpers(csdev, NULL);
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>> @@ -371,7 +372,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>>    * disabled.
>>>>    */
>>>>   static void coresight_disable_path_from(struct list_head *path,
>>>> -                    struct coresight_node *nd)
>>>> +                    struct coresight_node *nd,
>>>> +                    void *sink_data)
>>>>   {
>>>>       u32 type;
>>>>       struct coresight_device *csdev, *parent, *child;
>>>> @@ -417,13 +419,13 @@ static void coresight_disable_path_from(struct 
>>>> list_head *path,
>>>>           }
>>>>           /* Disable all helpers adjacent along the path last */
>>>> -        coresight_disable_helpers(csdev);
>>>> +        coresight_disable_helpers(csdev, sink_data);
>>>>       }
>>>>   }
>>>> -void coresight_disable_path(struct list_head *path)
>>>> +void coresight_disable_path(struct list_head *path, void *sink_data)
>>>>   {
>>>> -    coresight_disable_path_from(path, NULL);
>>>> +    coresight_disable_path_from(path, NULL, sink_data);
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>>>> @@ -505,10 +507,47 @@ int coresight_enable_path(struct list_head 
>>>> *path, enum cs_mode mode,
>>>>   out:
>>>>       return ret;
>>>>   err:
>>>> -    coresight_disable_path_from(path, nd);
>>>> +    coresight_disable_path_from(path, nd, sink_data);
>>>>       goto out;
>>>>   }
>>>> +int coresight_read_traceid(struct list_head *path, enum cs_mode mode,
>>>> +               struct coresight_trace_id_map *id_map)
>>>> +{
>>>> +    int trace_id, type;
>>>> +    struct coresight_device *csdev;
>>>> +    struct coresight_node *nd;
>>>> +
>>>> +    list_for_each_entry(nd, path, link) {
>>>
>>> What do you think about also changing the path to this:
>>>
>>>   struct coresight_path {
>>>     struct list_head *path,
>>>     u8 trace_id
>>>   };
>>>
>>> That would avoid having to traverse the path on every enable and 
>>> would remove this function. You could also cache the trace ID in the 
>>> CTCU for a similar benefit, but it wouldn't remove the need to call 
>>> this at least once.
>>>
>>> The expensive part should be the create path part, after that enable 
>>> and disable should be cheap because they happen on schedule for Perf 
>>> mode. We should be avoiding allocations and searches.
>>>
>>>> +        csdev = nd->csdev;
>>>> +        type = csdev->type;
>>>> +
>>>> +        switch (type) {
>>>> +        case CORESIGHT_DEV_TYPE_SOURCE:
>>>> +            if (source_ops(csdev)->trace_id != NULL) {
>>>> +                trace_id = source_ops(csdev)->trace_id(csdev,
>>>> +                                       mode,
>>>> +                                       id_map);
>>>> +                if (IS_VALID_CS_TRACE_ID(trace_id))
>>>> +                    goto out;
>>>> +            }
>>>> +            break;
>>>> +        case CORESIGHT_DEV_TYPE_LINK:
>>>> +            if (link_ops(csdev)->trace_id != NULL) {
>>>> +                trace_id = link_ops(csdev)->trace_id(csdev);
>>>> +                if (IS_VALID_CS_TRACE_ID(trace_id))
>>>> +                    goto out;
>>>> +            }
>>>> +            break;
>>>> +        default:
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +    return -EINVAL;
>>>> +out:
>>>> +    return trace_id;
>>>> +}
>>>> +
>>>>   struct coresight_device *coresight_get_sink(struct list_head *path)
>>>>   {
>>>>       struct coresight_device *csdev;
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/ 
>>>> drivers/ hwtracing/coresight/coresight-etb10.c
>>>> index aea9ac9c4bd0..904b5531c256 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etb10.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
>>>> @@ -173,7 +173,8 @@ static int etb_enable_perf(struct 
>>>> coresight_device *csdev, void *data)
>>>>       pid_t pid;
>>>>       unsigned long flags;
>>>>       struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>> -    struct perf_output_handle *handle = data;
>>>> +    struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>>>> +    struct perf_output_handle *handle = sink_data->handle;
>>>>       struct cs_buffers *buf = etm_perf_sink_config(handle);
>>>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/ 
>>>> drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> index ad6a8f4b70b6..e676edd42ddc 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> @@ -459,6 +459,7 @@ static void etm_event_start(struct perf_event 
>>>> *event, int flags)
>>>>       struct perf_output_handle *handle = &ctxt->handle;
>>>>       struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
>>>>       struct list_head *path;
>>>> +    struct cs_sink_data *sink_data = NULL;
>>>>       u64 hw_id;
>>>>       u8 trace_id;
>>>> @@ -498,9 +499,20 @@ static void etm_event_start(struct perf_event 
>>>> *event, int flags)
>>>>       if (WARN_ON_ONCE(!sink))
>>>>           goto fail_end_stop;
>>>> +    sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
>>>
>>> kzalloc can't be called from here. Check dmesg for the warning. 
>>> That's another reason to do this change on the path. Because the path 
>>> is allocated on etm_setup_aux() where allocations are allowed.
>>>
>> Hi, James
>> I just tried with following command and did not observe any warning 
>> info from dmesg, may I ask what's the issue may suffered here?
>>
> 
> You might be missing some debugging configs like lockdep etc. The 
> warning is that etm_event_start() is a non-sleepable context and kzalloc 
> is sleepable. Even if it wasn't an error we still wouldn't want to do 
> it, etm_event_start() and stop are called too frequently.
> 
Sure, wiill check the issue again.

>> root@qemuarm64:/data# ./perf record -e cs_etm/@tmc_etr0/ --per-thread ls
>> configs        kernel.txt     logs           lost+found     misc 
>> perf           perf.data      perf.data.old  root           time 
>> tzstorage      weston
>> [ perf record: Woken up 1 times to write data ]
>> [ perf record: Captured and wrote 0.145 MB perf.data ]
>>
>> For the new patch version, I implemented an 8-bit hash table in the 
>> CTCU driver data to handle situations where multiple TPDMs are 
>> connected to the same TPDA device have been enabled. As we know, TPDMs 
>> share the trace_id of the TPDA device they are connected to. If we 
>> reset the bit based on the trace_id without checking the enabled 
>> refcount, it causes an issue where trace data from other enabled TPDM 
>> devices (sharing the same trace_id) cannot enter the ETR buffer, as it 
>> gets filtered out by the CTCU.
> I think sharing the code or a diagram might be easier to follow here. 
> The mention of a refcount makes sense but I don't follow the need for a 
> hash table. There are other places where single devices are shared by 
> multiple paths, like funnels, and they're all done with refcounts.
> 
Suppose we have two etr devices enabled, TPDM0 with trace_id 3(trace_id 
of TPDA0) with etr0 and TPDM1 with trace_id 3(trace_id of TPDA0) with 
etr1 have been enabled. So the current refcnt for TPDA device is 2, but 
actually, the refcnt for each sink should be 1, right? So I cannot check 
the refcnt from TPDA's coresight_device. That's why I implemented a hash 
table, use trace_id as key. We can check the refcnt for each trace_id 
for each sink with the solution.

Here is the code snippet:
Entry for hash table:
struct ctcu_traceid_entry {
         struct hlist_node       hlist;
         atomic_t                refcnt[ATID_MAX_NUM];
         u8                      trace_id;
};

Usage of hash table:

static struct ctcu_traceid_entry *ctcu_search_traceid_entry(struct 
coresight_device *csdev,
                                                             u8 trace_id)
{
         struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
         struct ctcu_traceid_entry *entry, *new_entry;
         int i;

         new_entry = kzalloc(sizeof(struct ctcu_traceid_entry), GFP_KERNEL);
         if (!new_entry)
                 return NULL;

         new_entry->trace_id = trace_id;
         for (i = 0; i < ATID_MAX_NUM; i++)
                 atomic_set(&new_entry->refcnt[i], 0);

         guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
         hash_for_each_possible(drvdata->traceid_htable, entry, hlist, 
trace_id) {
                 if (entry->trace_id == trace_id) {
                         kfree(new_entry);
                         return entry;
                 }
         }
         hash_add(drvdata->traceid_htable, &new_entry->hlist, trace_id);

         return new_entry;
}

/*
  * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
  *
  * Returns 0 indicates success. None-zero result means failure.
  */
static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct 
coresight_path *cs_path,
                                 bool enable)
{
         struct ctcu_traceid_entry *entry;
         struct coresight_device *sink = coresight_get_sink(cs_path->path);
         int port_num;

         entry = ctcu_search_traceid_entry(csdev, cs_path->trace_id);
         if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(cs_path->trace_id) 
|| (entry == NULL)) {
                 dev_err(&csdev->dev, "Invalid parameters\n");
                 return -EINVAL;
         }

         port_num = ctcu_get_active_port(sink, csdev);
         if (port_num < 0)
                 return -EINVAL;

         /*
          * Skip the disable session if more than one TPDM device that
          * connected to the same TPDA device has been enabled.
          */
         if (enable)
                 atomic_inc(&entry->refcnt[port_num]);
         else {
                 if (atomic_dec_return(&entry->refcnt[port_num]) > 0) {
                         dev_dbg(&csdev->dev, "Skip the disable session\n");
                         return 0;
                 }
                 ctcu_rm_traceid_entry(csdev, cs_path->trace_id);
         }

         dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);

         return __ctcu_set_etr_traceid(csdev, cs_path->trace_id, 
port_num, enable);
}

Or, I also have another solution, create an multi-element atomic array 
like refcnt[MAX_ETR_NUM][CORESIGHT_TRACE_ID_RES_TOP]. So we can allocate 
memory for the array in CTCU's probe function. It will cost like almost 
1k byte.

Thanks,
Jie

>> I need allocate memory when implement hash table(add/remove key entry) 
>> in coresight_enable_path flow, but you mentioned we cannot call 
>> kzalloc from here.
>>
>> Thanks,
>> Jie
>>
> 
> Why not allocate on setup_aux()? That's called by userspace before the 
> session starts, and then the path is fixed from that point onwards so 
> you shouldn't need to do any more allocations. That's how it's setup 
> currently anyway.
> 


