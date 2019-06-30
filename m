Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5725B232
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 00:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfF3WFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 18:05:09 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34077 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfF3WFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 18:05:08 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so19449236edb.1;
        Sun, 30 Jun 2019 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=huwU9KZd7cZQBkiZLk+Dq6NUAeMW1L8FhP5mFVT+0LQ=;
        b=p8vWawq+/OHSShN1FMmHtzpNBricWTtnpm4uHpJJbmX6ir7pwMoM0MGZKzIaqefQv2
         iN7twAwIGt9wP6JkJeEiuwj4iwJ8n7ZYFTomLhx+12kt8ZiGetfKNu3GvX5fN09fnDp7
         ZKvJFYmKUE9M5UHNGvDPiGqtXXun2Og+axtqACxUhNXYA4oa0ZcS/EhSC7w86mYhVuGF
         Qgdv1+xxQQCI9CGGggjlc5N/Do/idnC8TUMChEeOiH0250HcGutdNWuZtJ9WGXWMBZCJ
         rPk+WkMxNRomwrfidqg79aI9xRxiTVKk3a9zT+Be11J0WW+pRaVo8jMQNGPN66CLhBPw
         dkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=huwU9KZd7cZQBkiZLk+Dq6NUAeMW1L8FhP5mFVT+0LQ=;
        b=QSeBA8+v30Bve9aLq7fhxTXsnVo/Nr7aglkwASB26FloNg98McZ+roCuUtolJ8tFLj
         PcKk6ja0inD7t//PfEOPQWe5n+LdD8Ubu7Ft8r0N6yPsendSlrQnnmrPPr2J/PACJ06L
         C3HsryEUrACOkV5Tk9GAy3z6oclppMQsaVAFeFrYTW2z0mdXYGEGBQbLo19GPQpqOZ66
         k2E9x0MRYM5fICeZGZBzToT1mSFpHKbnNTLKtKIujH/ep8NFAa0ALJXR1bz9X8uOSrpa
         jNva6ppljEOYKTz+sPdNTH4nPKfNS2hJ8ci99KG66GvV8TgK0b1dg0zggq7ULI9kQMfT
         j5DQ==
X-Gm-Message-State: APjAAAVFGQ0VU6YZjXVHJSD/oLEUl1GBqBQFsNrLwd4K18j3oHq2sMkl
        yXdgFJu5YRhLdScayh36wEFYvUmuren8AbdXzqYGWzYE1iM=
X-Google-Smtp-Source: APXvYqzG9FAiNJK/XKX97ZRKsT8GEK/0s3mM4cIJpq9VmKivbCdkQuXPhcl8kk1iXAhWeHcA/1R7ZGniwa1OFZB0fRs=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr24969015edn.272.1561932306845;
 Sun, 30 Jun 2019 15:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com> <20190630203614.5290-5-robdclark@gmail.com>
 <20190630211726.GJ7043@pendragon.ideasonboard.com> <CAF6AEGu7XschmqWz_t9xWk_kFQoE=U-KTSB_+k9-SDAYNDdFww@mail.gmail.com>
 <20190630215742.GK7043@pendragon.ideasonboard.com>
In-Reply-To: <20190630215742.GK7043@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 30 Jun 2019 15:04:51 -0700
Message-ID: <CAF6AEGvJ3FoBxu=EhrHJ96nV-60TTiAwkWb0a5Wsauw-_dtjiw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup panel-id
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 30, 2019 at 2:58 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Sun, Jun 30, 2019 at 02:50:59PM -0700, Rob Clark wrote:
> > On Sun, Jun 30, 2019 at 2:17 PM Laurent Pinchart wrote:
> > > On Sun, Jun 30, 2019 at 01:36:08PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Use the drm_of_find_panel_id() helper to decide which endpoint to use
> > > > when looking up panel.  This way we can support devices that have
> > > > multiple possible panels, such as the aarch64 laptops.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > index 2719d9c0864b..56c66a43f1a6 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -790,7 +790,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > > >                             const struct i2c_device_id *id)
> > > >  {
> > > >       struct ti_sn_bridge *pdata;
> > > > -     int ret;
> > > > +     int ret, panel_id;
> > > >
> > > >       if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> > > >               DRM_ERROR("device doesn't support I2C\n");
> > > > @@ -811,7 +811,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > > >
> > > >       pdata->dev = &client->dev;
> > > >
> > > > -     ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
> > > > +     panel_id = drm_of_find_panel_id();
> > > > +     ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, panel_id,
> > > >                                         &pdata->panel, NULL);
> > > >       if (ret) {
> > > >               DRM_ERROR("could not find any panel node\n");
> > >
> > > No, I'm sorry, but that's a no-go. We can't patch every single bridge
> > > driver to support this hack. We need a solution implemented at another
> > > level that will not spread throughout the whole subsystem.
> >
> > it could be possible to make a better helper.. but really there aren't
> > *that* many bridge drivers
> >
> > suggestions ofc welcome, but I think one way or another we are going
> > to need to patch bridges by the time we get to adding ACPI support, so
> > really trivial couple line patches to the handful of bridges we have
> > isn't really something that worries me
>
> It's only one right now as that's the only one you care about, but
> before we'll have time to blink, it will be another one, and another
> one, ... Sorry, that's a no-go for me.

I could ofc add helper call to all the existing bridges.. that seemed
a bit overkill for v1 patchset

BR,
-R
