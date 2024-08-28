Return-Path: <linux-arm-msm+bounces-29830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB4D96312A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83A3F1C20899
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1371ABEBF;
	Wed, 28 Aug 2024 19:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3y2pvSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AC4125BA;
	Wed, 28 Aug 2024 19:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724874417; cv=none; b=MyxUKgwBLMjJu1L0sFF+lrp1ZkAoumwVIwucdehacQVv798MtvASnHwFMuZ3dvJr0DVQo1Zu9e61ZGHuwYKiNMcDqB6jRB72axvIJPyL40/V/nzODOr/vrs/40OZFLkTkYy/E2QBj657KA2WV9BQY6IBYxUk1hD49NkG3J8dps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724874417; c=relaxed/simple;
	bh=MOuW31EsvQOWJZyg5MyZCG8nO4WB9tjSRCJjROx29y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoS+pSLgdJFz/W2q9Q6zE5mgJ33WUcuEbMciQPXvGTPx6rCYIvpZJGfAKAaTjP9qSVPvtLAyUIZyUnyxOtfmCX0ojO9IB+oaoRrL3YyQrct2LjSm+uOod7xAQKk1uGLa+98GSiLb/bhVmz0Nux3cFr5oOY58IavgUY2CFXoza84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3y2pvSN; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86933829dcso812626666b.3;
        Wed, 28 Aug 2024 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724874414; x=1725479214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cD7nXVNIH/PHGLLjSIJQT2JX0QXEmSqhiG+NCi9Wrzk=;
        b=C3y2pvSNlgUIDYpgtPYio+p5jNFfGI+8jQ9Io1G81Gh+hsXQWRaP0+qranMiLDRNPJ
         80ya7Ssizl4JpDmxLbFq7gsXGzj+59OeKInN/TQ6SClC9TeROFVIwxG0OQgmwhgEl+1y
         10fzp/PUFexQ3gvJMjy+cJ9wdXQYIjjIbTOtfdEUxKP8pYJDvxTT9MBJ7m7AE3SLbot4
         DkIMdTQkKIlbJFgoRCODK/2o2X+jW4uFCJQG2hBs2h39pbNwvePWk0KYoNB/PsEPAOk8
         ONiZ6B6AAFCq3oVsvZaKVo3Tp//rBYNYoqXNbo0NcM90aQ05EUYJ61tjwmnGxCGBJdqy
         FXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724874414; x=1725479214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cD7nXVNIH/PHGLLjSIJQT2JX0QXEmSqhiG+NCi9Wrzk=;
        b=ZJTzKsRJG/JkIyx7xTQuSBYEFru2sQoRggRR6W7SzHF27S1pKckFPLjyz/togY1mUk
         +nFlqSA4qifGWgBEMkcrB6d3OvhpjuIKnO0p7ZSyRu3uZAptuihppEjNjh3zt7ET6yTP
         enASex8hA7FddK3eKxqimS58yd17m/fctntid/BuGleVH4p/MT7DMu+x1dbS5uYIxXTY
         gZTznA6C6XQE8c3F+F7FheVmfATIDzgmi/D2zulIIVxzqfZuUnc+Wz9K3X6KioONm3C8
         cQ8AhPCe7jR9MZeCR8LMT8gevliws7okUTNFLaJNmxR9p6J2i9wipAYJrMReSq3TxcYp
         5U/g==
X-Forwarded-Encrypted: i=1; AJvYcCVhUc/MK8kpMEE7RKloATF0hVh8HjpcWHWAQ64oNC74T4mDFmdyOaZrk9BVj10dPAGjEYldbr7vbvPTNWBt@vger.kernel.org, AJvYcCXYfm40Vg46tEfCFPd71z4mZmj2g5n01pFJ3D2JEOwqomzxePfODnkHVGfDmYeRpbZckCEQ9DoeinKSsxjd@vger.kernel.org
X-Gm-Message-State: AOJu0YxXmL36KdVugxccJuNkpCmoO6ssfMf3PRN9KZ9JvjtoJWP7ycwY
	8HnMEP93eGwuJSHddZtIYB1pUdFNIpHaC6ukYiZEKDBQQkRgcISN
