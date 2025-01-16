Return-Path: <linux-arm-msm+bounces-45190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6ACA1319A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 04:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50785165007
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 03:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DEB78F44;
	Thu, 16 Jan 2025 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aDmDvqqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8417C8B;
	Thu, 16 Jan 2025 03:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736996496; cv=none; b=GQL09w9u03ckNX5mOSUBVYUX7pirErcXG1KX4BXrlY0RCvi+TxcN9vBF8AIFx//T8Ks3YbJmw9rPwiCy1FSPzjEj8utmwufmNjzkcUd2p1Qvk24rwCUGtRDaxsN8FFwVjSazssJ6oem5EuNvHGx0Lwe4FsuMF/Ty2V2TuVPSXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736996496; c=relaxed/simple;
	bh=XH6ZIL8u+2bWhKyWuqOXNM1wkb4KwLzFlvxtbniSuMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qIT+GdTlGwsyLiLoJnNWOqQW+//BPJy8Jido4ln9cEHT0NYO1IP2neJccEClSP/W7vBp2W5Cq6gyggnkOkHqpi9SuZgQ6+HCs9D9ChYDSXhCj9QpROwJ7COHYwnl2ZSUfgaSQvkIFo6C1oWj+mrVC1WmmH7XMclCk8+Oc8mmcn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aDmDvqqh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGn9cw010075;
	Thu, 16 Jan 2025 03:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVU2+wqfJpVvyTzoCni5wBYdoUjECrob0BiRDU2zfcE=; b=aDmDvqqhPqZQ3Gd5
	+gESwNAKUWqviaNb59KKbWFJDZHWePqJzQkPFl6XJ78W/YfBIpvwAoTmaHVBCD73
	NFOs2Pj1sxv2iJ+dFxa9+Ega+HoLMqvzwVkad/ewOBMcx8yVcNhxVBRguzJ1P5bp
	WAykQV/cH4E21d6ydVMaBH+94WZLQJJjgFdY2q/LyG6zJa/Va/H8mFwTq1/v/f+N
	6UqjekNEoh7gXJ9iZCwK6lKYaHQcKPOzfwYlP0Kwh3bw+SmzYvUThVxM+grwGIpl
	0rtmaJBJLstfxHM3fTWVkOUWG0Og5Lx9qVdKVWXN0YmHiT+VWfvWus6Je9Sh8UcM
	Kf+BPA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446gjdh7xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 03:01:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G31Bxk030259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 03:01:11 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 19:01:05 -0800
Message-ID: <5c0827ce-cf25-43d0-a160-5f99e82f582c@quicinc.com>
Date: Thu, 16 Jan 2025 11:01:03 +0800
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
 <a2d995bc-02ff-4374-968e-2fa6d8f921dd@quicinc.com>
 <02f114b7-8654-4402-b105-7aef41d487f0@linaro.org>
 <e3a29406-075d-41f6-888c-ebe168162134@quicinc.com>
 <b8fd3d5a-fc61-4ab0-8fb1-7cacf4cab9f5@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <b8fd3d5a-fc61-4ab0-8fb1-7cacf4cab9f5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UgPQ2P0JmZwgfCrC4hxlCRJ9vWwiNwgb
X-Proofpoint-ORIG-GUID: UgPQ2P0JmZwgfCrC4hxlCRJ9vWwiNwgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_11,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160018



