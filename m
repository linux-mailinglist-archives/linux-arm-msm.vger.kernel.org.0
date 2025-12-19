Return-Path: <linux-arm-msm+bounces-85798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0DCCEEE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27FBA305CE4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 08:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E301D2F0C67;
	Fri, 19 Dec 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/IUrif+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F32C08D4;
	Fri, 19 Dec 2025 08:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766132002; cv=none; b=MLTq1Q0gx7CLXd0fHbzMVFm3+Up8hZwX/uUaKuiuEt4H3FsNGpq6caWuZu6T7pXVEGHnOH2k7yxGbbV+BVmO5PrsUgu2vzYW8329kUGeUBwKc3/7saG6gTKBcHjuWSrhAlXtsXDZoolwKtXv26IaZSadWmzd7OHikOQU39WBzT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766132002; c=relaxed/simple;
	bh=lvn+iw5IxWpNsx5ppx7UaT4z6tDEmv9IRQkqRmBQGQc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X6Zj7BN4qkU4LGHLkiciIf5Aww90aWgl36vXBF8tdQEn6jb/ORtZaKhGqSMs3592U+Ax1ESsAkIc+K4IODERKZSoNQlL2KrfJlQikM20zMAbUqTyMfSuIQohuFjIXyk5B/hhGgSlH3xtF6sOwbWhQpzrfoznKTd7JXe70UsCm/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/IUrif+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A1FC4CEF1;
	Fri, 19 Dec 2025 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132001;
	bh=lvn+iw5IxWpNsx5ppx7UaT4z6tDEmv9IRQkqRmBQGQc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M/IUrif+d4VKn/MpBzO8oXg7fyF4udbLWjFGC+kaeTKXVdK9pnVZSk9qfn61Oncpi
	 GhR5l8VAZ4IA86aoju4qY4COjaufMk77R9+qzFfwAZOU9Mv14DiZsPZrAzz0fP8C8O
	 RVHu5dAXut9fzq8uA8rHcl2hgk3qtCR3o7FIhbbxw1etaHqlACnKIZpUTGy4fOBicw
	 mUDSllG1LCmoO9eVDdYT7nQEkxN8ixdDPeXlwtWDpLBykJTtiH2K8RTzj7p3zgR18A
	 EftOxjTcUmtQ5u7Eo9SivKx97gnYTIzCDyvlh8FtZdCb56p0NX1TrxQ6CjwLInTtmr
	 ati6fNfjsc4FQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBE4380AA50;
	Fri, 19 Dec 2025 08:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/6] iommu: Pass in old_domain pointer to attach_dev
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176613180983.3684357.11179224135837486617.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:09 +0000
References: <cover.1761017765.git.nicolinc@nvidia.com>
In-Reply-To: <cover.1761017765.git.nicolinc@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-riscv@lists.infradead.org, joro@8bytes.org, jgg@nvidia.com,
 kevin.tian@intel.com, suravee.suthikulpanit@amd.com, will@kernel.org,
 robin.murphy@arm.com, sven@kernel.org, j@jannau.net,
 robin.clark@oss.qualcomm.com, m.szyprowski@samsung.com, krzk@kernel.org,
 dwmw2@infradead.org, baolu.lu@linux.intel.com, yong.wu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com,
 mjrosato@linux.ibm.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jean-philippe@linaro.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, patches@lists.linux.dev

Hello:

This series was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Wed, 22 Oct 2025 19:21:03 -0700 you wrote:
> Tidy the release_device callbacks in the drivers and switch to the core
> managed release_domain.
> 
> This allows the core further to pass in the old domain pointer into the
> attach_dev callbacks to reduce the use of iommu_get_domain_for_dev().
> 
> This is a preparatory series for new iommu_dev_reset APIs:
> https://lore.kernel.org/all/cover.1756682135.git.nicolinc@nvidia.com/
> 
> [...]

Here is the summary with links:
  - [v2,1/6] iommu: Generic support for RMRs during device release
    https://git.kernel.org/riscv/c/e94160488e65
  - [v2,2/6] iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
    https://git.kernel.org/riscv/c/52f77fb176ec
  - [v2,3/6] iommu/exynos-iommu: Set release_domain to exynos_identity_domain
    https://git.kernel.org/riscv/c/680a6a60fc08
  - [v2,4/6] iommu/amd: Set release_domain to blocked_domain
    https://git.kernel.org/riscv/c/c21b34762e2f
  - [v2,5/6] iommu: Do not revert set_domain for the last gdev
    https://git.kernel.org/riscv/c/2b33598e666d
  - [v2,6/6] iommu: Pass in old domain to attach_dev callback functions
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



