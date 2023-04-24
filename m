Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 672916ED072
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Apr 2023 16:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjDXOmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Apr 2023 10:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDXOl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Apr 2023 10:41:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503B97298;
        Mon, 24 Apr 2023 07:41:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D0B0361B66;
        Mon, 24 Apr 2023 14:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD9FC433D2;
        Mon, 24 Apr 2023 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682347313;
        bh=gfKAl4mtNbVi6IotB3tW7CHhTtnZUeyRqIiaPbjOx6k=;
        h=From:To:Cc:Subject:Date:From;
        b=ciVYHxYGiCxKZb4DB+Gla3USl/0uHlivuSfmWH9rvgVKMYN22m2ITu6E3h8Xjo2uz
         Z3ldk24lbiYARA3GSJpgpBfJR3QkUhQ+hGhbadzvtMoQya4C2sVZpictTdWiC+OJ6l
         9Yo5tEaImxbbv2Cy1mcU8fGycRozM+FHmO6qj2Tsl8HWFKJ/1JLCUJyYA1aAcvurlq
         YiL09FIkYw1vUO8AbYimy5Y9oh9VIGXxhTidpKM4+54uQl1qQWPsUwS3xvVs69aSA5
         vWvUKngT+9UEHnL+XiEYBG0Xc6J3iM7zG9/TdIjtrSPJtvnnTSFAx4tnnazHLucv13
         3tQJZOaHAnHvw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Robert Marko <robert.marko@sartura.hr>,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Rayyan Ansari <rayyan@ansari.sh>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Tom Rix <trix@redhat.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [GIT PULL] Qualcomm Clock updates for v6.4
Date:   Mon, 24 Apr 2023 07:45:36 -0700
Message-Id: <20230424144536.277508-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.4

for you to fetch changes up to 32c2f2a46db1322caaf78d5ea747ed5c56d2e353:

  clk: qcom: gcc-sc8280xp: Add EMAC GDSCs (2023-04-24 07:22:01 -0700)

----------------------------------------------------------------
Qualcomm Clock updates for v6.4

New drivers for Global clock controller on SM7150, IPQ9574, MSM8917 and
IPQ5332 are added. New GPU clock controllers for SM6115, SM6125, SM6375
and SA8775P are added.

The APSS IPQ PLL driver is refactored to support different PLL types,
support for the Stromer Plus PLL type is added, and support for IPQ5332
is introduced.

Helpers for settings sleep, wake and retain bits of CBCR registers are
introduced and used in some of the newly introduced GPU clock drivers.

platform_driver remove callbacks is transitioned to remove_new, as part
of the system wide cleanup effort.

In the Display clock controller for QCM2290, the MDSS_CORE reset is
introduced and the non-existent DSI1PHY clock is removed.

IPQ4019 Global clock controller is transitioned to parent_data.

USB GDSCs in SM6375, MSM8996 and MSM8998 are changed to use retention as
disabled state, to avoid collapsing them during suspend.
The CX GDSC in the SM6375 GPU clock controller has it's disable-wait
value corrected.

QCM2290 SDCC2 src clock moves to floor_ops.

The two EMAC GDSCs are added for SC8280XP.

Relevant RCGs in the SM6115 Global clock controller are moved to use
shared_ops.

PCIe PIPE clock operations on SM8350 are updated, to ensure the mux is
parked when the parent PLL is disabled.

GDSCs are added to the SC7280 LPASS audio clock controller.

The RPM clock controller is transitioned to use the managed version of
of_clk_add_hw_provider().
Missing XO clocks are added to MSM8226 and MSM8974.

DeviceTree bindings are added for the various newly supported clock
controllers, the binding for KPSS ACC and GCC drivers are converted to
YAML and a few fixes are introduced.

----------------------------------------------------------------
Andrew Halaney (1):
      clk: qcom: gcc-sc8280xp: Add EMAC GDSCs

Bartosz Golaszewski (1):
      dt-bindings: clock: qcom: describe the GPUCC clock for SA8775P

Bjorn Andersson (6):
      Merge branch '20230208091340.124641-1-konrad.dybcio@linaro.org' into clk-for-6.4
      Merge branch '20230213165318.127160-2-danila@jiaxyga.com' into clk-for-6.4
      Merge branch '20230307062232.4889-1-quic_kathirav@quicinc.com' into clk-for-6.4
      Merge branch '20230223180935.60546-1-otto.pflueger@abscue.de' into clk-for-6.4
      Merge branch '20230316-topic-qcm_dispcc_reset-v1-1-dd3708853014@linaro.org' into clk-for-6.4
      Merge branch '20230316072940.29137-2-quic_devipriy@quicinc.com' into clk-for-6.4

