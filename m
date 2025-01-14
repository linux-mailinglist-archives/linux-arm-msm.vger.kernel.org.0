Return-Path: <linux-arm-msm+bounces-44985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB9A103A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97DF818896DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2DA1ADC9F;
	Tue, 14 Jan 2025 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AgdKAen/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6341ADC94
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849265; cv=none; b=SbUSKqkbckNBKTVjip21ITTXr24zl7SHQH+GQ8SWp3SQAnj9ba/Lnc5RrCCXx0xS2cmcb9DMGcqXgM7qJDDOVyWV18gGcp20WQvekBHkDSxQXCL+sFrhhOX1g+1nTDwmsVWJY84XmYu+T0sO2Htc5da3Ps06O0T9t6QeIqTub2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849265; c=relaxed/simple;
	bh=6oZ2Jz2zJv2IqBlK5lWqNRzb4uxpdcLwbeoT2JWvDYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIhVR8U01oahypXnNJa6U26iViz2T4pBEGcig3+j+LJzMaDePl+ebylQHNDJFJ1KkF6sZ8DLe1N5x/krSpaLNrVmqSO1sacToxxaGPBEa8wKRSu+AjSZacMlpiUkxOXTSXvVhxgHaE+jZ70eoT1L5Qk6v5Rr/vCszyxYx2R1bNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AgdKAen/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso37589775e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 02:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736849261; x=1737454061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sb6IcRR1VBS23ksVVYBj3l/2O6O60UoYzrUjBSlWKxA=;
        b=AgdKAen/V0F8Vh+7nvfLo8Y++i7pwTtEEOUGpu9cbT9osw+odfVd4lPN/Mn/UvWxIs
         2w3kve+Bc76ctfeFIpgCtGOf1mv5YnsYybEJA7AAy51W4WgCb/MAiHJ9WazlkaGyKwbT
         W0KF2Hw9rdWm4rI0c4waAjzHNAn2A51x8fFEDR9MXVL9BlhouYUw9Oh4zIGtKyH1uZR8
         F8wt0Db1CoVEVIZKuTpSKpUWUCEK6uT8x28cD5w8VEr+djJ9KmaJ04NeDl9oBOWpn3UG
         ozxTa14eGxiKzaWnz+5XOlZh6PLMUuenQjj+THlNEj9fH+/jt/gN8dEUaWxTfnAiaG+l
         WpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736849261; x=1737454061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sb6IcRR1VBS23ksVVYBj3l/2O6O60UoYzrUjBSlWKxA=;
        b=YO5R676Ksaq/a2iHyTaPl4ACJgMypfhLc30MpCFGzQaaT01yWX67pa4GL+TCIQI544
         9WeRiipmNZuv3SbgyXM+zv6LVxIctUnAJKZuqMN1Txc5EtFSxoPC38LsJ1YrfYkG9JJ6
         r8o8Frfq3fGws+q9vYSVh07+QdCvJizRvnayHwWwLAdr5B6oH5Rld1vSXG3x75Bahjvq
         WbQ2MVhQg46Mgo21wZJx6omTOPFq36ljd7OEfPRxarxYJ1anis8ft96TaojajA5itzrI
         t066E4KhLMVoEkztUjfdGKi8vhZxKo4TdA/V05oa0CmyDFOwK+zQ5pV5D48jsD43jwpr
         mKdw==
X-Forwarded-Encrypted: i=1; AJvYcCUqLLctJjXFDJOYomvhMA/6CxbeyQf86jnacYkPbyU44lE9NkJA8U0r61ptYcsc/GViOU6AtAdHDF1ar0xr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw23srdlE3trPZKNNRtaYsmAO0pJ9gPwfn08PM0XgXD708VXnYI
	xoeyV/SeYIGERVF+gqmQrxa7iW1BNddRsMBwiQQWAcyMOo5zi661gbLN4E6NYhs=
X-Gm-Gg: ASbGncvDPLM6EIIZ+Vo/6saLj7La/jaUmqzn/xVkarRVpmeeefH5DgfnaHzzpuclksO
	wV/JY7wYoc7WoFmyDI+tqUVCa4V87ePvE3jBTOvf4NM7i8L7rrWJQnZqVsMmjvxpWQcO8M5Kt+F
	EMEyJWSZSYjB5N/RdRAE3CVzaYH+4Wpy415bDeMGoDQEkDGEh0+coetFqjeh0wAAAcoUF7ZXR91
	tQLJnC9zUSjR9Ltwzrq07XnP6OBKJEn8/nJfiZ+6ax7n4vi65QELisjrqZad8MUqsAB
