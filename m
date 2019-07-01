Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5FFB5C441
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 22:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfGAUWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 16:22:39 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43079 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfGAUWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 16:22:39 -0400
Received: by mail-io1-f68.google.com with SMTP id k20so5450061ios.10;
        Mon, 01 Jul 2019 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1GjeEITaALvhm8pAAmaP+3EXBqqOojgJYfM1DzUyl4=;
        b=ljiAZQXjCG4pFHtSRCcPXocbqglD4vhZPuwJC84rX30dPSNf0N3UPo8R08EQtHKzcD
         bPlDY6tg/r4gkkYT8VsXyWWjkfqZBRr7VnuAU82Q3x02rfFkrr+9dhSo+QsdhFaqeAPD
         FEzS5DKZj9LBi8UzkRXTkKcm8mtLHJBWYDDdFuAZU+lxwY5be8vvc2lxXhT4IE+vu0Un
         BNfU7vLcCgzf3Xa7Ztrf3h8T1HKncve6yvVG5RaE50d0YdarMfYu9/X2E4VIx2S8JIFl
         TSQEb4RkZ/ozuP/OJ8bWIz9tmQF53PKa/rJCQ0SC7uwfoMldSqlRWIYp8TrBcDXKXpkK
         dkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1GjeEITaALvhm8pAAmaP+3EXBqqOojgJYfM1DzUyl4=;
        b=W91EkpkGY2rymQij3B2hExV7Bf0QBmenOY6AumliGa2+Qb8J40EqNSbBFVjNwnxNoc
         At80IZaLE8n9zslmroHR/lz3xQJh2XqCr3yymRGEg2d2MJrNO4t+RGhJDBgom+mHKGIT
         vlhn30m8wkxyi/AravbNo/B9qWnznuamMCPRsEF8+816uQuYe4UaUb8k5UeUa520IP6M
         +ewKmkUIQwCvYARWr33i2q5kIuWwNPSG21PqaMMqpmmLPoxL0/5smGdPY71S0/PrMl0w
         j8wasUBC5g+KvA+ulLF6euidmx42W7EJtNk7YNsdWrdQqz7/80HzZwNhBLWBj3nsxSJN
         7DyA==
X-Gm-Message-State: APjAAAX1y/QuZVOOm1bXInzCI3MgV0V7YqCk1Bd7m64UEmQdMOk+RQAA
        uufd4NgXy8YbifgZG6ks2+96s+Z8Ou/3QtJpRC0=
X-Google-Smtp-Source: APXvYqxVBTG47CwHCdrXmA5JNt7wro7euLefJZUOOmQ+NthLv4IjR3SFYlhyAyNGvyaQ7VNb5UxSB7N5f7nMOOlzbGA=
X-Received: by 2002:a6b:901:: with SMTP id t1mr22675024ioi.42.1562012558828;
 Mon, 01 Jul 2019 13:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com> <CAF6AEGu=Pv5mCKA7QDVGPjhFShmD2cfKWNZk26PTQSSQzbzKXA@mail.gmail.com>
In-Reply-To: <CAF6AEGu=Pv5mCKA7QDVGPjhFShmD2cfKWNZk26PTQSSQzbzKXA@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 1 Jul 2019 14:22:27 -0600
Message-ID: <CAOCk7NqvDgUJ6Nr217ftaB5R6i3LCMbdsiEOhrmt9-StPfV5kg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address space
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 1, 2019 at 1:45 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 1, 2019 at 10:39 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > Creating the msm gem address space requires a reference to the dev where
> > the iommu is located.  The driver currently assumes this is the same as
> > the platform device, which breaks when the iommu is outside of the
> > platform device.  Use the drm_device instead, which happens to always have
> > a reference to the proper device.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 4a60f5fca6b0..1347a5223918 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -702,7 +702,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
> >         mdelay(16);
> >
> >         if (config->platform.iommu) {
> > -               aspace = msm_gem_address_space_create(&pdev->dev,
> > +               aspace = msm_gem_address_space_create(dev->dev,
> >                                 config->platform.iommu, "mdp5");
>
> hmm, do you have a tree somewhere with your dt files?  This makes me
> think the display iommu is hooked up somewhere differently compared
> to, say, msm8916.dtsi

I'll post something somewhere and forward it to you.
