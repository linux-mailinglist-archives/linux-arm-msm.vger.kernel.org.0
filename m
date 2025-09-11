Return-Path: <linux-arm-msm+bounces-73188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADAAB53E88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 00:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8BF17EC24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 22:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024C4342C88;
	Thu, 11 Sep 2025 22:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrEVPAX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177D341ACA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 22:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757628582; cv=none; b=AHJ860nq1SaVySIexXPsAfo4VhJww1XUE06XFjMMI6JCa79MLzUdZTfFQvLPxqsg78HpHJbopIurWxzx6OLF8Z3xe0QHtG+MYOUr/Hgy0BuOQVXAnwA10AMoZSGVhRljDy0Tz5snP1xKcunnecukF1oMGDGoF8NgydpDXC241+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757628582; c=relaxed/simple;
	bh=hK/6ySfwQ46/Rl9FEdZ2FVCEJGm+bWyf0/UFMaVoSKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioscY9PF0WKV1VH6ml47WYcn7hzyzNOm6YfFJLpElMwzvN+eZtKLrfHU6lLx4C8XigjW5qPqKxs54MJhBxAmknVbJB3u+7pKQK1y7fiH+uwURaB1aHZHZcmFeSipvC05vNx2DjBxRLtxex1tdsQ+gPwzHmkQ/CfYRo1V8UX3FJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrEVPAX+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC75EC4CEF0;
	Thu, 11 Sep 2025 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757628582;
	bh=hK/6ySfwQ46/Rl9FEdZ2FVCEJGm+bWyf0/UFMaVoSKM=;
	h=From:To:Cc:Subject:Date:From;
	b=GrEVPAX+LE3r3grr6VPwoZjvP5XHq+gVEgHdZu+C2snhHoQlR7gzS3s4T0M9M1ewU
	 npHjd7DUl+vA0feqMN//bwoctsa+hO2WVpQvIaxNpEIkD09yaQRcPlpQgAiPaT8/ar
	 +5LJ3fvP8UJ2YV2dD9yeCPC/TzatdYjY3rcGBeq6fApuoC4WGNLE/zdZ1qbC0Xr9Vz
	 EH3rs5ZDZTQ7awRbVdnGSmokEGH6MulrHT2YE69mYEzlfZZGP6ahoR5CnGu1Qd3vUB
	 HiQNnotyc3ilAVUbynKKZ8g8cW5rjL94cX2rRKG6VvA1Zej5kV7yMJqPCCjIbHrB72
	 SAAEvF3mVGwPw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Adam Honse <calcprogrammer1@gmail.com>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Shinjo Park <peremen@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.18
Date: Thu, 11 Sep 2025 17:09:39 -0500
Message-ID: <20250911220940.3023575-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.18

for you to fetch changes up to ba1045c76be299896528ac48021501fc9de78512:

  ARM: dts: qcom: Use GIC_SPI for interrupt-map for readability (2025-09-01 11:18:03 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.18

Bring a few updates to the MSM8960 platform and add support for the Sony
Xperia SP.

Touch keys support is added to the Samsung Galaxy Grand 2.

A number of DeviceTree cleanups.

----------------------------------------------------------------
Adam Honse (1):
      ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey support

Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
      ARM: dts: qcom: msm8960: add gsbi8 and its serial configuration
      ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes in msm8960 dtsi
      dt-bindings: arm: qcom: add Sony Xperia SP
      ARM: dts: qcom: add device tree for Sony Xperia SP

Krzysztof Kozlowski (6):
      ARM: dts: qcom: apq8064-mako: Minor whitespace cleanup
      ARM: dts: qcom: ipq4019: Add default GIC address cells
      ARM: dts: qcom: apq8064: Add default GIC address cells
      ARM: dts: qcom: ipq8064: Add default GIC address cells
      ARM: dts: qcom: sdx55: Add default GIC address cells
      ARM: dts: qcom: Use GIC_SPI for interrupt-map for readability

Raymond Hackley (1):
      ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys

Shinjo Park (1):
      ARM: dts: qcom: pm8921: add vibrator device node

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   6 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  |   6 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |   9 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |   9 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  25 +-
 .../boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts  |   2 +
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  40 +++
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |   5 +
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    | 361 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  32 ++
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    |  45 +++
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   9 +-
 14 files changed, 529 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts

