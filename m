Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85CEB784AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 22:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjHVUGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 16:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjHVUGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 16:06:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC7ECE6;
        Tue, 22 Aug 2023 13:06:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E2F863A04;
        Tue, 22 Aug 2023 20:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4E7C433C8;
        Tue, 22 Aug 2023 20:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692734762;
        bh=HNt86ercsBckFAXCTvHFvCtIZAnLSaWdxafY91fWiFE=;
        h=From:To:Cc:Subject:Date:From;
        b=lmJASnSsEBDNLMTVuWyk7yqh/86qNUb0Q0Sm59dteTNdyXEoWgmQWPIAQhj5f4dpT
         rMb4jh5rA5c8ndxFwohv4tLMzOXJ9qLoN16IRYedMFB1tkX3d7hBntiivEvACAYoho
         RHT0PbbJOEq+QOE28buhPP5k8sUsCFBzyayij00BANfCmCa4HqW+iT0neZaOROeqC5
         TNEvkHBDKIFQ9gCqmL7CcdyjTK2EFBNDO6TuJg2ANxr6Oi9v0DXUre/zWw6wdVB28n
         NDz5bmyjtWKMG5+lE9kvV8XvaIVrkrxR8TjRrhoW+Ef4gAwyItaJTGzmpGNuBkK7Nv
         R7ZtGBoXiV2TA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Robert Marko <robert.marko@sartura.hr>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Patrick Whewell <patrick.whewell@sightlineapplications.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.6
Date:   Tue, 22 Aug 2023 13:08:34 -0700
Message-ID: <20230822200837.2734347-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.6

for you to fetch changes up to e1cd74b6dccb98ca09e4612ff29c7658db7a487b:

  clk: qcom: smd-rpm: Set XO rate and CLK_IS_CRITICAL on PCNoC (2023-08-17 20:09:11 -0700)

----------------------------------------------------------------
Qualcomm clock updates for v6.6

Support for the Global Clock Controller in IPQ5018 is added.

The SMD RPM driver is cleaned up, with interconnect bus clocks moved out
to the interconnect drivers. Due to being tangled with the related
interconnect updates, the topic branch with interconnect patches was
merged in as well.
Various bugs in PM runtime integration is fixes across many platforms.

The MSM8996 core bus framework gains support for MSM8996 Pro.

MDM9615 is transitioned to parent_hw and parent_data, with related
cleanups. With this the cxo proxy clock is dropped from the driver.  And
LCC support for MDM9615 is merged into the MSM8960 driver, to avoid
duplication.

Network-related resets are added on IPQ4019

A couple of missing USB-related clocks are added for IPQ9574.

The missing gpll0_sleep_clk_src is added to MSM8917 global clock
controller.

A few minor fixes for MSM8998 global clock controller.

In the QDU1000 global clock controller GDSCs, clkrefs, and GPLL1 are
added, while PCIe pipe clock, SDCC rcg ops are corrected.

Missing GDSCs are added to SC8280XP global clock controller driver,
flags for existing GDSCs are corrected, by enabling retention and
dropping the always-on flags. Retention is also enabled for the display
clock controller GDSCs.

SDCC apps_clk_src is marked CLK_OPS_PARENT_ENABLE to fix issues with
missing parent clocks across sc7180, sm7150, sm6350 and sm8250, while
sm8450 is corrected to use floor ops.

SM6350 GPU clock controller clock supplies are corrected.

Unwanted clocks from the IPQ5332 GCC are dropped.

The missing OXILICX GDSC is added to MSM8226 GCC.

The delay in the reset controller is transitioned to fsleep() to invoke
the appropriate sleep method depending on duration.

The SM83550 Video clock controller is extended to support SC8280XP.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: qcom: fix some Kconfig corner cases

Bjorn Andersson (5):
      Merge branch 'd1c5aa4a8535c645fdb06df62a562918516ba0c6.1686289721.git.quic_varada@quicinc.com' into clk-for-6.6
      Merge branch '20230620-topic-sc8280_gccgdsc-v2-2-562c1428c10d@linaro.org' into clk-for-6.6
      Merge branch '20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org' into clk-for-6.6
      Merge branch '1690533192-22220-2-git-send-email-quic_srichara@quicinc.com' into clk-for-6.6
      Merge branch '20230622-topic-8998clk-v2-1-6222fbc2916b@linaro.org' into clk-for-6.6

