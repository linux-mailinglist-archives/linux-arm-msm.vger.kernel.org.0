Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB902C8D9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387702AbgK3TCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387693AbgK3TCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:02:14 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440A1C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 11:01:34 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id e105so342853ote.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 11:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KkCGSdcUL2UomBwrpQhjXD4WVaPI4vhnvCHRxZI5DQY=;
        b=lV05iSx4I9iLORQ+IK5wKzzvrunx2t5J6Oj1cCvylHoi3p8ZJkhgZGiWnf370lMEYY
         GWgfecQNlHyNGOB7uB9SM2yqS8jk76xVP6NWaYUEYt/wrkQIw9MKn/6sP7fKraTPZC9t
         AS3sG3LRbcJB4h5464BBCrQ+E9EAKVsh4cbYEJVbUeIPoN3k964xhQRfWRCiQWE+Gqkg
         P70/IwjifsfFDmR7E2QRxQGYOnyiz4Z8dopEC2ZSDY7TeRFPbTWDJhS9CMfsf/W+XtIW
         VySeASNoHgU3vKG4Alr5t/MC2ajH2VKDlTWwlcCjwIn5mmL1yJVCuH7cO9hjwlEWNH23
         P2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KkCGSdcUL2UomBwrpQhjXD4WVaPI4vhnvCHRxZI5DQY=;
        b=Yw8Oq17MQJKWhALfg4UQqs5dgvcnADVJXSrTT1+rBU887PI9tid7JbDO/COUFPQVYl
         1IMnN17aam9ASDOoYiajHmnWAkPu5NKl3/py/ke97m37QWy9AVAkmUAfvPgm+mqmgaFu
         +cw5WrbGIE6/04Z2XwMxQVfSuz3Qh4ed817D+64/XnQnwudw0IARlrWdyC5n/Mqs4XHn
         FXl3000MXbmLC4bRsbZ/RsbUiS7nMf7wpwVqxMIkzFUrOOo/GhwvqN0+j48OdD0TRDV/
         NuIXqr90XP9fzAH9yJSCUjlc3vk6fMasiTWIMBJGH7pW7xywZvyRpxDKTW2+ZwqPoLyo
         r1VA==
X-Gm-Message-State: AOAM5320dCae79LcFDP9GXAUvzx37jdnkCe9coZ9b0AFXQo5DAYAJ5qe
        W62foGJ8AdAa0V451L3xALO9HQ==
X-Google-Smtp-Source: ABdhPJwP5mEseuzXRMtsc7cX8nL3hz6cJW4XgncfSmHxiZM4W7ml3bE2nBgNNMpcrmsF8+F+kBBi0w==
X-Received: by 2002:a05:6830:1589:: with SMTP id i9mr17710247otr.273.1606762893426;
        Mon, 30 Nov 2020 11:01:33 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h8sm9886797oom.41.2020.11.30.11.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:01:32 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Nikita Travkin <nikitos.tr@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alex Elder <elder@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Alexandru Stan <amstan@chromium.org>,
        Antony Wang <antony_wang@compal.corp-partner.google.com>,
        Evan Green <evgreen@chromium.org>,
        Jishnu Prakash <jprakash@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Rob Clark <robdclark@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Terry Hsiao <a804335@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Zhen Lei <thunder.leizhen@huawei.com>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for 5.11
Date:   Mon, 30 Nov 2020 13:01:31 -0600
Message-Id: <20201130190131.345187-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.11

