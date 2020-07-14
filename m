Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A41321EB52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 10:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgGNI22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 04:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:56832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbgGNI22 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 04:28:28 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A18121897;
        Tue, 14 Jul 2020 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594715307;
        bh=pIHiPnXl29m/SBs4JyChDxAqMplo09HuFsHg6sAYMJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cca/sw3/jyus9ULYMXo0h2TBjV/Q+OEaM3QXhOQQN9gh0rzZoCsr+lXDNe1Y8FtjC
         zH6wIyiBUzvZMiMF+TML3mUUcwPbiqsXG5lRUNj51n2NEC/bHHPxfZLPDLXc90vJzT
         9YqF/zOe/+XKPeP1v7ljoCLfGG/EMIGPkjW39ynI=
Date:   Tue, 14 Jul 2020 09:28:21 +0100
From:   Will Deacon <will@kernel.org>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     joro@8bytes.org, robin.murphy@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
        robdclark@gmail.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, baolin.wang7@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Message-ID: <20200714082821.GC4516@willie-the-truck>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 12, 2020 at 11:39:55AM +0800, Baolin Wang wrote:
> Now the ARM page tables are always allocated by GFP_ATOMIC parameter,
> but the iommu_ops->map() function has been added a gfp_t parameter by
> commit 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map"),
> thus io_pgtable_ops->map() should use the gfp parameter passed from
> iommu_ops->map() to allocate page pages, which can avoid wasting the
> memory allocators atomic pools for some non-atomic contexts.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
>  drivers/iommu/arm-smmu-v3.c             |  2 +-
>  drivers/iommu/arm-smmu.c                |  2 +-
>  drivers/iommu/io-pgtable-arm-v7s.c      | 18 +++++++++---------
>  drivers/iommu/io-pgtable-arm.c          | 18 +++++++++---------
>  drivers/iommu/ipmmu-vmsa.c              |  2 +-
>  drivers/iommu/msm_iommu.c               |  2 +-
>  drivers/iommu/mtk_iommu.c               |  2 +-
>  drivers/iommu/qcom_iommu.c              |  2 +-
>  include/linux/io-pgtable.h              |  2 +-
>  10 files changed, 26 insertions(+), 26 deletions(-)

I was a bit nervous about us passing GFP_KERNEL with a spinlock held, but
it looks like you've checked all the callsites and it looks fine to me, so:

Acked-by: Will Deacon <will@kernel.org>

Joerg -- not sure what you want to do with this one, as it's likely to
conflict (trivially) with unrelated driver changes.

Will
