Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946DE3BF7EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 12:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhGHKGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 06:06:33 -0400
Received: from 8bytes.org ([81.169.241.247]:33358 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231324AbhGHKGd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 06:06:33 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id F1134312; Thu,  8 Jul 2021 12:03:50 +0200 (CEST)
Date:   Thu, 8 Jul 2021 12:03:45 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH] iommu: qcom: Revert "iommu/arm: Cleanup resources in
 case of probe error path"
Message-ID: <YObNgSs+pd0nDfjG@8bytes.org>
References: <CGME20210705065703eucas1p2e89258a2fc286896b755047e06f514cb@eucas1p2.samsung.com>
 <20210705065657.30356-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705065657.30356-1-m.szyprowski@samsung.com>
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

Applied to iommu/fixes, thanks.
