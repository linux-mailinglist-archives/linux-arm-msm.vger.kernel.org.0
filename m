Return-Path: <linux-arm-msm+bounces-57770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D78FBAB5E82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 23:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ACB3465B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 21:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C483E1FDA94;
	Tue, 13 May 2025 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klrV1gFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C727455
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172481; cv=none; b=XoF5b2TxQFL7yBkole4lseQcX1LCfxOCBCASuwXP8nSjHbSjXE2IIuw7wk+8RUPwnNHn+X4AqwOVFrUMAJAdQFrkJrs0JH7Wda9aGKErAOMpb5RuvkD0HZIcxVJZ1i710UgigreP9ecdZKwNh0obbBLMTHMRSeoAUomiZVL3M1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172481; c=relaxed/simple;
	bh=WD8O7lX1zBmFws0ybfoUY7TTtP+oICj+25zM+HnkvPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NsW5HkWQ9TohraYz04K5sZk9ZHSQbShZcJPSlD3L8bLNX+dZs9NpWo5nC5Wfqd0B7+/ooc2314Rz7u0HI3ZQkVFce+rweuV7dwzbdear6/ybDSLRM9lmgLxqiM1GH/koI5k+D9co7aFRjNUWqavA0SF98FfG56Jr9Etc2MlTD3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klrV1gFJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBD5C4CEEF;
	Tue, 13 May 2025 21:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747172478;
	bh=WD8O7lX1zBmFws0ybfoUY7TTtP+oICj+25zM+HnkvPg=;
	h=From:To:Cc:Subject:Date:From;
	b=klrV1gFJf3pUr/VTHNKF7qDz8+UX0JWmI5uRi2AGL+slDbUyFnXSJNR+EeiOunezG
	 gCnLkRgoQN8qIQG6er+2FJqfTi/MQDI5nAGA7bqkYH3NbAxap4MyJFWWpUyimoFr0D
	 BUsXrO6Wo8Mp1R00C9RR1Hd+5xdeOqCgcSDUXnugLT+C6LI1S1+V9mGAOekCX/Iq9X
	 hc1QAmwEu4zQnOCM/xIqy3Pfjpkx0fiS47z65thlXpp02NfnaK8dkTfVPSMBkDUg4I
	 lUPw+H0YqG4MWoEjWdHwW+Aq0BuAuepltt93piDR7/MyGSolzHbYirT8PCCvsVNPDB
	 yLSYXsM1H/1Rg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ivan Belokobylskiy <belokobylskij@gmail.com>,
	Sanjay Chitroda <quic_ckantibh@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.16
Date: Tue, 13 May 2025 22:41:09 +0100
Message-ID: <20250513214111.43401-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.16

for you to fetch changes up to f2420037d90a8354594b3da541e19dcbb60c75e1:

  ARM: dts: qcom: apq8064: move replicator out of soc node (2025-05-13 17:00:59 +0100)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.16

Introduce support for the AP8064-based LG Nexus 4. MSM8226 is extended
with modem-related features, the LTE-capable variant MSM8926 is
introduced, and modem support is enabled on Samsung Galaxy Tab 4.

Display-related clocks and power-domains are defined for the simple
framebuffer of Motorola Moto G, to allow booting without
clk_ignore_unused and pd_ignore_unused.

On MSM8960 SDCC BAM and thermal sensor (tsens) is introduced.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge branch 'arm32-for-6.15' into arm32-for-6.16

David Heidelberg (1):
      ARM: dts: qcom: apq8064-lg-nexus4-mako: Enable WiFi

Dmitry Baryshkov (5):
      ARM: dts: qcom: apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node

Ivan Belokobylskiy (1):
      ARM: dts: qcom: Initial dts for LG Nexus 4

Krzysztof Kozlowski (3):
      ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant
      ARM: dts: qcom: msm8226: Use the header with DSI phy clock IDs
      ARM: dts: qcom: msm8974: Use the header with DSI phy clock IDs

Luca Weiss (4):
      ARM: dts: qcom: msm8226: Add modem remoteproc node
      ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
      ARM: dts: qcom: msm8926-htc-memul: Enable modem

Matti Lehtimäki (3):
      ARM: dts: qcom: msm8226: Add node for TCSR halt regs
      ARM: dts: qcom: msm8226: Add smsm node
      ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem

Rob Herring (Arm) (2):
      ARM: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
      ARM: dts: qcom: ipq4019: Drop redundant CPU "clock-latency"

Rudraksha Gupta (2):
      ARM: dts: qcom: msm8960: Add BAM
      ARM: dts: qcom: msm8960: Add thermal sensor (tsens)

Sanjay Chitroda (1):
      ARM: dts: qcom: Fix indentation errors

Stanislav Jakubek (4):
      ARM: dts: qcom: msm8226-motorola-falcon: add clocks, power-domain to simpleFB
      ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock frequencies
      ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132 to 5.4V
      ARM: dts: qcom: msm8226-motorola-falcon: specify vddio_disp output voltage

 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts |  22 +-
 arch/arm/boot/dts/qcom/msm8926.dtsi                |  11 +
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |   1 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   2 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 359 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  88 +++--
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |   4 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts   |   4 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi |   2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |   6 +-
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |   6 +-
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |   1 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  19 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 164 +++++++++-
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |   1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |   1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |   2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |   5 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  99 +++++-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  21 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |   2 +-
 27 files changed, 758 insertions(+), 83 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/msm8926.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts

