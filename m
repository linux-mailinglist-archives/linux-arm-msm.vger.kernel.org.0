Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AD7221EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 10:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgGPIu7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 04:50:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:37638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgGPIu6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 04:50:58 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7ABE2067D;
        Thu, 16 Jul 2020 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594889458;
        bh=U7X430J5V6ePsxTX3punZtP6BZO/DUniM8aSGD0rCbE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=lZz7/S2vinkg3caYNt3YEW0+aHk66D0ubE/cVS+1d1BJj1TOMJLdy0VXqxtqvmFif
         cDATDWQ5495bMsQhe9jCZDMOaj8c/C54/Gzxzj3D8BOc5ai8vt33x1Nk/IMcu71aBm
         4fkAgq1cHMXKB9HNNTG5q2laTa6Mvod6Foqi0R5M=
Date:   Thu, 16 Jul 2020 09:50:53 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        John Stultz <john.stultz@linaro.org>,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [Freedreno] [PATCH v9 4/7] iommu/arm-smmu: Add a pointer to the
 attached device to smmu_domain
Message-ID: <20200716085053.GB6771@willie-the-truck>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-5-jcrouse@codeaurora.org>
 <20200713150901.GA3072@willie-the-truck>
 <20200713171917.GA3815@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713171917.GA3815@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 11:19:17AM -0600, Jordan Crouse wrote:
> On Mon, Jul 13, 2020 at 04:09:02PM +0100, Will Deacon wrote:
> > On Fri, Jun 26, 2020 at 02:00:38PM -0600, Jordan Crouse wrote:
> > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > index 5f2de20e883b..d33cfe26b2f5 100644
> > > --- a/drivers/iommu/arm-smmu.h
> > > +++ b/drivers/iommu/arm-smmu.h
> > > @@ -345,6 +345,7 @@ struct arm_smmu_domain {
> > >  	struct mutex			init_mutex; /* Protects smmu pointer */
> > >  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> > >  	struct iommu_domain		domain;
> > > +	struct device			*dev;	/* Device attached to this domain */
> > 
> > This really doesn't feel right to me -- you can generally have multiple
> > devices attached to a domain and they can come and go without the domain
> > being destroyed. Perhaps you could instead identify the GPU during
> > cfg_probe() and squirrel that information away somewhere?
> 
> I need some help here. The SMMU device (qcom,adreno-smmu) will have at least two
> stream ids from two different platform devices (GPU and GMU) and I need to
> configure split-pagetable and stall/terminate differently on the two domains.

Hmm. How does the GPU driver know which context bank is assigned to the GPU
and which one is assigned to the GMU? I assume it needs this information so
that it can play its nasty tricks with the TTBR registers?

I ask because if we need to guarantee stability of the context-bank
assignment, then you could match on that in the ->init_context() callback,
but now I worry that it currently works by luck :/

Do we need to add an extra callback to allocate the context bank?

Will
