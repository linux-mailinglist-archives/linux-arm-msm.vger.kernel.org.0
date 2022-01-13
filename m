Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35F448D1A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jan 2022 05:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbiAMEZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 23:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiAMEZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 23:25:40 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9293C06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 20:25:40 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id w188so6126794oiw.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 20:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hOJyvOSbThwu+QP4lcC5VRMHJ9Gf10Mr2Em/YOYWYbk=;
        b=AKNXIEa3uoJszAFx/Q8Df9Kg5xa2u6fKenb78GUjwdXWtnCteJh6avAiS8oevT+s+k
         NHaj16xl+Qwpi5gJy++7R7G6iwvQJHH+vGP4Lm+68/0d0ThWDP+DDzM02nwmlHeL6P20
         e75y/SI2FfHqxsUfa+CudWEm56BTNYGveV2+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hOJyvOSbThwu+QP4lcC5VRMHJ9Gf10Mr2Em/YOYWYbk=;
        b=1WOX1mY01xvYwI4OPCafv9b+8CkYDIDtcjSG+LF4bQmFlhpTDc9ZH6Ugr9Nb0DlGRI
         QDWu5EmLxHOtJ6KUJXLjJiHcVQDnlmE0OhJGoeQUfP6CCAO8rZJ3Cu0l9bBZX7HLzukh
         Jeob8fwcgkwjOZy23kD0yUmlIUALm6/0XFNQcloxq2ieB0qL0bXmg6nPm9HDFSCzGHWC
         cXJw+JD1ZRpisVCZhfMT5ofAobKYSmvceDfzfEQWZ4lU78KBRHlZ6iz0i+cegdby7tXK
         OZtkZc/GKkFbdoht+412fPYuzYIN1vM7uLvpIUtVxRWwMXOmXm0W4gqaHE8tK+vMJygZ
         JU/g==
X-Gm-Message-State: AOAM530K5WWFOwy5SChvMCtYm1t2r7Nm4q5InVaarrko4s4nqBZrlsx7
        iOfXyNepiVoDsWjdRbCpNFB89t08lgzce6SCBJwtmw==
X-Google-Smtp-Source: ABdhPJxrvJfe4npB2ZG64Di6xVANLUpa34m0XDfE47xF6cHvLcUVRQzP10HeZhAPB9Nbe7sVFir4+/cMqLM98w7inas=
X-Received: by 2002:aca:a953:: with SMTP id s80mr7557861oie.164.1642047939842;
 Wed, 12 Jan 2022 20:25:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Jan 2022 20:25:39 -0800
MIME-Version: 1.0
In-Reply-To: <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org> <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com> <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 12 Jan 2022 20:25:39 -0800
Message-ID: <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
To:     Yong Wu <yong.wu@mediatek.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>,
        linux-mediatek@lists.infradead.org,
        iommu@lists.linux-foundation.org, youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Yong Wu (2022-01-12 01:09:19)
> On Tue, 2022-01-11 at 16:27 -0800, Stephen Boyd wrote:
> > ---8<---
> > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > index 64ad7478c67a..97f253a41bdf 100644
> > --- a/drivers/base/component.c
> > +++ b/drivers/base/component.c
> > @@ -492,15 +492,30 @@ static struct aggregate_device
> > *__aggregate_find(struct device *parent)
> >       return dev ? to_aggregate_device(dev) : NULL;
> >  }
> >
> > +static DEFINE_MUTEX(aggregate_mutex);
> > +
> >  static int aggregate_driver_register(struct aggregate_driver *adrv)
> >  {
> > -     adrv->driver.bus = &aggregate_bus_type;
> > -     return driver_register(&adrv->driver);
> > +     int ret = 0;
> > +
> > +     mutex_lock(&aggregate_mutex);
> > +     if (!refcount_inc_not_zero(&adrv->count)) {
> > +             adrv->driver.bus = &aggregate_bus_type;
> > +             ret = driver_register(&adrv->driver);
> > +             if (!ret)
> > +                     refcount_inc(&adrv->count);
>
> This should be refcount_set(&adrv->count, 1)?
>
> Otherwise, it will warning like this:

Yeah I'll fix it, thanks.

>
> [    2.654526] ------------[ cut here ]------------
> [    2.655558] refcount_t: addition on 0; use-after-free.
>
> After this patch, the aggregate_driver flow looks ok. But our driver
> still aborts like this:
>
> [    2.721316] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> ...
> [    2.731658] pc : mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> [    2.732434] lr : mtk_smi_larb_resume+0x54/0x98
> ...
> [    2.742457] Call trace:
> [    2.742768]  mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> [    2.743496]  pm_generic_runtime_resume+0x2c/0x48
> [    2.744090]  __genpd_runtime_resume+0x30/0xa8
> [    2.744648]  genpd_runtime_resume+0x94/0x2c8
> [    2.745191]  __rpm_callback+0x44/0x150
> [    2.745669]  rpm_callback+0x6c/0x78
> [    2.746114]  rpm_resume+0x314/0x558
> [    2.746559]  __pm_runtime_resume+0x3c/0x88
> [    2.747080]  pm_runtime_get_suppliers+0x7c/0x110
> [    2.747668]  __driver_probe_device+0x4c/0xe8
> [    2.748212]  driver_probe_device+0x44/0x130
> [    2.748745]  __device_attach_driver+0x98/0xd0
> [    2.749300]  bus_for_each_drv+0x68/0xd0
> [    2.749787]  __device_attach+0xec/0x148
> [    2.750277]  device_attach+0x14/0x20
> [    2.750733]  bus_rescan_devices_helper+0x50/0x90
> [    2.751319]  bus_for_each_dev+0x7c/0xd8
> [    2.751806]  bus_rescan_devices+0x20/0x30
> [    2.752315]  __component_add+0x7c/0xa0
> [    2.752795]  component_add+0x14/0x20
> [    2.753253]  mtk_smi_larb_probe+0xe0/0x120
>
> This is because the device runtime_resume is called before the bind
> operation(In our case this detailed function is mtk_smi_larb_bind).
> The issue doesn't happen without this patchset. I'm not sure the right
> sequence. If we should fix in mediatek driver, the patch could be:

Oh, the runtime PM is moved around with these patches. The aggregate
device is runtime PM enabled before the probe is called, and there are
supplier links made to each component, so each component is runtime
resumed before the aggregate probe function is called. It means that all
the component drivers need to have their resources ready to power on
before their component_bind() callback is made. Thinking more about it
that may be wrong if something from the aggregate device is needed to
fully power on the component. Is that what is happening here?

>
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..288841555067 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -483,8 +483,9 @@ static int __maybe_unused
> mtk_smi_larb_resume(struct device *dev)
>         if (ret < 0)
>                 return ret;
>
> -       /* Configure the basic setting for this larb */
> -       larb_gen->config_port(dev);
> +       /* Configure the basic setting for this larb after it binds
> with iommu */
> +       if (larb->mmu)
> +               larb_gen->config_port(dev);
>
>         return 0;
>  }
>
>
> Another nitpick, the title should be: iommu/mediatek: xxxx
>

Fixed it.
