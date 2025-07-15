Return-Path: <linux-arm-msm+bounces-64900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7456B04DC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 04:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35CC44A81F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 02:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7044E1A83ED;
	Tue, 15 Jul 2025 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TH1ta0bu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A82A1AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752545920; cv=none; b=c1vaKNnXMTTyDquq6FVNh0XnTZVaQ9q37IUzvuNFJ/2rHHpJAn58Qxi77ERrWk2I+59wyzdffnbk1myoQtM8kQqevYRpMnYcOTksU5X1AYtp8WUR7VUmMt5jXF9UPyAQNr11zDSd0su4vSrhkP26eIUE+3OXpyBkDgvCsbYKtnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752545920; c=relaxed/simple;
	bh=wW0Sx7l5F4H8ALre3m4qaFZhDLGL8fV9aB0sV9Djh68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZm/WjERxgQs1aerESpP52DTy+yR/t29tYeQsrDYGkj4tRsiOCmrjSxWxb50wfBCAk48gHVaHLTOBRtyTssmKRxNIycXr7C3MebNk6uUbsn0Ul9lrADDqn+LbkaxlttrCXXwVqVULVxnyQICS4bl9iDT01JHbC7YBzO6KudrhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TH1ta0bu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F774C4CEED;
	Tue, 15 Jul 2025 02:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752545920;
	bh=wW0Sx7l5F4H8ALre3m4qaFZhDLGL8fV9aB0sV9Djh68=;
	h=From:To:Cc:Subject:Date:From;
	b=TH1ta0buslWs5zymquc/NsIrejBo647lFIZE03sWcHsaZ4i4eOAuMZmQluchk2FeP
	 +xnkM2omUD2bmJh9xFQdvH9jR3cQozV77ERMZDdgKrpykVl5kiNElbAupZjLPnqgk/
	 NJJqkNR1pFbpr8cTl4S7feLp0zq0lW7eYg3I8Bssx4TeuIKDq5wgGZyZnMCsQgH+T1
	 M37XZZqCc6F/o3WY32euoJ0uv1tK7+WLmwProAERmxYr7q5gDntbcbsKclIdcevxLo
	 5z+sgGQyHb1RAmzjlGU3B5YD2bLTQK/F5lwNCiB4v4IC2P5tynhm1wKa1wqHW/F/Vg
	 4PrQj618EnvJg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Widjaja <kevin.widjaja21@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Max Shevchenko <wctrl@proton.me>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.17
Date: Mon, 14 Jul 2025 21:18:37 -0500
Message-ID: <20250715021838.14751-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.17

for you to fetch changes up to fb84f0ec527c50c54ab662d45c441f6789ec3550:

  ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1 (2025-06-11 21:40:14 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.17

Add aliases for MMC controllers on MSM8974, enable USB charging on the
Sony Xperia Rhine platform and add new DeviceTree for the Sony Xperia Z
Ultra device.

Tidy up interrupts specifiers on MSM8960, by using macro constants.

----------------------------------------------------------------
Kevin Widjaja (4):
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable USB charging
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Move camera buttons to amami & honami
      dt-bindings: arm: qcom: Add Sony Xperia Z Ultra (togari)
      ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)

Krzysztof Kozlowski (1):
      ARM: dts: qcom: Align wifi node name with bindings

Luca Weiss (3):
      ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for mmc0
      ARM: dts: qcom: msm8974-hammerhead: Add alias for mmc0
      ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1

Max Shevchenko (1):
      ARM: dts: qcom: msm8960: use macros for interrupts

 Documentation/devicetree/bindings/arm/qcom.yaml      |  1 +
 arch/arm/boot/dts/qcom/Makefile                      |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi             | 10 +++++-----
 .../dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts  |  3 ++-
 .../qcom/qcom-msm8974-sony-xperia-rhine-amami.dts    | 16 ++++++++++++++++
 .../qcom/qcom-msm8974-sony-xperia-rhine-honami.dts   | 16 ++++++++++++++++
 .../qcom/qcom-msm8974-sony-xperia-rhine-togari.dts   | 16 ++++++++++++++++
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi     | 20 +++++---------------
 .../boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts  |  1 +
 9 files changed, 63 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts

