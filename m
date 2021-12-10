Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C1647067C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 17:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241095AbhLJRAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 12:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235352AbhLJRAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 12:00:01 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EA3C061746
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 08:56:26 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id t6so8308704qkg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 08:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T6idOHz1U1VZoCWW7afFUyo4qFS4AUPhxTkOJEXYPQw=;
        b=t81eJYo33BRXAUg16ZEiEhfiEIiYGkswJN4St4FyfRtcunzvHK2krPs6BtoSuPR5Hm
         2GlLAX5iDhxHZJDCILlbPUlJV7R3h6VWJ+qVPiEJ+dWpnDkzhhmCOgiqyH+PyUhIGPy1
         y1G52ZRd94o675cxZVkAW/hZeCs27E0if9Om0d5Qt8v/hh+IbwWSiAF12XE3WZ68g9eq
         tgvxeFZQ/6BvJRW+g33SuDVF3EyCSn0lJaQMgM3cow0SHe7r0GTehrhoSdVQHPKyBZ6r
         t/trWhI4zGlc93Puh3NlnA3DaaI2rH0etaeGltradL4Cs/OuHbowNKKVggNbxIH258lY
         IbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T6idOHz1U1VZoCWW7afFUyo4qFS4AUPhxTkOJEXYPQw=;
        b=cCgBJElSXTCbW6VZbfCFqqXgRFBKltT5K8z944H+ZQV5Pt214qlUEZc020WvfWSvuP
         9xd2EP/FBOMPIw/GMOJ+k0pXcaxj5YKdqoTmHQ/kzRlgDxvQIpLRmBNLCzkBldCoBuWJ
         bZqMhH+ZN83rIV8vfjHv5iYSo8ad8okg5IVYBzbHtgkEmCNqweGWlJMh963vpvHp/pCc
         b2FX3QGX1hYaA39chU1UoTQvl5h2jJc905P2NOuhWEd6cbrBRfg/312ftx9dTprT4gXF
         MM+B3W497sAkHhIlhBrf7W6NUtadyvl+aJHBIFRJxQba+8v19arMO/5yR4jxX4WUIo53
         P3rg==
X-Gm-Message-State: AOAM532SdS2PdG/wez+sIPPfJ7odQtIkrWvRcByIW9zYaO1JkaVj5rvr
        VTdc1SxiXEEzuZR3lituuj4dFcOna4dZOp4ZvT+chmpdTn7ERA==
X-Google-Smtp-Source: ABdhPJxlkg6Ur0auM+fLMIYNDAIT1hjkBEmUh9sQj/cYFqTLX/0MCFRUIJtBySm7ZdWDhUa0+ijPOm2fTGBfqb+40bM=
X-Received: by 2002:a05:620a:c50:: with SMTP id u16mr22172842qki.203.1639155385153;
 Fri, 10 Dec 2021 08:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20211210134446.GA16069@kili> <CAF6AEGsVo8-ORpZ3To0vWJNuHDF9DSYpCFvxY7Dau1FxPyOiJA@mail.gmail.com>
