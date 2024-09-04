Return-Path: <linux-arm-msm+bounces-30793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 716CB96C793
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A40B41C215EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 19:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2885713C3C2;
	Wed,  4 Sep 2024 19:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h++20Q4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4E12FF70
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725478351; cv=none; b=tmWT+6SDODFn028659GSteHWBgwp/UujMPvegmDCIWg4yJxXTjcyccF5fZtcXqUbeuwG9yA4m2MAjgK8t/eXSskASu/IDXNUTyrOPW9JIdhq5COLI/ZsldjOOyXv9lagyZ5+uXr+laAMJiPk8q+XIEmSY+esCDJK2DmpztjrazI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725478351; c=relaxed/simple;
	bh=CoSHc/uwcCheAIeCjQNOGGkVLKV9Vx9ISQxOjA5g+7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WSrMAubssJupir2HQuqIyCHxDkNo3f+nEDC+OrEwB9fX37JmO7RvaegOLGg9XK6dURI0LhGGpCfpIX5OMSGHmPXBWf92+r/IBGCf+24/ueAwtJRkjQOMtukg26gMwtfYquYa9Ei9JzMWpMBsrJ+1+7unwNH6aBsRi6xzfXUdaKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h++20Q4v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD95C4CEC2;
	Wed,  4 Sep 2024 19:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725478350;
	bh=CoSHc/uwcCheAIeCjQNOGGkVLKV9Vx9ISQxOjA5g+7A=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=h++20Q4vKdV2h2DYopceBXEmt8k2O1ng8E7WKWkrjNPuC9rBLmvLEJliTRYI7AuhS
	 Rtj0ivTdjEVUVvYeFscWUg49KuYGXrsg1gnnOw/K1OPWPDFrtAciYdOOmlmw9KGIBF
	 3eAi7JRYgyD8N8DGYZYjogd0S2pfSg2Mx6AVcTDnY7s1nrNRC1OmxrBxahhC1BSe23
	 zuGzcSPy7niCkSLHVltA0DIERJf5paW/jGVeeX5ccrRXrGmiEA2KXWb+ZzIOY0XNzL
	 AbKret6V13NhpGsv3oXOIyeNY7WHVATX4F0Z7FDFiG8lwgE2Y69FRs6l3obcjgi8lT
	 f/BZhduq9Y3jw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Rayyan Ansari <rayyan.ansari@linaro.org>,
	Luca Weiss <luca@lucaweiss.eu>,
	Bingwu Zhang <xtexchooser@duck.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rayyan Ansari <rayyan@ansari.sh>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.12
Date: Wed,  4 Sep 2024 14:32:27 -0500
Message-ID: <20240904193228.15466-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.12

for you to fetch changes up to a11a87a9a66e5ec1213c712ae681dbda37c2b1b8:

  ARM: dts: qcom: add generic compat string to RPM glink channels (2024-08-14 21:41:43 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.12

MSM8226 gains CPU frequency scaling support and CPU thermal zones wired
up. The Nokia Lumia 630 and 830 gains inertial sensors.

Samsung Galaxy S5 gains pstore functionality.

A range of fixes for DeviceTree validation issues are added.

----------------------------------------------------------------
Bingwu Zhang (1):
      ARM: dts: qcom: msm8974pro-samsung-klte: Add pstore node

Dmitry Baryshkov (1):
      ARM: dts: qcom: add generic compat string to RPM glink channels

Luca Weiss (3):
      ARM: dts: qcom: msm8226: Add CPU frequency scaling support
      ARM: dts: qcom: msm8226: Hook up CPU cooling
      ARM: dts: qcom: msm8226: Convert APCS usages to mbox interface

Rayyan Ansari (9):
      ARM: dts: qcom: pma8084: add pon node
      ARM: dts: qcom: apq8064-pins: correct error in drive-strength property
      ARM: dts: qcom: asus,nexus7-flo: remove duplicate pinctrl handle in i2c nodes
      ARM: dts: qcom: apq8064: adhere to pinctrl dtschema
      ARM: dts: qcom: ipq8064: adhere to pinctrl dtschema
      ARM: dts: qcom: ipq4019: adhere to pinctrl dtschema
      ARM: dts: qcom: apq8064: drop reg-names on sata-phy node
      ARM: dts: qcom: {a,i}pq8064: correct clock-names in sata node
      ARM: dts: qcom: msm8226-microsoft-common: Add inertial sensors

 arch/arm/boot/dts/qcom/pma8084.dtsi                |  16 +-
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   4 -
 arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  25 +-
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  25 +-
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      | 362 ++++++++-------------
 .../qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts   |  10 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  39 ++-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |  34 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts   |  27 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi |  26 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi |  14 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts    |   8 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi |   6 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dts      |  11 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts     |  76 ++---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           | 116 +++----
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |  26 ++
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |   3 +
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 136 +++++++-
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |   3 +
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   4 +-
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  |  13 +
 24 files changed, 500 insertions(+), 488 deletions(-)

