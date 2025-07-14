Return-Path: <linux-arm-msm+bounces-64805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB6B03DC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 188D4189FBF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA628247281;
	Mon, 14 Jul 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rus0z6Zl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A370E2472B6;
	Mon, 14 Jul 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752494080; cv=none; b=DoAl6girq8n8YrCjDMvIwG12O/fQ0D9MfcB92Jf47O3ltQx2uNpR2OgltHgQ2CY+HRt4vJb04hSUFTLUm5jLYWcpp8vJEpULWhj6tPHRTRle47p5EM4InYijycz0h6xBA0jXEeRKsexV1+nLgmUoNvFKXj9p4v/Z87jrMb+d68g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752494080; c=relaxed/simple;
	bh=s30ogQNg7+t3DT3jncsWas73gVTu/R4j2XfZEk/UahU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIGNN+XI4CtZl1gCvlKzo5LFSXSqeQuqkm55c2kSceeVlieJ10bOjjPZZrVCPE7cNz4J14zioUJmPMqGZ6Y+Yq89/dHvwx+9ATlu1pdgUxucMqqKtiPIuEP30ONY58hmsPUQihQM6PQKBnDq1B4aODFJROBV05BXhLY0t15C0rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rus0z6Zl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD155C4CEED;
	Mon, 14 Jul 2025 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494080;
	bh=s30ogQNg7+t3DT3jncsWas73gVTu/R4j2XfZEk/UahU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rus0z6Zl2R0JiqCD3y0kom8nyUws2FK02SCF6zkdTJ6biQU/FP7vHWrdI8/+gE45A
	 OEeJopDgP3CBKZ4lzJEO+6ZZuWGnx6AWTfV4aJJSglPjh7spRwYeuRShKRYJOqCfDx
	 TL9hZtlSa036H+OlD3/IUMIAyiGiQEKX5JNI9EFK3oEA6Pu8MvLsGORTaaZBAKSWqb
	 qA0eemmBUKwSR8mdKpJ13aLsT8fZOvlyNE3laAy4ndnOvliQK4/GAcfvwHN+UEyrpd
	 a+Hrin/w2cCaAnAquRGJVY09hPR1UKKsaNjo+Fdq5IQHVuk0BdEYa4tssF0/mBjDXe
	 nCAWhtdRRkTag==
From: Will Deacon <will@kernel.org>
To: robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com,
	linux-arm-msm@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Date: Mon, 14 Jul 2025 12:54:27 +0100
Message-Id: <175249142645.1452379.7552857097102932534.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613173238.15061-1-alexey.klimov@linaro.org>
References: <20250613173238.15061-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 13 Jun 2025 18:32:38 +0100, Alexey Klimov wrote:
> Add the SM6115 MDSS compatible to clients compatible list, as it also
> needs that workaround.
> Without this workaround, for example, QRB4210 RB2 which is based on
> SM4250/SM6115 generates a lot of smmu unhandled context faults during
> boot:
> 
> arm_smmu_context_fault: 116854 callbacks suppressed
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0ec600, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> arm-smmu c600000.iommu: FSYNR0 = 00320021 [S1CBNDX=50 PNU PLVL=1]
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0d7800, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> 
> [...]

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
      https://git.kernel.org/iommu/c/f7fa8520f303

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

