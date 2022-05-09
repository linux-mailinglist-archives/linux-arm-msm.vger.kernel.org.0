Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E263520620
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 22:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiEIUsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 16:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiEIUsw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 16:48:52 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5C2289BC9
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 13:44:56 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-d39f741ba0so16052801fac.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 13:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s/r+13nyPaUDIA74auUbR3kzFHgYw7LhzptIem2Of2E=;
        b=y6Z/NmBfRS78nzNn/0wpaTPSf17r1bYneH1HddNy5MdkA/78BF9c20ahEzormw++qR
         bYvrnwOHxs/xDU09wiMWGEeVM6caFoJnFEinjG9H3EuYSgGOZO7duI5kuH5R4/UX2BXX
         s3Mgzcgx3sqVz6GS4BlBL/cpOg6Ops/cT469XrpWA443zddYcB1KLPl+QBvJzEisjg53
         svnKJvvlqxLYcbs3HEt92LN10JvZbXqtkGcYdSJCsTZKX3SKCuRM7Ke3uHhnyBbhq1sB
         MPWXjD65elAqKYxF3I/4oPxRSZRteA4zIe1frxglLIO6L1q+JgLo/8fUGeILh6VszNAR
         X8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s/r+13nyPaUDIA74auUbR3kzFHgYw7LhzptIem2Of2E=;
        b=iDDXBZjCnkbVKL9yLldTdiiiwZL+zeW5BZn5+N36PARSkkcLytQjHTDGkqrM52GN1B
         kkwCwrVXJvrVPGnlwcV4hTlwUhn26S10QUtyDoGSW3bW6jt+Ff9e/NphJwTVI5gj3+Re
         I8Av9eXd6a4Hy4SwM0nOjZY0emDKDSJA7zVuh9gLbSxKaQ7Rza9MHoBeF6G/PMSZW1lH
         geXVOYbgDYypfsSNNsUCrKkFFEYqPwKSssoh3iiC/IGrpqgxKpE+dgEjAVGdnIrDFMbU
         koZGfOMMZBhErTMsCBUpHAQ1cryZryZHdzYTJ2lZMolHfudlC4Zmw21+vFHmoHdB/+Cm
         w4WA==
X-Gm-Message-State: AOAM5324VpXc73wB4Sax+ZlksI3N78R67vtHuUaT4cntItd1ex4BGzsJ
        qgr/byXfYR6SA6b4ACH+UQ6MTA==
X-Google-Smtp-Source: ABdhPJxJd8oWtpOMd4KsbssppS8c/M99msAWr3piWTlxgaGDK9g6UlNhkklz1GKhZzqMHV4ucEiR4A==
X-Received: by 2002:a05:6870:b38d:b0:e9:2082:fe86 with SMTP id w13-20020a056870b38d00b000e92082fe86mr8184195oap.145.1652129095949;
        Mon, 09 May 2022 13:44:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e4-20020a056870c0c400b000e686d1389esm4494406oad.56.2022.05.09.13.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 13:44:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Joel Selvaraj <jo@jsfamily.in>,
        Douglas Anderson <dianders@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Baruch Siach <baruch.siach@siklu.com>,
        Ivy Jian <ivyjian417@gmail.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Katherine Perez <kaperez@linux.microsoft.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Michael Srba <michael.srba@seznam.cz>,
        Petr Vorel <petr.vorel@gmail.com>,
        Rakesh Pillai <quic_pillair@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for v5.19
Date:   Mon,  9 May 2022 15:44:51 -0500
Message-Id: <20220509204451.325675-1-bjorn.andersson@linaro.org>
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.19

