Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F22E618BAFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 16:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgCSPXe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 11:23:34 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44414 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727753AbgCSPXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 11:23:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584631413; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=+h/aH/tnk8MqVRqSLVDvUiUIVZnrq7v6U7JA2ycdYoE=; b=u9hXHaaNBS5dlfiWMOhxuwXMFKUCUP2BRqrLxMShtDHCQe6rIb3Qt5nlj1k2jcZ3TjQLetZC
 3VcCFYoxjtjsAQZZ0LbPhcFYTTuQ23dttu6CL2W0513nxulNKXHSCTPW65iSoyQIr/zZTKTZ
 G3X2/7i2Sy61wFpXlFID0xLmwEA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e738e6e.7fed6ca99538-smtp-out-n04;
 Thu, 19 Mar 2020 15:23:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D9812C43637; Thu, 19 Mar 2020 15:23:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67016C433D2;
        Thu, 19 Mar 2020 15:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67016C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 19 Mar 2020 09:23:22 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 2/6] arm/smmu: Add auxiliary domain support for
 arm-smmuv2
Message-ID: <20200319152322.GA25898@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
 <1580249770-1088-3-git-send-email-jcrouse@codeaurora.org>
 <20200318224840.GA10796@willie-the-truck>
 <CAF6AEGu-hj6=3rsCe5XeBq_ffoq9VFmL+ycrQ8N=iv89DZf=8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGu-hj6=3rsCe5XeBq_ffoq9VFmL+ycrQ8N=iv89DZf=8Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 18, 2020 at 04:43:07PM -0700, Rob Clark wrote:
> On Wed, Mar 18, 2020 at 3:48 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Jan 28, 2020 at 03:16:06PM -0700, Jordan Crouse wrote:
> > > Support auxiliary domains for arm-smmu-v2 to initialize and support
> > > multiple pagetables for a single SMMU context bank. Since the smmu-v2
> > > hardware doesn't have any built in support for switching the pagetable
> > > base it is left as an exercise to the caller to actually use the pagetable.
> > >
> > > Aux domains are supported if split pagetable (TTBR1) support has been
> > > enabled on the master domain.  Each auxiliary domain will reuse the
> > > configuration of the master domain. By default the a domain with TTBR1
> > > support will have the TTBR0 region disabled so the first attached aux
> > > domain will enable the TTBR0 region in the hardware and conversely the
> > > last domain to be detached will disable TTBR0 translations.  All subsequent
> > > auxiliary domains create a pagetable but not touch the hardware.
> > >
> > > The leaf driver will be able to query the physical address of the
> > > pagetable with the DOMAIN_ATTR_PTBASE attribute so that it can use the
> > > address with whatever means it has to switch the pagetable base.
> > >
> > > Following is a pseudo code example of how a domain can be created
> > >
> > >  /* Check to see if aux domains are supported */
> > >  if (iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX)) {
> > >        iommu = iommu_domain_alloc(...);
> > >
> > >        if (iommu_aux_attach_device(domain, dev))
> > >                return FAIL;
> > >
> > >       /* Save the base address of the pagetable for use by the driver
> > >       iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
> > >  }
> >
> > I'm not really understanding what the pagetable base gets used for here and,
> > to be honest with you, the whole thing feels like a huge layering violation
> > with the way things are structured today. Why doesn't the caller just
> > interface with io-pgtable directly?
> >
> > Finally, if we need to support context-switching TTBR0 for a live domain
> > then that code really needs to live inside the SMMU driver because the
> > ASID and TLB management necessary to do that safely doesn't belong anywhere
> > else.
> 
> Hi Will,
> 
> We do in fact need live domain switching, that is really the whole
> point.  The GPU CP (command processor/parser) is directly updating
> TTBR0 and triggering TLB flush, asynchronously from the CPU.

Right. This is entirely done in hardware with a GPU that has complete access to
the context bank registers. All the driver does is send the PTBASE to the
command stream see [1] and especially [2] (look for CP_SMMU_TABLE_UPDATE).

As for interacting with the io-pgtable directly I would love to do that but it
would need some new infrastructure to either pull the io-pgtable from the aux
domain or to create an io-pgtable ourselves and pass it for use by the aux
domain. I'm not sure if that is better for the layering violation.

> And I think the answer about ASID is easy (on current hw).. it must be zero[*].

Right now the GPU microcode still uses TLBIALL. I want to assign each new aux
domain its own ASID in the hopes that we could some day change that but for now
having a uinque ASID doesn't help.

Jordan

[1] https://patchwork.freedesktop.org/patch/351089/
[2] https://patchwork.freedesktop.org/patch/351090/

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
