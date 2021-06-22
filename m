Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B663B0DE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 21:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhFVT6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 15:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbhFVT6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 15:58:43 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C59C061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 12:56:27 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d9so360301qtx.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N93FQS54KNMw/RWZd3sdd1/c5zsgaKSRIH5cGtG3wLQ=;
        b=nKSDq/oCJcM6qZHdPsZIzNgBCyluw3srCscilwpHd/8GiydqZY43q/T3vv2Nn2jbKD
         jegHEFKq7oKJUZmrnbp2L6fkE3vgH2JXF/RfOrax19gy3NpN1urkxXl0RO3exPK9Eg/i
         cQzl2nnV7iu4Ug4cNN87vHMj6sK4LHNEdz+OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N93FQS54KNMw/RWZd3sdd1/c5zsgaKSRIH5cGtG3wLQ=;
        b=WxDh4sg81G7PWgk0GZFdMWELvuvgsAU3JY8jbVU+DiTLtpb9DB5NZmn3WW3XiXeUrV
         S3SlVT+IBfObuGUbiTFc0Xf1SbcTs8soGB3H5jcyFrJopip24ramHWQ+7TUdmM7z8RH8
         BpAGhfBh86KDy69XKqUQE+t5ZADnGvrq52kQrF69Y8cQSkpydU61+XsHKx6aOKKLsqZD
         dAxHUcKCT2I6n74HhPeM8V7hx769hAI/A/FdrLM8LYe0SsGu5tqEI4eI+KXiGs7QgIrK
         aBTaj703kJ86OQjJ5gTe1/VVVW5B3LCtIs7CWKw79yziJxwzClxvDgRJNZh3IhNBxMY3
         16PA==
X-Gm-Message-State: AOAM530siNA7ECkkdWi2yt8HSqW5CtvqqcjBoTKK73bDGRR2mI846DVH
        7s9wnkQfwXLA004tilsqm12n85XiNymvYw==
X-Google-Smtp-Source: ABdhPJz5jRIJ5Y3KqetmAFk2kwAEiK/W1idRezxptrxxOSWoZ32Z1SOZmtci8kO2YE6q/89rrnTOrA==
X-Received: by 2002:ac8:5e12:: with SMTP id h18mr414349qtx.253.1624391786437;
        Tue, 22 Jun 2021 12:56:26 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id c20sm2543822qtm.52.2021.06.22.12.56.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 12:56:26 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id o6so7334164qkh.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 12:56:26 -0700 (PDT)
X-Received: by 2002:a25:2405:: with SMTP id k5mr6836288ybk.405.1624391426495;
 Tue, 22 Jun 2021 12:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210621235248.2521620-1-dianders@chromium.org> <f3078ff2-97a6-6029-b584-1589ed184579@huawei.com>
In-Reply-To: <f3078ff2-97a6-6029-b584-1589ed184579@huawei.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 22 Jun 2021 12:50:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyicdP+czVyMPFpuSDHcB_jF3ikjSjqu_X0qVsUReiOA@mail.gmail.com>
Message-ID: <CAD=FV=WyicdP+czVyMPFpuSDHcB_jF3ikjSjqu_X0qVsUReiOA@mail.gmail.com>
Subject: Re: [PATCH 0/6] iommu: Enable devices to request non-strict DMA,
 starting with QCom SD/MMC
To:     John Garry <john.garry@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Tue, Jun 22, 2021 at 10:46 AM John Garry <john.garry@huawei.com> wrote:
>
> On 22/06/2021 00:52, Douglas Anderson wrote:
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
> >
>
> JFYI, In case to missed it, and I know it's not the same thing as you
> want, above, but the following series will allow you to build the kernel
> to default to lazy mode:
>
> https://lore.kernel.org/linux-iommu/1624016058-189713-1-git-send-email-john.garry@huawei.com/T/#m21bc07b9353b3ba85f2a40557645c2bcc13cbb3e
>
> So iommu.strict=0 would be no longer always required for arm64.

Excellent! I'm never a fan of command line parameters as a replacement
for Kconfig. They are great for debugging or for cases where the user
of the kernel and the person compiling the kernel are not the same
(like with off-the-shelf Linux distros) but aren't great for setting a
default for embedded environments.

I actually think that something like my patchset may be even more
important atop yours. Do you agree? If the default is non-strict it
could be extra important to be able to mark a certain device to be in
"strict" mode.

...also, unfortunately I probably won't be able to use your patchest
for my use case. I think we want the extra level of paranoia by
default and really only want to allow non-strict mode for devices that
we're really convinced are safe.

-Doug
