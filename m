Return-Path: <linux-arm-msm+bounces-58735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE334ABDF5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAF04161D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AD222D4DC;
	Tue, 20 May 2025 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pa3eJuRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB21FFC54;
	Tue, 20 May 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755542; cv=none; b=CjPukZX0cGEz9DJ0mp8wgj5jAuWEIF+QIOKZWE7xLM8md0U2VG2SmjU8MsiG3GX7uOIZ1ldm37jEBjofB1Nj/EQucvgF1KoUegxo79+09I/7ecZzMJ0fnd9y4TS/8WdtWef8lEjkmLyqne6Wuw1MIchhk1d6scMAvrkAvvanSHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755542; c=relaxed/simple;
	bh=sKOxL3UnucR2I5+tf+DEeVyHpzBBe8EpNpF/XVuowao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOty0uRDGVXBmqoYwCchbRPtgaDjGTm9wR/d7ySLFeFb+W1FCcOhz2UNhYU0DT75HQ2GrOLJX/sa1fWgVt9H203QnvPRoVr7WcV/qh0pRlRvsEOLCdbUj753EjB/a75duHSG9phbzUEnQiNJQGbqpV7UUmTawWHDThsWkV9/RVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pa3eJuRk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7D9C4CEE9;
	Tue, 20 May 2025 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755541;
	bh=sKOxL3UnucR2I5+tf+DEeVyHpzBBe8EpNpF/XVuowao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa3eJuRkABExyc48wkNOyqxvROSQjsTHTAdMuwIk+15FOgq/3pRi4Soy7iI5Vtmay
	 ZxWcl+S50aSiv4CGGtltlQ585kbP+caRFc18ASkIRVC/83q6EyzkrO8iOIEo7l0oPU
	 /3xzCGc6ohaNcj9ibX7QR5DOX2/7H6dOVoeySpjjt8dknoCgeIdRhPz8CTYVjvBVUv
	 A7S3X/VK8JdkY9FEbULEsrI7yWSIgyxvMa0FMcK0zdCj5yf+HmsPsih8S8o5z+QlAW
	 sPY2ID2lOVhLlhbkcNfvEJ+0HpuVW8AoEJ5RAdMtXFXJGEky4E7d6w2fMmQAZ5466Q
	 nnMTyVrtMIA4Q==
Date: Tue, 20 May 2025 16:38:56 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Message-ID: <20250520153855.GG18901@willie-the-truck>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
 <20250520141857.GC18711@willie-the-truck>
 <CACu1E7HdJvbx_6L9KvX3n78_cbkrey8npo=O=AkEzg335wJC=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7HdJvbx_6L9KvX3n78_cbkrey8npo=O=AkEzg335wJC=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, May 20, 2025 at 10:42:49AM -0400, Connor Abbott wrote:
> On Tue, May 20, 2025 at 10:19 AM Will Deacon <will@kernel.org> wrote:
> > On Thu, May 15, 2025 at 03:58:42PM -0400, Connor Abbott wrote:
> > > drm/msm uses the stall-on-fault model to record the GPU state on the
> > > first GPU page fault to help debugging. On systems where the GPU is
> > > paired with a MMU-500, there were two problems:
> > >
> > > 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
> > >    resumed, which led to a storm of interrupts until the fault handler
> > >    was called. If we got unlucky and the fault handler was on the same
> > >    CPU as the interrupt, there was a deadlock.
> > > 2. The GPU is capable of generating page faults much faster than we can
> > >    resume them. GMU (GPU Management Unit) shares the same context bank
> > >    as the GPU, so if there was a sudden spurt of page faults it would be
> > >    effectively starved and would trigger a watchdog reset, made even
> > >    worse because the GPU cannot be reset while there's a pending
> > >    transaction leaving the GPU permanently wedged.
> > >
> > > Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
> > > threaded IRQ and then making drm/msm do its devcoredump work
> > > synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
> > > Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 is
> > > a cleanup for patch 4 and patch 7 is a subsequent further cleanup to get
> > > rid of the resume_fault() callback once we switch resuming to being done
> > > by the SMMU's fault handler.
> >
> > Thanks for reworking this; I think it looks much better now from the
> > SMMU standpoint.
> >
> > > I've organized the series in the order that it should be picked up:
> > >
> > > - Patches 1-3 need to be applied to the iommu tree first.
> >
> > Which kernel version did you base these on? I can't see to apply the
> > second patch, as you seem to have a stale copy of arm-smmu-qcom.c?
> >
> Sorry about that, for the next version I'll rebase on linux-next. I
> was using an older version of msm-next for a while now.

Can you base on v6.15-rc2 instead, please? linux-next is a moving
target so it's not massively helpful to use that.

Cheers,

Will

