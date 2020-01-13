Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80FA61398CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 19:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgAMSXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 13:23:53 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:36928 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAMSXx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 13:23:53 -0500
Received: by mail-il1-f196.google.com with SMTP id t8so9027113iln.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=GdPsIU0hG7suGBkyMM6A9F/OIU18NvlvaZKX62ICZx8=;
        b=F3cpbs7os6RE8zrBTuxlPO7wpMoMKwrvMNGtUUy7U6PmvdA/3IuWrXhdlDTRvA2nfq
         VkWS495dAWj/I8us3RuMz8J3YM4xEJXTLHgxpKlzGdWjYTafRlf1MJrve5FE6GLKsYEd
         2w83Ziko98Ggm9AWNE5NwXzIynltxqB5/FBPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=GdPsIU0hG7suGBkyMM6A9F/OIU18NvlvaZKX62ICZx8=;
        b=UvW52TmT1XwtnXnc2z3ThXpth3HQZePfMJBrUeADzPL1HEPSZU5pmi44yPKueV7M/a
         S4X3NjuRCotKZN5fpE5UYE9USmxAJ2ZQENP+TvvRFxC9l/QmpeUfrxRuyNZqucCERPvG
         AKBeyt3NScVhgCi0LT41Jmy986Xg589Y6cu7TTxLLIOwQxiCXG2kyUe72onV4Ep9PMhD
         YhOLzCV36RBabAQ2MC8zf+lu1nOQKBAybmZ87oxqsgzW/xN6y2FV76QNGFcvDGqT9yhh
         Qv5BFzTaDZjKMNbZ7Bi+xVhHUIJTgSBNJe8VfE6NE6vkeHBzXqDtZ2VHyBOPEXijGQUp
         Ks0g==
X-Gm-Message-State: APjAAAUvUsay4fZgD71Munko2ba4IAN0quDh19eKdUrdXIk70uSxQPiZ
        F2S9v1qo+nP6IurEYOG/cWaCXdHjmm1HdVpJ1vPdWA==
X-Google-Smtp-Source: APXvYqy5QyVk/5iwd6Haxkd59B9tye4fF6hipWkapfAO86tgVjEQHDFjCK8QluGjqVB6hzY+3DU3VGHD2/A24xBIO/c=
X-Received: by 2002:a92:d708:: with SMTP id m8mr15406018iln.244.1578939832899;
 Mon, 13 Jan 2020 10:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com> <20200113153605.52350-2-brian@brkho.com>
 <20200113175522.GD26711@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200113175522.GD26711@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Mon, 13 Jan 2020 10:23:42 -0800
Message-ID: <CAJs_Fx6e1LjjdHDxKVKzw+PZx5P6xiVjDCdb0iP0mnkUd4gitA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Add a GPU-wide wait queue
To:     Brian Ho <brian@brkho.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        robdclark@chromium.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kristian Kristensen <hoegsberg@chromium.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 9:55 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Jan 13, 2020 at 10:36:04AM -0500, Brian Ho wrote:
> > This wait queue is signaled on all IRQs for a given GPU and will be
> > used as part of the new MSM_WAIT_IOVA ioctl so userspace can sleep
> > until the value at a given iova reaches a certain condition.
> >
> > Signed-off-by: Brian Ho <brian@brkho.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
> >  drivers/gpu/drm/msm/msm_gpu.h | 3 +++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index a052364a5d74..d7310c1336e5 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -779,6 +779,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> >  static irqreturn_t irq_handler(int irq, void *data)
> >  {
> >       struct msm_gpu *gpu = data;
> > +     wake_up_all(&gpu->event);
> > +
>
> I suppose it is intentional to have this happen on *all* interrupts because you
> might be using the CP interrupts for fun and profit and you don't want to plumb
> in callbacks?  I suppose it is okay to do this for all interrupts (including
> errors) but if we're spending a lot of time here we might want to only trigger
> on certain IRQs.

Was just talking to Kristian about GPU hangs.. and I suspect we might
want the ioctl to return an error if there is a gpu reset (so that
userspace can use the robustness uapi to test if the gpu reset was
something it cares about, etc)

Which is as good as a reason as I can think of the wake_up_all() on all irqs..

BR,
-R

>
> >       return gpu->funcs->irq(gpu);
> >  }
> >
> > @@ -871,6 +873,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >
> >       spin_lock_init(&gpu->perf_lock);
> >
> > +     init_waitqueue_head(&gpu->event);
> > +
> >
> >       /* Map registers: */
> >       gpu->mmio = msm_ioremap(pdev, config->ioname, name);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index ab8f0f9c9dc8..60562f065dbc 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -104,6 +104,9 @@ struct msm_gpu {
> >
> >       struct msm_gem_address_space *aspace;
> >
> > +     /* GPU-wide wait queue that is signaled on all IRQs */
> > +     wait_queue_head_t event;
> > +
> >       /* Power Control: */
> >       struct regulator *gpu_reg, *gpu_cx;
> >       struct clk_bulk_data *grp_clks;
> > --
> > 2.25.0.rc1.283.g88dfdc4193-goog
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
