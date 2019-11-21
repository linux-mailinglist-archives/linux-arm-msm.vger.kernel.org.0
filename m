Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C77D104FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2019 11:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKUKEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 05:04:02 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35788 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfKUKD6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 05:03:58 -0500
Received: by mail-wr1-f67.google.com with SMTP id s5so3634481wrw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2019 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ADQfXV/ZdBmAvhUeKoJdtoj4eaZ6jKMToDVt0g/hiZ0=;
        b=JXZNcIquE1Prcq4dZt2gKgvVllYpusvOv9mcAefjEfxB9FZdGVZu60zbJYUBXvgd4n
         twaU7fSUDfg+h0mMDLx75OhOVfprutSjvQ0CC7yxjFZoC9aw7aASMaInlW6CfHD+NeqK
         H3FJtjQfwV07ZWgONmDDKX65cHZtgbQbkWN40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ADQfXV/ZdBmAvhUeKoJdtoj4eaZ6jKMToDVt0g/hiZ0=;
        b=ilIy7PXDNDGMtwDeKx/mZKGklTtP722Kq9T9fKy8bushZn+Ee9xSqJC7Np2cPymXtz
         XeSlptMPGgQniVsq97qt0AtJ/F5lL/E/d/pesIG//adJG+Pkb/r4jNwovsCjOn8zKiVr
         aeLe/bDJ0kG+2lXbmEJ0nZhlf5ZEUlBa7IhLxGTj66jWp2GrxuOV1P57Ggs6u8dgsDLH
         NWOUl6YOb0bTeDDz9xXpY4a6v5PcSp3KhA7uh7f3Ixe3YEiuozqweIB0TlGipAzr+rO6
         Y9BXD69RFuZreuf4ASm8nX1CMTxg9sJsGoKXUhIHhx1UcRVcapjj9x4K2J+uOjNKvAE7
         59bQ==
X-Gm-Message-State: APjAAAWN9NWtrLi4DaWreaVAxV9dQ01tAdWEqwxtxIiOB+HUR2dtQ/+e
        rsYgZVQYm+u/PhwB2OHyC2TTKw==
X-Google-Smtp-Source: APXvYqydOY6IPhMnVYG21yFQvXKIex0lWaUrqVM9jbk9TfQQq7jLwWaEUHAa0mqRffVzCihyTKeHLA==
X-Received: by 2002:adf:9381:: with SMTP id 1mr9374508wrp.10.1574330635996;
        Thu, 21 Nov 2019 02:03:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id k4sm2484450wmk.26.2019.11.21.02.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 02:03:55 -0800 (PST)
Date:   Thu, 21 Nov 2019 11:03:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm: Don't init ww_mutec acquire ctx before needed
Message-ID: <20191121100353.GD6236@phenom.ffwll.local>
References: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
 <20191120105607.3023-1-daniel.vetter@ffwll.ch>
 <CAF6AEGt9N7EYHFOofU-9pBTs8X+w2h30a_KvTg3BVARbChAWZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGt9N7EYHFOofU-9pBTs8X+w2h30a_KvTg3BVARbChAWZA@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 20, 2019 at 04:24:48PM -0800, Rob Clark wrote:
> On Wed, Nov 20, 2019 at 2:56 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > For locking semantics it really doesn't matter when we grab the
> > ticket. But for lockdep validation it does: the acquire ctx is a fake
> > lockdep. Since other drivers might want to do a full multi-lock dance
> > in their fault-handler, not just lock a single dma_resv. Therefore we
> > must init the acquire_ctx only after we've done all the copy_*_user or
> > anything else that might trigger a pagefault. For msm this means we
> > need to move it past submit_lookup_objects.
> >
> > Aside: Why is msm still using struct_mutex, it seems to be using
> > dma_resv_lock for general buffer state protection?
> >
> > v2:
> > - Add comment to explain why the ww ticket setup is separate (Rob)
> > - Fix up error handling, we need to make sure we don't call
> >   ww_acquire_fini without _init.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> 
> found a few minutes to take this for a spin and seems fine.. t-b && r-b

Thanks for taking this for a spin, entire series applied.
-Daniel

> 
> BR,
> -R
> 
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index fb1fdd7fa3ef..385d4965a8d0 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -54,7 +54,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
> >
> >         INIT_LIST_HEAD(&submit->node);
> >         INIT_LIST_HEAD(&submit->bo_list);
> > -       ww_acquire_init(&submit->ticket, &reservation_ww_class);
> >
> >         return submit;
> >  }
> > @@ -390,8 +389,6 @@ static void submit_cleanup(struct msm_gem_submit *submit)
> >                 list_del_init(&msm_obj->submit_entry);
> >                 drm_gem_object_put(&msm_obj->base);
> >         }
> > -
> > -       ww_acquire_fini(&submit->ticket);
> >  }
> >
> >  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > @@ -408,6 +405,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >         struct msm_ringbuffer *ring;
> >         int out_fence_fd = -1;
> >         struct pid *pid = get_pid(task_pid(current));
> > +       bool has_ww_ticket = false;
> >         unsigned i;
> >         int ret, submitid;
> >         if (!gpu)
> > @@ -489,6 +487,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >         if (ret)
> >                 goto out;
> >
> > +       /* copy_*_user while holding a ww ticket upsets lockdep */
> > +       ww_acquire_init(&submit->ticket, &reservation_ww_class);
> > +       has_ww_ticket = true;
> >         ret = submit_lock_objects(submit);
> >         if (ret)
> >                 goto out;
> > @@ -588,6 +589,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >
> >  out:
> >         submit_cleanup(submit);
> > +       if (has_ww_ticket)
> > +               ww_acquire_fini(&submit->ticket);
> >         if (ret)
> >                 msm_gem_submit_free(submit);
> >  out_unlock:
> > --
> > 2.24.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
