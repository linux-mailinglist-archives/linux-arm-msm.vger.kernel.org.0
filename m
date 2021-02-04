Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1C430F603
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 16:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237055AbhBDPTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 10:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237235AbhBDPSl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:18:41 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7E8C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 07:18:00 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id m13so3911684wro.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=lpfJPe/1tU+7DzTf4KYc1pV9RSxza5H3pS4oizaxjuc=;
        b=HcCeGBGJsMKx9yLKPrbfI+qpmPRZoIkJQeDpi0L9B/qg48Sp9HqgwH4gNJpK0bECyq
         zk+eFwNrB0sB4xpAcFmrm++/3Fk1dfCl0mOyOPMG4vdT1nynBruqqtQCIzsMGQP14+aN
         fpa6ojnGDSvQaNthY/dZXaE3//+3Ry3GIwJpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=lpfJPe/1tU+7DzTf4KYc1pV9RSxza5H3pS4oizaxjuc=;
        b=r8vf+4KZymfFGLG9aZYc0+uF2WrP9aJ6f7MDmggtwpFsXK9L1C+IAEGzKu3uNaYlQU
         QcdsCukz6IhF4O5dxbartrVVsSdU2+6srN59DqAwfYG2WnrVpAxQk/PmteUvZWm8QQjG
         DOQkE29x1nxtblUg7e6O13L9D1cswjMSpjPah4Qyevmhj3dM1pVDvDX4z8TZdGCaTq+k
         CHlfDxBrQjmiZWyJlj+JwKpPM4CY8kjMyQ93dU8GfBQRxCuHodERfbuoUd5PEkMuKbF3
         3Y/Ij5IwKAjcYtrXN7huq7CBq6J4H3wrt2z1gaIpRwtmMm5tW4OEJKGhB2Tpj1IHBkQ0
         iMtg==
X-Gm-Message-State: AOAM531PyotPTcIqGNu9DoOdKMLD6nYgjhDf9dOCdU6qNXOKuSvwG32n
        v10V5vP/LveDpMGLeNCIFmPjBg==
X-Google-Smtp-Source: ABdhPJyBIQIVsMcklYb+yXnw0qimDfJH83/YxKcR6iv94o3WNC66b1hbf14zmpSAbgwo++Gvnf8wLA==
X-Received: by 2002:adf:dd45:: with SMTP id u5mr9836389wrm.392.1612451879310;
        Thu, 04 Feb 2021 07:17:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w15sm8097023wrp.15.2021.02.04.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:17:58 -0800 (PST)
Date:   Thu, 4 Feb 2021 16:17:56 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
Message-ID: <YBwQJPepkIS39Grc@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20210125234901.2730699-1-swboyd@chromium.org>
 <YBlz8Go2DseRWuOa@phenom.ffwll.local>
 <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
 <YBp2h2cVXrF6lBno@phenom.ffwll.local>
 <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
 <161238950899.76967.16385691346035591773@swboyd.mtv.corp.google.com>
 <CAF6AEGtFpjpYoY_iu8F2z-RMJ=0+tBYo-akKJ1JbgKagBuQWtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtFpjpYoY_iu8F2z-RMJ=0+tBYo-akKJ1JbgKagBuQWtA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 03, 2021 at 02:11:09PM -0800, Rob Clark wrote:
> On Wed, Feb 3, 2021 at 1:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Rob Clark (2021-02-03 09:29:09)
> > > On Wed, Feb 3, 2021 at 2:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Tue, Feb 02, 2021 at 08:51:25AM -0800, Rob Clark wrote:
> > > > > On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > > > > > > This is because lockdep thinks all the locks taken in lock_crtcs() are
> > > > > > > the same lock, when they actually aren't. That's because we call
> > > > > > > mutex_init() in msm_kms_init() and that assigns on static key for every
> > > > > > > lock initialized in this loop. Let's allocate a dynamic number of
> > > > > > > lock_class_keys and assign them to each lock so that lockdep can figure
> > > > > > > out an AA deadlock isn't possible here.
> > > > > > >
> > > > > > > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> > > > > > > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > > > > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > > > >
> > > > > > This smells like throwing more bad after initial bad code ...
> > > > > >
> > > > > > First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> > > >
> > > > Some technical on the patch itself: I think you want
> > > > mutex_lock_nested(crtc->lock, drm_crtc_index(crtc)), not your own locking
> > > > classes hand-rolled. It's defacto the same, but much more obviously
> > > > correct since self-documenting.
> > >
> > > hmm, yeah, that is a bit cleaner.. but this patch is already on
> > > msm-next, maybe I'll add a patch on top to change it
> >
> > How many CRTCs are there? The subclass number tops out at 8, per
> > MAX_LOCKDEP_SUBCLASSES so if we have more than that many bits possible
> > then it will fail.

Hm good point, tbh the mutex_lock_nested annotations isn't super awesome
either, it would be kinda neat if we could put that annotation into
mutex_lock_init fairly statically (and at that point we could allos resize
the array fairly easily I think at runtime).

The nice thing with the nesting index is just that it makes it a bit more
obvious that there's a static nesting going on and why it's ok.
-Daniel

> conveniently MAX_CRTCS is 8.. realistically I don't *think* you'd ever
> see more than 2 or 3
> 
> BR,
> -R
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
