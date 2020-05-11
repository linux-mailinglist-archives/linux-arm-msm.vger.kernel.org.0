Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A30B1CE1B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 19:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbgEKRaj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 13:30:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:55729 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730215AbgEKRai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 13:30:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589218237; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=iPpTo3jNPE0V2FCWqXWCysaJe2BOVw+onhpjhSu1HVU=; b=kpqbZqbhGuWjXtHE+F87evxpGd7M+sHAdmbmhrh05wpTXGryqnCfd4hC+41tTfOj2VZ1RHeP
 yMX4D/j0ivJ/Y086YljkodFr/yLNCYRfTz/tpnpGoE838DMsNltoUNePtIaNBDdLdxzRBjTr
 I0BuJSw34cL8Xr5PtnI12LVe61s=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb98ba5.7f318b958f80-smtp-out-n04;
 Mon, 11 May 2020 17:30:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1B419C433CB; Mon, 11 May 2020 17:30:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33E07C433F2;
        Mon, 11 May 2020 17:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33E07C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 11 May 2020 11:30:08 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
Message-ID: <20200511173008.GA24282@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck>
 <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
 <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 08:40:40AM -0700, Rob Clark wrote:
> On Fri, May 8, 2020 at 8:32 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, May 7, 2020 at 5:54 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
> > > > On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
> > > > > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
> > > > > > Add stall implementation hook to enable stalling
> > > > > > faults on QCOM platforms which supports it without
> > > > > > causing any kind of hardware mishaps. Without this
> > > > > > on QCOM platforms, GPU faults can cause unrelated
> > > > > > GPU memory accesses to return zeroes. This has the
> > > > > > unfortunate result of command-stream reads from CP
> > > > > > getting invalid data, causing a cascade of fail.
> > > >
> > > > I think this came up before, but something about this rationale doesn't add
> > > > up - we're not *using* stalls at all, we're still terminating faulting
> > > > transactions unconditionally; we're just using CFCFG to terminate them with
> > > > a slight delay, rather than immediately. It's really not clear how or why
> > > > that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
> > > > (or even a documented workaround for something), or might things start
> > > > blowing up again if any other behaviour subtly changes? I'm not dead set
> > > > against adding this, but I'd *really* like to have a lot more confidence in
> > > > it.
> > >
> > > Rob mentioned something about the "bus returning zeroes" before, but I agree
> > > that we need more information so that we can reason about this and maintain
> > > the code as the driver continues to change. That needs to be a comment in
> > > the driver, and I don't think "but android seems to work" is a good enough
> > > justification. There was some interaction with HUPCF as well.
> >
> > The issue is that there are multiple parallel memory accesses
> > happening at the same time, for example CP (the cmdstream processor)
> > will be reading ahead and setting things up for the next draw or
> > compute grid, in parallel with some memory accesses from the shader
> > which could trigger a fault.  (And with faults triggered by something
> > in the shader, there are *many* shader threads running in parallel so
> > those tend to generate a big number of faults at the same time.)
> >
> > We need either CFCFG or HUPCF, otherwise what I have observed is that
> > while the fault happens, CP's memory access will start returning
> > zero's instead of valid cmdstream data, which triggers a GPU hang.  I
> > can't say whether this is something unique to qcom's implementation of
> > the smmu spec or not.
> >
> > *Often* a fault is the result of the usermode gl/vk/cl driver bug,
> > although I don't think that is an argument against fixing this in the
> > smmu driver.. I've been carrying around a local patch to set HUPCF for
> > *years* because debugging usermode driver issues is so much harder
> > without.  But there are some APIs where faults can be caused by the
> > user's app on top of the usermode driver.
> >
> 
> Also, I'll add to that, a big wish of mine is to have stall with the
> ability to resume later from a wq context.  That would enable me to
> hook in the gpu crash dump handling for faults, which would make
> debugging these sorts of issues much easier.  I think I posted a
> prototype of this quite some time back, which would schedule a worker
> on the first fault (since there are cases where you see 1000's of
> faults at once), which grabbed some information about the currently
> executing submit and some gpu registers to indicate *where* in the
> submit (a single submit could have 100's or 1000's of draws), and then
> resumed the iommu cb.
> 
> (This would ofc eventually be useful for svm type things.. I expect
> we'll eventually care about that too.)

Rob is right about HUPCF. Due to the parallel nature of the command processor
there is always a very good chance that a CP access is somewhere in the bus so
any pagefault is usually a death sentence. The GPU context bank would always
want HUPCF set to 1.

Downstream also uses CFCFG for stall-on-fault debug case. You wouldn't want
this on all the time in production since bringing down the world for every user
pagefault is less than desirable so it needs to be modified in run-time (or at
the very least kernel command line selectable).

Jordan

PS: Interestingly, the GMU does not want HUPCF set to 1 because it wants to
crash immediately on all invalid accesses so ideally these combination of bits
would be configurable on a per-context basis.

> > >
> > > As a template, I'd suggest:
> > >
> > > > > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > > > > index 8d1cd54d82a6..d5134e0d5cce 100644
> > > > > > --- a/drivers/iommu/arm-smmu.h
> > > > > > +++ b/drivers/iommu/arm-smmu.h
> > > > > > @@ -386,6 +386,7 @@ struct arm_smmu_impl {
> > > > > >      int (*init_context)(struct arm_smmu_domain *smmu_domain);
> > > > > >      void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
> > > > > >               int status);
> > >
> > > /*
> > >  * Stall transactions on a context fault, where they will be terminated
> > >  * in response to the resulting IRQ rather than immediately. This should
> > >  * pretty much always be set to "false" as stalling can introduce the
> > >  * potential for deadlock in most SoCs, however it is needed on Qualcomm
> > >  * XXXX because YYYY.
> > >  */
> > >
> > > > > > +    bool stall;
> > >
> > > Hmm, the more I think about this, the more I think this is an erratum
> > > workaround in disguise, in which case this could be better named...
> > >
> > > Will

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
