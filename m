Return-Path: <linux-arm-msm+bounces-51765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A143A67844
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38D0C168A93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F4C20E01F;
	Tue, 18 Mar 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGA4YBl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F918E25;
	Tue, 18 Mar 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312873; cv=none; b=EvpuvOnrwhp0P8lgWyuGtW0kB6vt7ad1FEUGCjcURgJqOv6YNjIxVdOF0zadCrO23lKXSuiVFJGMXejswrg1QLesWJh+v68hIqbuINJwkQ05tz/+ff4XfMOAOFZGJjXF4Ie3gVp2ctsTy+6rFH7rkGcdENmg0MKQEKLHPmfHLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312873; c=relaxed/simple;
	bh=sD58zLcw1T6P8NiMUNq1sVXKAK5W9zvgQDpdOg2n0YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvjhqkJYrDuyLof7KOVxH4bEk14kY/66KN7bFYf4PBvvVcHZhkpDZwDitPLd+sFS2lr6NYXbuOpUv0Tw9oUCLTRkZ+s7TcBqvKu5XYXMwZ4TnggOas/JfkGxmflXmCNeh1hK70wJkV6nsBLLCb5O13yAg2JZC9a6Knsz9CaBqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGA4YBl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C7C4CEDD;
	Tue, 18 Mar 2025 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742312873;
	bh=sD58zLcw1T6P8NiMUNq1sVXKAK5W9zvgQDpdOg2n0YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGA4YBl+hzKVuvM/XqteBDWWK3b6pIavAqDW2+cK9UD9m1xGSZsXCjxkcKNxZo3w+
	 Tk/Ufcoc4skZ/mDTLKBug0+5qNsXtv0YB9t32+HEKcW+BGajMQSviBMY5HjJcQ5M8L
	 qMRzug9ByKKSpMDTakbTrJlTOqoDMuwPYZGxPwL71bMS1wAD4Uny6PZDUCHm4Ckr9X
	 V81MI3EvYLo5/nx+BkM3U8NiK79tmbBg9GUBn2HGN6D2HusssZ8S3E1XAiDq2NAvXF
	 F4KAOKtMOI923jaVvp/DXpIrB5EOivAeJ+wWTINT0pSdBfytn05v7kaiuufwE99T+T
	 s9l+MGxUEXo1Q==
Date: Tue, 18 Mar 2025 15:47:47 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
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
Message-ID: <20250318154746.GB13829@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck>
 <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
 <20250312124907.GB6181@willie-the-truck>
 <CACu1E7Hm=DWDC2aFdBRkT8f=8gKXJPpif_uEOA9iFZcyT-uCfQ@mail.gmail.com>
 <394571e1-f86d-472c-91dc-4377d512bfbe@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <394571e1-f86d-472c-91dc-4377d512bfbe@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 18, 2025 at 01:36:55PM +0000, Robin Murphy wrote:
> On 12/03/2025 1:30 pm, Connor Abbott wrote:
> > On Wed, Mar 12, 2025 at 8:49 AM Will Deacon <will@kernel.org> wrote:
> > > On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
> > > > On Tue, Mar 11, 2025 at 2:11 PM Will Deacon <will@kernel.org> wrote:
> > > > > On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > > > > > +     /*
> > > > > > +      * If the device is on and we changed the setting, update the register.
> > > > > > +      */
> > > > > > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> > > > > > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > > > > > +
> > > > > > +             u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> > > > > > +
> > > > > > +             if (enabled)
> > > > > > +                     reg |= ARM_SMMU_SCTLR_CFCFG;
> > > > > > +             else
> > > > > > +                     reg &= ~ARM_SMMU_SCTLR_CFCFG;
> > > > > > +
> > > > > > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
> > > > > 
> > > > > Are you sure you don't need TLB invalidation for this to take effect? I
> > > > > think some fields in the SCTLR can be cached in the TLB but you'll need
> > > > > to check whether or not that applies to CFCFG.
> > > > > 
> > > > 
> > > > I think it should be fine because CFCFG only controls behavior when
> > > > there's a context fault and there can't be TLB entries for entries
> > > > that cause a context fault: "The architecture permits the caching of
> > > > any translation table entry that has been returned from memory without
> > > > a fault and that does not, as a result of that entry, cause a
> > > > Translation Fault or an Access Flag fault."
> > > 
> > > Ok, but what about other types of fault? For example, a permission fault
> > > or an address size fault?
> > > 
> > I'm not sure, but the pseudocode for context faults mentions
> > resampling CFCFG after a fault happens ("We have a fault and must
> > resample FSR, CFCFG and HUPCF") so I don't think it would be legal to
> > cache it. Also in practice this does seem to work. Does that answer
> > it?
> 
> FWIW I checked with the former MMU-500 design lead, and although he doesn't
> remember the exact details he's pretty confident that they wouldn't have
> cached anything fault-related, so at least from our side I'd consider this
> OK.

Thanks for checking, Robin.

Connor -- please can you stick some of the above in a comment prior
to the CFCFG munging so I don't "rediscover" the problem in the future?

Will

