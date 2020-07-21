Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBE92277BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 06:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgGUEvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 00:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgGUEva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 00:51:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8A0C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:51:30 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u185so10152024pfu.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 21:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLyKLFp621O5dy1gu2KZuywLvD+mnFb68qiZQzWdUKU=;
        b=taRfzuEcq0y5dvRzSjtl6N4+DuRLUpk2D+9hiTtwK8tH8Blnqej4UXrOgovOVuC/c3
         +tN/AgVfFMAZ29C1yhuJt+D6qczvdLOnrUf7niofQ5piySSgMrg7SnPY8G3bEkKyUS5b
         kYt/QM4Y/gRJafO4Fp7wazBOkNphDNMOzMBnBIuIXFfop7zqLmOKjnqE9itEuHqnKJTq
         DqcC5GxF1ihAZbwc2Nks4yC1sZwDkE3w+31EPucTalRCmrMuQfz7mVK3/g6H4oJU82p1
         9f1Nf3Tr9p9roHCEpPrWkfnEFsPZjTfClcyuqUZ1sFpamxQ6tBT7BSzbtZxGrlKAeYlY
         9YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLyKLFp621O5dy1gu2KZuywLvD+mnFb68qiZQzWdUKU=;
        b=kerl5IHT/1WQIghtiCPdffqDTFE7+pBIyZH0sgoKVhCAd47rBP/7vMiDn/MCmz7Qy+
         uhjBO57QhgsHeRsSiQI40He4pYC1NszLVuTaEWBeN9acdEjijPWv8b+E40bC6BMnBb4i
         4reYORHV4W0LQolggW4qmAIJzkDs4idu2yT5C+plOCtirnG5K8CLrlFjaILQt8ZN/O84
         PIi/lmvsyzNxqLDu5GYKz6aiEdavHJ+iE4Bk68567atQVufpBT58ZCtuGpEmB8L+M6h/
         p8zR6Ceu3fptMWflsDDwK4rJ4NiwxLl6WzZu+DfDdHeEp8CcXxmxpFVsJagPEZq+MIB9
         IS9A==
X-Gm-Message-State: AOAM533pA7wW48AqJuvezamSfinr80qDx1/rbCzm2TwEkV9270bE+zum
        mr94cVtt9FXp0YJbuMw7hsehGYei8tk=
X-Google-Smtp-Source: ABdhPJzqLrqQeCMScOm2W62ybF4tLIIKYDIqYaCcIrgo0MnmXnCKd0NHet71q9c5ysgLBapETnHFvA==
X-Received: by 2002:a62:8688:: with SMTP id x130mr22717545pfd.280.1595307089531;
        Mon, 20 Jul 2020 21:51:29 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 7sm16332175pgw.85.2020.07.20.21.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 21:51:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Rakesh Pillai <pillair@codeaurora.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Biggers <ebiggers@google.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jack Pham <jackp@codeaurora.org>,
        Martin Botka <martin.botka1@gmail.com>,
        Nisha Kumari <nishakumari@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for v5.9
Date:   Mon, 20 Jul 2020 21:49:34 -0700
Message-Id: <20200721044934.3430084-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.9

