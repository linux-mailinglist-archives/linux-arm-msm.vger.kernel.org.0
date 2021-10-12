Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1862642AFFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 01:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbhJLXOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 19:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhJLXOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 19:14:01 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBEAC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 16:11:58 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so1340714ott.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 16:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pm1At8Dggcntra8NtNt6a/fC+vuXFf3QCA+nevKtcO0=;
        b=Mu3uFqg3XbowpiU5ETaMpfEn9U8kzdUmUlOVNIyWCIoPBXR1mJ4H9vY+LppKdqVjOr
         I5QPYtbrnZUf6Rvmee5rfNUghpYu7bBPcQ3Q+R0Fd52GYlsHGhRgnWAIfunY5eVMmkYu
         lfQM79Ufyvchl96aRqLwP+oLIskONW/d39gBNDLu3ouoDA4Uh95a4N3rxTN9tZQrKjYs
         k/lXmhMK0tvQ/Vbg/mtsfiTZzWnX5EtZ88h2jmWiBmUkA0XvtRf/ppIRDasOfeY3z4YN
         r1E+ivJUyGmssvBo1PYjE9VmKP4bMTnXefYQd5+vuBiSLBGAJh1Qp9JBlXXAWgCkx24r
         Fsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pm1At8Dggcntra8NtNt6a/fC+vuXFf3QCA+nevKtcO0=;
        b=SVxgTvkyjd1MtUEd6z+vA9tVyQwpOIz7IhvmhRwpQVmuIUEzhA1Zz32O3dyWjwwccB
         yg9GAmNdWOyS4P7OeY3DXjhPa2zZ3V0PdMI/0CU89yoxo8BUHOqTtaUJBsbjsYP1AGnB
         haYAl+X1DLrpaHL/Wm1L5YFWHU2az/soHYE3z1Uy2r8etTTnEUUBE7IPpPKg64uddoxw
         L5ZaIZUnS2i9arUn7TKdgoa1hXTTnweUK7j3Sq24TkI8pWRH2kVJHb0bTRXrL4JN4dLX
         zSy40w3dWK0YpFiaUiUkW2+GHyrKtkSwUnWE5Sewg4oOdK+6t12zJeuuuqn75GRiAMoD
         IDYQ==
X-Gm-Message-State: AOAM533BQPb1gm0Lsf/WSNyDjSmGackpBTcZX5AlZUCZRJZ/H9FnlIle
        veEetaSi9UmA5w2TUiio4GkNFA==
X-Google-Smtp-Source: ABdhPJz8+lOY/Cnl4CgDLbOUn/g8oaA9zDWk3gEnXCSdLQHuvxwcW5kg3gGeLe2O/6b1ufkvYMWZjQ==
X-Received: by 2002:a05:6830:2146:: with SMTP id r6mr28292338otd.1.1634080317861;
        Tue, 12 Oct 2021 16:11:57 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id n13sm2670108otf.3.2021.10.12.16.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 16:11:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Robert Marko <robimarko@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Kathiravan T <kathirav@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        satya priya <skakit@codeaurora.org>
Subject: [GIT PULL] Qualcomm ARM64 dts updates for v5.16
Date:   Tue, 12 Oct 2021 18:11:55 -0500
Message-Id: <20211012231155.1036519-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.16

for you to fetch changes up to c22441a7cbd014e2546329af89363b2a43cc8bf2:

  arm64: dts: qcom: sdm630-nile: Correct regulator label name (2021-09-28 10:36:30 -0500)

----------------------------------------------------------------
Qualcomm ARM64 dts updates for v5.16

MSM8916 gained some DT cleanup fixes. The Dragonboard 410c gains updated
firmware paths to the device specific firmware for modem and WiFi, to
allow these to be pushed to linux-next. The Longcheer L8150 gains extcon
support and the interrupt configuration for the accelerometer and
magnetometer are corrected.

MSM8998 gained descriptions for the multimedia clock controller and
iommu, as well as the GPU and its dedicated IOMMU. The QFPROM node is
updated to access the CRC corrected value space, the white LED (for
backlight) found in PMI8998 is described and GCC gains references to the
missing XO and sleep_clk reference clocks.
On top of this initial support for the Fxtec Pro1 QX1000 is added and
then the Sony Xperia XZ1, Xperia XZ1 Compact and the Xperia XZ Premium,
with USB, touchscreen, SDHCI, Bluetooth and vibrator supported.

The Xiaomi Mi 5 and Xiaomi Mi Note 2, based on the MSM8996 platform was
added, with support for frame buffer, GPU, audio, video encoder/decoder
and touchscreen.

The USB controller and PHY found in IPA6018 is described to provide USB
support. IPQ8074 gains a description of the SPMI controller.

The highlight on SC7180 is the introduction of the just released
"Homestar" device.  CPU power coefficients are corrected based on
measurements, IMEM is described to ensure that remoteproc relocation
information is carried to post mortem debug tools and a few smaller
fixes are introduced.

The SC7280 gains QSPI, low speed (i2c/spi/uart), GPU, thermal zones,
modem, CPU topology and updated memory map.

