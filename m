Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59A139F26A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 11:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFHJcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 05:32:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:38292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhFHJcB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 05:32:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9446D61278;
        Tue,  8 Jun 2021 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623144603;
        bh=MhokyPxqdEzZc6RC+avxqxp0BKKYNFp7L+EMYDuA2a8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pnPVfHt9Tyl2Tb3E3ugOua/bzj+uG374ur35ZQ0HwbgRP+yx9Dz0uCaFhay5a9VoQ
         RL/1sm0Jnd1wp0hZU6D+iIdsFeSFPGxDzqxR3qFY6N0EBbOkl3hBrqLgPu+NFAu3ys
         Lk8/abZR2hXWtYG4qRJLS4BteETl12Lp1mO73vyuz3qbIY+uVRNp8dBUWZUbb43209
         TWH+1WZdJZukihn6qloH4L5LdtsSEsgoIZvUi4Hlbf+xZdo+AFib1dmj1uVLzWMgZR
         6zDqLCFCBOJp4vfxMiFFWZgjMk5HsXi+5n9Dzp0ZcDFHHQppk5Kep732yOLJXTcZz+
         +tBL3vyJdzEIw==
Date:   Tue, 8 Jun 2021 10:29:58 +0100
From:   Will Deacon <will@kernel.org>
To:     Amey Narkhede <ameynarkhede03@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Cleanup resources in case of probe error path
Message-ID: <20210608092958.GA8935@willie-the-truck>
References: <20210421221030.70647-1-ameynarkhede03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421221030.70647-1-ameynarkhede03@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 22, 2021 at 03:40:30AM +0530, Amey Narkhede wrote:
> If device registration fails, remove sysfs attribute
> and if setting bus callbacks fails, unregister the device
> and cleanup the sysfs attribute.
> 
> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 4294abe389b2..5fa128a1f7f0 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -850,10 +850,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to register iommu\n");
> -		return ret;
> +		goto err_sysfs_remove;
>  	}
> 
> -	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> +	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> +	if (ret)
> +		goto err_unregister_device;
> 
>  	if (qcom_iommu->local_base) {
>  		pm_runtime_get_sync(dev);
> @@ -862,6 +864,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	}
> 
>  	return 0;
> +
> +err_unregister_device:
> +	iommu_device_unregister(&qcom_iommu->iommu);
> +
> +err_sysfs_remove:
> +	iommu_device_sysfs_remove(&qcom_iommu->iommu);
> +
> +	return ret;

It looks like we're also missing this logic in arm-smmu/arm-smmu.c and
arm-smmu-v3/arm-smmu-v3.c. Would you be able to fix those up too, please?

Will
