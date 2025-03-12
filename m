Return-Path: <linux-arm-msm+bounces-51154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52627A5DD5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5047D7AC86A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FF524501D;
	Wed, 12 Mar 2025 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCKBd0Ii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8081DB124;
	Wed, 12 Mar 2025 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784745; cv=none; b=J/NhC3ytba/pp5u1vqwvgiBW1mHf93FinEu5g6/F8QjfAoGo4PZZoMecOOOxDpVumeuNtkKyWVvstKc8G4YRPIXuQ7/uawPXdLD9YauyTFALkMupaIGmmP6a96hQ+vPZt6aBl9f4Zc6RuOsGJvJpJ91YNRUOOX35LXpiG1nUtY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784745; c=relaxed/simple;
	bh=tQxLHaC5IOJlSNyEQXOM0hkci8JPuwjdb8elPNaj8+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgYrVNHkNF7ZXZJ31nMzh0YpvOlF9MQVC7VuLDISKqDmmTk4SbR5P7tUQtZzwA8hbAzonwSj04WOl2c/hq8ETPPj2BfQ6YUg84JKo/qYqyZe3hJOuZkF6VI4qBsls8ZTHKGi2jI0BHHHrBViYNO5yGvVYOoEs2MHz+t4ltFLtZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCKBd0Ii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14095C4CEE3;
	Wed, 12 Mar 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784744;
	bh=tQxLHaC5IOJlSNyEQXOM0hkci8JPuwjdb8elPNaj8+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCKBd0Ii3zEWKe0hu2rFrehNCnSbNl7NHa4XzoYQbrTSXnQHxgRneTQPVxT5lRntP
	 TYorVyRqBbBmpKOzYQw5AX2an7nJvrOujEoWALPxjV1SEkrAhDFUl9v7ZEQsnFwwrx
	 mu2whHpwcubaL+8XLy6nnhjcSKYe6KnrxAE4LbGJ6DPAHQEyx4vE9aRK4pT3aRhU8H
	 jMH0e2soV0CDPRQ+eMcLA6kB0NgcdAY90mg6PmfzKgyAJUnU1EZZfMXVHL5frieL+F
	 NvvYKMhH46k2B/XcpfNkjXfzujhDquSqyLz+kTMOjOa07+B4DoaoQpcVUTxGX6wjtR
	 dnmVfrwUZy3QQ==
Date: Wed, 12 Mar 2025 13:05:38 +0000
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250312130525.GC6181@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > This will be used by drm/msm for GPU page faults, replacing the manual
> > > register reading it does.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> > >  3 files changed, 21 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a39866a932360d4e 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
> > >
> > >       if (list_empty(&tbu_list)) {
> > >               ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > > -                                      cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > >
> > >               if (ret == -ENOSYS)
> > >                       arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> > > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
> > >       phys_soft = ops->iova_to_phys(ops, cfi.iova);
> > >
> > >       tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > >       if (!tmp || tmp == -EBUSY) {
> > >               ret = IRQ_HANDLED;
> > >               resume = ARM_SMMU_RESUME_TERMINATE;
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > >                                     struct arm_smmu_context_fault_info *cfi)
> > >  {
> > >       cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> > >       cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> >
> > We already have an implementation hook (->get_fault_info()) which the
> > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > That thing dumps these registers already so if we're moving that into
> > the core SMMU driver, let's get rid of the hook and move everybody over
> > rather than having it done in both places.
> 
> As you probably saw, the next commit moves over
> qcom_adreno_smmu_get_fault_info() to use this. The current back door
> used by drm/msm to access these functions is specific to adreno_smmu
> and there isn't an equivalent interface to allow it to call a generic
> SMMU function so it isn't possible to move it entirely to the core. At
> least not without a bigger refactoring that isn't justified for this
> series that is just trying to fix things.

Ok :(

> > >       cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
> >
> > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > it for stage-2 domains.
> >
> Does it matter if we read the register though, as long as users are
> aware of this and don't use its value for anything?

I think the contents are "UNKNOWN", so it could be hugely confusing even
if they just got logged someplace. Why is it difficult to avoid touching
it for stage-2?

Will

