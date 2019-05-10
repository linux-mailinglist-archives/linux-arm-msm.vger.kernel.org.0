Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F25B51A2ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 20:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfEJSXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 14:23:48 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40526 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfEJSXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 14:23:47 -0400
Received: by mail-ed1-f65.google.com with SMTP id j12so5564277eds.7;
        Fri, 10 May 2019 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dra68sD3A+L9jmTIge40RbJUDi0r64rvVKFCcIo9SWw=;
        b=JU7a3v7RiEPD0VNYuvo2kA58OUV7CQec5Ky0+jiMqZlny9/CBjNNYq4moEr1fX4pk5
         Vl39VkY8/uNJsv3AmfCAB4yL/naqG1CR4VS8IBCruJAiFmJCq4PKyMcGsojx3eOxbB0I
         VGRmjtXGeVK6pCln5OuvJUVLngWjz9mng9/csQqQcVukvSUlw7G3behUihBvp/Q6dYQM
         KpD/fVa/3uGUf3NHOIvyS6PB5ehNdGETjupUhRA6M7U5KJOknptkLUIivQx2ur907mKN
         UkkhhgRONlVmFckixCjsCppo6REXgRk/ORQlUjmFMCPVZ3yvauhqYRex1VQau3q+Te27
         77yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dra68sD3A+L9jmTIge40RbJUDi0r64rvVKFCcIo9SWw=;
        b=CqAfsjfevj83r/B1Q7X9A5XkqI/xerjVvRzKQbUsgy9nxvoH0PLs9FP4XY5sU3cSnR
         LGKfNW27q638C+8zlVYDYlFPcKo+jUXvL20+s1FM3/255TGVj/S5jXRpTFMRWcaJcJEf
         dKERK+rIKVDozK34swMkQDG8kmz3zfWosV7uD3RTopbQoWVAO3qgA5Pf7tJHTEMw0pE0
         GDLfYH5Z7hsFnH6qKrqitBFg6dtbE14IDvwXTZv7od2J+R7mT4EjRTTRnCaa5R54DGfj
         RlCbTpaF5e9tog6l2ZR31yEz+IuzvRgDPeaPlteA6wHhHMbOF8LkShgPkTXvrJ67aKv+
         AACA==
X-Gm-Message-State: APjAAAXo7O+obWNDRQw49M1FpELkWjgo08vMZL0UWt5gAH6WHiDuQ0jJ
        3swgET6VG1an3Z+V9ptvTpb7a2fXSfPe3wlr/oY=
X-Google-Smtp-Source: APXvYqzRQiFqm/l2aMVgEBwFQ5yK/wNMJvVmyhgygOk1zEL5AYR7ciH6/liicBqcTNkP12Ulkw8VgOjDuH6k3s3Qgm4=
X-Received: by 2002:a50:b3a6:: with SMTP id s35mr13324855edd.220.1557512625336;
 Fri, 10 May 2019 11:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20170914194444.32551-1-robdclark@gmail.com> <20170919123038.GF8398@8bytes.org>
 <CAF6AEGuutkqjrWk4jagE=p-NwHgxdiPZjjsaFsfwtczK568j+A@mail.gmail.com>
 <20170922090204.GJ8398@8bytes.org> <32e3ab2c-a996-c805-2a0d-a2e85deb3a50@arm.com>
In-Reply-To: <32e3ab2c-a996-c805-2a0d-a2e85deb3a50@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 10 May 2019 11:23:35 -0700
Message-ID: <CAF6AEGuepdKo1Ob2jW66UhYXOTAqOMc3C-XKsK3Rze1QdLobLw@mail.gmail.com>
Subject: Re: [RFC] iommu: arm-smmu: stall support
To:     Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <Will.Deacon@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 22, 2017 at 2:58 AM Jean-Philippe Brucker
<jean-philippe.brucker@arm.com> wrote:
>
> On 22/09/17 10:02, Joerg Roedel wrote:
> > On Tue, Sep 19, 2017 at 10:23:43AM -0400, Rob Clark wrote:
> >> I would like to decide in the IRQ whether or not to queue work or not,
> >> because when we get a gpu fault, we tend to get 1000's of gpu faults
> >> all at once (and I really only need to handle the first one).  I
> >> suppose that could also be achieved by having a special return value
> >> from the fault handler to say "call me again from a wq"..
> >>
> >> Note that in the drm driver I already have a suitable wq to queue the
> >> work, so it really doesn't buy me anything to have the iommu driver
> >> toss things off to a wq for me.  Might be a different situation for
> >> other drivers (but I guess mostly other drivers are using iommu API
> >> indirectly via dma-mapping?)
> >
> > Okay, so since you are the only user for now, we don't need a
> > work-queue. But I still want the ->resume call-back to be hidden in the
> > iommu code and not be exposed to users.
> >
> > We already have per-domain fault-handlers, so the best solution for now
> > is to call ->resume from report_iommu_fault() when the fault-handler
> > returns a special value.
>
> The problem is that report_iommu_fault is called from IRQ context by the
> SMMU driver, so the device driver callback cannot sleep.
>
> So if the device driver needs to be able to sleep between fault report and
> resume, as I understand Rob needs for writing debugfs, we can either:
>
> * call report_iommu_fault from higher up, in a thread or workqueue.
> * split the fault reporting as this patch proposes. The exact same
>   mechanism is needed for the vSVM work by Intel: in order to inject fault
>   into the guest, they would like to have an atomic notifier registered by
>   VFIO for passing down the Page Request, and a new function in the IOMMU
>   API to resume/complete the fault.
>

So I was thinking about this topic again.. I would still like to get
some sort of async resume so that I can wire up GPU cmdstream/state
logging on iommu fault (without locally resurrecting and rebasing this
patch and drm/msm side changes each time I need to debug iommu
faults)..

And I do still prefer the fault cb in irq (or not requiring it in
wq)..  but on thinking about it, the two ideas aren't entirely
conflicting, ie. add some flags either when we register handler[1], or
they could be handled thru domain_set_attr, like:

 _EXPLICIT_RESUME - iommu API user calls iommu_domain_resume(),
potentialy from wq/thread after fault handler returns
 _HANDLER_SLEEPS  - iommu core handles the wq, and calls ops->resume()
internally

In both cases, from the iommu driver PoV it just implements
iommu_ops::resume().. in first case it is called via iommu user either
from the fault handler or at some point later (ie. wq or thread).

I don't particularly need the _HANDLER_SLEEPS case (unless I can't
convince anyone that iommu_domamin_resume() called from outside iommu
core is a good idea).. so probably I wouldn't wire up the wq plumbing
for the _HANDLER_SLEEPS case unless someone really wanted me to.

Since there are more iommu drivers, than places that register fault
handlers, I like the idea that in either case, from the driver PoV, it
is just implementing the resume callback.

[1] currently I only see a few places where fault handlers are
registered, so changing iommu_set_fault_handler() is really not much
churn

BR,
-R
