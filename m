Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66F167AAEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 08:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235024AbjAYH35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 02:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbjAYH34 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 02:29:56 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B294315C83
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 23:29:54 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id p141so19139804ybg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 23:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jiUco/MLWVperT+ljPIQcmiNiz70RTXeJN32A7WBZAE=;
        b=S/ln1RZql+to1V/PDE8qCa9YsjAWNciBXkVrwXshY9NY82yY5MbtlJoXmqCwr2MNNn
         mqzUfjpohETcsYn60FFjhZH/11MG9LZPhzhQ0CyHa00Z9ht4HCM1IRAjbLD2OYkSQPpq
         gYQhq2zHRtq29JDPeFJ5aWiGz3sSArRclV2SAulIUQ63tcqr5m0qg75fAmjH3LJh5Wd6
         rZTRug2UAAVlEXErrJFLg+UJ+7jqcw41aoMMFj1BxD7TZwc/gz48iC1WwvZ8ori2Vrxg
         3iY2BJAnAKo9u7Kq9X7npVROY+V2Kk5ElSXA3AZ1Qqcpw/gHtfWI6AXtPDUbym3NMGui
         JFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiUco/MLWVperT+ljPIQcmiNiz70RTXeJN32A7WBZAE=;
        b=bepEPxzRyzdM0v4zQbqhPk0QFIkF3IoiHmzjHRbDUp8QsZBd+6Ouo6B7iugsmcf/j8
         rwVttpCVaT8AeBp1N0ltv6Wr1a1FqZy6NDFQC4RIsm6uO458pvzd3pnXXmZ2UxrWSQ9P
         M8al7RfZwICiEtAtk8nnsxKfMVIdAUWl+sBikdv1jGzgSSR4jlrogEfWzHGwf24QgT5e
         oxvTfj4x3FfDL/66wVUIU3Q/SgiUCkawbYulH+3dBL1IDSt9XLzZUl9MlyXKBrSLJTAy
         tDUc4cwwTgFxs87/XursExzl9xW00UZEtxA8SO/tOKJaax6RIF1gkO1KBoLdvurNjyPt
         mFAw==
X-Gm-Message-State: AFqh2kr00jK+H52o2Ubk5IONFAp3RX9gZzmPUVnZZ/NBYzjCERdDC+Hp
        NclTrWkhhJ4I6K989rJGEdbP9wRMUyJHGH2AU5O9Zw==
X-Google-Smtp-Source: AMrXdXuV1GZHhmhD/tdTHvoaqpjmOZP/HVHwmSPKdVrLl7BG7O4krg7GeVU8E5L8HhOUaHJHga/g9DnNxP3NYpuSqRk=
X-Received: by 2002:a25:a87:0:b0:800:ea7e:bb0 with SMTP id 129-20020a250a87000000b00800ea7e0bb0mr2335459ybk.516.1674631793823;
 Tue, 24 Jan 2023 23:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
 <20220617233328.1143665-5-dmitry.baryshkov@linaro.org> <37cf7080-8c4c-556c-a97c-ef0b0db1db11@quicinc.com>
