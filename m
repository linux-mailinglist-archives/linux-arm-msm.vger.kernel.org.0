Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 257266CAF2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 21:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjC0Tw0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 15:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjC0TwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 15:52:25 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A579B10E4;
        Mon, 27 Mar 2023 12:52:24 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-17ebba88c60so10504486fac.3;
        Mon, 27 Mar 2023 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679946743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOeyvNM2ZkClu4K/AQvtGM1KseO25livn4C7WwiG+Gg=;
        b=GaxAghCjDn88pOdICJCZR82LlswPzoRXdDZCEEPtxe9eGAcQlcsn2CAZSexfpxEtcD
         PMdCxeNezhZaGaerz5f3kn1YltZwAgV1eFH14LvQ+IXoZHLHfXG+k8kzLZnTT/iNRkBS
         ZT6gD+VFNY8ox2qhcKaX6QJVMPKN3mnuPOHaBV+caujCPbXNiZuk4mW6AKVYDEz0CfkV
         T9zaEI0+tkRHwsJuroqIbb+lwkX22hYoaY2PkymcL9oTbRmzoYgcCuVwlPs+WL1anc7K
         M28v90tri5jNi0wcE7Otj8ID3ovSd1xszA2kB96jhcW1cLYovTZzTqBULfu+e+6N3aAK
         mJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679946743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOeyvNM2ZkClu4K/AQvtGM1KseO25livn4C7WwiG+Gg=;
        b=7iztREkxxIluVkRmzAmAsCWDAqmqXqgYihSLiPn31n80DU1PgQUcrgGEI3lgaftfCF
         pToPlpSp2j439H4oJKiyOvJ0FIbgAZOJpoesHjHaC/8+uPxbUKFmsRcpIh9fbQvPy1T1
         qElMotHtCv49ZTFidinx15nM6Y7I4INGC3GXR9PECqXuMaMqKfKKivLGP2By874MlRMX
         a4bXQ08UZ2l9LBsD9UYbE4iKZEFxIo5NRrHvGfyXAVJ4gWehZqa3wt0ZRueOajmtzrd6
         mgsGfJsw/y8YVHS92fPK3hjImK9OXs159KtCAOymbWZbCjE91R4xw2WgOVf7s/XkHSlf
         spuA==
X-Gm-Message-State: AO0yUKURpuKGx+AfhLQO51QOi0vbZAvQ/iqa22bkMvwH5CP/IR6GL5CT
        jE2O80FyRAokRC8rfffOxxW+je5dgb1aNvVIiCZ+/4EX
X-Google-Smtp-Source: AK7set+i7Sze3KZelymn6HBe2YX7OjmDImhvyS9SyCtpe/68g2KV5V63Trh+fU3XfoDkhCSikGH9ToUCxeknxDglwwk=
X-Received: by 2002:a05:687c:198:b0:17e:3201:41b0 with SMTP id
 yo24-20020a05687c019800b0017e320141b0mr4130181oab.5.1679946742824; Mon, 27
 Mar 2023 12:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230320144356.803762-1-robdclark@gmail.com> <20230320144356.803762-18-robdclark@gmail.com>
 <CAJZ5v0g0vFoZm=tVG=c2Eh_NObA6sXA10BdT4PsMnnbMidtEQA@mail.gmail.com>
In-Reply-To: <CAJZ5v0g0vFoZm=tVG=c2Eh_NObA6sXA10BdT4PsMnnbMidtEQA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 27 Mar 2023 12:52:11 -0700
Message-ID: <CAF6AEGuSCeiyHt1aF59s-6TudPZ-23HiScqFUj18HWvjVC6pdw@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] PM / QoS: Fix constraints alloc vs reclaim locking
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:HIBERNATION (aka Software Suspend, aka swsusp)" 
        <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 27, 2023 at 10:53=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
