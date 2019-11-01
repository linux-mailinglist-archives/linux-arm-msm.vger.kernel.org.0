Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9549BEC6AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 17:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbfKAQ2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 12:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfKAQ2a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 12:28:30 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 285742080F;
        Fri,  1 Nov 2019 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572625709;
        bh=AGQ8iiY4Sv5ExrC2tV2HF7L3Htvu/REfvE6er7pPcDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LWIoDTqvjr1SCA/3GbYgq+sLE9RAhMhlWeB1gGurTUZhTOIvM7KnkzLcVdTA5gedp
         uAwRBvfPV03Q9adG3rLnJwhDhpqJDlKRj+Wct6rHI3OlwDxhXDqNkRnLPE+CSK/k4r
         Fu02H3jtWb+tXTEXJgoOjKmVtX6ZO2qWHQZt38Ko=
Date:   Fri, 1 Nov 2019 16:28:24 +0000
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu: avoid pathological RPM behaviour for
 unmaps
Message-ID: <20191101162824.GB3603@willie-the-truck>
References: <20191031213102.17108-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031213102.17108-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 31, 2019 at 02:31:02PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When games, browser, or anything using a lot of GPU buffers exits, there
> can be many hundreds or thousands of buffers to unmap and free.  If the
> GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
> for each buffer, resulting 5-10 seconds worth of reprogramming the
> context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
> To the user it would appear that the system just locked up.
> 
> A simple solution is to use pm_runtime_put_autosuspend() instead, so we
> don't immediately suspend the SMMU device.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm-smmu.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 7c503a6bc585..5abc0d210d90 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -122,7 +122,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
>  static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>  {
>  	if (pm_runtime_enabled(smmu->dev))
> -		pm_runtime_put(smmu->dev);
> +		pm_runtime_put_autosuspend(smmu->dev);
>  }
>  
>  static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> @@ -1154,6 +1154,20 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  	/* Looks ok, so add the device to the domain */
>  	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
>  
> +	/*
> +	 * Setup an autosuspend delay to avoid bouncing runpm state.
> +	 * Otherwise, if a driver for a suspendend consumer device

I fixed this typo and applied with Robin's reviewed-by from before.

Will
