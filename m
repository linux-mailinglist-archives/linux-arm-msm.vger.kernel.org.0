Return-Path: <linux-arm-msm+bounces-51034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F170A5CD3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60058164C43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2E92620F5;
	Tue, 11 Mar 2025 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgR4rUzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750A1A5BA4;
	Tue, 11 Mar 2025 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716496; cv=none; b=aZIe7inOovkvbGpwzJHjDVPnEV1UqBv/rRl0d9j533E9EQVgcQXIv5nHrhXv8tmy0RrYE+aIe7mIsk4pkjyHQ9+WMKKGFDziJl7do7mx/zP2Z71QTNSFoq9P9a+oVssbJHuzEkdHQFNwVgmUMj+zK8uQ/iToTv8qU0I7ZWfZtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716496; c=relaxed/simple;
	bh=etYsz2cyQgiE5xns0t3/s7Ls+X0fhLbE/rB4gyB3lcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixoHlMO6CaEpCllkIOb4FYkTFpPsau6nVnWEWbKCMPDjUA3se0VrysPbUNkNceLpoxSliP5/lEJljQaq8CGZYkehO5qDbMlhrGNlAR7TaNmMwY1DnGjZjrRX4mWdKyW+6QEdm/leqWzupCxZQ+4Bl6R2El2Tz9iriQSLZaR1xEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgR4rUzg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F234FC4CEE9;
	Tue, 11 Mar 2025 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716494;
	bh=etYsz2cyQgiE5xns0t3/s7Ls+X0fhLbE/rB4gyB3lcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgR4rUzgd/9gtAJnSSxDj0ui8uRMjkM7iiqeBpRb+3xekGWBLH//FenNMJocNXovb
	 e2Hs6lepS57k5SakJTPMdOHvw0WeSGHfY8mCsjGBHJMw5AS60LZWsjiV1r0I+M/ag3
	 zjCQdNEp3+J4yq5dodMHN4l635t5LMb/uvlOg1oZ9hWSKqYofTIgNhMTvio69UXL3c
	 pcE0JCVgRYkfWynuxPrXS5vt7LlueCZ0Szrnsid4JW5qITH5jkDmAJy3Gaeavc19yW
	 OmMdvMnX3N7Hot1Rds09kwylnFMB9CyME7ub13Q0YFhO9FrlNpOsJQ3laoUWtOFLNU
	 V/ePzW8XHQi5g==
Date: Tue, 11 Mar 2025 18:08:08 +0000
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
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
Message-ID: <20250311180807.GC5216@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> In some cases drm/msm has to resume a stalled transaction directly in
> its fault handler. Experimentally this doesn't work on SMMU500 if the
> fault hasn't already been acknowledged by clearing FSR. Rather than
> trying to clear FSR in msm's fault handler and implementing a
> tricky handshake to avoid accidentally clearing FSR twice, we want to
> clear FSR before calling the fault handlers, but this means that the
> contents of registers can change underneath us in the fault handler and
> msm currently uses a private function to read the register contents for
> its own purposes in its fault handler, such as using the
> implementation-defined FSYNR1 to determine which block caused the fault.
> Fix this by making msm use the register values already read by arm-smmu
> itself before clearing FSR rather than messing around with reading
> registers directly.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
>  3 files changed, 27 insertions(+), 27 deletions(-)

[...]

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635efb3968a0bd3ff237 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
>  	ARM_SMMU_DOMAIN_NESTED,
>  };
>  
> +struct arm_smmu_context_fault_info {
> +	unsigned long iova;
> +	u64 ttbr0;
> +	u32 fsr;
> +	u32 fsynr0;
> +	u32 fsynr1;
> +	u32 cbfrsynra;
> +	u32 contextidr;
> +};
> +
>  struct arm_smmu_domain {
>  	struct arm_smmu_device		*smmu;
>  	struct io_pgtable_ops		*pgtbl_ops;
> @@ -380,6 +390,7 @@ struct arm_smmu_domain {
>  	const struct iommu_flush_ops	*flush_ops;
>  	struct arm_smmu_cfg		cfg;
>  	enum arm_smmu_domain_stage	stage;
> +	struct arm_smmu_context_fault_info cfi;

Does this mean we have to serialise all faults for a given domain? That
can't be right...

Will