>
> On Mon, Mar 20, 2023 at 3:45=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In the process of adding lockdep annotation for drm GPU scheduler's
> > job_run() to detect potential deadlock against shrinker/reclaim, I hit
> > this lockdep splat:
> >
> >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >    WARNING: possible circular locking dependency detected
> >    6.2.0-rc8-debug+ #558 Tainted: G        W
> >    ------------------------------------------------------
> >    ring0/125 is trying to acquire lock:
> >    ffffffd6d6ce0f28 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_update=
_request+0x38/0x68
> >
> >    but task is already holding lock:
> >    ffffff8087239208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_submit=
+0xec/0x178
> >
> >    which lock already depends on the new lock.
> >
> >    the existing dependency chain (in reverse order) is:
> >
> >    -> #4 (&gpu->active_lock){+.+.}-{3:3}:
> >           __mutex_lock+0xcc/0x3c8
> >           mutex_lock_nested+0x30/0x44
> >           msm_gpu_submit+0xec/0x178
> >           msm_job_run+0x78/0x150
> >           drm_sched_main+0x290/0x370
> >           kthread+0xf0/0x100
> >           ret_from_fork+0x10/0x20
> >
> >    -> #3 (dma_fence_map){++++}-{0:0}:
> >           __dma_fence_might_wait+0x74/0xc0
> >           dma_resv_lockdep+0x1f4/0x2f4
> >           do_one_initcall+0x104/0x2bc
> >           kernel_init_freeable+0x344/0x34c
> >           kernel_init+0x30/0x134
> >           ret_from_fork+0x10/0x20
> >
> >    -> #2 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
> >           fs_reclaim_acquire+0x80/0xa8
> >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> >           __kmem_cache_alloc_node+0x60/0x1cc
> >           __kmalloc+0xd8/0x100
> >           topology_parse_cpu_capacity+0x8c/0x178
> >           get_cpu_for_node+0x88/0xc4
> >           parse_cluster+0x1b0/0x28c
> >           parse_cluster+0x8c/0x28c
> >           init_cpu_topology+0x168/0x188
> >           smp_prepare_cpus+0x24/0xf8
> >           kernel_init_freeable+0x18c/0x34c
> >           kernel_init+0x30/0x134
> >           ret_from_fork+0x10/0x20
> >
> >    -> #1 (fs_reclaim){+.+.}-{0:0}:
> >           __fs_reclaim_acquire+0x3c/0x48
> >           fs_reclaim_acquire+0x54/0xa8
> >           slab_pre_alloc_hook.constprop.0+0x40/0x25c
> >           __kmem_cache_alloc_node+0x60/0x1cc
> >           kmalloc_trace+0x50/0xa8
> >           dev_pm_qos_constraints_allocate+0x38/0x100
> >           __dev_pm_qos_add_request+0xb0/0x1e8
> >           dev_pm_qos_add_request+0x58/0x80
> >           dev_pm_qos_expose_latency_limit+0x60/0x13c
> >           register_cpu+0x12c/0x130
> >           topology_init+0xac/0xbc
> >           do_one_initcall+0x104/0x2bc
> >           kernel_init_freeable+0x344/0x34c
> >           kernel_init+0x30/0x134
> >           ret_from_fork+0x10/0x20
> >
> >    -> #0 (dev_pm_qos_mtx){+.+.}-{3:3}:
> >           __lock_acquire+0xe00/0x1060
> >           lock_acquire+0x1e0/0x2f8
> >           __mutex_lock+0xcc/0x3c8
> >           mutex_lock_nested+0x30/0x44
> >           dev_pm_qos_update_request+0x38/0x68
> >           msm_devfreq_boost+0x40/0x70
> >           msm_devfreq_active+0xc0/0xf0
> >           msm_gpu_submit+0x10c/0x178
> >           msm_job_run+0x78/0x150
> >           drm_sched_main+0x290/0x370
> >           kthread+0xf0/0x100
> >           ret_from_fork+0x10/0x20
> >
> >    other info that might help us debug this:
> >
> >    Chain exists of:
> >      dev_pm_qos_mtx --> dma_fence_map --> &gpu->active_lock
> >
> >     Possible unsafe locking scenario:
> >
> >           CPU0                    CPU1
> >           ----                    ----
> >      lock(&gpu->active_lock);
> >                                   lock(dma_fence_map);
> >                                   lock(&gpu->active_lock);
> >      lock(dev_pm_qos_mtx);
> >
> >     *** DEADLOCK ***
> >
> >    3 locks held by ring0/123:
> >     #0: ffffff8087251170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x64=
/0x150
> >     #1: ffffffd00b0e57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_run+0=
x68/0x150
> >     #2: ffffff8087251208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_s=
ubmit+0xec/0x178
> >
> >    stack backtrace:
> >    CPU: 6 PID: 123 Comm: ring0 Not tainted 6.2.0-rc8-debug+ #559
> >    Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> >    Call trace:
> >     dump_backtrace.part.0+0xb4/0xf8
> >     show_stack+0x20/0x38
> >     dump_stack_lvl+0x9c/0xd0
> >     dump_stack+0x18/0x34
> >     print_circular_bug+0x1b4/0x1f0
> >     check_noncircular+0x78/0xac
> >     __lock_acquire+0xe00/0x1060
> >     lock_acquire+0x1e0/0x2f8
> >     __mutex_lock+0xcc/0x3c8
> >     mutex_lock_nested+0x30/0x44
> >     dev_pm_qos_update_request+0x38/0x68
> >     msm_devfreq_boost+0x40/0x70
> >     msm_devfreq_active+0xc0/0xf0
> >     msm_gpu_submit+0x10c/0x178
> >     msm_job_run+0x78/0x150
> >     drm_sched_main+0x290/0x370
> >     kthread+0xf0/0x100
> >     ret_from_fork+0x10/0x20
> >
> > The issue is that dev_pm_qos_mtx is held in the runpm suspend/resume (o=
r
> > freq change) path, but it is also held across allocations that could
> > recurse into shrinker.
> >
> > Solve this by changing dev_pm_qos_constraints_allocate() into a functio=
n
> > that can be called unconditionally before the device qos object is
> > needed and before aquiring dev_pm_qos_mtx.  This way the allocations ca=
n
> > be done without holding the mutex.  In the case that we raced with
> > another thread to allocate the qos object, detect this *after* acquirin=
g
> > the dev_pm_qos_mtx and simply free the redundant allocations.
>
> Honestly, I don't like this approach.
>
> In particular, dropping a lock just in order to grab it again right
> away is really confusing (and I'm not even sure it is correct ATM).

This patch isn't actually doing that.  (And you are right, if it were,
that would be a thing to be suspicious of)

