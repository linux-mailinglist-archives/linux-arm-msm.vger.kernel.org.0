Return-Path: <linux-arm-msm+bounces-51172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168ECA5E1FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FA243AFB9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 16:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB211D63D8;
	Wed, 12 Mar 2025 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ3wvFgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897218D643;
	Wed, 12 Mar 2025 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741798063; cv=none; b=h8GedXYy1VtiIPi9C48lMoxSmD23z4ZRGNldABa/8WHx1LapKngDIFuOXvbfI0EnwzKtGhtPeKbi9QespJm22tg+jA+jdRtZFyK/NVnKwdEYn9d0v2j/E7eOkiYsaw2N5cV/JkbWSm8LHgJCWYd/w45/wJUPiox4le/2YeKLhvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741798063; c=relaxed/simple;
	bh=ELSEo0D7KcKhySYOIqk4yKTpqKUpc0DRoOc04z68Nyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHURSjQXbw0/Ud7Ydvba1z+Fg1tVx5ReR02Z4My7a2EFnvvgIOGCQAZunWNI2r1ENVqlmbRiTLsn8k1Pq7L41qoeK4zrD4jr7tEC3FlbYP2JMSI/TT1tuOqys3UuA6h965vSq0fbs2tTghh2Tw21CWfn6ymp73cHDVoV4gThLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ3wvFgR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94A1C4CEDD;
	Wed, 12 Mar 2025 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741798063;
	bh=ELSEo0D7KcKhySYOIqk4yKTpqKUpc0DRoOc04z68Nyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ3wvFgRU+05Re8+zMFHdJQyGysGsqfW9WFRtbywXLUgpmxuH26PtWMJIOQ3AagEX
	 jHaMqDtG8Phx4NJ1N2ujNKN3rxoAEJZ8oiaP2MdnGKQhFHgdO3908ga5pUtftOqiKh
	 mY+KgrgaNokT9UYHN6EWHpcfZQVYqhdc7ue+fbwaMehUSPkiFvgXozJcdiPOXWpdxN
	 yiix2EyQfDaA2j9Jt2KP2bObjrrzX4O14ZCk1paF7R4qAHOSULtXEbQ/O5NqeXjTQM
	 VzJxD/annxVwCotkTPXFThqgYDNqNI7crJlrK9Kh95zzZ8UWSVFa9rvjLcWU4PbVZY
	 y4/cCZmfNf0Lg==
Date: Wed, 12 Mar 2025 16:47:36 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250312164735.GA6561@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
 <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> On Wed, Mar 12, 2025 at 6:05 AM Will Deacon <will@kernel.org> wrote:
> > On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > > On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
> > > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > > > >                                     struct arm_smmu_context_fault_info *cfi)
> > > > >  {
> > > > >       cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > > > +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> > > > >       cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > > > -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > > > +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > > > +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> > > >
> > > > We already have an implementation hook (->get_fault_info()) which the
> > > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > > > That thing dumps these registers already so if we're moving that into
> > > > the core SMMU driver, let's get rid of the hook and move everybody over
> > > > rather than having it done in both places.
> > >
> > > As you probably saw, the next commit moves over
> > > qcom_adreno_smmu_get_fault_info() to use this. The current back door
> > > used by drm/msm to access these functions is specific to adreno_smmu
> > > and there isn't an equivalent interface to allow it to call a generic
> > > SMMU function so it isn't possible to move it entirely to the core. At
> > > least not without a bigger refactoring that isn't justified for this
> > > series that is just trying to fix things.
> >
> > Ok :(
> >
> > > > >       cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > > > +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
> > > >
> > > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > > > it for stage-2 domains.
> > > >
> > > Does it matter if we read the register though, as long as users are
> > > aware of this and don't use its value for anything?
> >
> > I think the contents are "UNKNOWN", so it could be hugely confusing even
> > if they just got logged someplace. Why is it difficult to avoid touching
> > it for stage-2?
> >
> Fwiw, we are only ever using stage-1

Sure, but this is in arm-smmu.c which is used by other people and supports
both stages.

Will

