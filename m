Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525835F3949
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 00:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiJCWqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 18:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiJCWqG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 18:46:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9932F5A3DB;
        Mon,  3 Oct 2022 15:46:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E476E61209;
        Mon,  3 Oct 2022 22:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B90C433D6;
        Mon,  3 Oct 2022 22:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664837163;
        bh=peSrmHpf2GXRWRl5yVxhsQJ/OYfXzFXrMIsBwtA+O/g=;
        h=From:To:Cc:Subject:Date:From;
        b=lqSuQfLj92la/rl5AsYz7FOUs53UQbuRjAEaZLydPxLYyaWkCOpRQj0k8XFBinKlH
         BVxaJoj5TOHSH/fuIa2VVCYNOQyL45V2XwdMvm57OWUiCrR4EHnm6ZY963DiAFDB+s
         7B6H6UkoPq5ZaAbWlbKbHfrqP3F2dlVxLUowt4OwyqOFR1ijKrO65Pdsi6jWP34usG
         Z+k2/wRXL20U4FwnZThZ7Ju7REsssvsjfEtTmfJxGNud3hF1SoDafX+x+rvcOu6u/B
         EW44Ed9qWPzezFO9vQOas6Bssz3ShQiHB8dLjsCkUtjmWRchb57EqF/39dwwFW6kzg
         E55Pb6Acx15Vg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Robert Marko <robimarko@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Dang Huynh <danct12@riseup.net>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Li Zhengyu <lizhengyu3@huawei.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.1
Date:   Mon,  3 Oct 2022 17:46:00 -0500
Message-Id: <20221003224600.2327879-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.1

for you to fetch changes up to 994c77ed371e464ae4c1bfc316f7aff7309b2d59:

  clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of specifying num_parents (2022-09-29 11:42:12 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.1

This introduces display clock controllers are introduces for SM6115 and
SM8450, and SC8280XP gains a GPU clock controller.  MSM8909 and SM6375
gains global and SMD RPM clock controller drivers.

The handling of GDSCs with PWRSTS_RET was fixed, to keep the GDSC on
while powering down the parent supply. This solved retention issues
during suspend of USB on sc7180/7280 and SC8280XP.

SM6115 and QCM2260 are moved to reuse PLL configuration. SDM660 SDCC1
was moved to floor ops.

Support for the APCS PLLs for IPQ8064, IPQ8074 and IPQ6018 was
added/fixed. The MSM8996 CPU clocks was updated, with support for ACD
clocks added.

Support for SDM670 was added to the SDM845 Glbal clock controller and
the RPMh clock controller driver.

Transition to parent_data, parent_hws and use of ARRAY_SIZE() for
num_parents was done for MSM8660, MSM8916, MSM8939, MSM8960 global clock
controllers, IPQ8064 LPASS clock controller and MSM8960 multimedia clock
controller.

Support for per-reset defined delay of was introduced.

----------------------------------------------------------------
Adam Skladowski (3):
      dt-bindings: clock: add QCOM SM6115 display clock bindings
      clk: qcom: Add display clock controller driver for SM6115
      clk: qcom: gcc-sm6115: Override default Alpha PLL regs

Andrew Halaney (1):
      dt-bindings: clocks: qcom,gcc-sc8280xp: Fix typos

Bjorn Andersson (3):
      Merge branch '1662005846-4838-1-git-send-email-quic_c_skakit@quicinc.com' into clk-for-6.1
      dt-bindings: clock: Add Qualcomm SC8280XP GPU binding
      clk: qcom: Add SC8280XP GPU clock controller

Christian Marangi (5):
      dt-bindings: clock: add pcm reset for ipq806x lcc
      clk: qcom: lcc-ipq806x: add reset definition
      clk: qcom: lcc-ipq806x: convert to parent data
      clk: qcom: lcc-ipq806x: use ARRAY_SIZE for num_parents
      clk: qcom: clk-rcg2: add rcg2 mux ops

Dang Huynh (1):
      clk: qcom: sm6115: Select QCOM_GDSC

Dmitry Baryshkov (32):
      dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
      dt-bindings: clock: separate bindings for MSM8916 GCC device
      clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8916: move GPLL definitions up
      clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
      clk: qcom: gcc-msm8916: use parent_hws/_data instead of parent_names
      dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
      dt-bindings: clock: qcom,mmcc: define clocks/clock-names for MSM8996
      dt-bindings: clock: qcom,gcc-msm8660: separate GCC bindings for MSM8660
      clk: qcom: gcc-msm8660: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8660: use parent_hws/_data instead of parent_names
      clk: qcom: a53-pll: convert to use parent_data rather than parent_names
      dt-bindings: clocks: qcom,gcc-apq8064: define clocks/-names properties
      dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8960
      clk: qcom: gcc-msm8960: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8960: use parent_hws/_data instead of parent_names
      clk: qcom: lcc-msm8960: use macros to implement mi2s clocks
      clk: qcom: lcc-msm8960: use parent_hws/_data instead of parent_names
      clk: qcom: mmcc-msm8960: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: mmcc-msm8960: move clock parent tables down
      clk: qcom: mmcc-msm8960: use parent_hws/_data instead of parent_names
      clk: qcom: cpu-8996: switch to devm_clk_notifier_register
      clk: qcom: cpu-8996: declare ACD clocks
      clk: qcom: cpu-8996: move ACD logic to clk_cpu_8996_pmux_determine_rate
      clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
      clk: qcom: cpu-8996: use constant mask for pmux
      dt-bindings: clock: qcom: add bindings for dispcc on SM8450
      clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
      clk: qcom: Add support for Display Clock Controller on SM8450
      dt-bindings: clock: move qcom,gcc-msm8939 to qcom,gcc-msm8916.yaml
      clk: qcom: gcc-msm8939: use parent_hws where possible
      clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of specifying num_parents

Iskren Chernev (2):
      clk: qcom: gcc-sm6115: Move alpha pll bramo overrides
      clk: qcom: Merge alt alpha plls for qcm2260, sm6115

Johan Hovold (4):
      clk: gcc-sc8280xp: keep PCIe power-domains always-on
      clk: gcc-sc8280xp: keep USB power-domains always-on
      clk: qcom: gdsc: add missing error handling
      clk: qcom: gcc-sc8280xp: use retention for USB power domains

Konrad Dybcio (6):
      dt-bindings: clock: qcom,rpmcc: Add compatible for SM6375
      dt-bindings: clock: qcom: rpmcc: Add BIMC_FREQ_LOG
      clk: qcom: smd: Add SM6375 clocks
      clk: qcom: alpha: Add support for programming the PLL_FSM_LEGACY_MODE bit
      dt-bindings: clock: add SM6375 QCOM global clock bindings
      clk: qcom: Add global clock controller driver for SM6375

Krishna chaitanya chundru (1):
      clk: qcom: gcc-sc7280: Update the .pwrsts for PCIe GDSC

Krzysztof Kozlowski (1):
      dt-bindings: clock: qcom,a53pll: replace maintainer

Li Zhengyu (1):
      clk: qcom: clk-rpmh: Remove redundant if statement

Luca Weiss (1):
      clk: qcom: gcc-sm6350: Update the .pwrsts for usb gdscs

Marijn Suijten (1):
      clk: qcom: gcc-sdm660: Use floor ops for SDCC1 clock

Rajendra Nayak (3):
      clk: qcom: gdsc: Fix the handling of PWRSTS_RET support
      clk: qcom: gcc-sc7180: Update the .pwrsts for usb gdsc
      clk: qcom: gcc-sc7280: Update the .pwrsts for usb gdscs

Richard Acayan (5):
      dt-bindings: clock: gcc-sdm845: add sdm670 global clocks
      clk: qcom: gcc-sdm845: use device tree match data
      clk: qcom: gcc-sdm845: add sdm670 global clock data
      dt-bindings: clock: add rpmhcc bindings for sdm670
      clk: qcom: rpmhcc: add sdm670 clocks

Robert Marko (6):
      clk: qcom: apss-ipq6018: fix apcs_alias0_clk_src
      clk: qcom: apss-ipq6018: mark apcs_alias0_core_clk as critical
      dt-bindings: clock: qcom,a53pll: add IPQ8074 compatible
      clk: qcom: apss-ipq-pll: use OF match data for Alpha PLL config
      clk: qcom: apss-ipq-pll: update IPQ6018 Alpha PLL config
      clk: qcom: apss-ipq-pll: add support for IPQ8074

Satya Priya (1):
      clk: qcom: lpass: Fix lpass audiocc probe

Stephan Gerhold (6):
      dt-bindings: clock: Add schema for MSM8909 GCC
      clk: qcom: Add driver for MSM8909 GCC
      clk: qcom: reset: Allow specifying custom reset delay
      clk: qcom: gcc-msm8909: Increase delay for USB PHY reset
      dt-bindings: clock: qcom,rpmcc: Add MSM8909
      clk: qcom: smd-rpm: Add clocks for MSM8909

Taniya Das (5):
      dt-bindings: clock: Add "qcom,adsp-pil-mode" property
      dt-bindings: clock: Add resets for LPASS audio clock controller for SC7280
      dt-bindings: clock: Add support for external MCLKs for LPASS on SC7280
      clk: qcom: lpass: Handle the regmap overlap of lpasscc and lpass_aon
      clk: qcom: lpass: Add support for resets & external mclk for SC7280

Yassine Oudjana (6):
      clk: qcom: msm8996-cpu: Rename DIV_2_INDEX to SMUX_INDEX
      clk: qcom: msm8996-cpu: Statically define PLL dividers
      clk: qcom: msm8996-cpu: Unify cluster order
      clk: qcom: msm8996-cpu: Convert secondary muxes to clk_regmap_mux
      dt-bindings: clock: qcom,msm8996-apcc: Fix clocks
      clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks

 .../devicetree/bindings/clock/qcom,a53pll.yaml     |    3 +-
 .../bindings/clock/qcom,gcc-apq8064.yaml           |    9 +
 .../bindings/clock/qcom,gcc-msm8660.yaml           |   54 +
 .../bindings/clock/qcom,gcc-msm8909.yaml           |   58 +
 .../bindings/clock/qcom,gcc-msm8916.yaml           |   66 +
 .../bindings/clock/qcom,gcc-msm8976.yaml           |   21 +-
 .../bindings/clock/qcom,gcc-msm8994.yaml           |   21 +-
 .../bindings/clock/qcom,gcc-msm8996.yaml           |   25 +-
 .../bindings/clock/qcom,gcc-msm8998.yaml           |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |    7 -
 .../bindings/clock/qcom,gcc-qcm2290.yaml           |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |   21 +-
 .../bindings/clock/qcom,gcc-sc8180x.yaml           |   25 +-
 .../bindings/clock/qcom,gcc-sc8280xp.yaml          |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |   84 +-
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml  |   21 +-
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |   21 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6115.yaml |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6125.yaml |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   25 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |   21 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |   21 +-
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |  209 +-
 .../bindings/clock/qcom,msm8996-apcc.yaml          |   15 +-
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sc7280-lpasscc.yaml        |    6 +-
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |   26 +-
 .../bindings/clock/qcom,sm6115-dispcc.yaml         |   70 +
 .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |   52 +
 .../bindings/clock/qcom,sm8450-dispcc.yaml         |   98 +
 drivers/clk/qcom/Kconfig                           |   47 +-
 drivers/clk/qcom/Makefile                          |    5 +
 drivers/clk/qcom/a53-pll.c                         |    4 +-
 drivers/clk/qcom/apss-ipq-pll.c                    |   33 +-
 drivers/clk/qcom/apss-ipq6018.c                    |   15 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |   66 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    8 +-
 drivers/clk/qcom/clk-cpu-8996.c                    |  329 +-
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |    7 +
 drivers/clk/qcom/clk-rpmh.c                        |   25 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |   83 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |  608 +++
 drivers/clk/qcom/dispcc-sm8450.c                   | 1829 +++++++++
 drivers/clk/qcom/gcc-msm8660.c                     |  330 +-
 drivers/clk/qcom/gcc-msm8909.c                     | 2731 ++++++++++++++
 drivers/clk/qcom/gcc-msm8916.c                     | 1020 ++---
 drivers/clk/qcom/gcc-msm8939.c                     |  552 +--
 drivers/clk/qcom/gcc-msm8960.c                     |  436 ++-
 drivers/clk/qcom/gcc-qcm2290.c                     |   56 +-
 drivers/clk/qcom/gcc-sc7180.c                      |    2 +-
 drivers/clk/qcom/gcc-sc7280.c                      |    6 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |   20 +-
 drivers/clk/qcom/gcc-sdm660.c                      |    2 +-
 drivers/clk/qcom/gcc-sdm845.c                      |  400 +-
 drivers/clk/qcom/gcc-sm6115.c                      |   48 +-
 drivers/clk/qcom/gcc-sm6350.c                      |    2 +-
 drivers/clk/qcom/gcc-sm6375.c                      | 3931 ++++++++++++++++++++
 drivers/clk/qcom/gdsc.c                            |   35 +-
 drivers/clk/qcom/gdsc.h                            |    5 +
 drivers/clk/qcom/gpucc-sc8280xp.c                  |  461 +++
 drivers/clk/qcom/lcc-ipq806x.c                     |   84 +-
 drivers/clk/qcom/lcc-msm8960.c                     |  211 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |   66 +-
 drivers/clk/qcom/lpasscc-sc7280.c                  |   44 -
 drivers/clk/qcom/lpasscorecc-sc7280.c              |   33 +
 drivers/clk/qcom/mmcc-msm8960.c                    |  454 ++-
 drivers/clk/qcom/reset.c                           |    4 +-
 drivers/clk/qcom/reset.h                           |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8909.h       |  218 ++
 include/dt-bindings/clock/qcom,gcc-sdm845.h        |    1 +
 include/dt-bindings/clock/qcom,gpucc-sc8280xp.h    |   35 +
 include/dt-bindings/clock/qcom,lcc-ipq806x.h       |    2 +
 .../dt-bindings/clock/qcom,lpassaudiocc-sc7280.h   |    5 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7280.h    |    2 +
 include/dt-bindings/clock/qcom,rpmcc.h             |    1 +
 include/dt-bindings/clock/qcom,sm6115-dispcc.h     |   36 +
 include/dt-bindings/clock/qcom,sm6375-gcc.h        |  234 ++
 include/dt-bindings/clock/qcom,sm8450-dispcc.h     |  103 +
 include/linux/soc/qcom/smd-rpm.h                   |    1 +
 85 files changed, 13613 insertions(+), 2203 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm6115.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8450.c
 create mode 100644 drivers/clk/qcom/gcc-msm8909.c
 create mode 100644 drivers/clk/qcom/gcc-sm6375.c
 create mode 100644 drivers/clk/qcom/gpucc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8909.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc8280xp.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h
