Return-Path: <linux-arm-msm+bounces-44807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67FA0A511
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 18:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD39C168C3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 17:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB231B4153;
	Sat, 11 Jan 2025 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZAvfzHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92082AE7F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736616544; cv=none; b=fBCXFOV5dJTZDqhw2LEms6Zdf85TXBEl7owHF0wQDcIZwWpKzP/5j78sEJtmVp36ChLqVMo0Kxd4UFPQOSf5Tv4aurUm+u8xb6JgYaallFi4QxkIGh6W3m29Ulu8SWvKFcIP3ocjKCMxkdaMgxSrYWXz505GwOMHhZDy7SdjBls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736616544; c=relaxed/simple;
	bh=FoUirM8xOeKQ1mLUb8XyHPHSCZyh4byeBxDe/4kah9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAA1kG6Yb3+8zKAHwIK50VUJZ0Q5kNZZ8E1Atl+RRA21z+pz6SCqSd3iztq7AbG306Bv97Yxv21zKMbIZ4MD08TosDYvagAOIVtPySz1IvjvaESCZYKzFpT6mtAqmHgyoHDKVFlnbJlAroo/uv9FG/QjYMDZ3uzLzf9jeErh4I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZAvfzHZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F364DC4CED3;
	Sat, 11 Jan 2025 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736616544;
	bh=FoUirM8xOeKQ1mLUb8XyHPHSCZyh4byeBxDe/4kah9M=;
	h=From:To:Cc:Subject:Date:From;
	b=oZAvfzHZeU/A328kNSp03Rfe3SuZWrsKvpNLp4yz8VABUjS37eQSIInA/7zK7criO
	 xqKmGXHZ9MfLCLkH22KuH2F+yV0LWmrSmFmdjBmtCpPmSeTf2ZOMwIJK8Up7YN470K
	 vyBErBDR1m8+e0uA9gTC9oJlvaLnAR1zYm76MZQCENIJ/YnZcurbWmA8lAa38Fayq6
	 0HjrWHVC5qoqqdMjcuccu4opuCsMdEeP7fcIMv10BeFTa8F0gw5m/S/ov6AkcgEV45
	 q0mFYZRgMsrMkJ2iv30f+F/UEoUT4fV5ZkDTSQiKr8tjE9VlUk+ebTVG4xlVn59S6E
	 90mb83LpK2eIA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Wasim Nazir <quic_wasimn@quicinc.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [GIT PULL] Qualcomm driver updates for v6.14
Date: Sat, 11 Jan 2025 11:29:01 -0600
Message-ID: <20250111172901.391774-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.14

for you to fetch changes up to 1d45a1cd9f3ae849db868e07e5fee5e5b37eff55:

  firmware: qcom: scm: add calls for wrapped key support (2025-01-08 17:11:07 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.14

The Qualcomm SCM drivers gains a number of fixes and improvements
related to race conditions during initialization. QSEECOM and the EFI
variable service therein is enabled for a few 8cx Gen 3 and X Elite
boards.

LLCC driver gains configuration for IPQ5424 and WRCACHE is enabled on X
Elite.

The BCM_TCS_CMD() macro is corrected and is cleaned up.

Support for SM7225 and X 1 Plus are added to the pd-mapper.

pmic_glink and the associated altmode driver are simplied using guards.

socinfo is added for QCS9075 and serial number readout on MSM8916
devices is corrected.

----------------------------------------------------------------
Bartosz Golaszewski (2):
      soc: qcom: rmtfs: allow building the module with COMPILE_TEST=y
      soc: qcom: rmtfs: constify rmtfs_class

Eugen Hristev (1):
      soc: qcom: Rework BCM_TCS_CMD macro

Gaurav Kashyap (1):
      firmware: qcom: scm: add calls for wrapped key support

Jens Glathe (2):
      firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
      firmware: qcom: scm: Allow QSEECOM for Windows Dev Kit 2023

Konrad Dybcio (3):
      soc: qcom: pd-mapper: Add X1P42100
      firmware: qcom: scm: Allow QSEECOM on X1P42100 CRD
      soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1

Krzysztof Kozlowski (8):
      soc: qcom: pmic_glink: simplify locking with guard()
      soc: qcom: smem_state: fix missing of_node_put in error path
      soc: qcom: pmic_glink_altmode: simplify locking with guard()
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
      firmware: qcom: scm: Cleanup global '__scm' on probe failures
      firmware: qcom: scm: smc: Handle missing SCM device
      firmware: qcom: scm: smc: Narrow 'mempool' variable scope

Kyle Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the qcs615

Lijuan Gao (1):
      dt-bindings: interconnect: qcom-bwmon: Document QCS615 bwmon compatibles

Luca Weiss (1):
      soc: qcom: pd_mapper: Add SM7225 compatible

Manikanta Mylavarapu (1):
      dt-bindings: firmware: qcom,scm: Document ipq5424 SCM

Maud Spierings (1):
      firmware: qcom: scm: Allow QSEECOM on the asus vivobook s15

Pengyu Luo (1):
      firmware: qcom: scm: Allow QSEECOM on Huawei Matebook E Go (sc8280xp)

Qingqing Zhou (1):
      dt-bindings: firmware: qcom,scm: document QCS615 SCM

Stephan Gerhold (1):
      soc: qcom: socinfo: Avoid out of bounds read of serial number

Varadarajan Narayanan (2):
      dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
      soc: qcom: llcc: Update configuration data for IPQ5424

Wasim Nazir (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
      soc: qcom: socinfo: add QCS9075 SoC ID

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  20 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   2 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 drivers/firmware/qcom/qcom_scm-smc.c               |   6 +-
 drivers/firmware/qcom/qcom_scm.c                   | 271 +++++++++++++++++++--
 drivers/firmware/qcom/qcom_scm.h                   |   4 +
 drivers/soc/qcom/Kconfig                           |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       |  58 ++++-
 drivers/soc/qcom/pmic_glink.c                      |  70 +++---
 drivers/soc/qcom/pmic_glink_altmode.c              |  11 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   2 +
 drivers/soc/qcom/rmtfs_mem.c                       |   2 +-
 drivers/soc/qcom/smem_state.c                      |   3 +-
 drivers/soc/qcom/socinfo.c                         |   3 +-
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 include/linux/firmware/qcom/qcom_scm.h             |   8 +
 include/soc/qcom/tcs.h                             |  26 +-
 18 files changed, 406 insertions(+), 86 deletions(-)

