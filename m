Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09492B30B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 21:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgKNUsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 15:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKNUs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 15:48:29 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED689C0613D1;
        Sat, 14 Nov 2020 12:48:28 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id o15so14164169wru.6;
        Sat, 14 Nov 2020 12:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5kxdW0BGmya6+iac4PEbXw/SdeDVo3PvponWz/JT0D0=;
        b=YBzvbEClpZhjQV4W5jQm7JKHQrD1GEqBjbjGovBWVvKh1I7A2YgZtR3k0YGZ2dY+Sh
         YPSU0nRuJmrWZ4sqAuPt7ty6CwPEeVelxR9YPjRZUaHA1JltUCcFNyGszHqEX8R2TIad
         AyK/AIfDybRoc4OL6FwYv6XFfkceWyHvVUPDvWcv3uLZatmgxTwl/qcii78FyXTyjwbD
         iV68Ul9QUA8qQKIz4shJX9YuH0Db07fRudbra129wztYUa4+WDjfeWYwlAhJuX+swdtH
         QkCLTvjcrqtRWB2sggjJ0I2B1WlrNEmeOW8+np5+4OAWFC6c73t/S3udxdUTEKDNCKoh
         inlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5kxdW0BGmya6+iac4PEbXw/SdeDVo3PvponWz/JT0D0=;
        b=mX+16lurJDWB+SEuua0k/BHhaJGKKtLx+DItjvTClwLXTnxSDdL+eVxn5MkaZNWJ8b
         EUxCLmL2E2XYd6ly4HdreJ2B1PT1TuqGPzMdAv/oZ7onSX0oczcqSzMo1SeGUuL/x0jn
         cV2ZTJNtEUGvJs2cXoAwe3PIaTDmVkMdWO6ByfFYC6fTQvz919JTV+YS/4IJsARjD1Ot
         0e4vroZnS6M717jMSc1tHdhzajSk0IqKAtkeFBNrATSSCImug+SCzRju2/rKuftLmp2P
         n/0ywUdmEEBx6gSxwZmuqTUMx3V0bJaxv0uiWKRjUVnnwdXYCHI9yQg1PwePlzHcYhTT
         HQHQ==
X-Gm-Message-State: AOAM532l0jRU4XWKjrTkjG2SaERWEonGR0YSNpzdFZMZuyMCvFMgxeAR
        +J4Fdvrplc/PcwUS8eMAxf/irgli64Xsr2QlfcY=
X-Google-Smtp-Source: ABdhPJwr/t/g2wfdy6h1Iuz8dqJ8uKKA5Jp/prFloAxEH8BmClb9cm6EBJO7JAHC5gZ7svYddzH/IOL7mFlzUktzT4Q=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr11557917wrb.132.1605386907608;
 Sat, 14 Nov 2020 12:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20201114151717.5369-1-jonathan@marek.ca> <20201114151717.5369-5-jonathan@marek.ca>
 <20201114162406.GC24411@lst.de> <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca> <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
In-Reply-To: <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 14 Nov 2020 12:48:15 -0800
Message-ID: <CAF6AEGv7fXGVVWcTcSXF6EGB2LOi_wvQP6h6hcX8yNvAZRDbVg@mail.gmail.com>
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

On Sat, Nov 14, 2020 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 11/14/20 2:39 PM, Rob Clark wrote:
> > On Sat, Nov 14, 2020 at 10:58 AM Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> On 11/14/20 1:46 PM, Rob Clark wrote:
> >>> On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
> >>>>
> >>>> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> >>>>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> >>>>> +             size_t range_start, size_t range_end)
> >>>>> +{
> >>>>> +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >>>>> +     struct device *dev = msm_obj->base.dev->dev;
> >>>>> +
> >>>>> +     /* exit early if get_pages() hasn't been called yet */
> >>>>> +     if (!msm_obj->pages)
> >>>>> +             return;
> >>>>> +
> >>>>> +     /* TODO: sync only the specified range */
> >>>>> +
> >>>>> +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> >>>>> +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> >>>>> +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
> >>>>> +     }
> >>>>> +
> >>>>> +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
> >>>>> +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> >>>>> +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
> >>>>> +     }
> >>>>
> >>>> Splitting this helper from the only caller is rather strange, epecially
> >>>> with the two unused arguments.  And I think the way this is specified
> >>>> to take a range, but ignoring it is actively dangerous.  User space will
> >>>> rely on it syncing everything sooner or later and then you are stuck.
> >>>> So just define a sync all primitive for now, and if you really need a
> >>>> range sync and have actually implemented it add a new ioctl for that.
> >>>
> >>> We do already have a split of ioctl "layer" which enforces valid ioctl
> >>> params, etc, and gem (or other) module code which is called by the
> >>> ioctl func.  So I think it is fine to keep this split here.  (Also, I
> >>> think at some point there will be a uring type of ioctl alternative
> >>> which would re-use the same gem func.)
> >>>
> >>> But I do agree that the range should be respected or added later..
> >>> drm_ioctl() dispatch is well prepared for extending ioctls.
> >>>
> >>> And I assume there should be some validation that the range is aligned
> >>> to cache-line?  Or can we flush a partial cache line?
> >>>
> >>
> >> The range is intended to be "sync at least this range", so that
> >> userspace doesn't have to worry about details like that.
> >>
> >
> > I don't think userspace can *not* worry about details like that.
> > Consider a case where the cpu and gpu are simultaneously accessing
> > different parts of a buffer (for ex, sub-allocation).  There needs to
> > be cache-line separation between the two.
> >
>
> Right.. and it also seems like we can't get away with just
> flushing/invalidating the whole thing.
>
> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
> dma_sync_single_for_cpu() does deal in some way with the partial cache
> line case, although I'm not sure that means we can have a
> nonCoherentAtomSize=1.
>

flush/inv the whole thing could be a useful first step, or at least I
can think of some uses for it.  But if it isn't useful for how vk sees
the world, then maybe we should just implement the range properly from
the get-go.  (And I *think* requiring the range to be aligned to
cacheline boundaries.. it is always easy from a kernel uabi PoV to
loosen restrictions later, than the other way around.)

BR,
-R