On 1/15/2025 8:29 PM, James Clark wrote:
> 
> 
> On 15/01/2025 1:44 am, Jie Gan wrote:
>>
>>
>> On 1/14/2025 6:07 PM, James Clark wrote:
>>>
>>>
>>> On 14/01/2025 2:51 am, Jie Gan wrote:
>>>>
>>>>
>>>> On 1/13/2025 8:02 PM, James Clark wrote:
>>>>>
>>>>>
>>>>> On 26/12/2024 1:10 am, Jie Gan wrote:
>>>>>> Add 'trace_id' function pointer in ops. It's responsible for
>>>>>> retrieving the device's trace ID.
>>>>>>
>>>>>> Add 'struct cs_sink_data' to store the data that is needed by
>>>>>> coresight_enable_path/coresight_disable_path. The structure
>>>>>> will be transmitted to the helper and sink device to enable
>>>>>> related funcationalities.
>>>>>>
>>>>>
>>>>> The new cs_sink_data struct is quite specific to this change. Can 
>>>>> we start passing the path around to enable/disable functions, that 
>>>>> will allow devices to gather anything they want in the future. 
>>>>> Because we already have coresight_get_sink(path), 
>>>>> coresight_get_source(path) etc.
>>>>>
>>>>> And see below, but for this case we can also change the path struct 
>>>>> to contain the trace ID. Then all the new functions, allocations 
>>>>> and searches for the trace ID are unecessary. The CTCU will have 
>>>>> access to the path, and by the time its enable function is called 
>>>>> the trace ID is already assigned.
>>>>>
>>>>> It's also easier to understand at which point a trace ID is 
>>>>> allocated, rather than adding the trace_id() callbacks from 
>>>>> everywhere which could potentially either read or allocate. I 
>>>>> suppose that's "safer" because maybe it's not allocated, but I 
>>>>> can't see what case it would happen in reverse.
>>>>>
>>>> Thank you for comment. I will try this solution.
>>>> The biggest challenge for the patch is how to correctly read 
>>>> trace_id from source device and passthrough it to helper device as 
>>>> the source device always the last one to enable. I believe your 
>>>> proposed solution is better than mine and has minimal impact on the 
>>>> basic framework, but I think we still need read_trace in source_ops 
>>>> and link_ops. Then we can read the trace_id in coresight_build_path 
>>>> function and save it to the coresight_path to avoid redundant 
>>>> searching?
>>>>
>>>>
>>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>>> ---
>>>>>>   drivers/hwtracing/coresight/coresight-core.c  | 59 +++++++++++++ 
>>>>>> + +----
>>>>>>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>>>>>>   .../hwtracing/coresight/coresight-etm-perf.c  | 37 ++++++++++--
>>>>>>   .../coresight/coresight-etm3x-core.c          | 30 ++++++++++
>>>>>>   .../coresight/coresight-etm4x-core.c          | 29 +++++++++
>>>>>>   drivers/hwtracing/coresight/coresight-priv.h  | 13 +++-
>>>>>>   drivers/hwtracing/coresight/coresight-stm.c   | 22 +++++++
>>>>>>   drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++-
>>>>>>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>>>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>>>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 20 +++++++
>>>>>>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>>>>>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>>>>>>   include/linux/coresight.h                     |  6 ++
>>>>>>   14 files changed, 234 insertions(+), 25 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/ 
>>>>>> drivers/ hwtracing/coresight/coresight-core.c
>>>>>> index 0a9380350fb5..2e560b425fd4 100644
>>>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>>>> @@ -23,6 +23,7 @@
>>>>>>   #include "coresight-etm-perf.h"
>>>>>>   #include "coresight-priv.h"
>>>>>>   #include "coresight-syscfg.h"
>>>>>> +#include "coresight-trace-id.h"
>>>>>>   /*
>>>>>>    * Mutex used to lock all sysfs enable and disable actions and 
>>>>>> loading and
>>>>>> @@ -331,12 +332,12 @@ static int coresight_enable_helper(struct 
>>>>>> coresight_device *csdev,
>>>>>>       return helper_ops(csdev)->enable(csdev, mode, data);
>>>>>>   }
>>>>>> -static void coresight_disable_helper(struct coresight_device *csdev)
>>>>>> +static void coresight_disable_helper(struct coresight_device 
>>>>>> *csdev, void *data)
>>>>>>   {
>>>>>> -    helper_ops(csdev)->disable(csdev, NULL);
>>>>>> +    helper_ops(csdev)->disable(csdev, data);
>>>>>>   }
>>>>>> -static void coresight_disable_helpers(struct coresight_device 
>>>>>> *csdev)
>>>>>> +static void coresight_disable_helpers(struct coresight_device 
>>>>>> *csdev, void *data)
>>>>>>   {
>>>>>>       int i;
>>>>>>       struct coresight_device *helper;
>>>>>> @@ -344,7 +345,7 @@ static void coresight_disable_helpers(struct 
>>>>>> coresight_device *csdev)
>>>>>>       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>>>>>>           helper = csdev->pdata->out_conns[i]->dest_dev;
>>>>>>           if (helper && coresight_is_helper(helper))
>>>>>> -            coresight_disable_helper(helper);
>>>>>> +            coresight_disable_helper(helper, data);
>>>>>>       }
>>>>>>   }
>>>>>> @@ -361,7 +362,7 @@ static void coresight_disable_helpers(struct 
>>>>>> coresight_device *csdev)
>>>>>>   void coresight_disable_source(struct coresight_device *csdev, 
>>>>>> void *data)
>>>>>>   {
>>>>>>       source_ops(csdev)->disable(csdev, data);
>>>>>> -    coresight_disable_helpers(csdev);
>>>>>> +    coresight_disable_helpers(csdev, NULL);
>>>>>>   }
>>>>>>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>>>> @@ -371,7 +372,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>>>>    * disabled.
>>>>>>    */
>>>>>>   static void coresight_disable_path_from(struct list_head *path,
>>>>>> -                    struct coresight_node *nd)
>>>>>> +                    struct coresight_node *nd,
>>>>>> +                    void *sink_data)
>>>>>>   {
>>>>>>       u32 type;
>>>>>>       struct coresight_device *csdev, *parent, *child;
>>>>>> @@ -417,13 +419,13 @@ static void 
>>>>>> coresight_disable_path_from(struct list_head *path,
>>>>>>           }
>>>>>>           /* Disable all helpers adjacent along the path last */
>>>>>> -        coresight_disable_helpers(csdev);
>>>>>> +        coresight_disable_helpers(csdev, sink_data);
>>>>>>       }
>>>>>>   }
>>>>>> -void coresight_disable_path(struct list_head *path)
>>>>>> +void coresight_disable_path(struct list_head *path, void *sink_data)
>>>>>>   {
>>>>>> -    coresight_disable_path_from(path, NULL);
>>>>>> +    coresight_disable_path_from(path, NULL, sink_data);
>>>>>>   }
>>>>>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>>>>>> @@ -505,10 +507,47 @@ int coresight_enable_path(struct list_head 
>>>>>> *path, enum cs_mode mode,
>>>>>>   out:
>>>>>>       return ret;
>>>>>>   err:
>>>>>> -    coresight_disable_path_from(path, nd);
>>>>>> +    coresight_disable_path_from(path, nd, sink_data);
>>>>>>       goto out;
>>>>>>   }
>>>>>> +int coresight_read_traceid(struct list_head *path, enum cs_mode 
>>>>>> mode,
>>>>>> +               struct coresight_trace_id_map *id_map)
>>>>>> +{
>>>>>> +    int trace_id, type;
>>>>>> +    struct coresight_device *csdev;
>>>>>> +    struct coresight_node *nd;
>>>>>> +
>>>>>> +    list_for_each_entry(nd, path, link) {
>>>>>
>>>>> What do you think about also changing the path to this:
>>>>>
>>>>>   struct coresight_path {
>>>>>     struct list_head *path,
>>>>>     u8 trace_id
>>>>>   };
>>>>>
>>>> That's better, I can simplify the coresight_read_traceid function 
>>>> without traverse the path.
>>>>
>>>> But we still need to check the type of the coresight device, because 
>>>> the TPDM does not have traceid and we use the trace_id from the TPDA 
>>>> device that the TPDM connected. That's why I added trace_id to 
>>>> link_ops.
>>>>
>>>
>>> But if any device that allocates a trace ID saves it into the path, 
>>> then as long as any other device that needs the ID is enabled after 
>>> that it just reads it from the path directly. Assuming we pass the 
>>> path to every enable and disable function.
>>>
>>> We wouldn't need coresight_read_traceid() if it always happens that 
>>> way around, which I think it currently does?
>>>
>> I got your point here. You are right. If we passed path to the helper 
>> device, just use coresight_get_source to obtain the source device, 
>> then call the source_ops->trace_id to obtain the trace_id. So we 
>> definitely dont need a standalone function, coresight_read_traceid().
>>
>> Besides, I still need a function to retrive the trace_id of the TPDA 
>> device if the source device is TPDM, right?
>>
>>
>> Thanks,
>> Jie
>>
> 
> Yes, and that would require a search as the TPDA not always at one end 
> of the path like coresight_get_source() and coresight_get_sink(). Which 
> is why I was thinking it might be good to save the trace ID in the path 
> struct to avoid it.
> 
As you proposed, I created coresight_path structure as below:
struct coresight_path {
	struct perf_output_handle       *handle;
	struct list_head                *path;
	u8				trace_id;
};

In coresight_enable_path, I modified the parameters that transmitted to 
helper device:
struct coresight_path *cs_path;

coresight_enable_helpers(csdev, mode, sink_data) ->
coresight_enable_helpers(csdev, mode, cs_path)

The cs_path will be constructed and initialized in coresight_build_path 
function.

For perf mode, the trace_id is collected within etm_setup_aux and stored 
in cs_path->trace_id to avoid extra cost of retrieving the trace_id;

For sysfs mode, I let the CTCU device to retrieving the trace_id with 
path. The TPDA device is located close to the TPDM, making the cost of 
searching for the TPDA device acceptable.

The cs_path will be stored in the same manner as the previous path.

How do you think about this solution?

Thanks,
Jie

[...]


