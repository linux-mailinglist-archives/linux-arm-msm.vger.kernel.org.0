Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2F53B09E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 18:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhFVQIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 12:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFVQIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 12:08:36 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E64C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 09:06:20 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id bl4so4940006qkb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 09:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=27TVSpBBxDt2V9AC2sSKfX2OLzeZI7qCt0FynkFE4h0=;
        b=Ynk7wRsFyvpT95XM0xfR8pPSpaKhc1aGG9sYY9vD7q+6CkrKHU8tOKYrBk2Q7Mp6fp
         s+4/Zq5HmwR0VVKGBrsD6IR7wLEr/+QSn8/UfoMPBQ8Ntd0mFmKDAI7KWYZWyagDWtNr
         yMdORTYYlNaLpAKRj+yBSDhNYdhBiorvwkJUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=27TVSpBBxDt2V9AC2sSKfX2OLzeZI7qCt0FynkFE4h0=;
        b=eZBoL8nke2OS6m9eNXkG466d2y+IvSkQr6vgFfCKr6vtPt/ple+0NKWzlPOCZAZ4RR
         He223Q9lReqcD7wVvFyQKsRecAJldvAJ5LQ1wHBYo9ZzBc7UeS1IHzUMAUAZoJAhyou2
         cep10GfU+IM0voBRLquWJSI57Sru1YwJJvrvrqKKWNo1zKHp+KvFyxaEcde7Bt5HZZhf
         R2I57kWU08W1Xs/Cf9oGrOi33PUTgjTQWwi3uKWXhIcoX6TvpDO7FBaucHhQL5VgEjCp
         kTAXI4aA7/1YBBjl7XOTjM7WQQ76Dyrhy0Dfnh6Bj+k76aMxMEXjO66UcAWnah+Ayuht
         6mnw==
X-Gm-Message-State: AOAM530kNuWK5/q1VHH1Ysd3eK6nSTPsq3PSDMZo23bKY5K8l7Y+FNbB
        cPQRZoDIrKT4mS1Cnhm2zdFqaT2tVtd9dQ==
X-Google-Smtp-Source: ABdhPJzf7JlWi5+lMnCY8oFVkthq+gMdLIO9hgsGrI8SDy+wE5zIhwmzCkyepVmpKiHkoSFcgrawtg==
X-Received: by 2002:a37:a248:: with SMTP id l69mr5095411qke.394.1624377979094;
        Tue, 22 Jun 2021 09:06:19 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id h17sm1855913qtk.23.2021.06.22.09.06.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 09:06:17 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id f70so40743099qke.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 09:06:15 -0700 (PDT)
X-Received: by 2002:a25:2405:: with SMTP id k5mr5576344ybk.405.1624377975055;
 Tue, 22 Jun 2021 09:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210621235248.2521620-1-dianders@chromium.org> <067dd86d-da7f-ac83-6ce6-b8fd5aba0b6f@arm.com>
In-Reply-To: <067dd86d-da7f-ac83-6ce6-b8fd5aba0b6f@arm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 22 Jun 2021 09:06:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vg7kqhgxZppHXwMPMc0xATZ+MqbrXx-FB0eg7pHhNE8w@mail.gmail.com>
Message-ID: <CAD=FV=Vg7kqhgxZppHXwMPMc0xATZ+MqbrXx-FB0eg7pHhNE8w@mail.gmail.com>
Subject: Re: [PATCH 0/6] iommu: Enable devices to request non-strict DMA,
 starting with QCom SD/MMC
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
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
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 22, 2021 at 4:35 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Hi Doug,
>
> On 2021-06-22 00:52, Douglas Anderson wrote:
> >
> > This patch attempts to put forward a proposal for enabling non-strict
> > DMA on a device-by-device basis. The patch series requests non-strict
> > DMA for the Qualcomm SDHCI controller as a first device to enable,
> > getting a nice bump in performance with what's believed to be a very
> > small drop in security / safety (see the patch for the full argument).
> >
> > As part of this patch series I am end up slightly cleaning up some of
> > the interactions between the PCI subsystem and the IOMMU subsystem but
> > I don't go all the way to fully remove all the tentacles. Specifically
> > this patch series only concerns itself with a single aspect: strict
> > vs. non-strict mode for the IOMMU. I'm hoping that this will be easier
> > to talk about / reason about for more subsystems compared to overall
> > deciding what it means for a device to be "external" or "untrusted".
> >
> > If something like this patch series ends up being landable, it will
> > undoubtedly need coordination between many maintainers to land. I
> > believe it's fully bisectable but later patches in the series
> > definitely depend on earlier ones. Sorry for the long CC list. :(
>
> Unfortunately, this doesn't work. In normal operation, the default
> domains should be established long before individual drivers are even
> loaded (if they are modules), let alone anywhere near probing. The fact
> that iommu_probe_device() sometimes gets called far too late off the
> back of driver probe is an unfortunate artefact of the original
> probe-deferral scheme, and causes other problems like potentially
> malformed groups - I've been forming a plan to fix that for a while now,
> so I for one really can't condone anything trying to rely on it.
> Non-deterministic behaviour based on driver probe order for multi-device
> groups is part of the existing problem, and your proposal seems equally
> vulnerable to that too.

Doh! :( I definitely can't say I understand the iommu subsystem
amazingly well. It was working for me, but I could believe that I was
somehow violating a rule somewhere.

I'm having a bit of a hard time understanding where the problem is
though. Is there any chance that you missed the part of my series
where I introduced a "pre_probe" step? Specifically, I see this:

* really_probe() is called w/ a driver and a device.
* -> calls dev->bus->dma_configure() w/ a "struct device *"
* -> eventually calls iommu_probe_device() w/ the device.
* -> calls iommu_alloc_default_domain() w/ the device
* -> calls iommu_group_alloc_default_domain()
* -> always allocates a new domain

...so we always have a "struct device" when a domain is allocated if
that domain is going to be associated with a device.

I will agree that iommu_probe_device() is called before the driver
probe, but unless I missed something it's after the device driver is
loaded.  ...and assuming something like patch #1 in this series looks
OK then iommu_probe_device() will be called after "pre_probe".

So assuming I'm not missing something, I'm not actually relying the
IOMMU getting init off the back of driver probe.


> FWIW we already have a go-faster knob for people who want to tweak the
> security/performance compromise for specific devices, namely the sysfs
> interface for changing a group's domain type before binding the relevant
> driver(s). Is that something you could use in your application, say from
> an initramfs script?

We've never had an initramfs script in Chrome OS. I don't know all the
history of why (I'm trying to check), but I'm nearly certain it was a
conscious decision. Probably it has to do with the fact that we're not
trying to build a generic distribution where a single boot source can
boot a huge variety of hardware. We generally have one kernel for a
class of devices. I believe avoiding the initramfs just keeps things
simpler.

I think trying to revamp Chrome OS to switch to an initramfs type
system would be a pretty big undertaking since (as I understand it)
you can't just run a little command and then return to the normal boot
flow. Once you switch to initramfs you're committing to finding /
setting up the rootfs yourself and on Chrome OS I believe that means a
whole bunch of dm-verity work.


...so probably the initramfs is a no-go for me, but I'm still crossing
my fingers that the pre_probe() might be legit if you take a second
look at it?

-Doug
