Return-Path: <linux-arm-msm+bounces-45924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E2A1A11C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14B89169065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D9C20D4E2;
	Thu, 23 Jan 2025 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMOUMsAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487051E529
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625683; cv=none; b=Ve6YTyWcPDdViwDrUVd0UvUWvz7jt3GrxmheveqOyXKjh9wKDbqzOypTxEj6uTCXaEqgRyCY/rsqDdMHORQIsU3wUHRBLAcBB67l5dCQVE5heKa/NCINXq+VgDOaaim3baFqf1CRKuxjiIula3i3b6fFJgac0zjcioDYNdxiJ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625683; c=relaxed/simple;
	bh=nrKHJmfJvwFv5nrJrHVM9swIhDVxD0sXbo2x8jdEiTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASmS12LpetqUs2oZ3UX8nWicVKYzpBh4fTpUd31jn6DRrwdrSQV+t2t8paAE6J5VaKSM4sdzPZ84CnLDapyzu1kZvuod3TuH3w2HkGn69yh+1liwI0ItOxhQJuiNQur84zkohSytMIXFS5CPeXg1RY9n7+h90dO8yyrLGeDV2bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMOUMsAR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436a39e4891so4323425e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 01:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737625677; x=1738230477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pE8zu1icsKGI4WzbfxHVe5+VKJ63wSeyle9mUsYhVpk=;
        b=rMOUMsARWO4VsrxmS52EwqcfxKYkFudIcZ2aC/JYAb83ikKsL7GWljP0sPRCzlswS9
         iBOynfDnQDrWMlJuKu2r12P0vgd5Gzx+n7VsxIvCdQkTmyPQ2adSeE/zJw71cY1a7A0S
         PmsZ0onrSqOrPHYeCMpP6i2xxqyl4UiHLBWnKR21vxFkGJwcNUKsXmViurNvY1kawRxm
         SkqQ6sL3B+cygqfR5iJ6RpqUSZRHwfP+uebLJtdHjP+cZnUs1cX/M/1WDCvJPHYYjpIh
         g/ER/Rzc5qNqrT+r1PywJEoJG5QU4H/NJ4LfjguR65vPsqXzHvQN2M90+24qs3auVimM
         UlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737625677; x=1738230477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pE8zu1icsKGI4WzbfxHVe5+VKJ63wSeyle9mUsYhVpk=;
        b=RZVLiSv3BgXPRMOKxeJth8CXQbfkCanvQqYk/BhyJDXae+jNrDA6UO2GKlhMCMLhSq
         Q8CpSjNe+KtysSIA0EkWASKhp82bTyDTZAatMnMyQxYd1UhK5c41koPqfSIIXnIyVfk6
         ypjyjZVPxLlHA0D9vyesWGjBcXaoeH5GeFqPdyqBazrsuPzsjmUmiBoDQV66mOKNL5j2
         Qdfem2KWT30EWPROtf/2wPMIK+kI+VIvQriZLK+5CRxkShkvikhSOm7WOEkQR2+5N/yz
         qwMyHoOfM5Aqgrp4w967qluejrmIAOWBpFphynwuzTI5idZHklyEuI86eI9CML9mwJCl
         0whg==
X-Forwarded-Encrypted: i=1; AJvYcCUuMFM+OD/P0TMMDTaCHNVbJsQWewM4j56Th1VbGhYBJIsTS3Ryu75hJP/sb4vzTDh/zWK96ygoJxhPFzvF@vger.kernel.org
X-Gm-Message-State: AOJu0YzWXdZIbPQXjC8wyLldvNHx4vTYHAhr30YLCHHajS+HNHYOGlHU
	PPIVCxMcpaL07Ol6ElV5pKHw3dj8T3jZvO0Xcays9457OQu4f1H9JaNcZ1Yu2ns=
X-Gm-Gg: ASbGncvUrWGmhTBMsWsWwo/Sh4ByqPSlvLpwYtiubzFlxwjrv1xguzXakz2jPbQm7bS
	yAx2sqVdpQBR8aOqKACd1gPOaPyuAaXNGk92HzMGD29Vw8jvc8ZQ6E7G0qpaTQ5W6jVlvIiIc/c
	lUEVtDTlbuvMimY4Mv6XSeJJ7yqozVKOewDsGLQiPUH58FREzw8MoAoX04hGd2K6Q8h1CoXGR+M
	2+f8f+sCilXesEhP9GCXtIQpeTvgFxTNQJTmSxeMdkxxlo6fPzGnJBpyZTGqdfGktVwVTNre1j1
	Z349IiqoBZL0Ng2HztzwqC5YJQ==
X-Google-Smtp-Source: AGHT+IFpGqRI0uhBypE/kYoa6OZDlbHAQ8rUyR6P1QE9rkifRtaAfLASqqNBOYiJi0VPAsrex6S5zQ==
X-Received: by 2002:a05:600c:a03:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-438913ed350mr243080405e9.12.1737625677484;
        Thu, 23 Jan 2025 01:47:57 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b3189924sm57873625e9.3.2025.01.23.01.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 01:47:57 -0800 (PST)
Message-ID: <a0864e05-f4a6-49e1-ae7d-0c471d038210@linaro.org>
Date: Thu, 23 Jan 2025 09:47:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] Coresight: Add trace_id function to retrieving the
 trace ID
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-3-quic_jiegan@quicinc.com>
 <64731493-4bd1-4707-9452-5ca86744875b@linaro.org>
 <d0c19d60-1043-4ac3-904f-c5b70ed32138@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <d0c19d60-1043-4ac3-904f-c5b70ed32138@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/01/2025 6:28 am, Jie Gan wrote:
> 
> 
> On 1/13/2025 8:02 PM, James Clark wrote:
>>
>>
>> On 26/12/2024 1:10 am, Jie Gan wrote:
>>> Add 'trace_id' function pointer in ops. It's responsible for
>>> retrieving the device's trace ID.
>>>
>>> Add 'struct cs_sink_data' to store the data that is needed by
>>> coresight_enable_path/coresight_disable_path. The structure
>>> will be transmitted to the helper and sink device to enable
>>> related funcationalities.
>>>
>>
>> The new cs_sink_data struct is quite specific to this change. Can we 
>> start passing the path around to enable/disable functions, that will 
>> allow devices to gather anything they want in the future. Because we 
>> already have coresight_get_sink(path), coresight_get_source(path) etc.
>>
>> And see below, but for this case we can also change the path struct to 
>> contain the trace ID. Then all the new functions, allocations and 
>> searches for the trace ID are unecessary. The CTCU will have access to 
>> the path, and by the time its enable function is called the trace ID 
>> is already assigned.
>>
>> It's also easier to understand at which point a trace ID is allocated, 
>> rather than adding the trace_id() callbacks from everywhere which 
>> could potentially either read or allocate. I suppose that's "safer" 
>> because maybe it's not allocated, but I can't see what case it would 
>> happen in reverse.
>>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c  | 59 +++++++++++++++----
>>>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>>>   .../hwtracing/coresight/coresight-etm-perf.c  | 37 ++++++++++--
>>>   .../coresight/coresight-etm3x-core.c          | 30 ++++++++++
>>>   .../coresight/coresight-etm4x-core.c          | 29 +++++++++
>>>   drivers/hwtracing/coresight/coresight-priv.h  | 13 +++-
>>>   drivers/hwtracing/coresight/coresight-stm.c   | 22 +++++++
>>>   drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++-
>>>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 20 +++++++
>>>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>>>   include/linux/coresight.h                     |  6 ++
>>>   14 files changed, 234 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>> hwtracing/coresight/coresight-core.c
>>> index 0a9380350fb5..2e560b425fd4 100644
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -23,6 +23,7 @@
>>>   #include "coresight-etm-perf.h"
>>>   #include "coresight-priv.h"
>>>   #include "coresight-syscfg.h"
>>> +#include "coresight-trace-id.h"
>>>   /*
>>>    * Mutex used to lock all sysfs enable and disable actions and 
>>> loading and
>>> @@ -331,12 +332,12 @@ static int coresight_enable_helper(struct 
>>> coresight_device *csdev,
>>>       return helper_ops(csdev)->enable(csdev, mode, data);
>>>   }
>>> -static void coresight_disable_helper(struct coresight_device *csdev)
>>> +static void coresight_disable_helper(struct coresight_device *csdev, 
>>> void *data)
>>>   {
>>> -    helper_ops(csdev)->disable(csdev, NULL);
>>> +    helper_ops(csdev)->disable(csdev, data);
>>>   }
>>> -static void coresight_disable_helpers(struct coresight_device *csdev)
>>> +static void coresight_disable_helpers(struct coresight_device 
>>> *csdev, void *data)
>>>   {
>>>       int i;
>>>       struct coresight_device *helper;
>>> @@ -344,7 +345,7 @@ static void coresight_disable_helpers(struct 
>>> coresight_device *csdev)
>>>       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>>>           helper = csdev->pdata->out_conns[i]->dest_dev;
>>>           if (helper && coresight_is_helper(helper))
>>> -            coresight_disable_helper(helper);
>>> +            coresight_disable_helper(helper, data);
>>>       }
>>>   }
>>> @@ -361,7 +362,7 @@ static void coresight_disable_helpers(struct 
>>> coresight_device *csdev)
>>>   void coresight_disable_source(struct coresight_device *csdev, void 
>>> *data)
>>>   {
>>>       source_ops(csdev)->disable(csdev, data);
>>> -    coresight_disable_helpers(csdev);
>>> +    coresight_disable_helpers(csdev, NULL);
>>>   }
>>>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>>> @@ -371,7 +372,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>    * disabled.
>>>    */
>>>   static void coresight_disable_path_from(struct list_head *path,
>>> -                    struct coresight_node *nd)
>>> +                    struct coresight_node *nd,
>>> +                    void *sink_data)
>>>   {
>>>       u32 type;
>>>       struct coresight_device *csdev, *parent, *child;
>>> @@ -417,13 +419,13 @@ static void coresight_disable_path_from(struct 
>>> list_head *path,
>>>           }
>>>           /* Disable all helpers adjacent along the path last */
>>> -        coresight_disable_helpers(csdev);
>>> +        coresight_disable_helpers(csdev, sink_data);
>>>       }
>>>   }
>>> -void coresight_disable_path(struct list_head *path)
>>> +void coresight_disable_path(struct list_head *path, void *sink_data)
>>>   {
>>> -    coresight_disable_path_from(path, NULL);
>>> +    coresight_disable_path_from(path, NULL, sink_data);
>>>   }
>>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>>> @@ -505,10 +507,47 @@ int coresight_enable_path(struct list_head 
>>> *path, enum cs_mode mode,
>>>   out:
>>>       return ret;
>>>   err:
>>> -    coresight_disable_path_from(path, nd);
>>> +    coresight_disable_path_from(path, nd, sink_data);
>>>       goto out;
>>>   }
>>> +int coresight_read_traceid(struct list_head *path, enum cs_mode mode,
>>> +               struct coresight_trace_id_map *id_map)
>>> +{
>>> +    int trace_id, type;
>>> +    struct coresight_device *csdev;
>>> +    struct coresight_node *nd;
>>> +
>>> +    list_for_each_entry(nd, path, link) {
>>
>> What do you think about also changing the path to this:
>>
>>   struct coresight_path {
>>     struct list_head *path,
>>     u8 trace_id
>>   };
>>
>> That would avoid having to traverse the path on every enable and would 
>> remove this function. You could also cache the trace ID in the CTCU 
>> for a similar benefit, but it wouldn't remove the need to call this at 
>> least once.
>>
>> The expensive part should be the create path part, after that enable 
>> and disable should be cheap because they happen on schedule for Perf 
>> mode. We should be avoiding allocations and searches.
>>
>>> +        csdev = nd->csdev;
>>> +        type = csdev->type;
>>> +
>>> +        switch (type) {
>>> +        case CORESIGHT_DEV_TYPE_SOURCE:
>>> +            if (source_ops(csdev)->trace_id != NULL) {
>>> +                trace_id = source_ops(csdev)->trace_id(csdev,
>>> +                                       mode,
>>> +                                       id_map);
>>> +                if (IS_VALID_CS_TRACE_ID(trace_id))
>>> +                    goto out;
>>> +            }
>>> +            break;
>>> +        case CORESIGHT_DEV_TYPE_LINK:
>>> +            if (link_ops(csdev)->trace_id != NULL) {
>>> +                trace_id = link_ops(csdev)->trace_id(csdev);
>>> +                if (IS_VALID_CS_TRACE_ID(trace_id))
>>> +                    goto out;
>>> +            }
>>> +            break;
>>> +        default:
>>> +            break;
>>> +        }
>>> +    }
>>> +    return -EINVAL;
>>> +out:
>>> +    return trace_id;
>>> +}
>>> +
>>>   struct coresight_device *coresight_get_sink(struct list_head *path)
>>>   {
>>>       struct coresight_device *csdev;
>>> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/ 
>>> hwtracing/coresight/coresight-etb10.c
>>> index aea9ac9c4bd0..904b5531c256 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etb10.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
>>> @@ -173,7 +173,8 @@ static int etb_enable_perf(struct 
>>> coresight_device *csdev, void *data)
>>>       pid_t pid;
>>>       unsigned long flags;
>>>       struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> -    struct perf_output_handle *handle = data;
>>> +    struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>>> +    struct perf_output_handle *handle = sink_data->handle;
>>>       struct cs_buffers *buf = etm_perf_sink_config(handle);
>>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/ 
>>> drivers/hwtracing/coresight/coresight-etm-perf.c
>>> index ad6a8f4b70b6..e676edd42ddc 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>> @@ -459,6 +459,7 @@ static void etm_event_start(struct perf_event 
>>> *event, int flags)
>>>       struct perf_output_handle *handle = &ctxt->handle;
>>>       struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
>>>       struct list_head *path;
>>> +    struct cs_sink_data *sink_data = NULL;
>>>       u64 hw_id;
>>>       u8 trace_id;
>>> @@ -498,9 +499,20 @@ static void etm_event_start(struct perf_event 
>>> *event, int flags)
>>>       if (WARN_ON_ONCE(!sink))
>>>           goto fail_end_stop;
>>> +    sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
>>
>> kzalloc can't be called from here. Check dmesg for the warning. That's 
>> another reason to do this change on the path. Because the path is 
>> allocated on etm_setup_aux() where allocations are allowed.
>>
> Hi, James
> I just tried with following command and did not observe any warning info 
> from dmesg, may I ask what's the issue may suffered here?
> 

You might be missing some debugging configs like lockdep etc. The 
warning is that etm_event_start() is a non-sleepable context and kzalloc 
is sleepable. Even if it wasn't an error we still wouldn't want to do 
it, etm_event_start() and stop are called too frequently.

> root@qemuarm64:/data# ./perf record -e cs_etm/@tmc_etr0/ --per-thread ls
> configs        kernel.txt     logs           lost+found     misc   
> perf           perf.data      perf.data.old  root           time      
> tzstorage      weston
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.145 MB perf.data ]
> 
> For the new patch version, I implemented an 8-bit hash table in the CTCU 
> driver data to handle situations where multiple TPDMs are connected to 
> the same TPDA device have been enabled. As we know, TPDMs share the 
> trace_id of the TPDA device they are connected to. If we reset the bit 
> based on the trace_id without checking the enabled refcount, it causes 
> an issue where trace data from other enabled TPDM devices (sharing the 
> same trace_id) cannot enter the ETR buffer, as it gets filtered out by 
> the CTCU.
I think sharing the code or a diagram might be easier to follow here. 
The mention of a refcount makes sense but I don't follow the need for a 
hash table. There are other places where single devices are shared by 
multiple paths, like funnels, and they're all done with refcounts.

> I need allocate memory when implement hash table(add/remove key entry) 
> in coresight_enable_path flow, but you mentioned we cannot call kzalloc 
> from here.
> 
> Thanks,
> Jie
> 

Why not allocate on setup_aux()? That's called by userspace before the 
session starts, and then the path is fixed from that point onwards so 
you shouldn't need to do any more allocations. That's how it's setup 
currently anyway.


