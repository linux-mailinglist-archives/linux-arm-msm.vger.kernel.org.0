Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A1A41B4E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241992AbhI1RXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:16 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:19552 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241944AbhI1RXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849686;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=iZkfpNBWYReD8ezAsvLsyYoZARZX4Qr9pg/R65pM3x0=;
    b=fCXM9jhXxFeJk/cJdMHmrKpYZaMFexNp7CtXEYHrOmiyqW+6QWKanRGmFoOwGOZz69
    qqy3dLEoeGKQ0Pn1HvcSP/d1koX1bpLqsEfkGwGuMuFIgmeNJiRFPTFfqDuBN2coWtGp
    KiKVox9UyVVu7XdLojEf33/FnEvzawGEpfJhwvphBQ4EIQVaiLOsi58RVHLn7svxkpE9
    htFAttFcx633uILZ10BKK+SCg+k7y+ydQzDbGjFC4BV32PaHsttp53LwKquQJh/A1Y3r
    1GD6FMoWggUtpf/wiE/uhcH9vtXlrovLpTjuuTgMiPQaGz9M2EfFv1ZYiHa6NKPGs5+R
    bk2w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLQoBG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:26 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: [PATCH 00/15] Add support for Samsung Galaxy S4 Mini Value Edition
Date:   Tue, 28 Sep 2021 19:12:16 +0200
Message-Id: <20210928171231.12766-1-stephan@gerhold.net>
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

 .../devicetree/bindings/arm/cpus.yaml         |   4 +-
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
 13 files changed, 764 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-smp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts

-- 
2.33.0