X-Google-Smtp-Source: AGHT+IGRCbVuMnNLAp0rJU/c8bD6seknuP4BFHCiEw/vEBDDEFmZF6o4MRy2iLfghLjsKd3VeyiVKw==
X-Received: by 2002:a05:600c:3c82:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-436e2696082mr216790035e9.9.1736849261110;
        Tue, 14 Jan 2025 02:07:41 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c1664e8dsm9932065e9.1.2025.01.14.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 02:07:40 -0800 (PST)
Message-ID: <02f114b7-8654-4402-b105-7aef41d487f0@linaro.org>
Date: Tue, 14 Jan 2025 10:07:38 +0000
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
 <a2d995bc-02ff-4374-968e-2fa6d8f921dd@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a2d995bc-02ff-4374-968e-2fa6d8f921dd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/01/2025 2:51 am, Jie Gan wrote:
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
> Thank you for comment. I will try this solution.
> The biggest challenge for the patch is how to correctly read trace_id 
> from source device and passthrough it to helper device as the source 
> device always the last one to enable. I believe your proposed solution 
> is better than mine and has minimal impact on the basic framework, but I 
> think we still need read_trace in source_ops and link_ops. Then we can 
> read the trace_id in coresight_build_path function and save it to the 
> coresight_path to avoid redundant searching?
> 
> 
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
> That's better, I can simplify the coresight_read_traceid function 
> without traverse the path.
> 
> But we still need to check the type of the coresight device, because the 
> TPDM does not have traceid and we use the trace_id from the TPDA device 
> that the TPDM connected. That's why I added trace_id to link_ops.
> 

But if any device that allocates a trace ID saves it into the path, then 
as long as any other device that needs the ID is enabled after that it 
just reads it from the path directly. Assuming we pass the path to every 
enable and disable function.

We wouldn't need coresight_read_traceid() if it always happens that way 
around, which I think it currently does?

