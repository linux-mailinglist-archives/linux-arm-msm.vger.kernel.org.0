Return-Path: <linux-arm-msm+bounces-18734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E128B4727
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 18:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 139D91C209A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 16:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E3B23A0;
	Sat, 27 Apr 2024 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZfWWHbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86546628
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714235787; cv=none; b=NZ8R4P1rnOj+XZCL93xKiEh6z/MDLruUoK98EGpyRsR/uh+U7MKOo9gffQjmHfF+5pcfmNwDhwDIukXCRizDRD3zNSDBBMGugU/OqB0UPpIO2YfEkroOSe/eqq1TsbDXod7chbTMku/FEvM3Ed3ujIUIW2mWRspjoOo5fSJerlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714235787; c=relaxed/simple;
	bh=uOeyLCNma0iMB/YCc5gTTMjQz+dScVYQfo1gvpiD1wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRD/DhpagMQKzcvZ8B7T01rB/S3QOgJVhsszxPU3Ue3nwCx8CQvzw3yGMv/uGnZ9jPfnLbwVKlPja6dHZJPs4IxK9ZnttUJBlnNkhzHCx1nRD5XjZZIJBQdi/LCbPBmbZO33fJ78zfak+yk47kxIgJMsQzQKvU5YrTwZj+s6Ffc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZfWWHbU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E66C113CE;
	Sat, 27 Apr 2024 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714235787;
	bh=uOeyLCNma0iMB/YCc5gTTMjQz+dScVYQfo1gvpiD1wg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=EZfWWHbUKnunanTcq4HdzKLBiJxTrYoqUYyaaGh+B/XYOOKDSDhAppSe7F2CymKGA
	 rEHk6md011m5GBc4gHQnGj84uh/4azJ9m3Oxij+sjYkYeX1tJCLGFZ3+UT2agzBg47
	 QDA38droIGeNq01CimVsyhpny/4bp8AKaVzh1aZuZBwmwb8wBDY7o1bAn/YsVLp6De
	 W58iNOY0m6zj6IlSfSl3COOliQfGz68uO8bFo6Jatc5fdWXAdFy5sXFFbaVYN5tG9f
	 E9BRaDmMckZmRCNdnb3YPeluPYW12691KgPfEf2dOAAdjah30XkmDe/wNf23GzLliN
	 Y+y+3BuKy8pCg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rong Zhang <i@rong.moe>,
	David Heidelberg <david@ixit.cz>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.10
Date: Sat, 27 Apr 2024 11:36:23 -0500
Message-ID: <20240427163625.1432458-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.10

for you to fetch changes up to 01088e255a27f396dcbc412e10b26cd14be5ff19:

  ARM: dts: qcom: msm8974: Add DTS for Samsung Galaxy S5 China (kltechn) (2024-04-23 08:01:28 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.10

The QCA8074 PHY package found in IPQ4019 is properly described.

The Sony Xperia Z2 Tablet is cleaned up and improved, vibrator support
is added, upon support for Sony Xperia Z3 is added.

Also based on MSM8974, support for Samsung Galaxy S5 China is introduced.
The WiFi board type is added for these "klte" Samsung devices, to select
appropriate NVRAM firmware file.

Based on MSM8226, support for Motorola Moto G (2013) is added.

Nodes representing the PCIe bridges under existing controllers are added
for APQ8064, IPQ4019, IPQ8064, and SDX55.

A number of fixes throughout to improve compliance with DeviceTree
bindings.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge branch 'arm32-for-6.10' onto 'v6.9-rc1'

Christian Marangi (1):
      ARM: dts: qcom: ipq4019: add QCA8075 PHY Package nodes

David Heidelberg (2):
      ARM: dts: qcom: include cpu in idle-state node names
      ARM: dts: qcom: msm8916: idle-state compatible require the generic idle-state

Luca Weiss (10):
      ARM: dts: qcom: msm8974pro-castor: Clean up formatting
      ARM: dts: qcom: msm8974pro-castor: Add mmc aliases
      ARM: dts: qcom: msm8974pro-castor: Remove camera button definitions
      ARM: dts: qcom: msm8974pro-castor: Add debounce-interval for keys
      ARM: dts: qcom: msm8974pro-castor: Rename wifi node name
      ARM: dts: qcom: msm8974-sony-castor: Split into shinano-common
      ARM: dts: qcom: Add Sony Xperia Z3 smartphone
      ARM: dts: qcom: msm8974: Add @0 to memory node name
      ARM: dts: qcom: msm8974: Add empty chosen node
      ARM: dts: qcom: msm8974-sony-shinano: Enable vibrator

Manivannan Sadhasivam (4):
      ARM: dts: qcom: ipq8064: Add PCIe bridge node
      ARM: dts: qcom: ipq4019: Add PCIe bridge node
      ARM: dts: qcom: apq8064: Add PCIe bridge node
      ARM: dts: qcom: sdx55: Add PCIe bridge node

Rong Zhang (3):
      ARM: dts: qcom: msm8974: Split out common part of samsung-klte
      ARM: dts: qcom: msm8974-klte-common: Pin WiFi board type
      ARM: dts: qcom: msm8974: Add DTS for Samsung Galaxy S5 China (kltechn)

Stanislav Jakubek (2):
      dt-bindings: arm: qcom: Add Motorola Moto G (2013)
      ARM: dts: qcom: Add support for Motorola Moto G (2013)

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   3 +
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 359 +++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  12 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  45 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  30 +
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi       |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   6 +-
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 818 +++++++++++++++++++++
 .../boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts | 813 +-------------------
 .../dts/qcom/qcom-msm8974pro-samsung-kltechn.dts   |  16 +
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts | 574 +--------------
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 539 ++++++++++++++
 .../qcom-msm8974pro-sony-xperia-shinano-leo.dts    |  44 ++
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |  10 +
 16 files changed, 1898 insertions(+), 1376 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dts

