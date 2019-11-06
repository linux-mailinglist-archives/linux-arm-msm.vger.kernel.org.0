Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E7BF1ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfKFTeF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:34:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:32958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbfKFTeE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:34:04 -0500
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 215D8217F9;
        Wed,  6 Nov 2019 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068843;
        bh=LwXt+suxcrsMZh6bzLLFxAHg5EDkYE/+FgIc2hs+ltU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cqMTgK5rprV7jPECaZoOpsBScX8ueGlhqLRUik8C+TZm2Tvy868veXWnYqt8uIr2Z
         SXR+2H7QJgxuLLAOKmRROPk+5hAeuKM6Z3n7Uh6N2AGFOdDEqTg0FDng/Ws43SbAwK
         Qq43z7lbqW0eSt8aW291cd417cwq8tKT22yPjvgQ=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
Date:   Wed,  6 Nov 2019 13:33:57 -0600
Message-Id: <1573068840-13098-2-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573068840-13098-1-git-send-email-agross@kernel.org>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Arnd, Olof, and Kevin,

I have one slight faux paux in this pull request.  A drivers: soc change got
into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
without messing up a lot of people who depend on the SHAs not changing.  So I'm
sorry for this inclusion.  I'll scrub this better next time.

Andy


The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.5

for you to fetch changes up to 915603b106164f966ebc027de96e54011885bdf4:

  arm64: dts: qcom: db845c: Enable LVS 1 and 2 (2019-11-03 20:49:00 -0800)

----------------------------------------------------------------
Qualcomm ARM64 Updates for v5.5

* Add thermal IRQ support on MSM8916, SDM845, MSM8996, and QCS404
* Fix thermal HW ids for cpus on MSM8916
* Add blsp1 UART3 and  blsp1 BAM on MSM8998
* Add volume buttons and WCNSS for Wifi and BT on MSM8916 LongCheer-l8150
* Fixup load on l21 for SD on apq8096-db820c
* Enable LVS1/2, APSS watchdog, and select UFS reset gpio for SDM845
* Disable coresight by default on MSM8998
* Enable bluetooth and remove retention idle state on MSM8998-clamshell
* Enable adsp, cdsp, and mpss on C630
* Enable bluetooth on MSM8998-mtp
* Delete zap shader on SDM845-cheza
* Add tactile buttons and hall sensor on MSM8916-Samsung-A2015
* Add Interconnect nodes, watchdog, and sleep clk on QCS404
* Override Iris compatible on MSM8916-Samsung-A5U
* Enable WCNSS Wifi and bluetooth on MSM8916-Samsung-A2015
* Fixup cooling states for the aoss warming devices

----------------------------------------------------------------
Amit Kucheria (5):
      arm64: dts: qcs404: thermal: Add interrupt support
      arm64: dts: msm8998: thermal: Add interrupt support
      arm64: dts: msm8996: thermal: Add interrupt support
      arm64: dts: sdm845: thermal: Add interrupt support
      arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors

Bjorn Andersson (3):
      arm64: dts: qcom: c630: Enable adsp, cdsp and mpss
      arm64: dts: qcom: sdm845: Add APSS watchdog node
      arm64: dts: qcom: db845c: Enable LVS 1 and 2

Georgi Djakov (1):
      arm64: dts: qcs404: Add interconnect provider DT nodes

Jeffrey Hugo (5):
      arm64: dts: qcom: msm8998: Add blsp1 BAM
      arm64: dts: qcom: msm8998: Add blsp1_uart3
      arm64: dts: qcom: msm8998-mtp: Enable bluetooth
      arm64: dts: qcom: msm8998-clamshell: Enable bluetooth
      arm64: dts: qcom: msm8998-clamshell: Remove retention idle state

Jorge Ramirez-Ortiz (2):
      arm64: dts: qcom: qcs404: add sleep clk fixed rate oscillator
      arm64: dts: qcom: qcs404: add the watchdog node

Loic Poulain (1):
      arm64: dts: apq8096-db820c: Increase load on l21 for SDCARD

Michael Srba (1):
      arm64: dts: msm8916-samsung-a2015: add tactile buttons and hall sensor

Nikita Travkin (2):
      arm64: dts: msm8916-longcheer-l8150: Enable WCNSS for WiFi and BT
      arm64: dts: msm8916-longcheer-l8150: Add Volume buttons

Rob Clark (1):
      arm64: dts: qcom: sdm845-cheza: delete zap-shader

Sai Prakash Ranjan (1):
      arm64: dts: qcom: msm8998: Disable coresight by default

Stephan Gerhold (2):
      arm64: dts: msm8916-samsung-a2015: Enable WCNSS for WiFi and BT
      arm64: dts: msm8916-samsung-a5u: Override iris compatible

Stephen Boyd (1):
      arm64: dts: qcom: sdm845: Use UFS reset gpio instead of pinctrl

Thara Gopinath (1):
      soc: qcom: Invert the cooling states for the aoss warming devices

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       |  2 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 55 ++++++++++++++
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     | 80 +++++++++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |  6 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  4 ++
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    | 54 ++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          | 82 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi         | 13 ++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 84 +++++++++++++++++-----
 arch/arm64/boot/dts/qcom/qcs404.dtsi               | 41 +++++++++++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         | 53 ++------------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 12 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 12 +++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 14 ++++
 drivers/soc/qcom/qcom_aoss.c                       |  8 +--
 16 files changed, 449 insertions(+), 75 deletions(-)
