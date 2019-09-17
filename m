Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5001AB53C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 19:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfIQRO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 13:14:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35272 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfIQRO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 13:14:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5152C6141C; Tue, 17 Sep 2019 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568740466;
        bh=KPApdWRaw2OmKudeMqawQk+7Yzce0DocCvu695xljqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mm1rHg4zBzUadJhYcyF5kHXMKemTZD1OJyAd+JMMd+a4hBhBQlb1akHGELzEgzwL5
         DWk+YbhFm2E1Y1Tb6vC7rh6Pv1uLZAjAZGeNqX4ZxqI3vd4I/yBA39uvz8OICelNvp
         iI724MHIKoti9zsKn3/4f8Q4zGNh2h+N3M1m8G2Q=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A89E602F2;
        Tue, 17 Sep 2019 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568740464;
        bh=KPApdWRaw2OmKudeMqawQk+7Yzce0DocCvu695xljqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a05G/4mws/6q2KltkkASuUeIdzH9HS74CP9q8yzkScoz8vWFUcCmQEI7nrNPbb4pp
         JdC8+kbTgbBrgj2lMiFt2+mrceCp2Ba4btn2D+RiiQJJ6NhY/eWzQcoR/M2mD+0zxW
         q4sxQRNtWd3R5NDn0KAZTIZSh2SoA5FAAfQCliQA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A89E602F2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 17 Sep 2019 11:14:20 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Drew Davenport <ddavenport@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Enrico Weigelt <info@metux.net>,
        Bruce Wang <bzwang@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/msm: Remove unused function arguments
Message-ID: <20190917171420.GB25762@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Drew Davenport <ddavenport@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Enrico Weigelt <info@metux.net>, Bruce Wang <bzwang@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20190916201154.212465-1-ddavenport@chromium.org>
 <CAF6AEGurXuCMj=bc5=9CwBqzNM_BKEaJupk+-V7=aYou=wgmDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGurXuCMj=bc5=9CwBqzNM_BKEaJupk+-V7=aYou=wgmDQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 16, 2019 at 01:34:55PM -0700, Rob Clark wrote:
> On Mon, Sep 16, 2019 at 1:12 PM Drew Davenport <ddavenport@chromium.org> wrote:
> >
> > The arguments related to IOMMU port name have been unused since
> > commit 944fc36c31ed ("drm/msm: use upstream iommu") and can be removed.
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> > ---
> > Rob, in the original commit the port name stuff was left intentionally.
> > Would it be alright to remove it now?
> 
> Upstream support for snapdragon has improved considerably since then,
> it's been at least a couple years since I've had to backport drm to a
> downstream android vendor kernel.  (And I think the downstream vendor
> kernel is getting closer to upstream.)  So I think we can drop things
> that were originally left in place to simplify backporting to vendor
> kernel.

Downstream has gotten close enough to the IOMMU API over the last few LTS
cycles and nearly everything outside of a2xx that can work on a modern
kernel will likely be using a arm-smmu-v2 or a MMU-500.  This code can happily
go.

> (Also, some of the regulator usage falls into this category.. at one
> point the downstream kernel modeled gdsc's as regulators, but upstream
> uses genpd.)

Downstream still uses regulators. If we ever needed to use a downstream kernel
for whatever reason we could easily hack them back in but I don't feel like this
is a likely scenario.

Jordan

