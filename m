Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297297D9C8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 17:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbjJ0PGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 11:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbjJ0PGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 11:06:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4709C4;
        Fri, 27 Oct 2023 08:06:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24953C433C8;
        Fri, 27 Oct 2023 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698419210;
        bh=5rAHE74JaUW9j0fLiUG3QJe6u4QlvCh1VJ4REx3NAps=;
        h=From:To:Cc:Subject:Date:From;
        b=YEFBUD4vfgp5xAXI8W540+rOY+wCOLiNfx0C+/1eUCTnaBy8ThoRJvpM9YCERvFF+
         NAUjdcoW36SJ5C9lo+/0Sg/eB0k/oLVan+iLcLygzw45wtVkF5BjZzwgrRfQalCrDB
         BEe8qQp6Atbc//xPWmh34kI/w6Mu5Eo2mfy+TW/0otq5ofq5vEDcRMwzdst8lLrd5c
         9IOB1Wly4xyXwsim5KHDKjBIsPk1+gwPAd1L8WnSORsJkz3neW0FNDZTKtq0nOq2gx
         e250CNRDAJmZyAlaKrzWAAVHUcYvaCTelHHMbHqGgfeW9PM42RlftUdUxJVf/MLU5m
         9Xf2T//uvSaVw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [GIT PULL] Qualcomm clock updates for v6.7
Date:   Fri, 27 Oct 2023 08:11:04 -0700
Message-ID: <20231027151105.1317488-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.7

for you to fetch changes up to e0e6373d653b7707bf042ecf1538884597c5d0da:

  clk: qcom: apss-ipq6018: add the GPLL0 clock also as clock provider (2023-10-21 12:59:13 -0700)

----------------------------------------------------------------
Qualcomm clock updates for v6.7

Initial support for the SM4450 platform is introduced, with the Global
Clock Controller and RPMh clock controller additions.

CLK_SET_RATE_PARENT is dropped for clocks with fixed-rate GPLLs, across
a variety of IPQ platforms. On IPQ6018, GPLL0 is a missing parent of
APCS PLL, so this is corrected.

For IPQ6018 the I2C clock for QUP6 was previously omitted, as disabling
it is reported to cause problems for RPM. It's now added, but marked as
critical.

Stromer Plus is introduced, and safe source switching of the a53pll in
IPQ5332 is introduced.

SM8550 Video and GPU clock controllers are switched to use the OLE PLL
configure method, instead of manually specifying additional components
of the l-value.

A couple of fixes related to halt bit checks and SMMU GDSC are
introduced for MSM8998.

A possible integer overflow in the frequency calculation in the RCG code
is addressed.

Clocked managed through RPM are removed from the MSM8996 Global Clock
Controller.

Support for the Camera Clock Controller on SM8550 is added.

PLL configuration for the three HFPLLs in MSM8976 are added.

The MSM8996 CBF clock driver's remove function is transitioned to the
void-returning variant.

----------------------------------------------------------------
Adam Skladowski (4):
      clk: qcom: clk-hfpll: Configure l_val in init when required
      clk: qcom: hfpll: Allow matching pdata
      dt-bindings: clock: qcom,hfpll: Document MSM8976 compatibles
      clk: qcom: hfpll: Add MSM8976 PLL data

Ajit Pandey (4):
      dt-bindings: clock: qcom: Add RPMHCC for SM4450
      clk: qcom: rpmh: Add RPMH clocks support for SM4450
      dt-bindings: clock: qcom: Add GCC clocks for SM4450
      clk: qcom: Add GCC driver support for SM4450

Bjorn Andersson (2):
      Merge branch '20230707035744.22245-2-quic_jkona@quicinc.com' into clk-for-6.7
      Merge branch '20230909123431.1725728-1-quic_ajipan@quicinc.com' into clk-for-6.7

Danila Tikhonov (1):
      clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src

Devi Priya (1):
      clk: qcom: clk-rcg2: Fix clock rate overflow for high parent frequencies