for you to fetch changes up to 208921bae696d92f6a10681cfef2df0bb68f091a:

  arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators (2020-07-18 22:37:33 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for v5.9

For SM8250 this adds the main pinctrl/gpio block (TLMM), I2C and SPI
controllers, the CPU subsytem watchdog, inter-processor signalling
controller (IPCC), always-on power/clock controller (AOSS),
inter-processor state machine (SMP2P), defines remoteproc controls
for audio, compute and sensor processors and base definition for the
PM8009 PMIC. It also does fix up a few minor issues from the initial
merge of the platform support.

SC7180 and SDM845 gains interconnect paths and performance tables
defined for display, QUP, QSPI, SDHC and CPUs.

SC7180 gains WiFi support and some cleanups related to the modem
remoteproc.

SDM845 gains inline crypto engine support for UFS, LAB/IBB
regulators for powering display panels, remoteproc relocation debug
support

SM8150 gains USB controller support and the two related PHYs, as well as
thermal zones and throttling support.

IPQ8074 gains USB and SDHCI support.

MSM8916 is being cleaned up, gains interconnect providers and Samsung
A2015 gains accelerometer and magnetometer support.

MSM8994 gains PSCI, SDHCI, SPMI support, I2C, SPI, UART gains DMA
support and the DTS files are cleaned up.

The SDM630 platform DTS is at last merged and initial support for Sony
Xperia 10, 10 Plus, XA2, XA2 Plus and XA2 Ultra is added.

----------------------------------------------------------------
Akash Asthana (1):
      arm64: dts: sc7180: Add interconnect for QUP and QSPI

Amit Kucheria (2):
      dt-bindings: thermal: qcom-tsens: Add compatible for sm8150, sm8250
      arm64: dts: qcom: sm8150: Add thermal zones and throttling support

Bjorn Andersson (9):
      arm64: dts: qcom: sm8250: Add TLMM pinctrl node
      arm64: dts: qcom: sm8250-mtp: Drop PM8150 ldo11
      arm64: dts: qcom: sm8250: Add IPCC
      arm64: dts: qcom: sm8250: Add QMP AOSS node
      arm64: dts: qcom: sm8250: Add SMP2P nodes
      arm64: dts: qcom: sm8250: Add remoteprocs
      arm64: dts: qcom: qcs404: Add IMEM and PIL info region
      arm64: dts: qcom: sdm845: Add IMEM and PIL info region
      arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon

Dmitry Baryshkov (5):
      arm64: dts: qcom: sm8250: add watchdog device
      arm64: dts: qcom: pm8009: Add base dts file
      arm64: dts: qcom: sm8250-mtp: include pmic files
      arm64: dts: qcom: pm8150x: add thermal alarms and thermal zones
      arm64: dts: qcom: sm8250: add I2C and SPI nodes

Douglas Anderson (1):
      arm64: dts: qcom: Fix WiFi supplies on sc7180-idp

Eric Biggers (1):
      arm64: dts: sdm845: add Inline Crypto Engine registers and clock

Georgi Djakov (1):
      arm64: dts: msm8916: Add interconnect provider DT nodes

Jack Pham (1):
      arm64: dts: qcom: sm8150: Add USB and PHY device nodes

Jeffrey Hugo (3):
      arm64: dts: qcom: msm8998-mtp: Fix label on l15 regulator
      arm64: dts: qcom: msm8998-clamshell: Fix label on l15 regulator
      arm64: dts: qcom: lenovo630: Add Modem firmware files

Jonathan Marek (4):
      arm64: dts: qcom: sm8250: use dt-bindings defines for clocks
      arm64: dts: qcom: sm8250: rename spmi node to spmi_bus
      arm64: dts: qcom: sm8250: sort nodes by physical address
      arm64: dts: qcom: sm8250: change ufs node name to ufshc

Konrad Dybcio (11):
      arm64: dts: qcom: pm660(l): Add base dts files
      arm64: dts: qcom: sdm630: Add sdm630 dts file
      arm64: dts: qcom: Add support for Sony Xperia XA2/Plus/Ultra (Nile platform)
      arm64: dts: qcom: msm8994: Modernize the DTS style
      arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device
      arm64: dts: qcom: msm8994: Add a proper CPU map
      arm64: dts: qcom: msm8994: Add SDHCI1 node
      arm64: dts: qcom: msm8994: Add I2C, SPI and BLSP DMA nodes
      arm64: dts: qcom: msm8994: Add pmu node
      arm64: dts: qcom: msm8994: Add PSCI node
      arm64: dts: qcom: angler: Add qcom,msm-id and pmic-id

Martin Botka (1):
      arm64: dts: qcom: Add support for Sony Xperia 10/10 Plus (Ganges platform)

Nisha Kumari (1):
      arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators

Rajendra Nayak (8):
      arm64: dts: sdm845: Add qspi opps and power-domains
      arm64: dts: sc7180: Add qspi opps and power-domains
      arm64: dts: sdm845: Add OPP table for all qup devices
      arm64: dts: sc7180: Add OPP table for all qup devices
      arm64: dts: sdm845: Add sdhc opps and power-domains
      arm64: dts: sc7180: Add sdhc opps and power-domains
      arm64: dts: sdm845: Add DSI and MDP OPP tables and power-domains
      arm64: dts: sc7180: Add DSI and MDP OPP tables and power-domains

Rakesh Pillai (2):
      arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
      arm64: dts: qcom: sc7180: Add missing properties for Wifi node

Sibi Sankar (4):
      arm64: dts: qcom: sc7180: Add cpu OPP tables
      arm64: dts: qcom: sc7180: Drop the unused non-MSA SID
      arm64: dts: qcom: sdm845: Add cpu OPP tables
      arm64: dts: qcom: sc7180: Move the fixed-perm property to SoC dtsi

Sivaprakash Murugesan (2):
      arm64: dts: ipq8074: enable sdhci node
      arm64: dts: ipq8074: enable USB support

Stephan Gerhold (8):
      arm64: dts: qcom: msm8916: Set #address-cells for lpass
      arm64: dts: qcom: msm8916: Replace invalid bias-pull-none property
      arm64: dts: qcom: msm8916: Pull down PDM GPIOs during sleep
      arm64: dts: qcom: apq8016-sbc: Replace spaces with tabs
      arm64: dts: msm8916-samsung/longcheer: Move pinctrl/regulators to end of file
      arm64: dts: qcom: msm8916: Simplify pinctrl configuration
      arm64: dts: qcom: msm8916: Use higher I2C drive-strength only on DB410c
      arm64: dts: qcom: msm8916-samsung-a2015: Add accelerometer/magnetometer

Stephen Boyd (1):
      arm64: dts: qcom: sc7180: Move mss node to the right place

 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    5 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |  262 ++--
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   28 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  189 +++
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   42 +-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         |  861 ++++-------
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  150 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   20 +-
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |   20 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   31 +
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |    2 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |   30 -
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  595 +++++++-
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |    2 +-
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    5 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |   50 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   36 +
 arch/arm64/boot/dts/qcom/pm8009.dtsi               |   37 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |   42 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |   44 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   44 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   12 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   15 +
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   15 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  573 +++++++-
 .../dts/qcom/sdm630-sony-xperia-ganges-kirin.dts   |   13 +
 .../boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi   |   40 +
 .../dts/qcom/sdm630-sony-xperia-nile-discovery.dts |   13 +
 .../dts/qcom/sdm630-sony-xperia-nile-pioneer.dts   |   13 +
 .../dts/qcom/sdm630-sony-xperia-nile-voyager.dts   |   20 +
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |  136 ++
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 1174 +++++++++++++++
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |   20 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  507 ++++++-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |   21 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  903 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   30 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 1525 +++++++++++++++++++-
 41 files changed, 6473 insertions(+), 1058 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm660.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm660l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
