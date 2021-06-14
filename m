Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D443A7216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 00:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhFNWjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 18:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhFNWjd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 18:39:33 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51D2C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 15:37:14 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id u11so16043029oiv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cyCtRtT+mICrPBAoC23ybyIuEymKjVLWTwMFu7raFCM=;
        b=P26onskmY/YfQ5VdVAv/0az7pOHyEHV9OUoItMew5RI/l03Y7ZjkI041V3eifcQKWr
         hlH/c3XaOKxSlybL6cEBMupeS8mW/Gen6fnYtlWAFk3MrJcmzNyH7ZtL+41p9/vQTiiJ
         RLtjLQToEcvEBPBVPUn9U3YlQ06dKSR+fj5pt0sKAaeX1nD7oDOe7B7+Dobg/XsU2xiF
         GVq/f4EomUZStw/1zdCSeX+YUL1/pxzThPmWt6vLCn86IaPfywBAoBmpA+zDLZTsQVVN
         A36+92yem0ru5Yt5DL5MBLv1wZd84cHCbup+80qH2UigMl3KAT649/2xDxIGH9mfFE2H
         bVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cyCtRtT+mICrPBAoC23ybyIuEymKjVLWTwMFu7raFCM=;
        b=bCGYtn9jbPjAO2hzt98SG88te1yEWAt6wJwrrMMaAlXSKoRiqvfZ2umHpWrGdJsaaW
         wpLKqAXOW4N72/EJU5qWIvIlNb/5GB8HPci+O3nUXIuXjDcFqtlXd9FhZqfMAezPKaOj
         sGvV+jySJA517zxOXrFCDywKid46Xz3zxyJQexQPx2s34IWmbbc0iriKQcHIL3OeD4KC
         nnZcKAvOpBhEJ07U7O3o6hG1RchXbF+sOySCU/8Y/2aLoH7qdWOAHFy8D5E7g1i9eAIj
         XCypao/l9m23xD6+v+xnvIbabdVKIbjyHc55Cgv+4uam952nuiNzamGFcbBNRDfboXst
         rK8Q==
X-Gm-Message-State: AOAM5304fIhEusNmzRkeAdahc5rEOhrM4qIxyDBKrT5pPrlfsjiBPGzR
        qVZlyN0SDWqYV7+YwiW8ptefGg==
X-Google-Smtp-Source: ABdhPJxFhhsKMad/SxvjSu/5xOM1kO7mAy98LiEw4mkjYAHiSQ2AtpR2r5PgsEIdkvo+A/KT3c3jVA==
X-Received: by 2002:aca:b3c4:: with SMTP id c187mr944557oif.74.1623710234088;
        Mon, 14 Jun 2021 15:37:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c64sm1197331oif.30.2021.06.14.15.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:37:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        satya priya <skakit@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alex Elder <elder@linaro.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Felipe Balbi <felipe.balbi@microsoft.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rajeshwari Ravindra Kamble <rkambl@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Joel Selvaraj <jo@jsfamily.in>,
        Jonathan Marek <jonathan@marek.ca>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Petr Vorel <petr.vorel@gmail.com>,
        Robert Marko <robimarko@gmail.com>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Wenchao Han <hanwenchao@huaqin.corp-partner.google.com>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for v5.14
Date:   Mon, 14 Jun 2021 17:37:12 -0500
Message-Id: <20210614223712.393096-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.14

