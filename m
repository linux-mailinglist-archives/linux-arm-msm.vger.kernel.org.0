Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C684D5979
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 05:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239481AbiCKEVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 23:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiCKEVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 23:21:02 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F9857B23
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 20:19:59 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id r41-20020a4a966c000000b0031bf85a4124so9387911ooi.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 20:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yd1Ow7oXFJSL/BngULMt5BMYSBwhB0DeYgVF4099B0Y=;
        b=V7szjzsTfEpdYniLzoiCDbcvBlefKzLEy7Z2yL6SNogtR4n+jDFZX5gHRd2dFLs/+l
         uhRDUTWBk8nMAs9A4tGbxAtbIOZTWN/TeKr6bKdVZIYgxBQUwVV08pfwIneGTme9xIth
         pqJ9EzSZPtTLDA2tHrPUw3jSnZVtJ5a5ZVkF/w/x787DsvpvJ3o0eDmhpPyRMLUF7PRM
         sLH/2fRb4sd9m0nkz4tShQcjP5/QKZmmd5fENBciCGullfmkNcvn1JETm8703IfsDAMg
         4IYFapLEPoePI3FRJiLjXgA8zgRuCjRBmPFUpIghJyQbyTk+t+FV8/EyeZ9fnj8KfdLV
         58Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yd1Ow7oXFJSL/BngULMt5BMYSBwhB0DeYgVF4099B0Y=;
        b=YFZmKAAkwOd0o/aNjwZas6R4C9xEbzWj9FTDTD6afBwn7rYPfX94zPPomCPT2OC3rb
         67BZ3ZwFTuc3UxoZGVNNGFgKkMznI08vWjSZuXx0V78RX1Bb2Kbsjp81LziCH/TJ8h0D
         jC/8t1cPTzyCckxhfQrBw7G9StVVNcvUnGWvFGVn3XVsrznFk/jPJxRmFR0FBNCgT2gN
         1JIWdfOiIQ2UkF9L27Wo9TxTqdRtlg3eN46jEIe2D9HOiYAHXtxZJCFMI4q8PhEO4vNI
         T8BpvlyEbQunMjlvVzAlmug8KOvU2aRFWfyB7Ap8jZ3bjutH8ZDAXu3qnyjf9bit/hJ1
         Lo3w==
X-Gm-Message-State: AOAM531FY8Dof2YcGntDntIu73AOr+vsx9C+K0FxWq+v3BrRLFIu8l8O
        WSmu/QrxDA8b/A86pfKGM5Mo0BQqSgLmUw==
X-Google-Smtp-Source: ABdhPJzPSrivwyuEhVQIMh3ty2MWBpY/6E5Dgz2vIshWaGaaPCpySc5rYmA1OHNKMmLuHSwgRbpMHA==
X-Received: by 2002:a05:6871:28d:b0:da:b3f:2b15 with SMTP id i13-20020a056871028d00b000da0b3f2b15mr10211875oae.180.1646972398456;
        Thu, 10 Mar 2022 20:19:58 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id ds3-20020a0568705b0300b000d9c70e5275sm3013001oab.54.2022.03.10.20.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 20:19:58 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [GIT PULL] Qualcomm clock updates for v5.18
Date:   Thu, 10 Mar 2022 22:19:57 -0600
Message-Id: <20220311041957.2611885-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-5.18

for you to fetch changes up to 6e87c8f074075e10c5352d3256879b4e6dd6cb81:

  clk: qcom: Add display clock controller driver for SM6125 (2022-03-09 08:53:30 -0600)

----------------------------------------------------------------
Qualcomm clock updates for v5.18

This introduces support for A7 PLL on SDX65, GPU clock controller for
SM6350, display clock controller for SM6125, SM6350 and QCS2290 and
multimedia clock controller for MSM8226. The RPMCC drivers get support
for SC8280XP and MSM8992, MSM8994 and MSM8998 gains some missing clocks.

A new gcc DeviceTree binding is introduced, to allow platform-specific
GCC bindings to inherit common properties. The SDM845 camera clock
controller binding is converted to YAML.

