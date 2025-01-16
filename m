Return-Path: <linux-arm-msm+bounces-45249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E9A13799
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D635D1889E64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B9419AD48;
	Thu, 16 Jan 2025 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJCNkTyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB59142E7C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022655; cv=none; b=U28JItfINSnwi1B7droPT/UMnX6ASSIH1VzL0deUPQkb1wfoOkzdUJ1NBmNRJ0LtJHnZ9SBfvbmaqfvF3gtHC5oE7Qe3M6iSBVajXY2i2KGlTJf2M5PYhevysM7SwJzBafNbZ8wrcVKP3cpwwjApg65eG4Vd7l6IEIu7nxPU2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022655; c=relaxed/simple;
	bh=dh39Y5V1G9CabMgk+AHGYBxknWz15gSX243w5vxWMw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOqo31CYoNiBMUj+nwFMhS39K1B6GEl45yili9/BjzAy0/ey0Lt3vLI1xb10k0BfEj9cio+lgF6Rh/18LkSrCuoFMA3wWdCcDJPEoZG4lgHWesYtG5ZHlb5ttQNdBScofPsU1pkO15W5xqr7+S2E/9QWhz+xK1/aFEOpPlQKS+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJCNkTyA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd730so4178475e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 02:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737022652; x=1737627452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WuQdHH0jX5HS9LnYEzhRAPhytiR+nfy/IFpv5ExISg8=;
        b=PJCNkTyAPjYhAbfqtF/TyM8Veq7nduFwVSk8dVRZsTQNQ23IBZ1Dh/InYsA4vURVft
         x/lQQatiaTFrQenhbwpRC6qN0F9DpeOAD+8qakHYabiRfSqS4Xp4op2ADUXu1fy97XmH
         qvaFyiFBFJVcgyqfKrvcqZ7YxMiGtQJoTeKDAsbsdaFapCiGzWa7HkFDWO6Dt2iGN2W9
         X41za7w3P5VMtK772dI20zUQTv57y2vNc08bFQTiiK//Zb4BR/vUZ+n1ZrVXPakRp9yp
         /OcIv1ymO/ZhqOaJZWhQ+lroRHeGqK8hdFjLhYjgP0SuV5LmRYeXlmyFnd2GT75zJFRR
         GfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022652; x=1737627452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WuQdHH0jX5HS9LnYEzhRAPhytiR+nfy/IFpv5ExISg8=;
        b=o2qaFDcSs9DH3PiC6AyAmo1AE7PzMv/VXCPy8Dx3aRhCYXcKtEwCG1QQuluci6knls
         CxXbemF+Dn7vXVP6ORYkcanMgCt8vepYldQy8JvE0m02oUBKmCcuzFdwlUy4bWiM9Oim
         7HIbAXmKzQckElrMQ/fZEWehg5e7PL1h653F94oe3Eiz5FediGT+QKdXs7Eyw4tXJLEl
         ObcMwT60EQYxe8oS4qWWpKNfZIDSXYmwM1QjZXqFN+5W3qYmvwrL2Ye1/NAMi7P/caTi
         wJsd18p88+O7fNpmbJJ9mvWtxYICZ/8IKptrAIfON8lX7IbM0w4VF01GBVHgwjo2/CbF
         itoA==
X-Forwarded-Encrypted: i=1; AJvYcCU4buYYcUUmMbAuCLZWYAf95zxWcsQl75W0AxdDmYy9eIssDU6p+eloQ4WJwPoPmJCM5k7vL5gKypD20fEn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bRhhRVWnVTD1QJC9mpG9ugD9zQ5/XUGUDePA+ezVAnAl5MjB
	okpg7SdKy4C5mGp+altVZthdMgjd2zA7GhCFtu5l9GkDd/fegbzqwtc1diMDSzc=
X-Gm-Gg: ASbGncuVWwY0Un8CqS60JvQLdHaFqUAdyYT3YjzMzmzikgCh2OlT5oPfyFmh/ThWaw/
	2KYHjOEi91dfSCeMbVFttCLWd3g67qgorKTBLKjwRoCOd8UFN2ZHSek3k0C55tTnnKpbyLPfoWu
	BmfLkhm5XbKe5Vj2l+yBreBeGAEzhOQYEredxRTQo1UxQsydjBK3BNWSm+aMjhkOPcLeaiXlqtW
	vzUTLx6VA+eHWUiGtAO0A8y3gyTzPwXLBPKgPEn6Kv6OIUN1s2IpRzPHNOLSj9QGA==
