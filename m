Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D103BAE42
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 20:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhGDSTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 14:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhGDSTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 14:19:19 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15743C061574;
        Sun,  4 Jul 2021 11:16:43 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a13so19156312wrf.10;
        Sun, 04 Jul 2021 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=miJU8b04qqipglFSfedfahzFO5P9/VuRwGLqZ5UonxA=;
        b=sadO98ciWj/6FqhCdSiYXg7eS3ipmrZ2bwJ3FAXgaAhoWhBPzbV+zMvsaChj7gP23C
         XQOkPXd65OjjNPZV2rIXp01e4FU2+nPoiCNBvlXmy2xzEoywupkzZOOHdpEMUja8I8SE
         AJE1Z/TmWfXPFtm3dCvO+aBBikKGryJ02zyI6zQ36zWIn2xzpIZIyeDCldXgjbT0Z3OX
         d0Ixb1PoaQ7zDQxIMg2Xwg5ji1KII2FugaR6OkpGiUs883u0ABnlYYgHI0GJGopadw16
         0eEMhd+B6iHPdg/LHOnlapBeFV3jJ64GeQ7rTPEMVgyYkxIhrc5HS9fW1VCQyoyUniAI
         +daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=miJU8b04qqipglFSfedfahzFO5P9/VuRwGLqZ5UonxA=;
        b=W08uuuWMgjeNQBdSOV09z7qXqbvmAlYMgMgjsaA5PFKap5M6UeCCz9sTrdexUvb6mp
         c3s7q6TgrxBun48/2hbhi3TdgDz+Ko+ZWoWnHSaypuTMRFzXqibGsazNwg1cXkPal0LF
         htT6unqRmOkqb+3AYNgqrXK5ns/3cTP9a7OEkptCj87qsWDuTAw9PD5w6jxU9zlAXihQ
         YJeRqm2nkthL29AJYjumeisNYighNqrg8tMkkm//AMHuNBf4+rZ2dwq2hemnV6F4qJzt
         VwZLjPm9JRkQX+U/n5YIoUrYVFxKism7mAv/OdG7aiUGLH/B15ToCUABVgcar1cwpWD0
         2+ag==
X-Gm-Message-State: AOAM530BgXJYIfYb7By1ScgCIHr1QB4sLmFHLHTfu0RG4VC8UuQiqI69
        qgmrdTgjsRcIZYDwtM2L8sBI9z4bJv7taWK8N/w=
X-Google-Smtp-Source: ABdhPJybAZlml4By7IUmHm+CwJj4AogiRenrlTNVsLwz2P5TR+I4uckHpD3LeJoevYMRoITwkCKKpvPkU3Zix9MNJIY=
X-Received: by 2002:adf:f48e:: with SMTP id l14mr7294511wro.28.1625422601605;
 Sun, 04 Jul 2021 11:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com> <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
In-Reply-To: <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 4 Jul 2021 11:20:43 -0700
Message-ID: <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I suspect you are getting a dpu fault, and need:

https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/

I suppose Bjorn was expecting me to send that patch

BR,
-R

On Sun, Jul 4, 2021 at 5:53 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> I've had splash screen disabled on my RB3. However once I've enabled it,
> I've got the attached crash during the boot on the msm/msm-next. It
> looks like it is related to this particular set of changes.
>
> On 11/06/2021 00:44, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This picks up an earlier series[1] from Jordan, and adds additional
> > support needed to generate GPU devcore dumps on iova faults.  Original
> > description:
> >
> > This is a stack to add an Adreno GPU specific handler for pagefaults. The first
> > patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
> > a adreno-smmu-priv function hook to capture a handful of important debugging
> > registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
> > third patch to print more detailed information on page fault such as the TTBR0
> > for the pagetable that caused the fault and the source of the fault as
> > determined by a combination of the FSYNR1 register and an internal GPU
> > register.
> >
> > This code provides a solid base that we can expand on later for even more
> > extensive GPU side page fault debugging capabilities.
> >
> > v5: [Rob] Use RBBM_STATUS3.SMMU_STALLED_ON_FAULT to detect case where
> >      GPU snapshotting needs to avoid crashdumper, and check the
> >      RBBM_STATUS3.SMMU_STALLED_ON_FAULT in GPU hang irq paths
> > v4: [Rob] Add support to stall SMMU on fault, and let the GPU driver
> >      resume translation after it has had a chance to snapshot the GPUs
> >      state
> > v3: Always clear FSR even if the target driver is going to handle resume
> > v2: Fix comment wording and function pointer check per Rob Clark
> >
> > [1] https://lore.kernel.org/dri-devel/20210225175135.91922-1-jcrouse@codeaurora.org/
> >
> > Jordan Crouse (3):
> >    iommu/arm-smmu: Add support for driver IOMMU fault handlers
> >    iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault
> >      info
> >    drm/msm: Improve the a6xx page fault handler
> >
> > Rob Clark (2):
> >    iommu/arm-smmu-qcom: Add stall support
> >    drm/msm: devcoredump iommu fault support
> >
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  23 +++-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 110 +++++++++++++++++++-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  42 ++++++--
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  15 +++
> >   drivers/gpu/drm/msm/msm_gem.h               |   1 +
> >   drivers/gpu/drm/msm/msm_gem_submit.c        |   1 +
> >   drivers/gpu/drm/msm/msm_gpu.c               |  48 +++++++++
> >   drivers/gpu/drm/msm/msm_gpu.h               |  17 +++
> >   drivers/gpu/drm/msm/msm_gpummu.c            |   5 +
> >   drivers/gpu/drm/msm/msm_iommu.c             |  22 +++-
> >   drivers/gpu/drm/msm/msm_mmu.h               |   5 +-
> >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  50 +++++++++
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c       |   9 +-
> >   drivers/iommu/arm/arm-smmu/arm-smmu.h       |   2 +
> >   include/linux/adreno-smmu-priv.h            |  38 ++++++-
> >   15 files changed, 367 insertions(+), 21 deletions(-)
> >
>
>
> --
> With best wishes
> Dmitry