for you to fetch changes up to 956e9c85f47bfe874d58d96c85471f2e2ebae626:

  arm64: dts: qcom: c630: Define eDP bridge and panel (2020-11-30 11:30:30 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for 5.11

For SM8250 the recently introduced support for handling boot-loader
stream mappings in the ARM SMMU allow us to enable this, and thereby USB
controller and PHY, SDHCI controller and FastRPC, as well as support for
the SM8250 HDK board has been added. Additionally PRNG and RTC is
enabled.

Similarly for SM8150, the ARM SMMU could be added which allows the
secondary USB controller and PHYs, as well as WiFi to be added and
support for the SM8150 HDK board to be introduced. Additionally
Coresight and support for the last-level cache controller was added.

MSM8916 finally has VDDCX and VDDMX removed as regulators and are now
handled by the rpmpd driver for the devices controlling them. The
Longsheer L8150 gains touchscreen, sensors, vibrator and LED support.

MSM8992 gains USB and SDHCI support as well as an I2C controller and the
associated RMI4 based touchscreen for the Lumia 950.

MSM8994 also gains USB and SDHCI support, as well as VADC and temp-alarm
support. Then support for the Lumia 950 XL is added.

SDM845 gains interconnect properties for a number of devices and the
GENI wrappers gains iommu stream configuration, which means DMA
operations on e.g. I2C now works. The Lenovo Yoga C630 finally has the
SMMU enabled, a few fixes and the description of the eDP bridge and
panel means that the laptop can now boot mainline with working display,
GPU, WiFi and audio.

SC7180 gains a slew of smaller improvements and fixes.

----------------------------------------------------------------
Ajit Pandey (1):
      arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver

Akhil P Oommen (1):
      arm64: dts: qcom: sc7180: Add gpu cooling support

Alex Elder (3):
      arm64: dts: qcom: sc7180: limit IPA iommu streams
      arm64: dts: qcom: sc7180: use GIC_SPI for IPA interrupts
      arm64: dts: qcom: sdm845: use GIC_SPI for IPA interrupts

Alexandru Stan (1):
      arm64: dts: qcom: trogdor: Add brightness-levels

Antony Wang (1):
      arm64: qcom: sc7180: trogdor: Add ADC nodes and thermal zone for charger thermistor

Bjorn Andersson (7):
      arm64: dts: qcom: sm8150-mtp: Specify remoteproc firmware
      arm64: dts: qcom: sdm845: Limit ipa iommu streams
      arm64: dts: qcom: c630: Re-enable apps_smmu
      arm64: dts: qcom: c630: Expose LID events
      arm64: dts: qcom: c630: Polish i2c-hid devices
      arm64: dts: qcom: c630: Fix pinctrl pins properties
      arm64: dts: qcom: c630: Define eDP bridge and panel

Dmitry Baryshkov (4):
      arm64: dts: qcom: enable rtc on qrb5165-rb5 board
      arm64: dts: qcom: enable rtc on sm8250-mtp board
      arm64: dts: qcom: sm8250: add iommus entry to QUP nodes
      arm64: dts: qcom: sm8250: correct compatible for sm8250-mtp

Douglas Anderson (4):
      arm64: dts: qcom: sc7180: Fix one forgotten interconnect reference
      arm64: dts: qcom: sc7180: Provide pinconf for SPI to use GPIO for CS
      arm64: dts: qcom: Switch sc7180-trogdor to control SPI CS via GPIO
      arm64: dts: qcom: sc7180: Assign numbers to eMMC and SD

Evan Green (1):
      arm64: dts: qcom: sc7180: Add soc-specific qfprom compat string

Georgi Djakov (3):
      dt-bindings: interconnect: sdm845: Add IDs for the QUP ports
      interconnect: qcom: sdm845: Add the missing nodes for QUP
      arm64: dts: sdm845: Add interconnect properties for QUP

Jishnu Prakash (1):
      arm64: dts: qcom: pm6150x: add ADC_TM definitions

Jonathan Marek (12):
      arm64: dts: qcom: sm8150: add apps_smmu node
      arm64: dts: qcom: sm8250: add apps_smmu node
      arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
      arm64: dts: qcom: sm8250: Add USB and PHY device nodes
      arm64: dts: qcom: add sm8150 hdk dts
      arm64: dts: qcom: add sm8250 hdk dts
      arm64: dts: qcom: add sm8250 fastrpc nodes
      arm64: dts: qcom: fix serial output for sm8250-hdk
      arm64: dts: qcom: sort sm8150 usb_2 node
      arm64: dts: qcom: sm8150: Add wifi node
      arm64: dts: qcom: sm8150-mtp: Enable WiFi node
      arm64: dts: qcom: fix indentation error in sm8250 cpu nodes

Jordan Crouse (1):
      arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

Kathiravan T (1):
      arm64: dts: ipq6018: update the reserved-memory node

Konrad Dybcio (11):
      arm64: dts: qcom: pm8994: Add VADC node
      arm64: dts: qcom: pm8994: Add temperature alarm node
      arm64: dts: qcom: pm8994: Add thermal-zones for temp alarm
      arm64: dts: qcom: pm8994: Fix up spmi-gpio node
      arm64: dts: qcom: msm8992: Add support for SDHCI2
      arm64: dts: qcom: msm8994: Add SDHCI2 node
      arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
      arm64: dts: qcom: talkman: Add Synaptics RMI4 touchscreen
      arm64: dts: qcom: msm8994: Add USB support
      arm64: dts: qcom: msm8992: Add USB support
      arm64: dts: qcom: Add support for Microsoft Lumia 950 XL (Cityman)

Manivannan Sadhasivam (5):
      arm64: dts: qcom: sm8250: Add support for SDC2
      arm64: dts: qcom: rb5: Add support for uSD card
      arm64: dts: qcom: sm8250: Add support for PRNG EE
      arm64: dts: qcom: qrb5165-rb5: Add USB support
      arm64: dts: qcom: qrb5165-rb5: Add support for MCP2518FD

Matthias Kaehlcke (3):
      arm64: dts: qcom: sc7180: Add sc7180-lazor-r2/r3
      arm64: dts: qcom: sc7180: Set 'polling-delay-passive' for thermal zones back to 250 ms
      arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the default supply for pp3300_hub

Michael Srba (1):
      arm64: dts: qcom: msm8916-samsung-a3u: add nodes for touchscreen

Nikita Travkin (6):
      arm64: dts: qcom: msm8916-longcheer-l8150: Enable PM8916 vibrator
      arm64: dts: msm8916-longcheer-l8150: Add touchscreen
      arm64: dts: msm8916-longcheer-l8150: Add position sensors
      arm64: dts: qcom: msm8916-longcheer-l8150: Add flash LED
      arm64: dts: qcom: msm8916-longcheer-l8150: Add notification LED
      arm64: dts: qcom: msm8916-samsung-a2015: Disable muic i2c pin bias

Rob Clark (1):
      arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sm8150: Add Coresight support

Sibi Sankar (3):
      arm64: dts: qcom: sc7180-trogdor: Fixup modem memory region
      arm64: dts: qcom: sc7180-lite: Tweak DDR/L3 scaling on SC7180-lite
      arm64: dts: qcom: sc7180: Add DDR/L3 votes for the pro variant

Souradeep Chowdhury (1):
      arm64: dts: qcom: sm8150: Add LLC support for sm8150

Stanimir Varbanov (1):
      arm64: dts: sdm845: Add interconnect properties for Venus

Stephan Gerhold (3):
      arm64: dts: qcom: msm8916: Add RPM power domains
      arm64: dts: qcom: msm8916: Use power domains for MSS/WCNSS remoteprocs
      arm64: dts: qcom: msm8916-pm8916: Stop using s1/l3 as regulators

Stephen Boyd (3):
      arm64: dts: qcom: sc7180: Remove double pull-up on p-sensor-int-l
      arm64: dts: qcom: sc7180: Add prox sensor to LTE sku Lazor boards
      arm64: dts: sdm845: Add iommus property to qup

Taniya Das (1):
      arm64: dts: sc7180: Add camera clock controller node

Terry Hsiao (1):
      arm64: dts: qcom: sc7180-trogdor: add "pen-insert" label for trogdor

Thara Gopinath (1):
      dts: qcom: sdm845: Add dt entries to support crypto engine.

Vinod Koul (9):
      arm64: dts: sdm845: Fix dma node name
      arm64: dts: sdm630: Fix dma node name
      arm64: dts: qcs404: Fix dma node name
      arm64: dts: msm8916: Fix dma node name
      arm64: dts: msm8994: Fix dma node name
      arm64: dts: msm8996: Fix dma node name
      arm64: dts: msm8998: Fix dma node name
      arm64: dts: ipq6018: Fix dma node name
      arm64: dts: ipq8074: Fix dma node name

Zhen Lei (1):
      arm64: dts: qcom: clear the warnings caused by empty dma-ranges

 arch/arm64/boot/dts/qcom/Makefile                  |   6 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |  10 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  82 +--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   4 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 181 ++++-
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi       |   7 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  21 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |  29 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  40 +-
 .../boot/dts/qcom/msm8992-msft-lumia-talkman.dts   |  28 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi              | 120 +++
 .../boot/dts/qcom/msm8994-msft-lumia-cityman.dts   |  73 ++
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  94 ++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |  10 +
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |  24 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |  96 ++-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           | 108 +++
 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi          |  18 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |  11 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts   |   4 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  |  12 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |  15 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |  17 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |  26 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |  15 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   7 +-
 .../boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi      |   4 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |  16 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       | 106 ++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 281 +++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  11 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 206 +++++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 183 ++++-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 463 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |  17 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 801 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            | 454 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 491 ++++++++++++-
 drivers/interconnect/qcom/sdm845.c                 |   3 +
 include/dt-bindings/interconnect/qcom,sdm845.h     |   2 +
 46 files changed, 3899 insertions(+), 217 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