X-Google-Smtp-Source: AGHT+IHkjH80GQTqq34oQO8qDVtyYgt1GSoj40Mv1uGkahK/UBb6cgj2XQHwoTsX/bBBE4uM6KJFbg==
X-Received: by 2002:a05:600c:1e1b:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-436e2686279mr310262785e9.7.1737022651778;
        Thu, 16 Jan 2025 02:17:31 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c73e370fsm54756825e9.0.2025.01.16.02.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 02:17:31 -0800 (PST)
Message-ID: <49f6619d-f042-42b9-9359-b7d78783a32e@linaro.org>
Date: Thu, 16 Jan 2025 10:17:30 +0000
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
 <02f114b7-8654-4402-b105-7aef41d487f0@linaro.org>
 <e3a29406-075d-41f6-888c-ebe168162134@quicinc.com>
 <b8fd3d5a-fc61-4ab0-8fb1-7cacf4cab9f5@linaro.org>
 <5c0827ce-cf25-43d0-a160-5f99e82f582c@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5c0827ce-cf25-43d0-a160-5f99e82f582c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/01/2025 3:01 am, Jie Gan wrote:
> 
> 
> On 1/15/2025 8:29 PM, James Clark wrote:
>>
>>
>> On 15/01/2025 1:44 am, Jie Gan wrote:
>>>
>>>
>>> On 1/14/2025 6:07 PM, James Clark wrote:
>>>>
>>>>
>>>> On 14/01/2025 2:51 am, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 1/13/2025 8:02 PM, James Clark wrote:
>>>>>>
>>>>>>
>>>>>> On 26/12/2024 1:10 am, Jie Gan wrote:
>>>>>>> Add 'trace_id' function pointer in ops. It's responsible for
>>>>>>> retrieving the device's trace ID.
>>>>>>>
>>>>>>> Add 'struct cs_sink_data' to store the data that is needed by
>>>>>>> coresight_enable_path/coresight_disable_path. The structure
>>>>>>> will be transmitted to the helper and sink device to enable
>>>>>>> related funcationalities.
>>>>>>>
>>>>>>
>>>>>> The new cs_sink_data struct is quite specific to this change. Can 
>>>>>> we start passing the path around to enable/disable functions, that 
>>>>>> will allow devices to gather anything they want in the future. 
>>>>>> Because we already have coresight_get_sink(path), 
>>>>>> coresight_get_source(path) etc.
>>>>>>
>>>>>> And see below, but for this case we can also change the path 
>>>>>> struct to contain the trace ID. Then all the new functions, 
>>>>>> allocations and searches for the trace ID are unecessary. The CTCU 
>>>>>> will have access to the path, and by the time its enable function 
>>>>>> is called the trace ID is already assigned.
>>>>>>
>>>>>> It's also easier to understand at which point a trace ID is 
>>>>>> allocated, rather than adding the trace_id() callbacks from 
>>>>>> everywhere which could potentially either read or allocate. I 
>>>>>> suppose that's "safer" because maybe it's not allocated, but I 
>>>>>> can't see what case it would happen in reverse.
>>>>>>
>>>>> Thank you for comment. I will try this solution.
>>>>> The biggest challenge for the patch is how to correctly read 
>>>>> trace_id from source device and passthrough it to helper device as 
>>>>> the source device always the last one to enable. I believe your 
>>>>> proposed solution is better than mine and has minimal impact on the 
>>>>> basic framework, but I think we still need read_trace in source_ops 
>>>>> and link_ops. Then we can read the trace_id in coresight_build_path 
>>>>> function and save it to the coresight_path to avoid redundant 
>>>>> searching?
>>>>>
>>>>>
>>>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>>>> ---
>>>>>>>   drivers/hwtracing/coresight/coresight-core.c  | 59 ++++++++++++ 
>>>>>>> + + +----
>>>>>>>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>>>>>>>   .../hwtracing/coresight/coresight-etm-perf.c  | 37 ++++++++++--
>>>>>>>   .../coresight/coresight-etm3x-core.c          | 30 ++++++++++
>>>>>>>   .../coresight/coresight-etm4x-core.c          | 29 +++++++++
>>>>>>>   drivers/hwtracing/coresight/coresight-priv.h  | 13 +++-
>>>>>>>   drivers/hwtracing/coresight/coresight-stm.c   | 22 +++++++
>>>>>>>   drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++-
>>>>>>>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>>>>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>>>>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 20 +++++++
>>>>>>>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>>>>>>>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>>>>>>>   include/linux/coresight.h                     |  6 ++
>>>>>>>   14 files changed, 234 insertions(+), 25 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/ 
>>>>>>> drivers/ hwtracing/coresight/coresight-core.c
>>>>>>> index 0a9380350fb5..2e560b425fd4 100644
>>>>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>>>>> @@ -23,6 +23,7 @@
>>>>>>>   #include "coresight-etm-perf.h"
>>>>>>>   #include "coresight-priv.h"
>>>>>>>   #include "coresight-syscfg.h"
>>>>>>> +#include "coresight-trace-id.h"
>>>>>>>   /*
>>>>>>>    * Mutex used to lock all sysfs enable and disable actions and 
>>>>>>> loading and
>>>>>>> @@ -331,12 +332,12 @@ static int coresight_enable_helper(struct 
>>>>>>> coresight_device *csdev,
>>>>>>>       return helper_ops(csdev)->enable(csdev, mode, data);
>>>>>>>   }
>>>>>>> -static void coresight_disable_helper(struct coresight_device 
>>>>>>> *csdev)
>>>>>>> +static void coresight_disable_helper(struct coresight_device 
>>>>>>> *csdev, void *data)
>>>>>>>   {
>>>>>>> -    helper_ops(csdev)->disable(csdev, NULL);
>>>>>>> +    helper_ops(csdev)->disable(csdev, data);
>>>>>>>   }
>>>>>>> -static void coresight_disable_helpers(struct coresight_device 
>>>>>>> *csdev)
>>>>>>> +static void coresight_disable_helpers(struct coresight_device 
>>>>>>> *csdev, void *data)
>>>>>>>   {
>>>>>>>       int i;
>>>>>>>       struct coresight_device *helper;
>>>>>>> @@ -344,7 +345,7 @@ static void coresight_disable_helpers(struct 
>>>>>>> coresight_device *csdev)
>>>>>>>       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>>>>>>>           helper = csdev->pdata->out_conns[i]->dest_dev;
>>>>>>>           if (helper && coresight_is_helper(helper))
>>>>>>> -            coresight_disable_helper(helper);
>>>>>>> +            coresight_disable_helper(helper, data);
>>>>>>>       }
>>>>>>>   }
>>>>>>> @@ -361,7 +362,7 @@ static void coresight_disable_helpers(struct 
>>>>>>> coresight_device *csdev)
>>>>>>>   void coresight_disable_source(struct coresight_device *csdev, 
>>>>>>> void *data)
>>>>>>>   {
>>>>>>>       source_ops(csdev)->disable(csdev, data);
>>>>>>> -    coresight_disable_helpers(csdev);
>>>>>>> +    coresight_disable_helpers(csdev, NULL);
>>>>>>>   }
>>>>>>>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>>>>> @@ -371,7 +372,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>>>>>>>    * disabled.
>>>>>>>    */
>>>>>>>   static void coresight_disable_path_from(struct list_head *path,
>>>>>>> -                    struct coresight_node *nd)
>>>>>>> +                    struct coresight_node *nd,
>>>>>>> +                    void *sink_data)
>>>>>>>   {
>>>>>>>       u32 type;
>>>>>>>       struct coresight_device *csdev, *parent, *child;
>>>>>>> @@ -417,13 +419,13 @@ static void 
>>>>>>> coresight_disable_path_from(struct list_head *path,
>>>>>>>           }
>>>>>>>           /* Disable all helpers adjacent along the path last */
>>>>>>> -        coresight_disable_helpers(csdev);
>>>>>>> +        coresight_disable_helpers(csdev, sink_data);
>>>>>>>       }
>>>>>>>   }
>>>>>>> -void coresight_disable_path(struct list_head *path)
>>>>>>> +void coresight_disable_path(struct list_head *path, void 
>>>>>>> *sink_data)
>>>>>>>   {
>>>>>>> -    coresight_disable_path_from(path, NULL);
>>>>>>> +    coresight_disable_path_from(path, NULL, sink_data);
>>>>>>>   }
>>>>>>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>>>>>>> @@ -505,10 +507,47 @@ int coresight_enable_path(struct list_head 
>>>>>>> *path, enum cs_mode mode,
>>>>>>>   out:
>>>>>>>       return ret;
>>>>>>>   err:
>>>>>>> -    coresight_disable_path_from(path, nd);
>>>>>>> +    coresight_disable_path_from(path, nd, sink_data);
>>>>>>>       goto out;
>>>>>>>   }
>>>>>>> +int coresight_read_traceid(struct list_head *path, enum cs_mode 
>>>>>>> mode,
>>>>>>> +               struct coresight_trace_id_map *id_map)
>>>>>>> +{
>>>>>>> +    int trace_id, type;
>>>>>>> +    struct coresight_device *csdev;
>>>>>>> +    struct coresight_node *nd;
>>>>>>> +
>>>>>>> +    list_for_each_entry(nd, path, link) {
>>>>>>
>>>>>> What do you think about also changing the path to this:
>>>>>>
>>>>>>   struct coresight_path {
>>>>>>     struct list_head *path,
>>>>>>     u8 trace_id
>>>>>>   };
>>>>>>
>>>>> That's better, I can simplify the coresight_read_traceid function 
>>>>> without traverse the path.
>>>>>
>>>>> But we still need to check the type of the coresight device, 
>>>>> because the TPDM does not have traceid and we use the trace_id from 
>>>>> the TPDA device that the TPDM connected. That's why I added 
>>>>> trace_id to link_ops.
>>>>>
>>>>
>>>> But if any device that allocates a trace ID saves it into the path, 
>>>> then as long as any other device that needs the ID is enabled after 
>>>> that it just reads it from the path directly. Assuming we pass the 
>>>> path to every enable and disable function.
>>>>
>>>> We wouldn't need coresight_read_traceid() if it always happens that 
>>>> way around, which I think it currently does?
>>>>
>>> I got your point here. You are right. If we passed path to the helper 
>>> device, just use coresight_get_source to obtain the source device, 
>>> then call the source_ops->trace_id to obtain the trace_id. So we 
>>> definitely dont need a standalone function, coresight_read_traceid().
>>>
>>> Besides, I still need a function to retrive the trace_id of the TPDA 
>>> device if the source device is TPDM, right?
>>>
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> Yes, and that would require a search as the TPDA not always at one end 
>> of the path like coresight_get_source() and coresight_get_sink(). 
>> Which is why I was thinking it might be good to save the trace ID in 
>> the path struct to avoid it.
>>
> As you proposed, I created coresight_path structure as below:
> struct coresight_path {
>      struct perf_output_handle       *handle;

What's the perf handle for? Seems like this change for the CTCU only 
requires access to the trace_id which is added below.

>      struct list_head                *path;
>      u8                trace_id;
> };
> 
> In coresight_enable_path, I modified the parameters that transmitted to 
> helper device:
> struct coresight_path *cs_path;
> 
> coresight_enable_helpers(csdev, mode, sink_data) ->
> coresight_enable_helpers(csdev, mode, cs_path)
> 
> The cs_path will be constructed and initialized in coresight_build_path 
> function.
> 
> For perf mode, the trace_id is collected within etm_setup_aux and stored 
> in cs_path->trace_id to avoid extra cost of retrieving the trace_id;
> 

Looks good.

> For sysfs mode, I let the CTCU device to retrieving the trace_id with 
> path. The TPDA device is located close to the TPDM, making the cost of 
> searching for the TPDA device acceptable.
> 
> The cs_path will be stored in the same manner as the previous path.
> 
> How do you think about this solution?
> 

Can it not be done the same way as Perf, at least for consistency? If 
the enable helper function already gets access to the path, and the path 
already has the trace ID, why is any search required?

> Thanks,
> Jie
> 
> [...]
> 