In-Reply-To: <CAF6AEGsVo8-ORpZ3To0vWJNuHDF9DSYpCFvxY7Dau1FxPyOiJA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 10 Dec 2021 19:56:14 +0300
Message-ID: <CAA8EJpp5Ldn=gVzoSCncOWuU4_58hVukuEL=ibz1+T==2_gmMw@mail.gmail.com>
Subject: Re: [bug report] drm/msm: basic KMS driver for snapdragon
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Dec 2021 at 19:51, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Dec 10, 2021 at 5:45 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > [ This bug is obviously 8 and a half years old now.  It's weird that
> >   no one has reported it.  But the bug seems very clear although the
> >   fix is probably difficult. -dan ]
> >
> > Hello Rob Clark,
> >
> > The patch c8afe684c95c: "drm/msm: basic KMS driver for snapdragon"
> > from Jun 26, 2013, leads to the following Smatch static checker
> > warning:
> >
> >         drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c:372 update_cursor()
> >         warn: sleeping in atomic context
> >
> > drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> >     355 static void update_cursor(struct drm_crtc *crtc)
> >     356 {
> >     357         struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
> >     358         struct mdp4_kms *mdp4_kms = get_kms(crtc);
> >     359         struct msm_kms *kms = &mdp4_kms->base.base;
> >     360         enum mdp4_dma dma = mdp4_crtc->dma;
> >     361         unsigned long flags;
> >     362
> >     363         spin_lock_irqsave(&mdp4_crtc->cursor.lock, flags);
> >                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Takes a spin lock.
> >
> >     364         if (mdp4_crtc->cursor.stale) {
> >     365                 struct drm_gem_object *next_bo = mdp4_crtc->cursor.next_bo;
> >     366                 struct drm_gem_object *prev_bo = mdp4_crtc->cursor.scanout_bo;
> >     367                 uint64_t iova = mdp4_crtc->cursor.next_iova;
> >     368
> >     369                 if (next_bo) {
> >     370                         /* take a obj ref + iova ref when we start scanning out: */
> >     371                         drm_gem_object_get(next_bo);
> > --> 372                         msm_gem_get_and_pin_iova(next_bo, kms->aspace, &iova);
> >                                 ^^^^^^^^^^^^^^^^^^^^^^^^^
> > The msm_gem_get_and_pin_iova() function takes a mutex so it will sleep.
>
> Hmm, it's even worse.. this is called from an irq handler..
>
> It looks like initially this called msm_gem_get_iova_locked() but that
> changed in 0e08270a1f01 ("drm/msm: Separate locking of buffer
> resources from struct_mutex")
>
> mdp4_crtc_cursor_set() already pins the iova, so all we _really_ need
> to do is take an extra reference until until scanout completes.. but
> we maybe don't even need that as drm_flip_work should defer
> unref/unpin until after vblank.  So might not be too hard to fix.. the
> harder thing, for me at least, might be resurrecting some hw to test
> the fix on.  The last thing I know of that used mdp4 was the SoC in
> the nexus 4.

I have nexus 7 here, so if you provide patches, I can test them.
Noting myself to acquire ifc6410.

>
> BR,
> -R
>
> >     373
> >     374                         /* enable cursor: */
> >     375                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_SIZE(dma),
> >     376                                         MDP4_DMA_CURSOR_SIZE_WIDTH(mdp4_crtc->cursor.width) |
> >     377                                         MDP4_DMA_CURSOR_SIZE_HEIGHT(mdp4_crtc->cursor.height));
> >     378                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BASE(dma), iova);
> >     379                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BLEND_CONFIG(dma),
> >     380                                         MDP4_DMA_CURSOR_BLEND_CONFIG_FORMAT(CURSOR_ARGB) |
> >     381                                         MDP4_DMA_CURSOR_BLEND_CONFIG_CURSOR_EN);
> >     382                 } else {
> >     383                         /* disable cursor: */
> >     384                         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_BASE(dma),
> >     385                                         mdp4_kms->blank_cursor_iova);
> >     386                 }
> >     387
> >     388                 /* and drop the iova ref + obj rev when done scanning out: */
> >     389                 if (prev_bo)
> >     390                         drm_flip_work_queue(&mdp4_crtc->unref_cursor_work, prev_bo);
> >     391
> >     392                 mdp4_crtc->cursor.scanout_bo = next_bo;
> >     393                 mdp4_crtc->cursor.stale = false;
> >     394         }
> >     395
> >     396         mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_POS(dma),
> >     397                         MDP4_DMA_CURSOR_POS_X(mdp4_crtc->cursor.x) |
> >     398                         MDP4_DMA_CURSOR_POS_Y(mdp4_crtc->cursor.y));
> >     399
> >     400         spin_unlock_irqrestore(&mdp4_crtc->cursor.lock, flags);
> >     401 }
> >
> > regards,
> > dan carpenter



-- 
With best wishes
Dmitry
