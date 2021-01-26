Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F350830435A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 17:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391796AbhAZQF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 11:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404695AbhAZQDf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 11:03:35 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB69DC0611C2;
        Tue, 26 Jan 2021 08:02:53 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id v15so17012045wrx.4;
        Tue, 26 Jan 2021 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aFlkAZerFpubxAazxTKAQZiW3bP9g1vSTNyeVcwXgCE=;
        b=aBw/JDFrBqZFKzZalG1z+Wb4/+GgcVhr54M6uiiMeHFwIJXxlGmcEGPJnj6HRbHp9C
         zNqOuhijks7nnjWG6pF47YRh9kAwruR5/e27KtkTBwWhE9iePzD8OXy94OwEdaGH4VzP
         70byPjqbRRMme2c1dgi3ddgLyRjoGxIqNEl+qlls2IDVhgs/6J+9xNsox7gc+IqFsCai
         tSNnuxp4TmyJ3Sv8k7s0PKSIhGLe1azsxVDdgTqg5OnUxEWWT4/wZZAR61X3vW6u7lD2
         x+DCP5UJd5BJd55BZBdjeVw4CwsiWHK6OL7jP+9iyghthfZzI5sOJb1tqasDkykOjqIw
         ckLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFlkAZerFpubxAazxTKAQZiW3bP9g1vSTNyeVcwXgCE=;
        b=rBlorY60g+5oRQzTz/wztijy/W8s6geyllQUUeYYxcxU0P902LvJacMZCW8MxBm09R
         ppD2MFbbkAMDmuRIat4xwqYouRpuMwDRYypJen7YtDiH8NllQWEuQNn+oVwWzRdJzBqh
         mjZzz3DgOJCXXA5ewqfLlQ5316EgKyKHziF3P9iyIHhSRNyeB6mpv8iPcpEDqslccTwS
         nQpRHTQsOEDfkNPp7O6EgpT7h5UfuCs+YY4z1amA4gLUJX8xbzvenXJWZEM9gYIa7vTz
         biwUJ9BBTfRiIf1v7iBEokg/ig6ln4xCfyaLWusst9FuVjKec7xF/xA4fyunm3ez9iSj
         MWPQ==
X-Gm-Message-State: AOAM530h0icdsH/dOW/vcDsXhi8qKwcMXIk/le291ZIjUwp9onFbSnMT
        FxIk/91s3M0nptA77XNfre2bIB2qTblmtj8Dmk0RsOvQIR1X0A==
X-Google-Smtp-Source: ABdhPJyFUDHBfbCHody9k+wZ4aFvotJCowWDiLs9lQv0qzCYaPV/BTpIS5La53v3bCrhePCsoAkHsSRmcBPQzE+OeII=
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr1812596wrq.132.1611676972399;
 Tue, 26 Jan 2021 08:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20201124191600.2051751-1-jcrouse@codeaurora.org>
 <20201124191600.2051751-2-jcrouse@codeaurora.org> <20210122124125.GA24102@willie-the-truck>
 <8ba2f53d-abbf-af7f-07f6-48ad7f383a37@arm.com> <20210125215107.GB16374@jcrouse1-lnx.qualcomm.com>
 <dc035204-ade7-03ec-0b82-2ecedc856d42@arm.com>
