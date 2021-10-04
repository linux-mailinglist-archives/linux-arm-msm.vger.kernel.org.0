Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F12421854
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236055AbhJDUXy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:23:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:24257 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbhJDUXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633378909;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Rw43gEOu/P1J7qJPNGkaVXLbdg5QG/1YaX+fJ13gV1Q=;
    b=J2qf0rBjbGtUWzQV8OyMhZuAHoUm1tHTiqQnO91PTsLc8+Htxv9vXLzZ6XnYcctw0b
    aVG8Az10jfkic2hbEdqYObpPorcBhHYzdGellOcMLN/j+eYxHVYg6RVP9iOM6dhkJrT4
    kizIfsDZPy9FpsRCEALPMUfFjXOpHwE9NDRtwLzBGsBofcjLOdkKvlU5PMrl8r7XusMl
    mR/gLuJ7dyCklk2IgIK8FFxO02CkRbJ21PfVk5HY6fFXS7khJ/9TpaDP/ukfot5qIYW9
    UiZVJG2nJjmC1mG0ZOTu3Lyz2v5DOhCZ7YwQDiJw2yfGF3Azh1eNQ4Y1nMYg4bJDGd2j
    Il8g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KLnKQk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:21:49 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: [PATCH v2 00/15] Add support for Samsung Galaxy S4 Mini Value Edition
Date:   Mon,  4 Oct 2021 22:19:06 +0200
Message-Id: <20211004201921.18526-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for booting mainline Linux on the Samsung Galaxy
S4 Mini Value Edition. The device is based on the Qualcomm MSM8916 SoC and quite
similar to the already supported Samsung Galaxy A3/A5. With some additional
patches it is almost fully functional, including display, touch screen, GPU,
audio, modem (voice calls, SMS, mobile data) and sensors.

I made most of the patches almost 2 years ago but I was long unsure if I should
submit them upstream. This is because the device has one big limitation:
Samsung released it with a signed 32-bit-only TrustZone firmware which is not
able to boot ARM64 Linux. This means the device can actually only boot ARM32.

However, since device trees are independent of the kernel architecture and all
the necessary drivers compile on ARM32 as well it is actually extremely
straightforward to build an ARM32 kernel for MSM8916 (which is normally arm64).

The only necessary additions are for SMP/cpuidle without PSCI on ARM32. However,
the diffstat below makes it quite obvious that the maintenance overhead for this
is absolutely negligible. The SoC is almost identical to previous 32-bit SoCs
like MSM8226, so it is pretty much just adding new definitions/compatibles for
already existing code.

Being able to boot ARM32 Linux on MSM8916 might be also a possible opportunity
for CI systems. At the moment, 32-bit Qualcomm platforms are not very well
represented there. Booting ARM32 on MSM8916/APQ8016 would allow re-using the
DragonBoard 410c which is often already used for automated CI testing.

Changes in v2:
  - Add missing word in a comment in PATCH 1/15
  - Clarify ARM32 situation in dt-bindings patches

v1: https://lore.kernel.org/phone-devel/20210928171231.12766-1-stephan@gerhold.net/

Lina Iyer (1):
  soc: qcom: spm: Add 8916 SPM register data

Stephan Gerhold (14):
  arm64: dts: qcom: Add device tree for Samsung Galaxy S4 Mini Value
    Edition
  arm64: dts: qcom: msm8916-samsung-serranove: Add touch screen
  arm64: dts: qcom: msm8916-samsung-serranove: Add touch key
  arm64: dts: qcom: msm8916-samsung-serranove: Add IMU
  arm64: dts: qcom: msm8916-samsung-serranove: Add rt5033 battery
  arm64: dts: qcom: msm8916-samsung-serranove: Add NFC
  ARM: qcom: Add ARCH_MSM8916 for MSM8916 on ARM32
  dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method
  ARM: qcom: Add qcom,msm8916-smp enable-method identical to MSM8226
  dt-bindings: soc: qcom: spm: Document qcom,msm8916-saw2-v3.0-cpu
  firmware: qcom: scm: Add support for MC boot address API
  arm64: dts: qcom: msm8916: Add CPU ACC and SAW/SPM
  ARM: dts: qcom: msm8916: Add include for SMP without PSCI on ARM32
  ARM: dts: qcom: msm8916-samsung-serranove: Include dts from arm64

 .../devicetree/bindings/arm/cpus.yaml         |   5 +-
 .../bindings/soc/qcom/qcom,spm.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/qcom-msm8916-samsung-serranove.dts    |   3 +
 arch/arm/boot/dts/qcom-msm8916-smp.dtsi       |  62 ++
 arch/arm/mach-qcom/Kconfig                    |  10 +
 arch/arm/mach-qcom/platsmp.c                  |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8916-samsung-serranove.dts    | 534 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  56 ++
 drivers/firmware/qcom_scm.c                   |  84 ++-
 drivers/firmware/qcom_scm.h                   |   4 +
 drivers/soc/qcom/spm.c                        |  21 +
 13 files changed, 765 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-smp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts

-- 
2.33.0

