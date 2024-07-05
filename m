Return-Path: <linux-arm-msm+bounces-25317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D69280E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 05:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0A681F23BB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 03:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79687364BE;
	Fri,  5 Jul 2024 03:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9rSH4cp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBF1643D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 03:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720150169; cv=none; b=eVtPKxzD4xUlpCudlRGFyrRnNJMVyeiS4ER5xbr/2eG3GG3nEPSAjNmj48l+5VHuPkNZr/qe+XY5UrMy7zSd2JRJ8Fxjj2A4dhqbiO+LDYXsQvzqiI/WTW6t9S/b9Nti6W9wTxcAb7xlQtmKQEGjViyxweFEEISEa46FhqXuNCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720150169; c=relaxed/simple;
	bh=Ps8xXKZWmPgGRHEifvv2uPVP/BAoklxGIoNc4O9nlDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kdH9BM1GJJEsnHzglen6pRLkOOK6PJr4EXvsPg+GwkpP/lBNZ1qJLMtciQ1uchrzaJezSOTeuiP3e9lRe2cU+UhGSq/TmsZQ/PKyBvvwYt5jc0Wn1+F/kS8bTF8mOELxEN42TcqPkEzCWWuprBljA2r2zSS5SfRR/4Voo6CXUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9rSH4cp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B243C116B1;
	Fri,  5 Jul 2024 03:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720150168;
	bh=Ps8xXKZWmPgGRHEifvv2uPVP/BAoklxGIoNc4O9nlDk=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=I9rSH4cpeC7U22DCSdLDfaZRYa5PbvOSVmza4gncSS4VuGRGniDPhLGgZ1QnZFo+e
	 xN2heeGcubC8TkXHAPqgoM67RNwIHCcpsbQ2FOJWsZnRjngIf3Dm7GaNCAxQwlrMqu
	 655Ri7F+JX6svSW4XDgGG2J00x7RLYW6xbX0YdPAOMAItbD4CE9IlgE4MocEwyAdpB
	 sD7Sf02MTFlBRbqDJeS06pPuwNvNTpt7jUoedQ9N9lbVMoYkUVIPzR3RME0V9J7P1H
	 AAGj06XOwfjnN6LjbOqSwS5iVO6C3pQKi/reb1JiYiAHR9VOefwYzv0m+RIVLv6tPN
	 PYyTyRkcXWB6A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Valeriy Klimin <vdos63@gmail.com>,
	Adam Honse <calcprogrammer1@gmail.com>,
	Alexandre Messier <alex@me.ssier.org>,
	Bryant Mairs <bryant@mai.rs>,
	Luca Weiss <luca@lucaweiss.eu>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.11
Date: Thu,  4 Jul 2024 22:29:24 -0500
Message-ID: <20240705032926.13333-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.11

for you to fetch changes up to 2a5454d0fe5684855581f8ad958afbcdc476fd64:

  ARM: dts: qcom: qcom-msm8226-samsung-ms013g: Add initial device tree (2024-07-02 22:15:57 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.11

This introduces new support for the Sony Xperia Z3 Compact, HTC One
(M8), Samsung Galaxy Tab 4 8.0 Wi-Fi, Samsung Galaxy Grand 2, and
Samsung Galaxy Note 3 devices.

The Motorola Moto G and Motorola Moto G 4G gains accelerometer and
magnetometer support, with the latter also getting framebuffer supplies
and a temperature sensor wired up.

The SMBB (charger block) is enabled across all MSM8x26 Lumia devices, as
this is used for USB state changes.

The operating mode for SDC regulator is set to HPM on Sony Xperia
"Shinano" family to avoid brownouts on uSD-cards.

The panel on LGE Nexus 5 is connected to the backlight, to make this
turn off on blanking.

MSM8974 is transitioned to use the mailbox-abstraction for invoking
PC interrupts on remote processors.

----------------------------------------------------------------
Adam Honse (1):
      ARM: dts: qcom: msm8974: Add Samsung Galaxy Note 3

Alexandre Messier (1):
      ARM: dts: qcom: Add initial support for HTC One (M8)

André Apitzsch (3):
      ARM: dts: qcom: msm8926-motorola-peregrine: Add accelerometer, magnetometer, regulator
      ARM: dts: qcom: msm8926-motorola-peregrine: Update temperature sensor
      ARM: dts: qcom: msm8926-motorola-peregrine: Add framebuffer supplies

Bryant Mairs (1):
      ARM: dts: qcom: Add support for Samsung Galaxy Tab 4 8.0 Wi-Fi

Dmitry Baryshkov (6):
      ARM: dts: qcom: apq8064: drop #power-domain-cells property of GCC
      ARM: dts: qcom: msm8660: drop #power-domain-cells property of GCC
      ARM: dts: qcom: msm8960: drop #power-domain-cells property of GCC
      ARM: dts: qcom: ipq4019: drop #power-domain-cells property of GCC
      ARM: dts: qcom: ipq8064: drop #power-domain-cells property of GCC
      ARM: dts: qcom: mdm9615: drop #power-domain-cells property of GCC

Krzysztof Kozlowski (2):
      ARM: dts: qcom: use generic node names for Adreno and QFPROM
      ARM: dts: qcom: apq8064: drop incorrect ranges from QFPROM

Luca Weiss (5):
      ARM: dts: qcom: msm8974-hammerhead: Hook up backlight
      ARM: dts: qcom: msm8974-hammerhead: Update gpio hog node name
      ARM: dts: qcom: msm8974: Use proper compatible for APCS syscon
      ARM: dts: qcom: msm8974: Use mboxes properties for APCS
      ARM: dts: qcom: msm8974: Use mboxes in smsm node

Raymond Hackley (1):
      ARM: dts: qcom: qcom-msm8226-samsung-ms013g: Add initial device tree

Rayyan Ansari (1):
      ARM: dts: qcom: msm8226-microsoft-common: Enable smbb explicitly

Stanislav Jakubek (1):
      ARM: dts: qcom: motorola-falcon: add accelerometer, magnetometer

Valeriy Klimin (2):
      ARM: dts: qcom: Add Sony Xperia Z3 Compact smartphone
      ARM: dts: qcom: msm8974-sony-shinano: increase load on l21 for sdhc2

 arch/arm/boot/dts/qcom/Makefile                    |   5 +
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts |  53 ++
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   | 573 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |   7 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |   1 -
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |   3 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           |   1 -
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |   4 +
 .../boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts  | 386 ++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |   4 +-
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |   1 -
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   | 121 +++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |   1 -
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    |   6 +-
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 401 ++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  28 +-
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 353 +++++++++++++
 .../qcom-msm8974pro-sony-xperia-shinano-aries.dts  |  44 ++
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi |   2 +
 20 files changed, 1967 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dts

