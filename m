Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0E058631E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 05:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238804AbiHADh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Jul 2022 23:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbiHADh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Jul 2022 23:37:27 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C9E10FF0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Jul 2022 20:37:25 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so12266462fac.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Jul 2022 20:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=00Y0DbflVU90OW4m4aYliQw/wdIZoWX/fUBsNaFP7Qg=;
        b=nKfx4MeTzWDpm/ziU5af/N+lRJW9DO8cza4KCsJScIOop9j64txXaV+WI5timb1/4M
         Xl3dPx57Aq7dzy2S0CM8QGWs85MWbxXcagP3HfjhH5xmR0r7/qt3NctuK5EvAsV5St5i
         GHt6vX83jWnGkj9bnlt/8nSyVm6vt3ucPgK3fMhl262ZQcV38PgaU98/h4sRFsS2KS6x
         G7YGgrG04nauTelLLTi/fLHr/XcB7fLcKDxsMAwOGpR5+Yv0PlvhpwbnLcGSlCE6o7OX
         CGdwQqmz98X3899tIMNwB7QHwil7zHneh/AlubB6YKPv1JLP5x7WNCvL78waCZ2Qk21L
         dakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=00Y0DbflVU90OW4m4aYliQw/wdIZoWX/fUBsNaFP7Qg=;
        b=G8K33pU1XsVuSaUeMvTgdKjAQVGkrfk0HIr984j4k3Dv6+ncN1cF63+0lKP8a4jMDN
         l8ZBtVPJBdzepesz/07bbhyi4CmklqafS2WNXtKeedvMAdEBBKhD7kmjIIny8vAWixl8
         c8i3iBSbW3AIfW6lB+57J18uSw4luROJiiD4dvLTaEcFgZhis9Dj1Wb17qJZoi3jVt/h
         DATr0pqHHcgeeGSatl/J1el7gV4C3SxhaUSJgvmwjCXOoXvJKbHtTFqPCbR1LWrwQNQV
         +6Vw5zX21F+130cm6L/TX94VeKcZsLTyJAf66PpbJQDIaD4ewcKpYNJbc3Mxhr3nlQ8d
         7OXw==
X-Gm-Message-State: AJIora9Nft0UvCoRH/c04nspjVNk0+10d87ZYI1Tj+xCMjVkw5N1wzUA
        PORXEEqvhvMpHnUFZDVI3MoUXg==
X-Google-Smtp-Source: AA6agR7ndsKu+5PxxCxXOUTuD6/VUm4bl1W+/2R7OstjHzGhJ5Y2ooFtGvujNSlRDuBUy5umw7M0Vw==
X-Received: by 2002:a05:6870:8981:b0:10e:c416:ea30 with SMTP id f1-20020a056870898100b0010ec416ea30mr3256547oaq.94.1659325045196;
        Sun, 31 Jul 2022 20:37:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k9-20020a9d7dc9000000b0061cb109bfb0sm2543425otn.51.2022.07.31.20.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 20:37:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Nikita Travkin <nikita@trvn.ru>,
        Jonathan Marek <jonathan@marek.ca>,
        Robert Foss <robert.foss@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Li kunyu <kunyu@nfschina.com>,
        Ren Zhijie <renzhijie2@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm clock updates for v5.20
Date:   Sun, 31 Jul 2022 22:37:23 -0500
Message-Id: <20220801033723.707019-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-5.20

for you to fetch changes up to 5e1e12d2992006a4e950ebf2e2a1f0ebaabd969f:

  clk: qcom: gcc-msm8994: use parent_hws for gpll0/4 (2022-07-18 21:40:36 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v5.20

This introduces support for the camera clock controller in SM8450 and
the display and gpu clock controllers in SM8350.

Various fixes, new clocks and USB GDSCs are introduced for IPQ8074 and
for MSM8939 a series of fixes for issues introduced by inheriting the
MSM8916 GCC driver is introduced.

Support for a new type of voteable GDSCs are introduced and put in use
for the SC8280XP PCIe GDSCs. SC8280XP pipe clocks transitioned to the
new phy-mux implementation.

MSM8996 GCC, the RPM clock driver and some clocks in MSM8994 GCC are
transitioned to use parent_data.

The topology for Titan (camera) GDSCs on SDM845 and SM8250 are corrected
and MSM8916 gains more possible frequencies for its GP clocks.

The GCC and tsens handling on MSM8960 is reworked to mimic the design in
IPQ8074 and allow the GCC driver to probe earlier.

The regulator based mmcx supply for dispcc and videocc is dropped, as
the only upstream target that adapted this interface was transitioned
several kernel versions ago.

GDSCs found to be enabled at boot will now reflect in the enable count
of the supply, as was done with the regulator supplies previously.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: Drop mmcx gdsc supply for dispcc and videocc

Ansuel Smith (3):
      clk: qcom: clk-hfpll: use poll_timeout macro
      clk: qcom: clk-krait: unlock spin after mux completion
      clk: qcom: clk-krait: add apq/ipq8064 errata workaround

Bjorn Andersson (5):
      Merge tag '20220608105238.2973600-1-dmitry.baryshkov@linaro.org' into clk-for-5.20
      Merge branch '20220515210048.483898-8-robimarko@gmail.com' into clk-for-5.20
      Merge branch '20220701062622.2757831-2-vladimir.zapolskiy@linaro.org' into clk-for-5.20
      Merge branch '20220706154337.2026269-1-robert.foss@linaro.org' into clk-for-5.20
      clk: qcom: gdsc: Bump parent usage count when GDSC is found enabled

Bryan O'Donoghue (10):
      clk: qcom: gcc-msm8939: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
      clk: qcom: gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
      clk: qcom: gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
      clk: qcom: gcc-msm8939: Point MM peripherals to system_mm_noc clock
      clk: qcom: gcc-msm8939: Fix weird field spacing in ftbl_gcc_camss_cci_clk
      clk: qcom: gcc-msm8939: Add missing CAMSS CCI bus clock
      clk: qcom: gcc-msm8939: Fix venus0_vcodec0_clk frequency definitions
      clk: qcom: gcc-msm8939: Add missing CAMSS CPP clock frequencies
      clk: qcom: gcc-msm8939: Add missing MDSS MDP clock frequencies
      clk: qcom: gcc-msm8939: Add missing USB HS system clock frequencies

Christian Marangi (2):
      dt-bindings: clock: fix wrong clock documentation for qcom,rpmcc
      clk: qcom: clk-rpm: convert to parent_data API

Dmitry Baryshkov (11):
      clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: mmcc-msm8996: move clock parent tables down
      clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
      clk: qcom: regmap: add PHY clock source implementation
      clk: qcom: gcc-sm8450: use new clk_regmap_phy_mux_ops for PCIe pipe clocks
      clk: qcom: gcc-sc7280: use new clk_regmap_phy_mux_ops for PCIe pipe clocks
      dt-bindings: clock: qcom,gcc-apq8064: move msm8960 compat from gcc-other.yaml
      dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node
      clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
      dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
      clk: qcom: gcc-msm8994: use parent_hws for gpll0/4

Johan Hovold (4):
      clk: qcom: gdsc: add collapse-bit helper
      clk: qcom: gdsc: add support for collapse-vote registers
      clk: qcom: gcc-sc8280xp: use collapse-voting for PCIe GDSCs
      clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe

Jonathan Marek (2):
      dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
      clk: qcom: add support for SM8350 DISPCC

Krzysztof Kozlowski (1):
      dt-bindings: clock: qcom,gcc-sdm845: add parent power domain

Li kunyu (1):
      clk: qcom: gcc-sm6350: Drop extra semicolon

Nikita Travkin (3):
      clk: qcom: clk-rcg2: Fail Duty-Cycle configuration if MND divider is not enabled.
      clk: qcom: clk-rcg2: Make sure to not write d=0 to the NMD register
      clk: qcom: gcc-msm8916: Add rates to the GP clocks

Ren Zhijie (1):
      clk: qcom: fix build error initializer element is not constant

Robert Foss (2):
      dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
      clk: qcom: add support for SM8350 GPUCC

Robert Marko (10):
      clk: qcom: ipq8074: fix NSS core PLL-s
      clk: qcom: ipq8074: SW workaround for UBI32 PLL lock
      clk: qcom: ipq8074: fix NSS port frequency tables
      dt-bindings: clock: qcom: ipq8074: add PPE crypto clock
      clk: qcom: ipq8074: add PPE crypto clock
      clk: qcom: ipq8074: set BRANCH_HALT_DELAY flag for UBI clocks
      dt-bindings: clocks: qcom,gcc-ipq8074: support power domains
      dt-bindings: clock: qcom: ipq8074: add USB GDSCs
      clk: qcom: ipq8074: add USB GDSCs
      clk: qcom: ipq8074: dont disable gcc_sleep_clk_src

Stephen Boyd (1):
      clk: qcom: rpmh: Add note about sleep/wake state for BCMs

Vladimir Zapolskiy (9):
      clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
      clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
      clk: qcom: camcc-sm8250: Fix topology around titan_top power domain
      dt-bindings: clock: add QCOM SM8450 camera clock bindings
      clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
      clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
      clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
      clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
      clk: qcom: add camera clock controller driver for SM8450 SoC

 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |    6 +-
 .../bindings/clock/qcom,gcc-apq8064.yaml           |   40 +-
 .../bindings/clock/qcom,gcc-ipq8074.yaml           |    5 +
 .../bindings/clock/qcom,gcc-msm8996.yaml           |   16 +
 .../devicetree/bindings/clock/qcom,gcc-other.yaml  |    5 +-
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    3 +
 .../bindings/clock/qcom,gpucc-sm8350.yaml          |   72 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   85 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   80 +
 drivers/clk/qcom/Kconfig                           |   22 +-
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/camcc-sdm845.c                    |    4 +
 drivers/clk/qcom/camcc-sm8250.c                    |   16 +-
 drivers/clk/qcom/camcc-sm8450.c                    | 2856 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |  144 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   11 +-
 drivers/clk/qcom/clk-hfpll.c                       |   15 +-
 drivers/clk/qcom/clk-krait.c                       |   23 +-
 drivers/clk/qcom/clk-krait.h                       |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |   16 +-
 drivers/clk/qcom/clk-regmap-phy-mux.c              |   62 +
 drivers/clk/qcom/clk-regmap-phy-mux.h              |   33 +
 drivers/clk/qcom/clk-rpm.c                         |   24 +-
 drivers/clk/qcom/clk-rpmh.c                        |    5 +
 drivers/clk/qcom/dispcc-sm8250.c                   |   64 +-
 drivers/clk/qcom/gcc-ipq8074.c                     |  104 +-
 drivers/clk/qcom/gcc-msm8916.c                     |   35 +
 drivers/clk/qcom/gcc-msm8939.c                     |   47 +-
 drivers/clk/qcom/gcc-msm8960.c                     |    6 +-
 drivers/clk/qcom/gcc-msm8994.c                     |    8 +-
 drivers/clk/qcom/gcc-sc7280.c                      |   49 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |  142 +-
 drivers/clk/qcom/gcc-sm6350.c                      |    2 +-
 drivers/clk/qcom/gcc-sm8450.c                      |   49 +-
 drivers/clk/qcom/gdsc.c                            |   36 +-
 drivers/clk/qcom/gdsc.h                            |    4 +
 drivers/clk/qcom/gpucc-sm8350.c                    |  637 +++++
 drivers/clk/qcom/krait-cc.c                        |    8 +
 drivers/clk/qcom/mmcc-msm8996.c                    | 1052 ++++---
 drivers/clk/qcom/videocc-sm8250.c                  |    4 -
 include/dt-bindings/clock/qcom,dispcc-sm8350.h     |    1 +
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |    4 +
 include/dt-bindings/clock/qcom,gcc-msm8939.h       |    1 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h      |   52 +
 include/dt-bindings/clock/qcom,sm8450-camcc.h      |  159 ++
 45 files changed, 5368 insertions(+), 643 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 drivers/clk/qcom/clk-regmap-phy-mux.c
 create mode 100644 drivers/clk/qcom/clk-regmap-phy-mux.h
 create mode 100644 drivers/clk/qcom/gpucc-sm8350.c
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h
