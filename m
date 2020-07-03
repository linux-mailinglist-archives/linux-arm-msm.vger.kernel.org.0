Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A85213CDB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGCPkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 11:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCPkd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 11:40:33 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 989D92088E;
        Fri,  3 Jul 2020 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593790832;
        bh=Csd/koDiDw1K1inIpkFWBNC1R6v7CBb2CU5Zmf57acc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=elkxLORLhsNPysnTycAsiV9dFFqH0sJrERhvHzdVnSoWd31u24otySgv6AFBrN1xi
         20i17gBg/JBftX4eTBohoOLJbWQxcuzwVPUj4482fpgRShUysZjsxNRm6OrzzFkGzP
         JyEoNBGIJ+mor3VD4UbEyhZTuwVDS+N5L2VhAXhA=
Date:   Fri, 3 Jul 2020 16:40:26 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCHv3 7/7] drm/msm/a6xx: Add support for using system
 cache(LLC)
Message-ID: <20200703154025.GB19327@willie-the-truck>
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
 <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
 <20200703133732.GD18953@willie-the-truck>
 <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:23:07PM +0530, Sai Prakash Ranjan wrote:
> On 2020-07-03 19:07, Will Deacon wrote:
> > On Mon, Jun 29, 2020 at 09:22:50PM +0530, Sai Prakash Ranjan wrote:
> > > diff --git a/drivers/gpu/drm/msm/msm_iommu.c
> > > b/drivers/gpu/drm/msm/msm_iommu.c
> > > index f455c597f76d..bd1d58229cc2 100644
> > > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > > @@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu,
> > > uint64_t iova,
> > >  		iova |= GENMASK_ULL(63, 49);
> > > 
> > > 
> > > +	if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
> > > +		prot |= IOMMU_SYS_CACHE_ONLY;
> > 
> > Given that I think this is the only user of IOMMU_SYS_CACHE_ONLY, then
> > it
> > looks like it should actually be a property on the domain because we
> > never
> > need to configure it on a per-mapping basis within a domain, and
> > therefore
> > it shouldn't be exposed by the IOMMU API as a prot flag.
> > 
> > Do you agree?
> > 
> 
> GPU being the only user is for now, but there are other clients which can
> use this.
> Plus how do we set the memory attributes if we do not expose this as prot
> flag?

I just don't understand the need for it to be per-map operation. Put another
way, if we extended the domain attribute to apply to cacheable mappings
on the domain and not just the table walk, what would break?

Will
