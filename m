Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9783D9BA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 04:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhG2CSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 22:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbhG2CSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 22:18:16 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A14C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 19:18:13 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o5-20020a1c4d050000b02901fc3a62af78so5706609wmh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 19:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gdO4o8bjnyjf6VJ32RyW/MGpB10JopzkFnT0LLJKmv8=;
        b=lQDpb+uYuVNSPSV5KLbzdR8iYg+0/y43zYcrBP1Hd5GQeZdpdnn/3BWOJoBkEi+BlB
         O9mEDqscLMy/PqCYAZIUHfGwwjLFpVUPsob3BON/at7EBQCCZxzEZ4wIyXM0XIk1C8Vb
         QTlfiHH8Y3F2A98ec5l3GdKcb/jelJD22n5hKC6FRLd/uwDunwIBA4n5KzzEKPkzTDHq
         uOp/cPn2Bqc8bikxdn0yaTZ1ShbQS0tNrEcg7o6ujL0HFtNeCf1zXSFLOTh2f7uxC0TL
         kxSVrmoFlxI98KK7ywgELkUDb/w6b19SIp0TDiB8jJ6vKW1//5vn11XjKsUBLXswOYlA
         icqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdO4o8bjnyjf6VJ32RyW/MGpB10JopzkFnT0LLJKmv8=;
        b=e9hTSrhIpU+c+XgZnUh9l7HY4DQ/2q8xltEGlq26/1XXeSPU6ZIsKEuGr1p97roasW
         qkKY0b2/sNHcj+HT/1MerMZSU0+oVdSZ2nH9A90BB5CSoGWD6ctY3xCCNyxDmsKahnsL
         qJ9TGDpCGu+/gJAUGgVuQsIWMJazyBGyS4kKKhaArmzK5Sqq60aR95nmzyg9RRuedTkc
         Ix+s3whrPZRrT0QE7DKFJLIu9xazp2M4zDHr5HbqpUHkrBrba08V3p1j4Y3+shsNlJD6
         xZnMlxZTDPRxuVZ7YXjDQ8bAd31Q9tergGaRpv54gM+ktTu/UOuX2/qsB0f0sGLaWtkR
         AuPw==
X-Gm-Message-State: AOAM530hf8GFlj5Q0OxBw3MrqR+vLGWMzU8dbtdQ1ogPYYdXeY04QehA
        hoiv0XqoiQJVHqZtR7j4BqI2Uw==
X-Google-Smtp-Source: ABdhPJx9j8jaKk0SHYTbKCx0BoxWfHX8shOvZfnhp+fngr2Vm+VvY8jAE6/0CHpoL2F9bSzB9L8uPw==
X-Received: by 2002:a05:600c:4b86:: with SMTP id e6mr12104393wmp.110.1627525092007;
        Wed, 28 Jul 2021 19:18:12 -0700 (PDT)
Received: from [192.168.1.12] (host-80-41-121-59.as13285.net. [80.41.121.59])
        by smtp.gmail.com with ESMTPSA id k17sm1566804wrw.53.2021.07.28.19.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 19:18:10 -0700 (PDT)
Subject: Re: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
To:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <SKuAxGshCZFzlguCiEJOU0kAFCJ9WDGK_qCmPESnrghqei0-VIp4DD5vL58OEJCq2B-AkvF1az0EedzkGjSNLQ==@protonmail.internalid>
 <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
 <7553f3cd-61c8-3ece-14ec-6c0cf4ae0296@linaro.org>
 <CAF6AEGuJjH94s0ymARtEMUo2tBuaacx7e0nqOj7_j2SQQcUa9Q@mail.gmail.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <7f0f320b-fa07-b9d9-d7c7-715638086ed2@linaro.org>
