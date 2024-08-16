Return-Path: <linux-arm-msm+bounces-28841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D62419553D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 01:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0728E1C21AAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 23:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E048E1474BF;
	Fri, 16 Aug 2024 23:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqgFDO9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173E147C96;
	Fri, 16 Aug 2024 23:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723851768; cv=none; b=A5LZOe0wcNoZUS52JVOkAERx8w9qpkcsf6k3+Qr7ZYFX62vtX5JlTpkCzCqKnWej9zhwaSrRc6wElAY2v9QErhYxCa+MfqOvf6wdtjSjDuRXJ8gHaL8bRpL4lRyNS9eP5JeANCJZSK+wSaXNbDiZEv4rOiZ5wz4Rv/iFJyWlJcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723851768; c=relaxed/simple;
	bh=Od8uOqD1E0LkGzBeMxbp6AiUK3x8htxNRrjfVi6rVBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATvf+R6yjm6KfRF7odSx0zKAY6oR+ljXNXaLMH9Tx95GGTQk8VYfKVkuiuvcn5ZO0m8D1IPBkpqyeV47rvgpArxmkbZrxwF2GJSK5XHDZsoIugfVR3jhkxqP8KSGhzL+Q80QuHUM5aHpiNHZyV3CWhHf0/O361/i38DXi/qKEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqgFDO9H; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7aac70e30dso282848066b.1;
        Fri, 16 Aug 2024 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723851765; x=1724456565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RH/rPI35J13TIcTmDXM4xAWE7+R4US73obFliUuHk8g=;
        b=JqgFDO9HnePD3FSIVqKOCKL4hQ/bDPRXcX21yc5UQDaEoA680zVrew1MUIodnY9DIZ
         tqrGZcgrPFSUV8D/lLx0hyfiPf9/GFtF0Ij57UkxZ5tBXAhZTrwpBXZwluq8aQR1O1e+
         NKsssX4xE1+yGBpF1iylYpeXGg9WmDDxr+q350agiRH72thCQIRZDVx27FXw+6xnLveK
         feUa2QFI1ehVv+oV4PqhwMiXFhM4UuUyVETF3/qJZX6Yq9XopO5oswZMseaTKvG6bVYu
         dnjEl1BqNaWAQCxLe/ZqPFjW/LolwF2cUH51UmD2q13aUXrqeOSMy7yky2c1liVK0NCw
         BXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723851765; x=1724456565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RH/rPI35J13TIcTmDXM4xAWE7+R4US73obFliUuHk8g=;
        b=f6LOK0b+vTfspMeumvK0Fc9KGzP83GoTFYk/xoUZ+Su0N8jQS+Ves1gsMbzKExzxrL
         +KAttAjQ4/6Viz/aoUhVDgcmK6bT1rS73PeUt+bcW0MvqD5kQm0krQ7yCcbPDLWe7dsI
         5dLq6jVgLhysyHEiDMF+2UCDRwulQeQJIafMdlwFab10d2xAuttP55kBpustNp9lyxN3
         4mhmTq6w3rzUgJ1Xisl4IvscDpDvT+AY6NNPUW28OUEZxOACKnzoMRJRMWhl+o/64yA5
         axVCojyre03eoS62+oqNdPpP/ZxvVD6fQK87pg8Js69d57O5VQP2W5UjyP5GghwhZBf5
         88qg==
X-Forwarded-Encrypted: i=1; AJvYcCWhQLiJ8hYTV9klv0R/mVjcIoQiSBVrG2Ql5M8CmZyh22kJYtJnX6cye+02DopHyc7A3Xxo4DoenAPxIiXeKagVr8K5e/iQVs0gqXifcho11THW8OIGVS7Mnbs9AnEts/kCdKjKLIck4DORyw==
X-Gm-Message-State: AOJu0YzlLoibRqxrjVFZ/2fxSrQR+eM9C0Awjd6MIjQbgvnt9pze4Zxd
	wEiipz2CnnKEv6pWKrwfSapY/412WD4fqvpycJnOiCTvv0zJAiwf
X-Google-Smtp-Source: AGHT+IFHh3rJK/WkfcHOF52rAbjLG1pNSReXF3Ompen1dC2c00uCWocEwRcDw+ckHU2wnMDrRLmmaA==
X-Received: by 2002:a17:907:7fa5:b0:a80:aefa:14d3 with SMTP id a640c23a62f3a-a8392a4128amr351909366b.63.1723851764930;
        Fri, 16 Aug 2024 16:42:44 -0700 (PDT)
Received: from [192.168.1.13] (host-95-235-164-146.retail.telecomitalia.it. [95.235.164.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838393599asm319803166b.132.2024.08.16.16.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 16:42:44 -0700 (PDT)
Message-ID: <78d36089-5a65-41b3-a9fa-102266736d9b@gmail.com>
Date: Sat, 17 Aug 2024 01:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Preemption support for A7XX
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <CAF6AEGsiu2OBbwQJO5nS55CAQtCvKebc59-mu2h0BDiu4C2gxg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGsiu2OBbwQJO5nS55CAQtCvKebc59-mu2h0BDiu4C2gxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/16/24 7:47 PM, Rob Clark wrote:
> On Thu, Aug 15, 2024 at 11:27 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> This series implements preemption for A7XX targets, which allows the GPU to
>> switch to an higher priority ring when work is pushed to it, reducing latency
>> for high priority submissions.
>>
>> This series enables L1 preemption with skip_save_restore which requires
>> the following userspace patches to function:
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>
>> A flag is added to `msm_gem_submit` to only allow submissions from compatible
>> userspace to be preempted, therefore maintaining compatibility.
> 
> I guess this last para is from an earlier iteration of this series?
> Looks like instead you are making this a submitqueue flag (which is an
> approach that I prefer)
> 
> BR,
> -R
> 

That is correct, I got confused on which one I ended up going with when 
I wrote that.

Thanks for spotting it!

>> Some commits from this series are based on a previous series to enable
>> preemption on A6XX targets:
>>
>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>> Antonino Maniscalco (7):
>>        drm/msm: Fix bv_fence being used as bv_rptr
>>        drm/msm: Add submitqueue setup and close
>>        drm/msm: Add a `preempt_record_size` field
>>        drm/msm/A6xx: Implement preemption for A7XX targets
>>        drm/msm/A6xx: Add traces for preemption
>>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>        drm/msm/A6xx: Enable preemption for A7xx targets
>>
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>>   drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>>   drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>>   drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>>   include/uapi/drm/msm_drm.h                |   5 +-
>>   11 files changed, 995 insertions(+), 16 deletions(-)
>> ---
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>
>> Best regards,
>> --
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


