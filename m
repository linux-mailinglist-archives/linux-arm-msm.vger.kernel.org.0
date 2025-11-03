Return-Path: <linux-arm-msm+bounces-80147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61296C2D0D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 17:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0072D341B49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 16:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F0B315D45;
	Mon,  3 Nov 2025 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCxWYEWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471A414A4F9;
	Mon,  3 Nov 2025 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186678; cv=none; b=fYr/twX6dJgFSwA9Nh9jgUfv8XfxL/WtGbEjBX3s0s7lkWEnG9JZ5DaoRkxg170fJucl/qxa3Y/RBcFtpPMCfsf4dm+KxzDDzP8D4D1fumQr2Xn6kFqjvM+OQG357bU7LzirmGTYoq/+Zslumd+2YLmKwGthQTYp0QVzh6O1RfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186678; c=relaxed/simple;
	bh=EM2WTYue35Sk0aDPoDRkWDE6sq0fSW1jSC3/FoLVVcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqcaglsBm8Yz1cjj7z5Mb9QZ0oxEyvnzknxP+GrjhNpzXyNmPN5HFiUBXieAWThZNAyt6xAUfqDZ39iHgLzSNdZgbmc7hAz8UhfgLJKfMBPUrbrRbAPrMkeVo8Ou/3A3VpVx4ObClNofEJ1EUM0gxyuIM1Sgnr2BSjdAuSPrHqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCxWYEWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BD1C4CEE7;
	Mon,  3 Nov 2025 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186677;
	bh=EM2WTYue35Sk0aDPoDRkWDE6sq0fSW1jSC3/FoLVVcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MCxWYEWncWa8+Yshj3NmPUxnSbXXSPeeC3aMlzImtOS1KJLxVn+1hts9ARuWjHcsH
	 AqGyVQ3nfJ2eSR+XlCluEr/7lsPhsZ7iUtOJwOOtLHJTs0I1Vcn/XzX6iVbOp47wJT
	 USA+ljyjFnsiFx/jFMFe0cp8Qsi/rpzmipG7hWqhyTCU0POoIlbkltVEcQo4YnRiCO
	 TAgLoaviqB3XrJGVh8itMRKaJsWNYOLQ4UZvJyVB6zT+mclpeYR5e8PTTN7fX8zh32
	 QqyMo2NqG1YMdoZEmjwqkrwxwbm2Q6ZZlmZ1JLl3S6UqnyoKR9Vn7yTgk6yk+OFJ9r
	 TVX1fq43bzaWA==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
Date: Mon,  3 Nov 2025 16:17:49 +0000
Message-Id: <176218536011.3313519.18252480197607777173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
References: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 28 Oct 2025 14:38:19 +0200, Abel Vesa wrote:
> Add the Glymur DPU compatible to clients compatible list, as it needs
> the workarounds.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
      https://git.kernel.org/iommu/c/617937d4d553

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

