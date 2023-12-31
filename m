Return-Path: <linux-arm-msm+bounces-6167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9352E8209A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 04:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0688528355C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 03:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6881FEDF;
	Sun, 31 Dec 2023 03:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/wJHCxE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FFAECE
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 03:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066FBC433C7;
	Sun, 31 Dec 2023 03:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703993268;
	bh=bOBZVSQEdC+I2IRZ9tmgIqqhn1E73YRwGsYZIVEK6Zc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=g/wJHCxExWI/ENqwMaaaVTb1iRcnRDhslTWCr0vgxg+ffsMk/58NYXNHec7Gsg4eU
	 F0KiHlXFI7PexUDMjmsIK9qh+MpgiZOZ09ilhvCJlzpdIdkZ30mZtijyQ0JBOOkVZd
	 ZGRrTqzuFXCJ/mvxnVEVEVA273gh3h2dqW8Kq/6TFBg7MHGpWMHIAde4EXw5CGk0UY
	 PQU/LnqHEK1CI3hg6cqfZGEit6AgqOwQHaa7pC8BAiv42MNzuEXYqb+Aw+g8XsGw7b
	 tWy3vXii/DT8onR3+W8vxJqQy9KCXxGXkl+A9X6O0tsdn0SpXbSPcphNPqkkIYr6q0
	 4VoZ6/Oyq/bPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] A few more Qualcomm Arm32 DeviceTree updates fr v6.8
Date: Sat, 30 Dec 2023 19:31:51 -0800
Message-ID: <20231231033153.3262575-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 648002a27c6b3ae293cc415e1fbf20aaa6af8bd3:

  ARM: dts: qcom: msm8974*: Re-enable remoteprocs on various boards (2023-12-17 12:09:42 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.8-2

for you to fetch changes up to cc6fc55c7ae04ab19b3972f78d3a8b1be32bf533:

  ARM: dts: qcom: sdx55: Fix the base address of PCIe PHY (2023-12-19 11:23:24 -0600)

----------------------------------------------------------------
A few more Qualcomm Arm32 DeviceTree updates fr v6.8

The recently introduced changes to the SDX55 USB controller interrupt
flags prevents the USB controller from probing. These patches corrects
the PDC's interrupt-cells, so that appropriate interrupt controller
(which supports both-edge interrupts) can be used instead, which
resolves the issue.

The SDX55 PCIe PHY base address is also adjusted, from a mistake when
the node recently was transitioned to the modernized DeviceTree binding.

----------------------------------------------------------------
Johan Hovold (3):
      ARM: dts: qcom: sdx55: fix pdc '#interrupt-cells'
      ARM: dts: qcom: sdx55: fix USB DP/DM HS PHY interrupts
      ARM: dts: qcom: sdx55: fix USB SS wakeup

Manivannan Sadhasivam (1):
      ARM: dts: qcom: sdx55: Fix the base address of PCIe PHY

 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

