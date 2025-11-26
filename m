Return-Path: <linux-arm-msm+bounces-83501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E4C8B329
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6EFF4E4E9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6065B286400;
	Wed, 26 Nov 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKe6QrMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0607E286419;
	Wed, 26 Nov 2025 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178140; cv=none; b=PREFbGNIj7DhAhr3p7iUJTaBiOYqce9oNNwPeBrhcxBZf5RyD2e1UrzVAg+xAceSlg1biXa+dgxxz4gISM645tVzjm95zOc6VTk+qFmrPmhJsLvEfKcyVBxA0OW+f9aGQlAzEMzcY3HkKc6AL/YOR1mNhluO3GAHCh1/oE3/gUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178140; c=relaxed/simple;
	bh=CRd9ZrPYpoyGd8r/7/O5tFeVFSuVBLHqNThxe4BQ6DY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+7r9yznnOuMO4p67cqhM4TSfOZioGaM2QgzL+pRcZ+LjN7qxVSDcY3TLlq6ypyJVAPM/OSYaqoOIVE8Ub4kZ28Uayq0Qhfu9BoVRIa3PfLWBP+QL52EDHf6aaJk48Fg9fmBtOGmfFXa15lnwbzqBS3TPkKI8Bm3Yo8DwccZOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKe6QrMK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E7BC4CEF7;
	Wed, 26 Nov 2025 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764178139;
	bh=CRd9ZrPYpoyGd8r/7/O5tFeVFSuVBLHqNThxe4BQ6DY=;
	h=From:To:Cc:Subject:Date:From;
	b=PKe6QrMK9/RRLA2iPoGFGomnlP/IGi0Rfu4K8dfgQXiKHMaAbuT9BFpQO950pPOSh
	 /PdOcxwGIUFC7BvPAhflnJiVI3w/VURWOYtz4JDYPUJc5Hgjs6G8uMJRnf1QTAd91z
	 r8MVUj2fDEjxSdMbFrLZ+71OkV4bnZ9To4gyHIZyEQA0y2WSXoTbk6ma2YgOOswgrZ
	 uLIUP4cGotrOPORToq3obJq1lcmi/w1iCs0O8D9WU6ablY5rhuuh/TzSc3PUjPAwN4
	 1ruRZUgJx4+Bse8OdPgkygBq/ILQLM//ny9wTNwdkOregdb3Hj67CtYANM9EgGl6Av
	 DEp8ZBcO11hbg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jens Reidel <adrian@mainlining.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [GIT PULL] Qualcomm clock updates for v6.19
Date: Wed, 26 Nov 2025 11:34:30 -0600
Message-ID: <20251126173430.1556604-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.19

