Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC784AEE93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 17:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731786AbfIJPe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 11:34:27 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46493 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbfIJPe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 11:34:26 -0400
Received: by mail-ed1-f65.google.com with SMTP id i8so17479835edn.13;
        Tue, 10 Sep 2019 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b4wnBlpeFgpGxUVqzfbdvP1S+Q+RawN3p7bTgqnZia8=;
        b=tzUouiroRdJjO/r28/634yrQ4C8pWz/+BOZ+mEtUOK3kpyHqIRhDkUnyEQ71dGDzZd
         eV9r1PRFyP8IHgUbl9FqShjbwycRxAB0fwLv2qC7bme4DyOSOsM8HR2u8x2sI4UPumtG
         c0OlWiSyl2uwiL7uTXcNcWtQwoZ4hvX3jgw3VhaUOJjf3FlZgjIN68zIQso9eaGkmtTP
         /3GmXxjh0Fn7jkEanuaNrTfCjI+I3RqMMoKmq7qrrJjrlZg7YmxLdzpWZA4BjA4ivqxL
         s83bDaQOuAHvVXsmXCo9hHqsCcSA1CafKyd4S0M5LZYrxfey+98rQGYF5KXA6PmW3vyX
         foKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4wnBlpeFgpGxUVqzfbdvP1S+Q+RawN3p7bTgqnZia8=;
        b=FJtAhFnmwwmAHI9SNw9mu+kDf7juD7dKi2tHcfZKmx5NjDaZfahCaHs+3nOkh57cNP
         YDxSnH3s9eJ8Z6XfiJmK0nO31yZ12G3d4Sf2VvpD23b031PW69529hPRVyorOA7jklrY
         mxpOp3Oz61dEnUZrNuplQUfipL9zYln50tKM7XKJO+MLHpZo0MoFyxPyeZVN3fHZrUQf
         EO7Zlz+Vt+vNvASeaKzTwlJXQXrJDHlE5Zh8v+8Fselh03R8EJ+Iukvg6+YSrevaezFB
         qEqwIs5aAl5djZKtSaT0OJRmCCMcS1pVUPjAvaVSAS1O1HdjwG8wvAH2mMEH11ixVi3O
         JhYg==
X-Gm-Message-State: APjAAAXcGJJUn77kSh8Exx2ixkwXW266FzDKKurm5byxFKlykduivAtD
        J6Xa9xfPXo63yikLCZ4fOoGSDFKsJ+lObUwu/KY=
X-Google-Smtp-Source: APXvYqyyx6xWTkb16aLchOZtzOWws5iFVpGXm89mtst/lZo1kpZ1sLfKtvPombMjz1ZlKI1NrttKYsabF6z8hwrEYtQ=
X-Received: by 2002:a17:906:a3d5:: with SMTP id ca21mr25922239ejb.258.1568129664829;
 Tue, 10 Sep 2019 08:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190906214409.26677-1-robdclark@gmail.com> <20190906214409.26677-2-robdclark@gmail.com>
 <20190910081415.GB3247@8bytes.org>
In-Reply-To: <20190910081415.GB3247@8bytes.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 10 Sep 2019 08:34:13 -0700
Message-ID: <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu explicitly
To:     Joerg Roedel <joro@8bytes.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 10, 2019 at 1:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Fri, Sep 06, 2019 at 02:44:01PM -0700, Rob Clark wrote:
> > @@ -674,7 +674,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
> >
> >       mutex_lock(&group->mutex);
> >       list_add_tail(&device->list, &group->devices);
> > -     if (group->domain)
> > +     if (group->domain && !(dev->driver && dev->driver->driver_manages_iommu))
>
> Hmm, this code usually runs at enumeration time when no driver is
> attached to the device. Actually it would be pretty dangerous when this
> code runs while a driver is attached to the device. How does that change
> make things work for you?
>

I was seeing this get called via the path driver_probe_device() ->
platform_dma_configure() -> of_dma_configure() -> of_iommu_configure()
-> iommu_probe_device() -> ...

The only cases I was seeing where dev->driver is NULL where a few
places that drivers call of_dma_configure() on their own sub-devices.
But maybe there are some other paths that I did not notice?

BR,
-R
