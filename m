Return-Path: <linux-arm-msm+bounces-89720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702DD3B471
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51AD0308226F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A38F2C15A2;
	Mon, 19 Jan 2026 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXWiBJd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8424BBF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842201; cv=none; b=tYiv3wiTR1Fp/B55EVVpwmYvI1Zz41jYCRNA7xWRD1wuY1NHxx5dJryPpfNq4f+SYsG2NZ6ksZDj11KYo6Th7WDR7GlGUkSR49bDoH9W0uoRzdfHyBtW//ISK1DKfg018OqhiCDuFuKnycHmgnq+4TYyXJP4K3LXtyjkQlWKfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842201; c=relaxed/simple;
	bh=EcK0McsaD5PqEhzXSuPqy2gy/gwkBquxIH6Ix+hFNnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BT/Z3A2GaJVZq2RYomY1D4lfGEo/hiik9yzZhlz48RYabLd4k4ItnRicDrZxM7D6ScVfSPTSKiKhD4mPXeQTy+ZLIAfHs/qZirJp8bSEB0iuow+NpRCH9yKIXInray1vtVPWPLFmEkx0z/jj+OugxbFD5NYd8ueXcpeFA1tduKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXWiBJd8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A397C116C6;
	Mon, 19 Jan 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768842201;
	bh=EcK0McsaD5PqEhzXSuPqy2gy/gwkBquxIH6Ix+hFNnU=;
	h=From:To:Cc:Subject:Date:From;
	b=sXWiBJd8i1JSvuM0+NEYSc7T5ujL4OKYw9FJl/MJLWZNQClkEgACHPXbZb14ALffS
	 8YaFqZ7jpEesEXvMrTWbYp0CngKczu70RZXKovBkO+nNz7V/5ok1Bmsf0qtLH08+4u
	 DVKZD2CokHcbaLN+6uEZmullzY3THYuEQRzsgniFYsiD0IJ/CwvLUyWy+11epPJZDt
	 G/IzrMIF/XdCHCZCdZRIyaU0jWStTBa7n1R+hcVyuUVyAOZQIp7Wi/iLoSe+/olZ6Y
	 cDZv2n4FrjBVGwCQnjXbMMJp7de61n4niRnZIJXiJNadaChJbfmGm9uOJq1s6hNYEO
	 wJ/sleEizT30w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig update for v6.20
Date: Mon, 19 Jan 2026 11:03:19 -0600
Message-ID: <20260119170319.847911-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.20

for you to fetch changes up to 9f262627a90c3af102e066ad922e966d9f6fa24b:

  arm64: defconfig: Enable EC drivers for Qualcomm-based laptops (2026-01-03 12:35:00 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig update for v6.20

Enable drivers needed to boot the Kaanapali and Milos platforms.

Enable EC-drivers found on various Qualcomm-based laptops.

----------------------------------------------------------------
Jingyi Wang (1):
      arm64: defconfig: enable clocks, interconnect and pinctrl for Qualcomm Kaanapali

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable EC drivers for Qualcomm-based laptops

Luca Weiss (1):
      arm64: defconfig: Enable options for Qualcomm Milos SoC

 arch/arm64/configs/defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

