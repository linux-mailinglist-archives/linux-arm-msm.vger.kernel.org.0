Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1E3BDBAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 18:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhGFQzS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 12:55:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229873AbhGFQzR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 12:55:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9105F61C2F;
        Tue,  6 Jul 2021 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625590359;
        bh=rHrA7JR1kuHRO2ObXygxNOXB6QH+LMH9XbYpS8HdJ9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=spoMXdtXvQawjGCgd1UmNPafDZ5jez0CvDeD3r8po/jkAIVhUdq7TptLXjdqWjlG6
         HLiMw3suvYCjfmlI+lwvjwDL+vID0oebjv+QzU+7k7sj+Ltlm4FUaMMBRee6Ty8opY
         gHNUHaBaLfuE3VnyrQMArpz+heloBAPlvq+rmH83zOtDuuImbpqQ8TuOwvEgfEhrXX
         xfv6nWk/s2df/LoIlJA93I0c3M8rggXgoZs4U6xH565bvMtHNMaQRMfrJshINRQTvI
         MNlvO3ARjb8gsYwjHQlKkgOMFX6A9tEs/LYUTBj0Bi3PvkVw+r+p3vORTvxPgKRKr7
         4hXPec9l829fQ==
Date:   Tue, 6 Jul 2021 17:52:34 +0100
From:   Will Deacon <will@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH] iommu: qcom: Revert "iommu/arm: Cleanup resources in
 case of probe error path"
Message-ID: <20210706165233.GB20750@willie-the-truck>
References: <CGME20210705065703eucas1p2e89258a2fc286896b755047e06f514cb@eucas1p2.samsung.com>
 <20210705065657.30356-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705065657.30356-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 05, 2021 at 08:56:57AM +0200, Marek Szyprowski wrote:
> QCOM IOMMU driver calls bus_set_iommu() for every IOMMU device controller,
> what fails for the second and latter IOMMU devices. This is intended and
> must be not fatal to the driver registration process. Also the cleanup
> path should take care of the runtime PM state, what is missing in the
> current patch. Revert relevant changes to the QCOM IOMMU driver until
> a proper fix is prepared.
> 
> This partially reverts commit 249c9dc6aa0db74a0f7908efd04acf774e19b155.
> 
> Fixes: 249c9dc6aa0d ("iommu/arm: Cleanup resources in case of probe error path")
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)

Thanks, Marek:

Acked-by: Will Deacon <will@kernel.org>

Joerg -- please can you pick this up as a fix?

Cheers,

Will

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 25ed444ff94d..021cf8f65ffc 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -849,12 +849,10 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to register iommu\n");
> -		goto err_sysfs_remove;
> +		return ret;
>  	}
>  
> -	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> -	if (ret)
> -		goto err_unregister_device;
> +	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
>  
>  	if (qcom_iommu->local_base) {
>  		pm_runtime_get_sync(dev);
> @@ -863,13 +861,6 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	}
>  
>  	return 0;
> -
> -err_unregister_device:
> -	iommu_device_unregister(&qcom_iommu->iommu);
> -
> -err_sysfs_remove:
> -	iommu_device_sysfs_remove(&qcom_iommu->iommu);
> -	return ret;
>  }
>  
>  static int qcom_iommu_device_remove(struct platform_device *pdev)
> -- 
> 2.17.1
> 
