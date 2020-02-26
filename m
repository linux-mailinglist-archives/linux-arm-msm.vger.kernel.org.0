Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A80D16F499
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 01:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbgBZA7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 19:59:16 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34000 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729277AbgBZA7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 19:59:16 -0500
Received: by mail-ed1-f66.google.com with SMTP id dm3so820616edb.1;
        Tue, 25 Feb 2020 16:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=41dIRKzCHut5g8ULikn2zx6erU7p8Xh0VLc4jTiVCc4=;
        b=O+TIDjLetEnT2gz+kRGSEfKzJ3gZm54fhVuuw2o9NH/TCdmpc530coe/gSUyy6JkVV
         hp4I4Tt0D4oO6Jq7z3rPlT5qjP0pC2eAqX3fHvscjkk/rSoLXphauA4TQi5N8rUG2RJn
         H9cMp9gTpeGK3EGLpkW15/eCBTfdTp+f7sNiP/2mCMQLmxywtMHas0sD8mQYeCOVCpLg
         MykJsWuqmKNLL23XnKMoLa7+H92C1e7lF0KmHN9ZRr+9Seofo3+cczjalXrRV5jUQLc0
         JQtvE6GOsgSni/HKHXgosx1LXU72/dYi2ptrteciLbu787zgnCQVsatna7aUZhM5ZPcA
         njZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=41dIRKzCHut5g8ULikn2zx6erU7p8Xh0VLc4jTiVCc4=;
        b=BuY4zHWvon4vi0UNgpiJr0cZxdXfPauXkVEgoMa9qiGOTvVJzHIHuRqtMIIfp7HEED
         Eq6EvdbkHoOyvDzjiEcYDOhzkbwiGTQDLpKtDYuPYi96v5aYc7vwtp5aAvLkC9evBJkp
         cktWY5gBnWGzoGGHBiue21IBUI9LHuBGm9OLdD8UY/W4wdBDXqnPN/0Qon3EcYaJfej8
         zfB/phWEhTE06+1oQEOBLqWZ/N2ZHPXmEHSC50dtUxazdnXUXmebKlO7JYQfIZ6jWi00
         9KKUYocZ3Tigj3oJV1j9Zn8EDH9VUE/XiyXMQbBZzVCFyp/bPM80LbeURCoB3Wq+CFOD
         o6xQ==
X-Gm-Message-State: APjAAAUDZwi0W3VZx55S54wWfuHTceBXyc5/swefT/rFUT0l4XpRyn2g
        dlwvprQ5+d8QCLtEGnat6f9CKe9hoe6/PdpNeto=
X-Google-Smtp-Source: APXvYqy+o+spYlkpd4xZ2v0xZdO4bB5nJGwJneHFcbDWmY6rMi3XrscjFYSA8O3XYDcxOfzTeyUYrAaPUgr+F/SUKz4=
X-Received: by 2002:a17:906:5f89:: with SMTP id a9mr1635153eju.267.1582678754601;
 Tue, 25 Feb 2020 16:59:14 -0800 (PST)
MIME-Version: 1.0
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
 <1582223216-23459-5-git-send-email-jcrouse@codeaurora.org> <CALAqxLWc4QQPyh=R6=0uFnLLicTYJ3NMO6QSc_yF31bJ2Z_rkQ@mail.gmail.com>
In-Reply-To: <CALAqxLWc4QQPyh=R6=0uFnLLicTYJ3NMO6QSc_yF31bJ2Z_rkQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 25 Feb 2020 16:59:02 -0800
Message-ID: <CAF6AEGtYvjgoYxsxyu2-juuTsp9mBJUdRRUWAT3doLtpju4UmQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/a6xx: Use the DMA API for GMU memory objects
To:     John Stultz <john.stultz@linaro.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 25, 2020 at 3:54 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Feb 20, 2020 at 10:27 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > The GMU has very few memory allocations and uses a flat memory space so
> > there is no good reason to go out of our way to bypass the DMA APIs which
> > were basically designed for this exact scenario.
> >
> > v2: Pass force_dma false to of_dma_configure to require that the DMA
> > region be set up and return error from of_dma_configure to fail probe.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 112 +++-------------------------------
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   5 +-
> >  2 files changed, 11 insertions(+), 106 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 983afea..c36b38b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> ...
> > -       count = bo->size >> PAGE_SHIFT;
> > +       bo->virt = dma_alloc_attrs(gmu->dev, bo->size, &bo->iova, GFP_KERNEL,
> > +               bo->attrs);
> >
> ...
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > index 2af91ed..31bd1987 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > @@ -13,7 +13,7 @@ struct a6xx_gmu_bo {
> >         void *virt;
> >         size_t size;
> >         u64 iova;
> > -       struct page **pages;
> > +       unsigned long attrs;
> >  };
>
> As a head up, Todd reported that this patch is causing build trouble
> w/ arm32, as the iova needs to be a dma_attr_t.
>
> I've got a patch for the android-mainline tree to fix this, but you
> might want to spin a v3 to address this.
>   https://android-review.googlesource.com/c/kernel/common/+/1243928
>

I guess based on robher's comments on the bindings, there will be a v3..

BR,
-R
