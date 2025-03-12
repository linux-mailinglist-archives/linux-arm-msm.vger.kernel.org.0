Return-Path: <linux-arm-msm+bounces-51157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CDA5DD6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C2C81891D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58F124338F;
	Wed, 12 Mar 2025 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/JFWJq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E623F376;
	Wed, 12 Mar 2025 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784933; cv=none; b=dTjPbNSeUgdkFbUSSy0rDrFF99IWSpzhzrX/IAO2bsTo3GwXva0HKf+InEpCh2k+NB8T2TkjSsH6GBRYABCvFENzS1hjwfKXTeofG5BzrNA3aRsgC3uknLY/Y7FkpJhAfw5xazt/OHOt9bwgEWjbQHz8lqAsU6la2QZVyinigqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784933; c=relaxed/simple;
	bh=hwdB5W2Pu3p7Ykqhvjai1ChhLr5eStjSGb3j1Yi9kfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYYv/WyTj8tyOBXnw7pL5qPfmTp09smSsm0cCvLHXjQ8fo00AMrAZyvB2FYW2onbynqDQEfjsNvu/gMbludmNe0YpkM77xxVp4LPt1EsXwU1NW1odTOJcrwswwiMtrAVUC4Mt2hGvDzRPTqMCQjQt2zQYbTOT6o0PV6a9T1BHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/JFWJq/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E764C4CEE3;
	Wed, 12 Mar 2025 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784933;
	bh=hwdB5W2Pu3p7Ykqhvjai1ChhLr5eStjSGb3j1Yi9kfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/JFWJq/0Uik293y1BXdAvps6dt29ppdcnHpTyTH5JhK08xDjAUijsgJhP4V4QLu0
	 UksTIMV3LLM//7ZetXvaBx/34hfiOeOVbeBn9PjrtiQ2MYvtpzK4Ce0edFsOAR+Gv2
	 0QM0+x/69TLP6h4U8CG27KMwZq9tFj21gMQQcTxTITRW5fZqN8MoByE+2MsAv32zGz
	 JV+2zWk6yKO7LJByrLM458TZFzucJyaL72/hplQrbelaXnhDgXse6QUxKi240ZH5cC
	 cFu7rb22C7QEZV8heJ6Kum/N+L2mEr2Lbw/kDSnP9cAD6JgVu2cFEBIYTfUck1ZC8y
	 Try3A64ogC96g==
Date: Wed, 12 Mar 2025 13:08:47 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
	catalin.marinas@arm.com, kernel-team@android.com,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250312130846.GE6181@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
 <20250311175528.GA5216@willie-the-truck>
 <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 11, 2025 at 01:03:29PM -0700, Rob Clark wrote:
> On Tue, Mar 11, 2025 at 10:55 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> > > On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > > > This patch series consist of six parts and covers the following:
> > > >
> > > > 1. Provide option to re-enable context caching to retain prefetcher
> > > >    settings during reset and runtime suspend.
> > > >
> > > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > > >    pointer to qcom_smmu_match_data avoiding replication of multiple
> > > >    members from same.
> > > >
> > > > [...]
> > >
> > > Applied to iommu (arm/smmu/updates), thanks!
> > >
> > > [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
> > >       https://git.kernel.org/iommu/c/ef4144b1b47d
> > > [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single pointer
> > >       https://git.kernel.org/iommu/c/445d7a8ed90e
> > > [3/5] iommu/arm-smmu: Add support for PRR bit setup
> > >       https://git.kernel.org/iommu/c/7f2ef1bfc758
> > > [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
> > >       https://git.kernel.org/iommu/c/9fe18d825a58
> > > [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
> > >       https://git.kernel.org/iommu/c/3e35c3e725de
> >
> > Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
> > linux-next yet. Is there something under review, or should I revert this
> > for now?
> 
> It is WIP, part of a larger patchset adding sparse binding support in
> drm/msm.  Please do not revert.

Sure, if it's actively being worked on then I'll leave the hooks in
place.

Do you have a link to the patchset so that I can follow along, please?

Will

