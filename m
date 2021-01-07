Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A49F2ED578
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 18:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbhAGRZS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 12:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbhAGRZS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 12:25:18 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC154C0612F4;
        Thu,  7 Jan 2021 09:24:37 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id y23so6220752wmi.1;
        Thu, 07 Jan 2021 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMvmEFBpjy2So792rxW7fyxN8VfuxztLpgDX8jgcy6g=;
        b=ry1v3bCYDlpd2lmszzoxlNXPjCZ2xQdciyO/IvfSSz4lAU8CddtrK78CtbZxzYt8Lk
         52R/W8yqwNTtRPdn/lWQ+/H7BRfL+fe37DtNZA3XuXZr4+78RJRnKOTx3aKlW7MdCeaU
         y4JZYt+SrOXX0QsJKEGyRoP6UsYmjY1ocGDHdXyNE3iz2Dal+e5npt/tUOQAQgq3Siim
         kLaGP0wdqbWZEABtmAYctA43t9R8LyMGurVvvKLuha9R+SZe72SouUEyQGVlYUkYMWeD
         /3gPrWRa5B9FFU6H1M99v5jawKbG50WZmrmnZhhI55f13Crxz70f5x2b9JxXFYJ3nY0o
         PG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMvmEFBpjy2So792rxW7fyxN8VfuxztLpgDX8jgcy6g=;
        b=OP81mQMeu+zUr3IhFl5+NWOTU9/mtkWBRWRY7SxMLlHIZQnke4xKudBpV95ikh67eS
         yEJpkNPTO4nDBOq2B3y2Ea/swxLv3TI2RNp/Z9Ul8kxTptsDlUppgdXHVpWhkOawozmA
         3NGQX7eYa1bV/eYreTH0WcbUjfenbFsGEClJ24W23+SuAwpT2bQNSrBeI12NXwjNAeoy
         e7+EF0oQ6jAnvAh9kQHXKoeT2vjQeiDXgqTVZyFIdwO8JEPRjzf/fluojCGiThHN9upc
         /DF8SxlCUL+rJtHgy7Wx6u6io/mdZcEPFIPTImkwF/gw5FPDa0nRvbIi23Q5ZzcDoI4s
         +qLg==
X-Gm-Message-State: AOAM532j9F7k4dzD86ZZElvY0GWX8hY0UG9MV56W4k0uptXF4rq6Ocdz
        OvWzcx9cMMup2C48zPMbBdPOX8QIsOvKBpnz5Yo=
X-Google-Smtp-Source: ABdhPJxy4Gz9DrRlqVSC+vptof6zKhnSJC7xeTi8iOASRVcGnhavBZazzRnX/a1jbGitOVKzKmABDLKRQXJLlyuiuAw=
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr8930405wmh.123.1610040276433;
 Thu, 07 Jan 2021 09:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20210104193044.80591-1-konrad.dybcio@somainline.org> <8847b190c9d03afd731881689d9b28d3@codeaurora.org>
In-Reply-To: <8847b190c9d03afd731881689d9b28d3@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 7 Jan 2021 09:26:54 -0800
Message-ID: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 6, 2021 at 8:50 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2021-01-05 01:00, Konrad Dybcio wrote:
> > Using this code on A5xx (and probably older too) causes a
> > smmu bug.
> >
> > Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system
> > cache(LLC)")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > Tested-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org>
> > ---
>
> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++---------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
> >  2 files changed, 17 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 6cf9975e951e..f09175698827 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -191,8 +191,6 @@ adreno_iommu_create_address_space(struct msm_gpu
> > *gpu,
> >               struct platform_device *pdev)
> >  {
> >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > -     struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > -     struct io_pgtable_domain_attr pgtbl_cfg;
> >       struct iommu_domain *iommu;
> >       struct msm_mmu *mmu;
> >       struct msm_gem_address_space *aspace;
> > @@ -202,13 +200,18 @@ adreno_iommu_create_address_space(struct msm_gpu
> > *gpu,
> >       if (!iommu)
> >               return NULL;
> >
> > -     /*
> > -      * This allows GPU to set the bus attributes required to use system
> > -      * cache on behalf of the iommu page table walker.
> > -      */
> > -     if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> > -             pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> > -             iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG,
> > &pgtbl_cfg);
> > +
> > +     if (adreno_is_a6xx(adreno_gpu)) {
> > +             struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > +             struct io_pgtable_domain_attr pgtbl_cfg;
> > +             /*
> > +             * This allows GPU to set the bus attributes required to use system
> > +             * cache on behalf of the iommu page table walker.
> > +             */
> > +             if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
> > +                     pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> > +                     iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG,
> > &pgtbl_cfg);
> > +             }

I'm applying for -fixes as this is an obvious problem..  But kinda
thinking that we should try to move it into an a6xx specific
create_address_space() (or wrapper for the generic fxn)

Sai/Jordan, could I talk one of you into trying to clean this up
better for next cycle?

BR,
-R

> >       }
> >
> >       mmu = msm_iommu_new(&pdev->dev, iommu);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index 4574d85c5680..08421fa54a50 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -226,6 +226,11 @@ static inline int adreno_is_a540(struct adreno_gpu
> > *gpu)
> >       return gpu->revn == 540;
> >  }
> >
> > +static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
> > +{
> > +     return ((gpu->revn < 700 && gpu->revn > 599));
> > +}
> > +
> >  static inline int adreno_is_a618(struct adreno_gpu *gpu)
> >  {
> >         return gpu->revn == 618;
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