Date:   Thu, 29 Jul 2021 03:18:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuJjH94s0ymARtEMUo2tBuaacx7e0nqOj7_j2SQQcUa9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29/07/2021 02:02, Rob Clark wrote:
> Jordan, any idea if more frequent frequency changes would for some
> reason make a630 grumpy?  I was expecting it should be somewhat
> similar to a618 (same GMU fw, etc).  The main result of that patch
> should be clamping to min freq when gpu goes idle, and the toggling
> back to devfreq provided freq on idle->active transition.  So there
> might be more frequent freq transitions.
> 
> Caleb, I don't suppose you could somehow delay starting UI and get
> some traces?  Something along the lines of:
> 
>    localhost ~ # cd /sys/kernel/debug/tracing/
>    localhost /sys/kernel/debug/tracing # echo 1 > events/drm_msm_gpu/enable
>    localhost /sys/kernel/debug/tracing # echo 1 > tracing_on
>    localhost /sys/kernel/debug/tracing # cat trace_pipe
Sure, here's the last ~1k lines of the trace logs: 
https://paste.ubuntu.com/p/XMKjKDWxYg/
And what I managed to get from dmesg before the crash (mostly the same 
as before): https://paste.ubuntu.com/p/kGVtRHDWKH/
> 
> Does adding an 'if (1) return' at the top of msm_devfreq_idle() help?
> That should bypass the clamping to min freq when the GPU isn't doing
> anything and reduce the # of freq transitions.  I suppose we could
> opt-in to this behavior on a per-gpu basis..
Yeah, that seems to resolve the issue, although I got the following 
probably unrelated (?) error on rebooting the device:
[  134.994449] [drm:dpu_encoder_vsync_event_handler:1749] [dpu 
error]invalid parameters

I wonder if the PocoPhone F1 has the same problem...
> 
> BR,
> -R
> 
> On Wed, Jul 28, 2021 at 5:35 PM Caleb Connolly
> <caleb.connolly@linaro.org> wrote:
>>
>> Hi Rob,
>>
>> This series causes a fatal crash on my Oneplus 6, the device goes to
>> Qualcomm crashdump mode shortly after reaching UI with the following errors:
>>
>> https://paste.ubuntu.com/p/HvjmzZYtgw/
>>
>> I did a git bisect and the patch ("drm/msm: Devfreq tuning") seems to be
>> the cause of the crash, reverting it resolves the issue.
>>
>>
>> On 28/07/2021 21:52, Rob Clark wrote:
>>> Hi Dave & Daniel,
>>>
>>> An early pull for v5.15 (there'll be more coming in a week or two),
>>> consisting of the drm/scheduler conversion and a couple other small
>>> series that one was based one.  Mostly sending this now because IIUC
>>> danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
>>> you disagree then speak up, and I'll instead include this in the main
>>> pull request once that is ready.)
>>>
>>> This also has a core patch to drop drm_gem_object_put_locked() now
>>> that the last use of it is removed.
>>>
>>> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
>>>
>>>     Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28
>>>
>>> for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:
>>>
>>>     drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)
>>>
>>> ----------------------------------------------------------------
>>> Rob Clark (18):
>>>         drm/msm: Let fences read directly from memptrs
>>>         drm/msm: Signal fences sooner
>>>         drm/msm: Split out devfreq handling
>>>         drm/msm: Split out get_freq() helper
>>>         drm/msm: Devfreq tuning
>>>         drm/msm: Docs and misc cleanup
>>>         drm/msm: Small submitqueue creation cleanup
>>>         drm/msm: drop drm_gem_object_put_locked()
>>>         drm: Drop drm_gem_object_put_locked()
>>>         drm/msm/submit: Simplify out-fence-fd handling
>>>         drm/msm: Consolidate submit bo state
>>>         drm/msm: Track "seqno" fences by idr
>>>         drm/msm: Return ERR_PTR() from submit_create()
>>>         drm/msm: Conversion to drm scheduler
>>>         drm/msm: Drop submit bo_list
>>>         drm/msm: Drop struct_mutex in submit path
>>>         drm/msm: Utilize gpu scheduler priorities
>>>         drm/msm/gem: Mark active before pinning
>>>
>>>    drivers/gpu/drm/drm_gem.c                   |  22 --
>>>    drivers/gpu/drm/msm/Kconfig                 |   1 +
>>>    drivers/gpu/drm/msm/Makefile                |   1 +
>>>    drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>>>    drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
>>>    drivers/gpu/drm/msm/msm_fence.c             |  53 +----
>>>    drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
>>>    drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
>>>    drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
>>>    drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
>>>    drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
>>>    drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
>>>    drivers/gpu/drm/msm/msm_rd.c                |   6 +-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>>>    drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
>>>    include/drm/drm_gem.h                       |   2 -
>>>    include/uapi/drm/msm_drm.h                  |  14 +-
>>>    26 files changed, 865 insertions(+), 536 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>
>>
>> --
>> Kind Regards,
>> Caleb (they/them)

-- 
Kind Regards,
Caleb (they/them)
