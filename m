Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731123D8FF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 16:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbhG1OBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 10:01:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233254AbhG1OBB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 10:01:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A326E600EF;
        Wed, 28 Jul 2021 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627480860;
        bh=sNNg1eBjaBERoOL+pNGqJG1GnXOiFtnWCHGA3ZA1guw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uSK3rYX334vCPmIzWf/THTX34yLnn8ni/QBiKG2wSaCIb8flS7V+h/B0eP4sytljM
         /dQCjspApub1KKi22poI11WUSYyfjIatH2hfq7qGrbqIBlbq4S7vAjAAhS+KS8TxV8
         5woiYW5ZUA5Il7RUYHhP1Ry/YyXRyBxz8Ox2BtJMlMkWsKjuc9kKYiDOiacib9sy0i
         aPfPMZkkYmDggAK37mahkCnICO1fDZeN0JaiIFzgSxGeXShgdXEF1DAYPxU22ln/Di
         kGzFe7xSqPBokwQ8jjNqfX2hYMIrPy1ah7XaTQx6UwViWPpfyLEfsPSfZ5MEsWr3Ps
         NAkXFU5X3exlg==
Date:   Wed, 28 Jul 2021 17:00:53 +0300
From:   Georgi Djakov <djakov@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        isaacm@codeaurora.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters to use
 system cache
Message-ID: <20210728140052.GB22887@mms-0441>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> the memory type setting required for the non-coherent masters to use
> system cache. Now that system cache support for GPU is added, we will
> need to set the right PTE attribute for GPU buffers to be sys cached.
> Without this, the system cache lines are not allocated for GPU.
> 
> So the patches in this series introduces a new prot flag IOMMU_LLC,
> renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> and makes GPU the user of this protection flag.

Hi Sai,

Thank you for the patchset! Are you planning to refresh it, as it does
not apply anymore?

Thanks,
Georgi

> 
> The series slightly depends on following 2 patches posted earlier and
> is based on msm-next branch:
>  * https://lore.kernel.org/patchwork/patch/1363008/
>  * https://lore.kernel.org/patchwork/patch/1363010/
> 
> Sai Prakash Ranjan (3):
>   iommu/io-pgtable: Rename last-level cache quirk to
>     IO_PGTABLE_QUIRK_PTW_LLC
>   iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
>   drm/msm: Use IOMMU_LLC page protection flag to map gpu buffers
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  drivers/gpu/drm/msm/msm_iommu.c         | 3 +++
>  drivers/gpu/drm/msm/msm_mmu.h           | 4 ++++
>  drivers/iommu/io-pgtable-arm.c          | 9 ++++++---
>  include/linux/io-pgtable.h              | 6 +++---
>  include/linux/iommu.h                   | 6 ++++++
>  7 files changed, 26 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 00fd44a1a4700718d5d962432b55c09820f7e709
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
