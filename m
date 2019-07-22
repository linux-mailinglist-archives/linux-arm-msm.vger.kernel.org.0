Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B237040B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 17:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfGVPlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 11:41:47 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46209 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfGVPlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 11:41:47 -0400
Received: by mail-ed1-f65.google.com with SMTP id d4so41059226edr.13;
        Mon, 22 Jul 2019 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbhi3M6mI+4oCuQkiXeYBwKqa8lehAmY1ApNgOUqhwo=;
        b=oq1L146UMTM5yp1F87M46OMRVNjVPxNYCqBgriKVv6dMDXX08s6uRiySQkE09kcK1A
         Ra2YvaKODVmITKUqtD7D1ZZBRTfaE2EIyiEpJokB2G8dfoqP1hIzdCqNe2owW2cN7JpK
         /zkAUcT1M6a8ckcpVXXe7ckudGM6GLl5YeRMMzlKGUi8Cgv8GgmvLGEpveZ4wCxnc3C4
         GLJFTrJWuI6GKBiuXFR8rfOXC8m6Lg7NcV5ejYFsiYQ+u0UPXpfbJ566t2UX28hlymTM
         STU8X04EdUcw3iu9gaHq2Zbbe4WfrqN3U1tyLEkqb89i0xg7+i4TO2G0kFl8exgLi//U
         0Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbhi3M6mI+4oCuQkiXeYBwKqa8lehAmY1ApNgOUqhwo=;
        b=Yc7j6P8YglB/ovLHphmCVwKpZdsjQKgN3P+ivbpS9g/tcBa8D+9fHsORaiW/bbuN/H
         QEN+nEHbVTJLrULMImPIOxc8dQWWuqIGmvZdnZmNRrPHX8YZ3CSWCHVDpz6mGCzVpMue
         1//W5KQiPGbZtNexAf1OD+kZYht1DpobyUImeM/rfoOcgLSSjCTZf3/F232S9NiTUw1+
         xoUGY1BAR5z350uBDa1pgLOE0YIbS1/tEDKeVCu17VuUkdHhQhGFelCuuyA1xy0F1zWN
         4ltV5xUS3U6ZyQzecDGOq8fkHmgBEX7XQIoUDTSeSOzPPbFsc4aW+GAWVFTx8rEaTSxq
         aofg==
X-Gm-Message-State: APjAAAXKmsEVB++I2lTGRdfpVIbXhQDPrkCdQqL74aYE5CZD/hNOKxxX
        ZzDbbMH+VI7vGujK2oqUyZhNgHlfrMtMXtTqfPQ=
X-Google-Smtp-Source: APXvYqxAGVaQMLs79f0ezsPQ6fjGuLy15ZNhz+Hy27pbz3hAzVegkYLJIcY3Cz+18kjo6Re9A52+O183SrZvHqwPE8o=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr60475682edn.272.1563810105719;
 Mon, 22 Jul 2019 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-2-robdclark@gmail.com> <20190710182844.25032-1-robdclark@gmail.com>
 <20190722142833.GB12009@8bytes.org>
In-Reply-To: <20190722142833.GB12009@8bytes.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 22 Jul 2019 08:41:34 -0700
Message-ID: <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu explicitly
To:     Joerg Roedel <joro@8bytes.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 22, 2019 at 7:28 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Wed, Jul 10, 2019 at 11:28:30AM -0700, Rob Clark wrote:
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -282,7 +282,8 @@ struct device_driver {
> >       struct module           *owner;
> >       const char              *mod_name;      /* used for built-in modules */
> >
> > -     bool suppress_bind_attrs;       /* disables bind/unbind via sysfs */
> > +     bool suppress_bind_attrs:1;     /* disables bind/unbind via sysfs */
> > +     bool driver_manages_iommu:1;    /* driver manages IOMMU explicitly */
>
> Who will set this bit?
>

It is set by the driver:

https://patchwork.freedesktop.org/patch/315291/

(This doesn't really belong in devicetree, since it isn't a
description of the hardware, so the driver is really the only place to
set this.. which is fine because it is about a detail of how the
driver works.)

BR,
-R