> >
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++--------
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 10 ++--------
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 10 ++--------
> >  drivers/gpu/drm/msm/msm_gpu.c            |  5 ++---
> >  drivers/gpu/drm/msm/msm_gpummu.c         |  6 ++----
> >  drivers/gpu/drm/msm/msm_iommu.c          |  6 ++----
> >  drivers/gpu/drm/msm/msm_mmu.h            |  4 ++--
> >  7 files changed, 14 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 58b0485dc375..3165c2db2541 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -30,10 +30,6 @@
> >  #define CREATE_TRACE_POINTS
> >  #include "dpu_trace.h"
> >
> > -static const char * const iommu_ports[] = {
> > -               "mdp_0",
> > -};
> > -
> >  /*
> >   * To enable overall DRM driver logging
> >   * # echo 0x2 > /sys/module/drm/parameters/debug
> > @@ -725,8 +721,7 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
> >
> >         mmu = dpu_kms->base.aspace->mmu;
> >
> > -       mmu->funcs->detach(mmu, (const char **)iommu_ports,
> > -                       ARRAY_SIZE(iommu_ports));
> > +       mmu->funcs->detach(mmu);
> >         msm_gem_address_space_put(dpu_kms->base.aspace);
> >
> >         dpu_kms->base.aspace = NULL;
> > @@ -752,8 +747,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
> >                 return PTR_ERR(aspace);
> >         }
> >
> > -       ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
> > -                       ARRAY_SIZE(iommu_ports));
> > +       ret = aspace->mmu->funcs->attach(aspace->mmu);
> >         if (ret) {
> >                 DPU_ERROR("failed to attach iommu %d\n", ret);
> >                 msm_gem_address_space_put(aspace);
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > index 50711ccc8691..dda05436f716 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > @@ -157,10 +157,6 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
> >         }
> >  }
> >
> > -static const char * const iommu_ports[] = {
> > -       "mdp_port0_cb0", "mdp_port1_cb0",
> > -};
> > -
> >  static void mdp4_destroy(struct msm_kms *kms)
> >  {
> >         struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
> > @@ -172,8 +168,7 @@ static void mdp4_destroy(struct msm_kms *kms)
> >         drm_gem_object_put_unlocked(mdp4_kms->blank_cursor_bo);
> >
> >         if (aspace) {
> > -               aspace->mmu->funcs->detach(aspace->mmu,
> > -                               iommu_ports, ARRAY_SIZE(iommu_ports));
> > +               aspace->mmu->funcs->detach(aspace->mmu);
> >                 msm_gem_address_space_put(aspace);
> >         }
> >
> > @@ -524,8 +519,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
> >
> >                 kms->aspace = aspace;
> >
> > -               ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
> > -                               ARRAY_SIZE(iommu_ports));
> > +               ret = aspace->mmu->funcs->attach(aspace->mmu);
> >                 if (ret)
> >                         goto fail;
> >         } else {
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 91cd76a2bab1..f8bd0bfcf4b0 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -19,10 +19,6 @@
> >  #include "msm_mmu.h"
> >  #include "mdp5_kms.h"
> >
> > -static const char *iommu_ports[] = {
> > -               "mdp_0",
> > -};
> > -
> >  static int mdp5_hw_init(struct msm_kms *kms)
> >  {
> >         struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> > @@ -233,8 +229,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
> >                 mdp5_pipe_destroy(mdp5_kms->hwpipes[i]);
> >
> >         if (aspace) {
> > -               aspace->mmu->funcs->detach(aspace->mmu,
> > -                               iommu_ports, ARRAY_SIZE(iommu_ports));
> > +               aspace->mmu->funcs->detach(aspace->mmu);
> >                 msm_gem_address_space_put(aspace);
> >         }
> >  }
> > @@ -737,8 +732,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
> >
> >                 kms->aspace = aspace;
> >
> > -               ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
> > -                               ARRAY_SIZE(iommu_ports));
> > +               ret = aspace->mmu->funcs->attach(aspace->mmu);
> >                 if (ret) {
> >                         DRM_DEV_ERROR(&pdev->dev, "failed to attach iommu: %d\n",
> >                                 ret);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index a052364a5d74..122199af0381 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -838,7 +838,7 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
> >                 return ERR_CAST(aspace);
> >         }
> >
> > -       ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
> > +       ret = aspace->mmu->funcs->attach(aspace->mmu);
> >         if (ret) {
> >                 msm_gem_address_space_put(aspace);
> >                 return ERR_PTR(ret);
> > @@ -995,8 +995,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
> >         msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace, false);
> >
> >         if (!IS_ERR_OR_NULL(gpu->aspace)) {
> > -               gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu,
> > -                       NULL, 0);
> > +               gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
> >                 msm_gem_address_space_put(gpu->aspace);
> >         }
> >  }
> > diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> > index 34f643a0c28a..34980d8eb7ad 100644
> > --- a/drivers/gpu/drm/msm/msm_gpummu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> > @@ -21,14 +21,12 @@ struct msm_gpummu {
> >  #define GPUMMU_PAGE_SIZE SZ_4K
> >  #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
> >
> > -static int msm_gpummu_attach(struct msm_mmu *mmu, const char * const *names,
> > -               int cnt)
> > +static int msm_gpummu_attach(struct msm_mmu *mmu)
> >  {
> >         return 0;
> >  }
> >
> > -static void msm_gpummu_detach(struct msm_mmu *mmu, const char * const *names,
> > -               int cnt)
> > +static void msm_gpummu_detach(struct msm_mmu *mmu)
> >  {
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 8c95c31e2b12..ad58cfe5998e 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -23,16 +23,14 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> >         return 0;
> >  }
> >
> > -static int msm_iommu_attach(struct msm_mmu *mmu, const char * const *names,
> > -                           int cnt)
> > +static int msm_iommu_attach(struct msm_mmu *mmu)
> >  {
> >         struct msm_iommu *iommu = to_msm_iommu(mmu);
> >
> >         return iommu_attach_device(iommu->domain, mmu->dev);
> >  }
> >
> > -static void msm_iommu_detach(struct msm_mmu *mmu, const char * const *names,
> > -                            int cnt)
> > +static void msm_iommu_detach(struct msm_mmu *mmu)
> >  {
> >         struct msm_iommu *iommu = to_msm_iommu(mmu);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> > index 871d56303697..67a623f14319 100644
> > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > @@ -10,8 +10,8 @@
> >  #include <linux/iommu.h>
> >
> >  struct msm_mmu_funcs {
> > -       int (*attach)(struct msm_mmu *mmu, const char * const *names, int cnt);
> > -       void (*detach)(struct msm_mmu *mmu, const char * const *names, int cnt);
> > +       int (*attach)(struct msm_mmu *mmu);
> > +       void (*detach)(struct msm_mmu *mmu);
> >         int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
> >                         unsigned len, int prot);
> >         int (*unmap)(struct msm_mmu *mmu, uint64_t iova, unsigned len);
> > --
> > 2.20.1
> >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
