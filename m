Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603FE573DDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 22:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbiGMUjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 16:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbiGMUjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 16:39:44 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0747821E3E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 13:39:42 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-10c0430e27dso28032fac.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 13:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=29aAiIwmkew/Ek2Wtg7xz5gBfQWv2QrRJ7p3wDI2/ec=;
        b=CqqRiRWGySf34KOAsNNTK7g6+ekF8kUaIth+4eaOEL/7/KEch1+0qKjr6hI/uaK7Dg
         JMXdUw+dSHJ+8VgBqFxBxnITaAE5Z5DMifDW+dIeVT6rHyonpWHgcnzD48x6j9ja0PAK
         nX54iVWqTdtndICtxCbry4RA8/LvcQWbokxUTuNlXaWjCyseNAGxABcSLjlF23cV+OSd
         SnpfWeeaaEwAfr1QreJUiQ6CTnvWtnhBrPyaHhncE+rzpLmc5Mmk8UgdIcbXmncgdd/t
         MUIvPfYYr5Nz0244dwbQnMDwTrqYNwu7xrCWJhi6RkfBARVo2LTeRgE6EvionFYRyaRO
         s0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=29aAiIwmkew/Ek2Wtg7xz5gBfQWv2QrRJ7p3wDI2/ec=;
        b=kUNZgmeOLX2yayI0RAGT5LxYsqM6ZJFP03GxrPIIyly0ex57BWmaYPwvsMGsqMh5GE
         m62BMF+TklpLC1+0VvPmcK5QUNsB5+THJAPRKYeRNOlg4IlAq04FOMESgTmmqs8FGMTG
         UadSlsE0+lMtTZrZW/zy604Wdsp+giZPB9ukcLCE2TJSBhDz4Yzl2dAub1Oo03UcFRSD
         iIT4KAck2JIylrynElSwr7fJGDJakcM4J9r2RCUoQRjhmt/+3oUhnC2lyD4Xtb8EmbUk
         LLhg2wlgNWBHGKpqEnLmzMIwCqwcNhYyQ50bqIUCtq28RrD37A7soyy0hiQsPYMA+98Z
         sqUQ==
X-Gm-Message-State: AJIora9k8nBBSHUrHXBLX8ldHmkuDKZhsU+KjxJFhTiTdULMG8ZelQCd
        iTjEQKJnxxuKpQWu+dmRm9JgpQ==
X-Google-Smtp-Source: AGRyM1t07iFOfQ2M6pF68aRoZ1I/XkWd1+kPjpZR/etVczddnn7CD31mV0PBCREei6GGqKmMVDcbNQ==
X-Received: by 2002:a05:6870:4284:b0:101:202e:a78d with SMTP id y4-20020a056870428400b00101202ea78dmr5654055oah.37.1657744781167;
        Wed, 13 Jul 2022 13:39:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g25-20020a544f99000000b0032f75714af1sm5760370oiy.18.2022.07.13.13.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:39:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Robert Marko <robimarko@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Alec Su <ae40515@yahoo.com.tw>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Dang Huynh <danct12@riseup.net>,
        Dylan Van Assche <me@dylanvanassche.be>,
        Emma Anholt <emma@anholt.net>,
        Gwendal Grignou <gwendal@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Lin Meng-Bo <linmengbo0689@protonmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Markuss Broks <markuss.broks@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [GIT PULL] Qualcomm ARM64 DTS updates for v5.20
Date:   Wed, 13 Jul 2022 15:39:39 -0500
Message-Id: <20220713203939.1431054-1-bjorn.andersson@linaro.org>
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

The following changes since commit 5fb779558f1c97e2bf2794cb59553e569c38e2f9:

  arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo (2022-06-27 15:09:32 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.20

for you to fetch changes up to abf61f7e66c15e00f40ca7e10367f4149639bc57:

  arm64: dts: qcom: sc8280xp: fix DP PHY node unit addresses (2022-07-08 17:03:03 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS updates for v5.20

This introduces initial support for Lenovo ThinkPad X13s, Qualcomm 8cx
Gen 3 Compute Reference Device, SA8295P Automotive Development Platform,
Xiaomi Mi 5s Plus, five new SC7180 Chrome OS boards, Inforce IFC6560, LG
G7 ThinQ and LG V35 ThinQ.

With IPQ8074 gaining GDSC support, this was expressed in the gcc node
and defined for the USB nodes. The SDHCI reset line was defined to get
the storage devices into a known state.

For MSM8996 interconnect providers, the second DSI interface, resets for
SDHCI are introduced. Support for the Xiaomi Mi 5s Plus is introduced
and the Dragonboard 820c gains definitions for its LEDs.

The MSM8998 platform changes consists of a various cleanup patches, the
FxTec Pro1 is split out from using the MTP dts and Sony Xperia devices
on the "Yoshino" platform gains ToF sensor.

On SC7180 five new Trogdor based boards are added and the description of
keyboard and detachables is improved.

On the SC7280-based Herobrine board DisplayPort is enabled, SPI flash
clock rate is changed, WiFi is enabled and the modem firmware path is
updated. The Villager boards gains touchscreen, and keyboard backlight.

This introduces initial support for the SC8280XP (aka 8cx Gen 3) and
related automotive platforms are introduced, with support for the
Qualcomm reference board, the Lenovo Thinkpad X13s and the SA8295P
Automotive Development Platform.

In addition to a wide range of smaller fixes on the SDM630 and SDM660
platforms, support for the secondary high speed USB controller is
introduced and the Sony Xperia "Nile" platform gains support for the RGB
status LED. Support for the Inforce IFC6560 board is introduced.

On SDM845 the bandwidth monitor for the CPU subsystem is introduced, to
scale LLCC clock rate based on profiling. CPU and cluster idle states
are switched to OSI hierarchical states. DB845c and SHIFT 6mq gains LED
support and new support for the LG G7 ThinQ and LG V35 ThinQ boards are
added.

DLL/DDR configuration for SDHCI nodes are defined for SM6125.

On SM8250 the GPU per-process page tables is enabled and for RB5 the
Light Pulse Generator-based LEDs are added.

The display clock controller is introduced for SM8350.

On SM8450 this introduces the camera clock controller and the UART
typically used for Bluetooth. The interconnect path for the crypto
engine is added to the SCM node, to ensure this is adequately clocked.

The assigned-clock-rate for the display processor is dropped from
several platforms, now that the driver derrives the min and max from the
clock.

In addition to this a wide range of fixes for stylistic issues and
issues discovered through Devicetree binding validation across many
platforms and boards are introduced.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI

Alec Su (2):
      dt-bindings: arm: qcom: Document xiaomi,natrium board
      arm64: dts: qcom: msm8996-xiaomi-natrium: Add support for Xiaomi Mi 5s Plus

Andrey Konovalov (1):
      arm64: dts: qcom: qcs404: fix default pinctrl settings for blsp1_spi1

Anton Bambura (1):
      arm64: dts: qcom: add device tree for LG G7 and LG V35

Bhupesh Sharma (5):
      arm64: dts: qcom: Fix sdhci node names - use 'mmc@'
      arm64: dts: qcom: sdm630: Fix 'interconnect-names' for sdhci nodes
      arm64: dts: qcom: Fix ordering of 'clocks' & 'clock-names' for sdhci nodes
      arm64: dts: qcom: Fix 'reg-names' for sdhci nodes
      arm64: dts: qcom: Remove unused 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties

Bjorn Andersson (13):
      dt-bindings: arm: qcom: Document additional sc8280xp devices
      dt-bindings: mailbox: qcom-ipcc: Add NSP1 client
      arm64: dts: qcom: add SC8280XP platform
      arm64: dts: qcom: sc8280xp: Add reference device
      arm64: dts: qcom: add SA8540P and ADP
      Merge branch '20220515210048.483898-8-robimarko@gmail.com' into arm64-for-5.20
      Merge tag 'qcom-arm64-fixes-for-5.19' into arm64-for-5.20
      Merge branch '20220701062622.2757831-2-vladimir.zapolskiy@linaro.org' into arm64-for-5.20
      Merge branch '20220706154337.2026269-1-robert.foss@linaro.org' into arm64-for-5.20
      arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998
      arm64: dts: qcom: sdm845: Enable user LEDs on DB845c
      arm64: dts: qcom: pmi8994: Define MPP block
      arm64: dts: qcom: db820c: Add user LEDs

Bryan O'Donoghue (2):
      arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
      arm64: dts: qcom: sdm845: Add camss vdda-pll-supply

Dang Huynh (1):
      arm64: dts: qcom: sdm660-xiaomi-lavender: Configure WLED

David Heidelberg (2):
      arm64: dts: qcom: timer should use only 32-bit size
      arm64: dts: qcom: extend scm compatible strings

Dmitry Baryshkov (26):
      arm64: dts: qcom: sm8450: add uart20 node
      arm64: dts: qcom: msm8996: add clocks to the MMCC device node
      arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy by default
      arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
      arm64: dts: qcom: sdm630: disable GPU by default
      arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
      arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
      arm64: dts: qcom: sdm630: add second (HS) USB host support
      arm64: dts: qcom: sdm630: fix gpu's interconnect path
      arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
      arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board files
      dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
      arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
      arm64: dts: qcom: pm8150b: add Light Pulse Generator device node
      arm64: dts: qcom: pm8150l: add Light Pulse Generator device node
      arm64: dts: qcom: qrb5165-rb5: declare tri-led user leds
      arm64: dts: qcom: msm8996: drop phy-names from HDMI device node
      arm64: dts: qcom: add mdp_clk clock to the MDSS device
      arm64: dts: qcom: msm8996: add second DSI interface
      arm64: dts: qcom: msm8916: add xo clocks to rpmcc and a53pll
      arm64: dts: qcom: msm8996: correct #clock-cells for QMP PHY nodes
      arm64: dts: qcom: msm8996: add GCC's optional clock sources
      arm64: dts: qcom: msm8996: add xo clock source to rpmcc
      arm64: dts: qcom: msm8996: add missing DSI clock assignments
      arm64: dts: qcom: sc7280: use constants for gpucc clocks and power-domains
      arm64: dts: qcom: sc7180-idp: add vdds supply to the DSI PHY

Douglas Anderson (9):
      arm64: dts: qcom: sc7280: Add touchscreen to villager
      dt-bindings: Document how Chromebooks with depthcharge boot
      dt-bindings: arm: qcom: Mention that Chromebooks use a different scheme
      dt-bindings: arm: qcom: Add sc7180 Chromebook board bindings
      dt-bindings: arm: qcom: Add / fix sc7280 board bindings
      dt-bindings: arm: qcom: Add more sc7180 Chromebook board bindings
      arm64: qcom: sc7280-herobrine: Enable DP
      arm64: dts: qcom: sc7280: Set SPI flash to 50 MHz for herobrine boards
      Revert "arm64: dts: qcom: Fix 'reg-names' for sdhci nodes"

Dylan Van Assche (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable pmi9889 LPG LED

Emma Anholt (1):
      arm64: dts: qcom: sm8250: Enable per-process page tables.

Gwendal Grignou (1):
      arm64: dts: qcom: sc7280: Rename sar sensor labels

Johan Hovold (16):
      arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree
      arm64: dts: qcom: sc7280: drop PCIe PHY clock index
      arm64: dts: qcom: sm8250: add missing PCIe PHY clock-cells
      arm64: dts: qcom: ipq6018: drop USB PHY clock index
      arm64: dts: qcom: ipq8074: drop USB PHY clock index
      arm64: dts: qcom: msm8998: drop USB PHY clock index
      arm64: dts: qcom: sm8350: drop USB PHY clock index
      arm64: dts: qcom: sm8450: drop USB PHY clock index
      arm64: dts: qcom: sc8280xp: drop UFS PHY clock-cells
      arm64: dts: qcom: sm8250: drop UFS PHY clock-cells
      arm64: dts: qcom: sm8450: drop UFS PHY clock-cells
      arm64: dts: qcom: msm8996: use non-empty ranges for PCIe PHYs
      arm64: dts: qcom: msm8996: clean up PCIe PHY node
      arm64: dts: qcom: sc7280: fix PCIe clock reference
      arm64: dts: qcom: sc8280xp: fix usb_0 HS PHY ref clock
      arm64: dts: qcom: sc8280xp: fix DP PHY node unit addresses

Jonathan Marek (1):
      dt-bindings: clock: Add Qcom SM8350 DISPCC bindings

Joseph S. Barrera III (5):
      arm64: dts: qcom: sc7180: Add wormdingler dts files
      arm64: dts: qcom: sc7180: Add quackingstick dts files
      arm64: dts: qcom: sc7180: Add mrbland dts files
      arm64: dts: qcom: sc7180: Add pazquel dts files
      arm64: dts: qcom: sc7180: Add kingoftown dts files

Konrad Dybcio (17):
      arm64: dts: qcom: msm8998*: Fix TLMM and pin nodes
      arm64: dts: qcom: msm8998-clamshell: Clean up the DT
      arm64: dts: qcom: msm8998-laptops: Clean up DTs
      arm64: dts: qcom: msm8998-yoshino-lilac: Disable LVS1
      arm64: dts: qcom: msm8998-yoshino: Add USB extcon
      arm64: dts: qcom: msm8998-yoshino: Remove simple-bus compatible from clocks{}
      arm64: dts: qcom: msm8998-yoshino/oneplus: Use pm8005_regulators label
      arm64: dts: qcom: msm8998-oneplus: Apply style fixes
      arm64: dts: qcom: msm8998-fxtec: Use "okay" instead of "ok"
      arm64: dts: qcom: msm8998*: Keep MMCC & MMSS_SMMU enabled by default
      arm64: dts: qcom: msm8998-oneplus: Add clocks & GDSC to simplefb
      arm64: dts: qcom: msm8998*: Clean up #includes
      arm64: dts: qcom: msm8998-fxtec: Decouple from 8998 MTP
      arm64: dts: qcom: msm8998-mtp: Merge and fix up the DT
      arm64: dts: qcom: msm8996-tone: Drop cont_splash_mem region
      arm64: dts: qcom: msm8996-tone: Rule out PM(I)8994 variants
      arm64: dts: qcom: msm8996: Add SDHCI resets

Krzysztof Kozlowski (38):
      arm64: dts: qcom: align OPP table names with DT schema
      arm64: dts: qcom: align PMIC GPIO pin configuration with DT schema
      arm64: dts: qcom: add fallback compatible to PMIC GPIOs
      arm64: dts: qcom: apq8096-db820c: add PM8994 pin function
      arm64: dts: qcom: msm8994-msft-lumia-octagon: add PM8994 pin properties
      arm64: dts: qcom: sdm630: order clocks according to bindings
      arm64: dts: qcom: sdm630: order regs according to bindings
      arm64: dts: qcom: sdm630: order interrupts according to bindings
      arm64: dts: qcom: add missing gpio-ranges in PMIC GPIOs
      arm64: dts: qcom: correct interrupt controller on PM8916 and PMS405
      arm64: dts: qcom: add missing AOSS QMP compatible fallback
      arm64: dts: qcom: correct SPMI WLED register range encoding
      arm64: dts: qcom: use dedicated QFPROM compatibles
      arm64: dts: qcom: sdm630: correct QFPROM byte offsets
      arm64: dts: qcom: ipq6018-cp01-c1: fix Micron SPI NOR compatible
      arm64: dts: qcom: msm8998-mtp: correct board compatible
      arm64: dts: qcom: adjust whitespace around '='
      arm64: dts: qcom: align gpio-key node names with dtschema
      arm64: dts: qcom: correct gpio-keys properties
      arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
      arm64: dts: qcom: align led node names with dtschema
      arm64: dts: qcom: ipq6018: add label to remoteproc node
      arm64: dts: qcom: sdm630: remove unneeded address/size cells in glink-edge
      arm64: dts: qcom: sm8350: remove duplicated glink-edge interrupt
      arm64: dts: qcom: sm8450: remove duplicated glink-edge interrupt
      arm64: dts: qcom: apq8016-sbc: add function and color to LED nodes
      arm64: dts: qcom: qrb5165-rb5: add function and color to LED nodes
      arm64: dts: qcom: sc7180-trogdor: add function to LED node
      arm64: dts: qcom: sc7280-herobrine: add function to LED node
      arm64: dts: qcom: sdm845-db845c: add function and color to LED nodes
      arm64: dts: qcom: use generic sram as name for imem and ocmem nodes
      arm64: dts: qcom: qcs404: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: sc7180: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: sc7280: add simple-mfd to IMEM
      arm64: dts: qcom: sdm630: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: sdm845: add dedicated IMEM and syscon compatibles
      arm64: dts: qcom: msm8994: add required ranges to OCMEM
      arm64: dts: qcom: sdm845: Add CPU BWMON

Kuogee Hsieh (1):
      arm64: dta: qcom: sc7180: delete vdda-1p2 and vdda-0p9 from mdss_dp

Lin, Meng-Bo (1):
      arm64: dts: qcom: msm8916-samsung-a2015: Add touchscreen pinctrl

Luca Weiss (2):
      arm64: dts: qcom: sdm845*: replace i2s reg with constant
      arm64: dts: qcom: sm8250: use constants for audio clocks

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sm8450: Fix the IRQ trigger type for remoteproc nodes

Marijn Suijten (6):
      arm64: dts: qcom: sdm845-akatsuki: Round down l22a regulator voltage
      arm64: dts: qcom: pm660l: Add LPG node
      arm64: dts: qcom: sdm630-nile: Add RGB status LED on the PM660L LPG
      arm64: dts: qcom: sm6125: Move sdc2 pinctrl from seine-pdx201 to sm6125
      arm64: dts: qcom: sm6125: Append -state suffix to pinctrl nodes
      arm64: dts: qcom: sm6125: Add DLL/DDR configuration on SDHCI 1/2

Markuss Broks (1):
      arm64: dts: qcom: msm8998-xperia: Introduce ToF sensor support

Matthias Kaehlcke (4):
      arm64: dts: qcom: sc7280: herobrine: Don't disable the keyboard backlight node
      arm64: dts: qcom: sc7280: Enable keyboard backlight for villager
      arm64: dts: qcom: sc7280: Enable wifi for Chrome OS boards
      arm64: dts: qcom: sc7280: Set modem FW path for Chrome OS boards

Mauro Carvalho Chehab (1):
      docs: arm: index.rst: add google/chromebook-boot-flow

Robert Foss (3):
      dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
      arm64: dts: qcom: sm8350: Add DISPCC node
      arm64: dts: qcom: sm8350: Replace integers with rpmpd defines

Robert Marko (6):
      dt-bindings: clock: qcom: ipq8074: add USB GDSCs
      arm64: dts: qcom: ipq8074: add USB power domains
      arm64: dts: qcom: ipq6018: correct QUP peripheral labels
      arm64: dts: qcom: ipq8074: fix NAND node name
      arm64: dts: qcom: ipq8074: move ARMv8 timer out of SoC node
      arm64: dts: qcom: ipq8074: add reset to SDHCI

Sibi Sankar (2):
      arm64: dts: qcom: sm8450: Add interconnect requirements for SCM
      arm64: dts: qcom: sc7280: Add proxy interconnect requirements for modem

Sireesh Kodali (1):
      arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node

Srinivasa Rao Mandadapu (5):
      arm64: dts: qcom: sc7280: Add pinmux for I2S speaker and Headset
      arm64: dts: qcom: sc7280: Add secondary MI2S pinmux specifications for CRD 3.0/3.1
      arm64: dts: qcom: sc7280: add lpass lpi pin controller node
      arm64: dts: qcom: sc7280-herobrine: Add lpi pinmux properties for CRD 3.0/3.1
      arm64: dts: qcom: sc7280-qcard: Add ldo_l17b regulator node

Stephen Boyd (2):
      arm64: dts: qcom: sc7180: Remove ipa_fw_mem node on trogdor
      arm64: dts: qcom: sc7180-trogdor: Split out keyboard node and describe detachables

Vinod Koul (3):
      arm64: dts: qcom: sm8450: rename interconnect nodes
      arm64: dts: qcom: sm8350: Move qup-opp-tables out of soc node
      arm64: dts: qcom: sm8250: Move qup-opp-table out of soc node

Vinod Polimera (4):
      arm64: dts: qcom: sm7280: remove assigned-clock-rate property for mdp clk
      arm64: dts: qcom: sm7180: remove assigned-clock-rate property for mdp clk
      arm64: dts: qcom: sdm845: remove assigned-clock-rate property for mdp clk
      arm64: dts: qcom: sm8250: remove assigned-clock-rate property for mdp clk

Vladimir Zapolskiy (3):
      arm64: dts: qcom: sm8250: Disable camcc by default
      dt-bindings: clock: add QCOM SM8450 camera clock bindings
      arm64: dts: qcom: sm8450: Add description of camera clock controller

Yassine Oudjana (1):
      arm64: dts: qcom: msm8996: Add interconnect support

 Documentation/arm/google/chromebook-boot-flow.rst  |   69 +
 Documentation/arm/index.rst                        |    2 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |  330 ++-
 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |    6 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml          |   72 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   80 +
 arch/arm64/boot/dts/qcom/Makefile                  |   28 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   36 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |   91 +-
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    6 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   41 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   42 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |    2 +-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |    4 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |    2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |    2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |    2 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   16 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |    8 -
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |    8 -
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    4 +-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |    6 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |    2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   28 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    6 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   29 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |   12 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   21 +-
 .../qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts |   11 -
 .../msm8996-pmi8996-sony-xperia-tone-kagura.dts    |   11 -
 .../msm8996-pmi8996-sony-xperia-tone-keyaki.dts    |   11 -
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   77 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |   14 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    4 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dts |  414 ++++
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  297 ++-
 .../boot/dts/qcom/msm8998-asus-novago-tp370ql.dts  |   23 +-
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |  138 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |  460 ++++-
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts    |    9 +-
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    9 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |  443 +++-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |  421 ----
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |    2 +-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |   88 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts |    4 +
 .../dts/qcom/msm8998-sony-xperia-yoshino-maple.dts |    2 +-
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  120 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   87 +-
 arch/arm64/boot/dts/qcom/pm6350.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |    2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/pm8005.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/pm8009.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   14 +-
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   17 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   10 +
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |   22 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi               |   17 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |    4 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   35 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   44 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  389 ++++
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |  133 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    5 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    4 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    6 +
 .../boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts |   44 +
 .../boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts |   17 +
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi   |  225 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    1 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts   |   22 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts   |   22 +
 .../boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |   53 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts   |   22 +
 .../dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts   |   24 +
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi      |  350 ++++
 .../dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts |   22 +
 .../dts/qcom/sc7180-trogdor-pazquel-lte-ti.dts     |   22 +
 .../dts/qcom/sc7180-trogdor-pazquel-parade.dts     |   17 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel-ti.dts    |   17 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi      |  222 ++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    2 +
 .../qcom/sc7180-trogdor-quackingstick-r0-lte.dts   |   38 +
 .../dts/qcom/sc7180-trogdor-quackingstick-r0.dts   |   26 +
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |  324 +++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    2 +
 .../qcom/sc7180-trogdor-wormdingler-rev0-boe.dts   |   22 +
 .../qcom/sc7180-trogdor-wormdingler-rev0-inx.dts   |   22 +
 .../dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi  |   53 +
 ...sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts |   29 +
 .../qcom/sc7180-trogdor-wormdingler-rev1-boe.dts   |   28 +
 ...sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts |   29 +
 .../qcom/sc7180-trogdor-wormdingler-rev1-inx.dts   |   22 +
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  412 ++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   75 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   16 +
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   |   20 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  |   73 +
 .../dts/qcom/sc7280-herobrine-herobrine-r1.dts     |   11 +
 .../boot/dts/qcom/sc7280-herobrine-villager-r0.dts |   29 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   22 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   91 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |   11 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  241 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  427 ++++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  386 ++++
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |  109 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 2139 ++++++++++++++++++++
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  461 +++++
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   61 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  332 +--
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |    2 +-
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |    2 +-
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |   28 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |    5 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  136 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   62 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |  614 ++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |   68 +
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |   44 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   35 +-
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |    5 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |    8 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  241 ++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   10 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |    4 +-
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |   40 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   40 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   30 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    4 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    4 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    4 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   36 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    4 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  110 +-
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |    2 -
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |    2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  148 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    2 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   76 +-
 include/dt-bindings/clock/qcom,dispcc-sm8350.h     |    1 +
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |    3 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h      |   52 +
 include/dt-bindings/clock/qcom,sm8450-camcc.h      |  159 ++
 include/dt-bindings/mailbox/qcom-ipcc.h            |    1 +
 161 files changed, 11348 insertions(+), 1619 deletions(-)
 create mode 100644 Documentation/arm/google/chromebook-boot-flow.rst
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-natrium.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8295p-adp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8540p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h
