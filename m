Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA0320D1E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 20:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbgF2Sou (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 14:44:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12999 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729236AbgF2Sot (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:44:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593456287; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SBDpthJsACP4X9l/XtUwp2evGNFSv28FhmlHvAnZ2bs=; b=StgK928NR4pT0FPc7pteJnKt51gq0EoSLeRK51KKlrdKfQoS7rA6xaZTRDB/bLdrRIq2Rhy3
 Y6PxJkjMxpo3/+8VWtxqbGHExtmJUnMK0/mGANTuNvUAeRDDjp37L5533RlXcmryEOr85BOv
 hC/A2AYo+p7Xlqa+wUQ+l/LO4Bc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5efa001ba3d8a4474330b27b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 14:52:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B4CDC433AF; Mon, 29 Jun 2020 14:52:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A262AC433C6;
        Mon, 29 Jun 2020 14:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A262AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 29 Jun 2020 08:52:04 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Takashi Iwai <tiwai@suse.de>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawn.guo@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>
Subject: Re: [Freedreno] [PATCH v9 6/7] drm/msm: Set the global virtual
 address range from the IOMMU domain
Message-ID: <20200629145203.GB25740@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Takashi Iwai <tiwai@suse.de>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-7-jcrouse@codeaurora.org>
 <CAF6AEGuNSAYNMG6CH6VMuyjiz5dfRoLWQ9OAFxPJrFmBrHe+Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuNSAYNMG6CH6VMuyjiz5dfRoLWQ9OAFxPJrFmBrHe+Wg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 27, 2020 at 10:10:14AM -0700, Rob Clark wrote:
> On Fri, Jun 26, 2020 at 1:01 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Use the aperture settings from the IOMMU domain to set up the virtual
> > address range for the GPU. This allows us to transparently deal with
> > IOMMU side features (like split pagetables).
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 +++++++++++--
> >  drivers/gpu/drm/msm/msm_iommu.c         |  7 +++++++
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 5db06b590943..3e717c1ebb7f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -192,9 +192,18 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
> >         struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> >         struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> >         struct msm_gem_address_space *aspace;
> > +       u64 start, size;
> >
> > -       aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> > -               0xffffffff - SZ_16M);
> > +       /*
> > +        * Use the aperture start or SZ_16M, whichever is greater. This will
> > +        * ensure that we align with the allocated pagetable range while still
> > +        * allowing room in the lower 32 bits for GMEM and whatnot
> > +        */
> > +       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> > +       size = iommu->geometry.aperture_end - start + 1;
> > +
> > +       aspace = msm_gem_address_space_create(mmu, "gpu",
> > +               start & GENMASK(48, 0), size);
> 
> hmm, I kinda think this isn't going to play well for the 32b gpus
> (pre-a5xx).. possibly we should add address space size to 'struct
> adreno_info'?

I checked and qcom-iommu sets the aperture correctly so this should be okay for
everybody. To be honest, I'm nots sure if we even need to mask the start to 49
bits. It seems that all of the iommu implementations do the right thing.  Of
course it would be worth a check if you have a 4xx handy.

> Or I guess it is always going to be the same for all devices within a
> generation?  So it could just be passed in to adreno_gpu_init()

We can do that easily if we are worried about it (see also: a2xx). I just
figured this might save us a bit of code.

> Hopefully that makes things smoother if we someday had more than 48bits..

We'll be at 49 bits for as far ahead as I can see. 49 bits has a special
meaning in the SMMU so it is a natural fit for the GPU hardware. If we change in
N generations we can just shift to a family specific function at that point.

Jordan

> BR,
> -R
> 
> >
> >         if (IS_ERR(aspace) && !IS_ERR(mmu))
> >                 mmu->funcs->destroy(mmu);
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 3a381a9674c9..1b6635504069 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -36,6 +36,10 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
> >         struct msm_iommu *iommu = to_msm_iommu(mmu);
> >         size_t ret;
> >
> > +       /* The arm-smmu driver expects the addresses to be sign extended */
> > +       if (iova & BIT_ULL(48))
> > +               iova |= GENMASK_ULL(63, 49);
> > +
> >         ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
> >         WARN_ON(!ret);
> >
> > @@ -46,6 +50,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
> >  {
> >         struct msm_iommu *iommu = to_msm_iommu(mmu);
> >
> > +       if (iova & BIT_ULL(48))
> > +               iova |= GENMASK_ULL(63, 49);
> > +
> >         iommu_unmap(iommu->domain, iova, len);
> >
> >         return 0;
> > --
> > 2.17.1
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