Danila Tikhonov (1):
      clk: qcom: gcc-sm7150: Add CLK_OPS_PARENT_ENABLE to sdcc2 rcg

David Wronek (1):
      clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src

Dmitry Baryshkov (8):
      dt-bindings: clock: qcom,lcc.yaml: describe clocks for lcc,qcom-mdm9615
      dt-bindings: clock: drop qcom,lcc-mdm9615 header file
      dt-bindings: clock: provide separate bindings for qcom,gcc-mdm9615
      clk: qcom: gcc-mdm9615: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: drop lcc-mdm9615 in favour of lcc-msm8960
      clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
      clk: qcom: gcc-mdm9615: use parent_hws/_data instead of parent_names
      clk: qcom: gcc-mdm9615: drop the cxo clock

Imran Shaik (8):
      dt-bindings: clock: Update GCC clocks for QDU1000 and QRU1000 SoCs
      clk: qcom: gcc-qdu1000: Fix gcc_pcie_0_pipe_clk_src clock handling
      clk: qcom: gcc-qdu1000: Fix clkref clocks handling
      clk: qcom: gcc-qdu1000: Register gcc_gpll1_out_even clock
      clk: qcom: gcc-qdu1000: Add gcc_ddrss_ecpri_gsi_clk support
      clk: qcom: gcc-qdu1000: Add support for GDSCs
      clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops
      clk: qcom: gcc-qdu1000: Update the RCGs ops

Johan Hovold (8):
      clk: qcom: camcc-sc7180: fix async resume during probe
      clk: qcom: dispcc-sm8450: fix runtime PM imbalance on probe errors
      clk: qcom: dispcc-sm8550: fix runtime PM imbalance on probe errors
      clk: qcom: gcc-sc8280xp: fix runtime PM imbalance on probe errors
      clk: qcom: lpasscc-sc7280: fix missing resume during probe
      clk: qcom: q6sstop-qcs404: fix missing resume during probe
      clk: qcom: mss-sc7180: fix missing resume during probe
      clk: qcom: turingcc-qcs404: fix missing resume during probe

Kathiravan T (2):
      clk: qcom: ipq5332: drop the mem noc clocks
      clk: qcom: ipq5332: drop the gcc_apss_axi_clk_src clock

Konrad Dybcio (39):
      clk: qcom: gpucc-sm6350: Introduce index-based clk lookup
      clk: qcom: gpucc-sm6350: Fix clock source names
      dt-bindings: clock: qcom,gcc-sc8280xp: Add missing GDSCs
      clk: qcom: gcc-sc8280xp: Add missing GDSC flags
      clk: qcom: gcc-sc8280xp: Add missing GDSCs
      dt-bindings: interconnect: Add Qcom RPM ICC bindings
      soc: qcom: smd-rpm: Add QCOM_SMD_RPM_STATE_NUM
      soc: qcom: smd-rpm: Use tabs for defines
      clk: qcom: smd-rpm: Move some RPM resources to the common header
      interconnect: qcom: icc-rpm: Introduce keep_alive
      interconnect: qcom: Add missing headers in icc-rpm.h
      interconnect: qcom: Fold smd-rpm.h into icc-rpm.h
      interconnect: qcom: smd-rpm: Add rpmcc handling skeleton code
      interconnect: qcom: Define RPM bus clocks
      interconnect: qcom: sdm660: Hook up RPM bus clk definitions
      interconnect: qcom: msm8996: Hook up RPM bus clk definitions
      interconnect: qcom: qcs404: Hook up RPM bus clk definitions
      interconnect: qcom: msm8939: Hook up RPM bus clk definitions
      interconnect: qcom: msm8916: Hook up RPM bus clk definitions
      interconnect: qcom: qcm2290: Hook up RPM bus clk definitions
      interconnect: qcom: icc-rpm: Control bus rpmcc from icc
      clk: qcom: smd-rpm: Separate out interconnect bus clocks
      interconnect: qcom: icc-rpm: Fix bucket number
      interconnect: qcom: icc-rpm: Set bandwidth on both contexts
      interconnect: qcom: icc-rpm: Set correct bandwidth through RPM bw req
      interconnect: qcom: icc-rpm: Fix bandwidth calculations
      clk: qcom: dispcc-sc8280xp: Use ret registers on GDSCs
      dt-bindings: clock: qcom,sm8350-videocc: Add SC8280XP
      clk: qcom: videocc-sm8350: Add SC8280XP support
      clk: qcom: reset: Use the correct type of sleep/delay based on length
      dt-bindings: clk: qcom,gcc-msm8998: Add missing GPU/MMSS GPLL0 legs
      dt-bindings: clock: qcom,mmcc: Add GPLL0_DIV for MSM8998
      clk: qcom: gcc-msm8998: Control MMSS and GPUSS GPLL0 outputs properly
      clk: qcom: mmcc-msm8998: Properly consume GPLL0 inputs
      clk: qcom: gpucc-msm8998: Use the correct GPLL0 leg with old DTs
      clk: qcom: gcc-msm8998: Don't check halt bit on some branch clks
      clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs
      clk: qcom: smd-rpm: Add a way to define bus clocks with rate and flags
      clk: qcom: smd-rpm: Set XO rate and CLK_IS_CRITICAL on PCNoC

Luca Weiss (2):
      clk: qcom: mmcc-msm8974: Add OXILICX_GDSC for msm8226
      clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_src

Manivannan Sadhasivam (1):
      clk: qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter retention state

Otto Pflüger (2):
      dt-bindings: clock: gcc-msm8917: Add definition for GPLL0_SLEEP_CLK_SRC
      clk: qcom: gcc-msm8917: Enable GPLL0_SLEEP_CLK_SRC

Patrick Whewell (1):
      clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src

Robert Marko (2):
      dt-bindings: clock: qcom: ipq4019: add missing networking resets
      clk: qcom: gcc-ipq4019: add missing networking resets

Sricharan Ramabadhran (2):
      dt-bindings: clock: Add IPQ5018 clock and reset
      clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018

Stephan Gerhold (1):
      soc: qcom: smd-rpm: Move icc_smd_rpm registration to clk-smd-rpm

Taniya Das (1):
      dt-bindings: clock: qcom: Update my email address

Varadarajan Narayanan (2):
      dt-bindings: clock: Add USB related clocks for IPQ9574
      clk: qcom: gcc-ipq9574: Add USB related clocks

Yang Yingliang (2):
      clk: qcom: lcc-msm8960: change pxo_parent_data to static
      clk: qcom: gcc-ipq5018: change some variable static

Yassine Oudjana (2):
      dt-bindings: clock: qcom,msm8996-cbf: Add compatible for MSM8996 Pro
      clk: qcom: cbf-msm8996: Add support for MSM8996 Pro

 .../bindings/clock/qcom,gcc-apq8064.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-ipq4019.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-ipq8074.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-msm8976.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-msm8996.yaml           |    2 +-
 .../bindings/clock/qcom,gcc-msm8998.yaml           |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |    5 +-
 .../devicetree/bindings/clock/qcom,gcc-qcs404.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    2 +-
 .../devicetree/bindings/clock/qcom,gcc.yaml        |    2 +-
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    2 +-
 .../bindings/clock/qcom,ipq5018-gcc.yaml           |   63 +
 .../devicetree/bindings/clock/qcom,lcc.yaml        |   34 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |    4 +-
 .../bindings/clock/qcom,msm8996-cbf.yaml           |    4 +-
 .../bindings/clock/qcom,msm8998-gpucc.yaml         |    2 +-
 .../bindings/clock/qcom,qdu1000-gcc.yaml           |    3 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +-
 .../bindings/clock/qcom,sc7180-camcc.yaml          |    2 +-
 .../bindings/clock/qcom,sc7180-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    |    2 +-
 .../devicetree/bindings/clock/qcom,sc7180-mss.yaml |    2 +-
 .../bindings/clock/qcom,sc7280-camcc.yaml          |    2 +-
 .../bindings/clock/qcom,sc7280-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sc7280-lpasscc.yaml        |    2 +-
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |    2 +-
 .../bindings/clock/qcom,sdm845-dispcc.yaml         |    2 +-
 .../bindings/clock/qcom,sm8350-videocc.yaml        |    4 +-
 .../devicetree/bindings/clock/qcom,videocc.yaml    |    2 +-
 drivers/clk/qcom/Kconfig                           |   27 +-
 drivers/clk/qcom/Makefile                          |    2 +-
 drivers/clk/qcom/camcc-sc7180.c                    |    2 +-
 drivers/clk/qcom/clk-cbf-8996.c                    |   10 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |  339 +-
 drivers/clk/qcom/dispcc-sc8280xp.c                 |    8 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |   13 +-
 drivers/clk/qcom/gcc-ipq4019.c                     |    6 +
 drivers/clk/qcom/gcc-ipq5018.c                     | 3724 ++++++++++++++++++++
 drivers/clk/qcom/gcc-ipq5332.c                     |  206 +-
 drivers/clk/qcom/gcc-ipq9574.c                     |   37 +
 drivers/clk/qcom/gcc-mdm9615.c                     |  261 +-
 drivers/clk/qcom/gcc-msm8917.c                     |    3 +-
 drivers/clk/qcom/gcc-msm8998.c                     |   64 +-
 drivers/clk/qcom/gcc-qdu1000.c                     |  159 +-
 drivers/clk/qcom/gcc-sc7180.c                      |    1 +
 drivers/clk/qcom/gcc-sc8280xp.c                    |  145 +-
 drivers/clk/qcom/gcc-sm6350.c                      |    1 +
 drivers/clk/qcom/gcc-sm7150.c                      |    1 +
 drivers/clk/qcom/gcc-sm8250.c                      |    1 +
 drivers/clk/qcom/gcc-sm8450.c                      |    4 +-
 drivers/clk/qcom/gpucc-msm8998.c                   |    2 +-
 drivers/clk/qcom/gpucc-sm6350.c                    |   18 +-
 drivers/clk/qcom/lcc-mdm9615.c                     |  572 ---
 drivers/clk/qcom/lcc-msm8960.c                     |   19 +-
 drivers/clk/qcom/lpasscc-sc7280.c                  |   16 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |   11 +
 drivers/clk/qcom/mmcc-msm8998.c                    |   35 +-
 drivers/clk/qcom/mss-sc7180.c                      |   13 +-
 drivers/clk/qcom/q6sstop-qcs404.c                  |   15 +-
 drivers/clk/qcom/reset.c                           |    3 +-
 drivers/clk/qcom/turingcc-qcs404.c                 |   13 +-
 drivers/clk/qcom/videocc-sm8350.c                  |   42 +-
 drivers/interconnect/qcom/Makefile                 |    2 +-
 drivers/interconnect/qcom/icc-rpm-clocks.c         |   77 +
 drivers/interconnect/qcom/icc-rpm.c                |  220 +-
 drivers/interconnect/qcom/icc-rpm.h                |   56 +-
 drivers/interconnect/qcom/msm8916.c                |    5 +-
 drivers/interconnect/qcom/msm8939.c                |    6 +-
 drivers/interconnect/qcom/msm8974.c                |    2 +-
 drivers/interconnect/qcom/msm8996.c                |   10 +-
 drivers/interconnect/qcom/qcm2290.c                |    8 +-
 drivers/interconnect/qcom/qcs404.c                 |    5 +-
 drivers/interconnect/qcom/sdm660.c                 |    8 +-
 drivers/interconnect/qcom/smd-rpm.c                |   23 +-
 drivers/interconnect/qcom/smd-rpm.h                |   15 -
 drivers/soc/qcom/smd-rpm.c                         |   17 +-
 include/dt-bindings/clock/qcom,gcc-ipq4019.h       |    6 +
 include/dt-bindings/clock/qcom,gcc-ipq5018.h       |  183 +
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |    3 +
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h      |   10 +
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |    2 +
 include/dt-bindings/clock/qcom,lcc-mdm9615.h       |   44 -
 include/dt-bindings/clock/qcom,qdu1000-gcc.h       |    4 +-
 include/dt-bindings/interconnect/qcom,rpm-icc.h    |   13 +
 include/dt-bindings/reset/qcom,gcc-ipq5018.h       |  122 +
 include/linux/soc/qcom/smd-rpm.h                   |   20 +-
 92 files changed, 5381 insertions(+), 1436 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-ipq5018.c
 delete mode 100644 drivers/clk/qcom/lcc-mdm9615.c
 create mode 100644 drivers/interconnect/qcom/icc-rpm-clocks.c
 delete mode 100644 drivers/interconnect/qcom/smd-rpm.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq5018.h
 delete mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h
 create mode 100644 include/dt-bindings/interconnect/qcom,rpm-icc.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq5018.h
