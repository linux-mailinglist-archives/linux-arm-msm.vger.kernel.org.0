Return-Path: <linux-arm-msm+bounces-24853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5391ED52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 05:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A1528279A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 03:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2021017741;
	Tue,  2 Jul 2024 03:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTL1UFLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B5015E8C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719889755; cv=none; b=k2XIfeUiLdwcTfEeM196l2ydMkfZ75EbpmyiXuIXUAd/g8A6Z4cO17mraPoSd4irXfnfl/uw6BOmULk1NQGYr4KuLPWMti4Gx9TbdFWPAryVwWM4Feuk4T+D2gA+Hx13VD8uftkWpKFAG9+02IXsQPQB/bY4RbR6XLsXhUlLdiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719889755; c=relaxed/simple;
	bh=+hqnWCG3NdDaHwrRaZorxyC8vCtW5NuxDhOQaYqZw9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKp65ZgoWYXb2THOumdP/iSdIYQTNEqSbcSUVLBiHWmswM2YxfzTpuEDCN+gjfuDzCRYIbuBwfB/wbfaa4XGV35ZnX7b3rW3mrQ+ivDGOPAHKcQun+oV5JQ3XRL8JzRsOWT2qItPPmzFoK4uAHQ6gM3G6Yw7x4GSidXSYvserHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTL1UFLi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5574CC116B1;
	Tue,  2 Jul 2024 03:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719889754;
	bh=+hqnWCG3NdDaHwrRaZorxyC8vCtW5NuxDhOQaYqZw9Y=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=XTL1UFLixAahkMOQC+OV2cNPeOBJYNSlbIu+wLoNVMGpJD7GrQ2pTkURRpZnrfGg/
	 pedUStU33rnKSE1nd+LRv5lis51seabdcurMSMq3UEBDjhDyy5epTwbm7TkDi4q22c
	 J/5Y/uxjAegupXJDP356cILXwRfgUQpUj0wBP4UFj5R/maxGaAlajSvSmHtRY5Yzv9
	 qKdwLLQYhgtXNfTc+PM0dpSGxSStAcM/BVnF5GQebqpfz/k12HMSH+IeYzP3l6LMPp
	 e/dWdnGHp7U48Z1wQAdbqwOKweB2qg4SB5TO+xQcpn46q1R9lqenPl2fncEUnh24GL
	 onraZ2Te3eYxQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Cong Zhang <quic_congzhan@quicinc.com>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.10
Date: Mon,  1 Jul 2024 22:09:12 -0500
Message-ID: <20240702030913.340814-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.10

for you to fetch changes up to af355e799b3dc3dd0ed8bf2143641af05d8cd3d4:

  arm64: dts: qcom: qdu1000: Fix LLCC reg property (2024-06-21 00:47:00 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v6.10

This marks the PSHOLD node on SC8280XP as reserved, to resolve a
regression where a reset is triggered instead of a clean shutdown. Also
on SC8280XP the touchscreen properties are adjusted to make it properly
described on CRD and make it work on the Lenovo Thinkpad X13s.

Corrects the LLCC definitions on SC8180X and QDU1000 to allow these
drivers and their dependencies to probe.

X1 Elite CRD is given more CMA space, to avoid running out during boot,
as PCIe SMMU is not accessible.  Audio configuration is corrected, on
the same.

SM6115 SDHC is given an IOMMU stream, to avoid access issues.

Lastly the EL2 non-secure physical timer interrupt on SA8775P is
corrected from its previous incorrect value.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: x1e80100: Fix PCIe 6a reg offsets and add MHI

Bjorn Andersson (1):
      arm64: dts: qcom: sc8180x: Fix LLCC reg property again

Caleb Connolly (1):
      arm64: dts: qcom: sm6115: add iommu for sdhc_1

Cong Zhang (1):
      arm64: dts: qcom: sa8775p: Correct IRQ number of EL2 non-secure physical timer

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
      arm64: dts: qcom: sc8280xp-crd: use external pull up for touch reset

Komal Bajaj (1):
      arm64: dts: qcom: qdu1000: Fix LLCC reg property

Konrad Dybcio (2):
      arm64: dts: qcom: x1e80100-*: Allocate some CMA buffers
      arm64: dts: qcom: sc8280xp: Set status = "reserved" on PSHOLD

Krzysztof Kozlowski (2):
      arm64: dts: qcom: x1e80100-crd: fix WCD audio codec TX port mapping
      arm64: dts: qcom: x1e80100-crd: fix DAI used for headset recording

 arch/arm64/boot/dts/qcom/qdu1000.dtsi                    | 16 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi                    |  2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                    | 11 +++++++----
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                |  3 +--
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts      | 15 ++++++++-------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                   |  2 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi                     |  1 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                | 13 +++++++++++--
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                |  9 +++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                   | 10 ++++++----
 10 files changed, 61 insertions(+), 21 deletions(-)

