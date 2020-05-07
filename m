Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BA11C8B72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 14:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgEGMyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 08:54:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:37154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgEGMyD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 08:54:03 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEE472082E;
        Thu,  7 May 2020 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588856043;
        bh=ejai9cTPU/wXSWdxchfGt1itA5yy8fQdOCXV1pCVHB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RQWnluLJiArcmPu9fOV36aetvJ89LlV4OkXKlOag7m8wEFYv8k8CmgXArbDzu6Wsq
         pswbvEeTfFU5iF88PS7C3PtcspXniovK40FRu2E7ppNmm6cyjd3Iso9XksHltSy6+K
         p+BGlBgqY06MAoY6CKRIfJ85jBPtzde5OXgykwOI=
Date:   Thu, 7 May 2020 13:53:58 +0100
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
Message-ID: <20200507125357.GA31783@willie-the-truck>
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
> On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
> > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
> > > Add stall implementation hook to enable stalling
> > > faults on QCOM platforms which supports it without
> > > causing any kind of hardware mishaps. Without this
> > > on QCOM platforms, GPU faults can cause unrelated
> > > GPU memory accesses to return zeroes. This has the
> > > unfortunate result of command-stream reads from CP
> > > getting invalid data, causing a cascade of fail.
> 
> I think this came up before, but something about this rationale doesn't add
> up - we're not *using* stalls at all, we're still terminating faulting
> transactions unconditionally; we're just using CFCFG to terminate them with
> a slight delay, rather than immediately. It's really not clear how or why
> that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
> (or even a documented workaround for something), or might things start
> blowing up again if any other behaviour subtly changes? I'm not dead set
> against adding this, but I'd *really* like to have a lot more confidence in
> it.

Rob mentioned something about the "bus returning zeroes" before, but I agree
that we need more information so that we can reason about this and maintain
the code as the driver continues to change. That needs to be a comment in
the driver, and I don't think "but android seems to work" is a good enough
justification. There was some interaction with HUPCF as well.

As a template, I'd suggest:

> > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > index 8d1cd54d82a6..d5134e0d5cce 100644
> > > --- a/drivers/iommu/arm-smmu.h
> > > +++ b/drivers/iommu/arm-smmu.h
> > > @@ -386,6 +386,7 @@ struct arm_smmu_impl {
> > >      int (*init_context)(struct arm_smmu_domain *smmu_domain);
> > >      void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
> > >               int status);

/*
 * Stall transactions on a context fault, where they will be terminated
 * in response to the resulting IRQ rather than immediately. This should
 * pretty much always be set to "false" as stalling can introduce the
 * potential for deadlock in most SoCs, however it is needed on Qualcomm
 * XXXX because YYYY.
 */

> > > +    bool stall;

Hmm, the more I think about this, the more I think this is an erratum
workaround in disguise, in which case this could be better named...

Will
