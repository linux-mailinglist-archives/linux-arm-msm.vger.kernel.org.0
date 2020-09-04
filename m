Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61AF25D458
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 11:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgIDJLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 05:11:22 -0400
Received: from 8bytes.org ([81.169.241.247]:40892 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729950AbgIDJLV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 05:11:21 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 4466F3D5; Fri,  4 Sep 2020 11:11:19 +0200 (CEST)
Date:   Fri, 4 Sep 2020 11:11:17 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <jroedel@suse.de>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Takashi Iwai <tiwai@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH 00/20] iommu/arm-smmu + drm/msm: per-process GPU pgtables
Message-ID: <20200904091117.GH6714@8bytes.org>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 17, 2020 at 03:01:25PM -0700, Rob Clark wrote:
> Jordan Crouse (12):
>   iommu/arm-smmu: Pass io-pgtable config to implementation specific
>     function
>   iommu/arm-smmu: Add support for split pagetables
>   iommu/arm-smmu: Prepare for the adreno-smmu implementation
>   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
>   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>   drm/msm: Add a context pointer to the submitqueue
>   drm/msm: Drop context arg to gpu->submit()
>   drm/msm: Set the global virtual address range from the IOMMU domain
>   drm/msm: Add support to create a local pagetable
>   drm/msm: Add support for private address space instances
>   drm/msm/a6xx: Add support for per-instance pagetables
>   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> 
> Rob Clark (8):
>   drm/msm: remove dangling submitqueue references
>   iommu: add private interface for adreno-smmu
>   drm/msm/gpu: add dev_to_gpu() helper
>   drm/msm: set adreno_smmu as gpu's drvdata
>   iommu/arm-smmu: constify some helpers
>   arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
>   iommu/arm-smmu: add a way for implementations to influence SCTLR
>   drm/msm: show process names in gem_describe

Can the DRM parts be merged independently from the IOMMU parts or does
this need to be queued together? If it needs to be together I defer the
decission to Will through which tree this should go.


	Joerg
