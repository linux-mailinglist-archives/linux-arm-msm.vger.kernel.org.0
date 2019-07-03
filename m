Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2A55E3CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 14:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfGCMZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 08:25:46 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43064 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfGCMZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 08:25:46 -0400
Received: by mail-ed1-f68.google.com with SMTP id e3so1870849edr.10;
        Wed, 03 Jul 2019 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MPb7Hz/aUpRJZzTZLNZiyzmAnZP9z54WdoZUYMn88X0=;
        b=vHchkMOvsHv8kCbADBZUi1vqLd4RTY+FiPP9Lcmq+0/ksI+sEADt3BL/B6j1XPh4sv
         8mVZ5lV2G5n5tMEJRJFIZ0fo979d1UN6QoxOmHlllEUg3J1Pwy2ex1GT3DhC1CpuQtWl
         2gXnxt80cMG1BqF8rJSpfWYyGXRpHG8QCgnHjyNStOeM3/WYWkFB3oyfCYxA5xm0DUxc
         x9s6+4ojoKtayGxCeER/E4qGN6dWO2A/1tiAUiMgIpdOyxz3m267eY7/dEf651rPsIzO
         edygRg5PthgrTVRS6jqy504BnS7OQUcdBI4bM2kXuffv+e/FTrmLzf/3XoY/PuZrOtVf
         nVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPb7Hz/aUpRJZzTZLNZiyzmAnZP9z54WdoZUYMn88X0=;
        b=WaTyt2AiOLLpx9OGOBXkWzBS2uRUeWXh9GnG9t7ShB4+rjNgxIKbqAfTAr7KGrZ2/6
         dZ91zYkU6vttlH6uth/3JFxmiZdEtDnTpkdLeyf/6JZhweTCgNHj7AGamCI3lQwPWuzi
         5eelBRQo3bDDS+R4YBRPLKrnn8khGRywuo2gkoA8FqTi9FaqJDV67vqX1SwyM5XHASss
         HNVPi2x0v/sThIjp6QGUtrAsm5IoWl+YiS5gzXn8wC2da3YIFZh6QXk235gaflhuQWIX
         wwOP9QAwJ2kxh0yeSe40o70sTmeFyeqz94hmLeX8eJv2c8bwHqIjwIIQYDMpU82xH8rQ
         fHOQ==
X-Gm-Message-State: APjAAAVEs3NyXDflWuablzs55V3eaA63e0DnOCOMyXMr0c6VlZkj0Z9Q
        xdeIc11l49y3NGMdb8AneQH5e/XnXOlGAh15Vk4=
X-Google-Smtp-Source: APXvYqwwqBwoR0MKYgtbC2RmXe+Vq0vZxW7XMvoTuUUUmhoh1kZpu2I3IiFIpogQ8NwcLjzrOgckudH6yN1/qTMZEO8=
X-Received: by 2002:a17:906:3612:: with SMTP id q18mr34803196ejb.278.1562156744041;
 Wed, 03 Jul 2019 05:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com> <20190703040843.GA27383@builder>
In-Reply-To: <20190703040843.GA27383@builder>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 3 Jul 2019 05:25:27 -0700
Message-ID: <CAF6AEGvwMj+R6KbFYbatx8AuF+5mztc7246ocKXfRWnpphv9NA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address space
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 2, 2019 at 9:08 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 01 Jul 10:39 PDT 2019, Jeffrey Hugo wrote:
>
> > Creating the msm gem address space requires a reference to the dev where
> > the iommu is located.  The driver currently assumes this is the same as
> > the platform device, which breaks when the iommu is outside of the
> > platform device.  Use the drm_device instead, which happens to always have
> > a reference to the proper device.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>
> Sorry, but on db820c this patch results in:
>
> [   64.803263] msm_mdp 901000.mdp: [drm:mdp5_kms_init [msm]] *ERROR* failed to attach iommu: -19
>
> Followed by 3 oopses as we're trying to fail the initialization.

yeah, that is kinda what I suspected would happen.  I guess to deal
with how things are hooked up on 8998, perhaps the best thing is to
first try &pdev->dev, and then if that fails try dev->dev

BR,
-R

> Regards,
> Bjorn
>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 4a60f5fca6b0..1347a5223918 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -702,7 +702,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
> >       mdelay(16);
> >
> >       if (config->platform.iommu) {
> > -             aspace = msm_gem_address_space_create(&pdev->dev,
> > +             aspace = msm_gem_address_space_create(dev->dev,
> >                               config->platform.iommu, "mdp5");
> >               if (IS_ERR(aspace)) {
> >                       ret = PTR_ERR(aspace);
> > --
> > 2.17.1
> >