for you to fetch changes up to 3664282f3345fdfa6a154feb6ed6c3217a8b3b0d:

  clk: qcom: x1e80100-dispcc: Add USB4 router link resets (2025-11-18 16:11:37 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v6.19

Introduce support for the IPQ5424 Network Subsystem Clock Controller and
the video clock controller for SM8750.

Describe the parent/child relationship among the Titan GDSCs on SM845,
SM6350, SM7150, SM8250, SM8450, and SM8550.

Define display subsystem reset signals for SM6350, SM7150, and SDM660.

Add missing USB4 clocks and resets on Hamoa.

Address a variety of smaller issues across the drivers, and a few more
Kconfig dependency issues.

----------------------------------------------------------------
Alexey Minnekhanov (2):
      dt-bindings: clock: mmcc-sdm660: Add missing MDSS reset
      clk: qcom: mmcc-sdm660: Add missing MDSS reset

Bjorn Andersson (5):
      Merge branch '20251003-topic-hamoa_gcc_usb4-v2-1-61d27a14ee65@oss.qualcomm.com' into clk-for-6.19
      Merge branch '20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com' into clk-for-6.19
      Merge branch '20250919-sm7150-dispcc-fixes-v1-1-308ad47c5fce@mainlining.org' into clk-for-6.19
      Merge branch '20251014-qcom_ipq5424_nsscc-v7-2-081f4956be02@quicinc.com' into clk-for-6.19
      Merge branch '20251030-gcc_kaanapali-v2-v2-3-a774a587af6f@oss.qualcomm.com' into clk-for-6.19

Gabor Juhos (2):
      clk: qcom: apss-ipq5424: remove unused 'apss_clk' structure
      clk: qcom: use different Kconfig prompts for APSS IPQ5424/6018 drivers

Jens Reidel (3):
      dt-bindings: clock: sm7150-dispcc: Add MDSS_CORE reset
      clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
      clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src

Konrad Dybcio (8):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing USB4 clocks/resets
      clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
      clk: qcom: rpmh: Define RPMH_IPA_CLK on QCS615
      clk: qcom: gcc-sc8280xp: Remove 85.71 MHz USB4 master clock frequency
      clk: qcom: gcc-x1e80100: Remove 85.71 MHz USB4 master clock frequency
      clk: qcom: gcc-glymur: Remove 85.71 MHz USB4 master clock frequency
      dt-bindings: clock: qcom: x1e80100-dispcc: Add USB4 router link resets
      clk: qcom: x1e80100-dispcc: Add USB4 router link resets

Luca Weiss (4):
      dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      clk: qcom: camcc-sm6350: Fix PLL config of PLL2
      clk: qcom: camcc-sm7150: Fix PLL config of PLL2

Luo Jie (8):
      dt-bindings: clock: Add "#interconnect-cells" property in IPQ9574 example
      dt-bindings: interconnect: Add Qualcomm IPQ5424 NSSNOC IDs
      dt-bindings: clock: gcc-ipq5424: Add definition for GPLL0_OUT_AUX
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5424 SoC
      clk: qcom: gcc-ipq5424: Correct the icc_first_node_id
      clk: qcom: gcc-ipq5424: Enable NSS NoC clocks to use icc-clk
      clk: qcom: gcc-ipq5424: Add gpll0_out_aux clock
      clk: qcom: Add NSS clock controller driver for IPQ5424

Nathan Chancellor (2):
      clk: qcom: Fix SM_VIDEOCC_6350 dependencies
      clk: qcom: Fix dependencies of QCS_{DISP,GPU,VIDEO}CC_615

Taniya Das (12):
      clk: qcom: gcc-sm8750: Add a new frequency for sdcc2 clock
      clk: qcom: gcc-glymur: Update the halt check flags for pipe clocks
      clk: qcom: gcc-qcs615: Update the SDCC clock to use shared_floor_ops
      clk: qcom: tcsrcc-glymur: Update register offsets for clock refs
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
      dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
      dt-bindings: clock: qcom: Add Kaanapali Global clock controller
      clk: qcom: clk_mem_branch: add enable mask and invert flags
      clk: qcom: ecpricc-qdu100: Add mem_enable_mask to the clock memory branch
      clk: qcom: branch: Extend invert logic for branch2 mem clocks
      dt-bindings: clock: qcom: Add SM8750 video clock controller
      clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750

Vladimir Zapolskiy (6):
      clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
      clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
      clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
      clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
      clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
      clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   63 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    5 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |   62 +-
 drivers/clk/qcom/Kconfig                           |   32 +-
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/apss-ipq5424.c                    |    7 -
 drivers/clk/qcom/camcc-sdm845.c                    |    3 +
 drivers/clk/qcom/camcc-sm6350.c                    |   13 +-
 drivers/clk/qcom/camcc-sm7150.c                    |    9 +-
 drivers/clk/qcom/camcc-sm8250.c                    |    3 +
 drivers/clk/qcom/camcc-sm8450.c                    |    3 +
 drivers/clk/qcom/camcc-sm8550.c                    |   10 +
 drivers/clk/qcom/clk-branch.c                      |    8 +-
 drivers/clk/qcom/clk-branch.h                      |    4 +
 drivers/clk/qcom/clk-rpmh.c                        |    1 +
 drivers/clk/qcom/dispcc-sm6350.c                   |    7 +
 drivers/clk/qcom/dispcc-sm7150.c                   |    9 +-
 drivers/clk/qcom/dispcc-x1e80100.c                 |    3 +
 drivers/clk/qcom/ecpricc-qdu1000.c                 |   30 +
 drivers/clk/qcom/gcc-glymur.c                      |   25 +-
 drivers/clk/qcom/gcc-ipq5424.c                     |   28 +-
 drivers/clk/qcom/gcc-qcs615.c                      |    6 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |    1 -
 drivers/clk/qcom/gcc-sm8750.c                      |    1 +
 drivers/clk/qcom/gcc-x1e80100.c                    |  699 +++++++++-
 drivers/clk/qcom/mmcc-sdm660.c                     |    1 +
 drivers/clk/qcom/nsscc-ipq5424.c                   | 1340 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   |   54 +-
 drivers/clk/qcom/videocc-sm8750.c                  |  463 +++++++
 include/dt-bindings/clock/qcom,dispcc-sm6350.h     |    4 +
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    3 +-
 include/dt-bindings/clock/qcom,ipq5424-nsscc.h     |   65 +
 include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++++
 include/dt-bindings/clock/qcom,mmcc-sdm660.h       |    1 +
 include/dt-bindings/clock/qcom,sm7150-dispcc.h     |    3 +
 include/dt-bindings/clock/qcom,sm8750-videocc.h    |   40 +
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h   |    3 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |   61 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   33 +
 include/dt-bindings/reset/qcom,ipq5424-nsscc.h     |   46 +
 43 files changed, 3298 insertions(+), 104 deletions(-)
 create mode 100644 drivers/clk/qcom/nsscc-ipq5424.c
 create mode 100644 drivers/clk/qcom/videocc-sm8750.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-nsscc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-videocc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-nsscc.h

