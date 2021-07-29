Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB9D3D9BEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 04:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhG2Cqs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 22:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbhG2Cqr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 22:46:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738AAC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 19:46:44 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id g15so4869507wrd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 19:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yOcWYMAMVx2OzxFD3oHIwWoXRSKBqDZGD++4oyepJIA=;
        b=mphbVODQkaxOPB/01JH7rSv8GEzTgR6rITMAEciucH905Z+e075DmIJ9YX5eELh1WC
         i7asSic5BohFp55bkscXET3r2+7Rl21tc6stxlokPH9B/MSExmbK7Gzdv/n2qZlVFlmj
         jeZqlLVBz94CFe3NRi0flzzwHVWNEcNkQlKRh38Qsxm02p02qbW5c5xYk2ZmZuRbuAIV
         4yHyqT7X2+cpSKK7pgGcVHpb9QaTkIFJ30iov+x6Ml2yYl5XLK+OUpaZwjfoBJXBo3O/
         EkLA/zDM9eLVQWG22qVs1tRaiWl8xSc+IXkZb8Bb3Cj+CDbb5zbzarfv4y8bVqN4VweY
         KbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yOcWYMAMVx2OzxFD3oHIwWoXRSKBqDZGD++4oyepJIA=;
        b=RE1306vz+PZY0sTv+//paAF5UIgc697UMHDNWQKjSS75Zp1DSAoleXXt9+zoxSklp9
         k9Fgp4EiI37gB0IFf2ZNwfhzBgLccxlA0j3nmXDoSDV0OcOMfRp7DLVqxLKseun9r5tn
         +asrVy0aaSaznfIxwlGVmMqfIf1acPBXnxbONRQvAoLmcH0BKzlAAeRP13wZcCQV3lh3
         bwkvhmmU9dUB+IFDmr+uzLH8ZL52lqzaf0oBEKGRnQm3/FaHNZ4QUh4HLM6+/sryAXq3
         rd/BWXYnYKxPPTKV6LfSlGUvo2YQx7LILjA9KUtZ42yoxBjwyjM4tww/MQUASe5bWIwq
         WvmA==
X-Gm-Message-State: AOAM533niIASXEhxNfrYn43xX9bDtjpyPvlL3p/71Gu/GyGoNWTzehp0
        c7L51FuJt5DOH7ERp0D/dNpMr4I+v4tGJXXiOmw=
X-Google-Smtp-Source: ABdhPJxl1dXJ/53lxVdqjKpBHd0j8XQG2gjZ5kxXREm/COWIyKVrifoSroKApyGdfVjoTTPzVb1QrvS+FMGAHca5GTM=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr2058527wrm.327.1627526803052;
 Wed, 28 Jul 2021 19:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <SKuAxGshCZFzlguCiEJOU0kAFCJ9WDGK_qCmPESnrghqei0-VIp4DD5vL58OEJCq2B-AkvF1az0EedzkGjSNLQ==@protonmail.internalid>
 <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
 <7553f3cd-61c8-3ece-14ec-6c0cf4ae0296@linaro.org> <CAF6AEGuJjH94s0ymARtEMUo2tBuaacx7e0nqOj7_j2SQQcUa9Q@mail.gmail.com>
 <7f0f320b-fa07-b9d9-d7c7-715638086ed2@linaro.org>
In-Reply-To: <7f0f320b-fa07-b9d9-d7c7-715638086ed2@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 28 Jul 2021 19:50:52 -0700
Message-ID: <CAF6AEGu0wOvyydC4KXiXB3cppuheYw3Xk_G7ZixGGqqy=Mnftw@mail.gmail.com>
Subject: Re: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 28, 2021 at 7:18 PM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
>
>
> On 29/07/2021 02:02, Rob Clark wrote:
> > Jordan, any idea if more frequent frequency changes would for some
> > reason make a630 grumpy?  I was expecting it should be somewhat
> > similar to a618 (same GMU fw, etc).  The main result of that patch
> > should be clamping to min freq when gpu goes idle, and the toggling
> > back to devfreq provided freq on idle->active transition.  So there
> > might be more frequent freq transitions.
> >
> > Caleb, I don't suppose you could somehow delay starting UI and get
> > some traces?  Something along the lines of:
> >
> >    localhost ~ # cd /sys/kernel/debug/tracing/
> >    localhost /sys/kernel/debug/tracing # echo 1 > events/drm_msm_gpu/enable
> >    localhost /sys/kernel/debug/tracing # echo 1 > tracing_on
> >    localhost /sys/kernel/debug/tracing # cat trace_pipe
> Sure, here's the last ~1k lines of the trace logs:
> https://paste.ubuntu.com/p/XMKjKDWxYg/
> And what I managed to get from dmesg before the crash (mostly the same
> as before): https://paste.ubuntu.com/p/kGVtRHDWKH/
> >
> > Does adding an 'if (1) return' at the top of msm_devfreq_idle() help?
> > That should bypass the clamping to min freq when the GPU isn't doing
> > anything and reduce the # of freq transitions.  I suppose we could
> > opt-in to this behavior on a per-gpu basis..
> Yeah, that seems to resolve the issue, although I got the following
> probably unrelated (?) error on rebooting the device:
> [  134.994449] [drm:dpu_encoder_vsync_event_handler:1749] [dpu
> error]invalid parameters

