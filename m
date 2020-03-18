Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBBBC1894FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 05:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgCREie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 00:38:34 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37175 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgCREie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 00:38:34 -0400
Received: by mail-pj1-f67.google.com with SMTP id ca13so654315pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 21:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=E65jDiVqebjNzL9E9brggzHs8VPxaJs856eFDKIjQwY=;
        b=ukSU2cLZMHHztJJCKW0IeEevQj4F2vNWVw4cqb8lcUUFCz5eTwF8sNMLxCkjW/h6IW
         ID1XJfDB4/46hhotDyLgCunSrNLblQ+aPPR1OHqwLBIuEbMfRkYXxMf8nmgrA9gSymkb
         WEZ1vzPedLo6nDnj93fLFHSB9880lU4+3V+rPMtlpdNm61h9WHVi8TMmkupevXsQEiqj
         GBa3u/uFnPU4UGgQS1P39uCGWwIAwfXZ1PdyF0dsyP2kKPWq/+4fcExwHeIMFMqrQQQb
         hXI/Tqsxc2HUhYGIh52TSDMcNUeD7M0r3c4CEc6i/QE1YMnksVRwL5c+yJMJx9fwHza/
         nXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=E65jDiVqebjNzL9E9brggzHs8VPxaJs856eFDKIjQwY=;
        b=S+pY8PBU2DlHpnMSGIlim2qdyoNaSbS1HxQPXxAvR9nt6hKFEfzsQsRgIQQQ/2t3x8
         /TTARz27tldf58yBwspwPeyhqCrFqRIhAQKuCrhQs8OXZ/AgcJ666IG7zHArOghVQyF/
         N++O3aS4xYqrz2dSjJXAa0SJqGzl9btlM/mhlkAQpkQ8WlWU3b/rxAldsB87E2645cNG
         e/8BZZ4/zZz8V9NzV8uwgUkuy4/t3UrOmwFK/zz+EnaAIsNtOA0FAKkQ2YDdz//kDbi7
         F0a4S/qySGJhUDcKDRYts7JXdCKzC/R/ks8VfnKNiAuyfRtsrU5JWkzTutKsl/s63GLS
         g+QQ==
X-Gm-Message-State: ANhLgQ2wIdgjIk0cCz2misVaczpYSNBc2UOyHpsnNI2ONVb7imuKRGST
        vpC4IUPISl0lsTR1Xa9ypueclA==
X-Google-Smtp-Source: ADFU+vsHeUFd79bp4tdw3X+CGiJ9Kq+RQ17IFfN8vyKvs9NkeA33PhOAPGgEO2FYwmZMlZEXN5+aWQ==
X-Received: by 2002:a17:90a:ab0a:: with SMTP id m10mr2728022pjq.105.1584506307552;
        Tue, 17 Mar 2020 21:38:27 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 73sm4241879pgg.90.2020.03.17.21.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 21:38:26 -0700 (PDT)
Date:   Tue, 17 Mar 2020 21:38:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alex Elder <elder@linaro.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        David Dai <daidavid1@codeaurora.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Rajeshwari <rkambl@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for v5.7
Message-ID: <20200318043823.GA470201@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.7

