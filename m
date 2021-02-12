Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972A6319CDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 11:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhBLKvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 05:51:23 -0500
Received: from 8bytes.org ([81.169.241.247]:55646 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230023AbhBLKvW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 05:51:22 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id D2EDC310; Fri, 12 Feb 2021 11:50:40 +0100 (CET)
Date:   Fri, 12 Feb 2021 11:50:39 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu: Add device name to iommu map/unmap trace events
Message-ID: <20210212105039.GG7302@8bytes.org>
References: <20210209123620.19993-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209123620.19993-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 09, 2021 at 06:06:20PM +0530, Sai Prakash Ranjan wrote:
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 5e7fe519430a..6064187d9bb6 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -87,6 +87,7 @@ struct iommu_domain {
>  	void *handler_token;
>  	struct iommu_domain_geometry geometry;
>  	void *iova_cookie;
> +	char dev_name[32];
>  };

No, definitly not. A domain is a device DMA address space which can be
used by more than one device. Just look at IOMMU groups with more than
one member device, in this case just one device name would be very
misleading.

Regards,

	Joerg
