Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67152B2FCC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 19:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgKNSpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 13:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgKNSpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 13:45:13 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEEFC0613D1;
        Sat, 14 Nov 2020 10:45:12 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s8so13957469wrw.10;
        Sat, 14 Nov 2020 10:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mwaTQ8CRNOisIPpv1s2Kuarb/aJwOV+xZelk78899p4=;
        b=eXiaXE1zpOF7soDIe0ZFrZUhZudhtfvkavxwo7+c1rjBg6fbIMTMta9ZYySZcwoPQe
         j2t5qXqq9r/wzUv6z90z6kNo/pyMXXX8EMqj1ZI6n1IMeiAigipzXVLcLe5AqoKNypTT
         wWJuJmM9ELwq9sjFlLSmnRO0omO1ovv8j0bG1tkZnO66B9XP3JoCL9isxCfVD9AmwVyl
         ty9Eza2J0fhyjcrDnK6yt0eyH6vMY+vBXpoGN29/O2/Q6lGoJdVQfXtaaCUHL6REcjsO
         3TS/FWSUTCT//JIJVamaVqDmnA8X5tz6uUqfMXYaS+7rx5UBddXU2n1tJiUGslRZZcg5
         TbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mwaTQ8CRNOisIPpv1s2Kuarb/aJwOV+xZelk78899p4=;
        b=iCCN+aiLKS3Q/ifw91TJ9KfR6Xk6h1BJ/h/1/FH6dYEegc51DZRPUFMpfOgJ2yEfOx
         Af/CSMOYcQEGpeDE9SyUSGfhzzbePdBitNGC0Q1c5crJdSRwO+J5cC/7/em/X7Ouqp3D
         cZJtzuF5CDRnLjej2jZIzNUsn2nHZcQ56VNVxp3LPnkilNrktSCs/pNyuSvwD7WBfF7F
         6OIkZZ9Ig2PI9WxsQO0dGoXaOBYh4k+TZafFFSLCvb6FzKS0wAssUoqmHV+HRUYxyU9l
         v6NWUl4eESM2t6Yx8vWBANQdQJuAELwaWr6nq/IwOkup2ZIZoQcKCF7fGPzfttqoFlqp
         hmSg==
X-Gm-Message-State: AOAM531gh+7BWi2w4XQjurNM6s1vLU9FBjxgr00ocICdwganQKvRm2zA
        i5fKX/CTHTOpegMRqD2D+ZTi0LSsH2vozRDmODg=
X-Google-Smtp-Source: ABdhPJzzVqEbJpQptFAswg6i7BE/EPfAuddQpxmWjHIdbT4+CANyjD8wZ1iz67UV4WIHafY4RUG8eMwCcs6AqW3aROE=
X-Received: by 2002:adf:f04b:: with SMTP id t11mr10162129wro.147.1605379511355;
 Sat, 14 Nov 2020 10:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca> <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de>
In-Reply-To: <20201114162406.GC24411@lst.de>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 14 Nov 2020 10:46:55 -0800
Message-ID: <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> > +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> > +             size_t range_start, size_t range_end)
> > +{
> > +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > +     struct device *dev = msm_obj->base.dev->dev;
> > +
> > +     /* exit early if get_pages() hasn't been called yet */
> > +     if (!msm_obj->pages)
> > +             return;
> > +
> > +     /* TODO: sync only the specified range */
> > +
> > +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> > +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> > +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
> > +     }
> > +
> > +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
> > +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> > +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
> > +     }
>
> Splitting this helper from the only caller is rather strange, epecially
> with the two unused arguments.  And I think the way this is specified
> to take a range, but ignoring it is actively dangerous.  User space will
> rely on it syncing everything sooner or later and then you are stuck.
> So just define a sync all primitive for now, and if you really need a
> range sync and have actually implemented it add a new ioctl for that.

We do already have a split of ioctl "layer" which enforces valid ioctl
params, etc, and gem (or other) module code which is called by the
ioctl func.  So I think it is fine to keep this split here.  (Also, I
think at some point there will be a uring type of ioctl alternative
which would re-use the same gem func.)

But I do agree that the range should be respected or added later..
drm_ioctl() dispatch is well prepared for extending ioctls.

And I assume there should be some validation that the range is aligned
to cache-line?  Or can we flush a partial cache line?

BR,
-R
