Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABA53B30F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhFXOJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 10:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhFXOJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 10:09:28 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CE1C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:07:08 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id f34so2238256uae.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qA/15TvxyljLeiT6v+8qmN6kWt8A8lTygEXqoXNw+04=;
        b=Rw6WpSNMHTbg23NxwJvuOjaHdtgv0Fj8nxCsBmOYLlr9CLdBH8VOno97w1rjhpK7QS
         fwqIqx9HX6X8tYR/DUbVTec6h1/VI2RngzjSavToO71KaG1mXaNuJKT6sdAS0G2d8VEg
         i8Ybg3BEoJp0gfRJeGyl62WDRO2HONssyTuck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qA/15TvxyljLeiT6v+8qmN6kWt8A8lTygEXqoXNw+04=;
        b=gbaScDQ44ByWbz4o7aoWnc5OpyZHA2VwxcdE+9zg0g83IcMqYA23Q0D2FQuTouImO4
         Ve0ryuoz/noOQLqlyyiZLHSt0lr7FKAeEwF0nHqsCTZQxE9dzUHidKZ4PLOVsXRZNipv
         mgUmXJ+mtiBAWWz/aKU++CLyTTqEUuWUVMNVrmYnZMRiqRq6QB/y3khkHPHkUr+cEPPB
         3XmiulPbG6WYuMLqAAe23+kcbAEuAhSfZddl0k4f+VRSURHWHydMz6UGOHxz02OB8kG3
         +8utQBpM5I2oEdBS6zR2XVJV9Q3bGXDU9CXuq22IK8M7TZshZWRtxDGtkKXC/9RtmzF2
         /+Qw==
X-Gm-Message-State: AOAM533RCW+kDuMoV2Ur9Q2eGzgE5UTEjjBqIlolT1l2vPi7P/PIBiqm
        /p++5/Xi5wb6rJ1zc5SVMBnHmNcumXl80g==
X-Google-Smtp-Source: ABdhPJxwKL8pYcVOAWFpPuvUjUzZbolkyjeCcVCKfIxzumYGKB2yUfkZzWIk/hedUMdkb0OLggHTnw==
X-Received: by 2002:ab0:550d:: with SMTP id t13mr5401799uaa.59.1624543625985;
        Thu, 24 Jun 2021 07:07:05 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id f17sm665478vsp.8.2021.06.24.07.07.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 07:07:05 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id e7so2228018uaj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:07:05 -0700 (PDT)
X-Received: by 2002:a25:bcb:: with SMTP id 194mr5441792ybl.32.1624543265649;
 Thu, 24 Jun 2021 07:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210621235248.2521620-1-dianders@chromium.org>
 <20210621165230.6.Icde6be7601a5939960caf802056c88cd5132eb4e@changeid> <YNSL/r+fOz6KMuwI@kroah.com>
In-Reply-To: <YNSL/r+fOz6KMuwI@kroah.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Jun 2021 07:00:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsdYpgzoC9JvDEjBDqVNKmuz-gOs8oceiuYXs8E680XA@mail.gmail.com>
Message-ID: <CAD=FV=VsdYpgzoC9JvDEjBDqVNKmuz-gOs8oceiuYXs8E680XA@mail.gmail.com>
Subject: Re: [PATCH 6/6] mmc: sdhci-msm: Request non-strict IOMMU mode
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pci@vger.kernel.org, quic_c_gdjako@quicinc.com,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Sonny Rao <sonnyrao@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Rajat Jain <rajatja@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 24, 2021 at 6:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 21, 2021 at 04:52:48PM -0700, Douglas Anderson wrote:
> > IOMMUs can be run in "strict" mode or in "non-strict" mode. The
> > quick-summary difference between the two is that in "strict" mode we
> > wait until everything is flushed out when we unmap DMA memory. In
> > "non-strict" we don't.
> >
> > Using the IOMMU in "strict" mode is more secure/safer but slower
> > because we have to sit and wait for flushes while we're unmapping. To
> > explain a bit why "non-strict" mode is unsafe, let's imagine two
> > examples.
> >
> > An example of "non-strict" being insecure when reading from a device:
> > a) Linux driver maps memory for DMA.
> > b) Linux driver starts DMA on the device.
> > c) Device write to RAM subject to bounds checking done by IOMMU.
> > d) Device finishes writing to RAM and signals transfer is finished.
> > e) Linux driver starts unmapping DMA memory but doesn't flush.
>
> Why doesn't it "flush"?

