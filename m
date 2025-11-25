Return-Path: <linux-arm-msm+bounces-83302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29DC866E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4679034EC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB23232AADF;
	Tue, 25 Nov 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9rfUIYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE08279918;
	Tue, 25 Nov 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764093949; cv=none; b=phJbit/vvwAU0g9uRyobl0q6z71+pcMU7NHWxSw+EacXtA6a9Ll2qm1WXGP7UvUeTtNnV2/qSNJYs2j2x5hZAy+cPWuQCK4Yc3jr2468nFkcUU25uwkYdSyQbcOZEadtz1P3Q43iO99jIMluwoSVPvZxtvVmbmzAg1z3InNsVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764093949; c=relaxed/simple;
	bh=YP4UWtXPGEMDVAxQ9+yA4ItyyOw9cyvtV82OlT9k77Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mAXTxUvm9lyGCdX1zcvsOrUrl5xaSqOI8lU5BPnJ+AhZVZh4CxefE/SMS/yd7ejXX6YeuvEmxJsZhfKr2X7oIhvHa7xE30g1RvKtxo12zmXssescVEtxt5lcFx6VDZ4p1kog+C4Ito02725Zlg0azmZK+0broBZ5rKLiZk990gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9rfUIYy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992C0C4CEF1;
	Tue, 25 Nov 2025 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764093949;
	bh=YP4UWtXPGEMDVAxQ9+yA4ItyyOw9cyvtV82OlT9k77Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D9rfUIYy50ku+otqD5fIKODl3ucpdu6EAXrcka3ekIqu3VOeXsForELG454WXH8aV
	 aZZiteBWBkpVqgJehBKptNXMGI+T1a+0yd5IMSLF9hL8TZYa2I/uMyqEWd8zbLD7II
	 hyh85i/o2HLsrwZLxMlAOGFrjdoiaboIFTnOigxOXp+YULlO4DaNGHgN7h0ngd9GNV
	 IFMW6c3lKx94961pLJ5MHHhAs2K1UQ4Hzh69AFH7XY9Aht6fnB2MNccGymGGej6NYk
	 5o9BR3RWrCJAYDL+N4sFXo2Ln8RgDPjAFzJBOmA5ex4kdf7NqXabZxd3Ehgi4J5fG4
	 eRztOzrvrYrog==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when running bare-metal
Date: Tue, 25 Nov 2025 18:05:40 +0000
Message-Id: <176408774799.1871149.15645186594285769855.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Aug 2025 10:33:53 +0200, Stephan Gerhold wrote:
> Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
> matching groups. This is more than what is defined as maximum by the ARM
> SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
> Limit the SMR groups to 128") disabled use of the additional groups because
> they don't exhibit the same behavior as the architecture supported ones.
> 
> It seems like this is just another quirk of the hypervisor: When running
> bare-metal without the hypervisor, the additional groups appear to behave
> just like all others. The boot firmware uses some of the additional groups,
> so ignoring them in this situation leads to stream match conflicts whenever
> we allocate a new SMR group for the same SID.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Enable use of all SMR groups when running bare-metal
      https://git.kernel.org/iommu/c/5583a55e074b

I chatted off-list with Robin about this and we agreed that it's the best
approach for now.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