SDM845 camera clock controller, SDM660 GPU clock controller, IPQ8074
global clock controller, IPQ806x global clock controller, SC7180 camera
and video clock controllers, MSM8996 globacl clock controller are
converted to parent_data and/or parent_hws and cleanups related to this.

Test clocks are removed from the SC7180, SDM845 camera clock controller
drivers and SDM660 GPU clock controller driver.

IPQ806x gains clocks and resets for CryptoEngine and additional
frequencies for SDCC and NSS cores.

Floor ops are introduced for RCG clocks and used for IPQ8074 SDCC
clocks.

SM8150 gains EMAC, PCIe and UFS GDSCs.

The RCG2 logic for calculating D value is updated to support pixel clock
frequencies on newer platforms.

----------------------------------------------------------------
Ansuel Smith (14):
      dt-bindings: clock: split qcom,gcc.yaml to common and specific schema
      dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation
      dt-bindings: clock: document qcom,gcc-ipq8064 binding
      clk: qcom: gcc-ipq806x: fix wrong naming for gcc_pxo_pll8_pll0
      clk: qcom: gcc-ipq806x: convert parent_names to parent_data
      clk: qcom: gcc-ipq806x: use ARRAY_SIZE for num_parents
      clk: qcom: gcc-ipq806x: add additional freq nss cores
      clk: qcom: gcc-ipq806x: add unusued flag for critical clock
      clk: qcom: clk-rcg: add clk_rcg_floor_ops ops
      clk: qcom: gcc-ipq806x: add additional freq for sdc table
      dt-bindings: clock: add ipq8064 ce5 clk define
      clk: qcom: gcc-ipq806x: add CryptoEngine clocks
      dt-bindings: reset: add ipq8064 ce5 resets
      clk: qcom: gcc-ipq806x: add CryptoEngine resets

Bartosz Dudziak (2):
      dt-bindings: clock: Add support for the MSM8226 mmcc
      clk: qcom: Add MSM8226 Multimedia Clock Controller support

Bhupesh Sharma (4):
      clk: qcom: gcc: Add PCIe0 and PCIe1 GDSC for SM8150
      clk: qcom: gcc: Add UFS_CARD and UFS_PHY GDSCs for SM8150
      clk: qcom: gcc: sm8150: Fix some identation issues
      clk: qcom: gcc: Add emac GDSC support for SM8150

Bjorn Andersson (2):
      dt-bindings: clock: Add sc8280xp to the RPMh clock controller binding
      clk: qcom: rpmhcc: add sc8280xp support to the RPMh clock controller

Dirk Buchwalder (1):
      clk: qcom: ipq8074: Use floor ops for SDCC1 clock

Dmitry Baryshkov (18):
      clk: qcom: gpucc-sdm660: fix two clocks with parent_names
      clk: qcom: gpucc-sdm660: get rid of the test clock
      clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
      clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sc7180: get rid of the test clock
      clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
      clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sdm845: get rid of the test clock
      clk: qcom: camcc-sdm845: move clock parent tables down
      clk: qcom: camcc-sdm845: convert to parent_hws/_data
      clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
      clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8996: drop unsupported clock sources
      clk: qcom: gcc-msm8996: move clock parent tables down
      clk: qcom: gcc-msm8996: use parent_hws/_data instead of parent_names
      clk: qcom: gcc-msm8996: start getting rid of xo clk
      dt-bindings: clocks: convert SDM845 Camera CC bindings to YAML
      dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names

Konrad Dybcio (7):
      dt-bindings: clock: add QCOM SM6350 display clock bindings
      clk: qcom: Add display clock controller driver for SM6350
      dt-bindings: clock: add SM6350 QCOM Graphics clock bindings
      clk: qcom: Add GPU clock controller driver for SM6350
      dt-bindings: clock: qcom: rpmcc: Add RPM Modem SubSystem (MSS) clocks
      clk: qcom: smd: Add missing RPM clocks for msm8992/4
      clk: qcom: smd: Add missing MSM8998 RPM clocks

Loic Poulain (2):
      dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
      clk: qcom: Add display clock controller driver for QCM2290

