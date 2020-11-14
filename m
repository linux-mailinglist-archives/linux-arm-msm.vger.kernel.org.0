Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A235F2B303E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 20:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgKNTj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 14:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKNTj7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 14:39:59 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AB4C0613D1;
        Sat, 14 Nov 2020 11:39:59 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p1so14031588wrf.12;
        Sat, 14 Nov 2020 11:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rw06Hihq9bntDgqNJTYafCe6Bj/kqpSy2JgWSF8XY80=;
        b=muanAw4cYZ89qHNkXL2A5mCIuGR7Xq8ZYodQlaKEqiaL6DILnpPwm6UgmDsMFo3Buz
         rNHYYh4fhT/MI4tQJLE85+hIU960S25c1vbSSRhSqVP1FZ21GuSgAKsps116gSi2gXx3
         Z5t+1LN9yWr5dFMMBb1WI0PBcwYQqqpL6N96sSsiDFtBXAk+kB9Ep8NxfKUuG6gqCTX2
         HVSPAtCALw1V57eUlN6Y2RvmUfStf8rcmdQr6YsaE+Tul5jtakH3OfgDG5gamJSIguP+
         yCtUOqwj73BM3k39pDlCX2W5FH7twtRBgFKgYYSvDpzrzK9665Z5EU386KLkxiclTcgS
         mm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rw06Hihq9bntDgqNJTYafCe6Bj/kqpSy2JgWSF8XY80=;
        b=HSemr4cuLeq0KEvWZCPUYo1DDjoAcW8WoQLoFKZkfaHgqahUnn+IpnXQjw4BaQWmwJ
         QB/9fKHAQR8XG2M+Tj8uayX6lqFTJJCUQO9WKOmQ0yhsaRXG0eWAJgO86RkkGyCuMWY1
         Yeruv7sJ9vWBNgnO/sQlVMuCHJ8cVz6ZJbPIzXIsVEKijEbg5thbWvnm1CLzvgghg4E/
         Z1hkfyZ3qo6rUrFWRLG8pGhTUuZ5l4GTqaostCx0LmfkxDo3BqNo7Tkc3DrGk37DUpl2
         j0G1ALhkyM8B1WHb8h6824//bY/6O0WAElr/usqA1pHyvurdUIT9Y1/Cf0hloAAN8T2m
         AmgQ==
X-Gm-Message-State: AOAM531aFl0BnCXL8ji6T+u47+Shfy10EZv4exY33ynV5i5LXSyZ10Pc
        N1o6OxtoN5q7ZdOJ8hWfOYEz6PSFBWYsKcsrEco=
X-Google-Smtp-Source: ABdhPJwQM+FZoAJ4xW5Hmu43ZHIqd9vfQmb3+/P/UCdHE/G54bG2qPJ7Cv6y8sOv0sS+qK48Q3oN61YGACTdAYXnS4o=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr11367202wrb.132.1605382797310;
 Sat, 14 Nov 2020 11:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca> <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de> <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
In-Reply-To: <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 14 Nov 2020 11:39:45 -0800
Message-ID: <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Christoph Hellwig <hch@lst.de>,
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

On Sat, Nov 14, 2020 at 10:58 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 11/14/20 1:46 PM, Rob Clark wrote:
> > On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
> >>
> >> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> >>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> >>> +             size_t range_start, size_t range_end)
> >>> +{
> >>> +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >>> +     struct device *dev = msm_obj->base.dev->dev;
> >>> +
> >>> +     /* exit early if get_pages() hasn't been called yet */
> >>> +     if (!msm_obj->pages)
> >>> +             return;
> >>> +
> >>> +     /* TODO: sync only the specified range */
> >>> +
> >>> +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> >>> +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> >>> +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
> >>> +     }
> >>> +
> >>> +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
> >>> +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> >>> +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
> >>> +     }
> >>
> >> Splitting this helper from the only caller is rather strange, epecially
> >> with the two unused arguments.  And I think the way this is specified
> >> to take a range, but ignoring it is actively dangerous.  User space will
> >> rely on it syncing everything sooner or later and then you are stuck.
> >> So just define a sync all primitive for now, and if you really need a
> >> range sync and have actually implemented it add a new ioctl for that.
> >
> > We do already have a split of ioctl "layer" which enforces valid ioctl
> > params, etc, and gem (or other) module code which is called by the
> > ioctl func.  So I think it is fine to keep this split here.  (Also, I
> > think at some point there will be a uring type of ioctl alternative
> > which would re-use the same gem func.)
> >
> > But I do agree that the range should be respected or added later..
> > drm_ioctl() dispatch is well prepared for extending ioctls.
> >
> > And I assume there should be some validation that the range is aligned
> > to cache-line?  Or can we flush a partial cache line?
> >
>
> The range is intended to be "sync at least this range", so that
> userspace doesn't have to worry about details like that.
>

I don't think userspace can *not* worry about details like that.
Consider a case where the cpu and gpu are simultaneously accessing
different parts of a buffer (for ex, sub-allocation).  There needs to
be cache-line separation between the two.

BR,
-R