> 
>> That would avoid having to traverse the path on every enable and would 
>> remove this function. You could also cache the trace ID in the CTCU 
>> for a similar benefit, but it wouldn't remove the need to call this at 
>> least once.
>>
>> The expensive part should be the create path part, after that enable 
>> and disable should be cheap because they happen on schedule for Perf 
>> mode. We should be avoiding allocations and searches.
>>
> I can move the read trace_id logic to build_path function, I believe 
> it's better than current solution.
> 
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
> Will fix it.
> 
> 
>>> +    if (!sink_data)
>>> +        goto fail_end_stop;
>>> +
>>> +    sink_data->sink = sink;
>>> +    sink_data->traceid = coresight_read_traceid(path, CS_MODE_PERF,
>>> +                            &sink->perf_sink_id_map);
>>> +    sink_data->handle = handle;
>>> +
>>>       /* Nothing will happen without a path */
>>> -    if (coresight_enable_path(path, CS_MODE_PERF, handle))
>>> +    if (coresight_enable_path(path, CS_MODE_PERF, sink_data)) {
>>> +        kfree(sink_data);
>>>           goto fail_end_stop;
>>> +    }
>>>       /* Finally enable the tracer */
>>>       if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
>>> @@ -526,6 +538,7 @@ static void etm_event_start(struct perf_event 
>>> *event, int flags)
>>>           perf_report_aux_output_id(event, hw_id);
>>>       }
>>> +    kfree(sink_data);
>>>   out:
>>>       /* Tell the perf core the event is alive */
>>>       event->hw.state = 0;
>>> @@ -534,7 +547,8 @@ static void etm_event_start(struct perf_event 
>>> *event, int flags)
>>>       return;
>>>   fail_disable_path:
>>> -    coresight_disable_path(path);
>>> +    coresight_disable_path(path, sink_data);
>>> +    kfree(sink_data);
>>>   fail_end_stop:
>>>       /*
>>>        * Check if the handle is still associated with the event,
>>> @@ -559,6 +573,7 @@ static void etm_event_stop(struct perf_event 
>>> *event, int mode)
>>>       struct perf_output_handle *handle = &ctxt->handle;
>>>       struct etm_event_data *event_data;
>>>       struct list_head *path;
>>> +    struct cs_sink_data *sink_data = NULL;
>>>       /*
>>>        * If we still have access to the event_data via handle,
>>> @@ -603,6 +618,10 @@ static void etm_event_stop(struct perf_event 
>>> *event, int mode)
>>>       if (!sink)
>>>           return;
>>> +    sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
>>
>> Same problem as above.
>>
>>> +    if (!sink_data)
>>> +        return;
>>> +
>>>       /* stop tracer */
>>>       coresight_disable_source(csdev, event);
>>> @@ -616,12 +635,16 @@ static void etm_event_stop(struct perf_event 
>>> *event, int mode)
>>>        * have to do anything here.
>>>        */
>>>       if (handle->event && (mode & PERF_EF_UPDATE)) {
>>> -        if (WARN_ON_ONCE(handle->event != event))
>>> +        if (WARN_ON_ONCE(handle->event != event)) {
>>> +            kfree(sink_data);
>>>               return;
>>> +        }
>>>           /* update trace information */
>>> -        if (!sink_ops(sink)->update_buffer)
>>> +        if (!sink_ops(sink)->update_buffer) {
>>> +            kfree(sink_data);
>>>               return;
>>> +        }
>>>           size = sink_ops(sink)->update_buffer(sink, handle,
>>>                             event_data->snk_config);
>>> @@ -642,8 +665,12 @@ static void etm_event_stop(struct perf_event 
>>> *event, int mode)
>>>               WARN_ON(size);
>>>       }
>>> +    sink_data->sink = sink;
>>> +    sink_data->traceid = coresight_read_traceid(path, CS_MODE_PERF,
>>> +                            &sink->perf_sink_id_map);
>>>       /* Disabling the path make its elements available to other 
>>> sessions */
>>> -    coresight_disable_path(path);
>>> +    coresight_disable_path(path, sink_data);
>>> +    kfree(sink_data);
>>>   }
>>>   static int etm_event_add(struct perf_event *event, int mode)
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-etm3x-core.c
>>> index c103f4c70f5d..0f095fab7e0a 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>>> @@ -697,10 +697,40 @@ static void etm_disable(struct coresight_device 
>>> *csdev,
>>>           coresight_set_mode(csdev, CS_MODE_DISABLED);
>>>   }
>>> +static int etm_trace_id(struct coresight_device *csdev,
>>> +            enum cs_mode mode,
>>> +            struct coresight_trace_id_map *id_map)
>>> +{
>>> +    int trace_id;
>>> +    struct etm_drvdata *drvdata;
>>> +
>>> +    if (csdev == NULL)
>>> +        return -EINVAL;
>>> +
>>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    switch (mode) {
>>> +    case CS_MODE_SYSFS:
>>> +        trace_id = etm_read_alloc_trace_id(drvdata);
>>> +        break;
>>> +    case CS_MODE_PERF:
>>> +        trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, 
>>> id_map);
>>> +        if (IS_VALID_CS_TRACE_ID(trace_id))
>>> +            drvdata->traceid = (u8)trace_id;
>>> +        break;
>>> +    default:
>>> +        trace_id = -EINVAL;
>>> +        break;
>>> +    }
>>> +
>>> +    return trace_id;
>>> +}
>>> +
>>> +
>>>   static const struct coresight_ops_source etm_source_ops = {
>>>       .cpu_id        = etm_cpu_id,
>>>       .enable        = etm_enable,
>>>       .disable    = etm_disable,
>>> +    .trace_id    = etm_trace_id,
>>>   };
>>>   static const struct coresight_ops etm_cs_ops = {
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index dd8c74f893db..bac9ea371688 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -1025,10 +1025,39 @@ static void etm4_disable(struct 
>>> coresight_device *csdev,
>>>           coresight_set_mode(csdev, CS_MODE_DISABLED);
>>>   }
>>> +static int etm4_trace_id(struct coresight_device *csdev,
>>> +             enum cs_mode mode,
>>> +             struct coresight_trace_id_map *id_map)
>>> +{
>>> +    int trace_id;
>>> +    struct etmv4_drvdata *drvdata;
>>> +
>>> +    if (csdev == NULL)
>>> +        return -EINVAL;
>>> +
>>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    switch (mode) {
>>> +    case CS_MODE_SYSFS:
>>> +        trace_id = etm4_read_alloc_trace_id(drvdata);
>>> +        break;
>>> +    case CS_MODE_PERF:
>>> +        trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, 
>>> id_map);
>>> +        if (IS_VALID_CS_TRACE_ID(trace_id))
>>> +            drvdata->trcid = (u8)trace_id;
>>> +        break;
>>> +    default:
>>> +        trace_id = -EINVAL;
>>> +        break;
>>> +    }
>>> +
>>> +    return trace_id;
>>> +}
>>> +
>>>   static const struct coresight_ops_source etm4_source_ops = {
>>>       .cpu_id        = etm4_cpu_id,
>>>       .enable        = etm4_enable,
>>>       .disable    = etm4_disable,
>>> +    .trace_id    = etm4_trace_id,
>>>   };
>>>   static const struct coresight_ops etm4_cs_ops = {
>>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/ 
>>> hwtracing/coresight/coresight-priv.h
>>> index 05f891ca6b5c..6a95a3ba9339 100644
>>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>>> @@ -105,6 +105,15 @@ struct cs_buffers {
>>>       void            **data_pages;
>>>   };
>>> +/**
>>> + * struct cs_sink_data - data used by coresight_enable_path/ 
>>> coresight_disable_path
>>> + */
>>> +struct cs_sink_data {
>>> +    struct perf_output_handle    *handle;
>>> +    struct coresight_device        *sink;
>>> +    u8                traceid;
>>> +};
>>> +
>>>   static inline void coresight_insert_barrier_packet(void *buf)
>>>   {
>>>       if (buf)
>>> @@ -129,9 +138,11 @@ static inline void CS_UNLOCK(void __iomem *addr)
>>>       } while (0);
>>>   }
>>> -void coresight_disable_path(struct list_head *path);
>>> +void coresight_disable_path(struct list_head *path, void *sink_data);
>>>   int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>>>                 void *sink_data);
>>> +int coresight_read_traceid(struct list_head *path, enum cs_mode mode,
>>> +               struct coresight_trace_id_map *id_map);
>>>   struct coresight_device *coresight_get_sink(struct list_head *path);
>>>   struct coresight_device *coresight_get_sink_by_id(u32 id);
>>>   struct coresight_device *
>>> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/ 
>>> hwtracing/coresight/coresight-stm.c
>>> index b581a30a1cd9..5709eda77d9b 100644
>>> --- a/drivers/hwtracing/coresight/coresight-stm.c
>>> +++ b/drivers/hwtracing/coresight/coresight-stm.c
>>> @@ -281,9 +281,31 @@ static void stm_disable(struct coresight_device 
>>> *csdev,
>>>       }
>>>   }
>>> +static int stm_trace_id(struct coresight_device *csdev,
>>> +            enum cs_mode mode,
>>> +            struct coresight_trace_id_map *id_map)
>>> +{
>>> +    int trace_id;
>>> +    struct stm_drvdata *drvdata;
>>> +
>>> +    if (csdev == NULL)
>>> +        return -EINVAL;
>>> +
>>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    trace_id = drvdata->traceid;
>>> +    if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>
>> Trace ID is static and always set for STM so this isn't necessary, 
>> just return drvdata->traceid which would already be valid otherwise 
>> the device wouldn't be registered.
>>
> Thanks for comment.
> Will fix in next version
> 
> 
>>> +        trace_id = coresight_trace_id_get_system_id();
>>> +        if (IS_VALID_CS_TRACE_ID(trace_id))
>>> +            drvdata->traceid = (u8)trace_id;
>>> +    }
>>> +
>>> +    return trace_id;
>>> +}
>>> +
>>>   static const struct coresight_ops_source stm_source_ops = {
>>>       .enable        = stm_enable,
>>>       .disable    = stm_disable,
>>> +    .trace_id    = stm_trace_id,
>>>   };
>>>   static const struct coresight_ops stm_cs_ops = {
>>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/ 
>>> hwtracing/coresight/coresight-sysfs.c
>>> index a01c9e54e2ed..8816bccba374 100644
>>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>>> @@ -168,6 +168,7 @@ int coresight_enable_sysfs(struct 
>>> coresight_device *csdev)
>>>       int cpu, ret = 0;
>>>       struct coresight_device *sink;
>>>       struct list_head *path;
>>> +    struct cs_sink_data *sink_data;
>>>       enum coresight_dev_subtype_source subtype;
>>>       u32 hash;
>>> @@ -209,7 +210,14 @@ int coresight_enable_sysfs(struct 
>>> coresight_device *csdev)
>>>           goto out;
>>>       }
>>> -    ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
>>> +    sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
>>> +    if (!sink_data) {
>>> +        ret = -ENOMEM;
>>> +        goto out;
>>> +    }
>>> +    sink_data->traceid = coresight_read_traceid(path, CS_MODE_SYSFS, 
>>> NULL);
>>> +    sink_data->sink = sink;
>>> +    ret = coresight_enable_path(path, CS_MODE_SYSFS, sink_data);
>>>       if (ret)
>>>           goto err_path;
>>> @@ -246,15 +254,17 @@ int coresight_enable_sysfs(struct 
>>> coresight_device *csdev)
>>>           break;
>>>       }
>>> +    kfree(sink_data);
>>>   out:
>>>       mutex_unlock(&coresight_mutex);
>>>       return ret;
>>>   err_source:
>>> -    coresight_disable_path(path);
>>> +    coresight_disable_path(path, sink_data);
>>>   err_path:
>>>       coresight_release_path(path);
>>> +    kfree(sink_data);
>>>       goto out;
>>>   }
>>>   EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
>>> @@ -263,6 +273,7 @@ void coresight_disable_sysfs(struct 
>>> coresight_device *csdev)
>>>   {
>>>       int cpu, ret;
>>>       struct list_head *path = NULL;
>>> +    struct cs_sink_data *sink_data = NULL;
>>>       u32 hash;
>>>       mutex_lock(&coresight_mutex);
>>> @@ -274,6 +285,10 @@ void coresight_disable_sysfs(struct 
>>> coresight_device *csdev)
>>>       if (!coresight_disable_source_sysfs(csdev, NULL))
>>>           goto out;
>>> +    sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
>>> +    if (!sink_data)
>>> +        goto out;
>>> +
>>>       switch (csdev->subtype.source_subtype) {
>>>       case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
>>>           cpu = source_ops(csdev)->cpu_id(csdev);
>>> @@ -297,8 +312,11 @@ void coresight_disable_sysfs(struct 
>>> coresight_device *csdev)
>>>           break;
>>>       }
>>> -    coresight_disable_path(path);
>>> +    sink_data->sink = coresight_find_activated_sysfs_sink(csdev);
>>> +    sink_data->traceid = coresight_read_traceid(path, CS_MODE_SYSFS, 
>>> NULL);
>>> +    coresight_disable_path(path, sink_data);
>>>       coresight_release_path(path);
>>> +    kfree(sink_data);
>>>   out:
>>>       mutex_unlock(&coresight_mutex);
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-etf.c
>>> index d4f641cd9de6..7dc536eba3e2 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>>> @@ -250,7 +250,8 @@ static int tmc_enable_etf_sink_perf(struct 
>>> coresight_device *csdev, void *data)
>>>       pid_t pid;
>>>       unsigned long flags;
>>>       struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> -    struct perf_output_handle *handle = data;
>>> +    struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>>> +    struct perf_output_handle *handle = sink_data->handle;
>>>       struct cs_buffers *buf = etm_perf_sink_config(handle);
>>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> index a48bb85d0e7f..90a4058c9959 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> @@ -1254,7 +1254,8 @@ static int tmc_enable_etr_sink_sysfs(struct 
>>> coresight_device *csdev)
>>>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>>>                      enum cs_mode mode, void *data)
>>>   {
>>> -    struct perf_output_handle *handle = data;
>>> +    struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>>> +    struct perf_output_handle *handle = sink_data->handle;
>>>       struct etr_perf_buffer *etr_perf;
>>>       switch (mode) {
>>> @@ -1648,7 +1649,8 @@ static int tmc_enable_etr_sink_perf(struct 
>>> coresight_device *csdev, void *data)
>>>       pid_t pid;
>>>       unsigned long flags;
>>>       struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> -    struct perf_output_handle *handle = data;
>>> +    struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>>> +    struct perf_output_handle *handle = sink_data->handle;
>>>       struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>>>       spin_lock_irqsave(&drvdata->spinlock, flags);
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.c
>>> index 189a4abc2561..05622333f2d2 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -241,9 +241,29 @@ static void tpda_disable(struct coresight_device 
>>> *csdev,
>>>       dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>>>   }
>>> +static int tpda_trace_id(struct coresight_device *csdev)
>>> +{
>>> +    int trace_id;
>>> +    struct tpda_drvdata *drvdata;
>>> +
>>> +    if (csdev == NULL)
>>> +        return -EINVAL;
>>> +
>>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    trace_id = drvdata->atid;
>>> +    if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>>
>> Same comment as STM. This is always set so no ned to try to assign 
>> another one.
>>
> Will fix.
> 
> [...]
> 
> Thanks,
> Jie
> 