for you to fetch changes up to dfaf16014f55eebbb2a812c8ebdc6ce30681bb81:

  arm64: dts: qcom: sdm845-mtp: Relocate remoteproc firmware (2020-03-16 22:20:34 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DT updates for v5.7

This brings initial support for the SM8250 and IPQ6018 platforms.

SDM845 gets audio, PCIe and IP-accelerator support, and the interconnect
providers are refactored. The Lenovo Yoga C630 has audio enabled and the
DB845c has PCIe, analog audio and low-speed interfaces enabled. The
SDM845 MTP has its display enabled and firmware location updated to
match linux-firmware.

SC7180 gains CPU topology and power properties. Interconnect providers,
eMMC, SD-card, multimedia clocks, display, Bluetooth, Venus are added.
Critical trip points are added as well as various fixes.

For MSM8916 FastRPC support is added, ETM power management and reserved
memory for Samsung A2015 are corrected.

MSM8996 switches to generic QMP phy driver for its UFS support. MSM8998
temporarily disables part of Coresight to boot without
clk_ignore_unused.  CEQ for eMMC on QCS404 is enabled.

Fixes throughout the platforms to fix binding compliance, correct
compatibles for SDHCI nodes and add gpio-ranges.

----------------------------------------------------------------
Alex Elder (1):
      arm64: dts: sdm845: add IPA information

Alexandre Courbot (1):
      arm64: dts: qcom: add Venus firmware node on Cheza

Amit Kucheria (3):
      arm64: dts: qcom: msm8916:: Add qcom,tsens-v0_1 to msm8916.dtsi compatible
      arm64: dts: qcom: msm8996:: Add qcom,tsens-v2 to msm8996.dtsi compatible
      arm64: dts: qcom: msm8998: Fix cpu compatible

Balakrishna Godavarthi (1):
      arm64: dts: qcom: sc7180: Add bluetooth node on SC7180 IDP board

Bjorn Andersson (8):
      arm64: dts: qcom: sdm845: Add first PCIe controller and PHY
      arm64: dts: qcom: sdm845: Add second PCIe PHY and controller
      arm64: dts: qcom: db845c: Enable PCIe controllers
      arm64: dts: qcom: sdm845-mtp: Add Truly display
      arm64: dts: qcom: msm8996: Define parent clocks for gcc
      arm64: dts: qcom: msm8996: Use generic QMP driver for UFS
      arm64: dts: qcom: msm8998-mtp: Disable funnel 4 and 5
      arm64: dts: qcom: sdm845-mtp: Relocate remoteproc firmware

Christian Lamparter (1):
      ARM64: dts: qcom: add gpio-ranges property

David Dai (1):
      arm64: dts: sdm845: Redefine interconnect provider DT nodes

Dikshita Agarwal (2):
      arm64: dts: sc7180: Add Venus video codec DT node
      arm64: dts: sc7180: Add Venus firmware subnode

Douglas Anderson (6):
      arm64: dts: sc7180: Add the sleep_clk to gcc-sc7180 node
      arm64: dts: qcom: qcs404: Fix sdhci compat string
      arm64: dts: qcom: sdm845: Add the missing clocks on the dispcc
      arm64: dts: qcom: sdm845: Add missing clocks / fix names on the gpucc
      arm64: dts: qcom: sdm845: Add the missing clock on the videocc
      arm64: dts: sc7180: Add unit name to soc node

Harigovindan P (1):
      arm64: dts: sc7180: add display dt nodes

Loic Poulain (1):
      arm64: dts: qcom: apq8016-sbc: Remove wrong regulator supply

Mathieu Poirier (1):
      arm64: dts: msm8916: Properly deal with ETMv4 power management

Matthias Kaehlcke (1):
      arm64: dts: sc7180: Move venus node to the correct position

Odelu Kukatla (1):
      arm64: dts: sc7180: Add interconnect provider DT nodes

Rajendra Nayak (3):
      arm64: dts: qcom: sc7180: Add dynamic CPU power coefficients
      arm64: dts: qcom: sc7180: Add CPU capacity values
      arm64: dts: qcom: sc7180: Add CPU topology

Rajeshwari (1):
      arm64: dts: qcom: sc7180: Added critical trip point Thermal-zones node

Sai Prakash Ranjan (1):
      arm64: dts: qcom: sc7180: Add iommus property to QUP0 and QUP1

Sandeep Maheswaram (1):
      arm64: dts: qcom: sc7180: Correct qmp phy reset entries

Sibi Sankar (2):
      arm64: dts: qcom: sdm845: Add OSM L3 interconnect provider
      arm64: dts: qcom: sc7180: Add OSM L3 interconnect provider

Sivaprakash Murugesan (1):
      arm64: dts: ipq6018: Add a few device nodes

Sricharan R (2):
      dt-bindings: qcom: Add ipq6018 bindings
      arm64: dts: Add ipq6018 SoC and CP01 board support

Srinivas Kandagatla (7):
      arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes
      arm64: dts: msm8916: Add fastrpc node
      arm64: dts: qcom: sdm845: add slimbus nodes
      arm64: dts: qcom: sdm845: add apr nodes
      arm64: dts: qcom: c630: Enable audio support
      arm64: dts: qcom: sdm845: add pinctrl nodes for quat i2s
      arm64: dts: qcom: db845c: add analog audio support

Stanimir Varbanov (1):
      arm64: dts: sdm845: follow venus-sdm845v2 DT binding

Stephan Gerhold (1):
      arm64: dts: qcom: msm8916-samsung-a2015: Reserve Samsung firmware memory

Stephen Boyd (2):
      arm64: dts: qcom: sdm845: Disable pwrkey on Cheza
      arm64: dts: qcom: pm6150: Add label to pwrkey node

Taniya Das (1):
      arm64: dts: sc7180: Add clock controller nodes

Veerabhadrarao Badiganti (3):
      arm64: dts: qcom: sc7180: Add nodes for eMMC and SD card
      arm64: dts: qcom: qcs404: Enable CQE support for eMMC
      arm64: dts: qcom: sc7180: Update reg names for SDHC

Venkata Narendra Kumar Gutta (1):
      arm64: dts: qcom: sm8250: Add sm8250 dts file

 Documentation/devicetree/bindings/arm/qcom.yaml    |   8 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |   1 -
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       |   6 -
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |  64 ++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              | 443 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   1 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   8 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  21 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |   1 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  33 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |   8 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  16 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |   1 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |  64 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 605 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  15 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 283 +++++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  89 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 672 ++++++++++++++++++++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 114 ++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |  29 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 444 ++++++++++++++
 27 files changed, 2868 insertions(+), 69 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250.dtsi