for you to fetch changes up to 81cfa462e458405f58b23f45ddd9439c70bf5347:

  arm64: dts: qcom: sc7180: Add xo clock for eMMC and Sd card (2021-06-14 11:29:46 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for v5.14

MSM8916 gains new support for Huawei Ascend G7, with NFC, sensors and
touchscreen. The Samsung Galaxy A3/A5 gains battery support, touch keys,
NFC.

MSM8996 received more cleanup and refactoring, preparing for upcoming
new devices. Note worthy is the long pending enablement of CPUfreq.

SC7180 continues to stabilize, with a range of small fixes for various
bits and pieces, and new revisions for the CoachZ and pompom devices.

SC7280 continues to grow, with more clock controllers, thermal sensors,
thermal zones, CPUfreq and interconnect providers.

Xiaomi Poco F1 gaines audio support and the OnePlus 6/6T gaines IPA
support.

SM8350 gains some cleanups and the IPA device is enabled.

Initial support for the Microsoft Surface Duo, based on SM8150, is
added.

IPQ8074 gained support for the HK10 board.

----------------------------------------------------------------
Alex Elder (3):
      arm64: dts: qcom: sm8350: add IPA information
      arm64: dts: qcom: sm8350-mtp: enable IPA
      arm64: dts: qcom: sdm845-mtp: enable IPA

Caleb Connolly (2):
      arm64: dts: qcom: sdm845-oneplus-common: guard rmtfs-mem
      arm64: dts: qcom: sdm845-oneplus-common: enable ipa

Douglas Anderson (1):
      arm64: dts: qcom: sc7180: Fix sc7180-qmp-usb3-dp-phy reg sizes

Felipe Balbi (2):
      arm64: dts: qcom: sm8150: Add DMA nodes
      arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo

Gokul Sriram Palanisamy (1):
      arm64: dts: qcom: Add board support for HK10

Harigovindan P (1):
      arm64: dts: qcom: sc7180: add nodes for idp display

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add audio support

Jonathan Marek (1):
      arm64: dts: qcom: sm8250: fix display nodes

Judy Hsiao (1):
      arm64: dts: qcom: sc7180: add label for secondary mi2s

Konrad Dybcio (14):
      arm64: dts: qcom: msm8996: Sanitize pins
      arm64: dts: qcom: msm8996-*: Clean up QUP and UART names
      arm64: dts: qcom: msm8996: Enlarge tcsr_mutex_regs size
      arm64: dts: qcom: msm8996: Add SDHCI1
      arm64: dts: qcom: msm8996: Add BLSP2_I2C5 and BLSP2_I2C6
      arm64: dts: qcom: msm8996: Disable MDSS and Adreno by default
      arm64: dts: qcom: msm8996: Disable Venus by default
      arm64: dts: qcom: pm8994: Add RESIN node
      arm64: dts: qcom: msm8996: Add DSI0 nodes
      arm64: dts: qcom: pmi8994: Add WLED node
      arm64: dts: qcom: msm8996: Clean up the SDHCI2 node
      arm64: dts: qcom: msm8996: Strictly limit USB2 host to USB2 speeds
      arm64: dts: qcom: msm8996: Add DMA to QUPs and UARTs
      arm64: dts: qcom: msm8996: Make CPUCC actually probe (and work)

Loic Poulain (2):
      arm64: dts: qcom: msm8996: Rename speedbin node
      arm64: dts: qcom: msm8996: Add CPU opps

Matthias Kaehlcke (5):
      arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal zone
      arm64: dts: qcom: sc7180: Add pompom rev3
      arm64: dts: qcom: sc7180: Add CoachZ rev3
      arm64: dts: qcom: sc7180: coachz: Add thermal config for skin temperature
      arm64: dts: qcom: pm6150: Add thermal zone for PMIC on-die temperature

Michael Srba (1):
      arm64: dts: qcom: msm8916-samsung-a3u: Add touch key regulators

Odelu Kukatla (1):
      arm64: dts: sc7280: Add interconnect provider DT nodes

Petr Vorel (1):
      arm64: dts: qcom: msm8994-angler: Fix gpio-reserved-ranges 85-88

Rajendra Nayak (2):
      dt-bindings: arm: qcom: Document google,senor board
      arm64: dts: qcom: sc7280: Add "google,senor" to the compatible

Rajeshwari Ravindra Kamble (2):
      arm64: dts: qcom: SC7280: Add device node support for TSENS
      arm64: dts: qcom: SC7280: Add thermal zone support

Robert Marko (1):
      arm64: dts: qcom: ipq8074: disable USB phy by default

Roja Rani Yarubandi (1):
      arm64: dts: qcom: sc7180: Remove QUP-CORE ICC path

Serge Semin (1):
      arm64: dts: qcom: Harmonize DWC USB3 DT nodes name

Sergey Senozhatsky (1):
      arm64: dts: qcom: remove camera_mem region

Shaik Sajida Bhanu (1):
      arm64: dts: qcom: sc7180: Add xo clock for eMMC and Sd card

Sibi Sankar (2):
      dt-bindings: mailbox: Add WPSS client index to IPCC
      arm64: dts: qcom: sc7280: Add nodes to boot WPSS

Srinivasa Rao Mandadapu (1):
      arm64: dts: qcom: sc7180: Add wakeup delay for adau codec

Stephan Gerhold (9):
      arm64: dts: qcom: msm8916-samsung-a2015: Add touch key
      arm64: dts: qcom: msm8916-samsung-a5u: Add touch key regulator
      arm64: dts: qcom: msm8916-samsung-a2015: Add rt5033 battery
      arm64: dts: qcom: msm8916-samsung-a2015: Add NFC
      arm64: dts: qcom: msm8916: Add device tree for Huawei Ascend G7
      arm64: dts: qcom: msm8916-huawei-g7: Add touchscreen
      arm64: dts: qcom: msm8916-huawei-g7: Add sensors
      arm64: dts: qcom: msm8916-huawei-g7: Add display regulator
      arm64: dts: qcom: msm8916-huawei-g7: Add NFC

Stephen Boyd (6):
      arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
      arm64: dts: qcom: c630: Add no-hpd to DSI bridge node
      arm64: dts: qcom: sc7180: Disable PON on Trogdor
      arm64: dts: qcom: sc7180: Remove cros-pd-update on Trogdor
      arm64: dts: qcom: sdm845: Remove cros-pd-update on Cheza
      arm64: dts: qcom: sc7180-trogdor: Update flash freq to match reality

Sujit Kautkar (3):
      arm64: dts: qcom: sc7180: Move rmtfs memory region
      arm64: dts: qcom: sc7180: Move sdc pinconf to board specific DT files
      arm64: dts: qcom: sc7180: SD-card GPIO pin set bias-pull up

Taniya Das (2):
      arm64: dts: qcom: sc7280: Add cpufreq hw node
      arm64: dts: qcom: sc7280: Add clock controller nodes

Vincent Knecht (1):
      arm64: dts: qcom: msm8916-alcatel-idol347: enable touchscreen

Vinod Koul (2):
      arm64: dts: qcom: sm8350: use interconnect enums
      arm64: dts: qcom: sm8350: fix the node unit addresses

Wenchao Han (1):
      arm64: dts: qcom: sc7180: Modify SPI_CLK voltage level for trogdor

Yassine Oudjana (2):
      arm64: dts: qcom: msm8996: Disable ADSP and add power domains
      arm64: dts: qcom: msm8996: Add usb3 interrupts

satya priya (10):
      arm64: dts: qcom: sm8350: Add label for thermal-zones node
      arm64: dts: qcom: pm7325: Add pm7325 base dts file
      arm64: dts: qcom: pm8350c: Add temp-alarm support
      arm64: dts: qcom: pm8350c: Correct the GPIO node
      arm64: dts: qcom: pmr735a: Add temp-alarm support
      arm64: dts: qcom: pmr735a: Correct the GPIO node
      arm64: dts: qcom: pmk8350: Add peripherals for pmk8350
      arm64: dts: qcom: pmk8350: Correct the GPIO node
      arm64: dts: qcom: sc7280: Include PMIC DT files for sc7280-idp
      arm64: dts: qcom: sc7280: Add ADC channel nodes for PMIC temperatures to sc7280-idp

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   10 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       |   93 +-
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |   24 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts       |   11 +
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts       |   10 +
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |   76 ++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |    5 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |   26 +
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |  454 ++++++++
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  131 +++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   47 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |   26 +
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |    4 +
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi         |  653 -----------
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  999 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   24 +
 arch/arm64/boot/dts/qcom/pm7325.dtsi               |   53 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   32 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |   13 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   51 +-
 arch/arm64/boot/dts/qcom/pmr735a.dtsi              |   32 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |    2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |  169 ++-
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts |    4 +-
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     |   22 +-
 ...r2-lte.dts => sc7180-trogdor-coachz-r3-lte.dts} |    6 +-
 ...-coachz-r2.dts => sc7180-trogdor-coachz-r3.dts} |    4 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   64 ++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |    9 -
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |    9 -
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |    9 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    9 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |   12 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |    4 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |   38 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts |   14 +
 .../boot/dts/qcom/sc7180-trogdor-pompom-r3.dts     |   15 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |   29 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  121 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  122 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   36 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 1171 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    4 -
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    5 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   18 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |  114 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |    4 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    2 +
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |  543 +++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   72 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    6 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   64 +-
 include/dt-bindings/mailbox/qcom-ipcc.h            |    1 +
 59 files changed, 4518 insertions(+), 979 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2-lte.dts => sc7180-trogdor-coachz-r3-lte.dts} (69%)
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2.dts => sc7180-trogdor-coachz-r3.dts} (75%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
