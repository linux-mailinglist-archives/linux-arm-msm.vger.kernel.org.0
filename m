Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED08E3D9AB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 02:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbhG2A6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 20:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbhG2A6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 20:58:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5989C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 17:58:20 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id c16so4608272wrp.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 17:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2s1hdSTzFHg/7UL0elBXK+uq6mOJCD2JwEhclE1GvL4=;
        b=YJ5hjIrVapOHiT8yy2uwshZ+6GE+wXf6yT/xJWAOeECU3D5dan+RFAt4Bv1vaYep11
         4tnL0U0Yo//3P8Cr9TBXJ3W1Pbtl6FNrDvlMAO02BH87DQlYb2bsxT47xZlSPL0vnlo2
         GYzawuUmXpM/sVr/WUap+EzIJ7bWA1WCB9LSlM/X1S/yY1swxCZS7Nn1qSJSpiy+L90j
         5ZYxC1U7DCjIs7djVARLreJR2At9i5VMhsalVKf8GkLXz84OH+dlrzZEZuAjLqksgOF3
         kzctLud8URXhBmwvIPmluu6uL6EX28GmRohNBpVIazX6prMXmagj/2tTJ81Jl+HbuXul
         TGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2s1hdSTzFHg/7UL0elBXK+uq6mOJCD2JwEhclE1GvL4=;
        b=hRHL4ggBph3et41q6bbaZZNGJOjOc7k3md4XJBq05yxJT9DaxEQbI/XvevDp7d0s/x
         PMSV2qxuFww4GuFcMEd9Hh08Fnc21uWH2OEUz3yP87LddIgko6953O/FcHHI3Iq5eYsR
         cP5nRh19KU/f4490eKlVGYbc1ew2lSw0PXrOLTzHpGhSMtkfzhE3OjnfyNTkb0+pkJ6d
         4oVJ0CvMT5mLxf3OjuEtf39iQA1EAaCgdsGQH8YRr/mB8IKjotnkLPHNsUtz82yhjK0C
         KOUekanZ4rY50pg0s1WYQLQ5DQ+WiQ4wJS9qicDQa4EoLDdweM3M9RSUbSUK+YiIQyxA
         DjFQ==
X-Gm-Message-State: AOAM531UhJ4pQ7fNygL6LiEBh6BqUC9h/pYqUSCk7P+RnVCQST6qzT5Q
        kpA6pdI04RLAWpC/xUvWILdAUmmS2hA9gQpvMYA=
X-Google-Smtp-Source: ABdhPJzW5Q8OEorGHgwin1FvunAy5rXQhFx3+SneO8wjiAA6nKskhDHaLoxXsuhZDBEW+1wPXHXxObDqN5csPhDjvG8=
X-Received: by 2002:adf:ea41:: with SMTP id j1mr1842369wrn.147.1627520299190;
 Wed, 28 Jul 2021 17:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <SKuAxGshCZFzlguCiEJOU0kAFCJ9WDGK_qCmPESnrghqei0-VIp4DD5vL58OEJCq2B-AkvF1az0EedzkGjSNLQ==@protonmail.internalid>
 <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com> <7553f3cd-61c8-3ece-14ec-6c0cf4ae0296@linaro.org>
In-Reply-To: <7553f3cd-61c8-3ece-14ec-6c0cf4ae0296@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 28 Jul 2021 18:02:28 -0700
Message-ID: <CAF6AEGuJjH94s0ymARtEMUo2tBuaacx7e0nqOj7_j2SQQcUa9Q@mail.gmail.com>
Subject: Re: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Jordan, any idea if more frequent frequency changes would for some
reason make a630 grumpy?  I was expecting it should be somewhat
similar to a618 (same GMU fw, etc).  The main result of that patch
should be clamping to min freq when gpu goes idle, and the toggling
back to devfreq provided freq on idle->active transition.  So there
might be more frequent freq transitions.

Caleb, I don't suppose you could somehow delay starting UI and get
some traces?  Something along the lines of:

  localhost ~ # cd /sys/kernel/debug/tracing/
  localhost /sys/kernel/debug/tracing # echo 1 > events/drm_msm_gpu/enable
  localhost /sys/kernel/debug/tracing # echo 1 > tracing_on
  localhost /sys/kernel/debug/tracing # cat trace_pipe

Does adding an 'if (1) return' at the top of msm_devfreq_idle() help?
That should bypass the clamping to min freq when the GPU isn't doing
anything and reduce the # of freq transitions.  I suppose we could
opt-in to this behavior on a per-gpu basis..

BR,
-R

On Wed, Jul 28, 2021 at 5:35 PM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> Hi Rob,
>
> This series causes a fatal crash on my Oneplus 6, the device goes to
> Qualcomm crashdump mode shortly after reaching UI with the following errors:
>
> https://paste.ubuntu.com/p/HvjmzZYtgw/
>
> I did a git bisect and the patch ("drm/msm: Devfreq tuning") seems to be
> the cause of the crash, reverting it resolves the issue.
>
>
> On 28/07/2021 21:52, Rob Clark wrote:
> > Hi Dave & Daniel,
> >
> > An early pull for v5.15 (there'll be more coming in a week or two),
> > consisting of the drm/scheduler conversion and a couple other small
> > series that one was based one.  Mostly sending this now because IIUC
> > danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
> > you disagree then speak up, and I'll instead include this in the main
> > pull request once that is ready.)
> >
> > This also has a core patch to drop drm_gem_object_put_locked() now
> > that the last use of it is removed.
> >
> > The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> >
> >    Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28
> >
> > for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:
> >
> >    drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)
> >
> > ----------------------------------------------------------------
> > Rob Clark (18):
> >        drm/msm: Let fences read directly from memptrs
> >        drm/msm: Signal fences sooner
> >        drm/msm: Split out devfreq handling
> >        drm/msm: Split out get_freq() helper
> >        drm/msm: Devfreq tuning
> >        drm/msm: Docs and misc cleanup
> >        drm/msm: Small submitqueue creation cleanup
> >        drm/msm: drop drm_gem_object_put_locked()
> >        drm: Drop drm_gem_object_put_locked()
> >        drm/msm/submit: Simplify out-fence-fd handling
> >        drm/msm: Consolidate submit bo state
> >        drm/msm: Track "seqno" fences by idr
> >        drm/msm: Return ERR_PTR() from submit_create()
> >        drm/msm: Conversion to drm scheduler
> >        drm/msm: Drop submit bo_list
> >        drm/msm: Drop struct_mutex in submit path
> >        drm/msm: Utilize gpu scheduler priorities
> >        drm/msm/gem: Mark active before pinning
> >
> >   drivers/gpu/drm/drm_gem.c                   |  22 --
> >   drivers/gpu/drm/msm/Kconfig                 |   1 +
> >   drivers/gpu/drm/msm/Makefile                |   1 +
> >   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
> >   drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
> >   drivers/gpu/drm/msm/msm_fence.c             |  53 +----
> >   drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
> >   drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
> >   drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
> >   drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
> >   drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
> >   drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
> >   drivers/gpu/drm/msm/msm_rd.c                |   6 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
> >   include/drm/drm_gem.h                       |   2 -
> >   include/uapi/drm/msm_drm.h                  |  14 +-
> >   26 files changed, 865 insertions(+), 536 deletions(-)
> >   create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >
>
> --
> Kind Regards,
> Caleb (they/them)