It is just moving the allocations ahead of the locking.

> Let me think about how to possibly address the issue at hand in a differe=
nt way.

Per device locking would make this easier.  But I suppose that gets
into needing ww_mutex when you have things like device_link?

BR,
-R

> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/base/power/qos.c | 60 +++++++++++++++++++++++++++-------------
> >  1 file changed, 41 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> > index 8e93167f1783..f3e0c6b65635 100644
> > --- a/drivers/base/power/qos.c
> > +++ b/drivers/base/power/qos.c
> > @@ -185,18 +185,24 @@ static int apply_constraint(struct dev_pm_qos_req=
uest *req,
> >  }
> >
> >  /*
> > - * dev_pm_qos_constraints_allocate
> > + * dev_pm_qos_constraints_ensure_allocated
> >   * @dev: device to allocate data for
> >   *
> > - * Called at the first call to add_request, for constraint data alloca=
tion
> > - * Must be called with the dev_pm_qos_mtx mutex held
> > + * Called to ensure that devices qos is allocated, before acquiring
> > + * dev_pm_qos_mtx.
> >   */
> > -static int dev_pm_qos_constraints_allocate(struct device *dev)
> > +static int dev_pm_qos_constraints_ensure_allocated(struct device *dev)
> >  {
> >         struct dev_pm_qos *qos;
> >         struct pm_qos_constraints *c;
> >         struct blocking_notifier_head *n;
> >
> > +       if (!dev)
> > +               return -ENODEV;
> > +
> > +       if (!IS_ERR_OR_NULL(dev->power.qos))
> > +               return 0;
> > +
> >         qos =3D kzalloc(sizeof(*qos), GFP_KERNEL);
> >         if (!qos)
> >                 return -ENOMEM;
> > @@ -227,10 +233,26 @@ static int dev_pm_qos_constraints_allocate(struct=
 device *dev)
> >
> >         INIT_LIST_HEAD(&qos->flags.list);
> >
> > +       mutex_lock(&dev_pm_qos_mtx);
> > +
> > +       if (!IS_ERR_OR_NULL(dev->power.qos)) {
> > +               /*
> > +                * We have raced with another task to create the qos.
> > +                * No biggie, just free the resources we've allocated
> > +                * outside of dev_pm_qos_mtx and move on with life.
> > +                */
> > +               kfree(n);
> > +               kfree(qos);
> > +               goto unlock;
> > +       }
> > +
> >         spin_lock_irq(&dev->power.lock);
> >         dev->power.qos =3D qos;
> >         spin_unlock_irq(&dev->power.lock);
> >
> > +unlock:
> > +       mutex_unlock(&dev_pm_qos_mtx);
> > +
> >         return 0;
> >  }
> >
> > @@ -331,17 +353,15 @@ static int __dev_pm_qos_add_request(struct device=
 *dev,
> >  {
> >         int ret =3D 0;
> >
> > -       if (!dev || !req || dev_pm_qos_invalid_req_type(dev, type))
> > +       if (!req || dev_pm_qos_invalid_req_type(dev, type))
> >                 return -EINVAL;
> >
> >         if (WARN(dev_pm_qos_request_active(req),
> >                  "%s() called for already added request\n", __func__))
> >                 return -EINVAL;
> >
> > -       if (IS_ERR(dev->power.qos))
> > +       if (IS_ERR_OR_NULL(dev->power.qos))
> >                 ret =3D -ENODEV;
> > -       else if (!dev->power.qos)
> > -               ret =3D dev_pm_qos_constraints_allocate(dev);
> >
> >         trace_dev_pm_qos_add_request(dev_name(dev), type, value);
> >         if (ret)
> > @@ -390,6 +410,10 @@ int dev_pm_qos_add_request(struct device *dev, str=
uct dev_pm_qos_request *req,
> >  {
> >         int ret;
> >
> > +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> > +       if (ret)
> > +               return ret;
> > +
> >         mutex_lock(&dev_pm_qos_mtx);
> >         ret =3D __dev_pm_qos_add_request(dev, req, type, value);
> >         mutex_unlock(&dev_pm_qos_mtx);
> > @@ -537,15 +561,11 @@ int dev_pm_qos_add_notifier(struct device *dev, s=
truct notifier_block *notifier,
> >  {
> >         int ret =3D 0;
> >
> > -       mutex_lock(&dev_pm_qos_mtx);
> > -
> > -       if (IS_ERR(dev->power.qos))
> > -               ret =3D -ENODEV;
> > -       else if (!dev->power.qos)
> > -               ret =3D dev_pm_qos_constraints_allocate(dev);
> > -
> > +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> >         if (ret)
> > -               goto unlock;
> > +               return ret;
> > +
> > +       mutex_lock(&dev_pm_qos_mtx);
> >
> >         switch (type) {
> >         case DEV_PM_QOS_RESUME_LATENCY:
> > @@ -565,7 +585,6 @@ int dev_pm_qos_add_notifier(struct device *dev, str=
uct notifier_block *notifier,
> >                 ret =3D -EINVAL;
> >         }
> >
> > -unlock:
> >         mutex_unlock(&dev_pm_qos_mtx);
> >         return ret;
> >  }
> > @@ -905,10 +924,13 @@ int dev_pm_qos_update_user_latency_tolerance(stru=
ct device *dev, s32 val)
> >  {
> >         int ret;
> >
> > +       ret =3D dev_pm_qos_constraints_ensure_allocated(dev);
> > +       if (ret)
> > +               return ret;
> > +
> >         mutex_lock(&dev_pm_qos_mtx);
> >
> > -       if (IS_ERR_OR_NULL(dev->power.qos)
> > -           || !dev->power.qos->latency_tolerance_req) {
> > +       if (!dev->power.qos->latency_tolerance_req) {
> >                 struct dev_pm_qos_request *req;
> >
> >                 if (val < 0) {
> > --
