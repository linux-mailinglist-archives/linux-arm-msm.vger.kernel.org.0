Return-Path: <linux-arm-msm+bounces-31796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 266169793B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Sep 2024 00:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8E40281D6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 22:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F45680C13;
	Sat, 14 Sep 2024 22:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCj/QQf1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6C1754B;
	Sat, 14 Sep 2024 22:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726353157; cv=none; b=mmTtQXPd+nOaD6I1gqD9WyIcrt09jGXAz6nfUOEnV1IUs5Vhv1jZ1WAe5DpJuLQ+xH5vZJ45CWyiyEFAxwx8ICN/Vnc4lgnpxi2Fz9nAj5cEdIuqCsMZUceFuvCsrt+yYZ0/v/+YJSydGIaFRj84Rc5BwH5BO4Ii526Iin4xf/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726353157; c=relaxed/simple;
	bh=mzu319gOyezEAsAXkT6vv3I9cBstoFo6cqF4O1AhEp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPGyhzjf0bOtIXKbBOyX9atXq7Kmr+MIhHk8fP6tWz6rMq1DBQ9rgp2DSDlq4eK7EGTASsN9smFTacqXpDqhWDa29gaYqfok1Ms92eq/x2qb689XqUMWbZX7APIl9NsncYyC3RVhqQMJNXZds79tJJtASW9VGZWhVmFA3oX2Dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCj/QQf1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A83C4CEC0;
	Sat, 14 Sep 2024 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726353156;
	bh=mzu319gOyezEAsAXkT6vv3I9cBstoFo6cqF4O1AhEp0=;
	h=From:To:Cc:Subject:Date:From;
	b=qCj/QQf1Wg+StxQR12zn5iYkH0rwEVT7t1eBhKfv4SlG483AjI8RkJ1XFjKMaVf3S
	 ireiaekBDdibRUIVBcyOOgVPJkzhiepD0BjUj9dCnCiEBtkelbtHMETpgSh9LuLWx3
	 K15PYDXuPBw/kz+TyAvo6IOF2EhDAFLIeSfyPry86B/kXwVjE0B20aiS1WuTd9YC9i
	 FBS7NrAZ6x1z+NvMM9ViW17+J18hQITHd9wRbmxS78GhBQNnorKr+7Ug/ERD0VAB37
	 BMT68/IZYDd/FouTi6zeoPpSlyX+Xdj4IyNlEO5nSIMn+rF/0+7LAExEmdJKt1B49A
	 44q0pC/uqmrKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Rayyan Ansari <rayyan.ansari@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Vedang Nagar <quic_vnagar@quicinc.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.12
Date: Sat, 14 Sep 2024 17:32:32 -0500
Message-ID: <20240914223233.1342-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.12

for you to fetch changes up to d628455ab3c22bf633935f5d09451530c44c4ba3:

  clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER flag for video GDSC's (2024-08-20 17:15:16 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.12

This introduces camera, display and gpu clock drivers for SM4450. A
camera clock controller is also introduced for SM8150.

A bunch of struct freq_tbl are marked const, to reduce .data usage.

Support for MSM8226 A7PLL and the Regera PLL is introduced.

The Lucid 5LPE PLL configuration sequence is corrected to not reuse
Trion, as they do differ.

A number of fixes are made to SM8550 display clock controller, and
SM8650 is folded into the same driver.

Missing clocks and GDSCs needed for audio on MSM8998 are added.

For SC8180X missing USB MP resets, GPLL9 clock, and QUPv3 DFS clocks are
added, the sdcc clock frequency tables are corrected.

The SM8150 gcc_cpuss_ahb_clk_src is dropped.

PCIe GDSCs are marked at RET_ON on sm8250 and sm8540, to avoid them
turning off during suspend.

The SM8550 video clock controller GDSCs are marked to use the newly
introduced HW_CTRL mechanism.

----------------------------------------------------------------
Ajit Pandey (7):
      dt-bindings: clock: qcom: add DISPCC clocks on SM4450
      dt-bindings: clock: qcom: add CAMCC clocks on SM4450
      dt-bindings: clock: qcom: add GPUCC clocks on SM4450
      clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
      clk: qcom: Add DISPCC driver support for SM4450
      clk: qcom: Add CAMCC driver support for SM4450
      clk: qcom: Add GPUCC driver support for SM4450

AngeloGioacchino Del Regno (2):
      dt-bindings: clock: gcc-msm8998: Add Q6 and LPASS clocks definitions
      clk: qcom: gcc-msm8998: Add Q6 BIMC and LPASS core, ADSP SMMU clocks

Bjorn Andersson (9):
      dt-bindings: clock: qcom: Add missing USB MP resets
      Merge branch '20240730-sc8180x-usb-mp-v2-1-a7dc4265b553@quicinc.com' into clk-for-6.12
      clk: qcom: gcc-sc8180x: Add missing USB MP resets
      Merge branch '20240731062916.2680823-7-quic_skakitap@quicinc.com' into clk-for-6.12
      Merge branch '20240717-dispcc-sm8550-fixes-v2-7-5c4a3128c40b@linaro.org' into clk-for-6.12
      clk: qcom: camcc-sm8150: Correct qcom_cc_really_probe() argument
      Merge branch '20240611133752.2192401-1-quic_ajipan@quicinc.com' into clk-for-6.12
      Merge branch '20240814-lpass-v1-1-a5bb8f9dfa8b@freebox.fr' into clk-for-6.12
      Merge branch '20240730054817.1915652-2-quic_varada@quicinc.com' into clk-for-6.12

Christophe JAILLET (1):
      clk: qcom: Constify struct freq_tbl

Dmitry Baryshkov (9):
      dt-bindings: clock: qcom,sm8650-dispcc: replace with symlink
      clk: qcom: dispcc-sm8550: fix several supposed typos
      clk: qcom: dispcc-sm8550: use rcg2_ops for mdss_dptx1_aux_clk_src
      clk: qcom: dispcc-sm8550: make struct clk_init_data const
      clk: qcom: dispcc-sm8650: Update the GDSC flags
      clk: qcom: dispcc-sm8550: use rcg2_shared_ops for ESC RCGs
      clk: qcom: fold dispcc-sm8650 info dispcc-sm8550
      clk: qcom: dispcc-sm8250: use CLK_SET_RATE_PARENT for branch clocks
      clk: qcom: dispcc-sm8250: use special function for Lucid 5LPE PLL

Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Drop required-opps in required on sm8650 videocc
      dt-bindings: clock: qcom: Drop required-opps in required on SM8650 camcc

Luca Weiss (3):
      dt-bindings: clock: qcom,a53pll: Allow opp-table subnode
      dt-bindings: clock: qcom,a53pll: Add msm8226-a7pll compatible
      clk: qcom: a53-pll: Add MSM8226 a7pll support

Manivannan Sadhasivam (2):
      clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-sm8450: Do not turn off PCIe GDSCs during gdsc_disable()

Mike Tipton (1):
      clk: qcom: clk-rpmh: Fix overflow in BCM vote

Rayyan Ansari (1):
      dt-bindings: clock: qcom,qcs404-turingcc: convert to dtschema

Satya Priya Kakitapalli (8):
      dt-bindings: clock: qcom: Add SM8150 camera clock controller
      clk: qcom: Add camera clock controller driver for SM8150
      clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS on sc8180x
      dt-bindings: clock: qcom: Add GPLL9 support on gcc-sc8180x
      clk: qcom: gcc-sc8180x: Add GPLL9 support
      clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks freq table
      clk: qcom: gcc-sm8150: De-register gcc_cpuss_ahb_clk_src
      clk: qcom: Fix SM_CAMCC_8150 dependencies

Srinivas Kandagatla (2):
      dt-bindings: clock: Add x1e80100 LPASS AUDIOCC reset controller
      dt-bindings: clock: Add x1e80100 LPASSCC reset controller

Taniya Das (1):
      clk: qcom: clk-alpha-pll: Add support for Regera PLL ops

Varadarajan Narayanan (4):
      dt-bindings: interconnect: Add Qualcomm IPQ5332 support
      dt-bindings: usb: qcom,dwc3: Update ipq5332 clock details
      clk: qcom: ipq5332: Register gcc_qdss_tsctr_clk_src
      clk: qcom: ipq5332: Use icc-clk for enabling NoC related clocks

Vedang Nagar (1):
      clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER flag for video GDSC's

 .../devicetree/bindings/clock/qcom,a53pll.yaml     |    4 +
 .../bindings/clock/qcom,ipq5332-gcc.yaml           |    2 +
 .../bindings/clock/qcom,qcs404-turingcc.yaml       |   47 +
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      |   13 +-
 .../bindings/clock/qcom,sm4450-camcc.yaml          |   63 +
 .../bindings/clock/qcom,sm4450-dispcc.yaml         |   71 +
 .../bindings/clock/qcom,sm8150-camcc.yaml          |   77 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   19 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   11 +-
 .../devicetree/bindings/clock/qcom,turingcc.txt    |   19 -
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |    2 +-
 drivers/clk/qcom/Kconfig                           |   51 +-
 drivers/clk/qcom/Makefile                          |    5 +-
 drivers/clk/qcom/a53-pll.c                         |    1 +
 drivers/clk/qcom/camcc-sm4450.c                    | 1688 +++++++++++++++
 drivers/clk/qcom/camcc-sm8150.c                    | 2159 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   86 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/clk-rpmh.c                        |    2 +
 drivers/clk/qcom/dispcc-sm4450.c                   |  770 +++++++
 drivers/clk/qcom/dispcc-sm8250.c                   |   12 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |  198 +-
 drivers/clk/qcom/dispcc-sm8650.c                   | 1796 ----------------
 drivers/clk/qcom/gcc-ipq5332.c                     |   36 +-
 drivers/clk/qcom/gcc-ipq6018.c                     |    2 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |    4 +-
 drivers/clk/qcom/gcc-ipq8074.c                     |    4 +-
 drivers/clk/qcom/gcc-mdm9615.c                     |    4 +-
 drivers/clk/qcom/gcc-msm8660.c                     |    4 +-
 drivers/clk/qcom/gcc-msm8960.c                     |    6 +-
 drivers/clk/qcom/gcc-msm8994.c                     |   54 +-
 drivers/clk/qcom/gcc-msm8996.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8998.c                     |   64 +-
 drivers/clk/qcom/gcc-sc8180x.c                     |  442 ++--
 drivers/clk/qcom/gcc-sm8250.c                      |    6 +-
 drivers/clk/qcom/gcc-sm8450.c                      |    4 +-
 drivers/clk/qcom/gpucc-sm4450.c                    |  805 ++++++++
 drivers/clk/qcom/lcc-ipq806x.c                     |    8 +-
 drivers/clk/qcom/lcc-msm8960.c                     |    8 +-
 drivers/clk/qcom/mmcc-apq8084.c                    |   50 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |   30 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |   52 +-
 drivers/clk/qcom/mmcc-msm8994.c                    |    8 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |    8 +-
 drivers/clk/qcom/videocc-sm8550.c                  |    4 +-
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |    5 +
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |    5 +
 include/dt-bindings/clock/qcom,sm4450-camcc.h      |  106 +
 include/dt-bindings/clock/qcom,sm4450-dispcc.h     |   51 +
 include/dt-bindings/clock/qcom,sm4450-gpucc.h      |   62 +
 include/dt-bindings/clock/qcom,sm8150-camcc.h      |  135 ++
 include/dt-bindings/clock/qcom,sm8650-dispcc.h     |  103 +-
 include/dt-bindings/interconnect/qcom,ipq5332.h    |   46 +
 54 files changed, 6843 insertions(+), 2380 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs404-turingcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
 create mode 100644 drivers/clk/qcom/camcc-sm4450.c
 create mode 100644 drivers/clk/qcom/camcc-sm8150.c
 create mode 100644 drivers/clk/qcom/dispcc-sm4450.c
 delete mode 100644 drivers/clk/qcom/dispcc-sm8650.c
 create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8150-camcc.h
 mode change 100644 => 120000 include/dt-bindings/clock/qcom,sm8650-dispcc.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq5332.h

