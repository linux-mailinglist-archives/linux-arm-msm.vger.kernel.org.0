Return-Path: <linux-arm-msm+bounces-11024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5F9854F51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3523B2119B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 17:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2E2605DF;
	Wed, 14 Feb 2024 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLzgymvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A408E604AA;
	Wed, 14 Feb 2024 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707930040; cv=none; b=XihySHYiF+Z/zkZNySMpo8C1f66Un6q3bhtVCdDz1IruwQJQpyf0DjGq9H7HBComRicBHsw3AHrcmUAES6QZ2i6Vw2hP+jPqAKHHNJSMTBcr4DR/plHMwbcavXJYVlbs4Bv7tl3DBqDlrD/txLuFKu4TdHbS5Ybd8/tP0obbm6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707930040; c=relaxed/simple;
	bh=SBXvlj/pv3bXj7iz6+7oO/3tACndnmQVR4G2KMScMxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IGr+aVciRpoYe4egD0P/fCb0dPE8vCkMW18qJzlOyeEv9ZD6kY72E9tsQGKzQbux5tBu95LvKukaetwW+hEGHVqeYCnhKYdW+GHjW1VnaakNFLWng/23gs8BgK1jrpUhRX7DurVwxHEdNjPr5J40T0DKNCfd9TXDFlk1oyHm7zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLzgymvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2A6C433F1;
	Wed, 14 Feb 2024 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707930040;
	bh=SBXvlj/pv3bXj7iz6+7oO/3tACndnmQVR4G2KMScMxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VLzgymvi/0g7CgSK1EPdFxNHNf71qXRiX/VkFEuuLPWCc3K9Fv/QV4SVf4aMfuJds
	 Ih+2AlSsvZ7QBZoaGkWsLZB27hcWLPv2aa5ryqz3pcRKHLa/tOo3lFK5dn9+GnVF9e
	 1cxC437KYaE7xssmo1EEnKOe/XJps/CLn+6fG1j3UHtSppHq92Y8xbGeOplaoBTZ05
	 4tkFhkIyMrC5FVgf8HzbWYKqLyQCFsAjyrPEQpfAcSWPYXcFQW47vP3C/mexXxr1H0
	 ++4GpekVy8AtHgWdR3cdcXRxbQnfOM9JOHZLWeC0Ki4EMNoXfA3M2P0yzvqaBowX61
	 5XtkZ2D+h+MwA==
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Date: Wed, 14 Feb 2024 17:00:34 +0000
Message-Id: <170782679599.2166016.11725176923934129944.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 Feb 2024 13:31:56 +0200, Dmitry Baryshkov wrote:
> This reverts commit 9b3febc3a3da ("iommu/arm-smmu: Convert to
> domain_alloc_paging()"). It breaks Qualcomm MSM8996 platform. Calling
> arm_smmu_write_context_bank() from new codepath results in the platform
> being reset because of the unclocked hardware access.
> 
> 

Applied to will (for-joerg/arm-smmu/fixes), thanks!

[1/1] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
      https://git.kernel.org/will/c/b419c5e2d978

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

