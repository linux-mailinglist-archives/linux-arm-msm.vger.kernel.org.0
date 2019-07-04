Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B9C5F95B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 15:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbfGDNvm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 09:51:42 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42581 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 09:51:41 -0400
Received: by mail-ed1-f66.google.com with SMTP id z25so5479390edq.9;
        Thu, 04 Jul 2019 06:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B2NJUH3gYGgBtbx3WN1Ity0pDWugJQ7jF9R1ADUX4lk=;
        b=hmowFyFGkwXbEFC/kyfNcBrt9V9cHjiQIm+Z0EQg+YQlW5rfQRBhO6IWD/BOPARcU8
         ejkMVH9q8Bv/mYnS9q+JYZEaMW6sagrnojzOC/UCdqT3UYZIjmJv7Ok7r+uMy0DWvY2q
         G5LjM3qwC79ZEsjXxJ0NSXeUDTWElwdMq1sg4TDlJPFAn7vz9L3Kwr5DLPndWA2aCO4w
         IB/oKVx3QJxAdG6Tq411VPBtbkIiFTSiT3hkWex2/NgQhoJVAqWD0dH+LHbaf/Tbrcbx
         1M15JCpoSLDBP5ASs7mwSbbI91QiAFOyTYcOBf7okxvzYFcPQesKfXn0kM/zjR+Jzwwq
         DICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B2NJUH3gYGgBtbx3WN1Ity0pDWugJQ7jF9R1ADUX4lk=;
        b=dCr6fzGm9rML/HyST07z3XMwPl0a/itl5n3d7VL/8hDQ3c5dy8suykniEDIaUhjXPI
         kwjrZpqm4zW1BGMzzGPmGmN+5tPivLGCzxRSSY8N4aZ+Ptcn5I1b+AQVFSPYog6XTks9
         e8knkUib2mImr5JxDHuRsBCQEl8z2ReX8opXaXFD5vWDzVeyHzviJkrQXxHC1ZOZTyFx
         KATzBgzDgDtAri7/x9XmkQSr7+mC1QVLsvFc2EZWejNB8TqpDX1AWOl6MrdE2DH/Fsu6
         KidQ8L9/Sv487vCPhMGyVb0FBvSdNOjT2NIIVi5To8sDH5phQ3WktKXq6r+J3ZOsgb0d
         EQuQ==
X-Gm-Message-State: APjAAAV5vhLAnL1pT9Xq6WvSA2s2XrKDk4ITGbbvQoeg6tKdUpdsujvX
        LF3MEMfduCuGK7LIi2rmItywA03dPrv22238i9Y=
X-Google-Smtp-Source: APXvYqy0BJY/7zHhJ8fIDLe2X+6WEGO81pJJSvAlHI679eDU3T2nzWxvLXnNB4Rdv1E6hpJcX38qgxrxWALFF2nDlLo=
X-Received: by 2002:a17:906:6802:: with SMTP id k2mr14814143ejr.174.1562248299953;
 Thu, 04 Jul 2019 06:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-1-robdclark@gmail.com> <20190702202631.32148-2-robdclark@gmail.com>
 <20190704082001.GD6546@8bytes.org>
In-Reply-To: <20190704082001.GD6546@8bytes.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 4 Jul 2019 06:51:23 -0700
Message-ID: <CAF6AEGtjMqoFprY+r6zwUxxpm9iFfN-n-uNad3w9vxOCcTrQJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu: add support for drivers that manage iommu explicitly
To:     Joerg Roedel <joro@8bytes.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joe Perches <joe@perches.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 4, 2019 at 1:20 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> Hi Rob,
>
> On Tue, Jul 02, 2019 at 01:26:18PM -0700, Rob Clark wrote:
> > 1) In some cases the bootloader takes the iommu out of bypass and
> >    enables the display.  This is in particular a problem on the aarch64
> >    laptops that exist these days, and modern snapdragon android devices.
> >    (Older devices also enabled the display in bootloader but did not
> >    take the iommu out of bypass.)  Attaching a DMA or IDENTITY domain
> >    while scanout is active, before the driver has a chance to intervene,
> >    makes things go *boom*
>
> Just to make sure I get this right: The bootloader inializes the SMMU
> and creates non-identity mappings for the GPU? And when the SMMU driver
> in Linux takes over this breaks display output.

correct

> > +     /*
> > +      * If driver is going to manage iommu directly, then avoid
> > +      * attaching any non driver managed domain.  There could
> > +      * be already active dma underway (ie. scanout in case of
> > +      * bootloader enabled display), and interfering with that
> > +      * will make things go *boom*
> > +      */
> > +     if ((domain->type != IOMMU_DOMAIN_UNMANAGED) &&
> > +         dev->driver && dev->driver->driver_manages_iommu)
> > +             return 0;
> > +
>
> When the default domain is attached, there is usually no driver attached
> yet. I think this needs to be communicated by the firmware to Linux and
> the code should check against that.

At least for the OF case, it happens in the of_dma_configure() which
happens from really_probe(), so there is normally a driver.  There are
a few exceptional cases, where drivers call of_dma_configure() on
their own sub-device without a driver attached (hence the need to
check if dev->driver is NULL).

I'm also interested in the ACPI case eventually... the aarch64
"windows" laptops do have ACPI.  But for now we are booting with DT
since there is quite a lot of work before we get to point of using
ACPI.  (In particular, under windows, device power management is done
thru a Platform Extension  Plugin (PEP), but so far linux has no such
mechanism.)

We really don't have control of the firmware.  But when arm-smmu is
probed it can read back the hw state and figure out what is going on
(with an RFC series[1] from Bjorn which was posted earlier), so we
don't really need to depend on the firmware.

> > -     bool suppress_bind_attrs;       /* disables bind/unbind via sysfs */
> > +     bool suppress_bind_attrs:1;     /* disables bind/unbind via sysfs */
> > +     bool driver_manages_iommu:1;    /* driver manages IOMMU explicitly */
>
> How does this field get set?


It is set in the driver in the second patch[2] in this series.

BR,
-R

[1] https://www.spinics.net/lists/arm-kernel/msg732246.html
[2] https://patchwork.freedesktop.org/patch/315291/
