Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664E42EBD5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 12:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbhAFL5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 06:57:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:55266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbhAFL5F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 06:57:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2EA323110;
        Wed,  6 Jan 2021 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609934184;
        bh=HZYnJAIuD9MMbAMSmu3ejZVLAS6WiLfiiShHiiBv4YU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZRA5wz6FMI5xfUbwYHZUwrrupsOg72i/wc8QiogubLx3JKzJGP+x4AsDTPYMRWZm9
         woKVVXY4n/oWYpj8n7NKPHpTUxnlXvkLQLUuRoRi52QQ1FLkYRj3IoRieZqvEDtAGy
         OPYJeQIPGPrcb4y+QFkbiBkvBPr4xyckxiic5aBMz3Dd3f1Uv6JSRX2iMbVDS9KXS3
         kqoWF/ZGIdVVu1X3nl+gk6qqKYSHvYcOYJixCW1leh3g4Sch3qFhbSuIgcQ7nKjd1r
         m48UxmDVDgIXhwMksWwKlLA+eudExTiJYZs7wTkcBUSfCE09RRZQ2g79ipJ1gGsLWi
         JdBBXRm8J1S4g==
Date:   Wed, 6 Jan 2021 11:56:16 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Allow non-coherent masters to use
 system cache
Message-ID: <20210106115615.GA1763@willie-the-truck>
References: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 24, 2020 at 12:10:07PM +0530, Sai Prakash Ranjan wrote:
> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> the memory type setting required for the non-coherent masters to use
> system cache. Now that system cache support for GPU is added, we will
> need to mark the memory as normal sys-cached for GPU to use system cache.
> Without this, the system cache lines are not allocated for GPU. We use
> the IO_PGTABLE_QUIRK_ARM_OUTER_WBWA quirk instead of a page protection
> flag as the flag cannot be exposed via DMA api because of no in-tree
> users.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7c9ea9d7874a..3fb7de8304a2 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -415,6 +415,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>  		else if (prot & IOMMU_CACHE)
>  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
> +		else if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
> +			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
> +				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>  	}

drivers/iommu/io-pgtable.c currently documents this quirk as applying only
to the page-table walker. Given that we only have one user at the moment,
I think it's ok to change that, but please update the comment.

We also need to decide on whether we want to allow the quirk to be passed
if the coherency of the page-table walker differs from the DMA device, since
we have these combinations:

	Coherent walker?	IOMMU_CACHE	IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
0:	N			0		0
1:	N			0		1
2:	N			1		0
3:	N			1		1
4:	Y			0		0
5:	Y			0		1
6:	Y			1		0
7:	Y			1		1

Some of them are obviously bogus, such as (7), but I don't know what to
do about cases such as (3) and (5).

Will
