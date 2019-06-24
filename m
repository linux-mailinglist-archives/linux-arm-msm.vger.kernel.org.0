Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 101F15193C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 19:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbfFXRDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 13:03:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:49908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbfFXRDz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 13:03:55 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CD1720645;
        Mon, 24 Jun 2019 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561395834;
        bh=jD2uK5kCwexPBSnlloDzcLqIftPyzxTGZFnE/+MKxQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=flxl+4YatLVLP2cePA3e4X7Wh66OFz4Df7unTW3gX7IS3uVUqtmUW+bqjszBy3MvG
         B5+DWZMnFBCVb3RpJ84i30TPyvr0bD5egtvEfqu+i+MV+3OoTkg4GQIa76HRa4YYRU
         Rrf1OiPhakYPRzxa7pXFv2aNJhrv/KGzo07Sm2To=
Date:   Mon, 24 Jun 2019 18:03:49 +0100
From:   Will Deacon <will@kernel.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Will Deacon <will.deacon@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        robh+dt <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
Message-ID: <20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org>
 <20190614040520.GK22737@tuxbook-pro>
 <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
 <20190618175218.GH4270@fuggles.cambridge.arm.com>
 <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[+Krishna]

Hi Vivek,

On Mon, Jun 24, 2019 at 03:58:32PM +0530, Vivek Gautam wrote:
> On Tue, Jun 18, 2019 at 11:22 PM Will Deacon <will.deacon@arm.com> wrote:
> > On Fri, Jun 14, 2019 at 02:48:07PM +0530, Vivek Gautam wrote:
> > > On 6/14/2019 9:35 AM, Bjorn Andersson wrote:
> > > > On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
> > > > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > > > index 0ad086da399c..3c3ad43eda97 100644
> > > > > --- a/drivers/iommu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm-smmu.c
> > > > > @@ -39,6 +39,7 @@
> > > > >   #include <linux/pci.h>
> > > > >   #include <linux/platform_device.h>
> > > > >   #include <linux/pm_runtime.h>
> > > > > +#include <linux/qcom_scm.h>
> > > > >   #include <linux/slab.h>
> > > > >   #include <linux/spinlock.h>
> > > > > @@ -177,6 +178,7 @@ struct arm_smmu_device {
> > > > >           u32                             features;
> > > > >   #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> > > > > +#define ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA (1 << 1)
> > > > >           u32                             options;
> > > > >           enum arm_smmu_arch_version      version;
> > > > >           enum arm_smmu_implementation    model;
> > > > > @@ -262,6 +264,7 @@ static bool using_legacy_binding, using_generic_binding;
> > > > >   static struct arm_smmu_option_prop arm_smmu_options[] = {
> > > > >           { ARM_SMMU_OPT_SECURE_CFG_ACCESS, "calxeda,smmu-secure-config-access" },
> > > > > + { ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA, "qcom,smmu-500-fw-impl-safe-errata" },
> > > > This should be added to the DT binding as well.
> > >
> > > Ah right. I missed that. Will add this and respin unless Robin and Will have
> > > concerns with this change.
> >
> > My only concern really is whether it's safe for us to turn this off. It's
> > clear that somebody went to a lot of effort to add this extra goodness to
> > the IP, but your benchmarks suggest they never actually tried it out after
> > they finished building it.
> >
> > Is there some downside I'm not seeing from disabling this stuff?
> 
> This wait-for-safe is a TLB invalidation enhancement to help display
> and camera devices.
> The SMMU hardware throttles the invalidations so that clients such as
> display and camera can indicate when to start the invalidation.
> So the SMMU essentially reduces the rate at which invalidations are
> serviced from its queue. This also throttles the invalidations from
> other masters too.
> 
> On sdm845, the software is expected to serialize the invalidation
> command loading into SMMU invalidation FIFO using hardware locks
> (downstream code [2]), and is also expected to throttle non-real time
> clients while waiting for SAFE==1 (downstream code[2]). We don't do
> any of these yet, and as per my understanding as this wait-for-safe is
> enabled by the bootloader in a one time config, this logic reduces
> performance of devices such as usb and ufs.
> 
> There's isn't any downside from disabling this logic until we have all
> the pieces together from downstream in upstream kernels, and until we
> have sdm845 devices that are running with full display/gfx stack
> running. That's when we plan to revisit this and enable all the pieces
> to get display and USB/UFS working with their optimum performance.

Generally, I'd agree that approaching this incrementally makes sense, but
in this case you're adding new device-tree properties
("qcom,smmu-500-fw-impl-safe-errata") in order to do so, which seems
questionable if they're only going to be used in the short-term and will
be obsolete once Linux knows how to drive the device properly.

Instead, I think this needs to be part of a separate file that is maintained
by you, which follows on from the work that Krishna is doing for nvidia
built on top of Robin's prototype patches:

http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/smmu-impl

Once we have that, you can key this behaviour off the compatible string
rather than having to add quirk properties to reflect the transient needs of
Linux.

Krishna -- how have you been getting on with the branch above?

Will
