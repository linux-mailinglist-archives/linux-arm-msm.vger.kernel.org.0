Return-Path: <linux-arm-msm+bounces-29679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9111E961A2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 00:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B3682850DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 22:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329F21D1F69;
	Tue, 27 Aug 2024 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8Pjfg4f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275664A;
	Tue, 27 Aug 2024 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724799396; cv=none; b=YE7kvws2S5482GZKPUKBgNb4k1f1tWqKLoTNqJpz70Toiz/yfIr8bLBVcIdDj7EG0l5VcxvA7fR8V5piIkcmayfwZJDDZOb+bJ0c6FYtAzT+ZaiPTa0MteEhTb6RhfLFeT3kgn4DFyNc3s39B2iXJVmjZEEKgZ8iSqwjG4p+eik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724799396; c=relaxed/simple;
	bh=ShIQfrE949MUB9QJI7uzRxmqPP32zvvxYGlFK+CPi2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aafc4Uup28TRy+5HVhSiDmTp8BTD6nd+l59fnDVfPwfnh1JbSEYRepqAayKbGjtUMQeWPCZ/c6tu/ifSo9gq20xb1kEIkSRcsU4Ch7e+19F+l/xBZ32BqOH6xqyKKMt6eGL9tgVPVLD/Fcxlz9H3Y18/6DxvuzHLLMiTMT33mTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8Pjfg4f; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bf006f37daso63109a12.1;
        Tue, 27 Aug 2024 15:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724799392; x=1725404192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWpLb/X7aiYpuqlLVZErCPmL+o5dP4r/q3MqARrm0j0=;
        b=Y8Pjfg4fa+I1DGK+sl1ep9LmjwKKpQMHfKyEg40EvGEKuzdzq/idFNg6gmHjA3aY6W
         ExxrpOMm+Nfn8K8D0wEIfXJ61LAKp2NvIQH1xt6QFFOMJDtr9tbgKdSixbyOSsGdvF1p
         LEBZKeSSwtovOdoOWBCAi1FfjTMxG/kUnTpNyRbu3zQxkoks/sidalgCx9J5Brom9cxt
         D+3wcn63wTUl3YWC0y3DJGsPpkL8fpJRAOIXO2FjMHdz4igRkApmZWfNSAwfMMTL+wjL
         csIrkNtMWne0vAfRLXbEFAAaSAwBZgH0b9QO7nEa32ze0U3xNS0DYhv5q2VR/xGAO7ec
         OVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724799392; x=1725404192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWpLb/X7aiYpuqlLVZErCPmL+o5dP4r/q3MqARrm0j0=;
        b=abbnMDCDdZcDiLeKXhID5fXpgyivZLqUXFTLqqCAyhHXuXfgVqYBEgwfL6fWq8CCkv
         kYuMBt/oOkSxgrjOeKWMYzrICqCuOnHtnsJLq2TsszNSujlz/2RTADb0nXT/TfedDyB1
         kfzWdHYzfvTdw3ZTqDyrh7V2daASY+C8zjpACYEHb8lTdCzyuQP470NQs9RgOqOsC1Nq
         /9bzoSwxYkXwA6JBJvdo09XLA2JG8N92+qs+OWarfc37+Nkf2KuK1BO/LcBj3GkwwM6N
         25DInMdHqqsgdZD5wKNU9p3OtU4ye/uGHaFfLg7+n6EJstY9gw8k5HQm8QLUbh0YTTqx
         LwOw==
X-Forwarded-Encrypted: i=1; AJvYcCXVGpuLNl3GBRY9QVnza97dEfNvfBPrWf9muHiQeM+YPWA/lsc/WGdfHXj7ZMxCdKglrUzLa5o2mG+dk/1g@vger.kernel.org, AJvYcCXo4U6jbGuq6zm2FbtAYl8IIA7cJI8lTdfRymSUuW4iThdT4HlocBZd5Xk/R6a7GHyQrIZi850Kr8iWnP7i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn9GesvJo0IvN+d/lkVT9Y0rvWuu8iWrTb0kTcBh02ll0a1t9d
	cTICnK3osjWHpOf5OeV7tMS5J+ou/BItni3dvSGMGtlrYNMH3XmQ
X-Google-Smtp-Source: AGHT+IGyusmuwUq9MhSHyFZ1rPPiCyQSa+NOTebzPV+FSP3Rx8Iuj24zHQmyjqeB8WasFTmGeO6Sdw==
X-Received: by 2002:a05:6402:2788:b0:5be:e9f8:9ba4 with SMTP id 4fb4d7f45d1cf-5c212a3d350mr278525a12.4.1724799391770;
        Tue, 27 Aug 2024 15:56:31 -0700 (PDT)
Received: from [192.168.1.15] (host-87-18-175-92.retail.telecomitalia.it. [87.18.175.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb4714bbsm1504015a12.64.2024.08.27.15.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 15:56:31 -0700 (PDT)
Message-ID: <57064da3-190c-4554-b085-d56daf979933@gmail.com>
Date: Wed, 28 Aug 2024 00:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Rob Clark <robdclark@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
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
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com>
 <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
 <CACu1E7EueMnte9e+yLEtRE9WmG0J5bVMj59VbPfkDeB7OHbsAw@mail.gmail.com>
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
 <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
 <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/24 11:07 PM, Rob Clark wrote:
> On Tue, Aug 27, 2024 at 1:25 PM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
>>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
>>>> On Fri, Aug 23, 2024 at 10:21 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>>>
>>>>> On Thu, Aug 22, 2024 at 9:06 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
>>>>>>> On Mon, Aug 19, 2024 at 9:09 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>>>>>>>>> This patch implements preemption feature for A6xx targets, this allows
>>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>>>>>>>> hardware as such supports multiple levels of preemption granularities,
>>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>>>>>>>> such as draw-call level or a bin boundary level preemption. This patch
>>>>>>>>> enables the basic preemption level, with more fine grained preemption
>>>>>>>>> support to follow.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>>>>>>> ---
>>>>>>>>
>>>>>>>> No postamble packets which resets perfcounters? It is necessary. Also, I
>>>>>>>> think we should disable preemption during profiling like we disable slumber.
>>>>>>>>
>>>>>>>> -Akhil.
>>>>>>>
>>>>>>> I don't see anything in kgsl which disables preemption during
>>>>>>> profiling. It disables resetting perfcounters when doing system-wide
>>>>>>> profiling, like freedreno, and in that case I assume preempting is
>>>>>>> fine because the system profiler has a complete view of everything and
>>>>>>> should "see" preemptions through the traces. For something like
>>>>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
>>>>>>> because we disable saving/restoring perf counters, but that has to
>>>>>>> happen in userspace because the kernel doesn't know what userspace
>>>>>>> does.
>>>>>>>
>>>>>>
>>>>>> KGSL does some sort of arbitration of perfcounter configurations and
>>>>>> adds the select/enablement reg configuration as part of dynamic
>>>>>> power up register list which we are not doing here. Is this something
>>>>>> you are taking care of from userspace via preamble?
>>>>>>
>>>>>> -Akhil
>>>>>
>>>>> I don't think we have to take care of that in userspace, because Mesa
>>>>> will always configure the counter registers before reading them in the
>>>>> same submission, and if it gets preempted in the meantime then we're
>>>>> toast anyways (due to not saving/restoring perf counters). kgsl sets
>>>>> them from userspace, which is why it has to do something to set them
>>>>
>>>> Sorry, should be "kgsl sets them from the kernel".
>>>>
>>>>> after IFPC slumber or a context switch when the HW state is gone.
>>>>> Also, because the upstream approach doesn't play nicely with system
>>>>> profilers like perfetto, VK_KHR_performance_query is hidden by default
>>>>> behind a debug flag in turnip. So there's already an element of "this
>>>>> is unsupported, you have to know what you're doing to use it."
>>>
>>> But when you have composition on GPU enabled, there will be very frequent
>>> preemption. And I don't know how usable profiling tools will be in that
>>> case unless you disable preemption with a Mesa debug flag. But for that
>>> to work, all existing submitqueues should be destroyed and recreated.
>>>
>>> So I was thinking that we can use the sysprof propertry to force L0
>>> preemption from kernel.
>>>
>>> -Akhil.
>>>
>>
>> Right but when using a system profiler I imagined the expectation would
>> be to be able to understand how applications and compositor interact. An
>> use case could be measuring latency and understanding what contributes
>> to it. That is actually the main reason I added traces for preemption.
>> Disabling preemption would make it less useful for this type of
>> analysis. Did you have an use case in mind for a system profiler that
>> would benefit from disabling preemption and that is not covered by
>> VK_KHR_performance_query (or equivalent GL ext)?
> 
> I would think that we want to generate an event, with GPU timestamp
> (ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
> could display multiple GPU timelines and where the switch from one to
> the other happens.
> 
> I'm a bit curious how this is handled on android, with AGI/etc.. I
> don't see any support in perfetto for this.
> 
> BR,
> -R
> 
>> Best regards,
>> --
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Looking at KGSL they seem to use ftrace and I don't see it doing 
anything to get a timestamp from some GPU timer, really not sure how 
that would be put in a gpu timeline.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