for you to fetch changes up to 19794489fa2474a55c00848e00ca3d15ea01d36c:

  arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi (2022-05-05 22:42:27 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for v5.19

This adds MDIO bus description on the IPQ6018 platform.

On MSM8916 the BAM-DMUX WWAN network device is added and the Huawei
Ascend G7 gains sound card definition and clarified installation
instructions.

MSM8992 and MSM8994 continues to be worked on, gaining multimedia clock
controller, on-chip memory, watchdog and various cleanup changes. The
Xiaomi Mi 4C gains CPU regulators and fixes to the framebuffer
definition, while Huawei Nexus 6P gains eMMC support.

On MSM8996 the modem and sensor remtoeprocs are added and enabled in the
Dragonboard 820c and the Xiaomi devices.

On MSM8998 a few newly added clocks related to the sensor subsystem bus
are marked as protected by default and the OnePlus devices gains NFC.

The SC7180 platform and devices thereon are further polished and
limozeen moves to using edp-panel for EDID-based detection, over
statically defined panels.

On SC7280 GPI DMA, WiFi remoteproc and network device, LPASS audio
clocks, resets for SDCC controllers and a new CRD revision are added. A
supply glitch on the PCIe power and a current leak for Bluetooth during
suspend are corrected. The Herobrine board gains eDP support and the IDP
gains backlight. USB is marked wakeup capable.

On SDM845 the IPA, WLED based backlight and second WiFi channel are
enabled for Xiaomi Pocophone F1, the firmware name is modified to not
conflict with other boards.  On RB3 the CAN bus controller is added and
the WiFi calibration variant is defined to allow adding the board's
calibration information into linux-firmware.

SM6350 gains I2C busses, UFS and WiFi support, and the numbering of
uart9 is corrected.

On SM7225 and the Fairphone 4 UFS, WiFi and haptics are enabled.

On SM8150 PCIe, Ethernet and uSD card support is added, and enabled for
the SA8155p ADP board. The PDC interrupt controller is also added and
described as wakup interrupt parent for TLMM.

Camera subsystem and control interface are defined for SM8250. On the
Sony Xperia 1 II the audio amplifiers are enabled.

On SM8350 GPI DMA engines are added and linked to the I2C and SPI
serial engines. Surface Duo 2 gains battery charger support.

On SM8450 the two PCIe controller/PHYs are enabled, GPI DMA and QUP
serial engine instances are added. Remoteproc instances are enabled on
SM8450 HDK.

Last, but not least, a number of DeviceTree validation errors across
various boards are corrected.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: dts: qcom: sc7280: Support gpu speedbin

Baruch Siach (1):
      arm64: dts: qcom: ipq6018: Add mdio bus description

Bhupesh Sharma (14):
      arm64: dts: qcom: sm8150: Add pdc interrupt controller node
      arm64: dts: qcom: sm8150: Add ufs power-domain entries
      arm64: dts: qcom: sm8150: Add PCIe nodes
      arm64: dts: qcom: sa8155: Enable PCIe nodes
      arm64: dts: qcom: sm8150: Add support for SDC2
      arm64: dts: qcom: sa8155p-adp: Add support for uSD card
      arm64: dts: qcom: sm8150: Add PDC as the interrupt parent for tlmm
      arm64: dts: qcom: msm8996-xiaomi: Drop max-microamp and vddp-ref-clk properties from QMP PHY
      arm64: dts: qcom: sc7280: Fix qmp phy node (use phy@ instead of lanes@)
      arm64: dts: qcom: sm8450: Fix qmp ufs phy node (use phy@ instead of lanes@)
      arm64: dts: qcom: ipq6018: Fix qmp usb3 phy node
      arm64: dts: qcom: sm8450: Fix qmp phy node (use phy@ instead of lanes@)
      arm64: dts: qcom: sm8150: Fix iommu sid value for SDC2 controller
      arm64: dts: qcom: sa8155p-adp: Disable multiple Tx and Rx queues for ethernet IP

Bjorn Andersson (5):
      Merge branch '20220223172248.18877-1-tdas@codeaurora.org' into arm64-for-5.19
      Merge branch '20220411072156.24451-2-michael.srba@seznam.cz' into arm64-for-5.19
      arm64: dts: qcom: sm8350: Define GPI DMA engines
      arm64: dts: qcom: sm8350: Add GENI I2C/SPI DMA channels
      arm64: dts: qcom: sm8350-hdk: Enable &gpi_dma1

Bryan O'Donoghue (3):
      arm64: dts: qcom: sm8250: Add camcc DT node
      arm64: dts: qcom: sm8250: camss: Add CAMSS block definition
      arm64: dts: qcom: sm8250: camss: Add CCI definitions

Dmitry Baryshkov (25):
      arm64: dts: qcom: sdm845-db845c: add wifi variant property
      arm64: dts: qcom: apq8096-db820c: enable MSS node
      arm64: dts: qcom: sdm845: remove snps,dw-pcie compatibles
      arm64: dts: qcom: msm8996: remove snps,dw-pcie compatibles
      arm64: dts: qcom: sm8450-hdk: Enable remoteproc instances
      arm64: dts: qcom: sm8450: add fastrpc nodes
      arm64: dts: qcom: sdm845: correct dynamic power coefficients
      arm64: dts: qcom: pm8350: add temp sensor and thermal zone config
      arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config
      arm64: dts: qcom: pmr735b: add temp sensor and thermal zone config
      arm64: dts: qcom: pm8350c: stop depending on thermal_zones label
      arm64: dts: qcom: pmr735a: stop depending on thermal_zones label
      arm64: dts: qcom: add pm8450 support
      arm64: dts: qcom: sm8450: add PCIe0 PHY node
      arm64: dts: qcom: sm8450: add PCIe0 RC device
      arm64: dts: qcom: sm8450: add PCIe1 PHY node
      arm64: dts: qcom: sm8450: add PCIe1 root device
      arm64: dts: qcom: sm8450-qrd: enable PCIe0 PHY device
      arm64: dts: qcom: sm8450-qrd: enable PCIe0 host
      arm64: dts: qcom: sm8450-hdk: add pcie nodes
      arm64: dts: qcom: msm8996: Drop flags for mdss irqs
      arm64: dts: qcom: sdm630: Drop flags for mdss irqs
      arm64: dts: qcom: sdm660: Drop flags for mdss irqs
      arm64: dts: qcom: sdm845: Drop flags for mdss irqs
      arm64: dts: qcom: sm8250: Drop flags for mdss irqs

Douglas Anderson (4):
      arm64: dts: qcom: sc7280-herobrine: Fix PCIe regulator glitch at bootup
      arm64: dts: qcom: sc7280: Delete herobrine-r0
      arm64: dts: qcom: sc7280-herobrine: Audio codec wants 1.8V, not 1.62V
      arm64: dts: qcom: sc7280: eDP for herobrine boards

Ivy Jian (1):
      arm64: dts: qcom: switch panel compatible to "edp-panel" for limozeen

Jami Kettunen (1):
      arm64: dts: qcom: msm8998-oneplus-common: Add NFC

Joel Selvaraj (5):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: change firmware path and use mbn format
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom ipa driver
      arm64: dts: qcom: sdm845-xiaomi-beryllium: fix typo in panel's vddio-supply property
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable second wifi channel
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom wled backlight and link to panel

Katherine Perez (1):
      arm64: dts: qcom: sm8350-duo2: enable battery charger

Kathiravan T (1):
      arm64: dts: qcom: ipq8074: fix the sleep clock frequency

Konrad Dybcio (16):
      arm64: dts: qcom: sm8250-edo: Add dual CS35L41 amps
      arm64: dts: qcom: msm8994: Fix sleep clock name
      arm64: dts: qcom: msm8992-libra: Add CPU regulators
      arm64: dts: qcom: msm8992-libra: Temporarily restrict CPU count to 1
      arm64: dts: qcom: msm8992-libra: Remove superfluous status = "okay"
      arm64: dts: qcom: msm8994: Add MMCC node
      arm64: dts: qcom: msm8992: Use the correct GCC compatible
      arm64: dts: qcom: msm8992: Use the correct MMCC compatible
      arm64: dts: qcom: msm8994: Fix the cont_splash_mem address
      arm64: dts: qcom: msm8992-libra: Fix up the framebuffer
      arm64: dts: qcom: msm8994-kitakami: Disable a mistakengly enabled I2C host
      arm64: dts: qcom: msm8994-kitakami: Update regulator configuration
      arm64: dts: qcom: msm8994: Add OCMEM node
      arm64: dts: qcom: msm8994: Fix BLSP[12]_DMA channels count
      arm64: dts: qcom: msm8994: Add watchdog timer node
      arm64: dts: qcom: msm8994: Add mmc aliases

Krzysztof Kozlowski (13):
      arm64: dts: qcom: align SPI NOR node name with dtschema
      arm64: dts: qcom: msm8996: drop unsupported UFS vddp-ref-clk-max-microamp
      arm64: dts: qcom: msm8996: correct UFS compatible
      arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS
      arm64: dts: qcom: msm8916: rename WCNSS child name to bluetooth
      arm64: dts: qcom: align dmas in I2C/SPI/UART with DT schema
      arm64: dts: qcom: align clocks in I2C/SPI with DT schema
      arm64: dts: qcom: msm8953: do not use underscore in node name
      arm64: dts: qcom: msm8994: remove SMD qcom,local-pid property
      arm64: dts: qcom: add RPM clock controller fallback compatible
      arm64: dts: qcom: do not use underscore in BCM node name
      arm64: dts: qcom: msm8994: override nodes by label
      arm64: dts: qcom: msm8996: override nodes by label

Kuldeep Singh (1):
      arm64: dts: qcom: msm8996: User generic node name for DMA

Luca Weiss (7):
      arm64: dts: qcom: sm6350: Fix naming of uart9
      arm64: dts: qcom: sm6350: Add I2C busses
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics
      arm64: dts: qcom: sm6350: Add UFS nodes
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable UFS
      arm64: dts: qcom: sm6350: Add wifi node
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable wifi

Manikanta Pubbisetty (1):
      arm64: dts: qcom: sc7280: Add WCN6750 WiFi node

Matthias Kaehlcke (7):
      arm64: dts: qcom: sc7280: Add SAR sensors for herobrine
      arm64: dts: qcom: sc7280: Add device tree for herobrine villager
      arm64: dts: qcom: sc7280: Rename crd to crd-r3
      arm64: dts: qcom: sc7280: Add 'piglin' to the crd-r3 compatible strings
      arm64: dts: qcom: sc7280: herobrine: disable some regulators by default
      arm64: dts: qcom: sc7280: Add CRD rev5
      arm64: dts: qcom: sc7280: Add SAR sensors to herobrine crd

Michael Srba (2):
      dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
      arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks

Petr Vorel (1):
      arm64: dts: qcom: msm8994-huawei-angler: Add sdhc1 definition

Rakesh Pillai (1):
      arm64: dts: qcom: sc7280: Add WPSS remoteproc node

Rob Herring (1):
      arm64: dts: qcom: sdm845: shift6mq: Fix boolean properties with values

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7280: Add wakeup-source property for USB node

Sankeerth Billakanti (1):
      arm64: dts: qcom: sc7280: rename edp_out label to mdss_edp_out

Satya Priya (2):
      arm64: dts: qcom: pm8350c: Add pwm support
      arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7280: Add reset entries for SDCC controllers

Souradeep Chowdhury (1):
      arm64: dts: qcom: sc7280: Set the default dr_mode for usb2

Stephan Gerhold (3):
      arm64: dts: qcom: msm8916: Add BAM-DMUX for WWAN network interfaces
      arm64: dts: qcom: msm8916-huawei-g7: Clarify installation instructions
      arm64: dts: qcom: msm8916-huawei-g7: Add sound card

Stephen Boyd (7):
      arm64: dts: qcom: sc7280: Fix sar1_irq_odl node name
      arm64: dts: qcom: sc7280-herobrine: Drop outputs on fpmcu pins
      arm64: dts: qcom: sc7180-trogdor: Simplify SAR sensor enabling
      arm64: dts: qcom: sc7180: Remove ipa interconnect node
      arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling
      arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling
      arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi

Taniya Das (2):
      dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
      arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controllers

Vijaya Krishna Nivarthi (2):
      arm64: dts: qcom: sc7280-idp: Configure CTS pin to bias-bus-hold for bluetooth
      arm64: dts: qcom: sc7280-qcard: Configure CTS pin to bias-bus-hold for bluetooth

Vinod Koul (14):
      arm64: dts: qcom: sm8150: add ethernet node
      arm64: dts: qcom: sa8155p-adp: Enable ethernet node
      arm64: dts: qcom: sm8450: Add gpi_dma nodes
      arm64: dts: qcom: sm8450: Fix missing iommus for qup
      arm64: dts: qcom: sm8450: Add qup nodes for qup0
      arm64: dts: qcom: sm8450: Add qup nodes for qup1
      arm64: dts: qcom: sm8450: Add qup nodes for qup2
      arm64: dts: qcom: sm8450: Fix missing iommus for qup1
      arm64: dts: qcom: sm8450-qrd: Enable spi and i2c nodes
      arm64: dts: qcom: qrb5165-rb5: Fix can-clock node name
      arm64: dts: qcom: db845c: Add support for MCP2517FD
      arm64: dts: qcom: sc7280: Add GPI DMAengines
      arm64: dts: qcom: sc7280: Add GENI I2C/SPI DMA channels
      arm64: dts: qcom: sc7280-idp: Enable GPI DMAs

Vladimir Zapolskiy (2):
      arm64: dts: qcom: sm8450: Add thermal sensor controllers
      arm64: dts: qcom: sm8450: Add thermal zones

Yassine Oudjana (4):
      arm64: dts: qcom: msm8996: Revamp reserved memory
      arm64: dts: qcom: msm8996: Unify smp2p naming
      arm64: dts: qcom: msm8996: Add MSS and SLPI
      arm64: dts: qcom: msm8996-xiaomi-*: Enable MSS and SLPI

 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |  172 +
 arch/arm64/boot/dts/qcom/Makefile                  |    5 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |    6 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    2 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   34 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    2 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |    2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   42 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |   59 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  102 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   52 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |   36 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |   24 +-
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     |   21 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |   89 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  126 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts           |    8 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   18 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |   36 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    9 +
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |    9 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  250 +-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |   31 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   15 +
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |   31 +
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |   31 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   41 +-
 arch/arm64/boot/dts/qcom/pm8450.dtsi               |   59 +
 arch/arm64/boot/dts/qcom/pmr735a.dtsi              |   32 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |   31 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   94 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    2 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |  193 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   11 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r2.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r3.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r4.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    7 -
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts |    2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts |    4 +-
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts  |    2 +-
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts  |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  |    4 -
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |    6 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |    6 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts      |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    7 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    9 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    9 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    9 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    9 +-
 .../dts/qcom/{sc7280-crd.dts => sc7280-crd-r3.dts} |    7 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  |  365 ++
 .../dts/qcom/sc7280-herobrine-herobrine-r0.dts     | 1352 -------
 .../dts/qcom/sc7280-herobrine-herobrine-r1.dts     |   38 +
 .../boot/dts/qcom/sc7280-herobrine-villager-r0.dts |  304 ++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   93 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   36 +-
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |    4 +
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |   73 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  336 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   33 +
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |   35 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   34 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  241 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   61 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  330 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |   30 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  339 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    4 +
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |   12 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  186 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   41 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   34 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 3750 ++++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |    4 +
 .../dt-bindings/clock/qcom,lpassaudiocc-sc7280.h   |   43 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7280.h    |   26 +
 87 files changed, 7104 insertions(+), 2486 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/pm8450.dtsi
 rename arch/arm64/boot/dts/qcom/{sc7280-crd.dts => sc7280-crd-r3.dts} (88%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
 create mode 100644 include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h
