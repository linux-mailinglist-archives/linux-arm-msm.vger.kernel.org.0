Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE0F3B3089
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 15:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhFXNzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 09:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhFXNzp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 09:55:45 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF7FC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 06:53:26 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id c23so14594619qkc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHDdRelRavgSMuX+Enz3gXsuxhtxhRdSm3eh5ONAu3A=;
        b=k9V9jxYg0dvoRJOriAawKtVtjOqMWqF4nEv7gjAXDwn+RKtFtuzJXvjhWPai9PDksO
         opachs3IPXV3BAnrUPIUooraB3dCYpwC1YtLm2hmz28/g9cYtgytDjOHJjvkT3U+UUsF
         wDEqBrHAus7CYgNQ+GjzRjfRnJPU31pAG3A5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHDdRelRavgSMuX+Enz3gXsuxhtxhRdSm3eh5ONAu3A=;
        b=EnQdfFQvy1DoF1qFLYlSMWRj2lrK4bq/NH5DDeSzhVzkmFwYNi760EGs+CNZespYT8
         Xa4h/4mzgJ565sjrjFIwuT9qVvVrT0O8HEtEvCkpLk8MptLdPs+ihnLQiG8LVWa8NuYz
         BUBXwp6GmDaigm5FfM/tw0AvIEWdEPEoTB64nHzADLAxwIadQx6DYa7ZsMlZw/hL2drD
         J6QzBY4LJd4YfYlRiuAo/hw7ttyjFoAzLBzkW+IUoaFXwKaqqafOcKVP80htaFikz4dw
         EbzMyzJ+sxHaoaeaTl4ecibzCfIY192u78TUyGpDtVZsecSRQzPJuEf1go3kqwd3NEzq
         8F0g==
X-Gm-Message-State: AOAM532rSM8+5z9gfs9cSMZt7zG/ZKF6oRg+snx2XSgyTNcNatcYpDFA
        CPiZMg11HW6OY17z17hApTWmv5zHTmU8cg==
X-Google-Smtp-Source: ABdhPJzikC/Ki8sVqbvNmYRl0I6ec73/LUXoyeaVBdQnO3QYWMP0KwyYuNhgOKKeEJtXgdWxircmrA==
X-Received: by 2002:a05:620a:2ef:: with SMTP id a15mr5700917qko.268.1624542805936;
        Thu, 24 Jun 2021 06:53:25 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id k20sm2535377qko.113.2021.06.24.06.53.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 06:53:25 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id e1so2595844qkm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 06:53:25 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr5091144ybk.79.1624542421816;
 Thu, 24 Jun 2021 06:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210621235248.2521620-1-dianders@chromium.org>
 <20210621165230.3.I7accc008905590bb2b46f40f91a4aeda5b378007@changeid> <YNSKyu/a8S3Qywbc@kroah.com>
In-Reply-To: <YNSKyu/a8S3Qywbc@kroah.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Jun 2021 06:46:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VQEM=Gtzrkd-s_ufzi_Y7b1GPCOVROftmjLDWiMEd0qA@mail.gmail.com>
Message-ID: <CAD=FV=VQEM=Gtzrkd-s_ufzi_Y7b1GPCOVROftmjLDWiMEd0qA@mail.gmail.com>
Subject: Re: [PATCH 3/6] PCI: Indicate that we want to force strict DMA for
 untrusted devices
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
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 24, 2021 at 6:38 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 21, 2021 at 04:52:45PM -0700, Douglas Anderson wrote:
> > At the moment the generic IOMMU framework reaches into the PCIe device
> > to check the "untrusted" state and uses this information to figure out
> > if it should be running the IOMMU in strict or non-strict mode. Let's
> > instead set the new boolean in "struct device" to indicate when we
> > want forced strictness.
> >
> > NOTE: we still continue to set the "untrusted" bit in PCIe since that
> > apparently is used for more than just IOMMU strictness. It probably
> > makes sense for a later patchset to clarify all of the other needs we
> > have for "untrusted" PCIe devices (perhaps add more booleans into the
> > "struct device") so we can fully eliminate the need for the IOMMU
> > framework to reach into a PCIe device.
>
> It feels like the iommu code should not be messing with pci devices at
> all, please don't do this.

I think it's generally agreed that having the IOMMU code reach into
the PCIe code is pretty non-ideal, but that's not something that my
patch series added. The IOMMU code already has special cases to reach
into PCIe devices to decide strictness. I was actually trying to
reduce the amount of it.

> Why does this matter?  Why wouldn't a pci device use "strict" iommu at
> all times?  What happens if it does not?  Why are PCI devices special?

This is something pre-existing in Linux. In my patch series I was
trying to make PCI devices less special and take some of the concepts
from there and expand them, but in a cleaner way. It sounds like in my
v2 I should steer away from this and leave the existing PCI hacks
alone.

-Doug
