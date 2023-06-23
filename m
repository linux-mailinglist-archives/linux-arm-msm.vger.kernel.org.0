Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6BE973C443
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 00:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjFWWqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 18:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbjFWWqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 18:46:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604572952;
        Fri, 23 Jun 2023 15:46:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0835611BC;
        Fri, 23 Jun 2023 22:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42F4C433C0;
        Fri, 23 Jun 2023 22:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687560366;
        bh=I9SupX6PCKpiWaYyiawIItBWUlhoRN9Q3Yy005+swl4=;
        h=From:To:Cc:Subject:Date:From;
        b=fFd64R1Y0YyqoWcZYl4RTpXKO3BPEM422lNNDdR1c5qoTKiC1LY6A6WPhO5ZVmkBW
         T5Xl9+4hA1oN2t0hA9bL6YGPOXYZPhyd7C13HYE6vZrXzdmrCq5XFkQmqr0F4X3U6s
         iRO4xpEtfDHaPU2mANLsRsN6jvpFaBSLs8HS31jiPHmBhTzuTra/wxu8uNIeyIegv7
         kcDPv/uXHgA8p9JWNdqlMf/3ov7xi9JyeC82kutBAZqbr5Xc4M7idPHyB6YH78rvQa
         jvhfdw5MCPVTruL5xVBvKX+5AeZyY0HOeBjgcmaQCrEJlQBYDlvIuXgI/ZNTD6dMqO
         udzwbBSNPeVsA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Robert Marko <robimarko@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Mantas Pucka <mantas@8devices.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.5
Date:   Fri, 23 Jun 2023 15:50:04 -0700
Message-ID: <20230623225004.568151-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.5

for you to fetch changes up to 2a541abd98370f9931c889c187eef7458720b57b:

  clk: qcom: gcc-sc8280xp: Add runtime PM (2023-06-20 16:31:04 -0700)

----------------------------------------------------------------
Qualcomm clock updates for v6.5

This introduces Global Clock Controller for SDX75, LPASS clock
controllers for SC8280XP, video clock controller for SM8350, SM8450 and
SM8550, GPU clock controller for SM8450 and SM8550, RPMH clock support
for SDX75 and IPQ9574 support in APSS IPQ PLL driver.

Support for branch2 clocks with inverted off-bit is introduced and a
couple of fixes to Alpha PLLs handling of TEST_CTL updates.

The handling of active-only clocks in SMD RPM is improved, to ensure
votes are appropriately placed.

SC7180 camera GDSCs are made children of the titan_top GDSC.

A couple of fixes to the display clocks on QCM2290 and shared RCGs in
GCC are marked as such.

SDCC clocks for IPQ6018 and IPQ5332 are corrected to use floor ops, and
network-related resets on IPQ6018 are updated to cover all bits of each
reset.

Crypto clocks are added to IPQ9574 global clock controller, together
with a few cleanups.

Runtime PM is enabeld for SC8280XP GCC and GPUCC, and SM6375 GPUCC.

A few fixes for MSM8974 multi-media clock controller.

Support for some RCG clocks to be automatically controlled by downstream
branches, and added to SM8450 GCC clocks.

Further Kconfig depdenencies are introduce to avoid building Qualcomm
clock drivers on unrelated architectures.

Lastly, related DeviceTree binding updates are made.

----------------------------------------------------------------
Anusha Rao (2):
      dt-bindings: clock: Add crypto clock and reset definitions
      clk: qcom: gcc-ipq9574: Enable crypto clocks

Arnd Bergmann (1):
      clk: qcom: gcc-ipq6018: remove duplicate initializers

Bjorn Andersson (6):
      dt-bindings: clock: qcom: Accept power-domains for GPUCC
      Merge branch '20230413-topic-lahaina_vidcc-v4-1-86c714a66a81@linaro.org' into HEAD
      Merge branch '20230524140656.7076-2-quic_tdas@quicinc.com' into HEAD
      Merge branch '20230512122347.1219-3-quic_tdas@quicinc.com' into clk-for-6.5
      Merge branch 'sm8450-sm8550-gpucc-binding' into clk-for-6.5
      Merge branch '20230526161129.1454-2-quic_anusha@quicinc.com' into clk-for-6.5

Christian Marangi (2):
      clk: qcom: gcc-ipq6018: drop redundant F define
      clk: qcom: gcc-sdm660: drop redundant F define

Devi Priya (5):
      dt-bindings: clock: qcom,ipq9574-gcc: Add maintainer
      clk: qcom: gcc-ipq9574: Clean up included headers
      clk: qcom: gcc-ipq9574: constify struct clk_init_data
      dt-bindings: clock: qcom,a53pll: add IPQ9574 compatible
      clk: qcom: apss-ipq-pll: Add support for IPQ9574

Dmitry Baryshkov (3):
      clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
      clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
      clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags

Imran Shaik (5):
      dt-bindings: clock: qcom: Add GCC clocks for SDX75
      clk: qcom: branch: Extend the invert logic for branch2 clocks
      dt-bindings: clock: qcom: Add RPMHCC for SDX75
      clk: qcom: rpmh: Add RPMH clocks support for SDX75
      clk: qcom: Add GCC driver support for SDX75

Jagadeesh Kona (5):
      clk: qcom: clk-alpha-pll: Add support to configure PLL_TEST_CTL_U2
      dt-bindings: clock: qcom: Add SM8550 video clock controller
      clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550
      dt-bindings: clock: qcom: Add SM8550 graphics clock controller
      clk: qcom: gpucc-sm8550: Add support for graphics clock controller

Kathiravan T (3):
      clk: qcom: gcc: ipq5332: Use floor ops for SDCC clocks
      clk: qcom: ipq5332: fix the src parameter in ftbl_gcc_apss_axi_clk_src
      clk: qcom: ipq5332: fix the order of SLEEP_CLK and XO clock

Konrad Dybcio (19):
      clk: qcom: smd-rpm: Keep one rpm handle for all clocks
      clk: qcom: smd-rpm_ Make __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
      clk: qcom: smd-rpm: Make DEFINE_CLK_SMD_RPM_BRANCH_A accept flags
      clk: qcom: smd-rpm: Make BI_TCXO_AO critical
      dt-bindings: clock: Add SM8350 VIDEOCC
      clk: qcom: Introduce SM8350 VIDEOCC
      clk: qcom: gcc-qcm2290: Mark RCGs shared where applicable
      clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
      clk: qcom: dispcc-qcm2290: Fix GPLL0_OUT_DIV handling
      dt-bindings: clock: Add Qcom SM8450 GPUCC
      clk: qcom: rcg2: Make hw_clk_ctrl toggleable
      clk: qcom: gcc-sm8450: Enable hw_clk_ctrl
      clk: qcom: Add support for SM8450 GPUCC
      clk: qcom: clk-alpha-pll: Add a way to update some bits of test_ctl(_hi)
      clk: qcom: gcc-sm6115: Add missing PLL config properties
      dt-bindings: clock: sm6375-gpucc: Add VDD_GX
      clk: qcom: gpucc-sm6375: Enable runtime pm
      clk: qcom: gpucc-sc8280xp: Add runtime PM
      clk: qcom: gcc-sc8280xp: Add runtime PM

Krzysztof Kozlowski (5):
      dt-bindings: clock: qcom,gcc-msm8953: split to separate schema
      clk: qcom: restrict drivers per ARM/ARM64
      dt-bindings: clock: qcom,gcc-sm8250: add missing bi_tcxo_ao clock
      dt-bindings: clock: qcom,gcc-sc7180: document CX power domain
      dt-bindings: clock: qcom,gcc-sc7280: document CX power domain

Luca Weiss (2):
      clk: qcom: smd-rpm: conditionally enable scaling before doing handover
      dt-bindings: clock: qcom,mmcc: define clocks/clock-names for MSM8226

Mantas Pucka (1):
      clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks

Robert Marko (2):
      clk: qcom: gcc-ipq6018: update UBI32 PLL
      clk: qcom: ipq6018: fix networking resets

Srinivas Kandagatla (2):
      clk: qcom: Add lpass clock controller driver for SC8280XP
      clk: qcom: Add lpass audio clock controller driver for SC8280XP

Taniya Das (3):
      clk: qcom: camcc-sc7180: Add parent dependency to all camera GDSCs
      dt-bindings: clock: qcom: Add SM8450 video clock controller
      clk: qcom: videocc-sm8450: Add video clock controller driver for SM8450

 .../devicetree/bindings/clock/qcom,a53pll.yaml     |    1 +
 .../bindings/clock/qcom,gcc-msm8953.yaml           |   73 +
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |    1 -
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    5 +-
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    3 +
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |   32 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |   65 +
 .../bindings/clock/qcom,sm6375-gpucc.yaml          |   15 +
 .../bindings/clock/qcom,sm8350-videocc.yaml        |   68 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   75 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   79 +
 drivers/clk/qcom/Kconfig                           |  132 +
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/apss-ipq-pll.c                    |   19 +
 drivers/clk/qcom/camcc-sc7180.c                    |   19 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |   21 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    3 +
 drivers/clk/qcom/clk-branch.c                      |    6 +-
 drivers/clk/qcom/clk-rcg.h                         |    2 +
 drivers/clk/qcom/clk-rcg2.c                        |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   19 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   58 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |   12 +-
 drivers/clk/qcom/gcc-ipq5332.c                     |    6 +-
 drivers/clk/qcom/gcc-ipq6018.c                     |   45 +-
 drivers/clk/qcom/gcc-ipq9574.c                     |  506 ++--
 drivers/clk/qcom/gcc-qcm2290.c                     |   62 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |   18 +-
 drivers/clk/qcom/gcc-sdm660.c                      |    2 -
 drivers/clk/qcom/gcc-sdx75.c                       | 2970 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sm6115.c                      |    8 +
 drivers/clk/qcom/gcc-sm8450.c                      |   39 +
 drivers/clk/qcom/gpucc-sc8280xp.c                  |   19 +-
 drivers/clk/qcom/gpucc-sm6375.c                    |   19 +-
 drivers/clk/qcom/gpucc-sm8450.c                    |  766 +++++
 drivers/clk/qcom/gpucc-sm8550.c                    |  611 ++++
 drivers/clk/qcom/lpasscc-sc8280xp.c                |   87 +
 drivers/clk/qcom/mmcc-msm8974.c                    |   23 +-
 drivers/clk/qcom/videocc-sm8350.c                  |  552 ++++
 drivers/clk/qcom/videocc-sm8450.c                  |  463 +++
 drivers/clk/qcom/videocc-sm8550.c                  |  470 ++++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |    4 +
 include/dt-bindings/clock/qcom,sdx75-gcc.h         |  193 ++
 include/dt-bindings/clock/qcom,sm8350-videocc.h    |   35 +
 include/dt-bindings/clock/qcom,sm8450-gpucc.h      |   48 +
 include/dt-bindings/clock/qcom,sm8450-videocc.h    |   38 +
 include/dt-bindings/clock/qcom,sm8550-gpucc.h      |   48 +
 include/dt-bindings/reset/qcom,ipq9574-gcc.h       |    1 +
 include/dt-bindings/reset/qcom,sm8350-videocc.h    |   18 +
 include/dt-bindings/reset/qcom,sm8450-gpucc.h      |   20 +
 54 files changed, 7455 insertions(+), 349 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx75.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8450.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8550.c
 create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c
 create mode 100644 drivers/clk/qcom/videocc-sm8350.c
 create mode 100644 drivers/clk/qcom/videocc-sm8450.c
 create mode 100644 drivers/clk/qcom/videocc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sdx75-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8350-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-gpucc.h
 create mode 100644 include/dt-bindings/reset/qcom,sm8350-videocc.h
 create mode 100644 include/dt-bindings/reset/qcom,sm8450-gpucc.h
