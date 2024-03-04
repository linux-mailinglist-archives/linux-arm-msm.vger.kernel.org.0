Return-Path: <linux-arm-msm+bounces-13201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8386F8EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 04:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F753B20B87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 03:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A61E33F7;
	Mon,  4 Mar 2024 03:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnCkEuvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5501A2F35
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 03:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709523310; cv=none; b=TGm+KcLBDMQbstxyKFHqPN0ApGMz3sAOD8J0KRKggs6dlfPVSxj68tiqRpWmPQevvTMFPurs67wE/RRCYqGcVLRdl4cycLlTkk0XLtQTZJxzEbfxCm/a52ftey/hZy94fHa8NT0q8C+x1IrfXQ9QTsfX36YPNAnCClY1eS0HF+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709523310; c=relaxed/simple;
	bh=wiS4o8btETqECDF8hJjrN4lEs83+Ox2XTTzoCe1lReg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bto8AMdm6pfgVzd0nbf85SHeeOBLF4ryZks25TXSbnc0RiXT0XKjE1ZJCnBCBwFxRbY71m3uej47XVeH36H3vR3IHbo7fWhIw9u7f9ZLeT+Ng3o5MBQueTkcrbWmrOHnw652JOoaNQ0dIsjPxTEn2CIzr201Umz9Q913nJyXSGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnCkEuvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A23BC433C7;
	Mon,  4 Mar 2024 03:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709523309;
	bh=wiS4o8btETqECDF8hJjrN4lEs83+Ox2XTTzoCe1lReg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=WnCkEuvfEHDRGjGNaH8p45noD42nZLb4d5ZBXuiCqzKhqIwWtUnrTh2gP/Z7uflSt
	 Ujxv7yA6yx5Jh6RIImb4CeuV51RmiIVZmQbs31VmuxmdcuSpi4A2/ul++YuvXqJGuw
	 czvZw0SQBGvGcPweLbPVtDDdYBCkqbFxNL2SMqJnyNonywMoIRw+TOZbQkmxdzq7vA
	 E24ONO2Yi1Lxx2siZ0mTPPEr9YOXeKcz0sEL9pQL3AL+g5fbpkGggQA/f8gzctiPfj
	 DlXJXYjqH8jeM5ZYV5BeQZcap/9wnQ0JGSS7qmLJZpKJI2cyUTiR4OVWrjfhoq2SDc
	 0bEyCWIM4JrJA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Stefan Hansson <newbyte@postmarketos.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Robert Marko <robimarko@gmail.com>,
	Craig Tatlor <ctatlor97@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [GIT PULL] Qualcomm ARM32 DeviceTree changes for v6.9
Date: Sun,  3 Mar 2024 21:35:03 -0600
Message-ID: <20240304033507.89751-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.9

for you to fetch changes up to 450e178facd62b23bb7638f20a3c99436ee80640:

  ARM: dts: qcom: samsung-matisse-common: Add UART (2024-02-18 23:00:31 -0600)

----------------------------------------------------------------
Qualcomm ARM32 DeviceTree changes for v6.9

Support for the Samsung Galaxy Tab 4 10.1 LTE is added.

On MSM8226 CPU, SAW and ACC nodes are introduced to enable SMP support.
Watchdog definition is also added, and all nodes are sorted and cleaned
up.
rmtfs memory is defined on HTC One Mini 2, vibrator support is addedto
LG G Watch R, touch keycodes are defined for Samsung Galaxy Tab 4.
The Samsung Galaxy Tab 4 DeviceTree is refactored to allow more variants
to be introduced easily.

The SAW nodes across APQ8064, IPQ8064, MSM8960 and MSM8974 are updated
based on recent work on the binding and driver.

On IPQ8064 SAW nodes are cleaned up, and unused reset-names is dropped
from DWC3.

On MSM8960 GSBI3 and the I2C bus therein is introduced, in order to
introduce touchscreen support on the Samsung Galaxy Express SGH-I437.
gpio-keys are introduced on the same.

On MSM8974 the QFPROM register size is corrected. The order of the
clocks in the SDX65 DWC3 node is corrected to match the binding.

For a variety of platforms interrupt-related constants are replaced
with defined.

