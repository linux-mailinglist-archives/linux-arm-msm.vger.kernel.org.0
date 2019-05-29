Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85DF62DDAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 15:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfE2NGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 09:06:04 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:45672 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726613AbfE2NGE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 09:06:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC4BEA78;
        Wed, 29 May 2019 06:06:03 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEA1C3F59C;
        Wed, 29 May 2019 06:06:01 -0700 (PDT)
Date:   Wed, 29 May 2019 14:05:59 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] iommu/arm-smmu: Avoid constant zero in TLBI writes
Message-ID: <20190529130559.GB11023@fuggles.cambridge.arm.com>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 29, 2019 at 01:55:48PM +0200, Marc Gonzalez wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Apparently, some Qualcomm arm64 platforms which appear to expose their
> SMMU global register space are still, in fact, using a hypervisor to
> mediate it by trapping and emulating register accesses. Sadly, some
> deployed versions of said trapping code have bugs wherein they go
> horribly wrong for stores using r31 (i.e. XZR/WZR) as the source
> register.

^^^
This should be in the comment instead of "qcom bug".

> While this can be mitigated for GCC today by tweaking the constraints
> for the implementation of writel_relaxed(), to avoid any potential
> arms race with future compilers more aggressively optimising register
> allocation, the simple way is to just remove all the problematic
> constant zeros. For the write-only TLB operations, the actual value is
> irrelevant anyway and any old nearby variable will provide a suitable
> GPR to encode. The one point at which we really do need a zero to clear
> a context bank happens before any of the TLB maintenance where crashes
> have been reported, so is apparently not a problem... :/

Hmm. It would be nice to understand this a little better. In which cases
does XZR appear to work?

> Reported-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> Changes from v1:
> - Tweak commit message (remove "compilers", s/hangs/crashes)
> - Add a comment before writel_relaxed
> ---
>  drivers/iommu/arm-smmu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 5e54cc0a28b3..3f352268fa8b 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -423,7 +423,8 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
>  {
>  	unsigned int spin_cnt, delay;
>  
> -	writel_relaxed(0, sync);
> +	/* Write "garbage" (rather than 0) to work around a qcom bug */
> +	writel_relaxed((unsigned long)sync, sync);
>  	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
>  		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
>  			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
> @@ -1763,8 +1764,9 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	}
>  
>  	/* Invalidate the TLB, just in case */
> -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
> -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
> +	/* Write "garbage" (rather than 0) to work around a qcom bug */
> +	writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_TLBIALLH);
> +	writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);

Any reason not to make these obviously dummy values e.g.:

	/*
	 * Text from the commit message about broken hypervisor
	 */
	#define QCOM_DUMMY_VAL_NOT_XZR	~0U

That makes the callsites much easier to understand and I doubt there's a
performance impact from allocating an extra register here.

Will
