Return-Path: <linux-arm-msm+bounces-74315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968DB8D395
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 04:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44C97189F59F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 02:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2081E5B72;
	Sun, 21 Sep 2025 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FryCWU6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF61B672;
	Sun, 21 Sep 2025 02:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758421769; cv=none; b=MrFAANWalsX9KWauRZ4D+qgdUMfqXTgaxSuAAzK58Y9seu62Yze0x2UeHgJuD7tx6BdEmMkpzcaipAkmMwPxGd95OaqebvnYaavBYMaDCtU2vXSNJyucJKSs/Au/eNLvPCG9afcW3Q/45thLO/Ki/Be0rxO3yxodiZ4zYocQjfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758421769; c=relaxed/simple;
	bh=fFeKcvyf90lsSwgt3Wk9GULW2dVKlap3cFERVca4D1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VPfblngLRPD06TRWu5+G73qePXQPoxFKdh62xtQN7Nut16x2P3EcS81SqW7/70N9sUNKCRARQkKRcOHg9PNz/7B+IX9V1/RkFn49brkoN0FyEJ5lGlIGa1nGmEYQ0KTO7vI9IfvXJdKR+i78kKzmc4MU46X/rGJTvQDA24yHals=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FryCWU6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5703AC4CEEB;
	Sun, 21 Sep 2025 02:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758421768;
	bh=fFeKcvyf90lsSwgt3Wk9GULW2dVKlap3cFERVca4D1s=;
	h=From:To:Cc:Subject:Date:From;
	b=FryCWU6WZOUstYzyGiXr+Ppjaky/EojKKwIjg6SZ+MTmNc4jpnDuL0eGcnHpElDp/
	 HRS0qTE3p7a862o+A5/FSHo6AnZZbcEEifrcquDab+OzEUtS9CZ6pshwkM9U4HZYfq
	 SN92zowcldjVW6xDERYv3R0PO+dSs1W2x+U4DejyuTU6BxrfrGknhd4S7wJuTf5RLn
	 TelxEB+16P7p8fq9q4SYWxRlbe/tZJldnqEOxf34vhfXXhAZt4dWCeJoGiziqU3OIZ
	 LBC4nE6rmafvvn4vMoXc3Cx7aabPFu0Kqbz9H5aa6TLhShWNq0nNlz6j5vVMyCp+0P
	 Ioz7HCC2p4fCQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Nickolay Goppen <setotau@yandex.ru>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Brian Masney <bmasney@redhat.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniil Titov <daniilt971@gmail.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	=?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.18
Date: Sat, 20 Sep 2025 21:29:23 -0500
Message-ID: <20250921022925.599022-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.18

