Return-Path: <linux-arm-msm+bounces-82166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7D9C66270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 21:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E1089352D17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 20:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A7531E0EB;
	Mon, 17 Nov 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4kV/DdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C63093AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412822; cv=none; b=a9BsvT4OHexo5HVt6DYAXfCtoiLuoPJvBQkVYjxWSKhrZcuIjC1wOdTtGQHqzn7m4J6tSEOeteaX+70W0rViM+eoQYdUF4oGAMGTm1LJ/fyJKQSKlqggi9ONiDOvrEDFzdQlvttCMTnqqUkw80l0WbGEzfbCtyKGWITYPdrrf5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412822; c=relaxed/simple;
	bh=5mZb4MWOPgD2NLuK8mo1ofEG6fMCr5dXSRetbgXpbL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SS1ULRO0/BvRdLiVF38QpIeiSTs+1Gt8R23IEUFTmdU3KLQdf9VJzD1uxxknBEdRK8ZtWsfBGlAo0JDLskatsM/LnHG74av3nm7IEq2guCe69Bn6BFhLtrZ51NMcoVcUlMAHY2gqQZDhw9QlJ2+65oOeNkbHXzFm/OXy+BmWEmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4kV/DdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719E5C4CEF5;
	Mon, 17 Nov 2025 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763412821;
	bh=5mZb4MWOPgD2NLuK8mo1ofEG6fMCr5dXSRetbgXpbL8=;
	h=From:To:Cc:Subject:Date:From;
	b=d4kV/DdGD0cPpNvpq7MH3tU3e4wiZpuCXASeeSq3/oOMPX+HHoruAr6Ps8xhwLPJp
	 +HH2HLm0bXFMPX112pMyuZgXQrq/NBdltVZxY5MoM7T4xv2kx55y4w/2yTIk2xAVXm
	 sK9sQIJKUqxhl1o8ZZzPT+gCxey9HLAsEb4HIhTtM8ieeVQtNW1OoB4lpJ3QnzFKR7
	 AHHO7so75xmRkmLF1YygHK8Xfc6r3fBG3h0B/RzBGo7D7dPwVOYT1hawdaNswQYtbO
	 +7XCqW+lmLmhXl1GGujjrz8fLvFka2XBnezox+0OIns71ef4dFbR/fg+Ce7bOmYNAY
	 Ld3gYrVaYQ9pw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.19
Date: Mon, 17 Nov 2025 14:58:23 -0600
Message-ID: <20251117205824.3178198-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.19

for you to fetch changes up to 84df51667a196a0eadb22294eed1c6440241d74a:

  ARM: dts: qcom: msm8226-samsung-ms013g: add simple-framebuffer (2025-11-02 12:07:08 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.19

In addition to a variety of cleanups and reordering of nodes, four GSBIs
are added to the MSM8960 platform.
On the MSM8226-based Samsung Galaxy Grand 2, a simple framebuffer is
defined.

----------------------------------------------------------------
Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: reorder nodes and properties
      ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
      ARM: dts: qcom: msm8960: rename msmgpio node to tlmm

Raymond Hackley (1):
      ARM: dts: qcom: msm8226-samsung-ms013g: add simple-framebuffer

 .../boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts  |  31 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  10 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  61 --
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  12 +-
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 746 ++++++++++++++-------
 6 files changed, 534 insertions(+), 328 deletions(-)
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi

