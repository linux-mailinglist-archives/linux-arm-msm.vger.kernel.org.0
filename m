Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F218665EF55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 15:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbjAEOxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 09:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbjAEOxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 09:53:08 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500DA5C915
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 06:53:06 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id x26so19246397pfq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 06:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A7NPnSoOsdsZJw1QH5YrL8BVHCBP9hZ8tU+AiG4357U=;
        b=HUbJG62LOQzqVU0pS50VatJ+CNDPmFHu7soVhJuF2wCiZk1kzH4QiXtRnPXdGMrW10
         HmCxZPhncwBKcc2d/UPhWffogJkhJZd7xtcI2bJvOAWJ5XpezW79zWCnjdB8oHpl0gmW
         bT2ciUw4bOZEApN9XXt2wt/1F6dPX66/+8SXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7NPnSoOsdsZJw1QH5YrL8BVHCBP9hZ8tU+AiG4357U=;
        b=wztrMkwRkYr+SNecL+o3qZV1/9yy5x4bzA3bVjA/yYBaAP0Ap2s802YZpwlholirb+
         ca/+8o8y4kUr8Z6/MsWb/d5zp29hHH5mKBtspNutDCW1tjJE7L2gCcFDBmLlcFs4NokJ
         jikHM8W8z5Go8MUhz3kCdpgR04vOkW7gu3ubA1wYP9tavRMRrmT+qwr2bfusfp7v4oEd
         JrLbgltQAOX/XqLywhC9DAetj/qGLg123+OtwLDn/3LrjrQFZaJy6TLlvdzgxYxBq42C
         OMPdrkaFSwJ8rUi/L4qC/iEQ9Z/OfZLZJRXfH/5vkkqcKQfBJqbsmMwQkry0u3NK4z2x
         1lvg==
X-Gm-Message-State: AFqh2kpjSPRyY/PyOz2AQgH2o7ofrtUV1iqwLp76+FfyRPv4pwTHqw4j
        SoDq63/V1mTE0AnUc7U6AOMqQZbSb6BV6RHymc+beA==
X-Google-Smtp-Source: AMrXdXu/9or8jWOeUHKkr3GflfBgIWspJ/Igmq43AZtA0JLaOhp/sl6bSIV6AwGT+wpwuvwIW1k1Gjf4c1+w6elTqUk=
X-Received: by 2002:aa7:8251:0:b0:580:f119:c21f with SMTP id
 e17-20020aa78251000000b00580f119c21fmr2761505pfn.68.1672930385853; Thu, 05
 Jan 2023 06:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20221206192123.661448-1-robdclark@gmail.com> <Y7bHcRAvk6GgMi5F@phenom.ffwll.local>
 <CAF6AEGsB=ngkTDCUoFo5anZaFMswArpe-Uzt0j+Dcm1F7RFbGA@mail.gmail.com>
In-Reply-To: <CAF6AEGsB=ngkTDCUoFo5anZaFMswArpe-Uzt0j+Dcm1F7RFbGA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 5 Jan 2023 15:52:53 +0100
Message-ID: <CAKMK7uG5VpXjkvjyZLX56=_jZ2Dm1uCKmK=SL0VdFrALVYXgEw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add MSM_SUBMIT_BO_NO_IMPLICIT
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 5 Jan 2023 at 15:51, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jan 5, 2023 at 4:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Dec 06, 2022 at 11:21:23AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In cases where implicit sync is used, it is still useful (for things
> > > like sub-allocation, etc) to allow userspace to opt-out of implicit
> > > sync on per-BO basis.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c        |  3 ++-
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 11 +++++++++++
> > >  include/uapi/drm/msm_drm.h           |  4 +++-
> > >  3 files changed, 16 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index 017a512982a2..e0e1199a822f 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -45,9 +45,10 @@
> > >   * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
> > >   * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
> > >   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
> > > + * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
> > >   */
> > >  #define MSM_VERSION_MAJOR    1
> > > -#define MSM_VERSION_MINOR    9
> > > +#define MSM_VERSION_MINOR    10
> > >  #define MSM_VERSION_PATCHLEVEL       0
> > >
> > >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index eb3536e3d66a..8bad07a04f85 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -334,9 +334,20 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > >               if (ret)
> > >                       return ret;
> > >
> > > +             /* If userspace has determined that explicit fencing is
> > > +              * used, it can disable implicit sync on the entire
> > > +              * submit:
> > > +              */
> > >               if (no_implicit)
> > >                       continue;
> > >
> > > +             /* Otherwise userspace can ask for implicit sync to be
> > > +              * disabled on specific buffers.  This is useful for internal
> > > +              * usermode driver managed buffers, suballocation, etc.
> > > +              */
> > > +             if (submit->bos[i].flags & MSM_SUBMIT_BO_NO_IMPLICIT)
> > > +                     continue;
> > > +
> > >               ret = drm_sched_job_add_implicit_dependencies(&submit->base,
> >
> > Won't this break shrinkers and fun stuff like that? It's why we added the
> > new USAGE_OTHER fence slot at least, and also why I wonder whether we
>
> Only if the entire explicit sync path was busted.. My daily driver for
> email/docs/meet/chat/corpstuff is a 4G device and CrOS is all explicit
> sync.. I would have found out rapidly and dramatically if it was
> busted :-P
>
> But seriously, this doesn't change what fences we attach to buffers,
> only what the sched job waits on

Oh I'm a silly one :-)

> > shouldn't push this into the helper to make the right call. Every driver
> > kinda needs the same wheel.
>
> We kinda already have moved everything we can (with the current
> driver-specific-uabi model) to helpers, what is left is driver
> specific ioctl parsing.  We absolutely should take a step back and
> re-evaluate this before anyone else adds a new submit/execbuf ioctl.
> For example, the driver specific ioctl could just have a pointer to a
> drm_gem_submit_bo_table type structure, and then we could move the
> whole thing to a helper.  Short of breaking the submit ioctl up (which
> a uring type uabi would let us do), I think the next best thing is to
> split out common cross-driver structs for common parts of
> submit/execbuf.

Yeah I thought this was the "attach fence to dma_resv" side of things.
This here is I think fine as a pattern, unless we build some kind of
outright submit ioctl helpers that take care of everything.
-Daniel

>
> BR,
> -R
>
> > -Daniel
> >
> > >                                                             obj,
> > >                                                             write);
> > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > index f54b48ef6a2d..329100016e7c 100644
> > > --- a/include/uapi/drm/msm_drm.h
> > > +++ b/include/uapi/drm/msm_drm.h
> > > @@ -222,10 +222,12 @@ struct drm_msm_gem_submit_cmd {
> > >  #define MSM_SUBMIT_BO_READ             0x0001
> > >  #define MSM_SUBMIT_BO_WRITE            0x0002
> > >  #define MSM_SUBMIT_BO_DUMP             0x0004
> > > +#define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
> > >
> > >  #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
> > >                                       MSM_SUBMIT_BO_WRITE | \
> > > -                                     MSM_SUBMIT_BO_DUMP)
> > > +                                     MSM_SUBMIT_BO_DUMP | \
> > > +                                     MSM_SUBMIT_BO_NO_IMPLICIT)
> > >
> > >  struct drm_msm_gem_submit_bo {
> > >       __u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
> > > --
> > > 2.38.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