for you to fetch changes up to 4ca6a89f38718d6cd84304e6a26e7ddc90e03356:

  clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment (2025-09-11 21:09:29 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.18

Introduce Glymur global, display, rpmh, and tcsr clock controllers.
Introduce the IPQ5424 APSS clock controller. Extend the MSM8916 global
clock controller, to add support for MSM8937.

Convert alpha PLL to determine_rate().

Add missing resets in SC7280 display clock controller.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to eDP refclk

Barnabás Czémán (1):
      dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller

Bjorn Andersson (6):
      Merge branch '20250811090954.2854440-2-quic_varada@quicinc.com' into clk-for-6.18
      dt-bindings: clock: dispcc-sc7280: Add display resets
      Merge branch '20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com' into clk-for-6.18
      clk: qcom: dispcc-sc7280: Add dispcc resets
      Merge branch '20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-1-c5a8af040093@yandex.ru' into clk-for-6.18
      Merge branch '20250903-msm8937-v9-1-a097c91c5801@mainlining.org' into clk-for-6.18

Brian Masney (1):
      clk: qcom: alpha-pll: convert from round_rate() to determine_rate()

Dan Carpenter (1):
      clk: qcom: common: Fix NULL vs IS_ERR() check in qcom_cc_icc_register()

Daniil Titov (1):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8937

Imran Shaik (1):
      clk: qcom: dispcc-glymur: Constify 'struct qcom_cc_desc'

Johan Hovold (1):
      clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment

Konrad Dybcio (1):
      clk: qcom: Remove double-space after assignment operator

Krzysztof Kozlowski (1):
      clk: qcom: milos: Constify 'struct qcom_cc_desc'

Lukas Bulwahn (1):
      clk: qcom: Select the intended config in QCS_DISPCC_615

Marko Mäkelä (1):
      clk: qcom: gcc-ipq6018: rework nss_port5 clock to multiple conf

Nickolay Goppen (2):
      dt-bindings: clock: gcc-sdm660: Add LPASS/CDSP vote clocks/GDSCs
      clk: qcom: gcc-sdm660: Add missing LPASS/CDSP vote clocks

Satya Priya Kakitapalli (1):
      dt-bindings: clock: qcom,videocc: Add sc8180x compatible

Sricharan Ramabadhran (2):
      dt-bindings: clock: ipq5424-apss-clk: Add ipq5424 apss clock controller
      clk: qcom: apss-ipq5424: Add ipq5424 apss clock controller

Taniya Das (9):
      dt-bindings: clock: Add DISPCC and reset controller for GLYMUR SoC
      clk: qcom: dispcc-glymur: Add support for Display Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
      dt-bindings: clock: qcom: Document the Glymur SoC TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for Glymur SoC
      clk: qcom: rpmh: Add support for Glymur rpmh clocks
      clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
      dt-bindings: clock: qcom: document the Glymur Global Clock Controller
      clk: qcom: gcc: Add support for Global Clock Controller

 .../bindings/clock/qcom,gcc-msm8953.yaml           |   11 +-
 .../bindings/clock/qcom,glymur-dispcc.yaml         |   98 +
 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml |  121 +
 .../bindings/clock/qcom,ipq5424-apss-clk.yaml      |   55 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    3 +
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   23 +-
 drivers/clk/qcom/Kconfig                           |   44 +-
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/a7-pll.c                          |    2 +-
 drivers/clk/qcom/apss-ipq5424.c                    |  265 +
 drivers/clk/qcom/camcc-milos.c                     |    2 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |  162 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rcg.c                         |    2 +-
 drivers/clk/qcom/clk-rcg2.c                        |    8 +-
 drivers/clk/qcom/clk-rpmh.c                        |   28 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |    8 +-
 drivers/clk/qcom/common.c                          |    4 +-
 drivers/clk/qcom/dispcc-glymur.c                   | 1982 +++++
 drivers/clk/qcom/dispcc-milos.c                    |    2 +-
 drivers/clk/qcom/dispcc-sc7280.c                   |    8 +
 drivers/clk/qcom/gcc-glymur.c                      | 8616 ++++++++++++++++++++
 drivers/clk/qcom/gcc-ipq6018.c                     |   60 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +-
 drivers/clk/qcom/gcc-qcs404.c                      |    2 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |    4 -
 drivers/clk/qcom/gcc-sdm660.c                      |   72 +
 drivers/clk/qcom/gpucc-sa8775p.c                   |    6 +-
 drivers/clk/qcom/gpucc-sc7180.c                    |    2 +-
 drivers/clk/qcom/gpucc-sm6350.c                    |    4 +-
 drivers/clk/qcom/gpucc-sm8150.c                    |    2 +-
 drivers/clk/qcom/gpucc-sm8250.c                    |    2 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |    4 +-
 drivers/clk/qcom/lpasscc-sc8280xp.c                |    4 +-
 drivers/clk/qcom/lpasscc-sm6115.c                  |    2 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c              |    2 +-
 drivers/clk/qcom/mmcc-sdm660.c                     |    2 +-
 drivers/clk/qcom/nsscc-ipq9574.c                   |    2 +-
 drivers/clk/qcom/tcsrcc-glymur.c                   |  313 +
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |    4 +
 drivers/clk/qcom/videocc-milos.c                   |    2 +-
 include/dt-bindings/clock/qcom,apss-ipq.h          |    6 +
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |    4 +
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   19 +
 include/dt-bindings/clock/qcom,gcc-sdm660.h        |    6 +
 include/dt-bindings/clock/qcom,glymur-dispcc.h     |  114 +
 include/dt-bindings/clock/qcom,glymur-gcc.h        |  578 ++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       |   24 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |    3 +
 50 files changed, 13162 insertions(+), 153 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5424-apss-clk.yaml
 create mode 100644 drivers/clk/qcom/apss-ipq5424.c
 create mode 100644 drivers/clk/qcom/dispcc-glymur.c
 create mode 100644 drivers/clk/qcom/gcc-glymur.c
 create mode 100644 drivers/clk/qcom/tcsrcc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-tcsr.h

