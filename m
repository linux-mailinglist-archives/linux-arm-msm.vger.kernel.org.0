Return-Path: <linux-arm-msm+bounces-44193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC0A046E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823873A60D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AB61F63DA;
	Tue,  7 Jan 2025 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xu7f3Rkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9981F63DD;
	Tue,  7 Jan 2025 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268171; cv=none; b=ln1KcE/ps4sxj8BxWWgrLpOvyK72SDdFIfLXsywoF1yAXf0Wj+rby3CMmNHLrZwCYA4mXkdUwE1t+aHAFYPPBIsvn/XQ2NkKzL0l/YGjXHsVZGh/cFgcSTSTR8VPocOqZTWFnZkj24FCu82gXhRLqJSY0NtJoLzrtq8R6/FNx08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268171; c=relaxed/simple;
	bh=v3Dgvzj+ne0u/roC2qmWZpXnIMfuyTT+wzCVjKrqrWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KtwP3tzoMmupuhlANBUrGlgQ4mjXMG6jXxY2L3f8omYCFp1y3qP4HwwGhQL2JM+vI8zOnWPORIr9zt5LKnSDfinnjFSx/LRWEkwoAkTn1ID83IPaiW3BCmDeBkT/XkqroYPGGUjqSaNO7fQdEZ5dgapqlLi7d1LQR00/siNUUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xu7f3Rkx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC5AC4CED6;
	Tue,  7 Jan 2025 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736268170;
	bh=v3Dgvzj+ne0u/roC2qmWZpXnIMfuyTT+wzCVjKrqrWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xu7f3RkxHlXIEiNpvlzEXl5zJRth/lHDbitT4dyP1/l5W2lJ+vMRNG6EUNu84BXHC
	 EvG0WzRQU+sZ8YOPTm45ks5AGNna16iPYTSNYfGrbmWC+J+jZZqHbxdS8++F8oIKHS
	 HM/2WghQ5Vhb7Cps5f3zqQI+4CWncc3FHBxMKqAWK/2YH7aoHcGyjI3J5xrb2e3KDW
	 Me58HpT2UInadGMy7BzlZ4JrKWhHVKMh76cbH//MTBmJXhIF5CLXEG0X+INJKdOrIt
	 pz6yPWzfjoUquswLj+iwjZWMAliXPFlk9edVnQ1/l6IYy1Br6UQO/Erj/TfIyBWkaw
	 Ff2m2IDumpyNA==
From: Will Deacon <will@kernel.org>
To: robdclark@gmail.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jgg@ziepe.ca,
	jsnitsel@redhat.com,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR implementation for Qualcomm SoCs
Date: Tue,  7 Jan 2025 16:42:39 +0000
Message-Id: <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> This patch series consist of six parts and covers the following:
> 
> 1. Provide option to re-enable context caching to retain prefetcher
>    settings during reset and runtime suspend.
> 
> 2. Remove cfg inside qcom_smmu structure and replace it with single
>    pointer to qcom_smmu_match_data avoiding replication of multiple
>    members from same.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
      https://git.kernel.org/iommu/c/ef4144b1b47d
[2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single pointer
      https://git.kernel.org/iommu/c/445d7a8ed90e
[3/5] iommu/arm-smmu: Add support for PRR bit setup
      https://git.kernel.org/iommu/c/7f2ef1bfc758
[4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
      https://git.kernel.org/iommu/c/9fe18d825a58
[5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
      https://git.kernel.org/iommu/c/3e35c3e725de

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

