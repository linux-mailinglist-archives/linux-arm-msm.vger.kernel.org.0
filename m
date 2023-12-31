Return-Path: <linux-arm-msm+bounces-6168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8738209A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 04:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84920B218DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 03:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D992DECE;
	Sun, 31 Dec 2023 03:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMWWEa0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D48EB8
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 03:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AC5C433C8;
	Sun, 31 Dec 2023 03:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703993823;
	bh=dtXOyNjIamsGD+0CGGhZy5sXzWxF8N6cU6/Uo6CMNqo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=JMWWEa0LiGrt6Zl6fuPfvXepAKJvJMXvSoJbmnHPhbaD8mEVYMWnIMPyVCDdyWP1K
	 cGiS7a1GYwkhpXCgBkh35fxFgLeSRicwJPf+lvlYqodOP6sLphra+WJV0GexIIlV2L
	 O4T+Yv2n3gpRqInUZnIeKNYDnASsbhJPKQk2qVzGNQIUxup7o7dutZP74qF/LIOjRs
	 KCEfTHtmRnYnfpIzeBTn4JZdMNA/ayyMvIrjbFeB8dneTejvPt/hMC5cJrN+CjQGxm
	 BxnH6rpNhq9GL+01Eoh/FtGA2pxjxkjOVT4651DZvt+zDlRfUyPebo3kRI8QRH0biW
	 uI/JWZcVJpzvg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.8
Date: Sat, 30 Dec 2023 19:41:06 -0800
Message-ID: <20231231034108.3262678-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit b7b9a6aa7aea2bcba2d35d65e4ce2913115485a3:

  arm64: dts: qcom: sc8180x-primus: Allow UFS regulators load/mode setting (2023-12-17 14:28:17 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.8-2

for you to fetch changes up to 78403b37f6770441f80a78d13772394731afe055:

  arm64: dts: qcom: sc8180x: Fix up PCIe nodes (2023-12-20 06:26:30 -0600)

----------------------------------------------------------------
A few more Qualcomm Arm64 DeviceTree updates for v6.8

This corrects the rate of the UTMI clock on IPQ6018 USB0. The SDHCI
controller on SC7280 gains missing markings for being cache-coherent.
For SC8180X a typo in assignment of PCIe refgen clocks is corrected, PCI
controllers are marked cache-coherent, and the USB SS PHY interrupts are
corrected to allow wakeup.

Similarly USB HS PHY and SS PHY interrupts are corrected to allow
wakeup on SDM670.

On SM8550 the X3 cluster idle state is properly described, and the
latency numbers are adjusted for all the idle states.

The PM8550 regulator supplies on X1E are corrected to match the driver
and binding, and the timer node is updated to avoid an unnecessary
validation error.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: x1e80100-qcp: Fix supplies for some LDOs in PM8550

Chukun Pan (1):
      arm64: dts: qcom: ipq6018: fix clock rates for GCC_USB0_MOCK_UTMI_CLK

Johan Hovold (3):
      arm64: dts: qcom: sdm670: fix USB DP/DM HS PHY interrupts
      arm64: dts: qcom: sdm670: fix USB SS wakeup
      arm64: dts: qcom: sc8180x: fix USB SS wakeup

Konrad Dybcio (5):
      arm64: dts: qcom: sc7280: Mark SDHCI hosts as cache-coherent
      arm64: dts: qcom: sm8550: Separate out X3 idle state
      arm64: dts: qcom: sm8550: Update idle state time requirements
      arm64: dts: qcom: sc8180x: Mark PCIe hosts cache-coherent
      arm64: dts: qcom: sc8180x: Fix up PCIe nodes

Krzysztof Kozlowski (1):
      arm64: dts: qcom: x1e80100: align mem timer size cells with bindings

 arch/arm64/boot/dts/qcom/ipq6018.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi      |  2 ++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi     | 14 +++++++++-----
 arch/arm64/boot/dts/qcom/sdm670.dtsi      |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi      | 32 ++++++++++++++++++++-----------
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts |  4 +---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 20 +++++++++----------
 7 files changed, 48 insertions(+), 34 deletions(-)

