Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB8F276783
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 06:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgIXEGN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 00:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgIXEGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 00:06:13 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120C6C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 21:06:13 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id m25so450000oou.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 21:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXoSLNqZVoHDJkVPYCEZ/kmwZ5B1mkbdXB+4FWwWXJU=;
        b=hzlj0YitK8rKw7D4r2Rz9Id5CoF/gxe4ypl9sHc819ug0XPSW0nDTDQBzLlDMNnShI
         EPxtUtOHtFbqQ5nDffZewDSg5DvGMCPar/OufmUHnydHur75VgabkoM/Mei5llW0ej8U
         Dvh0S2lga8Y7HEBNODZkBtWpMrJb4KEU7qoM2BZaiRCvb4qS2o3JfiO0EMye0vOLF0r/
         miT7wQPma8Pv5xU2r3Fv3Hgr0bF9aph98PXWXTuoCbZufxRqZnHLCRT6+EKr7lLyPpFT
         4Iw00jk5VBKnM3R0g3JnqHSGpI86mFX6OjfcEYeLBli1KUPNUSCvwEKxk1/Yk/wtnq2s
         Qd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXoSLNqZVoHDJkVPYCEZ/kmwZ5B1mkbdXB+4FWwWXJU=;
        b=ej8RVkkvPgxtseWHzRxieKAVMoAG7rFtkVUtk/qg/HUioao8K402hjdJ4zjZqMY47L
         oim0ELVVhl7rGHi64tGKnl+V25GHJAhqoRVILAoK3OsKpN/IZcO4DxzdP3b729kYc/Ev
         olkalp5yzkCZ1NleuV5HKziFR+u7zbCXHC8P8NgEfT7rU4uOW3yZhsc6n1cHQoJ1kITb
         ncfo5aBsv+ai30Rc1+ij5zS9iJI3EF9kSlh/0YAZAhUsDUgIC47qtrdyOk7rKC5KvujH
         BElC7liEpsYqR/pXGlnJ7P9aCuRI0tJ5L5efTkTCkyVft5C7AoZdrOUjf84n9LtRuT33
         W5NA==
X-Gm-Message-State: AOAM531/NbZmNs0s2uMHBJQE7ktesFHkYYOAo49HtrvtcwSM9kweIZTU
        LiI4DzoUM4EWWmLjVWFyT2ClXRkE2OOxQsEu
X-Google-Smtp-Source: ABdhPJwYCuucUCS0SaMBZyREWARWZ/daLJtBRRIm/ib4w5pfeRTY1Km1C1q2GktgoX9fyHSZjYV9zg==
X-Received: by 2002:a4a:d04c:: with SMTP id x12mr1965876oor.61.1600920372277;
        Wed, 23 Sep 2020 21:06:12 -0700 (PDT)
Received: from localhost.localdomain (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id c7sm544717ots.20.2020.09.23.21.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 21:06:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        satya priya <skakit@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Adrian Schmutzler <freifunk@adrianschmutzler.de>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for v5.10
Date:   Wed, 23 Sep 2020 23:06:07 -0500
Message-Id: <20200924040607.180039-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.10

for you to fetch changes up to bac12f2569d1e2378d8de59eefbaa1d0ef5101dc:

  arm64: dts: qcom: sm8250: Add thermal zones and throttling support (2020-09-24 03:06:48 +0000)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for v5.10

Cleanup, refactor and modernize MSM8916 by sorting nodes, moving device
and platform specific parts to their respective files, add and use
labels for reference nodes and use IRQ defines. Migrate TCSR mutex off
the depricated binding, add resin node for PM8916.

Add LPASS clock controller for SC7180. Fix the LLCC reg, increase
interconnect-cells, drop flags on MDSS irqs. Add interconnects for
display, eMMC and SD-card, specify 'sustainable_power' for CPU thermal
zones, improve pinconf states related to UART and Bluetooth. Add new DT
for Lazor and Trogdor.

Increase #interconnect-cells for SDM845 to allow tags, add OPP tables
and power-domains for Venus and interconnects for display. Fix the ports
on the HDMI nodes for DB845c and add DT for the Xiaomi Poco F1.

Add interconnect providers, fix up primary USB's clock and use
dt-binding defines for GPU clocks on SM8150.

Add interconnect providers, CPUfreq, thermal configuration and missing
uarts for SM8250. Fix up naming of debug uart, add always-on supply
clock to gcc, fix up the sleep clock rate and define OPP tables for all
QUP devices. Then add a new DeviceTree for the QRB5165 RB5 board.

Enable watchdog on IPQ8074 and use the appropriate compatible for the
PMU node. Enable DVFS support for IPQ6018.

Finally correct the spelling of "interrupts" in MSM8992 uart node, fix
missing # in PM660 #interrupt-cells, add second VFE power-domain to
camss in MSM8996 and sort the Makefile.

----------------------------------------------------------------
Adrian Schmutzler (1):
      arm64: dts: qcom: replace status value "ok" by "okay"

Amit Kucheria (1):
      arm64: dts: qcom: sm8250: Add thermal zones and throttling support

Amit Pundir (1):
      arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)

Bjorn Andersson (1):
      arm64: dts: qcom: sm8250: Add cpufreq hw node

Dmitry Baryshkov (4):
      arm64: dts: qcom: sm8250: add bi_tcxo_ao to gcc clocks
      arm64: dts: qcom: sm8250-mtp: add i2c device tree nodes
      arch64: dts: qcom: sm8250: add uart nodes
      arm64: dts: sm8250: Add OPP table for all qup devices

Douglas Anderson (1):
      arm64: dts: qcom: Add sc7180-lazor sku2

Georgi Djakov (2):
      arm64: dts: qcom: sdm845: Increase the number of interconnect cells
      arm64: dts: qcom: sdm845: Add interconnects property for display

Gokul Sriram Palanisamy (1):
      dt-bindings: qcom: Add ipq8074 bindings

Jonathan Marek (6):
      arm64: dts: qcom: sm8150: fix up primary USB nodes
      arm64: dts: qcom: use sm8150 gpucc dt-bindings
      arm64: dts: qcom: use sm8250 gpucc dt-bindings
      arm64: dts: qcom: sm8250: use the right clock-freqency for sleep-clk
      arm64: dts: qcom: sm8150: add interconnect nodes
      arm64: dts: qcom: sm8250: add interconnect nodes

Kathiravan T (4):
      arm64: dts: ipq8074: enable watchdog support
      dt-bindings: mailbox: add compatible for the IPQ6018 SoC
      arm64: dts: ipq6018: enable DVFS support
      arm64: dts: ipq8074: Use the A53 PMU compatible

Krishna Manikandan (2):
      arm64: dts: qcom: sc7180: add interconnect bindings for display
      arm64: dts: sc7180: add bus clock to mdp node for sc7180 target

Krzysztof Kozlowski (1):
      arm64: dts: qcom: msm8992: Fix UART interrupt property

Manivannan Sadhasivam (6):
      dt-bindings: arm: qcom: Document SM8250 SoC and boards
      arm64: dts: qcom: sm8250: Rename UART2 node to UART12
      arm64: dts: qcom: Add basic devicetree support for QRB5165 RB5
      arm64: dts: qcom: qrb5165-rb5: Add onboard LED support
      arm64: dts: qcom: qrb5165-rb5: Add gpio-line-names for TLMM block
      arm64: dts: qcom: qrb5165-rb5: Add gpio-line-names for PM8150(B&L)

Matthias Kaehlcke (1):
      arm64: dts: qcom: sc7180: Add 'sustainable_power' for CPU thermal zones

Pradeep P V K (1):
      arm64: dts: qcom: sc7180: Add bandwidth votes for eMMC and SDcard

Rajendra Nayak (2):
      arm64: dts: qcom: sdm845: Add OPP tables and power-domains for venus
      arm64: dts: qcom: sc7180: Add OPP tables and power-domains for venus

Rob Clark (1):
      arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt

Robert Foss (1):
      arm64: dts: qcom: msm8996: Add VFE1_GDSC power domain to camss node

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sc7180: Fix the LLCC base register size

Sibi Sankar (3):
      arm64: dts: qcom: sc7180: Increase the number of interconnect cells
      arm64: dts: qcom: sm8150: Add OSM L3 interconnect provider
      arm64: dts: qcom: sm8250: Add EPSS L3 interconnect provider

Stephan Gerhold (24):
      arm64: dts: qcom: apq8016-sbc: Remove properties that are already default
      arm64: dts: qcom: msm8916: Declare sound node in msm8916.dtsi
      arm64: dts: qcom: apq8016-sbc: Define leds outside of soc node
      arm64: dts: qcom: msm8916: Add more labels
      arm64: dts: qcom: msm8916: Use labels in board device trees
      arm64: dts: qcom: pm8916: Add resin node
      arm64: dts: qcom: msm8916: Move PM8916-specific parts to msm8916-pm8916.dtsi
      arm64: dts: qcom: msm8916: Move more supplies to msm8916-pm8916.dtsi
      arm64: dts: qcom: msm8916: Set default pinctrl for blsp1_uart1/2
      arm64: dts: qcom: msm8916: Move common USB properties to msm8916.dtsi
      arm64: dts: qcom: msm8916: Configure DSI port with labels
      arm64: dts: qcom: msm8916: Remove one more thermal trip point unit name
      arm64: dts: qcom: pm8916: Remove invalid reg size from wcd_codec
      arm64: dts: qcom: msm8916: Fix MDP/DSI interrupts
      arm64: dts: qcom: msm8916: Use IRQ defines, add IRQ types
      arm64: dts: qcom: msm8916: Drop qcom,tcsr-mutex syscon
      arm64: dts: qcom: msm8916: Minor style fixes
      arm64: dts: qcom: msm8916: Add MSM8916-specific compatibles to SCM/MSS
      arm64: dts: qcom: msm8916: Use more generic node names
      arm64: dts: qcom: msm8916: Rename "x-smp2p" to "smp2p-x"
      arm64: dts: qcom: msm8916: Pad addresses
      arm64: dts: qcom: msm8916: Sort nodes
      arm64: dts: qcom: pm8916: Sort nodes
      arm64: dts: qcom: Makefile: Sort lines

Stephen Boyd (2):
      arm64: dts: qcom: sc7180: Drop flags on mdss irqs
      arm64: dts: qcom: trogdor: Add labels for type-c ports

Taniya Das (1):
      arm64: dts: qcom: sc7180: Add LPASS clock controller nodes

Tanmay Shah (1):
      arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt node

Venkata Lakshmi Narayana Gubba (1):
      arm64: dts: qcom: sc7180: Remove clock for bluetooth on SC7180 IDP board

Vinod Koul (1):
      arm64: dts: qcom: sdm845-db845c: Fix hdmi nodes

satya priya (3):
      arm64: dts: qcom: sc7180: Improve the uart3 pin config for sc7180-idp
      arm64: dts: qcom: sc7180: Add wakeup support for BT UART on sc7180-idp
      arm64: dts: qcom: sc7180-trogdor: Add wakeup support for BT UART

Łukasz Patron (1):
      arm64: dts: qcom: pm660: Fix missing pound sign in interrupt-cells

 Documentation/devicetree/bindings/arm/qcom.yaml    |   11 +
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   16 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |  900 +++----
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    6 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   96 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   34 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   10 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |  108 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi          |   14 +-
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi       |   79 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  132 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   12 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 2608 ++++++++++----------
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |    2 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   92 +-
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts       |    2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |   12 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  686 +++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   66 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |   24 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts   |   17 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  |   18 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |   15 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |  192 ++
 .../boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi      |   15 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dts |   14 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |  191 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       | 1402 +++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  332 ++-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   14 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |  380 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   92 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  111 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   32 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 1059 +++++++-
 38 files changed, 6559 insertions(+), 2241 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