On SDM845 the "Limits hardware" is described and increases the
throttling temperature of the hardware from ~70C to 95C, with up to 30%
improvement in benchmarks as result.  Relying on hardware throttling and
thermal pressure, the CPU cooling devices are dropped.
The power for the second WiFi channel is properly described for the
Lenovo Yoga C630, to ensure they are both powered.

reboot-modes are defined for the PM660 PMIC, found in SDM630 and SDM660.

Initial support for the Snapdragon 690 (aka SM6350) is introduced, with
support for clocks, regulators, pinctrl, storage, thermal sensors, USB,
SMMU and CPUfreq. On top of this support for the Sony Xperia 10 III is
introduced.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: dts: qcom: sc7280: Add gpu support

AngeloGioacchino Del Regno (17):
      arm64: dts: qcom: msm8998: Configure the MultiMedia Clock Controller (MMCC)
      arm64: dts: qcom: msm8998: Configure the multimedia subsystem iommu
      arm64: dts: qcom: msm8998: Fix CPU/L2 idle state latency and residency
      arm64: dts: qcom: msm8998: Move qfprom iospace to calibrated values
      arm64: dts: qcom: msm8998: Configure Adreno GPU and related IOMMU
      arm64: dts: qcom: pmi8998: Add node for WLED
      arm64: dts: qcom: msm8998: Introduce support for Sony Yoshino platform
      arm64: dts: qcom: msm8998-xperia: Add RMI4 touchscreen support
      arm64: dts: qcom: msm8998-xperia: Add support for wcn3990 Bluetooth
      arm64: dts: qcom: msm8998-xperia: Add support for gpio vibrator
      arm64: dts: qcom: msm8998-xperia: Configure display boost regulators
      arm64: dts: qcom: msm8998-xperia: Add camera regulators
      arm64: dts: qcom: msm8998-xperia: Add audio clock and its pin
      arm64: dts: qcom: Add support for MSM8998 F(x)tec Pro1 QX1000
      arm64: dts: qcom: msm8998-fxtec-pro1: Add physical keyboard leds
      arm64: dts: qcom: msm8998-fxtec-pro1: Add Goodix GT9286 touchscreen
      arm64: dts: qcom: msm8998-fxtec-pro1: Add tlmm keyboard keys

Bhupesh Sharma (1):
      arm64: dts: qcom: sdm845: Use RPMH_CE_CLK macro directly

Bjorn Andersson (1):
      arm64: dts: qcom: apq8016-sbc: Update modem and WiFi firmware path

Dmitry Baryshkov (3):
      arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
      arm64: dts: qcom: pm8150: specify reboot mode magics
      arm64: dts: qcom: qrb5165-rb5: enabled pwrkey and resin nodes

Douglas Anderson (3):
      arm64: dts: qcom: sc7180: Base dynamic CPU power coefficients in reality
      arm64: dts: qcom: sc7280: Move the SD CD GPIO pin out of the dtsi file
      arm64: dts: qcom: sc7180: Base homestar's power coefficients in reality

Fabio Estevam (1):
      arm64: dts: qcom: sm6125: Remove leading zeroes

Kathiravan T (1):
      arm64: dts: qcom: ipq6018: add usb3 DT description

Konrad Dybcio (17):
      dt-bindings: arm: cpus: Add Kryo 560 CPUs
      arm64: dts: qcom: Add SM6350 device tree
      arm64: dts: qcom: sm6350: Add LLCC node
      arm64: dts: qcom: sm6350: Add RPMHCC node
      arm64: dts: qcom: sm6350: Add GCC node
      arm64: dts: qcom: sm6350: Add TLMM block node
      arm64: dts: qcom: sm6350: Add USB1 nodes
      arm64: dts: qcom: sm6350: Add cpufreq-hw support
      arm64: dts: qcom: sm6350: Add TSENS nodes
      arm64: dts: qcom: sm6350: Add AOSS_QMP
      arm64: dts: qcom: sm6350: Add SPMI bus
      arm64: dts: qcom: sm6350: Add PRNG node
      arm64: dts: qcom: sm6350: Add RPMHPD and BCM voter
      arm64: dts: qcom: sm6350: Add SDHCI1/2 nodes
      arm64: dts: qcom: sm6350: Add apps_smmu and assign iommus prop to USB1
      arm64: dts: qcom: sm6350: Add device tree for Sony Xperia 10 III
      arm64: dts: qcom: pm6150l: Add missing include

Kuogee Hsieh (1):
      arm64: dts: qcom: sc7280: fix display port phy reg property

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: sc7280: Add gpu thermal zone cooling support

Marijn Suijten (2):
      arm64: dts: qcom: msm8998: Provide missing "xo" and "sleep_clk" to GCC
      arm64: dts: qcom: sm6125: Improve indentation of multiline properties

Matthias Kaehlcke (2):
      arm64: dts: qcom: sc7180-trogdor: Delete ADC config for unused thermistors
      arm64: dts: qcom: Add sc7180-trogdor-homestar

Raffaele Tranquillini (1):
      arm64: dts: qcom: msm8996: xiaomi-gemini: Add support for Xiaomi Mi 5

Rajendra Nayak (2):
      arm64: dts: qcom: sc7280-idp: Add vcc-supply for qfprom
      arm64: dts: qcom: sc7280: Define CPU topology

Rajesh Patil (3):
      arm64: dts: qcom: sc7280: Configure SPI-NOR FLASH for sc7280-idp
      arm64: dts: qcom: sc7280: Configure uart7 to support bluetooth on sc7280-idp
      arm64: dts: qcom: sc7280: Add aliases for I2C and SPI

Robert Marko (2):
      arm64: dts: qcom: ipq8074: remove USB tx-fifo-resize property
      arm64: dts: qcom: ipq8074: add SPMI bus

Roja Rani Yarubandi (4):
      arm64: dts: qcom: sc7280: Add QSPI node
      arm64: dts: qcom: sc7280: Add QUPv3 wrapper_0 nodes
      arm64: dts: qcom: sc7280: Update QUPv3 UART5 DT node
      arm64: dts: qcom: sc7280: Add QUPv3 wrapper_1 nodes

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sc7180: Add IMEM and pil info regions

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7180: Use maximum drive strength values for eMMC

Shawn Guo (6):
      arm64: dts: qcom: ipq6018: Fix qcom,controlled-remotely property
      arm64: dts: qcom: ipq8074: Fix qcom,controlled-remotely property
      arm64: dts: qcom: sdm845: Fix qcom,controlled-remotely property
      arm64: dts: qcom: Update BAM DMA node name per DT schema
      arm64: dts: qcom: pm660: Add reboot mode support
      arm64: dts: qcom: sdm630-nile: Correct regulator label name

Sibi Sankar (11):
      arm64: dts: qcom: sc7180: Use QMP property to control load state
      arm64: dts: qcom: sc7280: Use QMP property to control load state
      arm64: dts: qcom: sdm845: Use QMP property to control load state
      arm64: dts: qcom: sm8150: Use QMP property to control load state
      arm64: dts: qcom: sm8250: Use QMP property to control load state
      arm64: dts: qcom: sm8350: Use QMP property to control load state
      arm64: dts: qcom: sc7280: Update reserved memory map
      arm64: dts: qcom: sc7280: Add/Delete/Update reserved memory nodes
      arm64: dts: qcom: sc7280: Add nodes to boot modem
      arm64: dts: qcom: sc7280: Add Q6V5 MSS node
      arm64: dts: qcom: sc7280: Update Q6V5 MSS node

Steev Klimaszewski (1):
      arm64: dts: qcom: c630: add second channel for wifi

Stephan Gerhold (7):
      arm64: dts: qcom: msm8916: Add unit name for /soc node
      arm64: dts: qcom: msm8916: Add "qcom,msm8916-sdhci" compatible
      arm64: dts: qcom: msm8916-longcheer-l8150: Add missing sensor interrupts
      arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
      arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
      arm64: dts: qcom: pm8916: Add pm8941-misc extcon for USB detection
      arm64: dts: qcom: msm8916-longcheer-l8150: Use &pm8916_usbin extcon

Stephen Boyd (1):
      arm64: dts: qcom: sc7280: Use GIC_SPI for intc cells

Sujit Kautkar (1):
      arm64: dts: qcom: sc7180-trogdor: Enable IPA on LTE only SKUs

Taniya Das (1):
      arm64: dts: qcom: sc7280: Add clock controller ID headers

Thara Gopinath (2):
      arm64: dts: qcom: sdm845: Add support for LMh node
      arm64: dts: qcom: sdm845: Remove cpufreq cooling devices for CPU thermal zones

Yassine Oudjana (3):
      arm64: dts: qcom: db820c: Move blsp1_uart2 pin states to msm8996.dtsi
      arm64: dts: qcom: msm8996: Add blsp2_i2c3
      arm64: dts: qcom: msm8996: Add support for the Xiaomi MSM8996 platform

satya priya (1):
      arm64: dts: qcom: sc7280: Add volume up support for sc7280-idp

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    9 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |   12 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       |   29 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   85 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   25 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   62 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   16 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  673 ++++
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |  431 +++
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |  431 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   53 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |  319 ++
 .../dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts |   30 +
 .../dts/qcom/msm8998-sony-xperia-yoshino-maple.dts |   54 +
 .../qcom/msm8998-sony-xperia-yoshino-poplar.dts    |   35 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  670 ++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  200 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |    1 +
 arch/arm64/boot/dts/qcom/pm660.dtsi                |    5 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |    9 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   12 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   10 +
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     |   14 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar-r2.dts   |   20 +
 .../boot/dts/qcom/sc7180-trogdor-homestar-r3.dts   |   15 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |  335 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   12 +
 .../boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi      |   11 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |    8 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |    8 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    8 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   15 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   76 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  225 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 3430 +++++++++++++++-----
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |    8 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  182 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    5 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   52 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |   57 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  934 ++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   22 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   30 +-
 47 files changed, 7534 insertions(+), 1139 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350.dtsi
