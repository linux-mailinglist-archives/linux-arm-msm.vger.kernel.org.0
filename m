Return-Path: <linux-arm-msm+bounces-37714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FE9C67D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 04:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D75CB2B90D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 03:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70F6169AC5;
	Wed, 13 Nov 2024 03:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhY5xhK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209B166310
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 03:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731468267; cv=none; b=XNyS6rs/EwGSZ8UjTIyt6avAYKdzKVmGgOIZX3b8jukI4Dx+KI65oDXuSL2rSq6+VU+4GOdKVDB8G4/sljTvnQ6xwS257Mlvl/RFzpZLrQDxAScMHXveLHgRfcl04ZfRAHi5MS2ubxSF8e0Hl1xNp43bMbnfuQPcD9o0xz9iMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731468267; c=relaxed/simple;
	bh=ZYSRn4jhHEScLQY/RV9Zp1TTf0al4w/RdxqA8X4W1h4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/46uaYNDXwo6K1p7EjdN0n48/thPC1P7Cz78gNd4R55Y52+VU4NkHeIFwSwQB3Z3O3phy3TIeOpNnFVGD4y3jhgerL+hPVq8kN7UBtyg3EETsdsxpaTHSV5DS71bsBHT1sijl8T7zGns1+q3hVV8Dt+vflkzZ1IYxNZRS3d/2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhY5xhK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1092FC4CECF;
	Wed, 13 Nov 2024 03:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731468267;
	bh=ZYSRn4jhHEScLQY/RV9Zp1TTf0al4w/RdxqA8X4W1h4=;
	h=From:To:Cc:Subject:Date:From;
	b=UhY5xhK9SMnm68gF5pphZ74bThArxDM9WxtmB3hHSYWaoLtR7ZvDmyenHh/37OznC
	 qE0w7bEtm6JMdk4q7K3abST8Zax8cpyM+X+znZipQkA5wDiu0GT9aQtvzrpAQruR0+
	 zWF4yafDpe/cYEnupQsJ7LXn4VPij0fKi3XiLQOXDxUxkGDTV8P65W4mny0zlgBiyL
	 t3l44w8g02txnAt4xYUWpqAPWQCxMfYwEy8rr1HS9edhliY+ifzrAA8F08rDuuAod7
	 QKlHAOaSw3b+nYWcPOIgY4BHIjbgR0OXGErwa8fbFUIhRDyjOIwBH8ai93FsTCRzFW
	 kSPkKy0XxhN1w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Song Xue <quic_songxue@quicinc.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: [GIT PULL] A few more Qualcomm driver updates for v6.13
Date: Tue, 12 Nov 2024 21:24:22 -0600
Message-ID: <20241113032425.356306-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit d088afa7de3cbe689954dad49e7058d2c4b8944c:

  soc: qcom: socinfo: add QCS9100 ID (2024-10-29 15:09:02 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.13-2

for you to fetch changes up to 54a8cd0f92068a3718092f68c8ae99e2078f44b6:

  soc: qcom: ice: Remove the device_link field in qcom_ice (2024-11-11 22:03:30 -0600)

----------------------------------------------------------------
A few more Qualcomm driver updates for v6.13

Make the Adreno driver invoke the SMMU aperture setup firmware function,
which is required to allow the GPU to manage per-process page tables in
some firmware versions - as an example Rb3Gen2 has no GPU without this.

Add X1E Devkit to the list of devices that has functional EFI variable
access through the uefisecapp.

Flip the "manual slice configuration quirk" in the Qualcomm LLCC driver,
as this only applies to a single platform, and introduce support for
QCS8300, QCS615, SAR2130P, and SAR1130P.

Lastly, add IPQ5424 and IPQ5404 to the Qualcomm socinfo driver.

----------------------------------------------------------------
Bjorn Andersson (2):
      firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      drm/msm/adreno: Setup SMMU aparture for per-process page table

Dmitry Baryshkov (3):
      dt-bindings: cache: qcom,llcc: document SAR2130P and SAR1130P
      soc: qcom: llcc: use deciman integers for bit shift values
      soc: qcom: llcc: add support for SAR2130P and SAR1130P

Jingyi Wang (2):
      dt-bindings: cache: qcom,llcc: Document the QCS8300 LLCC
      soc: qcom: llcc: Add LLCC configuration for the QCS8300 platform

Joe Hattori (1):
      soc: qcom: ice: Remove the device_link field in qcom_ice

Konrad Dybcio (1):
      soc: qcom: llcc: Flip the manual slice configuration condition

Manikanta Mylavarapu (2):
      dt-bindings: arm: qcom,ids: add SoC ID for IPQ5424/IPQ5404
      soc: qcom: socinfo: add IPQ5424/IPQ5404 SoC ID

Melody Olvera (1):
      dt-bindings: firmware: qcom,scm: Document sm8750 SCM

Sibi Sankar (1):
      firmware: qcom: uefisecapp: Allow X1E Devkit devices

Song Xue (2):
      dt-bindings: cache: qcom,llcc: Document the QCS615 LLCC
      soc: qcom: llcc: Add configuration data for QCS615

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  32 ++
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   2 +
 drivers/firmware/qcom/qcom_scm.c                   |  27 +
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  11 +
 drivers/soc/qcom/ice.c                             |   6 +-
 drivers/soc/qcom/llcc-qcom.c                       | 615 +++++++++++++++++++--
 drivers/soc/qcom/socinfo.c                         |   2 +
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/linux/firmware/qcom/qcom_scm.h             |   2 +
 include/linux/soc/qcom/llcc-qcom.h                 |  12 +
 11 files changed, 676 insertions(+), 36 deletions(-)