Dmitry Baryshkov (2):
      clk: qcom: gpucc-sm8550: switch to clk_lucid_ole_pll_configure
      clk: qcom: videocc-sm8550: switch to clk_lucid_ole_pll_configure

Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add SM8550 camera clock controller
      clk: qcom: clk-alpha-pll: Add support for lucid ole pll configure
      clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
      clk: qcom: camcc-sm8550: Add support for qdss, sleep and xo clocks

Kathiravan Thirumoorthy (6):
      clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT flag from PLL clocks
      clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT flag from PLL clocks
      clk: qcom: ipq5018: drop the CLK_SET_RATE_PARENT flag from GPLL clocks
      clk: qcom: ipq9574: drop the CLK_SET_RATE_PARENT flag from GPLL clocks
      clk: qcom: ipq5332: drop the CLK_SET_RATE_PARENT flag from GPLL clocks
      clk: qcom: apss-ipq6018: add the GPLL0 clock also as clock provider

Konrad Dybcio (4):
      clk: qcom: gcc-msm8996: Remove RPM bus clocks
      clk: qcom: mmcc-msm8998: Don't check halt bit on some branch clks
      clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
      clk: qcom: smd-rpm: Move CPUSS_GNoC clock to interconnect

Luca Weiss (1):
      clk: qcom: mmcc-msm8974: remove ocmemcx_ahb_clk

Rob Herring (1):
      clk: qcom: Replace of_device.h with explicit includes

Robert Marko (1):
      clk: qcom: gcc-ipq6018: add QUP6 I2C clock

Uwe Kleine-König (1):
      clk: qcom: cbf-msm8996: Convert to platform remove callback returning void

Varadarajan Narayanan (6):
      clk: qcom: ipq5332: Drop set rate parent from gpll0 dependent clocks
      clk: qcom: config IPQ_APSS_6018 should depend on QCOM_SMEM
      clk: qcom: clk-alpha-pll: introduce stromer plus ops
      clk: qcom: apss-ipq-pll: Use stromer plus ops for stromer plus pll
      clk: qcom: apss-ipq-pll: Fix 'l' value for ipq5332_pll_config
      clk: qcom: apss-ipq6018: ipq5332: add safe source switch for a53pll

 .../devicetree/bindings/clock/qcom,hfpll.txt       |    3 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/clock/qcom,sm4450-gcc.yaml |   55 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    8 +-
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/apss-ipq-pll.c                    |    4 +-
 drivers/clk/qcom/apss-ipq6018.c                    |   61 +-
 drivers/clk/qcom/camcc-sm8550.c                    | 3565 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   92 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    3 +
 drivers/clk/qcom/clk-cbf-8996.c                    |   12 +-
 drivers/clk/qcom/clk-hfpll.c                       |    4 +
 drivers/clk/qcom/clk-hfpll.h                       |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |   14 +-
 drivers/clk/qcom/clk-rpmh.c                        |   21 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   16 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |    6 +-
 drivers/clk/qcom/gcc-ipq5332.c                     |    4 -
 drivers/clk/qcom/gcc-ipq6018.c                     |   27 +-
 drivers/clk/qcom/gcc-ipq8074.c                     |    6 -
 drivers/clk/qcom/gcc-ipq9574.c                     |    4 -
 drivers/clk/qcom/gcc-msm8996.c                     |  237 +-
 drivers/clk/qcom/gcc-sm4450.c                      | 2898 ++++++++++++++++
 drivers/clk/qcom/gcc-sm8150.c                      |    2 +-
 drivers/clk/qcom/gpucc-sm8550.c                    |   10 +-
 drivers/clk/qcom/hfpll.c                           |   59 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |   18 -
 drivers/clk/qcom/mmcc-msm8998.c                    |    7 +-
 drivers/clk/qcom/videocc-sm8550.c                  |   10 +-
 include/dt-bindings/clock/qcom,mmcc-msm8974.h      |    1 -
 include/dt-bindings/clock/qcom,sm4450-gcc.h        |  197 ++
 include/dt-bindings/clock/qcom,sm8550-camcc.h      |  187 +
 33 files changed, 7235 insertions(+), 317 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8550.c
 create mode 100644 drivers/clk/qcom/gcc-sm4450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-camcc.h
