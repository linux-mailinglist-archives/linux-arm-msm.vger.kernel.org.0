Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E066C64629F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 21:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLGUqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 15:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLGUqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 15:46:34 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D923E0A7;
        Wed,  7 Dec 2022 12:46:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 024D0CE20FE;
        Wed,  7 Dec 2022 20:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D51DC433C1;
        Wed,  7 Dec 2022 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670445989;
        bh=DvSocVTDQKs3WifG1N1fpFXCdibL/HHhC7+wQhERQYc=;
        h=From:To:Cc:Subject:Date:From;
        b=Dx5C16JrsZXWzEVgUz67yoZkKJXyEkWML1ML/EhEjl5jRQDyx8pQn6XVZHuh9QZ6I
         fxZhdUcEFIONlxKW+4jYrcvHUgXzuRSiemgdZRkQnNw6+nNbR72ryxKEKi2m7JesFX
         9dC+ZIeq3Wxctg51ADhP3r32Eo1ruCtNhDMqh1eoCetWHjEbo/YT4mF9Jshk+Eldt9
         P6pJN8wYJEddr5TS+gsgAhTiqk1O9LH8I77/H/9p7fZDwQOrA5zudZ3EkrY1Gs0jhP
         flWMpOeCjN9GeyvfVBCCpD6SH+E9NbUeVFmAkQb/Vn/HoDL6Q0a3MFtRg9cZO4UUem
         IdibmfWovRSsQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lin@vger.kernel.org, Meng-Bo <linmengbo0689@protonmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Robert Marko <robert.marko@sartura.hr>
Subject: [GIT PULL] Qualcomm clock updates for 6.2
Date:   Wed,  7 Dec 2022 14:46:26 -0600
Message-Id: <20221207204626.3253372-1-andersson@kernel.org>
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.2

for you to fetch changes up to 2931aa6758da9f871b4bd7ee52a4be2f9d24e6ce:

  clk: qcom: rpmh: add support for SM6350 rpmh IPA clock (2022-12-06 12:30:20 -0600)

----------------------------------------------------------------
Qualcomm clock updates for 6.2

This introduces Global clock controller for SM8550, Display clock
controller for SC8280XP and RPMh clock controller for QDU1000 and
QRU1000.

The SM8150/SM8250 Display clock controller is cleaned up and some
missing clocks for SM8350 are added.

MSM8974 Global and Multimedia clock controllers are transitioned to
parent_data and parent_hws.

IPQ8074 parent_data and additional network resets and the Krait clock
controller modernized.

pm_runtime usage in SC7180 and SC7280 LPASS clock controllers are
corrected. SM8250 USB GDSCs enable retention mode.

RPM and RPMh clock drivers are cleaned up, to avoid duplicating clocks
which definition could be shared between platforms.

A variety of DT binding improvements.

----------------------------------------------------------------
Abel Vesa (4):
      dt-bindings: clock: Add SM8550 GCC clocks
      clk: qcom: gdsc: Increase status poll timeout
      clk: qcom: Add LUCID_OLE PLL type for SM8550
      clk: qcom: Add GCC driver for SM8550

Bjorn Andersson (2):
      dt-bindings: clock: Add Qualcomm SC8280XP display clock bindings
      clk: qcom: Add SC8280XP display clock controller

Christian Marangi (8):
      clk: qcom: kpss-xcc: register it as clk provider
      clk: qcom: clk-krait: fix wrong div2 functions
      clk: qcom: krait-cc: use devm variant for clk notifier register
      clk: qcom: krait-cc: fix wrong parent order for secondary mux
      clk: qcom: krait-cc: also enable secondary mux and div clk
      clk: qcom: krait-cc: handle secondary mux sourcing out of acpu_aux
      clk: qcom: krait-cc: convert to devm_clk_hw_register
      clk: qcom: krait-cc: convert to parent_data API

Dmitry Baryshkov (23):
      dt-bindings: clock: split qcom,gcc-sdm660 to the separate file
      dt-bindings: clock: qcom,gcc-ipq8064: add pll4 to used clocks
      clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
      clk: qcom: rpm: remove unused active-only clock names
      clk: qcom: rpm: drop separate active-only names
      clk: qcom: rpm: drop the _clk suffix completely
      clk: qcom: rpm: drop the platform from clock definitions
      clk: qcom: rpmh: group clock definitions together
      clk: qcom: rpmh: reuse common duplicate clocks
      clk: qcom: rpmh: drop all _ao names
      clk: qcom: rpmh: remove platform names from BCM clocks
      clk: qcom: rpmh: support separate symbol name for the RPMH clocks
      clk: qcom: rpmh: rename ARC clock data
      clk: qcom: rpmh: rename VRM clock data
      clk: qcom: rpmh: remove usage of platform name
      dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate file
      dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
      clk: qcom: gcc-msm8974: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8974: move clock parent tables down
      clk: qcom: gcc-msm8974: use parent_hws/_data instead of parent_names
      clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: mmcc-msm8974: move clock parent tables down
      clk: qcom: mmcc-msm8974: use parent_hws/_data instead of parent_names

Douglas Anderson (3):
      clk: qcom: lpass-sc7280: Fix pm_runtime usage
      clk: qcom: lpass-sc7180: Fix pm_runtime usage
      clk: qcom: lpass-sc7180: Avoid an extra "struct dev_pm_ops"

Konrad Dybcio (3):
      clk: qcom: dispcc-sm6350: Add CLK_OPS_PARENT_ENABLE to pixel&byte src
      dt-bindings: clock: add QCOM SM6375 display clock
      clk: qcom: Add display clock controller driver for SM6375

Krzysztof Kozlowski (6):
      dt-bindings: clock: qcom,sdm845-lpasscc: convert to dtschema
      dt-bindings: clock: qcom,aoncc-sm8250: fix compatible
      dt-bindings: clock: qcom,aoncc-sm8250: add missing audio clock
      dt-bindings: clock: qcom,audiocc-sm8250: add missing audio clock
      dt-bindings: clock: qcom,gcc-ipq8074: Use common GCC schema
      dt-bindings: clock: qcom: Clean-up titles and descriptions

Lin, Meng-Bo (1):
      clk: qcom: gcc-msm8939: Add rates to the GP clocks

Luca Weiss (2):
      dt-bindings: clock: Convert qcom,lcc to DT schema
      clk: qcom: rpmh: add support for SM6350 rpmh IPA clock

Manivannan Sadhasivam (1):
      clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs

Martin Botka (1):
      clk: qcom: gcc-sm6125: Remove gpll7 from sdcc2_apps

Melody Olvera (2):
      dt-bindings: clock: Add RPMHCC for QDU1000 and QRU1000
      clk: qcom: Add support for QDU1000 and QRU1000 RPMh clocks

Minghao Chi (1):
      clk: qcom: hfpll: use devm_platform_get_and_ioremap_resource()

Robert Foss (5):
      clk: qcom: dispcc-sm8250: Disable EDP_GTC for sm8350
      clk: qcom: dispcc-sm8250: Add RETAIN_FF_ENABLE flag for mdss_gdsc
      dt-bindings: clock: dispcc-sm8250: Add EDP_LINK_DIV_CLK_SRC index
      clk: qcom: dispcc-sm8250: Add missing EDP clocks for sm8350
      clk: qcom: dispcc-sm8250: Disable link_div_clk_src for sm8150

Robert Marko (7):
      clk: qcom: ipq8074: convert to parent data
      dt-bindings: clocks: qcom,gcc-ipq8074: allow XO and sleep clocks
      clk: qcom: reset: support resetting multiple bits
      dt-bindings: clock: qcom: ipq8074: add missing networking resets
      clk: qcom: ipq8074: add missing networking resets
      clk: qcom: ipq8074: populate fw_name for all parents
      clk: qcom: gcc-ipq4019: switch to devm_clk_notifier_register

 .../devicetree/bindings/clock/qcom,a53pll.yaml     |    2 +-
 .../devicetree/bindings/clock/qcom,a7pll.yaml      |    2 +-
 .../bindings/clock/qcom,aoncc-sm8250.yaml          |   11 +-
 .../bindings/clock/qcom,audiocc-sm8250.yaml        |    7 +-
 .../bindings/clock/qcom,camcc-sm8250.yaml          |    6 +-
 .../bindings/clock/qcom,dispcc-sc8280xp.yaml       |   97 +
 .../bindings/clock/qcom,dispcc-sm6125.yaml         |    9 +-
 .../bindings/clock/qcom,dispcc-sm6350.yaml         |    8 +-
 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |   14 +-
 .../bindings/clock/qcom,gcc-apq8064.yaml           |   18 +-
 .../bindings/clock/qcom,gcc-apq8084.yaml           |   10 +-
 .../bindings/clock/qcom,gcc-ipq8064.yaml           |   27 +-
 .../bindings/clock/qcom,gcc-ipq8074.yaml           |   40 +-
 .../bindings/clock/qcom,gcc-msm8660.yaml           |   12 +-
 .../bindings/clock/qcom,gcc-msm8909.yaml           |    9 +-
 .../bindings/clock/qcom,gcc-msm8916.yaml           |   16 +-
 .../bindings/clock/qcom,gcc-msm8974.yaml           |   61 +
 .../bindings/clock/qcom,gcc-msm8976.yaml           |    9 +-
 .../bindings/clock/qcom,gcc-msm8994.yaml           |    9 +-
 .../bindings/clock/qcom,gcc-msm8996.yaml           |    7 +-
 .../bindings/clock/qcom,gcc-msm8998.yaml           |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |   38 +-
 .../bindings/clock/qcom,gcc-qcm2290.yaml           |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-qcs404.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |    9 +-
 .../bindings/clock/qcom,gcc-sc8180x.yaml           |    9 +-
 .../bindings/clock/qcom,gcc-sc8280xp.yaml          |    7 +-
 .../devicetree/bindings/clock/qcom,gcc-sdm660.yaml |   61 +
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml  |    7 +-
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6115.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6125.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,gcc.yaml        |    6 +-
 .../bindings/clock/qcom,gpucc-sdm660.yaml          |    4 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml          |    9 +-
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   22 +-
 .../devicetree/bindings/clock/qcom,lcc.txt         |   22 -
 .../devicetree/bindings/clock/qcom,lcc.yaml        |   86 +
 .../devicetree/bindings/clock/qcom,lpasscc.txt     |   26 -
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |   42 +-
 .../bindings/clock/qcom,msm8998-gpucc.yaml         |    8 +-
 .../devicetree/bindings/clock/qcom,q6sstopcc.yaml  |    2 +-
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |    8 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sc7180-camcc.yaml          |    9 +-
 .../bindings/clock/qcom,sc7180-dispcc.yaml         |    8 +-
 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    |    9 +-
 .../devicetree/bindings/clock/qcom,sc7180-mss.yaml |    7 +-
 .../bindings/clock/qcom,sc7280-camcc.yaml          |    6 +-
 .../bindings/clock/qcom,sc7280-dispcc.yaml         |    8 +-
 .../bindings/clock/qcom,sc7280-lpasscc.yaml        |    9 +-
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |   12 +-
 .../bindings/clock/qcom,sdm845-camcc.yaml          |    8 +-
 .../bindings/clock/qcom,sdm845-dispcc.yaml         |    8 +-
 .../bindings/clock/qcom,sdm845-lpasscc.yaml        |   47 +
 .../bindings/clock/qcom,sm6115-dispcc.yaml         |    7 +-
 .../bindings/clock/qcom,sm6375-dispcc.yaml         |   54 +
 .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |    9 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    8 +-
 .../bindings/clock/qcom,sm8450-dispcc.yaml         |    7 +-
 .../devicetree/bindings/clock/qcom,sm8550-gcc.yaml |   62 +
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   20 +-
 drivers/clk/qcom/Kconfig                           |   26 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   16 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    5 +
 drivers/clk/qcom/clk-krait.c                       |    2 +
 drivers/clk/qcom/clk-rpm.c                         |  204 +-
 drivers/clk/qcom/clk-rpmh.c                        |  427 +--
 drivers/clk/qcom/dispcc-sc8280xp.c                 | 3218 +++++++++++++++++++
 drivers/clk/qcom/dispcc-sm6350.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm6375.c                   |  610 ++++
 drivers/clk/qcom/dispcc-sm8250.c                   |   38 +-
 drivers/clk/qcom/gcc-ipq4019.c                     |   11 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |    4 +-
 drivers/clk/qcom/gcc-ipq8074.c                     | 1795 +++++------
 drivers/clk/qcom/gcc-msm8939.c                     |   35 +
 drivers/clk/qcom/gcc-msm8974.c                     |  682 ++--
 drivers/clk/qcom/gcc-sm6125.c                      |    1 -
 drivers/clk/qcom/gcc-sm8250.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8550.c                      | 3387 ++++++++++++++++++++
 drivers/clk/qcom/gdsc.c                            |    3 +-
 drivers/clk/qcom/hfpll.c                           |    4 +-
 drivers/clk/qcom/kpss-xcc.c                        |   13 +-
 drivers/clk/qcom/krait-cc.c                        |  236 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |   55 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c              |   34 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |  736 ++---
 drivers/clk/qcom/reset.c                           |    4 +-
 drivers/clk/qcom/reset.h                           |    1 +
 include/dt-bindings/clock/qcom,dispcc-sc8280xp.h   |  100 +
 include/dt-bindings/clock/qcom,dispcc-sm8250.h     |    1 +
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   14 +
 include/dt-bindings/clock/qcom,sm6375-dispcc.h     |   42 +
 include/dt-bindings/clock/qcom,sm8550-gcc.h        |  231 ++
 102 files changed, 10579 insertions(+), 2523 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sc8280xp.c
 create mode 100644 drivers/clk/qcom/dispcc-sm6375.c
 create mode 100644 drivers/clk/qcom/gcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc8280xp.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-gcc.h
