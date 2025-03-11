Return-Path: <linux-arm-msm+bounces-51030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDBAA5CCE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45AB017A09F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C1B263C6A;
	Tue, 11 Mar 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPM+UPYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D287262D11;
	Tue, 11 Mar 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741715736; cv=none; b=dzLKrDVzByZLmJFbFbvv6WBEXrq8SIJPWqW4JzJOnub9IYnHk6GeWbyAFLyYR0SPWREWMpBtfLX60YjboVIR8dAvECuVBXPCJthDDLzx9zKuZ9/i9D2MjijTSZNq7PfRBYpj4CSUy5009dEWlMATYfQKQT4Tv6yXrMhrxu+4WNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741715736; c=relaxed/simple;
	bh=8u4pLdHTIPFDK61uW8Pwmuh4P/pSUrHF80u1BGQPw1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxNu9fn1/PYqpEsbg3Km9VKtoRUhOG4sGOZ35ldInTy1yfjVPekmqORNO0dgJvwmsYybFzcnY4jPs7xhvzjN9bfSh+JYf8jdcm+bhBjf0iDRDd8DJqYDhLBpXAyPiD8Hh58APYwt/sPoe8Cu/iqs9mZ1fg8tvW4Tm3bUQUrPvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPM+UPYp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A55C4CEE9;
	Tue, 11 Mar 2025 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715736;
	bh=8u4pLdHTIPFDK61uW8Pwmuh4P/pSUrHF80u1BGQPw1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPM+UPYp+Dl9QmdvLVZP8/GlmuodV3AIhgCje1OSt7+3NoWS+fJHPJy17889lPa3a
	 CG84EdQhEZW3BwePkfymcv95wgGXaD1vtQUdwOXMmhEqCV5hgxiikHjRjYJ2Y/v0E9
	 WM5i/vw30jFFELw59CjhpP80sFQIfNiklgei14DqpgQQCn2/tpFtaGukHDvxOiTBLe
	 DMewDLdlM8KBeWnfPKcatcsXN489qLe4brSdeMrSfrB2G9Yp2l6TmfciXHC8RSWi4H
	 t5sU0vqoglfhHOiANV51YkT5bvJLYhIMPKAShrzcy9iUeCxVwEHSgFY+wVO8jfoSNg
	 O4YnIeQ0R3Eyw==
Date: Tue, 11 Mar 2025 17:55:30 +0000
From: Will Deacon <will@kernel.org>
To: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250311175528.GA5216@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > This patch series consist of six parts and covers the following:
> > 
> > 1. Provide option to re-enable context caching to retain prefetcher
> >    settings during reset and runtime suspend.
> > 
> > 2. Remove cfg inside qcom_smmu structure and replace it with single
> >    pointer to qcom_smmu_match_data avoiding replication of multiple
> >    members from same.
> > 
> > [...]
> 
> Applied to iommu (arm/smmu/updates), thanks!
> 
> [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
>       https://git.kernel.org/iommu/c/ef4144b1b47d
> [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single pointer
>       https://git.kernel.org/iommu/c/445d7a8ed90e
> [3/5] iommu/arm-smmu: Add support for PRR bit setup
>       https://git.kernel.org/iommu/c/7f2ef1bfc758
> [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
>       https://git.kernel.org/iommu/c/9fe18d825a58
> [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
>       https://git.kernel.org/iommu/c/3e35c3e725de

Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
linux-next yet. Is there something under review, or should I revert this
for now?

Will

