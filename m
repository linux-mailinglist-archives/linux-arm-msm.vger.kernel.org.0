Return-Path: <linux-arm-msm+bounces-30978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D996DEEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8580B1C2479F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B8119DF4F;
	Thu,  5 Sep 2024 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDjDFHIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E1D198E84;
	Thu,  5 Sep 2024 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551616; cv=none; b=oSD8/Mu4FtADulg3VokPp/HXgLcxv7KCXcRLnA9PeqGJ//365yHU4NwMgpvMR4c9GJ0EdAEiKiaVW5CYLnPX0U/XvLMP2fYVPgQLHuA6GgJeeNzD98UG5vmK1GDxYhQSh2dznCN87b6R5uwxq/otvB9ct3rUzXRKOX5CJu8mdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551616; c=relaxed/simple;
	bh=FT/uFKjMbwjJnnJkd4LrmJ5bCz++QM6QGQX26aS6/TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDPOSvdwHeOm9XYjIXjV6MI0I3zOSJ/ssYU0Nr4Wxc7bqZS8nbmtH3Z5bqEUt4pbT9RWxWsYE78Txs/UdDwi7Y28hmz1aKtC2Bp/r5E4pNHM+rZT87KvNCLSJp6Z4Igqfe5rHmV0UkqGWTEFPeLfdamcdok/5Z/WxxCAJ0oWppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDjDFHIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B99C4CEC3;
	Thu,  5 Sep 2024 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725551615;
	bh=FT/uFKjMbwjJnnJkd4LrmJ5bCz++QM6QGQX26aS6/TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDjDFHIMejDOYZ1VSD8UDbscVuMP/PSfJvjVNV/TYwbSKY+jz6Id69N9FhBr3jBFL
	 ar/EINT4oTP8C74poPjbEBjS27L4FT7w4XvUjhGyX1JSio4NZnr1BrW+Q4T5JRu/sj
	 U/CfocxCWVsJIH94pfS+4ul0tG9h2o5GjIwCjNoYjyVQZKXBKeJQO+OwRKkF9dOBw/
	 kbiE/M09Dlfqx7JsRlxUMqPwFfhzhA9Py9+/16RqfjhJTBrJKoAKZHs6ojWpYPUXd7
	 3dYiIDvpXRdSiVmgV1aAeHU8Ako29QCgEtmgXpvNjyeYvxgZHRgPtRKsPCs1ndZNia
	 Cv2U3508lueSA==
Date: Thu, 5 Sep 2024 16:53:30 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent
 unmap"
Message-ID: <20240905155330.GA15246@willie-the-truck>
References: <20240905124956.84932-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905124956.84932-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Rob,

On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> 
> It was causing gpu smmu faults on x1e80100.
> 
> I _think_ what is causing this is the change in ordering of
> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> this patch is supposed to work correctly in the face of other
> concurrent translations (to buffers unrelated to the one being
> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> stale data read back into the tlb.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)

Please can you try the diff below, instead?

Will

--->8

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d..0a32e9499e2c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
                /* Clear the remaining entries */
                __arm_lpae_clear_pte(ptep, &iop->cfg, i);
 
-               if (gather && !iommu_iotlb_gather_queued(gather))
+               if (!iommu_iotlb_gather_queued(gather))
                        for (int j = 0; j < i; j++)
                                io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
 

