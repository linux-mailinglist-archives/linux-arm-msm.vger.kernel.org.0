Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4978969F7C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 16:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbjBVP3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 10:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbjBVP3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 10:29:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEB114E8D;
        Wed, 22 Feb 2023 07:29:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 740AE6148E;
        Wed, 22 Feb 2023 15:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4DFC433EF;
        Wed, 22 Feb 2023 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677079765;
        bh=QkS2IFs4v9LzphvFwgJpvt7kQg2zNYrtfDEkZ1oQL7E=;
        h=From:To:Cc:Subject:Date:From;
        b=beZFNrKxzJy7vd6WhBjgqIdcj2klCgz0WoGBrrxI8Q2VuKIQ8rKvHWaal80L2vGMW
         bcPhVKha9hHIUR82x8gsfTaZmabzVvs1eF0V9eJxkbLUi0WLWvR/d9SpDomsUXfDYy
         82iwql+n0Bjj8Ai4gX0LVeTnQIf/zFsUJWec3xaOURd4r9HzqT8C/A5VDlPQ4N+SeN
         +3YPf4bzrergI1kdLNixD3Y5gvUVqn9RLSDTkOQmqc7FhHN6fpw1wYOmdwuWLRGvtw
         PLP953WOQMmhwUB+yXaCUBP5KKO1ebrpXpDSQnyo7ofvwdn7KV4syPK4yQzf/GnjPW
         gO9UubXEBwbtQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>
Subject: [GIT PULL] Qualcomm clock driver updates for v6.3
Date:   Wed, 22 Feb 2023 07:32:53 -0800
Message-Id: <20230222153253.3105863-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.3-2

for you to fetch changes up to c1855dd0a62b7ead360eb9231fb65c2108efaf47:

  clk: qcom: Revert sync_state based clk_disable_unused (2023-02-22 06:34:08 -0800)

----------------------------------------------------------------
Qualcomm clock driver updates for v6.3

Support for requesting the next power_off operation for a genpd to be
synchronous is introduced, and implemented in the GDSC driver. To allow
the GPU driver to request power_off to wait for the GDSC to actually
collapse.

Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
clock controller, SM8550 TCSR and display clock controller, SM6350 clock
controller, nd MSM8996 CBF and APCS clock controllers is introduced..

Parent references are updated across a large number of clock drivers, to
align with the design changes since those drivers where introduced.
Similarly, test clocks has been dropped from a range of drivers.

A range of fixes for the MSM8996 CPU clock controller is introduced.

MSM8974 GCC is transitioned off the externally defined sleep_clk.

GDSC in the global clock controller for QCS404 is added, and various
parent definitions are cleaned up.

The SDCC core clocks on SM6115 are moved for floor_ops.

Programming of clk_dis_wait for GPU CX GDSC on SC7180 and SDM845 are
moved to use the recently introduced properties in the GDSC struct.

The RPMh clock driver gains SM8550 and SA8775P clocks, and the IPA clock
is added on a variety of platforms.

The SMD RPM driver receives a big cleanup, in particular a move away
from duplicating declaration of identical clocks between multiple
platforms.
A few missing clocks across msm8998, msm8992, msm8916, qcs404 are added
as well.

Using devm_pm_runtime_enable() to clean up some duplication is done
across SM8250 display and video clock controllers, SM8450 display clock
controller and SC7280 LPASS clock controller.

Devicetree binding changes for above mentioned additions and changes are
introduced.

Support for postponing clk_disable_unused() until sync_state was
introduced, but later reverted again, awaiting an agreement on the
solution.

Lastly, a change to pad a few registers in the SM8250 DTS to 8 digits
was picked up in the wrong tree and kept here, to avoid rebasing.

----------------------------------------------------------------
Abel Vesa (7):
      dt-bindings: clock: Add SM8550 TCSR CC clocks
      dt-bindings: clock: Add RPMHCC for SM8550
      clk: qcom: rpmh: Add support for SM8550 rpmh clocks
      clk: qcom: Add TCSR clock driver for SM8550
      clk: Add generic sync_state callback for disabling unused clocks
      clk: qcom: sdm845: Use generic clk_sync_state_disable_unused callback
      dt-bindings: clock: Add SM8550 TCSR CC clocks

Akhil P Oommen (1):
      clk: qcom: gdsc: Support 'synced_poweroff' genpd flag

Arnd Bergmann (2):
      clk: qcom: rpmh: remove duplicate IPA clock reference
      clk: qcom: gcc-qcs404: fix duplicate initializer warning

Bartosz Golaszewski (5):
      dt-bindings: clock: qcom-rpmhcc: document the clock for sa8775p
      clk: qcom: rpmh: add clocks for sa8775p
      dt-bindings: clock: Add Qualcomm SA8775P GCC
      clk: qcom: gcc-sa8775p: remove unused variables
      dt-bindings: clock: qcom,sa8775p-gcc: add the power-domains property

Bjorn Andersson (6):
      Merge tag '1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com' into clk-for-6.3
      Merge branch '20230104093450.3150578-2-abel.vesa@linaro.org' into clk-for-6.3
      clk: qcom: Remove need for clk_ignore_unused on sc8280xp
      Merge branch '20230103-topic-sm8550-upstream-dispcc-v3-1-8a03d348c572@linaro.org' into clk-for-6.3
      Merge branch '20230112204446.30236-2-quic_molvera@quicinc.com' into HEAD
      clk: qcom: Revert sync_state based clk_disable_unused

Bryan O'Donoghue (1):
      clk: qcom: smd-rpm: msm8936: Add PMIC gated RPM_SMD_XO_*

Dmitry Baryshkov (100):
      dt-bindings: clock: qcom: gcc-qcs404: add two GDSC entries
      dt-bindings: clock: qcom: gcc-qcs404: switch to gcc.yaml
      dt-bindings: clock: qcom: gcc-qcs404: define clocks/clock-names for QCS404
      clk: qcom: gcc-qcs404: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
      clk: qcom: gcc-qcs404: fix names of the DSI clocks used as parents
      clk: qcom: gcc-qcs404: fix the name of the HDMI PLL clock
      clk: qcom: gcc-qcs404: get rid of the test clock
      clk: qcom: gcc-qcs404: move PLL clocks up
      clk: qcom: gcc-qcs404: use parent_hws/_data instead of parent_names
      clk: qcom: gcc-qcs404: sort out the cxo clock
      clk: qcom: gcc-qcs404: add support for GDSCs
      dt-bindings: clocks: qcom: rpmcc: add LN_BB_CLK_PIN clocks
      clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
      clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
      clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290 clocks
      clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
      clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
      clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
      clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125 clocks
      clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL clock
      clk: qcom: smd-rpm: drop the rpm_status_id field
      clk: qcom: smd-rpm: fix alignment of line breaking backslashes
      clk: qcom: smd-rpm: move clock definitions together
      clk: qcom: smd-rpm: rename some msm8974 active-only clocks
      clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
      clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
      clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
      clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
      clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
      clk: qcom: smd-rpm: remove usage of platform name
      clk: qcom: dispcc-sm8450: switch to parent_hws
      clk: qcom: dispcc-sc7180: switch to parent_hws
      clk: qcom: dispcc-sm6375: switch to parent_hws
      clk: qcom: camcc-sc7280: switch to parent_hws
      clk: qcom: camcc-sm8450: switch to parent_hws
      clk: qcom: gcc-msm8939: switch to parent_hws
      clk: qcom: gcc-msm8976: switch to parent_hws
      clk: qcom: gcc-sc7180: switch to parent_hws
      clk: qcom: gcc-sc7280: switch to parent_hws
      clk: qcom: gcc-sdx65: switch to parent_hws
      clk: qcom: gcc-sm6375: switch to parent_hws
      clk: qcom: gcc-sm8250: switch to parent_hws
      clk: qcom: gcc-sm8450: switch to parent_hws
      clk: qcom: gcc-sm8550: switch to parent_hws
      clk: qcom: gpucc-msm8998: switch to parent_hws
      clk: qcom: gpucc-sc7180: switch to parent_hws
      clk: qcom: lpasscc-sc7180: switch to parent_hws
      clk: qcom: dispcc-sm8250: switch to devm_pm_runtime_enable
      clk: qcom: dispcc-sm8450: switch to devm_pm_runtime_enable
      clk: qcom: lpasscc-sc7280: switch to devm_pm_runtime_enable
      clk: qcom: videocc-sm8250: switch to devm_pm_runtime_enable
      clk: qcom: dispcc-sm6115: use parent_hws for disp_cc_mdss_rot_clk
      clk: qcom: gcc-sm6375: use parent_hws for gcc_disp_gpll0_div_clk_src
      clk: qcom: clk-spmi-pmic-div: convert to use parent_data
      dt-bindings: clock: qcom,gcc-msm8998: drop core_bi_pll_test_se
      dt-bindings: clock: qcom,gcc-sdx55: drop core_bi_pll_test_se
      dt-bindings: clock: qcom,gcc-sdx65: drop core_bi_pll_test_se
      dt-bindings: clock: qcom,mmcc-msm8998: drop core_bi_pll_test_se
      dt-bindings: clock: qcom: gcc-sm8350: drop test clock
      dt-bindings: clock: qcom: gcc-sm8450: drop test clock
      clk: qcom: dispcc-qcm2290: get rid of test clock
      clk: qcom: gcc-msm8998: get rid of test clock
      clk: qcom: gcc-sc7180: get rid of test clock
      clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sdx55: get rid of test clock
      clk: qcom: mmcc-msm8998: get rid of test clock
      clk: qcom: gcc-msm8974: switch from sleep_clk_src to sleep_clk
      clk: qcom: rpmh: define IPA clocks where required
      dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
      dt-bindings: clock: qcom,gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
      dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
      clk: qcom: gcc-apq8084: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-apq8084: move PLL clocks up
      clk: qcom: gcc-apq8084: use parent_hws/_data instead of parent_names
      clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
      clk: qcom: mmcc-apq8084: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: mmcc-apq8084: move clock parent tables down
      clk: qcom: mmcc-apq8084: remove spdm clocks
      clk: qcom: mmcc-apq8084: use parent_hws/_data instead of parent_names
      dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
      clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
      clk: qcom: cpu-8996: correct PLL programming
      clk: qcom: cpu-8996: fix the init clock rate
      clk: qcom: cpu-8996: support using GPLL0 as SMUX input
      clk: qcom: cpu-8996: skip ACD init if the setup is valid
      clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
      clk: qcom: cpu-8996: setup PLLs before registering clocks
      clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
      clk: qcom: cpu-8996: fix PLL configuration sequence
      clk: qcom: cpu-8996: fix ACD initialization
      clk: qcom: cpu-8996: fix PLL clock ops
      clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
      clk: qcom: add the driver for the MSM8996 APCS clocks
      dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock controller
      clk: qcom: add msm8996 Core Bus Framework (CBF) support
      clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
      clk: qcom: gpucc-sc7180: fix clk_dis_wait being programmed for CX GDSC
      clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
      dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml

Konrad Dybcio (5):
      clk: qcom: gcc-sm6115: Use floor_ops for SDCC1/2 core clk
      dt-bindings: clock: add QCOM SM6350 camera clock bindings
      clk: qcom: Add camera clock controller driver for SM6350
      arm64: dts: qcom: sm8250: Pad addresses to 8 hex digits
      clk: qcom: camcc-sm6350: Make camcc_sm6350_hws static

Krzysztof Kozlowski (8):
      dt-bindings: clock: qcom,gcc-sc8280xp: document power domain
      dt-bindings: clock: qcom,spmi-clkdiv: convert to DT schema
      dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se input
      clk: gcc-sm8150: drop PLL test clock
      clk: gcc-sm8350: drop PLL test clock
      dt-bindings: clock: qcom,videocc: correct clocks per variant
      dt-bindings: clock: qcom,camcc-sm8250: extend clocks and power domains
      clk: qcom: cpu-8996: add missing cputype include

Marijn Suijten (1):
      clk: qcom: dispcc-sm6125: Fix compatible string to match bindings

Melody Olvera (1):
      dt-bindings: clock: Add QDU1000 and QRU1000 GCC clocks

Neil Armstrong (4):
      dt-bindings: clock: document SM8550 DISPCC clock controller
      clk: qcom: clk-alpha-pll: define alias of LUCID OLE reset ops to EVO reset ops
      clk: qcom: add SM8550 DISPCC driver
      dt-bindings: clock: document SM8550 DISPCC clock controller

Robert Marko (1):
      clk: qcom: ipq8074: populate fw_name for usb3phy-s

Shazad Hussain (1):
      clk: qcom: add the GCC driver for sa8775p

Taniya Das (1):
      clk: qcom: Add QDU1000 and QRU1000 GCC support

Ulf Hansson (1):
      PM: domains: Allow a genpd consumer to require a synced power off

Yang Yingliang (1):
      clk: qcom: krait-cc: fix wrong pointer passed to IS_ERR()

 .../bindings/clock/qcom,camcc-sm8250.yaml          |   20 +-
 .../bindings/clock/qcom,gcc-apq8084.yaml           |   44 +
 .../bindings/clock/qcom,gcc-msm8998.yaml           |    6 +-
 .../devicetree/bindings/clock/qcom,gcc-qcs404.yaml |   38 +-
 .../bindings/clock/qcom,gcc-sc8280xp.yaml          |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |    8 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |    2 -
 .../bindings/clock/qcom,gpucc-sm8350.yaml          |   71 -
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |   46 +-
 .../bindings/clock/qcom,msm8996-apcc.yaml          |    6 +-
 .../bindings/clock/qcom,msm8996-cbf.yaml           |   53 +
 .../bindings/clock/qcom,qdu1000-gcc.yaml           |   51 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../bindings/clock/qcom,sa8775p-gcc.yaml           |   84 +
 .../bindings/clock/qcom,sm6350-camcc.yaml          |   49 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |  105 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   55 +
 .../devicetree/bindings/clock/qcom,spmi-clkdiv.txt |   59 -
 .../bindings/clock/qcom,spmi-clkdiv.yaml           |   71 +
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   59 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |    8 +-
 drivers/base/power/domain.c                        |   26 +
 drivers/clk/qcom/Kconfig                           |   40 +
 drivers/clk/qcom/Makefile                          |    7 +-
 drivers/clk/qcom/apcs-msm8996.c                    |   88 +
 drivers/clk/qcom/camcc-sc7280.c                    |  268 +-
 drivers/clk/qcom/camcc-sm6350.c                    | 1906 ++++++++
 drivers/clk/qcom/camcc-sm8450.c                    |  324 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |    5 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/clk-cbf-8996.c                    |  315 ++
 drivers/clk/qcom/clk-cpu-8996.c                    |  146 +-
 drivers/clk/qcom/clk-rpmh.c                        |   56 +
 drivers/clk/qcom/clk-smd-rpm.c                     | 1445 +++---
 drivers/clk/qcom/clk-spmi-pmic-div.c               |   10 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |    6 -
 drivers/clk/qcom/dispcc-sc7180.c                   |    8 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm6125.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm6375.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm8250.c                   |    9 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |  221 +-
 drivers/clk/qcom/dispcc-sm8550.c                   | 1807 ++++++++
 drivers/clk/qcom/gcc-apq8084.c                     | 1024 +++--
 drivers/clk/qcom/gcc-ipq8074.c                     |    4 +-
 drivers/clk/qcom/gcc-msm8939.c                     |   32 +-
 drivers/clk/qcom/gcc-msm8974.c                     |   10 +-
 drivers/clk/qcom/gcc-msm8976.c                     |   30 +-
 drivers/clk/qcom/gcc-msm8998.c                     |   13 -
 drivers/clk/qcom/gcc-qcs404.c                      |  842 ++--
 drivers/clk/qcom/gcc-qdu1000.c                     | 2653 +++++++++++
 drivers/clk/qcom/gcc-sa8775p.c                     | 4785 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7180.c                      |   19 +-
 drivers/clk/qcom/gcc-sc7280.c                      |   10 +-
 drivers/clk/qcom/gcc-sdx55.c                       |   64 +-
 drivers/clk/qcom/gcc-sdx65.c                       |  109 +-
 drivers/clk/qcom/gcc-sm6115.c                      |    4 +-
 drivers/clk/qcom/gcc-sm6375.c                      |  257 +-
 drivers/clk/qcom/gcc-sm8150.c                      |   17 -
 drivers/clk/qcom/gcc-sm8250.c                      |   10 +-
 drivers/clk/qcom/gcc-sm8350.c                      |   15 -
 drivers/clk/qcom/gcc-sm8450.c                      |  236 +-
 drivers/clk/qcom/gcc-sm8550.c                      |  252 +-
 drivers/clk/qcom/gdsc.c                            |   11 +-
 drivers/clk/qcom/gpucc-msm8998.c                   |    8 +-
 drivers/clk/qcom/gpucc-sc7180.c                    |   11 +-
 drivers/clk/qcom/gpucc-sdm845.c                    |    7 +-
 drivers/clk/qcom/krait-cc.c                        |    4 +-
 drivers/clk/qcom/lpasscc-sc7280.c                  |   10 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c              |   20 +-
 drivers/clk/qcom/mmcc-apq8084.c                    | 1189 ++---
 drivers/clk/qcom/mmcc-msm8998.c                    |   25 -
 drivers/clk/qcom/tcsrcc-sm8550.c                   |  192 +
 drivers/clk/qcom/videocc-sm8250.c                  |    9 +-
 include/dt-bindings/clock/qcom,gcc-apq8084.h       |    1 +
 include/dt-bindings/clock/qcom,gcc-qcs404.h        |    4 +
 include/dt-bindings/clock/qcom,gcc-sm8350.h        |    1 -
 include/dt-bindings/clock/qcom,gcc-sm8450.h        |    1 -
 include/dt-bindings/clock/qcom,qdu1000-gcc.h       |  175 +
 include/dt-bindings/clock/qcom,rpmcc.h             |    2 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h       |  320 ++
 include/dt-bindings/clock/qcom,sm6350-camcc.h      |  109 +
 include/dt-bindings/clock/qcom,sm8550-dispcc.h     |  101 +
 include/dt-bindings/clock/qcom,sm8550-tcsr.h       |   18 +
 include/linux/pm_domain.h                          |    5 +
 include/linux/soc/qcom/smd-rpm.h                   |    1 -
 88 files changed, 16475 insertions(+), 3688 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-clkdiv.yaml
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c
 create mode 100644 drivers/clk/qcom/camcc-sm6350.c
 create mode 100644 drivers/clk/qcom/clk-cbf-8996.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8550.c
 create mode 100644 drivers/clk/qcom/gcc-qdu1000.c
 create mode 100644 drivers/clk/qcom/gcc-sa8775p.c
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,qdu1000-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6350-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h
