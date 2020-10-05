Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2184282E73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 02:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgJEAJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 20:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgJEAJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 20:09:41 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FB4C0613CE;
        Sun,  4 Oct 2020 17:09:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z1so7577409wrt.3;
        Sun, 04 Oct 2020 17:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ANfg3S5CC8bE/UKRRj/hwXpqbswu89gsCaaWsI1hDQ=;
        b=PxyPAEdNh2qvXFbWkKrPJ8KPmnWPmT2SKIgNwuRYb6MAJMExP204dfriEl7lNANvyM
         kCCkSVC0jEhQ8FFZ9A3AfzgoVrxvx1zas1vgNuzUqMbbYW4ft+FAQaPT6zHxDkUtkOTP
         BKLbMytpzm8gXlYZDx8qx1E7gRTrPNn2LzQLo1b+4rkh4RqoVIe6LrIrde3q+OyBUF0r
         D2GDsBqQChiQCDKtNEY1CC8u9+WpHdh4jSUZW3znxLcEUgFmObnlWyn2MFSWd+cEN8+I
         tcLnulGKwxsrUC0cMd2LIKC6Lla/3JlCEwaTC62nTsxY3+ynPHXC8si7l1P8g4zZPnOU
         9+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ANfg3S5CC8bE/UKRRj/hwXpqbswu89gsCaaWsI1hDQ=;
        b=WIxmj3Td+tDSdi0B9tpdA3leTOuWNJWS0jRu93Pweu95SYeJgFCTWEcUaujdeOInY0
         nLY6nkHcYqgmxykRNo+0CzLb5WbK/t9/oT4xDZOTNccqOaHdfF996XyRLRCO31Tmp1Ul
         Ex8FZR4HFpSpGbD/aO9+o91xhNIGPwa00W3EyiuljzWNdfQBL29teuOGf6tEtRYXkGJZ
         ENRUUeFERfnD8/ogu0vPP2oObGn24VgUP51RKjXnGAoJl9b5MRYguAPbE/x1+CORNP7F
         5ZcTlz+ExAxrWiKV0FA+p3WNbEtkBRGegvT8DaGzevZjkYjMdlGapcfB+0pibrROqLlG
         dE7g==
X-Gm-Message-State: AOAM533Mhrjwmv75o2XX22zVZ2a/rZw7LtjwuTMX1tzFvFOMX8B0Ylto
        OWXkWCB1Ti3erMw6h1pyeMOWCHJ//iB29CyHypIs1EzifaDqfQ==
X-Google-Smtp-Source: ABdhPJxwaxtwbgp9uz+hPQ7cBIRm3omXtyo+Lk87n93lkMddrksV668Q71MQgWfc2epKqbRNNChU/GIZ6VBDT0u7sBI=
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr14775799wrt.132.1601856579631;
 Sun, 04 Oct 2020 17:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com> <20201004192152.3298573-5-robdclark@gmail.com>
 <CAKMK7uHrP1ijVORpW0xvMX4M_0HQpfzUk2bE576gpzSPug-M6A@mail.gmail.com>
In-Reply-To: <CAKMK7uHrP1ijVORpW0xvMX4M_0HQpfzUk2bE576gpzSPug-M6A@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 4 Oct 2020 17:10:47 -0700
Message-ID: <CAF6AEGv49O97YQXJeUYzxRDUTE8fhtRKeKT6RXaEcJUo79mXQw@mail.gmail.com>
Subject: Re: [PATCH 04/14] drm/msm: Add priv->mm_lock to protect
 active/inactive lists
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 4, 2020 at 3:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Oct 4, 2020 at 9:21 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Rather than relying on the big dev->struct_mutex hammer, introduce a
> > more specific lock for protecting the bo lists.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_debugfs.c      |  7 +++++++
> >  drivers/gpu/drm/msm/msm_drv.c          |  1 +
> >  drivers/gpu/drm/msm/msm_drv.h          | 13 +++++++++++-
> >  drivers/gpu/drm/msm/msm_gem.c          | 28 +++++++++++++++-----------
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 12 +++++++++++
> >  drivers/gpu/drm/msm/msm_gpu.h          |  5 ++++-
> >  6 files changed, 52 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> > index ee2e270f464c..64afbed89821 100644
> > --- a/drivers/gpu/drm/msm/msm_debugfs.c
> > +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> > @@ -112,6 +112,11 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
> >  {
> >         struct msm_drm_private *priv = dev->dev_private;
> >         struct msm_gpu *gpu = priv->gpu;
> > +       int ret;
> > +
> > +       ret = mutex_lock_interruptible(&priv->mm_lock);
> > +       if (ret)
> > +               return ret;
> >
> >         if (gpu) {
> >                 seq_printf(m, "Active Objects (%s):\n", gpu->name);
> > @@ -121,6 +126,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
> >         seq_printf(m, "Inactive Objects:\n");
> >         msm_gem_describe_objects(&priv->inactive_list, m);
> >
> > +       mutex_unlock(&priv->mm_lock);
> > +
> >         return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 49685571dc0e..dc6efc089285 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -441,6 +441,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
> >         init_llist_head(&priv->free_list);
> >
> >         INIT_LIST_HEAD(&priv->inactive_list);
> > +       mutex_init(&priv->mm_lock);
>
> I highly recommend you drop a
>
> fs_reclaim_acquire(GFP_KERNEL);
> might_lock(&priv->mm_lock);
> fs_reclaim_release(GFP_KERNEL);
>
> in here to teach lockdep about your ordering against the shrinker.
> Gives you full testing every boot, even if your shrinker never gets
> called.

Good idea..

(tbf, I have tested this with android+lockdep which pretty is great
shrinker exercise.. but immediate notification of future problems is a
good plan)

BR,
-R
