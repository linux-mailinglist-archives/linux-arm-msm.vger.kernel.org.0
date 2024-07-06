Return-Path: <linux-arm-msm+bounces-25420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F89294F0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 19:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B763E1C20ADB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 17:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9006113AD2B;
	Sat,  6 Jul 2024 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfbBCdIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6522A7347E;
	Sat,  6 Jul 2024 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720287868; cv=none; b=APo6SFiN+ilKa7VzyIpFEjk6jH813C9VtcSlIDzbq0PQ1JZ9WopILqUsBgwPz9rJx+btXZwRe+oOBBp8NlUfMkZeaX4/iWrQ2OYXvTE+H7xPhkJCE7v9cjo42QDzMcz2MZmgNBLNLbHEelM6AbFF2R/nC9NFk4BoyV0OWBd0Wgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720287868; c=relaxed/simple;
	bh=3RXmC9bMKt+B6Uq/0+C1ZaMVu5T+7ksuwslW7IfCwlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iK//DMwhzJfvvHxhRcWFfatR0QFPY2s/0qymhxdVNMgvbP5XPp8/zbNZ9XQcYv0vh5X9zgAUZvvX+FcTOVUT84fXogEOCaTuaV14hmMQwFRp08mEFMYghgd4R2ghiwrCpt4FNd+NPjIFB0BDLKZHtZMte91Bdw0NDo8iYzCjgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfbBCdIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A791C2BD10;
	Sat,  6 Jul 2024 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720287867;
	bh=3RXmC9bMKt+B6Uq/0+C1ZaMVu5T+7ksuwslW7IfCwlk=;
	h=From:To:Cc:Subject:Date:From;
	b=PfbBCdIo0G6S4JP06wXxMVmnHcDaleVIk50DJsiH+RUgC9uj8moUuDqeBHIGyPx/z
	 OW1QfTkWyoTWIkWP94XWWvTaNowGHP0VtXG4E8qOyUbiPMku+iMELE8Yr8xcJ3JFhE
	 qDYXc/tMeXToma8i57LnHA/dRADGR5vAhTnDP9YLUNKHPjPNVwAwTzoCqjMsI6XdkD
	 7kQk46DszgT5Esh9I9iUoVILUULiDQuTahkN9/PSOqoLs1HPr8Q6HvsFJPAIaWKsSB
	 36iT5zMr6ZSxsOeTiVvvXSx70auarwKvHoUyw9f2OuMksfro0vE67PTRUxZ6cHE6Ht
	 qfwxClLyx/Mhg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.11
Date: Sat,  6 Jul 2024 12:44:24 -0500
Message-ID: <20240706174425.19441-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.11

for you to fetch changes up to f27e42c7d3ff8ddfc57273efd1e8642ea89bad90:

  clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks (2024-07-01 22:28:05 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.11

This adds clock controllers for SM7150 camera, display and video,
QCM2290 GPU, QCS8386/QCS8084 NSS, SM8650 camera and video.

qcom_cc_really_probe() is transitioned to take a struct device, to allow
reuse in non-platform-drivers. Prepare-only branch clock ops are
introduced to support clocks on buses that takes locks.

The parent/child relationship for SC7280 camera GDSCs are added.

Support for the Huayra 2290 alpha PLL is added.

The highest SDCC clock frequency on IPQ6018 is adjusted to match the
HS200 support. For IPQ9574 missing PCIe PIPE clocks are added.

Various configuration and properties of the SA8775P, X1E80100 and SM7280
clocks and GDSCs are corrected. SM8350 GPU RCGs are made to park on XO
while disabled.

Unused CONFIG_QCOM_RPMCC Kconfig symbol is removed, and missing
MODULE_DESCRIPTIONs are added in a few drivers.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks

Alexandru Gagniuc (2):
      dt-bindings: clock: Add PCIe pipe related clocks for IPQ9574
      clk: qcom: gcc-ipq9574: Add PCIe pipe clocks

Bjorn Andersson (2):
      Merge branch '20240606-topic-rb1_gpu-v4-1-4bc0c19da4af@linaro.org' into clk-for-6.11
      Merge branch '20240602114439.1611-1-quic_jkona@quicinc.com' into clk-for-6.11

Christophe JAILLET (1):
      clk: qcom: Constify struct pll_vco

Chukun Pan (1):
      clk: qcom: gcc-ipq6018: update sdcc max clock frequency

Danila Tikhonov (8):
      clk: qcom: Fix SM_GCC_7150 dependencies
      clk: qcom: gcc-sm7150: constify clk_init_data structures
      dt-bindings: clock: qcom: Add SM7150 DISPCC clocks
      clk: qcom: Add Display Clock Controller driver for SM7150
      dt-bindings: clock: qcom: Add SM7150 CAMCC clocks
      clk: qcom: Add Camera Clock Controller driver for SM7150
      dt-bindings: clock: qcom: Add SM7150 VIDEOCC clocks
      clk: qcom: Add Video Clock Controller driver for SM7150

Dmitry Baryshkov (4):
      dt-bindings: clk: qcom,dispcc-sm8x50: describe additional DP clocks
      dt-bindings: clock: qcom,gcc-other: rename to qcom,mdm-mdm9607
      dt-bindings: clock: qcom,gcc: sort out power-domains support
      dt-bindings: clock: add schema for qcom,gcc-mdm9615

Elliot Berman (1):
      clk: qcom: Remove QCOM_RPMCC symbol

Jagadeesh Kona (7):
      dt-bindings: clock: qcom: Update SM8450 videocc header file name
      dt-bindings: clock: qcom: Add SM8650 video clock controller
      clk: qcom: videocc-sm8550: Add support for videocc XO clk ares
      clk: qcom: videocc-sm8550: Add SM8650 video clock controller
      dt-bindings: clock: qcom: Update the order of SC8280XP camcc header
      dt-bindings: clock: qcom: Add SM8650 camera clock controller
      clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver

Jeff Johnson (1):
      clk: qcom: add missing MODULE_DESCRIPTION() macros

Konrad Dybcio (3):
      dt-bindings: clock: Add Qcom QCM2290 GPUCC
      clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
      clk: qcom: Add QCM2290 GPU clock controller driver

Krzysztof Kozlowski (16):
      dt-bindings: clock: qcom,sm8450-videocc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,videocc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sc8280xp: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sm6350: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,dispcc-sm8x50: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,gpucc-sdm660: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,gpucc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,msm8998-gpucc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,qcm2290-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sc7180-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sc7280-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sdm845-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm6115-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8450-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8550-dispcc: reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm8450-gpucc: reference qcom,gcc.yaml

Lukas Bulwahn (1):
      clk: qcom: select right config in CLK_QCM2290_GPUCC definition

Luo Jie (5):
      clk: qcom: branch: Add clk_branch2_prepare_ops
      dt-bindings: clock: add qca8386/qca8084 clock and reset definitions
      clk: qcom: common: commonize qcom_cc_really_probe
      clk: qcom: add clock controller driver for qca8386/qca8084
      clk: qcom: nsscc-qca8k: Fix the MDIO functions undefined issue

Taniya Das (10):
      clk: qcom: sc7280: Update the transition delay for GDSC
      clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
      clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
      clk: qcom: gpucc-sm8350: Park RCG's clk source at XO during disable
      clk: qcom: gcc-sa8775p: Remove support for UFS hw ctl clocks
      clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
      clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for gcc_ufs_phy_ice_core_clk
      clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON flags
      clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
      clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's

 .../bindings/clock/qcom,dispcc-sc8280xp.yaml       |   20 +-
 .../bindings/clock/qcom,dispcc-sm6350.yaml         |   20 +-
 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |   46 +-
 .../bindings/clock/qcom,gcc-apq8064.yaml           |    3 +-
 .../bindings/clock/qcom,gcc-apq8084.yaml           |    1 +
 .../bindings/clock/qcom,gcc-ipq4019.yaml           |    3 +-
 .../bindings/clock/qcom,gcc-ipq6018.yaml           |    3 +-
 .../bindings/clock/qcom,gcc-ipq8064.yaml           |    3 +-
 .../bindings/clock/qcom,gcc-ipq8074.yaml           |    1 +
 .../{qcom,gcc-other.yaml => qcom,gcc-mdm9607.yaml} |    4 +-
 .../bindings/clock/qcom,gcc-mdm9615.yaml           |   50 +
 .../bindings/clock/qcom,gcc-msm8660.yaml           |    3 +-
 .../bindings/clock/qcom,gcc-msm8909.yaml           |    1 +
 .../bindings/clock/qcom,gcc-msm8916.yaml           |    1 +
 .../bindings/clock/qcom,gcc-msm8953.yaml           |    1 +
 .../bindings/clock/qcom,gcc-msm8974.yaml           |    1 +
 .../bindings/clock/qcom,gcc-msm8976.yaml           |    1 +
 .../bindings/clock/qcom,gcc-msm8994.yaml           |    1 +
 .../bindings/clock/qcom,gcc-msm8996.yaml           |    1 +
 .../bindings/clock/qcom,gcc-msm8998.yaml           |    1 +
 .../bindings/clock/qcom,gcc-qcm2290.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,gcc-qcs404.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |    1 +
 .../bindings/clock/qcom,gcc-sc8180x.yaml           |    1 +
 .../bindings/clock/qcom,gcc-sc8280xp.yaml          |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sdm660.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml  |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sm6115.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sm6125.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    1 +
 .../devicetree/bindings/clock/qcom,gcc.yaml        |    1 -
 .../bindings/clock/qcom,gpucc-sdm660.yaml          |   20 +-
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   20 +-
 .../bindings/clock/qcom,ipq5018-gcc.yaml           |    3 +-
 .../bindings/clock/qcom,ipq5332-gcc.yaml           |    3 +-
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |    3 +-
 .../bindings/clock/qcom,msm8998-gpucc.yaml         |   20 +-
 .../bindings/clock/qcom,qca8k-nsscc.yaml           |   86 +
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |   20 +-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   77 +
 .../bindings/clock/qcom,qdu1000-gcc.yaml           |    1 +
 .../bindings/clock/qcom,sa8775p-gcc.yaml           |    1 +
 .../bindings/clock/qcom,sc7180-dispcc.yaml         |   20 +-
 .../bindings/clock/qcom,sc7280-dispcc.yaml         |   20 +-
 .../bindings/clock/qcom,sdm845-dispcc.yaml         |   20 +-
 .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |    1 +
 .../devicetree/bindings/clock/qcom,sm4450-gcc.yaml |    1 +
 .../bindings/clock/qcom,sm6115-dispcc.yaml         |   20 +-
 .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |    1 +
 .../bindings/clock/qcom,sm7150-camcc.yaml          |   60 +
 .../bindings/clock/qcom,sm7150-dispcc.yaml         |   75 +
 .../devicetree/bindings/clock/qcom,sm7150-gcc.yaml |    1 +
 .../bindings/clock/qcom,sm7150-videocc.yaml        |   58 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    7 +-
 .../bindings/clock/qcom,sm8450-dispcc.yaml         |   20 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   20 +-
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   26 +-
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   20 +-
 .../devicetree/bindings/clock/qcom,sm8550-gcc.yaml |    1 +
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |    1 +
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   19 +-
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    1 +
 drivers/clk/qcom/Kconfig                           |   60 +-
 drivers/clk/qcom/Makefile                          |    6 +
 drivers/clk/qcom/apss-ipq6018.c                    |    2 +-
 drivers/clk/qcom/camcc-sc7180.c                    |    2 +-
 drivers/clk/qcom/camcc-sc7280.c                    |   26 +-
 drivers/clk/qcom/camcc-sc8280xp.c                  |    6 +-
 drivers/clk/qcom/camcc-sdm845.c                    |    2 +-
 drivers/clk/qcom/camcc-sm6350.c                    |    4 +-
 drivers/clk/qcom/camcc-sm7150.c                    | 2061 +++++++++++
 drivers/clk/qcom/camcc-sm8250.c                    |    6 +-
 drivers/clk/qcom/camcc-sm8450.c                    |    2 +-
 drivers/clk/qcom/camcc-sm8550.c                    |    2 +-
 drivers/clk/qcom/camcc-sm8650.c                    | 3591 ++++++++++++++++++++
 drivers/clk/qcom/camcc-x1e80100.c                  |    2 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |   47 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    3 +
 drivers/clk/qcom/clk-branch.c                      |    7 +
 drivers/clk/qcom/clk-branch.h                      |    1 +
 drivers/clk/qcom/common.c                          |    8 +-
 drivers/clk/qcom/common.h                          |    2 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |    2 +-
 drivers/clk/qcom/dispcc-sc7180.c                   |    2 +-
 drivers/clk/qcom/dispcc-sc7280.c                   |    2 +-
 drivers/clk/qcom/dispcc-sc8280xp.c                 |    2 +-
 drivers/clk/qcom/dispcc-sdm845.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm6125.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm6350.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm6375.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm7150.c                   | 1006 ++++++
 drivers/clk/qcom/dispcc-sm8250.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm8650.c                   |    4 +-
 drivers/clk/qcom/dispcc-x1e80100.c                 |    2 +-
 drivers/clk/qcom/ecpricc-qdu1000.c                 |    2 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |    2 +-
 drivers/clk/qcom/gcc-ipq6018.c                     |    4 +-
 drivers/clk/qcom/gcc-ipq8074.c                     |    2 +-
 drivers/clk/qcom/gcc-ipq9574.c                     |   76 +
 drivers/clk/qcom/gcc-mdm9607.c                     |    2 +-
 drivers/clk/qcom/gcc-mdm9615.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8917.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8939.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8953.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8976.c                     |    3 +-
 drivers/clk/qcom/gcc-msm8996.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8998.c                     |    4 +-
 drivers/clk/qcom/gcc-qcm2290.c                     |    2 +-
 drivers/clk/qcom/gcc-qcs404.c                      |    2 +-
 drivers/clk/qcom/gcc-qdu1000.c                     |    2 +-
 drivers/clk/qcom/gcc-sa8775p.c                     |  156 +-
 drivers/clk/qcom/gcc-sc7180.c                      |    2 +-
 drivers/clk/qcom/gcc-sc7280.c                      |   15 +-
 drivers/clk/qcom/gcc-sc8180x.c                     |    4 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |    2 +-
 drivers/clk/qcom/gcc-sdm660.c                      |    2 +-
 drivers/clk/qcom/gcc-sdm845.c                      |    2 +-
 drivers/clk/qcom/gcc-sdx55.c                       |    2 +-
 drivers/clk/qcom/gcc-sdx65.c                       |    2 +-
 drivers/clk/qcom/gcc-sdx75.c                       |    2 +-
 drivers/clk/qcom/gcc-sm4450.c                      |    2 +-
 drivers/clk/qcom/gcc-sm6115.c                      |    8 +-
 drivers/clk/qcom/gcc-sm6125.c                      |    2 +-
 drivers/clk/qcom/gcc-sm6350.c                      |    2 +-
 drivers/clk/qcom/gcc-sm6375.c                      |    6 +-
 drivers/clk/qcom/gcc-sm7150.c                      |  394 +--
 drivers/clk/qcom/gcc-sm8150.c                      |    2 +-
 drivers/clk/qcom/gcc-sm8250.c                      |    2 +-
 drivers/clk/qcom/gcc-sm8350.c                      |    2 +-
 drivers/clk/qcom/gcc-sm8450.c                      |    2 +-
 drivers/clk/qcom/gcc-sm8550.c                      |    2 +-
 drivers/clk/qcom/gcc-sm8650.c                      |    2 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   46 +-
 drivers/clk/qcom/gpucc-msm8998.c                   |    4 +-
 drivers/clk/qcom/gpucc-qcm2290.c                   |  423 +++
 drivers/clk/qcom/gpucc-sa8775p.c                   |   43 +-
 drivers/clk/qcom/gpucc-sc7180.c                    |    2 +-
 drivers/clk/qcom/gpucc-sc7280.c                    |    9 +-
 drivers/clk/qcom/gpucc-sc8280xp.c                  |    2 +-
 drivers/clk/qcom/gpucc-sdm660.c                    |    4 +-
 drivers/clk/qcom/gpucc-sdm845.c                    |    2 +-
 drivers/clk/qcom/gpucc-sm6115.c                    |    6 +-
 drivers/clk/qcom/gpucc-sm6125.c                    |    4 +-
 drivers/clk/qcom/gpucc-sm6350.c                    |    2 +-
 drivers/clk/qcom/gpucc-sm6375.c                    |    4 +-
 drivers/clk/qcom/gpucc-sm8150.c                    |    2 +-
 drivers/clk/qcom/gpucc-sm8250.c                    |    4 +-
 drivers/clk/qcom/gpucc-sm8350.c                    |    9 +-
 drivers/clk/qcom/gpucc-sm8450.c                    |    4 +-
 drivers/clk/qcom/gpucc-sm8550.c                    |    2 +-
 drivers/clk/qcom/gpucc-sm8650.c                    |    4 +-
 drivers/clk/qcom/gpucc-x1e80100.c                  |    2 +-
 drivers/clk/qcom/lcc-ipq806x.c                     |    2 +-
 drivers/clk/qcom/lcc-msm8960.c                     |    2 +-
 drivers/clk/qcom/lpass-gfm-sm8250.c                |    1 +
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |    4 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c              |    4 +-
 drivers/clk/qcom/lpasscorecc-sc7280.c              |    2 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |    2 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |    2 +-
 drivers/clk/qcom/mmcc-msm8994.c                    |    6 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |    8 +-
 drivers/clk/qcom/mmcc-msm8998.c                    |    2 +-
 drivers/clk/qcom/mmcc-sdm660.c                     |    6 +-
 drivers/clk/qcom/nsscc-qca8k.c                     | 2221 ++++++++++++
 drivers/clk/qcom/tcsrcc-sm8550.c                   |    2 +-
 drivers/clk/qcom/videocc-sc7180.c                  |    2 +-
 drivers/clk/qcom/videocc-sc7280.c                  |    9 +-
 drivers/clk/qcom/videocc-sdm845.c                  |    3 +-
 drivers/clk/qcom/videocc-sm7150.c                  |  357 ++
 drivers/clk/qcom/videocc-sm8150.c                  |    4 +-
 drivers/clk/qcom/videocc-sm8250.c                  |    4 +-
 drivers/clk/qcom/videocc-sm8350.c                  |    2 +-
 drivers/clk/qcom/videocc-sm8450.c                  |    2 +-
 drivers/clk/qcom/videocc-sm8550.c                  |  158 +-
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |    4 +
 include/dt-bindings/clock/qcom,qca8k-nsscc.h       |  101 +
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     |   32 +
 include/dt-bindings/clock/qcom,sm7150-camcc.h      |  113 +
 include/dt-bindings/clock/qcom,sm7150-dispcc.h     |   59 +
 include/dt-bindings/clock/qcom,sm7150-videocc.h    |   28 +
 include/dt-bindings/clock/qcom,sm8650-camcc.h      |  195 ++
 include/dt-bindings/clock/qcom,sm8650-videocc.h    |   23 +
 include/dt-bindings/reset/qcom,qca8k-nsscc.h       |   76 +
 194 files changed, 11681 insertions(+), 774 deletions(-)
 rename Documentation/devicetree/bindings/clock/{qcom,gcc-other.yaml => qcom,gcc-mdm9607.yaml} (87%)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm7150.c
 create mode 100644 drivers/clk/qcom/camcc-sm8650.c
 create mode 100644 drivers/clk/qcom/dispcc-sm7150.c
 create mode 100644 drivers/clk/qcom/gpucc-qcm2290.c
 create mode 100644 drivers/clk/qcom/nsscc-qca8k.c
 create mode 100644 drivers/clk/qcom/videocc-sm7150.c
 create mode 100644 include/dt-bindings/clock/qcom,qca8k-nsscc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcm2290-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-videocc.h
 create mode 100644 include/dt-bindings/reset/qcom,qca8k-nsscc.h

