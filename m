Return-Path: <linux-arm-msm+bounces-87574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3266CF5ECA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 00:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FF8830DEDE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 22:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A4D3090DE;
	Mon,  5 Jan 2026 22:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGk9/lU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D130214B;
	Mon,  5 Jan 2026 22:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767653935; cv=none; b=bdZsUKGiM2hBvVySxYizX0klqyeGDkJcAP/huRySagmFb/BUVBPLlb20oSQDzFeIq1dgIGedGIxKx8icPi1sUz0ABRSRpcOEe+K3R59zsu2ejMF55XCzevGM/llHvfax113Ve751mwuL+WD54BD+URmVxgC6WxmqvSMVkxq257I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767653935; c=relaxed/simple;
	bh=za7YNt3enxyPJ4YpLu4GYj73La7HrT7JJAIZfsfnNqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aIrdmAY85Fn+zm8JHvka7FfrWrVXmD51/ZYteEZ+MpvkQWfO+PHq51AfcsDOC6iTHqv5JwcTst7qAVnVIipmokg37rMbKPGoYyjEN/Dv/URfyEVUWkFXrrQ7CiZVlC/r7RHEQHAexzmU1bXdpyks7Kzd/U+bDkgWggIZSITeVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGk9/lU3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DAAC19425;
	Mon,  5 Jan 2026 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653934;
	bh=za7YNt3enxyPJ4YpLu4GYj73La7HrT7JJAIZfsfnNqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mGk9/lU3+sIOcpG1lUUOhhj5clSduvESN/PzA7SkfjPjMMs0N+IM1m0lV32EYck9w
	 R5jRT2ogLnS1ovYkY++wM71KNkVgMKwgHkWv99OgCQyiuc+AenyBaI5M+LSrq03+zv
	 +/Lh8XOUbC0c+OOtMSbPXesrVfbubLc+7ZDwLHnTwx8Ad+N17e5NEJSkDL1Izy8bUj
	 4BurhbCbQl9ClVrX1M0gwFkfQABa1rTJPaH4BXR50xCOhfZC6+yO5a7AkuKBICTmSf
	 p8slZ1r1aI2JSvnyICLQ09QUn+rXrlgUOoAMf2IWKby92WusmAF20XVOIu2eNT3LtW
	 /xv6TBB2SmVOQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu: arm-smmu: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 22:58:24 +0000
Message-ID: <176764815322.1453267.5338402258433264092.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 02 Jan 2026 13:50:04 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/qcom: Simplify with scoped for each OF child loop
      https://git.kernel.org/iommu/c/2026159372bb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

