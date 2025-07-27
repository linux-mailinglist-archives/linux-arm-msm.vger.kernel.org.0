Return-Path: <linux-arm-msm+bounces-66775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3FB12D6D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 04:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4CE189B1EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 02:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA84433A4;
	Sun, 27 Jul 2025 02:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDjwHbrv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C824B29;
	Sun, 27 Jul 2025 02:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753582679; cv=none; b=NjcOb1/+e/7GfTxO5thusDIJwh3CXh5s0iA9FbaL4ffkHKDsMZ4kEibcSxnicBNipjr4TA9NLIaLEHVwP9uZ6UaZuBVC3QgYWQmKUPmZkNooNgeTkzQeL+FjfVFM5YL51vd502jysPy26I78ks7eC6G9fhGiBuLXs1OFKb9zgcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753582679; c=relaxed/simple;
	bh=Y5zHoODlzWxavxPuDfmCtM9nxpP4mAOVW9JeR00zZEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iTrT8mAJi/G/xARBnrOdB41zwZsNs/eyjgvUjisZ0AZeigywV1IWA6A1WIBtxH8Q1k6tE82Ur0PqOB1fuwGHCJJtGC1s4/8fNSEa/xi2eCgYhsqnwqpPNthpIn1AGQusV6P7GUL7UdS0PIVjjk66g+WqQ5x6weWH+uSqvM2nBVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDjwHbrv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A014BC4CEED;
	Sun, 27 Jul 2025 02:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753582678;
	bh=Y5zHoODlzWxavxPuDfmCtM9nxpP4mAOVW9JeR00zZEo=;
	h=From:To:Cc:Subject:Date:From;
	b=IDjwHbrvKloC3zEWfx12EI9BBU2IXr9TdPpwzU978h/DzlIyInfSxt9qoZXKwx6UL
	 iBTFWP7xLNUd2qC/vrLwZ9WFkvl9lgb4JukRM5Tejcw0l4Xa6BPEWRc25v6BJv5jeI
	 lpGuOjBjO4oBxWAKXPrHDmXB6Ujj0KZrtWuGtsXD0MhYo6UCmQa9N81/vNDGzBBfAH
	 VVf0OuRYU2RNjNYmpna5GrCfin5O0wQvz8ZShBPOSvwcfOcI74A0jK94Tpgqysq85g
	 AIVqHFDCQj80oWbv41eNOX4UPP7wZtVWjnBMq56xV6g8IPWOcvjd0FQtzqsxWCId5h
	 a+HPZcc7imn5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Brian Masney <bmasney@redhat.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	George Moussalem <george.moussalem@outlook.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [GIT PULL] Qualcomm clock updated for v6.17
Date: Sat, 26 Jul 2025 21:17:55 -0500
Message-ID: <20250727021756.657115-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.17

for you to fetch changes up to 45dd59885ca8d283f365774a82b9b785b65c8d37:

  dt-bindings: clock: qcom,sm4450-dispcc: Reference qcom,gcc.yaml (2025-07-19 22:42:28 -0500)

----------------------------------------------------------------
Qualcomm clock updated for v6.17

Add global, display, gpu, video, camera, tcsr, and rpmh clock controller
for the Milos SoC.

Add camera, display, GPU, and video clock controllers for QCS615, add
the video clock controller for SM6350, and add a camera clock controller
driver for SC8180X.

Move PLL configuration to really probe across a variety of platforms, in
order to handle the clock controllers powered by multiple power domains.

Replace round_rate() with determine_rate() across the clock
implementations.

Enable GDSC hardware control for video clock controller GDSCs in a few
platforms.

Fix GE PHY reset on IPQ5018, broken NSS port6 frequency table on
IPQ8074, add missing video resets on X1E80100 and keep the XO clock
always on on IPQ5018.

----------------------------------------------------------------
Bjorn Andersson (3):
      Merge branch '20250512-sc8180x-camcc-support-v4-2-8fb1d3265f52@quicinc.com' into clk-for-6.17
      Merge branch '20250610-qcom_ipq5424_cmnpll-v3-1-ceada8165645@quicinc.com' into clk-for-6.17
      Merge branch '20250516-ipq5018-cmn-pll-v4-2-389a6b30e504@outlook.com' into clk-for-6.17

Brian Masney (5):
      clk: qcom: gcc-ipq4019: convert from round_rate() to determine_rate()
      clk: qcom: rpm: convert from round_rate() to determine_rate()
      clk: qcom: rpmh: convert from round_rate() to determine_rate()
      clk: qcom: smd-rpm: convert from round_rate() to determine_rate()
      clk: qcom: spmi-pmic-div: convert from round_rate() to determine_rate()

Christian Marangi (1):
      clk: qcom: gcc-ipq8074: fix broken freq table for nss_port6_tx_clk_src

George Moussalem (4):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5018 SoC
      clk: qcom: ipq5018: keep XO clock always on
      clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
      clk: qcom: gcc-ipq5018: fix GE PHY reset

