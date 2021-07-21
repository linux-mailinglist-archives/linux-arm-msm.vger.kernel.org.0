Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1B33D0A32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 10:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234295AbhGUHTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 03:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234096AbhGUHS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 03:18:57 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9485EC061762
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 00:59:31 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so1295559otp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 00:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i1uzYLmR5eIDsH2uz91oXJvOO8JLzGZfgbFg19OYUOg=;
        b=iIIO8uiPJd8ABtw13Umn0Qzy4qd108xTqg9zeHtryzTqn1f23VsT6sj+Xdy7fw5pB0
         JXSSOKWxIHPm+DTThfW4L7RTzyfLxc59rBMx365YGzyk7XQRM47pp7v+T9hNYttlfAKv
         plx0mOufPHR8h5iNXoImM0LMpyzeJIirrUpPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i1uzYLmR5eIDsH2uz91oXJvOO8JLzGZfgbFg19OYUOg=;
        b=LhLJJOl4dC2KXAKH4wca7ce1Zw0oBo1utazLIdlXAl5xnZe2J0gJQ9mPNrmhfDBWlh
         blcK/ePNat8ronpGVg+TKuPtoy2mzTV1MJWYatxqkozaDvxV+9OqWYZuoACYvaVJc3jI
         IxPe31CXUkOZkPa5dBuwKbnF8dIseniwf1mDiAA8oz8thsgPj1j2xie+k05XLDoQpifn
         BQpjJ7rV57R96KHTuy4G7tVQ0P7F3rltSoUcCQzUQwBJ5fRIIfR11UfnfkClN4WnprN/
         ytmhRuHhUn+Eq8c6PjCixqIue2oOKMQtuw5cKGjnYIxGaVZWxsI3oLeghv6lF8hQY1E4
         KHuQ==
X-Gm-Message-State: AOAM5339OW3jFeg62x+b3vHN/OPgYozVMluaIMpiBJo3HVGJo2nQ/MB+
        ibeXfhe7wAaJFTgVFqOmwesMPARinWOuRFVOtiQVcA==
X-Google-Smtp-Source: ABdhPJzlBV2SpVcZvVFa40w7afLAaXHdHt5EO5vd/HzIEfGT9t2nEOfXFCaT4JwjLsT9zv7LjEY872P7lUIno55+qlo=
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr11443606otp.188.1626854370953;
 Wed, 21 Jul 2021 00:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com> <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com> <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
In-Reply-To: <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 21 Jul 2021 09:59:20 +0200
Message-ID: <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To:     Rob Clark <robdclark@gmail.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 21, 2021 at 12:32 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Tue, Jul 20, 2021 at 11:03 AM Christian K=C3=B6nig
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > Am 20.07.21 um 17:07 schrieb Rob Clark:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Somehow we had neither ->wait() nor dma_fence_signal() calls, and=
 no
> > > > > one noticed.  Oops.
> > > >
> > > >
> > > > I'm not sure if that is a good idea.
> > > >
> > > > The dma_fence->wait() callback is pretty much deprecated and should=
 not
