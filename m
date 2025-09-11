Return-Path: <linux-arm-msm+bounces-73187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88534B53E13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 23:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C04C43AC23D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0615226E70D;
	Thu, 11 Sep 2025 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWFvVGZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D625625A2C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757627419; cv=none; b=utDvz9C2XgH3TpTxwG1VWKWM5BHhi/gtxwbpsK2t0X/JkFn178AfbXZqg/PCEdaQqQwmn1arVY1IfT9TJDyFwh7/e5DjeaKTepvJgy1DJZZY13BhR9ZZmez/si3on8v55vlP2BoUzNAklURa3tGti5leeLmgsMRSSZCoByZkPpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757627419; c=relaxed/simple;
	bh=glxC6FwjQ8JowbY1TETO4EMaJ5BNVOWlNBc74WQK45Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YGTOOB4cGfRKt+yrGU3o/PouRQMyCQh79Aysq1N5FTwNi1x/hwSOqVurSE8/A9hwUM2ljvxmPs5Pt7o69EH5BlleN1tMWfqWd5u9MJNj0w+ZJg7fqAZOnNMB+0RCxedG0vgEvVrUiHv4ADEaToHFMFwjyRD2qC45SOY38mzPJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWFvVGZa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D919C4CEF0;
	Thu, 11 Sep 2025 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757627419;
	bh=glxC6FwjQ8JowbY1TETO4EMaJ5BNVOWlNBc74WQK45Y=;
	h=From:To:Cc:Subject:Date:From;
	b=XWFvVGZa7KfyHd1L/fK35DZOQarnm6Zde3N5nm+oF9PC0RuMIM4U3NmoeJcT8m4i5
	 AFnJDd96IROPso4j9qaDwXaeMat4pwMBGhJxmKf6txgMLFOFNz/TTyb2icN68SxnIE
	 9UbHbHiM5jeZFgfNcT8e4AFvOSGDMAItqMRhrTQ2/cXljvpwyigduPLpSARVqxwgku
	 7b3v1VRLiG6aiuwpU2LIcOW0s3YDDQh9I0aIteyPA58smVwTElXQUXqTiNWSsm+M/U
	 j/OLVdn0mYpKvNc5hvtjwfXNUAxQuiXQx4lAwCAS2BlQ8rnxxDsag5mzcrfqh/rABT
	 GLIRhuClqFS1g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Jens Reidel <adrian@mainlining.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.18
Date: Thu, 11 Sep 2025 16:50:14 -0500
Message-ID: <20250911215017.3020481-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.18

for you to fetch changes up to 3cc9a8cadaf66e1a53e5fee48f8bcdb0a3fd5075:

  firmware: qcom: tzmem: disable sc7180 platform (2025-09-11 16:38:33 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.18

Allowlist the uefisec application, to provide UEFI variable access on
Dell Inspiron 7441 and Latitude 7455, the Hamoa EVK, and the Lenovo
Thinkbook 16.

Disable tzmem on the SC7180 platform, as this causes problems with
rmtfs.

Clean up unused, lingering, parameters in the MDT loader API.

Unconditinally clear TCS trigger bit, to avoid false completion IRQs in
the RPMh/RSC driver. Fix endianess issue in SMEM driver.

Add pd-mapper support for SM8750.

----------------------------------------------------------------
Barnabás Czémán (1):
      dt-bindings: firmware: qcom,scm: Add MSM8937

Jens Glathe (1):
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16

Jens Reidel (1):
      soc: qcom: smem: Fix endian-unaware access of num_entries

Kathiravan Thirumoorthy (1):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible

Krzysztof Kozlowski (1):
      soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*() errors

Luca Weiss (1):
      dt-bindings: soc: qcom,rpmh-rsc: Remove double colon from description

Mukesh Ojha (4):
      firmware: qcom: scm: preserve assign_mem() error return value
      soc: qcom: mdt_loader: Remove unused parameter
      soc: qcom: mdt_loader: Remove pas id parameter
      soc: qcom: mdt_loader: Remove unused parameter

Nikita Travkin (1):
      firmware: qcom: tzmem: disable sc7180 platform

Prasad Kumpatla (1):
      soc: qcom: pd-mapper: Add SM8750 compatible

Qianfeng Rong (1):
      soc: qcom: use devm_kcalloc() for array space allocation

Sneh Mankad (1):
      soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit for TCS

Val Packett (1):
      firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455

Wolfram Sang (1):
      soc: remove unneeded 'fast_io' parameter in regmap_config

Yijie Yang (1):
      firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK

 .../devicetree/bindings/firmware/qcom,scm.yaml       |  3 +++
 .../devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml  |  2 +-
 .../devicetree/bindings/sram/qcom,imem.yaml          |  1 +
 drivers/firmware/qcom/qcom_scm.c                     |  6 +++++-
 drivers/firmware/qcom/qcom_tzmem.c                   |  1 +
 drivers/media/platform/qcom/venus/firmware.c         |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c                |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                  |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                   |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c                  |  2 +-
 drivers/soc/qcom/icc-bwmon.c                         |  3 +++
 drivers/soc/qcom/llcc-qcom.c                         |  1 -
 drivers/soc/qcom/mdt_loader.c                        | 20 +++++++++-----------
 drivers/soc/qcom/qcom_pd_mapper.c                    |  1 +
 drivers/soc/qcom/ramp_controller.c                   |  1 -
 drivers/soc/qcom/rpm_master_stats.c                  |  2 +-
 drivers/soc/qcom/rpmh-rsc.c                          |  7 ++-----
 drivers/soc/qcom/smem.c                              |  2 +-
 include/linux/soc/qcom/mdt_loader.h                  |  7 +++----
 19 files changed, 39 insertions(+), 35 deletions(-)