Jagadeesh Kona (10):
      dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
      dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
      clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
      clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
      clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
      clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
      clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe

Konrad Dybcio (1):
      clk: qcom: Add video clock controller driver for SM6350

Krzysztof Kozlowski (1):
      clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks

Loic Poulain (1):
      clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC

Luca Weiss (16):
      dt-bindings: clock: qcom: Document the Milos RPMH Clock Controller
      clk: qcom: rpmh: Add support for RPMH clocks on Milos
      dt-bindings: clock: qcom: document the Milos TCSR Clock Controller
      clk: qcom: tcsrcc-sm8650: Add support for Milos SoC
      clk: qcom: common: Add support to register rcg dfs in qcom_cc_really_probe
      dt-bindings: clock: qcom: document the Milos Global Clock Controller
      clk: qcom: Add Global Clock controller (GCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Camera Clock Controller
      clk: qcom: Add Camera Clock controller (CAMCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Display Clock Controller
      clk: qcom: Add Display Clock controller (DISPCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos GPU Clock Controller
      clk: qcom: Add Graphics Clock controller (GPUCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Video Clock Controller
      clk: qcom: Add Video Clock controller (VIDEOCC) driver for Milos
      dt-bindings: clock: qcom: Remove double colon from description

Luo Jie (2):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5424 SoC
      clk: qcom: cmnpll: Add IPQ5424 SoC support

Satya Priya Kakitapalli (7):
      dt-bindings: clock: qcom: Add missing bindings on gcc-sc8180x
      dt-bindings: clock: Add Qualcomm SC8180X Camera clock controller
      clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver
      dt-bindings: clock: qcom,sm8150-camcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,mmcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm4450-camcc: Reference qcom,gcc.yaml
      dt-bindings: clock: qcom,sm4450-dispcc: Reference qcom,gcc.yaml

Stephan Gerhold (5):
      dt-bindings: clock: qcom,sm8450-videocc: Document X1E80100 compatible
      clk: qcom: videocc-sm8550: Allow building without SM8550/SM8560 GCC
      clk: qcom: videocc-sm8550: Add separate frequency tables for X1E80100
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing video resets
      clk: qcom: gcc-x1e80100: Add missing video resets

Taniya Das (11):
      clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
      clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's
      clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
      dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
      clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
      clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
      clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
      clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver

Vladimir Zapolskiy (1):
      dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains

 .../bindings/clock/qcom,camcc-sm8250.yaml          |    2 +-
 .../bindings/clock/qcom,dispcc-sm6125.yaml         |    2 +-
 .../bindings/clock/qcom,dispcc-sm6350.yaml         |    2 +-
 .../bindings/clock/qcom,gcc-ipq4019.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-ipq8074.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-msm8976.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-msm8994.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-msm8996.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-msm8998.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-qcm2290.yaml           |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-qcs404.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |    2 +-
 .../bindings/clock/qcom,gcc-sc8180x.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-sc8280xp.yaml          |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml  |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6115.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6125.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    2 +-
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |    2 +
 .../bindings/clock/qcom,milos-camcc.yaml           |   51 +
 .../bindings/clock/qcom,milos-dispcc.yaml          |   63 +
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   62 +
 .../bindings/clock/qcom,milos-videocc.yaml         |   53 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |   24 +-
 .../bindings/clock/qcom,msm8998-gpucc.yaml         |    2 +-
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |    2 +-
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   55 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   49 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   47 +
 .../bindings/clock/qcom,qdu1000-ecpricc.yaml       |    2 +-
 .../bindings/clock/qcom,qdu1000-gcc.yaml           |    2 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   15 +
 .../bindings/clock/qcom,sa8775p-gcc.yaml           |    2 +-
 .../bindings/clock/qcom,sc7180-camcc.yaml          |    2 +-
 .../bindings/clock/qcom,sc7180-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    |    2 +-
 .../bindings/clock/qcom,sc7280-camcc.yaml          |    2 +-
 .../bindings/clock/qcom,sc7280-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sc7280-lpasscc.yaml        |    2 +-
 .../bindings/clock/qcom,sc8180x-camcc.yaml         |   67 +
 .../bindings/clock/qcom,sdm845-camcc.yaml          |    2 +-
 .../bindings/clock/qcom,sdm845-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sdm845-lpasscc.yaml        |    2 +-
 .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |    2 +-
 .../bindings/clock/qcom,sm4450-camcc.yaml          |   22 +-
 .../bindings/clock/qcom,sm4450-dispcc.yaml         |   22 +-
 .../devicetree/bindings/clock/qcom,sm4450-gcc.yaml |    2 +-
 .../bindings/clock/qcom,sm6115-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sm6115-gpucc.yaml          |    2 +-
 .../bindings/clock/qcom,sm6125-gpucc.yaml          |    2 +-
 .../bindings/clock/qcom,sm6350-camcc.yaml          |   11 +-
 .../bindings/clock/qcom,sm6375-dispcc.yaml         |    2 +-
 .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |    2 +-
 .../bindings/clock/qcom,sm6375-gpucc.yaml          |    2 +-
 .../bindings/clock/qcom,sm7150-camcc.yaml          |    2 +-
 .../bindings/clock/qcom,sm7150-dispcc.yaml         |    2 +-
 .../devicetree/bindings/clock/qcom,sm7150-gcc.yaml |    2 +-
 .../bindings/clock/qcom,sm7150-videocc.yaml        |    2 +-
 .../bindings/clock/qcom,sm8150-camcc.yaml          |   22 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   20 +-
 .../bindings/clock/qcom,sm8450-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   19 +-
 .../devicetree/bindings/clock/qcom,sm8550-gcc.yaml |    2 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |    2 +-
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    2 +-
 drivers/clk/qcom/Kconfig                           |  104 +-
 drivers/clk/qcom/Makefile                          |   11 +
 drivers/clk/qcom/camcc-milos.c                     | 2161 +++++++++++++
 drivers/clk/qcom/camcc-qcs615.c                    | 1597 ++++++++++
 drivers/clk/qcom/camcc-sc8180x.c                   | 2889 ++++++++++++++++++
 drivers/clk/qcom/camcc-sm8450.c                    |   89 +-
 drivers/clk/qcom/camcc-sm8550.c                    |   85 +-
 drivers/clk/qcom/camcc-sm8650.c                    |   83 +-
 drivers/clk/qcom/camcc-x1e80100.c                  |   67 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |  249 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    4 +
 drivers/clk/qcom/clk-rpm.c                         |   10 +-
 drivers/clk/qcom/clk-rpmh.c                        |   34 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |    8 +-
 drivers/clk/qcom/clk-spmi-pmic-div.c               |   12 +-
 drivers/clk/qcom/common.c                          |   91 +-
 drivers/clk/qcom/common.h                          |   12 +
 drivers/clk/qcom/dispcc-milos.c                    |  974 ++++++
 drivers/clk/qcom/dispcc-qcs615.c                   |  792 +++++
 drivers/clk/qcom/dispcc-sm8750.c                   |   10 +-
 drivers/clk/qcom/gcc-ipq4019.c                     |   14 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |    4 +-
 drivers/clk/qcom/gcc-ipq8074.c                     |    6 +-
 drivers/clk/qcom/gcc-milos.c                       | 3225 ++++++++++++++++++++
 drivers/clk/qcom/gcc-qcm2290.c                     |    1 +
 drivers/clk/qcom/gcc-x1e80100.c                    |    2 +
 drivers/clk/qcom/gpucc-milos.c                     |  562 ++++
 drivers/clk/qcom/gpucc-qcs615.c                    |  531 ++++
 drivers/clk/qcom/ipq-cmn-pll.c                     |   50 +-
 drivers/clk/qcom/tcsrcc-sm8650.c                   |    8 +
 drivers/clk/qcom/videocc-milos.c                   |  403 +++
 drivers/clk/qcom/videocc-qcs615.c                  |  338 ++
 drivers/clk/qcom/videocc-sc7180.c                  |    2 +-
 drivers/clk/qcom/videocc-sdm845.c                  |    4 +-
 drivers/clk/qcom/videocc-sm6350.c                  |  355 +++
 drivers/clk/qcom/videocc-sm7150.c                  |    4 +-
 drivers/clk/qcom/videocc-sm8150.c                  |    4 +-
 drivers/clk/qcom/videocc-sm8450.c                  |   62 +-
 drivers/clk/qcom/videocc-sm8550.c                  |   91 +-
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   10 +
 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h   |   16 +
 include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h   |   22 +
 include/dt-bindings/clock/qcom,milos-camcc.h       |  131 +
 include/dt-bindings/clock/qcom,milos-dispcc.h      |   61 +
 include/dt-bindings/clock/qcom,milos-gcc.h         |  210 ++
 include/dt-bindings/clock/qcom,milos-gpucc.h       |   56 +
 include/dt-bindings/clock/qcom,milos-videocc.h     |   36 +
 include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 +
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
 include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
 include/dt-bindings/clock/qcom,sc8180x-camcc.h     |  181 ++
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |    2 +
 128 files changed, 16172 insertions(+), 450 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-milos.c
 create mode 100644 drivers/clk/qcom/camcc-qcs615.c
 create mode 100644 drivers/clk/qcom/camcc-sc8180x.c
 create mode 100644 drivers/clk/qcom/dispcc-milos.c
 create mode 100644 drivers/clk/qcom/dispcc-qcs615.c
 create mode 100644 drivers/clk/qcom/gcc-milos.c
 create mode 100644 drivers/clk/qcom/gpucc-milos.c
 create mode 100644 drivers/clk/qcom/gpucc-qcs615.c
 create mode 100644 drivers/clk/qcom/videocc-milos.c
 create mode 100644 drivers/clk/qcom/videocc-qcs615.c
 create mode 100644 drivers/clk/qcom/videocc-sm6350.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,milos-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,milos-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,milos-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,milos-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,milos-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sc8180x-camcc.h

