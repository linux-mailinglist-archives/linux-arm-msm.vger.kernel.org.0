Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E5D4C8369
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 06:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiCAFkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 00:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiCAFkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 00:40:13 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4016633A00
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 21:39:32 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id j3-20020a9d7683000000b005aeed94f4e9so11366593otl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 21:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HDw+v9DU5PXdFMUf7j6xdECrrKq8QdoO+qhtlEV7bHM=;
        b=o1AEDRWYDqypcBoY+Bw2oMhpN4XHfjUwxFMslEyrsPypnyk9i3k65fXcSI/pvuHouY
         61MPv91fverZYxhxh1TEcCTRum3eF2glwBd5ijr/JzvctBkJTIAh6Y2Rw7Mnk8KyDHJD
         bPKM4YQsza70D8LDNa0mlvblUN6aiC/5mh8lzepoh5kD9bqrivGv6GX3ISqIMLL9rzfl
         o0fhOV6d6CDmypqkHetSXlmbNcqiN3BR9+PcxqCq7gsHuKYWxelImsSlG3/pYQ26cKP3
         71CaKNHFbEXWf42lYjQyLs0QPCekLRB4Y+7zz0Y4aTa7siUNxYgOKnAcrPRmyYgmdV0W
         vGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HDw+v9DU5PXdFMUf7j6xdECrrKq8QdoO+qhtlEV7bHM=;
        b=jz4j5yMWVGSDDydpMh/qcsXJkydZdAURtz4UFopKDXeUIjoseQVMDizA3hRE0Qh7zD
         6xIUJmLu/8kX0Dwh3bLP8Y/pFgreaDgNFWWNdaMrnvHMFFEz41Z3KNlnhyKPBroikMBQ
         1me3WAK4n60geGbRTfvWmM/llkMaSCnxbMmwqWYCvZ5dhwvE0PPiFTkARb6e/RiOA3Fn
         BcVImDaJWFhzslL5lqhRrvmICKJRivoEQW7lUNLF2PyLKmyfMElAlT0m+U3i8CcQcoWl
         5o0z2ZViDejvsF1qvdLup5qOEFS1A4DSRnNZxvqIoH6fG8cq3syu6ykUye3SfVSe9IWU
         jWQw==
X-Gm-Message-State: AOAM531bkhF6//ixtI2axpq/cv64eDvFrdItbNi12sAyjd4rkcJF22lN
        hGufsjtuWG7I7BMD9SG59aBvSQ==
X-Google-Smtp-Source: ABdhPJwnxsCAn3g57kRt/EQ/bUYjAS+saKtNoawjvOPVa4ZnsI7aRFYCupgQ2ScRnUh+15eLGNAL4Q==
X-Received: by 2002:a9d:452:0:b0:5a3:8357:f43 with SMTP id 76-20020a9d0452000000b005a383570f43mr11213560otc.319.1646113171358;
        Mon, 28 Feb 2022 21:39:31 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id a4-20020a9d6e84000000b005afe328af91sm4556541otr.54.2022.02.28.21.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 21:39:30 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Douglas Anderson <dianders@chromium.org>,
        David Heidelberg <david@ixit.cz>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Felipe Balbi <felipe.balbi@microsoft.com>,
        Jean THOMAS <virgule@jeanthomas.me>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Robert Foss <robert.foss@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Baruch Siach <baruch.siach@siklu.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Caleb Connolly <caleb@connolly.tech>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Xilin Wu <wuxilin123@gmail.com>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v5.18
Date:   Mon, 28 Feb 2022 23:39:29 -0600
Message-Id: <20220301053929.1809684-1-bjorn.andersson@linaro.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.18

for you to fetch changes up to 308b26cddb04afc7776de1cbbe07172eeccc7c98:

  arm64: dts: qcom: sdm632: Add device tree for Fairphone 3 (2022-02-24 14:08:37 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree updates for v5.18

New platforms: Snapdragon 625 and Snapdragon 632
New boards: Google Herobrine R1, Fairphone FP3, SHIFT6mq, Samsung Galaxy
Book2 and Snapdragon 8 Gen 1 Hardware Development Kit (HDK)

On IPQ6018 the USB reference period is corrected, GICv2m support is
enabled and the max-link-speed for PCIe is specified.

IPQ8074 adds description of GIVv2m and SMEM, and ensures that TrustZone
related memory is reserved from Linux.

On the Snapdragon 7c Gen 3 (SC7280) description of display, displayport,
L3 interconnect, bluetooth, CPU opp-tables are added. Another revision
of the Google Herobrine is introduced and a bunch of cleanups are
introduced.

On Snapdragon 845 new support for the SHIFT6mq device is introduced, the
OnePlus devices gains fuel gauge and the platform gains GSI DMA support,
which is enabled for SPI (for now).

On the Snapdragon 850 based WindowsOnSnapdragon laptops, initial support
for Samsugn Galaxy Book2 is introduced and the Lenovo Yoga C630 gains
description of its backlight controls.

The Snapdragon 625 platform (MSM8953) the thereof derrived Snapdragon
632 platform is introduced, with initial description of the Fairphone 3.

Fairphone 4 on the SM7225 platform gains proper WLED configuration.

On Snapdragon 855 (SM8150) description of the limits hardware (LMh) is
introduced and the SPI and I2C devices are wired to the GSI DMA controller.

On Snapdragon 865 (SM8250) the CPU and cluster idle states are
introduced, the MSI interrupts for PCIe 1 and 2 are corrected and the
CPUfreq driver gains knowledge about thermal pressure interrupts.

On Snapdragon 8 Gen 1 (SM8450) LLCC, interconnect and remoteproc
descriptions are added. The SM8450 Hardware Development Kit is
introduced and the QRD has its remoteproc instances enabled.

Cluster idle and RPMh parameters are corrected on SM8150, SM8350 and
SM8540.

The IPA device on SC7180, SC7280 and SM8350 gains knowledge of the AOSS
QMP mailbox, allowing it to enable retention of IPA registers during
power collapse.

DeviceTree validation issues related to thermal zone naming, missing
CPU, device and platform compatibles, APR, Google EC PWM, DB410c sound,
QCS404 opp-tables and SM8250 PCIe nodes are corrected.

A bunch of cleanups and style fixes for MSM8992, MSM8994, MSM8996 and
MSM8916 are introduced as well.

----------------------------------------------------------------
Alex Elder (1):
      arm64: dts: qcom: add IPA qcom,qmp property

Alexander Martinz (1):
      arm64: dts: qcom: sdm845: add device tree for SHIFT6mq

Balakrishna Godavarthi (1):
      arm64: dts: qcom: sc7280: Add bluetooth node on SC7280 IDP boards

Baruch Siach (2):
      arm64: dts: qcom: ipq6018: add pcie max-link-speed
      arm64: dts: qcom: ipq6018: fix usb reference period

Bjorn Andersson (4):
      arm64: dts: qcom: sm8450: Add remoteproc enablers and instances
      arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances
      arm64: dts: qcom: c630: Add backlight controller
      arm64: dts: qcom: c630: Move panel to aux-bus

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge

David Heidelberg (9):
      arm64: dts: qcom: msm8996: use standartized naming for spmi node
      arm64: dts: qcom: sdm845: fix microphone bias properties and values
      arm64: dts: qcom: update qcom,domain property
      arm64: dts: qcom: fix thermal zones naming
      arm64: dts: qcom: sdm845: rename memory@ nodes to more descriptive names
      arm64: dts: qcom: msm8996: qcom,controlled-remotely is boolean
      arm64: dts: qcom: sdm845: add missing power-controller compatible
      arm64: dts: qcom: pms405: assign device specific compatible
      arm64: dts: qcom: msm8916: improve usb hs node formating

Dmitry Baryshkov (4):
      arm64: dts: qcom: sm8250: fix PCIe bindings to follow schema
      arm64: dts: qcom: sdm845: add bi_tcxo to camcc
      arm64: dts: qcom: msm8996: add cxo and sleep-clk to gcc node
      arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1

Douglas Anderson (15):
      arm64: dts: qcom: sc7280: Fix gmu unit address
      arm64: dts: qcom: sc7280: Move herobrine-r0 to its own dts
      arm64: dts: qcom: sc7280: Factor out Chrome common fragment
      arm64: dts: qcom: sc7280: Factor gpio.h include to sc7280.dtsi
      arm64: dts: qcom: sc7180-trogdor: Add "-regulator" suffix to pp3300_hub
      arm64: dts: qcom: sc7280-herobrine: Consistently add "-regulator" suffix
      arm64: dts: qcom: sc7280: Properly sort sdc pinctrl lines
      arm64: dts: qcom: sc7280: Clean up sdc1 / sdc2 pinctrl
      arm64: dts: qcom: sc7280-idp: No need for "input-enable" on sw_ctrl
      arm64: dts: qcom: sc7280: Fix sort order of dp_hot_plug_det / pcie1_clkreq_n
      arm64: dts: qcom: sc7280: Add edp_out port and HPD lines
      arm64: dts: qcom: sc7280: Move pcie1_clkreq pull / drive str to boards
      arm64: dts: qcom: sc7280: Move dp_hot_plug_det pull from SoC dtsi file
      arm64: dts: qcom: sc7280: Add a blank line in the dp node
      arm64: dts: qcom: sc7280: Add herobrine-r1

Felipe Balbi (2):
      arm64: dts: qcom: sm8150: add i2c and spi dma channels
      arm64: dts: qcom: sm8150: simplify references to pwrkey and resin

Jean THOMAS (2):
      arm64: dts: qcom: msm8992-lg-bullhead: Place LG Bullhead generic code into a DTSI file
      arm64: dts: qcom: msm8992-lg-bullhead: Add support for LG Bullhead rev 1.0

Kathiravan T (5):
      arm64: dts: qcom: ipq8074: add the reserved-memory node
      arm64: dts: qcom: ipq8074: enable the GICv2m support
      arm64: dts: qcom: ipq6018: enable the GICv2m support
      arm64: dts: qcom: ipq8074: drop the clock-frequency property
      arm64: dts: qcom: ipq6018: drop the clock-frequency property

Krishna Manikandan (1):
      arm64: dts: qcom: sc7280: add display dt nodes

Krzysztof Kozlowski (1):
      arm64: dts: qcom: align Google CROS EC PWM node name with dtschema

Kuogee Hsieh (1):
      arm64: dts: qcom: sc7280: Add Display Port node

Luca Weiss (5):
      arm64: dts: qcom: pm6150l: Add wled node
      arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED
      dt-bindings: arm: cpus: Add Kryo 250 CPUs
      dt-bindings: arm: qcom: Document sdm632 and fairphone,fp3 board
      arm64: dts: qcom: sdm632: Add device tree for Fairphone 3

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sm8250: Fix MSI IRQ for PCIe1 and PCIe2

Marijn Suijten (1):
      Revert "arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX"

Maulik Shah (4):
      arm64: dts: qcom: sm8150: Correct TCS configuration for apps rsc
      arm64: dts: qcom: sm8250: Add cpuidle states
      arm64: dts: qcom: sm8350: Correct TCS configuration for apps rsc
      arm64: dts: qcom: sm8450: Update cpuidle states parameters

Nikita Travkin (1):
      arm64: dts: qcom: msm8916-longcheer-l8150: Add light and proximity sensor

Odelu Kukatla (1):
      arm64: dts: qcom: sc7280: Add EPSS L3 interconnect provider

Petr Vorel (5):
      arm64: dts: qcom: msm8994: SoC specific compatible strings for qcom-sdhci
      arm64: dts: qcom: msm8996: SoC specific compatible strings for qcom-sdhci
      arm64: dts: qcom: msm8916-j5: Fix typo
      arm64: dts: qcom: msm8994: Provide missing "xo_board" and "sleep_clk" to GCC
      arm64: dts: qcom: msm8994-huawei-angler: Add vendor name huawei

Rajeev Nandan (1):
      arm64: dts: qcom: sc7280: Add DSI display nodes

Rob Herring (1):
      arm64: dts: qcom: msm8998: Fix cache nodes

Robert Foss (2):
      arm64: dts: qcom: apq8016-sbc: Remove clock-lanes property from &camss node
      arm64: dts: qcom: sdm845-db845c: Remove clock-lanes property from &camss node

Robert Marko (1):
      arm64: dts: qcom: ipq8074: add SMEM support

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sm8450: Add LLCC/system-cache-controller node

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7280: Move USB2 controller nodes from common dtsi to SKU1

Sankeerth Billakanti (1):
      arm64: dts: qcom: sc7280: add edp display dt nodes

Satya Priya (1):
      arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Add cpu OPP tables

Stephan Gerhold (1):
      arm64: dts: qcom: apq8016-sbc: Fix dtbs_check warnings for &sound

Stephen Boyd (1):
      arm64: dts: qcom: sc7180: Add board regulators for MIPI camera trogdor boards

Taniya Das (1):
      arm64: dts: qcom: sc7280: Add camcc clock node

Thara Gopinath (1):
      arm64: dts: qcom: sm8150: Add support for LMh node

Vinod Koul (5):
      dt-bindings: arm: qcom: Document SM8450 HDK boards
      arm64: dts: qcom: Add SM8450 HDK DTS
      arm64: dts: qcom: sm8450: add interconnect nodes
      arm64: dts: qcom: sdm845: Add gsi dma node
      arm64: dts: qcom: sdm845: enable dma for spi

Vladimir Lypak (3):
      arm64: dts: qcom: Add MSM8953 device tree
      arm64: dts: qcom: Add PM8953 PMIC
      arm64: dts: qcom: Add SDM632 device tree

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8250: add description of dcvsh interrupts

Xilin Wu (1):
      arm64: dts: qcom: Add support for Samsung Galaxy Book2

Yassine Oudjana (4):
      dt-bindings: arm: qcom: Add msm8996 and apq8096 compatibles
      arm64: dts: qcom: msm8996-mtp: Add msm8996 compatible
      arm64: dts: qcom: msm8996: Rename cluster OPP tables
      arm64: dts: qcom: qcs404: Rename CPU and CPR OPP tables

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   23 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   12 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   35 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   23 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 1326 +++++++++++++++++++
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts   |   14 +
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts  |   14 +
 ...llhead-rev-101.dts => msm8992-lg-bullhead.dtsi} |    2 -
 ...v-101.dts => msm8994-huawei-angler-rev-101.dts} |    0
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    7 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts           |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   34 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   56 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/pm8953.dtsi               |   90 ++
 arch/arm64/boot/dts/qcom/pms405.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    4 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   16 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   16 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  126 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    2 +
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   97 ++
 arch/arm64/boot/dts/qcom/sc7280-crd.dts            |   12 +
 .../dts/qcom/sc7280-herobrine-herobrine-r0.dts     | 1352 ++++++++++++++++++++
 .../dts/qcom/sc7280-herobrine-herobrine-r1.dts     |  313 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts      |   14 -
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     | 1105 ++++------------
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   20 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  215 ++--
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |    4 +
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |  547 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  815 ++++++++++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  183 +++
 arch/arm64/boot/dts/qcom/sdm632.dtsi               |   81 ++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    7 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   19 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   12 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   12 +
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  736 +++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  115 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   33 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |  748 +++++++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    9 +
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |   20 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  154 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  132 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  405 ++++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   20 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  417 +++++-
 59 files changed, 8180 insertions(+), 1297 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
 rename arch/arm64/boot/dts/qcom/{msm8992-bullhead-rev-101.dts => msm8992-lg-bullhead.dtsi} (98%)
 rename arch/arm64/boot/dts/qcom/{msm8994-angler-rev-101.dts => msm8994-huawei-angler-rev-101.dts} (100%)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8953.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm632.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-hdk.dts