I think that should probably be unrelated..

Based on the traces, I'm seeing rapid toggling between idle freq and
non-idle freq.. but no invalid freq's (assuming the dts opp table is
correct) so I *guess* there is maybe some sort of race condition
communicating with GMU or some other issue with rapid freq transition?
 Maybe Jordan has some ideas.

The earlier dmesg you posted look like gpu getting cranky about what
looks like a valid opcode, and then it goes off into the weeds.. when
you start seeing things like "0xDEAFBEAF" I think that means the GPU
has lost context (ie. power collapse and back, and now it is reading
bogus power-on default values).

I think I can put together a patch to make the "clamp to min freq when
gpu is idle" opt-in so we can enable it per-gpu once someone has
confirmed that it doesn't cause problems.  I guess that would at least
work as a short term solution.  But not sure if that is just papering
over some gpu/gmu bug (or maybe gdsc/clk bug), or if it is a legit
workaround for some limitation..

BR,
-R

>
> I wonder if the PocoPhone F1 has the same problem...
> >
> > BR,
> > -R
> >
> > On Wed, Jul 28, 2021 at 5:35 PM Caleb Connolly
> > <caleb.connolly@linaro.org> wrote:
> >>
> >> Hi Rob,
> >>
> >> This series causes a fatal crash on my Oneplus 6, the device goes to
> >> Qualcomm crashdump mode shortly after reaching UI with the following errors:
> >>
> >> https://paste.ubuntu.com/p/HvjmzZYtgw/
> >>
> >> I did a git bisect and the patch ("drm/msm: Devfreq tuning") seems to be
> >> the cause of the crash, reverting it resolves the issue.
> >>
> >>
> >> On 28/07/2021 21:52, Rob Clark wrote:
> >>> Hi Dave & Daniel,
> >>>
> >>> An early pull for v5.15 (there'll be more coming in a week or two),
> >>> consisting of the drm/scheduler conversion and a couple other small
> >>> series that one was based one.  Mostly sending this now because IIUC
> >>> danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
> >>> you disagree then speak up, and I'll instead include this in the main
> >>> pull request once that is ready.)
> >>>
> >>> This also has a core patch to drop drm_gem_object_put_locked() now
> >>> that the last use of it is removed.
> >>>
> >>> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> >>>
> >>>     Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>     https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28
> >>>
> >>> for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:
> >>>
> >>>     drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)
> >>>
> >>> ----------------------------------------------------------------
> >>> Rob Clark (18):
> >>>         drm/msm: Let fences read directly from memptrs
> >>>         drm/msm: Signal fences sooner
> >>>         drm/msm: Split out devfreq handling
> >>>         drm/msm: Split out get_freq() helper
> >>>         drm/msm: Devfreq tuning
> >>>         drm/msm: Docs and misc cleanup
> >>>         drm/msm: Small submitqueue creation cleanup
> >>>         drm/msm: drop drm_gem_object_put_locked()
> >>>         drm: Drop drm_gem_object_put_locked()
> >>>         drm/msm/submit: Simplify out-fence-fd handling
> >>>         drm/msm: Consolidate submit bo state
> >>>         drm/msm: Track "seqno" fences by idr
> >>>         drm/msm: Return ERR_PTR() from submit_create()
> >>>         drm/msm: Conversion to drm scheduler
> >>>         drm/msm: Drop submit bo_list
> >>>         drm/msm: Drop struct_mutex in submit path
> >>>         drm/msm: Utilize gpu scheduler priorities
> >>>         drm/msm/gem: Mark active before pinning
> >>>
> >>>    drivers/gpu/drm/drm_gem.c                   |  22 --
> >>>    drivers/gpu/drm/msm/Kconfig                 |   1 +
> >>>    drivers/gpu/drm/msm/Makefile                |   1 +
> >>>    drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
> >>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
> >>>    drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
> >>>    drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
> >>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
> >>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
> >>>    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
> >>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
> >>>    drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
> >>>    drivers/gpu/drm/msm/msm_fence.c             |  53 +----
> >>>    drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
> >>>    drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
> >>>    drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
> >>>    drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
> >>>    drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
> >>>    drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
> >>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
> >>>    drivers/gpu/drm/msm/msm_rd.c                |   6 +-
> >>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
> >>>    drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
> >>>    drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
> >>>    include/drm/drm_gem.h                       |   2 -
> >>>    include/uapi/drm/msm_drm.h                  |  14 +-
> >>>    26 files changed, 865 insertions(+), 536 deletions(-)
> >>>    create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>>
> >>
> >> --
> >> Kind Regards,
> >> Caleb (they/them)
>
> --
> Kind Regards,
> Caleb (they/them)
