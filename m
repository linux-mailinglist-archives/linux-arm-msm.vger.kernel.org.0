Return-Path: <linux-arm-msm+bounces-51150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D1A5DD10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9ED3162B9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8846422D7A0;
	Wed, 12 Mar 2025 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzcrEexW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C57083C;
	Wed, 12 Mar 2025 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741783755; cv=none; b=Eo7Odkk1Wtw53Qg946GMzx39H4AlWupoSXqtxVeVzGxUGHer5AVPdtv8/u4HFHeGj+Ga6mLYxKPvoPnyljYflDIzMdLDCBcHz5s00DQ5k3m47Rn6r3N+5873OC3CnCzvPP3DVE1lEMKFxeTQS5S6Pzx8p/9fIRMq5l6I7qa/WIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741783755; c=relaxed/simple;
	bh=dfdp7jDZ0vczWicV98qL8t8i5nsr3pUJL41Jt9xcYb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htIjrOhdXt5aPOloaDa3hcK3Ys1Vfym+JML+EB0BMx6eP26ORULpwSJuS6I2ZHQfL3wsE26L5fNYEzoEPn1a5/n+DYHHA56vTIcuz4nfmY5SKZBtsajvL78ZulA9AVf4kftX4jHD5GPVClMGql6FxJRnyY/W3JInpNcswQzgUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzcrEexW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6B0C4CEE3;
	Wed, 12 Mar 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783753;
	bh=dfdp7jDZ0vczWicV98qL8t8i5nsr3pUJL41Jt9xcYb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MzcrEexW1Uq5X9xFZ2C88IB2Rs845+641MspHD5X+o9/iTiqId8Fh8Zdzu7kJlgIc
	 v9gb0jSRb5RhF0TpHMEh3eHhTBsGF9kw+z9Yws/2xkLWYv6DViH1cDddLdiB/m0kIh
	 PhiKPtJwmg4BNhNR0RkoOs5GWGeKO1cjYkIor1eADvCbXu+33jjJya1SRrlsgkNRSp
	 ACVXvP5N64UjotAqZtNtFTbI/jT5f6d9rc5O5s1D/IW9tVHw6Cd+atdG6/3I1lF4eu
	 s2QmSPv575FX50LjaOJypuZsAHISeJeYl4oE18Cugq85bt5mDukqUNyGqhdNkHPbGk
	 zEYLeDhuxYIqg==
Date: Wed, 12 Mar 2025 12:49:08 +0000
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
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Message-ID: <20250312124907.GB6181@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck>
 <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
> On Tue, Mar 11, 2025 at 2:11 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > > Up until now we have only called the set_stall callback during
> > > initialization when the device is off. But we will soon start calling it
> > > to temporarily disable stall-on-fault when the device is on, so handle
> > > that by checking if the device is on and writing SCTLR.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
> > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce72f48e3b38474da2 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
> > >  {
> > >       struct arm_smmu_domain *smmu_domain = (void *)cookie;
> > >       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> > > -     struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
> > > +     struct arm_smmu_device *smmu = smmu_domain->smmu;
> > > +     struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> > > +     u32 mask = BIT(cfg->cbndx);
> > > +     bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
> > > +     unsigned long flags;
> > >
> > >       if (enabled)
> > > -             qsmmu->stall_enabled |= BIT(cfg->cbndx);
> > > +             qsmmu->stall_enabled |= mask;
> > >       else
> > > -             qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
> > > +             qsmmu->stall_enabled &= ~mask;
> > > +
> > > +     /*
> > > +      * If the device is on and we changed the setting, update the register.
> > > +      */
> > > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> > > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > > +
> > > +             u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> > > +
> > > +             if (enabled)
> > > +                     reg |= ARM_SMMU_SCTLR_CFCFG;
> > > +             else
> > > +                     reg &= ~ARM_SMMU_SCTLR_CFCFG;
> > > +
> > > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
> >
> > Are you sure you don't need TLB invalidation for this to take effect? I
> > think some fields in the SCTLR can be cached in the TLB but you'll need
> > to check whether or not that applies to CFCFG.
> >
> 
> I think it should be fine because CFCFG only controls behavior when
> there's a context fault and there can't be TLB entries for entries
> that cause a context fault: "The architecture permits the caching of
> any translation table entry that has been returned from memory without
> a fault and that does not, as a result of that entry, cause a
> Translation Fault or an Access Flag fault."

Ok, but what about other types of fault? For example, a permission fault
or an address size fault?

Will

