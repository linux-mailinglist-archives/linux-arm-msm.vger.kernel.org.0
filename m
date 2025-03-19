Return-Path: <linux-arm-msm+bounces-51962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED0A68F29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDFF316B3CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930891ADC97;
	Wed, 19 Mar 2025 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvf/gY87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7D1531D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742394518; cv=none; b=Pt62mdbhTN5YGSC1Q08qt2iFOxSc68eBSvZTmTTrjgwv1EDq03BAUnkf/LFfAHlCez1LFAqAdFUoY24nBWYgUnzJ2FSwTMjCjMk5dnbNjpXCw8IRGX3rRBYuaMmMzt5zwv999i/kZHuTMuNDo4dj3uYcFU/I9SY04Uq25VCumLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742394518; c=relaxed/simple;
	bh=ZNjmKzkOVckbQ6QKTgj5AFXZPrq7OW3mSTiRZa5UIpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JDKzX6Rl4dxFqqmKjya9IXcjRVQAVwvDQMnXumvTjSQ4c6D32Yrgq8mt2wC5h1CgXzoii2G5loCkcwJza2BIa5PNrtsexD7Z4308qglqDJhPlvDbi5bOmuaGWU6wXocMG4LxV4ao64cv7EnNPxlWegHrN0etvVbNX62yXRpCsnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvf/gY87; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40959C4CEE4;
	Wed, 19 Mar 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742394517;
	bh=ZNjmKzkOVckbQ6QKTgj5AFXZPrq7OW3mSTiRZa5UIpw=;
	h=From:To:Cc:Subject:Date:From;
	b=qvf/gY87xRj3fVupCpHfcNwePMPxspYJSgmHW89UhhAAgpbhnHpDJ9EBmTwAidGm3
	 61qI1/NHKJenUL8OKHsJpzUw4JGqyPdQGxAkt8PIJ4JvlLm9R+dIfZxBzapqUWKmA6
	 /BKrspraqLxqr2CXnQ2sNUIL/jmvKrij3TX3IirkJUTBvCGNUvdzCyYkXP7SvvGE5n
	 K0aXsi0mdiy3cQ2fr2ICHjT5/oyRAA45/LuAryz5/Fdn3o2CBqUxD89UIRqYacawrh
	 YQidbJdE/BcU/qfU9wr/yFWSnXr/gDGE45SXopVAOofdS4RwF9K0TCD4G5au05oArX
	 wxbe/39VccVaA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Ivan Belokobylskiy <belokobylskij@gmail.com>
Subject: [GIT PULL] More Qualcomm Arm32 Devicetree updates for v6.15
Date: Wed, 19 Mar 2025 09:28:34 -0500
Message-ID: <20250319142836.2279859-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit adbbdcf4b2d6556721b580385ba387baca5c26ee:

  ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant (2025-03-03 22:36:52 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.15-2

for you to fetch changes up to f5b7564fedcfd32df68d56781b9d7698343f8fbf:

  ARM: dts: qcom: Initial dts for LG Nexus 4 (2025-03-16 21:51:58 -0500)

----------------------------------------------------------------
More Qualcomm Arm32 Devicetree updates for v6.15

Introduce DeviceTree for the LG Nexus 4. Describe the modem remoteproc
and related components on MSM8226 and enable the modem on Samsung Galaxy
Tab 4 10.1 and HTC One Mini 2.

----------------------------------------------------------------
Ivan Belokobylskiy (1):
      ARM: dts: qcom: Initial dts for LG Nexus 4

Luca Weiss (4):
      ARM: dts: qcom: msm8226: Add modem remoteproc node
      ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
      ARM: dts: qcom: msm8926-htc-memul: Enable modem

Matti Lehtimäki (3):
      ARM: dts: qcom: msm8226: Add node for TCSR halt regs
      ARM: dts: qcom: msm8226: Add smsm node
      ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem

Rudraksha Gupta (2):
      ARM: dts: qcom: msm8960: Add BAM
      ARM: dts: qcom: msm8960: Add thermal sensor (tsens)

 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/msm8926.dtsi                |  11 +
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |   1 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   2 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 341 +++++++++++++++++++++
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |   6 +-
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |   1 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  19 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 155 ++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |   1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |   1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |   2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |   5 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  99 +++++-
 17 files changed, 652 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/msm8926.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts

