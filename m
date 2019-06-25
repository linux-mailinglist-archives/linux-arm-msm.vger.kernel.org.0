Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99070523ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 09:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfFYHFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 03:05:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33808 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfFYHFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 03:05:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D3F2F607DE; Tue, 25 Jun 2019 07:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561446312;
        bh=4N/BCQSsMk9kqvdWn3ha3xLftdz1843VcRc6I5jXtM0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NC8qjC79C5Fg7PzYzQpqFRb69qRUqQgHKBtvpUS6OJx7HVuaWNh8T8O5MV4eP109S
         1HgoTHqEw276dWOr1SJQ11TdQD4MOL8Z02NOq+HdHjgmcaLyhruNBD4wPkLHWqMCKn
         3GRKotsRxMmyKjiZN9Im8dpa+XjW/uotsR/I8QBY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 810C660D35;
        Tue, 25 Jun 2019 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561446309;
        bh=4N/BCQSsMk9kqvdWn3ha3xLftdz1843VcRc6I5jXtM0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AV2jdOHrweSYZn30LLL2sFGVil30bCPNm7cJj9pLsh/jH55hcILm18varwhtbYW19
         C0H5gi7AI1IYhrj534RIvAHUU+5U5zC8borvNyFNL7ZVAJGITUp27qUHyCjVClKqoE
         tDcqvj0k/yeEs/3yNqTrDpjRR/GVXG3eE5n3JMWE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 810C660D35
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f52.google.com with SMTP id w13so25554723eds.4;
        Tue, 25 Jun 2019 00:05:09 -0700 (PDT)
X-Gm-Message-State: APjAAAUs55jgZq7qQmiv7cXwwxfIxKkrNghJy6OgmWrurPXf8UmGa6ro
        nRuQjgmamlWFfXCWWnpe209zTNlo/DKX3g/EdQ4=
X-Google-Smtp-Source: APXvYqw4ea9lzM4JrtqZAtGHkuco3ytv6PJqElNZoVg2rFRo/Orhj9+G+vfP00mjoxzM/Bk8IOr2E4Su/rVWt/pFy7Q=
X-Received: by 2002:a50:9413:: with SMTP id p19mr146764994eda.224.1561446308141;
 Tue, 25 Jun 2019 00:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org> <20190614040520.GK22737@tuxbook-pro>
 <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org> <20190618175218.GH4270@fuggles.cambridge.arm.com>
 <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com> <20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
In-Reply-To: <20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Tue, 25 Jun 2019 12:34:56 +0530
X-Gmail-Original-Message-ID: <CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
Message-ID: <CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
To:     Will Deacon <will@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "robh+dt" <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,


On Mon, Jun 24, 2019 at 10:33 PM Will Deacon <will@kernel.org> wrote:
>
> [+Krishna]
>
> Hi Vivek,
>
> On Mon, Jun 24, 2019 at 03:58:32PM +0530, Vivek Gautam wrote:
> > On Tue, Jun 18, 2019 at 11:22 PM Will Deacon <will.deacon@arm.com> wrote:
> > > On Fri, Jun 14, 2019 at 02:48:07PM +0530, Vivek Gautam wrote:
> > > > On 6/14/2019 9:35 AM, Bjorn Andersson wrote:
> > > > > On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
> > > > > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > > > > index 0ad086da399c..3c3ad43eda97 100644
> > > > > > --- a/drivers/iommu/arm-smmu.c
> > > > > > +++ b/drivers/iommu/arm-smmu.c
> > > > > > @@ -39,6 +39,7 @@
> > > > > >   #include <linux/pci.h>
> > > > > >   #include <linux/platform_device.h>
> > > > > >   #include <linux/pm_runtime.h>
> > > > > > +#include <linux/qcom_scm.h>
> > > > > >   #include <linux/slab.h>
> > > > > >   #include <linux/spinlock.h>
> > > > > > @@ -177,6 +178,7 @@ struct arm_smmu_device {
> > > > > >           u32                             features;
> > > > > >   #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> > > > > > +#define ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA (1 << 1)
> > > > > >           u32                             options;
> > > > > >           enum arm_smmu_arch_version      version;
> > > > > >           enum arm_smmu_implementation    model;
> > > > > > @@ -262,6 +264,7 @@ static bool using_legacy_binding, using_generic_binding;
> > > > > >   static struct arm_smmu_option_prop arm_smmu_options[] = {
> > > > > >           { ARM_SMMU_OPT_SECURE_CFG_ACCESS, "calxeda,smmu-secure-config-access" },
> > > > > > + { ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA, "qcom,smmu-500-fw-impl-safe-errata" },
> > > > > This should be added to the DT binding as well.
> > > >
> > > > Ah right. I missed that. Will add this and respin unless Robin and Will have
> > > > concerns with this change.
> > >
> > > My only concern really is whether it's safe for us to turn this off. It's
> > > clear that somebody went to a lot of effort to add this extra goodness to
> > > the IP, but your benchmarks suggest they never actually tried it out after
> > > they finished building it.
> > >
> > > Is there some downside I'm not seeing from disabling this stuff?
> >
> > This wait-for-safe is a TLB invalidation enhancement to help display
> > and camera devices.
> > The SMMU hardware throttles the invalidations so that clients such as
> > display and camera can indicate when to start the invalidation.
> > So the SMMU essentially reduces the rate at which invalidations are
> > serviced from its queue. This also throttles the invalidations from
> > other masters too.
> >
> > On sdm845, the software is expected to serialize the invalidation
> > command loading into SMMU invalidation FIFO using hardware locks
> > (downstream code [2]), and is also expected to throttle non-real time
> > clients while waiting for SAFE==1 (downstream code[2]). We don't do
> > any of these yet, and as per my understanding as this wait-for-safe is
> > enabled by the bootloader in a one time config, this logic reduces
> > performance of devices such as usb and ufs.
> >
> > There's isn't any downside from disabling this logic until we have all
> > the pieces together from downstream in upstream kernels, and until we
> > have sdm845 devices that are running with full display/gfx stack
> > running. That's when we plan to revisit this and enable all the pieces
> > to get display and USB/UFS working with their optimum performance.
>
> Generally, I'd agree that approaching this incrementally makes sense, but
> in this case you're adding new device-tree properties
> ("qcom,smmu-500-fw-impl-safe-errata") in order to do so, which seems
> questionable if they're only going to be used in the short-term and will
> be obsolete once Linux knows how to drive the device properly.

This device tree property will still be valid when we handle the wait-for-safe
properly for sdm845.
("qcom,smmu-500-fw-impl-safe-errata") property represents just that the
firmware has handles to do the entire sequence -
* read the secure register
* set/reset the bits in the register to enable/disable wait-for-safe for certain
  devices.
And this is valid when firmware masks access to this register from any other
EE.
So we don't have to do anything that, for example, we were doing for sdm845
based cheza's firmware [1] that implements simple scm handlers to read/write
secure registers.

And fyi, some of the newer SoCs too have this logic, and kernel can have that
extra bit of page-table-ops to handle wait-safe toggling.

[1] https://lore.kernel.org/patchwork/patch/983917/
>
> Instead, I think this needs to be part of a separate file that is maintained
> by you, which follows on from the work that Krishna is doing for nvidia
> built on top of Robin's prototype patches:
>
> http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/smmu-impl

Looking at this branch quickly, it seem there can be separate implementation
level configuration file that can be added.
But will this also handle separate page table ops when required in future.

Best regards
Vivek

>
> Once we have that, you can key this behaviour off the compatible string
> rather than having to add quirk properties to reflect the transient needs of
> Linux.
>
> Krishna -- how have you been getting on with the branch above?
>
> Will
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
