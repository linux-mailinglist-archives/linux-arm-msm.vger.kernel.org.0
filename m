Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB80297A8B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Oct 2020 05:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759252AbgJXDru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 23:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758874AbgJXDru (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 23:47:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5979BC0613CE;
        Fri, 23 Oct 2020 20:47:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x7so4799614wrl.3;
        Fri, 23 Oct 2020 20:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mt3yDzgMQVdkwkYDlINmngXs9x8aGBvvpOuUYt4E2FI=;
        b=uJpEEYJMuLoMWbQLRJVUT5bDDQZTWuCcEJzQHr1VG+HH9Q4DLIq09fBfT9uARbgiq5
         98iI2b4iKZ7BOk/ZU1P8roakkblsFnYCCHfzsiNga9Iol7g5y9r/JVM8ixshRQpsrDwC
         6hTLmHRD7YBg+zef1rOHgF2+FREH5eO91FIrudL/pPhbkuttPjwwPyB0c7IP+0KyC6DD
         sSFrZCEsxUVvNBClaHwoozLK4fQ11UZcO1pwHidctd7Qyp9sOA509iJOYFZghO3ZHVA3
         FbJKoNDJ+OslZiTncvDQPJe+8By3cOLIl8f3kr+cP/4nLG1JA5ElOmPz0eos/pkrb037
         XtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mt3yDzgMQVdkwkYDlINmngXs9x8aGBvvpOuUYt4E2FI=;
        b=A6vQsaXS8EpocOONeek5U6yGlg/Mg5gmhBjNAkX+RRRhYtVO4sp9zWCTy6tCcfRRfE
         kJJoTRQJgKd9o3xptpCHmemYHBSxXNF/Wb5ZaAtLt2iD2wGlYj0oBgrGuLNhX93BQTmd
         9MuJqrntIJf0CJ5ozjCXtKBhDi+/5EjNxfkjLq7eaXcdfOLA2IxhnPTn81mB+1wu3Rhp
         tCgGEMF6wLF0PyrEVYdrI5JZR8XCs9IXAKbIlc0wljqhcqedweBHXgkPu3/yXfWhWl1W
         KsLsrzXM8YK7bZBlhlPXWeRJ/l5S05NwRNqa2cryOiF9sgd+RXlULM2zcRy4Tyb90uI2
         1l3Q==
X-Gm-Message-State: AOAM531K6xnkLELN3U3E8pt3Ao4/18GOdgO1cOFixRTbr0AB3zR8pgfd
        4sOVcC/YRRBN/V92kKRabFcSQ5dug0CzuYe1FW8=
X-Google-Smtp-Source: ABdhPJykogrRTV9Gbt/HoTxHHphSIFX+YNRTGfPg5YErAVFnGqs3bkvyiUa0n1TulZQNIlTk1owhKT0NfsLHsT0xlRE=
X-Received: by 2002:adf:c501:: with SMTP id q1mr5311111wrf.147.1603511267881;
 Fri, 23 Oct 2020 20:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201023165136.561680-1-robdclark@gmail.com> <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
In-Reply-To: <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 23 Oct 2020 20:49:14 -0700
Message-ID: <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
Subject: Re: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single ring
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If there is only a single ring (no-preemption), everything is FIFO order
> > and there is no need to implicit-sync.
> >
> > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > is undefined when fences are not used to synchronize buffer usage across
> > contexts (which is the only case where multiple different priority rings
> > could come into play).
>
> Really, doesn't this break cross-device implicit sync? Okay, you may
> not have many peripherals that rely on implicit sync on devices where
> Adreno is usually found, but it seems rather heavy-handed.
>
> Wouldn't it be better to only ignore fences from your own ring context
> in the implicit sync, like we do in the common DRM scheduler
> (drm_sched_dependency_optimized)?

we already do this.. as was discussed on an earlier iteration of this patchset

But I'm not aware of any other non-gpu related implicit sync use-case
(even on imx devices where display is decoupled from gpu).. I'll
revert the patch if someone comes up with one, but otherwise lets let
the implicit sync baggage die

BR,
-R



>
> Regards,
> Lucas
>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index d04c349d8112..b6babc7f9bb8 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> >       return ret;
> >  }
> >
> > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> >  {
> >       int i, ret = 0;
> >
> > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >                               return ret;
> >               }
> >
> > -             if (no_implicit)
> > +             if (!implicit_sync)
> >                       continue;
> >
> >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       if (ret)
> >               goto out;
> >
> > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> >       if (ret)
> >               goto out;
> >
>