In-Reply-To: <dc035204-ade7-03ec-0b82-2ecedc856d42@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 26 Jan 2021 08:05:26 -0800
Message-ID: <CAF6AEGtfm=vO6s3vQLNotz=spM9EdXbuNi_vfmCqVd7DmyEMCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] iommu/arm-smmu: Add support for driver IOMMU fault handlers
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 26, 2021 at 3:41 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-01-25 21:51, Jordan Crouse wrote:
> > On Fri, Jan 22, 2021 at 12:53:17PM +0000, Robin Murphy wrote:
> >> On 2021-01-22 12:41, Will Deacon wrote:
> >>> On Tue, Nov 24, 2020 at 12:15:58PM -0700, Jordan Crouse wrote:
> >>>> Call report_iommu_fault() to allow upper-level drivers to register their
> >>>> own fault handlers.
> >>>>
> >>>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >>>> ---
> >>>>
> >>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 16 +++++++++++++---
> >>>>   1 file changed, 13 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>> index 0f28a8614da3..7fd18bbda8f5 100644
> >>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>> @@ -427,6 +427,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >>>>    struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> >>>>    struct arm_smmu_device *smmu = smmu_domain->smmu;
> >>>>    int idx = smmu_domain->cfg.cbndx;
> >>>> +  int ret;
> >>>>    fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> >>>>    if (!(fsr & ARM_SMMU_FSR_FAULT))
> >>>> @@ -436,11 +437,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >>>>    iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> >>>>    cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> >>>> -  dev_err_ratelimited(smmu->dev,
> >>>> -  "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> >>>> +  ret = report_iommu_fault(domain, dev, iova,
> >>>> +          fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >>>> +
> >>>> +  if (ret == -ENOSYS)
> >>>> +          dev_err_ratelimited(smmu->dev,
> >>>> +          "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> >>>>                        fsr, iova, fsynr, cbfrsynra, idx);
> >>>> -  arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> >>>> +  /*
> >>>> +   * If the iommu fault returns an error (except -ENOSYS) then assume that
> >>>> +   * they will handle resuming on their own
> >>>> +   */
> >>>> +  if (!ret || ret == -ENOSYS)
> >>>> +          arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> >>>
> >>> Hmm, I don't grok this part. If the fault handler returned an error and
> >>> we don't clear the FSR, won't we just re-take the irq immediately?
> >>
> >> If we don't touch the FSR at all, yes. Even if we clear the fault indicator
> >> bits, the interrupt *might* remain asserted until a stalled transaction is
> >> actually resolved - that's that lovely IMP-DEF corner.
> >>
> >> Robin.
> >>
> >
> > This is for stall-on-fault. The idea is that if the developer chooses to do so
> > we would stall the GPU after a fault long enough to take a picture of it with
> > devcoredump and then release the FSR. Since we can't take the devcoredump from
> > the interrupt handler we schedule it in a worker and then return an error
> > to let the main handler know that we'll come back around clear the FSR later
> > when we are done.
>
> Sure, but clearing FSR is not writing to RESUME to resolve the stalled
> transaction(s). You can already snarf the FSR contents from your
> report_iommu_fault() handler if you want to, so either way I don't see
> what's gained by not clearing it as expected at the point where we've
> handled the *interrupt*, even if it will take longer to decide what to
> do with the underlying *fault* that it signalled. I'm particularly not
> keen on having unusual behaviour in the core interrupt handling which
> callers may unwittingly trigger, for the sake of one
> very-very-driver-specific flow having a slightly richer debugging
> experience.

Tbf, "slightly" is an understatement.. it is a big enough improvement
that I've hacked up deferred resume several times to debug various
issues. ;-)

(Which is always a bit of a PITA because of things moving around in
arm-smmu as well as the drm side of things.)

But from my recollection, we can clear FSR immediately, all we need to
do is defer writing ARM_SMMU_CB_RESUME

BR,
-R

>
> For actually *handling* faults, I thought we were going to need to hook
> up the new IOPF fault queue stuff anyway?
>
> Robin.
>
> > It is assumed that we'll have to turn off interrupts in our handler to allow
> > this to work. Its all very implementation specific, but then again we're
> > assuming that if you want to do this then you know what you are doing.
> >
> > In that spirit the error that skips the FSR should probably be something
> > specific instead of "all errors" - that way a well meaning handler that returns
> > a -EINVAL doesn't accidentally break itself.
> >
> > Jordan
> >
> >>> I think
> >>> it would be better to do this unconditionally, and print the "Unhandled
> >>> context fault" message for any non-zero value of ret.
> >
> >>>
> >>> Will
> >>>
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
