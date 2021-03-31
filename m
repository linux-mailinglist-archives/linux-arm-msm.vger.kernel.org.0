Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AD2350AC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 01:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhCaX2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 19:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbhCaX2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 19:28:16 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4852CC06175F;
        Wed, 31 Mar 2021 16:28:15 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g25so157160wmh.0;
        Wed, 31 Mar 2021 16:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXf9Lz5xugU13zm2GDio05xCri5WRi3ZI0/gGGK/ITQ=;
        b=fVjZh8q01HKLd3XrQLCnxpKNiMRzQX+a1JQXv8fkJnQjTcBMsXnXyVOXyDZyS3V6uO
         IGjXnGRcRH9PIJiv7/Ak7i8AKnYxURDYQGqztJrHF46iNSaJQEjooPTTuMQdzDhVGsGf
         MqJfa+jnylGy2eAO93pXaWDFTk2wFeCVhEkOlFDNzjO0pc9Rq+Z79CcSStZSpFtPQ4t8
         bc2HC1mPkhnSlo9XH/DSt1Itw/XCsriVs0WALJxXBme1S4Ka2WVMe9bs0Ck15Q7lmgZS
         hX/WIsJRvgCqfu6//hoCIYI1lhUco0UFkOmLvphvdn9bNPkVCAIP1HcwNzajIwwvzUQU
         CHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXf9Lz5xugU13zm2GDio05xCri5WRi3ZI0/gGGK/ITQ=;
        b=poMjiQM5yLLbTEP+M4MnBl5H0jlUJ6VjlzJ/NKxjiBD1upENQtYSzF2JXYlS0H9S7y
         nLEnrct2x481mLB5sZux9ms1MMMlrK5Ddmx3rZ5TysWYlr97yJEx5h3S+kJwsyW5XORW
         QIoEfnO2PMXWpu6TGy3Usx4fJNEZqWJAK70eERCXdwzVi6mgIkxVaWikkzYgIm+TvP+P
         nuNKvX2YKI3JyZghwqoifWIuV//G4Y5ckMWcaKiLCyvFIChEBqtxj/G1sLT37UX5K9kH
         voOfcEHnLOs8i5VQ9ZjJgnALbGpQlScXrSk2chnJpgqt9QL9m1Y0zcbts/kK/2BwVkF4
         znSA==
X-Gm-Message-State: AOAM531m3ToT8T2oN3qvvlWudyIzcvgeUbHWGpGKKBnbMXQuiY15Gpcv
        bAR93sIwLeTjstAvEUr4TZl33q+4odqreJSR4kc=
X-Google-Smtp-Source: ABdhPJzjFPQTyLhGljm6gJsAPnH6mW7novnsekkyUIiwUjDDyh8Y4UydMqboFr1dAzMj69qcE1HCQB+lNhV2IEowvZI=
X-Received: by 2002:a05:600c:21d2:: with SMTP id x18mr5239495wmj.175.1617233293967;
 Wed, 31 Mar 2021 16:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210331221630.488498-4-robdclark@gmail.com>
 <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
In-Reply-To: <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 31 Mar 2021 16:31:38 -0700
Message-ID: <CAF6AEGvxQeTFHn_ztzP=4eTQa_B106+SZ-8NjFk2RGYgRYJgSw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm: Fix debugfs deadlock
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 4:13 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > @@ -111,23 +111,15 @@ static const struct file_operations msm_gpu_fops = {
> >  static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
> >  {
> >         struct msm_drm_private *priv = dev->dev_private;
> > -       struct msm_gpu *gpu = priv->gpu;
> >         int ret;
> >
> > -       ret = mutex_lock_interruptible(&priv->mm_lock);
> > +       ret = mutex_lock_interruptible(&priv->obj_lock);
> >         if (ret)
> >                 return ret;
> >
> > -       if (gpu) {
> > -               seq_printf(m, "Active Objects (%s):\n", gpu->name);
> > -               msm_gem_describe_objects(&gpu->active_list, m);
> > -       }
> > -
> > -       seq_printf(m, "Inactive Objects:\n");
> > -       msm_gem_describe_objects(&priv->inactive_dontneed, m);
> > -       msm_gem_describe_objects(&priv->inactive_willneed, m);
> > +       msm_gem_describe_objects(&priv->objects, m);
>
> I guess we no longer sort the by Active and Inactive but that doesn't
> really matter?

It turned out to be less useful to sort by active/inactive, as much as
just having the summary at the bottom that the last patch adds.  We
can already tell from the per-object entries whether it is
active/purgable/purged.

I did initially try to come up with an approach that let me keep this,
but it would basically amount to re-writing the gem_submit path
(because you cannot do any memory allocation under mm_lock)

>
> > @@ -174,7 +174,13 @@ struct msm_drm_private {
> >         struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
> >         struct msm_perf_state *perf;
> >
> > -       /*
> > +       /**
> > +        * List of all GEM objects (mainly for debugfs, protected by obj_lock
>
> It wouldn't hurt to talk about lock ordering here? Like: "If we need
> the "obj_lock" and a "gem_lock" at the same time we always grab the
> "obj_lock" first.

good point

>
> > @@ -60,13 +60,20 @@ struct msm_gem_object {
> >          */
> >         uint8_t vmap_count;
> >
> > -       /* And object is either:
> > -        *  inactive - on priv->inactive_list
> > +       /**
> > +        * Node in list of all objects (mainly for debugfs, protected by
> > +        * struct_mutex
>
> Not "struct_mutex" in comment, right? Maybe "obj_lock" I think?

oh, right, forgot to fix that from an earlier iteration

BR,
-R