Christian Marangi (2):
      dt-bindings: arm: msm: Convert and split kpss-acc driver Documentation to yaml
      dt-bindings: arm: msm: Rework kpss-gcc driver Documentation to yaml

Danila Tikhonov (2):
      dt-bindings: clock: Add SM7150 GCC clocks
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7150

Devi Priya (2):
      dt-bindings: clock: Add ipq9574 clock and reset definitions
      clk: qcom: Add Global Clock Controller driver for IPQ9574

Dmitry Baryshkov (1):
      clk: qcom: gcc-sm8350: fix PCIe PIPE clocks handling

Kathiravan T (7):
      dt-bindings: clock: Add Qualcomm IPQ5332 GCC
      clk: qcom: Add STROMER PLUS PLL type for IPQ5332
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC
      clk: qcom: ipq5332: mark GPLL4 as ignore unused temporarily
      clk: qcom: apss-ipq-pll: refactor the driver to accommodate different PLL types
      dt-bindings: clock: qcom,a53pll: add IPQ5332 compatible
      clk: qcom: apss-ipq-pll: add support for IPQ5332

Konrad Dybcio (19):
      dt-bindings: clock: Add Qcom SM6125 GPUCC
      dt-bindings: clock: Add Qcom SM6375 GPUCC
      dt-bindings: clock: Add Qcom SM6115 GPUCC
      clk: qcom: branch: Add helper functions for setting retain bits
      clk: qcom: branch: Add helper functions for setting SLEEP/WAKE bits
      clk: qcom: branch: Move CBCR bits definitions to the header file
      clk: qcom: branch: Clean up branch enable registers
      clk: qcom: Add GPU clock controller driver for SM6125
      clk: qcom: Add GPU clock controller driver for SM6375
      clk: qcom: Add GPU clock controller driver for SM6115
      clk: qcom: gcc-qcm2290: Fix up gcc_sdcc2_apps_clk_src
      clk: qcom: gcc-sm6375: Update the .pwrsts for usb gdsc
      clk: qcom: gcc-msm8996: Update the .pwrsts for usb gdsc
      clk: qcom: gcc-msm8998: Update the .pwrsts for usb gdsc
      dt-bindings: clock: dispcc-qcm2290: Add MDSS_CORE reset
      clk: qcom: dispcc-qcm2290: Add MDSS_CORE reset
      clk: qcom: gcc-sm6115: Mark RCGs shared where applicable
      clk: qcom: gpucc-sm6375: Configure CX_GDSC disable wait value
      clk: qcom: dispcc-qcm2290: Remove inexistent DSI1PHY clk

Krzysztof Kozlowski (2):
      dt-bindings: mailbox: qcom,apcs-kpss-global: correct SDX55 clocks
      dt-bindings: mailbox: qcom,apcs-kpss-global: fix SDX55 'if' match

Lars-Peter Clausen (1):
      clk: qcom: rpm: Use managed `of_clk_add_hw_provider()`

Luca Weiss (2):
      clk: qcom: clk-krait: switch to .determine_rate
      clk: qcom: clk-hfpll: switch to .determine_rate

Mohammad Rafi Shaik (1):
      clk: qcom: lpassaudiocc-sc7280: Add required gdsc power domain clks in lpass_cc_sc7280_desc

Otto Pflüger (4):
      dt-bindings: clock: Add MSM8917 global clock controller
      dt-bindings: clock: qcom,rpmcc: Add MSM8917
      clk: qcom: Add global clock controller driver for MSM8917
      clk: qcom: smd-rpm: Add clocks for MSM8917

Rayyan Ansari (1):
      clk: qcom: smd: Add XO RPM clocks for MSM8226/MSM8974

Robert Marko (5):
      dt-bindings: clock: split qcom,gcc-ipq4019 to separate file
      clk: qcom: gcc-ipq4019: convert XO and sleep clk to parent_data
      clk: qcom: gcc-ipq4019: move PLL clocks up
      clk: qcom: gcc-ipq4019: move pcnoc clocks up
      clk: qcom: gcc-ipq4019: convert to parent data

Shazad Hussain (1):
      clk: qcom: add the GPUCC driver for sa8775p

Srinivasa Rao Mandadapu (2):
      dt-bindings: clock: qcom,sc7280-lpasscc: Add qcom,adsp-pil-mode property
      clk: qcom: lpasscc-sc7280: Skip qdsp6ss clock registration

Tom Rix (1):
      clk: qcom: remove unused variables gpucc_parent_data,map_2

Uwe Kleine-König (1):
      clk: qcom: Convert to platform remove callback returning void

Varadarajan Narayanan (1):
      clk: qcom: clk-alpha-pll: Add support for Stromer PLLs

 .../devicetree/bindings/arm/msm/qcom,kpss-acc.txt  |   49 -
 .../devicetree/bindings/arm/msm/qcom,kpss-gcc.txt  |   44 -
 .../devicetree/bindings/clock/qcom,a53pll.yaml     |    1 +
 .../bindings/clock/qcom,gcc-ipq4019.yaml           |   53 +
 .../bindings/clock/qcom,gcc-msm8909.yaml           |   13 +-
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |    2 -
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    2 +
 .../bindings/clock/qcom,ipq5332-gcc.yaml           |   53 +
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |   61 +
 .../bindings/clock/qcom,kpss-acc-v1.yaml           |   72 +
 .../devicetree/bindings/clock/qcom,kpss-gcc.yaml   |   88 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../bindings/clock/qcom,sc7280-lpasscc.yaml        |    7 +
 .../bindings/clock/qcom,sm6115-gpucc.yaml          |   58 +
 .../bindings/clock/qcom,sm6125-gpucc.yaml          |   64 +
 .../bindings/clock/qcom,sm6375-gpucc.yaml          |   60 +
 .../devicetree/bindings/clock/qcom,sm7150-gcc.yaml |   52 +
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |    9 +-
 .../bindings/power/qcom,kpss-acc-v2.yaml           |   42 +
 drivers/clk/qcom/Kconfig                           |   70 +
 drivers/clk/qcom/Makefile                          |    8 +
 drivers/clk/qcom/apcs-msm8916.c                    |    6 +-
 drivers/clk/qcom/apcs-sdx55.c                      |    6 +-
 drivers/clk/qcom/apss-ipq-pll.c                    |  116 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |  139 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   14 +-
 drivers/clk/qcom/clk-branch.c                      |   15 +-
 drivers/clk/qcom/clk-branch.h                      |   44 +
 drivers/clk/qcom/clk-hfpll.c                       |   14 +-
 drivers/clk/qcom/clk-krait.c                       |   10 +-
 drivers/clk/qcom/clk-rpm.c                         |   11 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |   37 +
 drivers/clk/qcom/dispcc-qcm2290.c                  |   10 +-
 drivers/clk/qcom/gcc-ipq4019.c                     | 1665 ++++----
 drivers/clk/qcom/gcc-ipq5332.c                     | 3824 ++++++++++++++++++
 drivers/clk/qcom/gcc-ipq9574.c                     | 4248 ++++++++++++++++++++
 drivers/clk/qcom/gcc-msm8917.c                     | 3303 +++++++++++++++
 drivers/clk/qcom/gcc-msm8960.c                     |    6 +-
 drivers/clk/qcom/gcc-msm8996.c                     |    3 +-
 drivers/clk/qcom/gcc-msm8998.c                     |    3 +-
 drivers/clk/qcom/gcc-qcm2290.c                     |    3 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |   18 +
 drivers/clk/qcom/gcc-sm6115.c                      |   50 +-
 drivers/clk/qcom/gcc-sm6375.c                      |    3 +-
 drivers/clk/qcom/gcc-sm7150.c                      | 3048 ++++++++++++++
 drivers/clk/qcom/gcc-sm8350.c                      |   47 +-
 drivers/clk/qcom/gpucc-sa8775p.c                   |  625 +++
 drivers/clk/qcom/gpucc-sm6115.c                    |  503 +++
 drivers/clk/qcom/gpucc-sm6125.c                    |  424 ++
 drivers/clk/qcom/gpucc-sm6375.c                    |  458 +++
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |    2 +
 drivers/clk/qcom/lpasscc-sc7280.c                  |   16 +-
 include/dt-bindings/clock/qcom,dispcc-qcm2290.h    |    4 +
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |  190 +
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h      |    2 +
 include/dt-bindings/clock/qcom,ipq5332-gcc.h       |  356 ++
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |  213 +
 include/dt-bindings/clock/qcom,sa8775p-gpucc.h     |   50 +
 include/dt-bindings/clock/qcom,sm6115-gpucc.h      |   36 +
 include/dt-bindings/clock/qcom,sm6125-gpucc.h      |   31 +
 include/dt-bindings/clock/qcom,sm6375-gpucc.h      |   36 +
 include/dt-bindings/clock/qcom,sm7150-gcc.h        |  186 +
 include/dt-bindings/reset/qcom,ipq9574-gcc.h       |  164 +
 63 files changed, 19667 insertions(+), 1082 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kpss-acc-v1.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kpss-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
 create mode 100644 drivers/clk/qcom/gcc-ipq5332.c
 create mode 100644 drivers/clk/qcom/gcc-ipq9574.c
 create mode 100644 drivers/clk/qcom/gcc-msm8917.c
 create mode 100644 drivers/clk/qcom/gcc-sm7150.c
 create mode 100644 drivers/clk/qcom/gpucc-sa8775p.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6115.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6125.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6375.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8917.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5332-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6125-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-gcc.h
