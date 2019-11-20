Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F1D10375C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 11:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbfKTKWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 05:22:52 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45951 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfKTKWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 05:22:52 -0500
Received: by mail-oi1-f193.google.com with SMTP id 14so21976859oir.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2019 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BV0Dmq9a5ZLBcDoMXu3gWA5h7O+rvncKss28FAfnKM4=;
        b=beR3qLZQ19xO6sXxpyJf7TjFMp80ju6iNXtGghM0GTSnbqSSZESiiq5NLP+e1jNMfl
         4MYS3uxZ5ihUjBRLLN0IvWIv750tyMIfNb0ZR6DPoe9oRTpF6rZwymLJiEJLF69nqw5A
         aOLlWVwtMUMSD6NLIaxN4IRpG9ctax8aTEh4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BV0Dmq9a5ZLBcDoMXu3gWA5h7O+rvncKss28FAfnKM4=;
        b=cCoQjCzp9SpvgZDR3O/TGri+LNzgq/20vO2D48MEH49iU4xkpUf/AYAMrN5Qtn6J08
         5yyeOpsD0kqkIxUWv6Zl2N8wZTpxYK0H2RQ1Ts+mkOD9xSie2FLS0v3u0wjSrLLLcfL7
         xn/5Si50y8mqR1NA0bBCHjVg2VZeuOAXW9ydnC2zNXwmLVzzIq3zp7caasVUGCJvpzxi
         dWxlCwxWZK7yz8rK1qe+douTbz5piPlHG5YJxmdummBDKkocT0ThaOfZcXjfX8i9dl29
         dQQr+/AKNrxGvL/CQRpG0bnC7KUSPIup0fZ18eKj2B1X/NkXc6yH6hNy1JUtxIVUOVOi
         8aQg==
X-Gm-Message-State: APjAAAXqfUgWa6A+3X2l7VMAgMjDhaPsPVWYW9YJ9FwHvHC//n3FOe7P
        TFsx4xvbQZu0O/AvASxIka2B4nC+7SE0dYJigJbtnw==
X-Google-Smtp-Source: APXvYqxwCzhD+f/VRdNZDgTdikEw/QSOUaezH8+D3+zqS5lACoMkVtmYxZEyV4QBJ0VWUXfyTXQiFmMbEH3LqFhQaiQ=
X-Received: by 2002:aca:b805:: with SMTP id i5mr2170100oif.110.1574245369890;
 Wed, 20 Nov 2019 02:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-4-daniel.vetter@ffwll.ch> <CAF6AEGuPtwFjM12MRBf_X7GUqJBHt+Xb8vKrT+dddic093Ki6g@mail.gmail.com>
In-Reply-To: <CAF6AEGuPtwFjM12MRBf_X7GUqJBHt+Xb8vKrT+dddic093Ki6g@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 20 Nov 2019 11:22:38 +0100
Message-ID: <CAKMK7uGox6G1dhMZr1ykYQFeUHq842CF3R4sKoSiPs6mOs-OPg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Don't init ww_mutec acquire ctx before needed
To:     Rob Clark <robdclark@gmail.com>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 20, 2019 at 3:07 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Nov 19, 2019 at 1:08 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > For locking semantics it really doesn't matter when we grab the
> > ticket. But for lockdep validation it does: the acquire ctx is a fake
> > lockdep. Since other drivers might want to do a full multi-lock dance
> > in their fault-handler, not just lock a single dma_resv. Therefore we
> > must init the acquire_ctx only after we've done all the copy_*_user or
> > anything else that might trigger a pagefault. For msm this means we
> > need to move it past submit_lookup_objects.
>
> seems reasonable.. but maybe a comment would be useful to prevent
> future-me from "cleaning-this-up" back to the way it was

I'll add a comment.

> with that, r-b

Well I spotted a bug for the error handling, I'll need to respin.
-Daniel

>
> >
> > Aside: Why is msm still using struct_mutex, it seems to be using
> > dma_resv_lock for general buffer state protection?
>
> only because I (or anyone else) hasn't had time to revisit the
> struct_mutex usage since we moved to per-object-locks.. the downside,
> I suppose, of kernel generally working ok and this not being a big
> enough fire to bubble up to the top of my todo list
>
> BR,
> -R
>
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index fb1fdd7fa3ef..126b2f62bfe7 100644
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
> > @@ -489,6 +488,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >         if (ret)
> >                 goto out;
> >
> > +       ww_acquire_init(&submit->ticket, &reservation_ww_class);
> >         ret = submit_lock_objects(submit);
> >         if (ret)
> >                 goto out;
> > --
> > 2.24.0
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
