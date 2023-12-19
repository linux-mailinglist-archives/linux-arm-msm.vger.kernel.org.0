Return-Path: <linux-arm-msm+bounces-5323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B744A818081
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 05:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5731C20854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 04:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9904154BD;
	Tue, 19 Dec 2023 04:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZWdwCZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38615154AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 04:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4059AC433C7;
	Tue, 19 Dec 2023 04:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702959893;
	bh=3QEXJV+WM28vje35VRBP3ZG2mguZ6ZSo36q9DV4ziTs=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ZZWdwCZT99HStM65myCO9Kne1ohdykJ/+lt4bpAcKYKOlKPNDYmJyJdID+/3OmCki
	 42zGT6XKd5fj0ERH2D1vroFpsilUCfog+1k5yYOos0JtkTCbJv0MvHHPWrcWM7SjB/
	 Rg0CPvnZA87bSUUbDMrcRPtUZG1/z/JdoXlTpZg1HDgg2V6Eexi9ktYLKitxxtlu4r
	 3useyFv3vqunW7rlNClg5ptHsHhyhULEXTAq7r0Yg90SKEkCdK3gY9jW5tLCObgynW
	 KPnKIKtyIs1nxSYCLn53YJIi1xwgtXkAt6mmibDI6BRWRSXrGpz9NRSy6MS3q/9HRZ
	 3Kj9xDtgVI+rA==
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
	Luca Weiss <luca@z3ntu.xyz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Bryant Mairs <bryant@mai.rs>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Subject: [GIT PULL] Qualcomm ARM32 DeviceTree updates for v6.8
Date: Mon, 18 Dec 2023 20:29:12 -0800
Message-ID: <20231219042914.732684-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.8

for you to fetch changes up to 648002a27c6b3ae293cc415e1fbf20aaa6af8bd3:

  ARM: dts: qcom: msm8974*: Re-enable remoteprocs on various boards (2023-12-17 12:09:42 -0600)

----------------------------------------------------------------
Qualcomm ARM32 DeviceTree updates for v6.8

Support is added for HTC One Mini 2, Nokia Lumia 630, Microsoft Lumia
640, Microsoft Lumia 640 XL, Nokia Lumia 735, Nokia Lumia 830, and
Motorola Moto G 4G, all built on the MSM8226 platform.

The GPU in MSM8226 is described, and MSM8974 gains watchdog support.

The PMICs are transitioned to use interrupts-extended to properly
reference the PMIC interrupt controller, in accordance with the
DeviceTree specification.

In addition to this, a variety of stylistic and DeviceTree validation
issues are corrected.

----------------------------------------------------------------
Alexey Minnekhanov (1):
      ARM: dts: qcom: msm8974-klte: Remove unused property

André Apitzsch (1):
      ARM: dts: qcom: msm8926-motorola-peregrine: Add initial device tree

Bjorn Andersson (1):
      Merge tag 'qcom-dts-for-6.7-2' into arm32-for-6.8

Bryant Mairs (1):
      ARM: dts: qcom: Disable pm8941 & pm8226 smbb charger by default

Dmitry Baryshkov (37):
      ARM: dts: qcom-sdx55: switch USB QMP PHY to new style of bindings
      ARM: dts: qcom-sdx65: switch USB QMP PHY to new style of bindings
      ARM: dts: qcom: apq8064: correct XOADC register address
      ARM: dts: qcom: msm8960: introduce label for PMIC keypad
      ARM: dts: qcom: msm8660-surf: use keypad label directly
      ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
      ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group include clauses
      ARM: dts: qcom: strip prefix from PMIC files
      ARM: dts: qcom: apq8064: fix PMIC node labels
      ARM: dts: qcom: mdm9615: fix PMIC node labels
      ARM: dts: qcom: msm8660: fix PMIC node labels
      ARM: dts: qcom: msm8960: fix PMIC node labels
      ARM: dts: qcom: apq8064: move PMIC interrupts to the board files
      ARM: dts: qcom: mdm9615: move PMIC interrupts to the board files
      ARM: dts: qcom: msm8660: move PMIC interrupts to the board files
      ARM: dts: qcom: msm8960: move PMIC interrupts to the board files
      ARM: dts: qcom: msm8960: split PMIC to separate dtsi files
      ARM: dts: qcom: apq8064: split PMICs to separate dtsi files
      ARM: dts: qcom: mdm9615: split PMIC to separate dtsi files
      ARM: dts: qcom: msm8660: split PMIC to separate dtsi files
      ARM: dts: qcom: pm8058: reorder nodes
      ARM: dts: qcom: pm8921: reorder nodes
      ARM: dts: qcom: pm8018: move reg property
      ARM: dts: qcom: pm8921: move reg property
      ARM: dts: qcom: pm8058: use defined IRQ flags
      ARM: dts: qcom: pm8921: switch to interrupts-extended
      ARM: dts: qcom: pm8018: switch to interrupts-extended
      ARM: dts: qcom: pm8058: switch to interrupts-extended
      ARM: dts: qcom: apq8064: move RPM regulators to board files
      ARM: dts: qcom: mdm9615: move RPM regulators to board files
      ARM: dts: qcom: msm8660: move RPM regulators to board files
      ARM: dts: qcom: msm8960: drop useless rpm regulators node
      ARM: dts: qcom: msm8974: move regulators to board files
      ARM: dts: qcom: pm8921: Disable keypad by default
      ARM: dts: qcom: apq8060-dragonboard: rename mpp ADC channels to adc-channel
      ARM: dts: qcom: ipq8064: drop qcom, prefix from SSBI node name
      ARM: dts: qcom: mdm9615: drop qcom, prefix from SSBI node name

