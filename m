Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10592FCAAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 06:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbhATFU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 00:20:28 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:33962 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbhATFTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 00:19:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611119961; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=elqg9TnQqVo3z+rjCzoXTDJ/nWUGnhtMTJRsONyCrT4=;
 b=awHetKhwpcZ0LJiBuu2CaN9PbuDl4Z/pqd0ngAcI9x0bWQ36qOcOnWzANQ6nZjBpEoamNxDG
 D5DCC8CAl7aQykJN3V8Ku9rHHyE+710+kaDqBUfP6mcqejOiSBS1/W5gYjfFPeFC0yQ/NCEs
 qvMaj5dpTJdrAE4kOmZUbYKTDEE=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6007bd3b75e5c01cba52c748 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Jan 2021 05:18:51
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25F3EC43470; Wed, 20 Jan 2021 05:18:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52F8BC43464;
        Wed, 20 Jan 2021 05:18:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Jan 2021 10:48:50 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        isaacm@codeaurora.org
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters to use
 system cache
In-Reply-To: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <3e6ec220c07bcf91fae0985e1798f7a1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-11 19:45, Sai Prakash Ranjan wrote:
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


Gentle Ping!

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
