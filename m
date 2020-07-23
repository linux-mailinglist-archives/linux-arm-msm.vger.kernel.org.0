Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A3922ADD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 13:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgGWLg7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 07:36:59 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:54567 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725846AbgGWLg7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 07:36:59 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0U3a0ySa_1595504212;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0U3a0ySa_1595504212)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 23 Jul 2020 19:36:52 +0800
Date:   Thu, 23 Jul 2020 19:36:52 +0800
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
To:     Will Deacon <will@kernel.org>
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
Message-ID: <20200723113652.GA104096@VM20190228-100.tbsite.net>
Reply-To: Baolin Wang <baolin.wang@linux.alibaba.com>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
 <20200714082821.GC4516@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714082821.GC4516@willie-the-truck>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 14, 2020 at 09:28:21AM +0100, Will Deacon wrote:
> On Fri, Jun 12, 2020 at 11:39:55AM +0800, Baolin Wang wrote:
> > Now the ARM page tables are always allocated by GFP_ATOMIC parameter,
> > but the iommu_ops->map() function has been added a gfp_t parameter by
> > commit 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map"),
> > thus io_pgtable_ops->map() should use the gfp parameter passed from
> > iommu_ops->map() to allocate page pages, which can avoid wasting the
> > memory allocators atomic pools for some non-atomic contexts.
> > 
> > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
> >  drivers/iommu/arm-smmu-v3.c             |  2 +-
> >  drivers/iommu/arm-smmu.c                |  2 +-
> >  drivers/iommu/io-pgtable-arm-v7s.c      | 18 +++++++++---------
> >  drivers/iommu/io-pgtable-arm.c          | 18 +++++++++---------
> >  drivers/iommu/ipmmu-vmsa.c              |  2 +-
> >  drivers/iommu/msm_iommu.c               |  2 +-
> >  drivers/iommu/mtk_iommu.c               |  2 +-
> >  drivers/iommu/qcom_iommu.c              |  2 +-
> >  include/linux/io-pgtable.h              |  2 +-
> >  10 files changed, 26 insertions(+), 26 deletions(-)
> 
> I was a bit nervous about us passing GFP_KERNEL with a spinlock held, but
> it looks like you've checked all the callsites and it looks fine to me, so:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- not sure what you want to do with this one, as it's likely to
> conflict (trivially) with unrelated driver changes.

Thanks Will. Joerg, could you apply this 2 patches if no objection from
your side? Thanks.