Johan Hovold (1):
      ARM: dts: qcom: sdx55: fix USB wakeup interrupt types

Krzysztof Kozlowski (5):
      ARM: dts: qcom: sdx65: correct PCIe EP phy-names
      ARM: dts: qcom: sdx65: add missing GCC clocks
      ARM: dts: qcom: sdx65: correct SPMI node name
      ARM: dts: qcom: minor whitespace cleanup around '='
      ARM: dts: qcom: ipq4019: add dedicated SDHCI compatible

Luca Weiss (7):
      ARM: dts: qcom: msm8974: replace incorrect indentation in interconnect
      ARM: dts: qcom: msm8974: sort nodes by reg
      ARM: dts: qcom: msm8226: provide dsi phy clocks to mmcc
      ARM: dts: qcom: Add support for HTC One Mini 2
      ARM: dts: qcom: msm8226: Add GPU
      ARM: dts: qcom: msm8974: Remove bogus cd-gpio pinctrl
      ARM: dts: qcom: msm8974*: Re-enable remoteprocs on various boards

Manivannan Sadhasivam (1):
      ARM: dts: qcom: Use "pcie" as the node name instead of "pci"

Matti Lehtimäki (1):
      ARM: dts: qcom: msm8974: Add watchdog node

Rayyan Ansari (5):
      ARM: dts: qcom: add common dt for MSM8x26 Lumias along with Nokia Lumia 630
      ARM: dts: qcom: add device tree for Microsoft Lumia 640
      ARM: dts: qcom: add device tree for Microsoft Lumia 640 XL
      ARM: dts: qcom: add device tree for Nokia Lumia 735
      ARM: dts: qcom: add device tree for Nokia Lumia 830

 arch/arm/boot/dts/qcom/Makefile                    |   7 +
 arch/arm/boot/dts/qcom/pm8018.dtsi                 |  55 +++
 arch/arm/boot/dts/qcom/pm8058.dtsi                 | 159 +++++++++
 .../dts/qcom/{qcom-pm8226.dtsi => pm8226.dtsi}     |   2 +
 arch/arm/boot/dts/qcom/pm8821.dtsi                 |  22 ++
 .../dts/qcom/{qcom-pm8841.dtsi => pm8841.dtsi}     |   0
 arch/arm/boot/dts/qcom/pm8921.dtsi                 | 137 ++++++++
 .../dts/qcom/{qcom-pm8941.dtsi => pm8941.dtsi}     |   2 +
 .../dts/qcom/{qcom-pma8084.dtsi => pma8084.dtsi}   |   0
 .../boot/dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi}  |   0
 .../boot/dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi}  |   0
 .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |   4 +-
 .../boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts |   4 +-
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |   4 +-
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |   2 +-
 .../arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 164 +++++----
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |  70 ++--
 arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  35 +-
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  42 ++-
 .../qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts   | 111 +++---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 203 +----------
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |  35 +-
 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts        |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |   4 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |   8 +-
 .../dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts  |   4 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 143 +++++++-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           | 183 +---------
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    | 327 ++++++++++++++++++
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |  17 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |  17 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |  23 ++
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |  48 ++-
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts       |  61 ++--
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           | 217 +-----------
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  | 372 +++++++++++++++++++++
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |  53 +++
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |  67 ++++
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   | 291 ++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  27 +-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   7 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  45 +--
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    |  33 +-
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   |  35 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 122 +++----
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  33 +-
 .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  35 +-
 .../boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts |  13 +-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  35 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts          |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |   2 +-
 .../boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts   |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |  45 ++-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |  51 +--
 57 files changed, 2398 insertions(+), 990 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8018.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/pm8058.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8226.dtsi => pm8226.dtsi} (99%)
 create mode 100644 arch/arm/boot/dts/qcom/pm8821.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8841.dtsi => pm8841.dtsi} (100%)
 create mode 100644 arch/arm/boot/dts/qcom/pm8921.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8941.dtsi => pm8941.dtsi} (99%)
 rename arch/arm/boot/dts/qcom/{qcom-pma8084.dtsi => pma8084.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi} (100%)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts

