Return-Path: <linux-arm-msm+bounces-13395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22870872D91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 04:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 837101F25EC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 03:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28569134BF;
	Wed,  6 Mar 2024 03:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2WFLe4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413617E9;
	Wed,  6 Mar 2024 03:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709696312; cv=none; b=pnYMPdhQIfPvBgYJILN6OSYVoXE7evqSYtKL3UftZDq1vn46vIlKMDYPJaVGns7sbFtQtGLawKN8STD9Mh2rLe3KE6NJel5u8WEtNL1GAqkzBJDcv2a/9Grl7wyQDhyX6hGV2tUCPdVB5r2ZDkCG4jHd6l/OO4XvLF+YkFpvUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709696312; c=relaxed/simple;
	bh=yMrYSlqS58RFfSGkzqsmFqJbtmN+p5CXeMYvDZ00yXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcislrOJj1sdqz7HtnI0wGDwZG+FgVgmIlJm7gv8fCHV2heKBKh4qfuiYxB1feNWtMMUfp/ZHS5/gmCqN5YShxlhrFDBSK3nWm5ijaCHmbWwoRNA6P0x3TnrnhuIAVbG9M2LdnUxp+Kqg6SPqzttNvuvQ0PFYl55JqcOXvwJCmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2WFLe4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535F9C433F1;
	Wed,  6 Mar 2024 03:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709696311;
	bh=yMrYSlqS58RFfSGkzqsmFqJbtmN+p5CXeMYvDZ00yXk=;
	h=From:To:Cc:Subject:Date:From;
	b=P2WFLe4Ut9gSekglSd1SZFDjeV8ev7VX3zF7k/EuVKkBbQPgeM+lL3C+DcFDkUsWy
	 ipeP/50PTwocRuXHQHPxDUomuW2g1FIla/cdYJm0OiNFFDHvar4pNRampsRrzJxRE3
	 5HO4rvEczu+6h+3jgfK19REDgachu7b2uETt+pr+KrViv+IrHK7RJnKxwSGT3q/MN0
	 3830yjjGAKtyPlz1pZFgb6NDVb0t/cT6LW1Kz3SfRL3tp0xmsypOQiYLvsIN8Qfpwh
	 7AYGuU1Wli/6qUWgUz0Ot6UVx6PDsG5//wykh8Y7IlM/6NFYiC7B+pvLnIGZCaaSwQ
	 rVbmEGvZ5zt4A==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Mantas Pucka <mantas@8devices.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.9
Date: Tue,  5 Mar 2024 19:43:25 -0800
Message-ID: <20240306034326.2358489-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.9

for you to fetch changes up to 7d474b43087aa356d714d39870c90d77fc6f1186:

  clk: qcom: gcc-ipq5018: fix register offset for GCC_UBI0_AXI_ARES reset (2024-03-03 20:00:49 -0800)

----------------------------------------------------------------
Qualcomm clock updates for v6.9

This introduces support for Display, TCSR, GPU, and Camera clock
controllers for X1 Elite.

A number of typos are fixes in the IPQ5018 GCC driver. IPQ6018 gains a
definition of the "qdss_at" clock, which is needed for WiFi operation.

Table termination is added where missing across a range of frequency
tables in different drivers.

MSM8953 gains support for missing MDSS, crypto, and SDCC resets, and the
missing CLKREF clocks for UFS in SC8180X are added.

A softdep on rpmhpd is introduces for SDM845 gcc to assist AOSP with
module load order, to avoid significant delays during boot.

In the SM8150 GCC driver video resets are added and QUPv3 RCGs are
registered for DFS.

The support for supplying GDSCs with an external regulator is corrected
for the custom GPU GX "do-nothing" method. An external supply is then
specified for GX in the SC8280XP GPU clock controller.

Display, GPU, Video, and Camera clock controller drivers are switched to
module_platform_driver(), as they are not needed earlier than that.

A variety of Venus resets across many platforms require a longer delay
than the current 1us, support for larger delays is added and custom
delays are specified across more than a dozen clock drivers.

The GDSC wait times are corrected for GDSCs in the display clock
controller for SDM845.

The unused SC7180 modem subsystem clock driver is dropped.

----------------------------------------------------------------
Abel Vesa (3):
      dt-bindings: clock: Drop the SM8650 DISPCC dedicated schema
      dt-bindings: clock: qcom: Document the X1E80100 TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for x1e80100

Amit Pundir (1):
      clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd

Bjorn Andersson (6):
      dt-bindings: clock: qcom: Allow VDD_GFX supply to GX
      clk: qcom: gdsc: Enable supply reglator in GPU GX handler
      clk: qcom: gpucc-sc8280xp: Add external supply for GX gdsc
      Merge branch '20240202-x1e80100-clock-controllers-v4-5-7fb08c861c7c@linaro.org' into clk-for-6.9
      Merge branch '20240125-msm8953-mdss-reset-v2-1-fd7824559426@z3ntu.xyz' into clk-for-6.9
      Merge branch '20240131-ufs-phy-clock-v3-3-58a49d2f4605@linaro.org' into clk-for-6.9

Bryan O'Donoghue (1):
      clk: qcom: camcc-x1e80100: Fix missing DT_IFACE enum in x1e80100 camcc

Dmitry Baryshkov (6):
      clk: qcom: camcc-*: switch to module_platform_driver
      clk: qcom: dispcc-*: switch to module_platform_driver
      clk: qcom: gpucc-*: switch to module_platform_driver
      clk: qcom: videocc-*: switch to module_platform_driver
      clk: qcom: drop the SC7180 Modem subsystem clock driver
      dt-bindings: clk: qcom: drop the SC7180 Modem subsystem clock controller

Gabor Juhos (10):
      clk: qcom: gcc-ipq5018: fix terminating of frequency table arrays
      clk: qcom: gcc-ipq6018: fix terminating of frequency table arrays
      clk: qcom: gcc-ipq8074: fix terminating of frequency table arrays
      clk: qcom: gcc-ipq9574: fix terminating of frequency table arrays
      clk: qcom: camcc-sc8280xp: fix terminating of frequency table arrays
      clk: qcom: mmcc-apq8084: fix terminating of frequency table arrays
      clk: qcom: mmcc-msm8974: fix terminating of frequency table arrays
      clk: qcom: gcc-ipq5018: fix 'enable_reg' offset of 'gcc_gmac0_sys_clk'
      clk: qcom: gcc-ipq5018: fix 'halt_reg' offset of 'gcc_pcie1_pipe_clk'
      clk: qcom: gcc-ipq5018: fix register offset for GCC_UBI0_AXI_ARES reset

Jeffrey Hugo (1):
      dt-bindings: clock: qcom: Fix @codeaurora email in Q6SSTOP

Konrad Dybcio (21):
      clk: qcom: reset: Increase max reset delay
      clk: qcom: reset: Commonize the de/assert functions
      clk: qcom: reset: Ensure write completion on reset de/assertion
      clk: qcom: gcc-sa8775p: Set delay for Venus CLK resets
      clk: qcom: gcc-sc8180x: Set delay for Venus CLK resets
      clk: qcom: gcc-sc8280xp: Set delay for Venus CLK resets
      clk: qcom: gcc-sm4450: Set delay for Venus CLK resets
      clk: qcom: gcc-sm7150: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8250: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8350: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8450: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8550: Set delay for Venus CLK resets
      clk: qcom: gcc-sm8650: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8150: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8250: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8350: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8450: Set delay for Venus CLK resets
      clk: qcom: videocc-sm8550: Set delay for Venus CLK resets
      clk: qcom: branch: Add a helper for setting the enable bit
      clk: qcom: Use qcom_branch_set_clk_en()
      clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times

Manivannan Sadhasivam (2):
      dt-bindings: clock: qcom: Add missing UFS QREF clocks
      clk: qcom: gcc-sc8180x: Add missing UFS QREF clocks

Mantas Pucka (1):
      clk: qcom: gcc-ipq6018: add qdss_at clock needed for wifi operation

Rajendra Nayak (7):
      dt-bindings: clock: qcom: Document the X1E80100 Display Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 GPU Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 Camera Clock Controller
      clk: qcom: clk-alpha-pll: Add support for zonda ole pll configure
      clk: qcom: Add dispcc clock driver for x1e80100
      clk: qcom: Add GPU clock driver for x1e80100
      clk: qcom: Add camcc clock driver for x1e80100

Satya Priya Kakitapalli (4):
      clk: qcom: gcc-sm8150: Register QUPv3 RCGs for DFS on SM8150
      dt-bindings: clock: qcom,gcc-sm8150: Add gcc video resets for sm8150
      clk: qcom: gcc-sm8150: Add gcc video resets for sm8150
      clk: qcom: dispcc-sm8250: Make clk_init_data and pll_vco const

Vladimir Lypak (2):
      dt-bindings: clock: gcc-msm8953: add more resets
      clk: qcom: gcc-msm8953: add more resets

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    9 +
 .../devicetree/bindings/clock/qcom,q6sstopcc.yaml  |    2 +-
 .../devicetree/bindings/clock/qcom,sc7180-mss.yaml |   61 -
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    7 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../bindings/clock/qcom,sm8650-dispcc.yaml         |  106 -
 drivers/clk/qcom/Kconfig                           |   45 +-
 drivers/clk/qcom/Makefile                          |    5 +-
 drivers/clk/qcom/camcc-sc7180.c                    |   12 +-
 drivers/clk/qcom/camcc-sc7280.c                    |   12 +-
 drivers/clk/qcom/camcc-sc8280xp.c                  |   27 +-
 drivers/clk/qcom/camcc-sdm845.c                    |   12 +-
 drivers/clk/qcom/camcc-sm6350.c                    |   12 +-
 drivers/clk/qcom/camcc-sm8550.c                    |   10 +-
 drivers/clk/qcom/camcc-x1e80100.c                  | 2487 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   16 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    4 +
 drivers/clk/qcom/clk-branch.h                      |    6 +
 drivers/clk/qcom/dispcc-qcm2290.c                  |   16 +-
 drivers/clk/qcom/dispcc-sc7180.c                   |   12 +-
 drivers/clk/qcom/dispcc-sc7280.c                   |   19 +-
 drivers/clk/qcom/dispcc-sc8280xp.c                 |   16 +-
 drivers/clk/qcom/dispcc-sdm845.c                   |   14 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm6125.c                   |   12 +-
 drivers/clk/qcom/dispcc-sm6350.c                   |   12 +-
 drivers/clk/qcom/dispcc-sm6375.c                   |   12 +-
 drivers/clk/qcom/dispcc-sm8250.c                   |  134 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |   19 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |   19 +-
 drivers/clk/qcom/dispcc-sm8650.c                   |   16 +-
 drivers/clk/qcom/dispcc-x1e80100.c                 | 1718 ++++++++++++++
 drivers/clk/qcom/gcc-ipq5018.c                     |    9 +-
 drivers/clk/qcom/gcc-ipq6018.c                     |   19 +
 drivers/clk/qcom/gcc-ipq8074.c                     |    2 +
 drivers/clk/qcom/gcc-ipq9574.c                     |    1 +
 drivers/clk/qcom/gcc-msm8953.c                     |    4 +
 drivers/clk/qcom/gcc-sa8775p.c                     |   29 +-
 drivers/clk/qcom/gcc-sc7180.c                      |   22 +-
 drivers/clk/qcom/gcc-sc7280.c                      |   20 +-
 drivers/clk/qcom/gcc-sc8180x.c                     |   62 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |   29 +-
 drivers/clk/qcom/gcc-sdm845.c                      |    1 +
 drivers/clk/qcom/gcc-sdx55.c                       |   12 +-
 drivers/clk/qcom/gcc-sdx65.c                       |   13 +-
 drivers/clk/qcom/gcc-sdx75.c                       |   10 +-
 drivers/clk/qcom/gcc-sm4450.c                      |   32 +-
 drivers/clk/qcom/gcc-sm6375.c                      |   11 +-
 drivers/clk/qcom/gcc-sm7150.c                      |   25 +-
 drivers/clk/qcom/gcc-sm8150.c                      |  352 +--
 drivers/clk/qcom/gcc-sm8250.c                      |   23 +-
 drivers/clk/qcom/gcc-sm8350.c                      |   24 +-
 drivers/clk/qcom/gcc-sm8450.c                      |   25 +-
 drivers/clk/qcom/gcc-sm8550.c                      |   25 +-
 drivers/clk/qcom/gcc-sm8650.c                      |   20 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   16 +-
 drivers/clk/qcom/gdsc.c                            |   12 +-
 drivers/clk/qcom/gpucc-sa8775p.c                   |   12 +-
 drivers/clk/qcom/gpucc-sc7180.c                    |   12 +-
 drivers/clk/qcom/gpucc-sc7280.c                    |   21 +-
 drivers/clk/qcom/gpucc-sc8280xp.c                  |   10 +-
 drivers/clk/qcom/gpucc-sdm845.c                    |   12 +-
 drivers/clk/qcom/gpucc-sm8150.c                    |   12 +-
 drivers/clk/qcom/gpucc-sm8250.c                    |   12 +-
 drivers/clk/qcom/gpucc-sm8350.c                    |   12 +-
 drivers/clk/qcom/gpucc-sm8550.c                    |   22 +-
 drivers/clk/qcom/gpucc-x1e80100.c                  |  656 ++++++
 drivers/clk/qcom/lpasscorecc-sc7180.c              |    7 +-
 drivers/clk/qcom/mmcc-apq8084.c                    |    2 +
 drivers/clk/qcom/mmcc-msm8974.c                    |    2 +
 drivers/clk/qcom/mss-sc7180.c                      |  140 --
 drivers/clk/qcom/reset.c                           |   27 +-
 drivers/clk/qcom/reset.h                           |    2 +-
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |  285 +++
 drivers/clk/qcom/videocc-sc7180.c                  |   12 +-
 drivers/clk/qcom/videocc-sc7280.c                  |   12 +-
 drivers/clk/qcom/videocc-sdm845.c                  |   12 +-
 drivers/clk/qcom/videocc-sm8150.c                  |   14 +-
 drivers/clk/qcom/videocc-sm8250.c                  |   22 +-
 drivers/clk/qcom/videocc-sm8350.c                  |   14 +-
 drivers/clk/qcom/videocc-sm8450.c                  |   29 +-
 drivers/clk/qcom/videocc-sm8550.c                  |   29 +-
 include/dt-bindings/clock/qcom,gcc-msm8953.h       |    4 +
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |    2 +
 include/dt-bindings/clock/qcom,gcc-sm8150.h        |    3 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |  135 ++
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h   |   98 +
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    |   41 +
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     |   23 +
 include/dt-bindings/reset/qcom,x1e80100-gpucc.h    |   19 +
 92 files changed, 6176 insertions(+), 1198 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8650-dispcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-x1e80100.c
 create mode 100644 drivers/clk/qcom/dispcc-x1e80100.c
 create mode 100644 drivers/clk/qcom/gpucc-x1e80100.c
 delete mode 100644 drivers/clk/qcom/mss-sc7180.c
 create mode 100644 drivers/clk/qcom/tcsrcc-x1e80100.c
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-tcsr.h
 create mode 100644 include/dt-bindings/reset/qcom,x1e80100-gpucc.h

