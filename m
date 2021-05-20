Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5311A38B850
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 22:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236414AbhETUYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 16:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236245AbhETUYu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 16:24:50 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3990AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 13:23:28 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id r8so24502853ybb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MVYvG69dM0fC6VHqsM41A8Q/ztvt7bvyrWxB/84zXpw=;
        b=A6H7F4mJDsj+qJsCnEUjuVaB8RyyVctXtD8OEjFgx4Caknyq5y4GXQWtPArqrNBZvx
         00x7IwQs2lF+CLqDcks5Ukf76T0DSEHGHC2q1XlqJnc/pN0wKDkzbITh6OwuOOcJRXK6
         NI5vll/QrZvokRHTdDIdw0XaPF3coyQxTbSmapQg93cX9LqkJg9pKOemiXcFJRFDzYqf
         GP5E/yBsjPVM+9mUFZl9dHRxuu1NYCvCDr7rh/6mm9ybi4b8npSsKgzYSHrbGZYnxlra
         U/VM2IWY0rdUEvICRxR6xZUp/KxfSfq+k7Vg65Dy1XSeegBUKtJ/J3FWEVIYxah+3CYY
         L5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MVYvG69dM0fC6VHqsM41A8Q/ztvt7bvyrWxB/84zXpw=;
        b=izfhU5rqGPP5vyQhlQFMSbTHSWEzup/xdX5wghE4f9Qcn00vb9MVlPxbfusrM4ywzK
         q53JywRUXdIDJXNn8ydOs1P4J089yMQ3G31i6n70GhA2uNKfOyVYQX9ZV0WtfzeCuQp4
         KDIliB+y1ZN8kzAJu9erZtITtOq+nJ23z2AxDlEs0De/j3DvoyQiGy6gJetFse3yCoBt
         vvqY+6K3yr9x2SjReiqV7E8DLL1E80YwES8RQ1ydz/2GpcCLR8jhuaM42P5xox/N/vIr
         xz5vZhtc/aRyYG72D18uItW29FAowhQA2arSvAyD/NH//O2q/J9KG+s50U5C4IstRU0Q
         Wrnw==
X-Gm-Message-State: AOAM530WF+LmxefNZBhH/V5qAfxQBiCUiyxFXB1N9bxpTTM6xC+Go1sD
        AXVVlOZSzMHU/VlWVQ96C59M13bbEBh6KfpU7GJDjQ==
X-Google-Smtp-Source: ABdhPJwqDvRHLda2COB+ayK+YS4pv2lYnwtWyCrePqkFPUARyDA8/lJFmO/4FGC9m8jWuLHZjcHB5N4s1GVhyCasHhQ=
X-Received: by 2002:a25:3f47:: with SMTP id m68mr9474846yba.228.1621542207016;
 Thu, 20 May 2021 13:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210520002519.3538432-1-swboyd@chromium.org> <20210520002519.3538432-8-swboyd@chromium.org>
 <YKa/fEuVqHhV9CPC@phenom.ffwll.local>
In-Reply-To: <YKa/fEuVqHhV9CPC@phenom.ffwll.local>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 20 May 2021 13:22:51 -0700
Message-ID: <CAGETcx8=Be4HbgEnpXJOU_PBVsV3cud7EJpOcTRv0SKZgSUjrw@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/msm: Migrate to aggregate driver
To:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 20, 2021 at 12:58 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, May 19, 2021 at 05:25:19PM -0700, Stephen Boyd wrote:
> > The device lists are poorly ordered when the component device code is
> > used. This is because component_master_add_with_match() returns 0
> > regardless of component devices calling component_add() first. It can
> > really only fail if an allocation fails, in which case everything is
> > going bad and we're out of memory. The driver that registers the
> > aggregate driver, can succeed at probe and put the attached device on
> > the DPM lists before any of the component devices are probed and put on
> > the lists.
> >
> > Within the component device framework this usually isn't that bad
> > because the real driver work is done at bind time via
> > component{,master}_ops::bind(). It becomes a problem when the driver
> > core, or host driver, wants to operate on the component device outside
> > of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> > driver core doesn't understand the relationship between the host device
> > and the component devices and could possibly try to operate on component
> > devices when they're already removed from the system or shut down.
> >
> > Normally, device links or probe defer would reorder the lists and put
> > devices that depend on other devices in the lists at the correct
> > location, but with component devices this doesn't happen because this
> > information isn't expressed anywhere. Drivers simply succeed at
> > registering their component or the aggregate driver with the component
> > framework and wait for their bind() callback to be called once the other
> > components are ready. In summary, the drivers that make up the aggregate
> > driver can probe in any order.
> >
> > This ordering problem becomes fairly obvious when shutting down the
> > device with a DSI controller connected to a DSI bridge that is
> > controlled via i2c. In this case, the msm display driver wants to tear
> > down the display pipeline on shutdown via msm_pdev_shutdown() by calling
> > drm_atomic_helper_shutdown(), and it can't do that unless the whole
> > display chain is still probed and active in the system. When a display
> > bridge is on i2c, the i2c device for the bridge will be created whenever
> > the i2c controller probes, which could be before or after the msm
> > display driver probes. If the i2c controller probes after the display
> > driver, then the i2c controller will be shutdown before the display
> > controller during system wide shutdown and thus i2c transactions will
> > stop working before the display pipeline is shut down. This means we'll
> > have the display bridge trying to access an i2c bus that's shut down
> > because drm_atomic_helper_shutdown() is trying to disable the bridge
> > after the bridge is off.
> >
> > The solution is to make the aggregate driver into a real struct driver
> > that is bound to a device when the other component devices have all
> > probed. Now that the component driver code is a proper bus, we can
> > simply register an aggregate driver with that bus via
> > component_aggregate_register() and then attach the shutdown hook to that
> > driver to be sure that the shutdown for the display pipeline is called
> > before any of the component device driver shutdown hooks are called.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > As stated in the cover letter, this isn't perfect but it still works. I
> > get a warning from runtime PM that the parent device (e00000.mdss) is
> > not runtime PM enabled but the child device (the aggregate device) is
> > being enabled by the bus logic. I need to move around the place that the
> > parent device is runtime PM enabled and probably keep it powered up
> > during the entire time that the driver is probed until the aggregate
> > driver probes.
> >
> >  drivers/gpu/drm/msm/msm_drv.c | 47 +++++++++++++++++++----------------
> >  1 file changed, 26 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index e1104d2454e2..0c64e6a2ce25 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1265,19 +1265,35 @@ static int add_gpu_components(struct device *dev,
> >       return 0;
> >  }
> >
> > -static int msm_drm_bind(struct device *dev)
> > +static int msm_drm_bind(struct aggregate_device *adev)
> >  {
> > -     return msm_drm_init(dev, &msm_driver);
> > +     return msm_drm_init(adev->dev.parent, &msm_driver);
> >  }
> >
> > -static void msm_drm_unbind(struct device *dev)
> > +static void msm_drm_unbind(struct aggregate_device *adev)
> >  {
> > -     msm_drm_uninit(dev);
> > +     msm_drm_uninit(adev->dev.parent);
> > +}
> > +
> > +static void msm_drm_shutdown(struct aggregate_device *adev)
> > +{
> > +     struct drm_device *drm = platform_get_drvdata(to_platform_device(adev->dev.parent));
> > +     struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> > +
> > +     if (!priv || !priv->kms)
> > +             return;
> > +
> > +     drm_atomic_helper_shutdown(drm);
> >  }
> >
> > -static const struct component_master_ops msm_drm_ops = {
> > -     .bind = msm_drm_bind,
> > -     .unbind = msm_drm_unbind,
> > +static struct aggregate_driver msm_drm_aggregate_driver = {
> > +     .probe = msm_drm_bind,
> > +     .remove = msm_drm_unbind,
> > +     .shutdown = msm_drm_shutdown,
> > +     .driver = {
> > +             .name   = "msm_drm",
> > +             .owner  = THIS_MODULE,
> > +     },
> >  };
> >
> >  /*
> > @@ -1306,7 +1322,8 @@ static int msm_pdev_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto fail;
> >
> > -     ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
> > +     msm_drm_aggregate_driver.match = match;
>
> This is a bit awkward design, because it means the driver struct can't be
> made const, and it will blow up when you have multiple instance of the
> same driver. I think the match should stay as part of the register
> function call, and be stored in the aggregate_device struct somewhere.
>
> Otherwise I think this looks really solid and fixes your issue properly.
> Obviously needs careful review from Greg KH for the device model side of
> things, and from Rafael Wysocki for pm side.
>
> Bunch of thoughts from a very cursory reading:
>
> - I think it'd be good if we pass the aggregate_device to all components
>   when we bind them, plus the void * parameter just to make this less
>   disruptive. Even more device model goodies.
>
> - Maybe splatter a pile of sysfs links around so that this all becomes
>   visible? Could be interesting for debugging ordering issues. Just an
>   idea, feel free to entirely ignore.

Device links give this for free too! You can check what components
make up a device and their state too.

-Saravana

>
> - Needs solid kerneldoc for everything exposed to drivers and good
>   overview DOC:
>
> - Needs deprecation warnings in the kerneldoc for all the
>   component_master_* and if feasible with a mechanical conversion,
>   converting existing users. I'd like to not be stuck with the old model
>   forever, plus this will give a pile more people to review this code
>   here.
>
> Anyway the name changes in probe and remove hooks below are already worth
> this on their own imo. That's why I'd like to see them in all drivers.
>
> Cheers, Daniel
>
> > +     ret = component_aggregate_register(&pdev->dev, &msm_drm_aggregate_driver);
> >       if (ret)
> >               goto fail;
> >
> > @@ -1319,23 +1336,12 @@ static int msm_pdev_probe(struct platform_device *pdev)
> >
> >  static int msm_pdev_remove(struct platform_device *pdev)
> >  {
> > -     component_master_del(&pdev->dev, &msm_drm_ops);
> > +     component_aggregate_unregister(&pdev->dev, &msm_drm_aggregate_driver);
> >       of_platform_depopulate(&pdev->dev);
> >
> >       return 0;
> >  }
> >
> > -static void msm_pdev_shutdown(struct platform_device *pdev)
> > -{
> > -     struct drm_device *drm = platform_get_drvdata(pdev);
> > -     struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
> > -
> > -     if (!priv || !priv->kms)
> > -             return;
> > -
> > -     drm_atomic_helper_shutdown(drm);
> > -}
> > -
> >  static const struct of_device_id dt_match[] = {
> >       { .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
> >       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> > @@ -1351,7 +1357,6 @@ MODULE_DEVICE_TABLE(of, dt_match);
> >  static struct platform_driver msm_platform_driver = {
> >       .probe      = msm_pdev_probe,
> >       .remove     = msm_pdev_remove,
> > -     .shutdown   = msm_pdev_shutdown,
> >       .driver     = {
> >               .name   = "msm",
> >               .of_match_table = dt_match,
> > --
> > https://chromeos.dev
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
