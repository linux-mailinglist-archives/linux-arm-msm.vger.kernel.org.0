Return-Path: <linux-arm-msm+bounces-89711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E176FD3AFF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80B91303ACF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095EF28B407;
	Mon, 19 Jan 2026 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r7U4Aveu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89828850B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838802; cv=none; b=f9n9D+laPUWAwUw6hgaj3p9DqoDbblwsp31OhnZkS/2ncPkIgyrf7i9LBSIVghj7LVbGXF333w0w1RJu2bSfNISucroBZp2Qf8rRLLsdYPkZWnb599JtHLtpcCu1qwc19A0kfrsIgGOP8XyK88+A1YkGBLRYnSTDTN+2xRhWvwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838802; c=relaxed/simple;
	bh=xo28tgWBvvqBcKarBmzdhk1+UC7ykuAy3SMnlm0dwjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NaDuiJArT5D3DHYfx1XzDbPYQXxzbhJ6AAVioYFq1CzMDz5qzxeEONj3cyTeEKOvcxwfq5Phtc1ZiCPraclHiYl3m9DOY9aEd25AtvaW7zLrdt0pKpgIkF+CeB7NpFLBs/3UJKFp/cw349dc0ZPIUQU8IjbyE3K5FZiomphkakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r7U4Aveu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2231BC116C6;
	Mon, 19 Jan 2026 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838802;
	bh=xo28tgWBvvqBcKarBmzdhk1+UC7ykuAy3SMnlm0dwjo=;
	h=From:To:Cc:Subject:Date:From;
	b=r7U4AveucwM8EVCwDML70klVCqCPN3a89Qv2WUsOz+/dwsFzOkDoracEZx64nOQWv
	 J3K1rbgQXZArk6Obj5A+duVI9qDvBpKK32D7wxGJ3EY+3l/D1VAsE5abKOSN+wG1nN
	 p23ZS+tXrpHzDmaCr4QVB6sCQBTzuvoBif3ponqBXn68X5jCVH5bLJ/XaLp87KDmW/
	 JN5rpXwsQRlEtdC3Z4Z2sOoCtQzd0dGZc9vzy1XzZeOGtLh+RDsZOiWL0z9uKOFc96
	 +J8ggkvpE2hQNg3XT8lrgl89U60yf5swlJH3ULXtxg2RYrslhp9iurImKY8JwWeDnz
	 gUmpTsXttLTag==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@lucaweiss.eu>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.20
Date: Mon, 19 Jan 2026 10:06:41 -0600
Message-ID: <20260119160641.840311-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.20

for you to fetch changes up to df7c440c904f754d8c94863a910d99e7ed8bbda9:

  ARM: dts: qcom: msm8974: Start using rpmpd for power domains (2026-01-19 09:40:32 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.20

Migrate the MSM8974 remoteproc power supplies to RPM provided
power-domains, to match what is done on most other platforms.

Give the LG Nexus 5 its more human friendly model name.

----------------------------------------------------------------
Luca Weiss (3):
      ARM: dts: qcom: msm8974-hammerhead: Update model property
      ARM: dts: qcom: msm8974: Sort header includes alphabetically
      ARM: dts: qcom: msm8974: Start using rpmpd for power domains

 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 14 +-----
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++++++++++++--
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
 .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
 10 files changed, 52 insertions(+), 100 deletions(-)