In-Reply-To: <37cf7080-8c4c-556c-a97c-ef0b0db1db11@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Jan 2023 09:29:42 +0200
Message-ID: <CAA8EJpod2r1VKVxG7Tf409+T7FQR4VPFmUudxhD+cs8_y3Go+w@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] drm/msm: stop storing the array of CRTCs in struct msm_drm_private
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Jan 2023 at 04:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/17/2022 4:33 PM, Dmitry Baryshkov wrote:
> > The array of CRTC in the struct msm_drm_private duplicates a list of
> > CRTCs in the drm_device. Drop it and use the existing list for CRTC
> > enumeration.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
> >   drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
> >   drivers/gpu/drm/msm/msm_drv.h            |  3 +-
> >   5 files changed, 27 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index e23e2552e802..e79f0a8817ac 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -806,7 +806,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
> >                       ret = PTR_ERR(crtc);
> >                       return ret;
> >               }
> > -             priv->crtcs[priv->num_crtcs++] = crtc;
> > +             priv->num_crtcs++;
> >       }
> >
> >       /* All CRTCs are compatible with all encoders */
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > index fb48c8c19ec3..7449c1693e45 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > @@ -337,7 +337,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
> >                       goto fail;
> >               }
> >
> > -             priv->crtcs[priv->num_crtcs++] = crtc;
> > +             priv->num_crtcs++;
> >       }
> >
> >       /*
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 3d5621a68f85..36808990f840 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -497,7 +497,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
> >                       DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
> >                       goto fail;
> >               }
> > -             priv->crtcs[priv->num_crtcs++] = crtc;
> > +             priv->num_crtcs++;
> >       }
> >
> >       /*
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 1aab6bf86278..567e77dae43b 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -149,7 +149,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
> >
> >   struct msm_vblank_work {
> >       struct work_struct work;
> > -     int crtc_id;
> > +     struct drm_crtc *crtc;
> >       bool enable;
> >       struct msm_drm_private *priv;
> >   };
> > @@ -162,15 +162,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
> >       struct msm_kms *kms = priv->kms;
> >
>
> Is there any chance of vbl_work->crtc becoming NULL before this gets
> executed?

No. The worker is created in vblank_ctrl_queue_work. The
vbl_work->crtc is filled at the time of creation.

> So do we need to protect this like
>
> if (vbl_work->enable && vbl_work->crtc)
>
> Because the layers below this dont seem to have NULL protection.
>
>
> >       if (vbl_work->enable)
> > -             kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
> > +             kms->funcs->enable_vblank(kms, vbl_work->crtc);
> >       else
> > -             kms->funcs->disable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
> > +             kms->funcs->disable_vblank(kms, vbl_work->crtc);
> >
> >       kfree(vbl_work);
> >   }
> >
> >   static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
> > -                                     int crtc_id, bool enable)
> > +                                     struct drm_crtc *crtc, bool enable)
> >   {
> >       struct msm_vblank_work *vbl_work;
> >
> > @@ -180,7 +180,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
> >
> >       INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
> >
> > -     vbl_work->crtc_id = crtc_id;
> > +     vbl_work->crtc = crtc;
> >       vbl_work->enable = enable;
> >       vbl_work->priv = priv;
> >
> > @@ -354,7 +354,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
> >       struct msm_drm_private *priv = dev_get_drvdata(dev);
> >       struct drm_device *ddev;
> >       struct msm_kms *kms;
> > -     int ret, i;
> > +     struct drm_crtc *crtc;
> > +     int ret;
> >
> >       if (drm_firmware_drivers_only())
> >               return -ENODEV;
> > @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
> >       ddev->mode_config.funcs = &mode_config_funcs;
> >       ddev->mode_config.helper_private = &mode_config_helper_funcs;
> >
> > -     for (i = 0; i < priv->num_crtcs; i++) {
> > +     drm_for_each_crtc(crtc, ddev) {
> > +             struct msm_drm_thread *ev_thread;
> > +
> >               /* initialize event thread */
> > -             priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> > -             priv->event_thread[i].dev = ddev;
> > -             priv->event_thread[i].worker = kthread_create_worker(0,
> > -                     "crtc_event:%d", priv->event_thread[i].crtc_id);
> > -             if (IS_ERR(priv->event_thread[i].worker)) {
> > -                     ret = PTR_ERR(priv->event_thread[i].worker);
> > +             ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
> > +             ev_thread->crtc = crtc;
> > +             ev_thread->dev = ddev;
> > +             ev_thread->worker = kthread_create_worker(0,
> > +                     "crtc_event:%d", ev_thread->crtc->base.id);
>
> Please correct me if wrong.
>
> Today, other than just populating the name for the worker is the
> ev_thread->crtc used anywhere?
>
> If so, can we just drop crtc from msm_drm_thread and while creating the
> worker just use kthread_create_worker(0, "crtc_event:%d", crtc->base.id);

It seems so. I'll take a look for v2.

However your questions actually raised another question in my head. I
went on looking for the reason for such complex vblank handling. It
was added by Hai Li in the commit 78b1d470d57d ("drm/msm: Enable
clocks during enable/disable_vblank() callbacks"). However I don't
fully understand why the code will toggle vblank handling while the
DPU/MDP5/MDP4 device is not resumed already. Maybe I just missed
something here. Do you know the story behind the change?

>
> > +             if (IS_ERR(ev_thread->worker)) {
> > +                     ret = PTR_ERR(ev_thread->worker);
> >                       DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> > -                     priv->event_thread[i].worker = NULL;
> > +                     ev_thread->worker = NULL;
> >                       goto err_msm_uninit;
> >               }
> >
> > -             sched_set_fifo(priv->event_thread[i].worker->task);
> > +             sched_set_fifo(ev_thread->worker->task);
> >       }
> >
> >       ret = drm_vblank_init(ddev, priv->num_crtcs);
> > @@ -563,25 +567,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
> >   int msm_crtc_enable_vblank(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev = crtc->dev;
> > -     unsigned int pipe = crtc->index;
> >       struct msm_drm_private *priv = dev->dev_private;
> >       struct msm_kms *kms = priv->kms;
> >       if (!kms)
> >               return -ENXIO;
> > -     drm_dbg_vbl(dev, "crtc=%u", pipe);
> > -     return vblank_ctrl_queue_work(priv, pipe, true);
> > +     drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
> > +     return vblank_ctrl_queue_work(priv, crtc, true);
> >   }
> >
> >   void msm_crtc_disable_vblank(struct drm_crtc *crtc)
> >   {
> >       struct drm_device *dev = crtc->dev;
> > -     unsigned int pipe = crtc->index;
> >       struct msm_drm_private *priv = dev->dev_private;
> >       struct msm_kms *kms = priv->kms;
> >       if (!kms)
> >               return;
> > -     drm_dbg_vbl(dev, "crtc=%u", pipe);
> > -     vblank_ctrl_queue_work(priv, pipe, false);
> > +     drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
> > +     vblank_ctrl_queue_work(priv, crtc, false);
> >   }
> >
> >   /*
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 08388d742d65..0e98b6f161df 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -102,7 +102,7 @@ struct msm_display_topology {
> >   /* Commit/Event thread specific structure */
> >   struct msm_drm_thread {
> >       struct drm_device *dev;
> > -     unsigned int crtc_id;
> > +     struct drm_crtc *crtc;
> >       struct kthread_worker *worker;
> >   };
> >
> > @@ -178,7 +178,6 @@ struct msm_drm_private {
> >       struct workqueue_struct *wq;
> >
> >       unsigned int num_crtcs;
> > -     struct drm_crtc *crtcs[MAX_CRTCS];
> >
> >       struct msm_drm_thread event_thread[MAX_CRTCS];
> >



-- 
With best wishes
Dmitry
