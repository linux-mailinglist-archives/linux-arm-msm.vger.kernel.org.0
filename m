Return-Path: <linux-arm-msm+bounces-51155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CDBA5DD58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BF3817C328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2BE242906;
	Wed, 12 Mar 2025 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hM0qdPu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A262323E354;
	Wed, 12 Mar 2025 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784815; cv=none; b=tNR1DNZt2ce2URO5sGqaP3PboIPfqpderHMbixbIbYtaape086pLEb6Dlnob/MClOAClvCJpZeMkBv5Qysv9+/w/VDIf0gDFvoOwwa85g3wSw4G9kdVd4AT35mMGpKmXiLv6JCjztmMigI6V6L75CLdG0u1Ro8LwMqxGqFGIwRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784815; c=relaxed/simple;
	bh=O2MbGUz1AiD8KCTQch6ceIF+lKjOkrpw4sDNGkA2Mb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPJSJ2UHz010RBt59T4la4Tyu3OcL68Nzy9CvHQrfW8YZ7cga8V1+Vt3+zyFuaUwlPf4s3033CRh6yX4Tr/dwI6cFgaUtqVy21swO5q5ACTRgWkFpZbtGvaHb7xx7bVhN4tdy3jTE455iYNJR75yYKQrdr1dP0aIbs4jkayE0JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hM0qdPu3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19DFC4CEED;
	Wed, 12 Mar 2025 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784815;
	bh=O2MbGUz1AiD8KCTQch6ceIF+lKjOkrpw4sDNGkA2Mb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hM0qdPu3eaLS2K7B4XV8fay0UQdyPaaGyRjP+oWJlTLQfHtiBn14aq5of2bC/9kMt
	 ospDD7xqIHWdpRwMf3Txu72OGonBFTUtmrfCTypPf968pqTuKNDhidN4TEnbuYMzfm
	 lKW2z/g118BHuwC5sd/bnLKQR7+9RTNM39s2OEjdybhGeEhhImXOrBea9kS0nnQqJa
	 0fA/cwgrXi+dz0IN0qeJ8BaUFiqKv0jMYlAuJsKBbLLxK4AA+8aNa3W7qz67Lo0b/w
	 y6afGtTuYC+PgSN0BlV4ctcv5Jr5yQ553mjrKVr05NyYPKfMlIyLCo0oA9qxrul0g/
	 Zmo/iISH73Hvw==
Date: Wed, 12 Mar 2025 13:06:49 +0000
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
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
Message-ID: <20250312130648.GD6181@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
 <20250311180807.GC5216@willie-the-truck>
 <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
 <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 11, 2025 at 01:00:34PM -0700, Rob Clark wrote:
> On Tue, Mar 11, 2025 at 12:42 PM Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Tue, Mar 11, 2025 at 2:08 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> > > > In some cases drm/msm has to resume a stalled transaction directly in
> > > > its fault handler. Experimentally this doesn't work on SMMU500 if the
> > > > fault hasn't already been acknowledged by clearing FSR. Rather than
> > > > trying to clear FSR in msm's fault handler and implementing a
> > > > tricky handshake to avoid accidentally clearing FSR twice, we want to
> > > > clear FSR before calling the fault handlers, but this means that the
> > > > contents of registers can change underneath us in the fault handler and
> > > > msm currently uses a private function to read the register contents for
> > > > its own purposes in its fault handler, such as using the
> > > > implementation-defined FSYNR1 to determine which block caused the fault.
> > > > Fix this by making msm use the register values already read by arm-smmu
> > > > itself before clearing FSR rather than messing around with reading
> > > > registers directly.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
> > > >  3 files changed, 27 insertions(+), 27 deletions(-)
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635efb3968a0bd3ff237 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > > @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
> > > >       ARM_SMMU_DOMAIN_NESTED,
> > > >  };
> > > >
> > > > +struct arm_smmu_context_fault_info {
> > > > +     unsigned long iova;
> > > > +     u64 ttbr0;
> > > > +     u32 fsr;
> > > > +     u32 fsynr0;
> > > > +     u32 fsynr1;
> > > > +     u32 cbfrsynra;
> > > > +     u32 contextidr;
> > > > +};
> > > > +
> > > >  struct arm_smmu_domain {
> > > >       struct arm_smmu_device          *smmu;
> > > >       struct io_pgtable_ops           *pgtbl_ops;
> > > > @@ -380,6 +390,7 @@ struct arm_smmu_domain {
> > > >       const struct iommu_flush_ops    *flush_ops;
> > > >       struct arm_smmu_cfg             cfg;
> > > >       enum arm_smmu_domain_stage      stage;
> > > > +     struct arm_smmu_context_fault_info cfi;
> > >
> > > Does this mean we have to serialise all faults for a given domain? That
> > > can't be right...
> > >
> >
> > They are already serialized? There's only one of each register per
> > context bank, so you can only have one context fault at a time per
> > context bank, and AFAIK a context bank is 1:1 with a domain. Also this
> > struct is only written and then read inside the context bank's
> > interrupt handler, and you can only have one interrupt at a time, no?
> >
> > Connor
> 
> And if it was a race condition with cfi getting overridden, it would
> have already been an equivalent race condition currently when reading
> the values from registers (ie. the register values could have changed
> in the elapsed time)
> 
> So no additional serialization needed here.

Oops, yes, sorry. I've been spending too long on SMMUv3 and forgot how
the context banks worked.

Will

