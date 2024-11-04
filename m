Return-Path: <linux-arm-msm+bounces-36861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD7A9BAB99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 280D21C20A87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 03:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F297E583;
	Mon,  4 Nov 2024 03:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDmBUW55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706FD1FC3
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 03:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730692066; cv=none; b=c382Yt6FegF9xzOl8EulMqVp7oOXOIDIaRjv1EAW2EZAOcphgns4L2WIPFI8MjhW4mc9Ru71L0Qrt07606Mt604KKRzV/204JBsnnWCWV3M1wQug+50L9/XfGH+u7LG8ZM+NJE0JwhINYXzKHLABwALmzW0Wp8KPw0y31W7YZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730692066; c=relaxed/simple;
	bh=BxTdEBrwuoUPawocmr4roN/Pu6iOj2aVRgI+R08NuDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gz2V5111uBhWQ7nzrXAVDDKfaeC+EdC+e1fNwNcikYJk1sBYMoqynDIbt2FqH1821UxtQ8swOnGo0bl0mpoT8SHuxQzzbI0J4tBAie1vKEuuEaEzr0difUCryA8S9lkei/NFxlHyPBvyyoNfNDlKj84V2zwWE0l7M65xxEvvTzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDmBUW55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4DDC4CED0;
	Mon,  4 Nov 2024 03:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730692066;
	bh=BxTdEBrwuoUPawocmr4roN/Pu6iOj2aVRgI+R08NuDA=;
	h=From:To:Cc:Subject:Date:From;
	b=PDmBUW55OAIQDSfCj7VeIqh1sVtaVyYdlduJ29cHcI8pqfdT/cJOtd3cTn70tByys
	 WMKT8sDE0W0hk+EnP3+QzQ5hLvOikBIqWcSJJP3N3jhVq6C6X3zqMXLWH4WZccJPRl
	 iJkLMzOSdRkk48dCX+GwwSh5qVRZlPuuV34rWho5e4EbJtmXOkSwJJAG7Y6VFnqldl
	 ohkTcGhGU9CSQ9JL78QfJsH+OaqO3aPeH6JeUulAWtdAI+hlVgqHjEAhyTdguO+R+Z
	 gb2e7ipzlvPY2hR2ChTNtrps80g1L5LqEQ/njmxc477Ar3eQ1HQyyZdXjx7+VKaCey
	 lk2c38N5aEI9A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rosen Penev <rosenp@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.13
Date: Sun,  3 Nov 2024 21:47:43 -0600
Message-ID: <20241104034744.14378-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.13

for you to fetch changes up to ef4b38462e627f58bc929fc502e601dd396f1ae2:

  ARM: dts: qcom: ipq4019: use nvmem-layout (2024-10-24 09:44:57 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.13

IPQ4019 flash partition scheme is moved to nvmem-layout. SDX55 and SDX65
PCIe EP controllers gain missing linux,pci-domain properties.

Stylistic improvements across a range of platforms and devices.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: qcom: drop underscore in node names
      ARM: dts: qcom: minor whitespace cleanup
      ARM: dts: qcom: change labels to lower-case

Manivannan Sadhasivam (2):
      ARM: dts: qcom: sdx55: Add 'linux,pci-domain' to PCIe EP controller node
      ARM: dts: qcom: sdx65: Add 'linux,pci-domain' to PCIe EP controller node

Rosen Penev (1):
      ARM: dts: qcom: ipq4019: use nvmem-layout

 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 38 ++++-----
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           | 78 +++++++++---------
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++--
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts   |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           | 10 +--
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  8 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           |  4 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 34 ++++----
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |  6 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  6 +-
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 92 +++++++++++-----------
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |  1 +
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             | 67 ++++++++--------
 14 files changed, 186 insertions(+), 181 deletions(-)