Marijn Suijten (1):
      clk: qcom: Fix sorting of SDX_GCC_65 in Makefile and Kconfig

Martin Botka (2):
      dt-bindings: clock: add QCOM SM6125 display clock bindings
      clk: qcom: Add display clock controller driver for SM6125

Robert Marko (1):
      clk: qcom: ipq8074: fix PCI-E clock oops

Rohit Agarwal (3):
      dt-bindings: clock: Add A7 PLL binding for SDX65
      clk: qcom: Add A7 PLL support for SDX65
      clk: qcom: Add SDX65 APCS clock controller support

Taniya Das (2):
      clk: qcom: clk-rcg2: Update logic to calculate D value for RCG
      clk: qcom: clk-rcg2: Update the frac table for pixel clock

 .../devicetree/bindings/clock/qcom,a7pll.yaml      |   2 +-
 .../devicetree/bindings/clock/qcom,camcc.txt       |  18 -
 .../bindings/clock/qcom,dispcc-sm6125.yaml         |  87 ++
 .../bindings/clock/qcom,dispcc-sm6350.yaml         |  86 ++
 .../bindings/clock/qcom,gcc-apq8064.yaml           |  29 +-
 .../bindings/clock/qcom,gcc-ipq8064.yaml           |  76 ++
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |  70 ++
 .../devicetree/bindings/clock/qcom,gcc.yaml        |  59 +-
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   2 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |   1 +
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |  87 ++
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |   1 +
 .../bindings/clock/qcom,sdm845-camcc.yaml          |  65 ++
 drivers/clk/qcom/Kconfig                           |  59 +-
 drivers/clk/qcom/Makefile                          |   6 +-
 drivers/clk/qcom/camcc-sc7180.c                    | 221 +++--
 drivers/clk/qcom/camcc-sdm845.c                    | 323 +++----
 drivers/clk/qcom/clk-rcg.c                         |  24 +
 drivers/clk/qcom/clk-rcg.h                         |   1 +
 drivers/clk/qcom/clk-rcg2.c                        |  14 +-
 drivers/clk/qcom/clk-rpmh.c                        |  18 +
 drivers/clk/qcom/clk-smd-rpm.c                     |  53 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  | 555 ++++++++++++
 drivers/clk/qcom/dispcc-sm6125.c                   | 709 +++++++++++++++
 drivers/clk/qcom/dispcc-sm6350.c                   | 797 +++++++++++++++++
 drivers/clk/qcom/gcc-ipq806x.c                     | 649 ++++++++++----
 drivers/clk/qcom/gcc-ipq8074.c                     |  21 +-
 drivers/clk/qcom/gcc-msm8996.c                     | 971 +++++++++++++--------
 drivers/clk/qcom/gcc-sm8150.c                      |  74 +-
 drivers/clk/qcom/gpucc-sdm660.c                    |  21 +-
 drivers/clk/qcom/gpucc-sm6350.c                    | 521 +++++++++++
 drivers/clk/qcom/mmcc-msm8974.c                    | 206 ++++-
 drivers/clk/qcom/videocc-sc7180.c                  |   8 +-
 include/dt-bindings/clock/qcom,dispcc-qcm2290.h    |  34 +
 include/dt-bindings/clock/qcom,dispcc-sm6125.h     |  41 +
 include/dt-bindings/clock/qcom,dispcc-sm6350.h     |  48 +
 include/dt-bindings/clock/qcom,gcc-ipq806x.h       |   5 +-
 include/dt-bindings/clock/qcom,gcc-sm8150.h        |   5 +
 include/dt-bindings/clock/qcom,gpucc-sm6350.h      |  37 +
 include/dt-bindings/clock/qcom,rpmcc.h             |   2 +
 include/dt-bindings/reset/qcom,gcc-ipq806x.h       |   5 +
 include/linux/soc/qcom/smd-rpm.h                   |   1 +
 42 files changed, 5027 insertions(+), 985 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6350.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-qcm2290.c
 create mode 100644 drivers/clk/qcom/dispcc-sm6125.c
 create mode 100644 drivers/clk/qcom/dispcc-sm6350.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6350.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-qcm2290.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm6350.h