The mach-qcom Kconfig options are cleaned up, to avoid unnecessary
per-platform options.

----------------------------------------------------------------
Craig Tatlor (1):
      ARM: dts: qcom: msm8974: correct qfprom node size

David Heidelberg (1):
      ARM: dts: qcom: msm8960: drop 2nd clock frequency from timer

Dmitry Baryshkov (20):
      iommu/msm-iommu: don't limit the driver too much
      ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
      ARM: qcom: merge remaining subplatforms into sensible Kconfig entry
      ARM: dts: qcom: apq8084: use new compat string for L2 SAW2 unit
      ARM: dts: qcom: msm8974: use new compat string for L2 SAW2 unit
      ARM: dts: qcom: msm8960: use SoC-specific compatibles for SAW2 devices
      ARM: dts: qcom: ipq4019: use SoC-specific compatibles for SAW2 devices
      ARM: dts: qcom: ipq8064: use SoC-specific compatibles for SAW2 devices
      ARM: dts: qcom: apq8064: rename SAW nodes to power-manager
      ARM: dts: qcom: apq8084: rename SAW nodes to power-manager
      ARM: dts: qcom: msm8960: rename SAW nodes to power-manager
      ARM: dts: qcom: msm8974: rename SAW nodes to power-manager
      ARM: dts: qcom: ipq4019: rename SAW nodes to power-manager
      ARM: dts: qcom: ipq8064: rename SAW nodes to power-manager
      ARM: dts: qcom: apq8064: declare SAW2 regulators
      ARM: dts: qcom: msm8960: declare SAW2 regulators
      ARM: dts: qcom: apq8084: drop 'regulator' property from SAW2 device
      ARM: dts: qcom: msm8974: drop 'regulator' property from SAW2 device
      ARM: dts: qcom: ipq4019: drop 'regulator' property from SAW2 devices
      ARM: dts: qcom: ipq8064: drop 'regulator' property from SAW2 devices

Ivaylo Ivanov (1):
      ARM: dts: qcom: msm8226: Add CPU and SAW/ACC nodes

Krzysztof Kozlowski (4):
      ARM: dts: qcom: ipq8064: drop unused reset-names from DWC3 node
      ARM: dts: qcom: sdx65: correct clock order in DWC3 node
      ARM: dts: qcom: ipq4019: correct clock order in DWC3 node
      ARM: dts: qcom: use defines for interrupts

Luca Weiss (2):
      ARM: dts: qcom: msm8926-htc-memul: Add rmtfs memory node
      ARM: dts: qcom: apq8026-lg-lenok: Add vibrator support

Matti Lehtimäki (3):
      ARM: dts: qcom: apq8026-samsung-matissewifi: Configure touch keys
      ARM: dts: qcom: msm8226: Sort and clean up nodes
      ARM: dts: qcom: msm8226: Add watchdog node

Robert Marko (2):
      ARM: dts: qcom: ipq4019-ap.dk01.1: use existing labels for nodes
      ARM: dts: qcom: ipq4019-ap.dk01.1: align flash node with bindings

Rudraksha Gupta (3):
      ARM: dts: qcom: msm8960: expressatt: Add gpio-keys
      ARM: dts: qcom: msm8960: Add gsbi3 node
      ARM: dts: qcom: msm8960: expressatt: Add mXT224S touchscreen

Stefan Hansson (3):
      ARM: dts: qcom: samsung-matisse-common: Add initial common device tree
      ARM: dts: qcom: Add support for Samsung Galaxy Tab 4 10.1 LTE (SM-T535)
      ARM: dts: qcom: samsung-matisse-common: Add UART

 arch/arm/Makefile                                  |   4 +-
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  38 ++
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts | 452 +------------
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  70 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |  13 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi | 138 ++--
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  35 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  12 +-
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  | 457 +++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 736 ++++++++++++---------
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |  17 +-
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  15 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |  37 ++
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  21 +
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  71 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  48 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  33 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |  18 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |  34 +-
 arch/arm/mach-qcom/Kconfig                         |  41 +-
 drivers/iommu/Kconfig                              |   2 +-
 22 files changed, 1307 insertions(+), 986 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi

