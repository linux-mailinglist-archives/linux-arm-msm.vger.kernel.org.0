Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54BF21A47F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 18:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgGIQOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 12:14:16 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:31295 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728122AbgGIQOP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 12:14:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594311254; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=/e4a8wMAdSV6hoIv60z68EueAnjMwjfv1t94V3tJoe0=; b=wbuVyI4ghgzrEKqqosBcSpw2OIE5JSTmBIck0vA0+boJRBG0iJpE7A/pWKcRo8pmcnj5BEwk
 7L0kuo952toTzbZPo9kxCy5b4T0OHXiOefhgeu+YUVRYMpfpcJhKJdImoHeZZzQIkrtIjpIw
 qDTH2k+56VOzNALtoxZlA6xP4Oc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f074248cd1b803e17b013b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 16:14:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AA9BC433B2; Thu,  9 Jul 2020 16:13:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D8A4C433C6;
        Thu,  9 Jul 2020 16:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D8A4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 9 Jul 2020 10:13:53 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCHv3 7/7] drm/msm/a6xx: Add support for using system
 cache(LLC)
Message-ID: <20200709161352.GC21059@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
 <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
 <20200703133732.GD18953@willie-the-truck>
 <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
 <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 09:04:49AM -0700, Rob Clark wrote:
> On Fri, Jul 3, 2020 at 7:53 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
> >
> > Hi Will,
> >
> > On 2020-07-03 19:07, Will Deacon wrote:
> > > On Mon, Jun 29, 2020 at 09:22:50PM +0530, Sai Prakash Ranjan wrote:
> > >> diff --git a/drivers/gpu/drm/msm/msm_iommu.c
> > >> b/drivers/gpu/drm/msm/msm_iommu.c
> > >> index f455c597f76d..bd1d58229cc2 100644
> > >> --- a/drivers/gpu/drm/msm/msm_iommu.c
> > >> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > >> @@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu,
> > >> uint64_t iova,
> > >>              iova |= GENMASK_ULL(63, 49);
> > >>
> > >>
> > >> +    if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
> > >> +            prot |= IOMMU_SYS_CACHE_ONLY;
> > >
> > > Given that I think this is the only user of IOMMU_SYS_CACHE_ONLY, then
> > > it
> > > looks like it should actually be a property on the domain because we
> > > never
> > > need to configure it on a per-mapping basis within a domain, and
> > > therefore
> > > it shouldn't be exposed by the IOMMU API as a prot flag.
> > >
> > > Do you agree?
> > >
> >
> > GPU being the only user is for now, but there are other clients which
> > can use this.
> > Plus how do we set the memory attributes if we do not expose this as
> > prot flag?
> 
> It does appear that the downstream kgsl driver sets this for basically
> all mappings.. well there is some conditional stuff around
> DOMAIN_ATTR_USE_LLC_NWA but it seems based on the property of the
> domain.  (Jordan may know more about what that is about.)  But looks
> like there are a lot of different paths into iommu_map in kgsl so I
> might have missed something.

Downstream does set it universally. There are some theoretical use cases
where it might be beneficial to set it on a per-mapping basis with a bunch
of hinting from userspace and nobody has tried to characterize this on real
hardware so it is not clear to me if it is worth it.

I think a domain wide attribute works for now but if a compelling per-mapping
use case does comes down the pipeline we need to have a backup in mind -
possibly a prot flag to disable NWA?

Jordan

> Assuming there isn't some case where we specifically don't want to use
> the system cache for some mapping, I think it could be a domain
> attribute that sets an io_pgtable_cfg::quirks flag
> 
> BR,
> -R

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