> > > > be used any more.
> > > >
> > > > What exactly do you need that for?
> > >
> > > Well, the alternative is to track the set of fences which have
> > > signalling enabled, and then figure out which ones to signal, which
> > > seems like a lot more work, vs just re-purposing the wait
> > > implementation we already have for non-dma_fence cases ;-)
> > >
> > > Why is the ->wait() callback (pretty much) deprecated?
> >
> > Because if you need it that means for your driver dma_fence_add_cb is
> > broken, which means a _lot_ of things don't work. Like dma_buf poll
> > (compositors have patches to start using that), and I think
> > drm/scheduler also becomes rather unhappy.
>
> I'm starting to page back in how this works.. fence cb's aren't broken
> (which is also why dma_fence_wait() was not completely broken),
> because in retire_submits() we call
> dma_fence_is_signaled(submit->hw_fence).
>
> But the reason that the custom wait function cleans up a tiny bit of
> jank is that the wait_queue_head_t gets signaled earlier, before we
> start iterating the submits and doing all that retire_submit() stuff
> (unpin/unref bo's, etc).  I suppose I could just split things up to
> call dma_fence_signal() earlier, and *then* do the retire_submits()
> stuff.

Yeah reducing the latency there sounds like a good idea.
-Daniel

>
> BR,
> -R
>
> > It essentially exists only for old drivers where ->enable_signalling
> > is unreliable and we paper over that with a retry loop in ->wait and
> > pray no one notices that it's too butchered. The proper fix is to have
> > a driver thread to guarantee that ->enable_signalling works reliable,
> > so you don't need a ->wait.
> >
> > Can you type up a kerneldoc patch for dma_fence_ops->wait to hammer
> > this in please?
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > > > Regards,
> > > > Christian.
> > > >
> > > > >
> > > > > Note that this removes the !timeout case, which has not been used=
 in
> > > > > a long time.
> > > >
> > > >
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >   drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++-------=
-------
> > > > >   1 file changed, 34 insertions(+), 25 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/ms=
m/msm_fence.c
> > > > > index cd59a5918038..8ee96b90ded6 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_fence.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > > > > @@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm=
_fence_context *fctx, uint32_t fenc
> > > > >       return (int32_t)(fctx->completed_fence - fence) >=3D 0;
> > > > >   }
> > > > >
> > > > > -/* legacy path for WAIT_FENCE ioctl: */
> > > > > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fenc=
e,
> > > > > -             ktime_t *timeout, bool interruptible)
> > > > > +static signed long wait_fence(struct msm_fence_context *fctx, ui=
nt32_t fence,
> > > > > +             signed long remaining_jiffies, bool interruptible)
> > > > >   {
> > > > > -     int ret;
> > > > > +     signed long ret;
> > > > >
> > > > >       if (fence > fctx->last_fence) {
> > > > >               DRM_ERROR_RATELIMITED("%s: waiting on invalid fence=
: %u (of %u)\n",
> > > > > @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *=
fctx, uint32_t fence,
> > > > >               return -EINVAL;
> > > > >       }
> > > > >
> > > > > -     if (!timeout) {
> > > > > -             /* no-wait: */
> > > > > -             ret =3D fence_completed(fctx, fence) ? 0 : -EBUSY;
> > > > > +     if (interruptible) {
> > > > > +             ret =3D wait_event_interruptible_timeout(fctx->even=
t,
> > > > > +                     fence_completed(fctx, fence),
> > > > > +                     remaining_jiffies);
> > > > >       } else {
> > > > > -             unsigned long remaining_jiffies =3D timeout_to_jiff=
ies(timeout);
> > > > > -
> > > > > -             if (interruptible)
> > > > > -                     ret =3D wait_event_interruptible_timeout(fc=
tx->event,
> > > > > -                             fence_completed(fctx, fence),
> > > > > -                             remaining_jiffies);
> > > > > -             else
> > > > > -                     ret =3D wait_event_timeout(fctx->event,
> > > > > -                             fence_completed(fctx, fence),
> > > > > -                             remaining_jiffies);
> > > > > -
> > > > > -             if (ret =3D=3D 0) {
> > > > > -                     DBG("timeout waiting for fence: %u (complet=
ed: %u)",
> > > > > -                                     fence, fctx->completed_fenc=
e);
> > > > > -                     ret =3D -ETIMEDOUT;
> > > > > -             } else if (ret !=3D -ERESTARTSYS) {
> > > > > -                     ret =3D 0;
> > > > > -             }
> > > > > +             ret =3D wait_event_timeout(fctx->event,
> > > > > +                     fence_completed(fctx, fence),
> > > > > +                     remaining_jiffies);
> > > > > +     }
> > > > > +
> > > > > +     if (ret =3D=3D 0) {
> > > > > +             DBG("timeout waiting for fence: %u (completed: %u)"=
,
> > > > > +                             fence, fctx->completed_fence);
> > > > > +             ret =3D -ETIMEDOUT;
> > > > > +     } else if (ret !=3D -ERESTARTSYS) {
> > > > > +             ret =3D 0;
> > > > >       }
> > > > >
> > > > >       return ret;
> > > > >   }
> > > > >
> > > > > +/* legacy path for WAIT_FENCE ioctl: */
> > > > > +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fenc=
e,
> > > > > +             ktime_t *timeout, bool interruptible)
> > > > > +{
> > > > > +     return wait_fence(fctx, fence, timeout_to_jiffies(timeout),=
 interruptible);
> > > > > +}
> > > > > +
> > > > >   /* called from workqueue */
> > > > >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t =
fence)
> > > > >   {
> > > > > @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_f=
ence *fence)
> > > > >       return fence_completed(f->fctx, f->base.seqno);
> > > > >   }
> > > > >
> > > > > +static signed long msm_fence_wait(struct dma_fence *fence, bool =
intr,
> > > > > +             signed long timeout)
> > > > > +{
> > > > > +     struct msm_fence *f =3D to_msm_fence(fence);
> > > > > +
> > > > > +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
> > > > > +}
> > > > > +
> > > > >   static const struct dma_fence_ops msm_fence_ops =3D {
> > > > >       .get_driver_name =3D msm_fence_get_driver_name,
> > > > >       .get_timeline_name =3D msm_fence_get_timeline_name,
> > > > >       .signaled =3D msm_fence_signaled,
> > > > > +     .wait =3D msm_fence_wait,
> > > > >   };
> > > > >
> > > > >   struct dma_fence *
> > > >
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