X-Google-Smtp-Source: AGHT+IFHqUTDbsiy0KKd7d50tdZ3WO6P/LGDWj5MgTIjOlHaI3NCNO00uKJ0HUnPf8rmCkAsB1rt1g==
X-Received: by 2002:a17:907:9482:b0:a86:700f:93c1 with SMTP id a640c23a62f3a-a897face4cfmr38236766b.60.1724874413867;
        Wed, 28 Aug 2024 12:46:53 -0700 (PDT)
Received: from [192.168.1.14] (host-95-249-206-143.retail.telecomitalia.it. [95.249.206.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582ded7sm277734266b.120.2024.08.28.12.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 12:46:53 -0700 (PDT)
Message-ID: <f3bc0b3f-d35b-4cf8-ace8-2f4a6e387e13@gmail.com>
Date: Wed, 28 Aug 2024 21:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com>
 <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
 <CACu1E7EueMnte9e+yLEtRE9WmG0J5bVMj59VbPfkDeB7OHbsAw@mail.gmail.com>
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
 <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
 <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
 <57064da3-190c-4554-b085-d56daf979933@gmail.com>
 <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
 <CAF6AEGuBMiQft4SCrf=xTQ76q8=+-OS3SEKMmw7TGT5rb=Sygw@mail.gmail.com>
 <20240828192304.dojqyvbnqzhy63na@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240828192304.dojqyvbnqzhy63na@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/28/24 9:23 PM, Akhil P Oommen wrote:
> On Wed, Aug 28, 2024 at 06:46:37AM -0700, Rob Clark wrote:
>> On Wed, Aug 28, 2024 at 6:42 AM Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Tue, Aug 27, 2024 at 3:56 PM Antonino Maniscalco
>>> <antomani103@gmail.com> wrote:
>>>>
>>>> On 8/27/24 11:07 PM, Rob Clark wrote:
>>>>> On Tue, Aug 27, 2024 at 1:25 PM Antonino Maniscalco
>>>>> <antomani103@gmail.com> wrote:
>>>>>>
>>>>>> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
>>>>>>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
>>>>>>>> On Fri, Aug 23, 2024 at 10:21 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> On Thu, Aug 22, 2024 at 9:06 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
>>>>>>>>>>> On Mon, Aug 19, 2024 at 9:09 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>>>>>>>>>>>>> This patch implements preemption feature for A6xx targets, this allows
>>>>>>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>>>>>>>>>>>> hardware as such supports multiple levels of preemption granularities,
>>>>>>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>>>>>>>>>>>> such as draw-call level or a bin boundary level preemption. This patch
>>>>>>>>>>>>> enables the basic preemption level, with more fine grained preemption
>>>>>>>>>>>>> support to follow.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>>>>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>
>>>>>>>>>>>> No postamble packets which resets perfcounters? It is necessary. Also, I
>>>>>>>>>>>> think we should disable preemption during profiling like we disable slumber.
>>>>>>>>>>>>
>>>>>>>>>>>> -Akhil.
>>>>>>>>>>>
>>>>>>>>>>> I don't see anything in kgsl which disables preemption during
>>>>>>>>>>> profiling. It disables resetting perfcounters when doing system-wide
>>>>>>>>>>> profiling, like freedreno, and in that case I assume preempting is
>>>>>>>>>>> fine because the system profiler has a complete view of everything and
>>>>>>>>>>> should "see" preemptions through the traces. For something like
>>>>>>>>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
>>>>>>>>>>> because we disable saving/restoring perf counters, but that has to
>>>>>>>>>>> happen in userspace because the kernel doesn't know what userspace
>>>>>>>>>>> does.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> KGSL does some sort of arbitration of perfcounter configurations and
>>>>>>>>>> adds the select/enablement reg configuration as part of dynamic
>>>>>>>>>> power up register list which we are not doing here. Is this something
>>>>>>>>>> you are taking care of from userspace via preamble?
>>>>>>>>>>
>>>>>>>>>> -Akhil
>>>>>>>>>
>>>>>>>>> I don't think we have to take care of that in userspace, because Mesa
>>>>>>>>> will always configure the counter registers before reading them in the
>>>>>>>>> same submission, and if it gets preempted in the meantime then we're
>>>>>>>>> toast anyways (due to not saving/restoring perf counters). kgsl sets
>>>>>>>>> them from userspace, which is why it has to do something to set them
>>>>>>>>
>>>>>>>> Sorry, should be "kgsl sets them from the kernel".
>>>>>>>>
>>>>>>>>> after IFPC slumber or a context switch when the HW state is gone.
>>>>>>>>> Also, because the upstream approach doesn't play nicely with system
>>>>>>>>> profilers like perfetto, VK_KHR_performance_query is hidden by default
>>>>>>>>> behind a debug flag in turnip. So there's already an element of "this
>>>>>>>>> is unsupported, you have to know what you're doing to use it."
>>>>>>>
>>>>>>> But when you have composition on GPU enabled, there will be very frequent
>>>>>>> preemption. And I don't know how usable profiling tools will be in that
>>>>>>> case unless you disable preemption with a Mesa debug flag. But for that
>>>>>>> to work, all existing submitqueues should be destroyed and recreated.
>>>>>>>
>>>>>>> So I was thinking that we can use the sysprof propertry to force L0
>>>>>>> preemption from kernel.
>>>>>>>
>>>>>>> -Akhil.
>>>>>>>
>>>>>>
>>>>>> Right but when using a system profiler I imagined the expectation would
>>>>>> be to be able to understand how applications and compositor interact. An
>>>>>> use case could be measuring latency and understanding what contributes
>>>>>> to it. That is actually the main reason I added traces for preemption.
>>>>>> Disabling preemption would make it less useful for this type of
>>>>>> analysis. Did you have an use case in mind for a system profiler that
>>>>>> would benefit from disabling preemption and that is not covered by
>>>>>> VK_KHR_performance_query (or equivalent GL ext)?
> 
> Please consider this as a friendly suggestion based on Conner's clarification.
> Not a blocker. TBH, I don't have clairty on the profiling story in Mesa!
> 

Thanks, your input was appreciated :) I just wanted to make sure we 
where on the same page. So considering this, I will be able to send v2 soon.

>>>>>
>>>>> I would think that we want to generate an event, with GPU timestamp
>>>>> (ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
>>>>> could display multiple GPU timelines and where the switch from one to
>>>>> the other happens.
>>>>>
>>>>> I'm a bit curious how this is handled on android, with AGI/etc.. I
>>>>> don't see any support in perfetto for this.
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Antonino Maniscalco <antomani103@gmail.com>
>>>>>>
>>>>
>>>> Looking at KGSL they seem to use ftrace and I don't see it doing
>>>> anything to get a timestamp from some GPU timer, really not sure how
>>>> that would be put in a gpu timeline.
> 
> Yeah, we usually rely on ftraces which is good enough to measure preemption
> latency.
> 
> -Akhil.
> 

Thanks for confirming! The traces I added are pretty similar to KGSL's 
so it should be suitable for serving the same purpose.

>>>
>>> I suspect it would require some work on perfetto trace-processor.  It
>>> can ingest ftrace events (but those would end up being something
>>> driver specific).  Maybe with u_trace and some tracepoints in the
>>> 'ambles something could be done that would be more driver agnostic
>>> (but idk if that would work for gpu's where preemption happens more
>>> autonomously in the fw)
>>
>> btw how to handle tracing preemption probably shouldn't hold up
>> sending the next iteration of this series.  There isn't that much more
>> time to get this in v6.12, and I think better visualization of
>> preemption is going to take some work outside of the kernel.
>>
>> BR,
>> -R

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


