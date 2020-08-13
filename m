Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3D9243C5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 17:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgHMPTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 11:19:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgHMPTl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 11:19:41 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 026FC2078D;
        Thu, 13 Aug 2020 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597331980;
        bh=GUc3HeAnqqqqlsdI+PNr6Cgi6V9dzbFIkHuID4DZjzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DIiIBqmnUPBmVeIvv4yjwhCDacHmHrEQHVUbgeg0ZB6vwx9bcaF4avc9PMhdS9tg4
         wmCpHDJVgeI8xWGlbAsKPNVAc5v0lwU9azqZ/Cj7xf41op7j3POQ+qqgoptGJcOgzS
         EkqphfYghJlApnHGgR4tE/oV7hq+0yoT9qJoTrJI=
Date:   Thu, 13 Aug 2020 16:19:35 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH v12 04/13] iommu: Add a domain attribute to
 get/set a pagetable configuration
Message-ID: <20200813151934.GA10534@willie-the-truck>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org>
 <20200813131412.GB10256@willie-the-truck>
 <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 13, 2020 at 08:11:02AM -0700, Rob Clark wrote:
> On Thu, Aug 13, 2020 at 6:14 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> > > Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> > > arm-smmu to share the current pagetable configuration with the
> > > leaf driver and to allow the leaf driver to set up a new pagetable
> > > configuration under certain circumstances.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >  include/linux/iommu.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > index fee209efb756..995ab8c47ef2 100644
> > > --- a/include/linux/iommu.h
> > > +++ b/include/linux/iommu.h
> > > @@ -118,6 +118,7 @@ enum iommu_attr {
> > >       DOMAIN_ATTR_FSL_PAMUV1,
> > >       DOMAIN_ATTR_NESTING,    /* two stages of translation */
> > >       DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > > +     DOMAIN_ATTR_PGTABLE_CFG,
> > >       DOMAIN_ATTR_MAX,
> > >  };
> >
> > Nobody other than the adreno gpu uses this, so can we avoid exposing it
> > in the IOMMU API, please? Given that you have a reference to the adreno
> > GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
> > can you squirrel some function pointers away in the driver data (i.e. with
> > dev_set_drvdata()) instead?
> >
> 
> Hmm, we are already using drvdata on the gpu side, and it looks like
> arm-smmu is also using it.  Could we get away with stashing an extra
> 'void *' in iommu_domain itself?

What I meant was, expose the type of whatever you put in there on the GPU
side so that the SMMU impl can install its function pointers into a field of
that structure. As far as I'm concerned, the SMMU impl code and the GPU
driver are the same entity and we should keep their communication private,
rather than expose it up the stack. After all, the GPU writes to the SMMU
registers!

If you really don't want to expose all of your gubbins, I suppose you
could have a structure just for the SMMU view and container_of() out of
that on the GPU side.

Will
