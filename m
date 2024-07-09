Return-Path: <linux-arm-msm+bounces-25741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F492C3F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 21:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E7581F21631
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609641B86DE;
	Tue,  9 Jul 2024 19:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRMYNtZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF391B86D5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720553666; cv=none; b=gzT84d+ykkwgtY+Ow5JVvEgzaYDqzTREjOnWqKqevTLIHTILFcDN0p9czQ4GjuEtvPNowHePPzE71IqwOUN9qoqmqUZ5w/WHcutVJmH+0oZZtp9OV4TVnLeIXfAuLr+pu7wV3LQMXWcD7WkxST5CV86nz5ZbnXRvXPgtWDRelUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720553666; c=relaxed/simple;
	bh=u2Ozh3ERh2tfcTBLIo2nR6uOP9hkHoSipLqpoQ1figU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Czpxp5xCfWjZoPnz3vlqX+5T9jkwQ/kp7upikcQFiI9hMMKKvmS5eYDjaEciokHg0uGpPA+ltEMYCYvmwbiv6Cng0HCA5+XId8ljPTg5leKBVSQcY2i1gDPf/PKE9YzQvRIYm0P5xvVQfGduvuLnCy2TCNvWjAcR8gmSHoKNijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRMYNtZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA3C3277B;
	Tue,  9 Jul 2024 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720553665;
	bh=u2Ozh3ERh2tfcTBLIo2nR6uOP9hkHoSipLqpoQ1figU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=iRMYNtZXy4vEWpQ4Msf3hkHedpvyCT+LERQit6mWmn4CSLkqBcCP5M4Jh232KXYyu
	 jOqW7cRdjmRj/HPl3KwcjxuMr1a6K4ntT9E0YxlO5u5FRa9Egla3vgwXjIdvNejZSE
	 beBv2lkYqZv6s0wZd1qjKPbPsjoyH0dXy48BEg6TzqlDAJ9S3/hzowSnof4qEfkmcu
	 F98K8GCcxBkytUIyT9zVcDDNi9CvwM+4Srbk3VnuyZTHv8yTjxR34mbbMJUnQ38P7+
	 LV1fWK7GqLWuxihIBqNnWv7PrHSa1ByojeBTK3VjfTc6ZFM612jg5Ft4HWfQlml3G5
	 U5VIEApzRyaIA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Anton Bambura <jenneron@postmarketos.org>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Jens Reidel <adrian@travitia.xyz>,
	Luca Weiss <luca@lucaweiss.eu>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [GIT PULL] A few more Arm64 DeviceTree updates for v6.11
Date: Tue,  9 Jul 2024 14:34:05 -0500
Message-ID: <20240709193406.3966-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 968178e35e78e566f75dbb7fbfc4dd1436ce8309:

  dt-bindings: arm: qcom: Document samsung,ms013g (2024-07-02 22:15:29 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.11-2

for you to fetch changes up to 2881fcfc8f32c536a4bf708066d6fea9ba762e86:

  mailmap: Update Luca Weiss's email address (2024-07-08 12:08:35 -0500)

----------------------------------------------------------------
A few more Arm64 DeviceTree updates for v6.11

This introduces support for Lenovo Thinkpad Yoga slim 7x, LG Leon LTE,
and LG K10 (K420n).

In addition to this, all Gen-1 platforms gets the DWC3 quirk to disable
"SuperSpeed in park mode", which resolves an instabliity issue seen in
host mode.

For Fairphone 4, PM6150L and PMK8003 thermal sensors are added and
thermal zones defined.

Two fastrpc contexts on SM6350 are marked as non-secure, to allow
non-secure usage.

The video clock controller on SM8150 is introduced. IPQ9574 GCC is
marked as a interconnect provider. The vibrator block in the PM6150 is
described.

On SC7280 the download mode register is defined for SCM, allowing it to
enable/disable the ramdump support during a system crash.

Lastly, add a mailmap entry for Luca Weiss.

----------------------------------------------------------------
Anton Bambura (1):
      arm64: dts: qcom: msm8916-lg-c50: add initial dts for LG Leon LTE

Bjorn Andersson (1):
      Merge branch '20240430064214.2030013-3-quic_varada@quicinc.com' into arm64-for-6.11

Cristian Cozzolino (1):
      arm64: dts: qcom: msm8916-lg-m216: Add initial device tree

Jens Reidel (1):
      arm64: dts: qcom: pm6150: Add vibrator

Krishna Kurapati (8):
      arm64: dts: qcom: ipq6018: Disable SS instance in Parkmode for USB
      arm64: dts: qcom: ipq8074: Disable SS instance in Parkmode for USB
      arm64: dts: qcom: msm8998: Disable SS instance in Parkmode for USB
      arm64: dts: qcom: sdm630: Disable SS instance in Parkmode for USB
      arm64: dts: qcom: sm6115: Disable SS instance in Parkmode for USB
      arm64: dts: qcom: sm6350: Disable SS instance in Parkmode for USB
      arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
      arm64: dts: qcom: sdm845: Disable SS instance in Parkmode for USB

Luca Weiss (4):
      arm64: dts: qcom: sm6350: Add missing qcom,non-secure-domain property
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PMK8003 thermals
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L thermals
      mailmap: Update Luca Weiss's email address

Mukesh Ojha (1):
      arm64: dts: qcom: sc7280: Enable download mode register write

Nikita Travkin (1):
      dt-bindings: arm: qcom: Add msm8916 based LG devices

Satya Priya Kakitapalli (1):
      arm64: dts: qcom: sm8150: Add video clock controller node

Srinivas Kandagatla (2):
      dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
      arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree

Varadarajan Narayanan (2):
      dt-bindings: interconnect: Add Qualcomm IPQ9574 support
      arm64: dts: qcom: ipq9574: Add icc provider ability to gcc

 .mailmap                                           |   1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   3 +
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   1 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   2 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   2 +
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts        | 140 ++++
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts       | 251 ++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   1 +
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   6 +
 arch/arm64/boot/dts/qcom/sa8155p.dtsi              |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   1 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   2 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   3 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 212 +++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  14 +
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 929 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq9574.h    |  59 ++
 22 files changed, 1640 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq9574.h

