Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0402C40F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 14:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgKYNOh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 08:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgKYNOh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 08:14:37 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B64FC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 05:14:35 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id q3so2469563edr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=onMXDNDYWmKaoZj2WtIGy0eN/JOcEmuuKU/W/0YX2zQ=;
        b=u8tD/anmgkTl1xRHc1bYPIJlGgZRAxzQoE3YqbkyiMQyEMAyBvg9+rMtYN47S7v+vZ
         YPwLNaxIiMVa7TrPLdftn+DuAwGDNMts71er/8bXEgtPXV8vamIAreaXc2lAgNADEWjS
         YOZMAysobmbSVjB00JzNbU65wIg10hcLDtrMYkc/0hUzP/pc+lim7r/o6Qkv/jELQsAc
         RFyuMcWWc9NarW7NTmD3EcN27Ft6Sp69FYb25RmIa+qP2AxBf299bT8oYDQBqlASZAdm
         oSwy6iJ0sq/2ZUkqV2RWA+VnFLGqP+YlkBZRtK2qaNlprEiUemloUyalHrhFiTwHOw02
         ZjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=onMXDNDYWmKaoZj2WtIGy0eN/JOcEmuuKU/W/0YX2zQ=;
        b=BU/3X5SVVOCP6Jy3HZomESqBbCT7Wf+bqB9yDdI5OSDKnhccvit2RAlr4q8V5v3Y+2
         TsqYGbzoD8YQOxFPA02RAbsDld+rWSTtiWFjODi7IMe1o3c9OL+QaDWm/XzhUeoqDU/+
         aKd4DDHldadmXylLKDnqWyaY+0Fwb5ClquUW6R2eIyBftsNhuL1wONnpUGDjz1Zmgyds
         60Ax+nRSTdaN9fTg6wCn8tAbu5FhoMv+T/Va0tRKVZehg8qfW4H2oikqzK+zQ4ktf2ca
         qikEdJonRyQ8fhUYXxiqMfotmCk3JbiSgBtr65uELjuENZnMX3p7Hzth6XaNHZE3Txlk
         QdqQ==
X-Gm-Message-State: AOAM532Zho3eL9sYOL5Y8pegDohGcvx4C8o9uIQ6ls6KrIHQU2Bhog8q
        4CQuV5o2YElnvlQ2BZh0ptCJ8KsAj57YWsIIfiJZYQ==
X-Google-Smtp-Source: ABdhPJy/y5kzmer5eqzvrVqKbJ/kelq0sBsHc6HmqIhWMFAt8OwfUYFwEDqAqp4r0ZRe1RvH/edl46LlZK0pBezFmxI=
X-Received: by 2002:a50:d90c:: with SMTP id t12mr1561126edj.165.1606310074249;
 Wed, 25 Nov 2020 05:14:34 -0800 (PST)
MIME-Version: 1.0
References: <1606303396-5588-1-git-send-email-loic.poulain@linaro.org> <20201125115757.GA20836@thinkpad>
In-Reply-To: <20201125115757.GA20836@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 25 Nov 2020 14:20:50 +0100
Message-ID: <CAMZdPi98uot2x7vB7Z6ZA4jo8QtDD+bDnGu8PCWgfONP2QEi9Q@mail.gmail.com>
Subject: Re: [PATCH v4] bus: mhi: core: Fix device hierarchy
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Nov 2020 at 12:58, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Nov 25, 2020 at 12:23:16PM +0100, Loic Poulain wrote:
> > This patch fixes the hierarchical structure of MHI devices. Indeed,
> > MHI client devices are directly 'enumerated' from the mhi controller
> > and therefore must be direct descendants/children of their mhi
> > controller device, in accordance with the Linux Device Model.
> >
> > Today both MHI clients and controller devices are at the same level,
> > this patch ensures that MHI controller is parent of its client devices.
> >
> > The hierarc        /* Only destroy virtual devices thats attached to bus */
>         if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
>                 return 0;hy is especially important for power management (safe
> > suspend/resume order). It is also useful for userspace to determine
> > relationship between MHI client devices and controllers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  v2: fix commit message
> >  v3: reword commit message
> >  v4: fix device destroy
> >
> >  drivers/bus/mhi/core/init.c | 10 +++++++++-
> >  drivers/bus/mhi/core/pm.c   |  4 ++--
> >  2 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index 436221c..c7a7354 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
> >       device_initialize(dev);
> >       dev->bus = &mhi_bus_type;
> >       dev->release = mhi_release_device;
> > -     dev->parent = mhi_cntrl->cntrl_dev;
> > +
> > +     if (mhi_cntrl->mhi_dev) {
> > +             /* for MHI client devices, parent is the MHI controller device */
> > +             dev->parent = &mhi_cntrl->mhi_dev->dev;
> > +     } else {
> > +             /* for MHI controller device, parent is the bus device (e.g. pci device) */
> > +             dev->parent = mhi_cntrl->cntrl_dev;
> > +     }
> > +
> >       mhi_dev->mhi_cntrl = mhi_cntrl;
> >       mhi_dev->dev_wake = 0;
> >
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index a671f58..681960c 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -504,7 +504,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
> >       wake_up_all(&mhi_cntrl->state_event);
> >
> >       dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> > -     device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
> > +     device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> >
> >       mutex_lock(&mhi_cntrl->pm_mutex);
> >
> > @@ -637,7 +637,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
> >       wake_up_all(&mhi_cntrl->state_event);
> >
> >       dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> > -     device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
> > +     device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
>
> Hmm. Now I don't think we need below check in mhi_destroy_device():
>
>         /* Only destroy virtual devices thats attached to bus */
>         if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
>                 return 0;
>
> But let's keep it there for sanity.

right.

>
> Have you looked into mhi_debugfs_devices_show()? I guess you need to call
> device_for_each_child() for both "mhi_cntrl->cntrl_dev" and
> "mhi_cntrl->mhi_dev->dev".

Yes, good point, going to address that.

Loic
