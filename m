Return-Path: <linux-arm-msm+bounces-29672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C72961879
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 22:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C7DA1C23276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185C01C6F64;
	Tue, 27 Aug 2024 20:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erS7aSkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F727186A;
	Tue, 27 Aug 2024 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724790334; cv=none; b=KR7ZLj7Skhwg0eb9Ju3SVgU8WHp/T1yaPBkKGOCx56IccfnMlxTNglG20YUMqmHbhzMS6HSr5RZSV9zZQH/UB9Jshhp3VdyeQ1d5MVaniTyYBc0t9GoIS2ZXxG6D2o6FsjdKHcGe6xGba8NVWhulthoVT6GmdLPEf/dk6kCeu1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724790334; c=relaxed/simple;
	bh=B8gN9XtIUX9WdpdalYG97OlcN8j4MUH+67fi4NVVKNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8Uo1A0tOD+IgyJ5wUOJppFOFd6e9Zmj9habBaATvxD5ZmzujGuLd2Fpi3hmhElJBqV8+i2yQ8trLkeHYm3BQmAnGkARKPMXHu1xR4+TltCCdR6bpKkK7Caxe8iwL7Kgg3vC8CwO2pSmgLdqYznWzbVH+ZEtOgzQgNJjwGNCjCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erS7aSkB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bf068aebe5so7470808a12.0;
        Tue, 27 Aug 2024 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724790330; x=1725395130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1S0R3Tsboq9f6ZxXIsz+JWCDez7fEOp5R3ignLWd2g=;
        b=erS7aSkBfhK0AnStdpn+9cMH09ThGUP+0zhrb0jp63mZvv/teaMChq6fb3qMSXpwAA
         eAQaykI7h+FqsOpgVsL1l2Wa8exnOctV7Ai8lkJi/JHHg0PjPvanML68jj36lPBzPXbK
         Y0JNSdylBLFTfpn+4hS4pNHee/9QmXbmv9lvZH/v0+kFTOPq9gjffBTbK3U8hnfZGaoN
         hrqSvbOe2+VBSlXho+hhq34aZkR5Fz1luL7XlFdmDqxBnNWFJCAIeV8zYduDfcxALZWA
         rczUOWE7FaZkv0CPg7s1AsowooquiUAuA+ysXzN5Owuzbp0J/vMCF3gzmSwGBL5Hbjrw
         FiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724790330; x=1725395130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1S0R3Tsboq9f6ZxXIsz+JWCDez7fEOp5R3ignLWd2g=;
        b=IDjzOVS/Kkz3psUBKCXCPBpJf+65klYWuNI6/LpNcFDSD9dCDp5fFqd/ghqTUY9rUA
         vjBY9Pz9Q2zSJEk1yyPzYwLX4QaYavvoZ8exGCYnT/HOFqPV6rQ3+oJVB6BjwlCTCrjv
         WhZtO7fy8NDS5z28XRFWQeRZBjFnJyT7jn1Lo+v81OFJ3sibNKCzOzEVeTsmeQAF1mpp
         c/OyejmRSNO3FeqfyRbCEkK7g1P2D6YdVuDrw4aCKv8axpur/Z10a5IKVWbQmfsYtAgj
         iuA78mnGOGHqQHQ8f0D4qoFEOdjXtpNummsDN8URZj3GOgttVmEKi3Uys5vp/Z3mc4fo
         ozUw==
X-Forwarded-Encrypted: i=1; AJvYcCUzDd3lq8i2DMJsBfOWWm2T3nl6PqEycVOdabafWAVp7S3oLc658mXNi9sZ/IEE19EUzTEIKhW2ODzSWhh4@vger.kernel.org, AJvYcCVIP3BHfHVAuOEQOctibjzQRAVCL9sqf+GP4jqEAzEAwR8AD5X21lQ+QmIRGies3vTCNH2D3PlmPzJnpSpW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+mzC/1TMhkCDdyX2qx4PoF1uHZxfzgOnyaeAtqDxHbKMhW6dM
	Ik1M81ZH7kTdvU2U1c8r5SvTpP1ky+FHXsKJP5x8sFhcAv1wrccnxXU3HOPm
X-Google-Smtp-Source: AGHT+IHYr2Isp4SrehIxVOF2itRQBjAnp3RlVSfqAQ04TR2Run1LZayMQtfINtPXvD1sQMdwvt9w4w==
X-Received: by 2002:a17:907:f1d8:b0:a7a:b4bd:d0eb with SMTP id a640c23a62f3a-a86a5199bd9mr994403466b.24.1724790329979;
        Tue, 27 Aug 2024 13:25:29 -0700 (PDT)
Received: from [192.168.1.15] (host-87-18-175-92.retail.telecomitalia.it. [87.18.175.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5954a88sm150233366b.224.2024.08.27.13.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 13:25:29 -0700 (PDT)
Message-ID: <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
Date: Tue, 27 Aug 2024 22:25:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
>> On Fri, Aug 23, 2024 at 10:21 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>
>>> On Thu, Aug 22, 2024 at 9:06 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
>>>>> On Mon, Aug 19, 2024 at 9:09 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>>>>>>> This patch implements preemption feature for A6xx targets, this allows
>>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>>>>>> hardware as such supports multiple levels of preemption granularities,
>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>>>>>> such as draw-call level or a bin boundary level preemption. This patch
>>>>>>> enables the basic preemption level, with more fine grained preemption
>>>>>>> support to follow.
>>>>>>>
>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>>>>> ---
>>>>>>
>>>>>> No postamble packets which resets perfcounters? It is necessary. Also, I
>>>>>> think we should disable preemption during profiling like we disable slumber.
>>>>>>
>>>>>> -Akhil.
>>>>>
>>>>> I don't see anything in kgsl which disables preemption during
>>>>> profiling. It disables resetting perfcounters when doing system-wide
>>>>> profiling, like freedreno, and in that case I assume preempting is
>>>>> fine because the system profiler has a complete view of everything and
>>>>> should "see" preemptions through the traces. For something like
>>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
>>>>> because we disable saving/restoring perf counters, but that has to
>>>>> happen in userspace because the kernel doesn't know what userspace
>>>>> does.
>>>>>
>>>>
>>>> KGSL does some sort of arbitration of perfcounter configurations and
>>>> adds the select/enablement reg configuration as part of dynamic
>>>> power up register list which we are not doing here. Is this something
>>>> you are taking care of from userspace via preamble?
>>>>
>>>> -Akhil
>>>
>>> I don't think we have to take care of that in userspace, because Mesa
>>> will always configure the counter registers before reading them in the
>>> same submission, and if it gets preempted in the meantime then we're
>>> toast anyways (due to not saving/restoring perf counters). kgsl sets
>>> them from userspace, which is why it has to do something to set them
>>
>> Sorry, should be "kgsl sets them from the kernel".
>>
>>> after IFPC slumber or a context switch when the HW state is gone.
>>> Also, because the upstream approach doesn't play nicely with system
>>> profilers like perfetto, VK_KHR_performance_query is hidden by default
>>> behind a debug flag in turnip. So there's already an element of "this
>>> is unsupported, you have to know what you're doing to use it."
> 
> But when you have composition on GPU enabled, there will be very frequent
> preemption. And I don't know how usable profiling tools will be in that
> case unless you disable preemption with a Mesa debug flag. But for that
> to work, all existing submitqueues should be destroyed and recreated.
> 
> So I was thinking that we can use the sysprof propertry to force L0
> preemption from kernel.
> 
> -Akhil.
> 

Right but when using a system profiler I imagined the expectation would 
be to be able to understand how applications and compositor interact. An 
use case could be measuring latency and understanding what contributes 
to it. That is actually the main reason I added traces for preemption. 
Disabling preemption would make it less useful for this type of 
analysis. Did you have an use case in mind for a system profiler that 
would benefit from disabling preemption and that is not covered by 
VK_KHR_performance_query (or equivalent GL ext)?

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