This is just how the pre-existing "iommu.strict=0" command line parameter works.


> > f) Linux driver validates that the data in memory looks sane and that
> >    accessing it won't cause the driver to, for instance, overflow a
> >    buffer.
> > g) Device takes advantage of knowledge of how the Linux driver works
> >    and sneaks in a modification to the data after the validation but
> >    before the IOMMU unmap flush finishes.
> > h) Device has now caused the Linux driver to access memory it
> >    shouldn't.
>
> So you are now saying we need to not trust hardware?  If so, that's a
> massive switch for how the kernel needs to work right?

This is a pre-existing concept in the kernel and is in fact so
prevalent that there are a bunch of inconsistent ways to configure it
(though it's being made better [1])

* On ARM64, default is strict and you can configure it with iommu.strict

* On AMD, default is non-strict and you can configure it with
amd_iommu=fullflush

* On Intel, default is non-strict and you can configure it with
intel_iommu=strict

...also pre-existing is that the kernel has special cases for
"external" PCI devices where it forces them to strict mode even if the
default is non-strict (like on Intel and AMD). I was pointed
specifically at <http://thunderclap.io/> for an example of why this
was important.


> And what driver does f) and allows g) to happen?  That would be a normal
> bug anyway, why not just fix the driver?

This one would be possible to workaround in the driver by copying the
memory somewhere else, but it violates the DMA model. Specifically
step "e)" above is supposed to mean that the driver is now in full
control of the memory, so it should be perfectly justified in assuming
that nobody else is scribbling on it.


> > An example of "non-strict" being insecure when writing to a device:
> > a) Linux driver writes data intended for the device to RAM.
> > b) Linux driver maps memory for DMA.
> > c) Linux driver starts DMA on the device.
> > d) Device reads from RAM subject to bounds checking done by IOMMU.
> > e) Device finishes reading from RAM and signals transfer is finished.
> > f) Linux driver starts unmapping DMA memory but doesn't flush.
>
> Why does it not flush?
>
> What do you mean by "flush"

"flush" means force / wait for the IOMMU unmap to fully take effect.


> > g) Linux driver frees memory and returns it to the pool.
>
> What pool?

The normal Linux memory pool.


> > h) Memory is allocated for another purpose.
>
> Allocated by what?

Someone else that wanted memory.


> We have memory allocators that write over the data when freed, why not
> just use this if you are concerned about this type of issue?
>
> > i) Device takes advantage of the period of time before IOMMU flush to
> >    read memory that it shouldn't have had access to.
>
> What memory would that be?

Depends on who got it. This could be hard to predict unless a
peripheral was trying to exploit a very specific version of Linux
where maybe it was predictable who got the memory next.


> And if you really care about these issues, are you not able to take the
> "hit" for the flush all the time as that is a hardware thing, not a
> software thing.  Why not just always take advantage of that, no driver
> changes needed?

The whole concept of strict vs. non-strict is definitely not new to my
series and I'm mostly just trying to configure it properly.


> And this isn't going to work, again, because the "pre_probe" isn't going
> to be acceptable, sorry.

Right. As discussed in the cover letter, I'm going to try to solve
this in other ways that doesn't involve pre_probe.

[1] https://lore.kernel.org/linux-iommu/1624016058-189713-1-git-send-email-john.garry@huawei.com/T/#m21bc07b9353b3ba85f2a40557645c2bcc13cbb3e

-Doug
