Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01E530EBD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 06:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhBDFYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 00:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhBDFYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 00:24:02 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430EDC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 21:23:22 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id d1so2229595otl.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 21:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/W/+DuYXbeC3pcNovNCJ3kl63oZ8C5/BOehNjO/O5f4=;
        b=m65N3SctErjAnUtD/4m3KvA3d+iumeynJSjRG8MK3evlQ+z4gVhkwfI/JYwNxVtiJR
         b1XS/a5KK6+nR+j4xtaNTPZEtYY/IcABiwMVYsA0ztwV3+VDTlBZ3ITDnIkvsN235AjI
         cNcHEXGY+LV4Snvom/ebUvUvOIl/ePpfO6KIaDSv1I7wH1glGyyIlFnMNwzHfgzsIZED
         FLD3w05SyaFluJ2E4uZekeuMD32vrVl/8qlLLRs0y3M+MXnJn1E9Lw9Z2zKTJr6FK1Xr
         X3F9j2vINCIGx6O4+WEvWtPhT3hN8Jo3/f4F3YBdiPFpa5TRtN9pCqGqrVbHNoH4QJn4
         9w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/W/+DuYXbeC3pcNovNCJ3kl63oZ8C5/BOehNjO/O5f4=;
        b=kBNRW0cnOq3eiMy6kLruVKr5R+zU6/Wf/lU74hnNjkUrmxkcZfOwNUo8P0xRdyOrHi
         mH6CS2oQrGxCruYM//wBVHixsukgThTtZlfuqmU5m7gKskh8MU5GLU//qbFMvmGWxn0j
         kcwiSEIUgz4dY9++V0gfVQQjw1+PTziZqmrkJBUkGN9qpBY/YrLXIRZ0Fk6j5HfBQeUO
         IBPi81f37iLw3zRI6neuE1gBHyhWuHNWQZezj3hK2fof3uTo+6KQaNHfasQH3TxcYAgt
         ul31pChkVHpOVgadjkl1g7gfnlM/XTjVKqhqhXpoVUObgWk6IFHGoQZe3FqvBZhXmVOM
         t/EQ==
X-Gm-Message-State: AOAM531s2n0eqQpGfaGtX4UdkGbP4+ueioA9QfgJyBQlVAqCe+HucZoD
        P4EBsceJUsbKqJVByihtQRmMRA==
X-Google-Smtp-Source: ABdhPJykXhmgoPzBNP2RqMfWZC8yooDwyYMsUS+xUpOYJDnWLKYgXEsXbAcczlxei9HvsVjdGBNQoQ==
X-Received: by 2002:a9d:1717:: with SMTP id i23mr4114963ota.179.1612416201682;
        Wed, 03 Feb 2021 21:23:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u73sm929149oie.30.2021.02.03.21.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:23:20 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Adrian Schmutzler <freifunk@adrianschmutzler.de>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        John Crispin <john@phrozen.org>,
        Jonathan McDowell <noodles@earth.li>
Subject: [GIT PULL] Qualcomm ARM dts updates for 5.12
Date:   Wed,  3 Feb 2021 23:23:20 -0600
Message-Id: <20210204052320.388999-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.12

for you to fetch changes up to 9d1ee210ab8ae610285e5d6db9ea47491fce6dc6:

  ARM: dts: qcom: msm8974-klte: Mark essential regulators (2021-02-02 16:45:09 -0600)

----------------------------------------------------------------
Qualcomm ARM dts updates for 5.12

Introduces the Qualcomm SDX55 platform and the platform's MTP device,
with support for NAND, SDHCI and USB.

USB is enabled for IPQ4019 and the Alfa Network AP120C-AC and 8devices
Jalapeno boards are added.

Samsung Galaxy S5 gains display and GPU support.

----------------------------------------------------------------
Adrian Schmutzler (3):
      ARM: dts: qcom: remove commented mmc-ddr-1_8v for sdcc3
      ARM: dts: qcom: add additional DT labels in qcom-ipq8064.dtsi
      ARM: dts: qcom: replace status value "ok" by "okay"

Alexey Minnekhanov (1):
      ARM: dts: qcom: msm8974-klte: Fix shdc numbering

Bjorn Andersson (1):
      ARM: dts: qcom: sdx55: Enable ARM SMMU

Brian Masney (1):
      ARM: dts: qcom: msm8974: add gpu support

Iskren Chernev (1):
      ARM: dts: qcom: msm8974-klte: Mark essential regulators

John Crispin (1):
      ARM: dts: qcom: ipq4019: add USB devicetree nodes

Jonathan McDowell (1):
      ARM: dts: qcom: add prng definition to ipq806x

Manivannan Sadhasivam (14):
      ARM: dts: qcom: Add SDX55 platform and MTP board support
      ARM: dts: qcom: sdx55: Add support for SDHCI controller
      ARM: dts: qcom: sdx55: Add support for TCSR Mutex
      ARM: dts: qcom: sdx55: Add Shared memory manager support
      ARM: dts: qcom: sdx55: Add QPIC BAM support
      ARM: dts: qcom: sdx55: Add QPIC NAND support
      ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
      ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND
      dt-bindings: usb: qcom,dwc3: Add binding for SDX55
      ARM: dts: qcom: sdx55: Add USB3 and PHY support
      ARM: dts: qcom: sdx55-mtp: Enable USB3 and PHY support
      dt-bindings: watchdog: Add binding for Qcom SDX55
      ARM: dts: qcom: sdx55: Add Watchdog support
      ARM: dts: qcom: sdx55: Add pshold support

Robert Marko (4):
      ARM: dts: qcom: ipq4019: add more labels
      ARM: dts: qcom: add 8devices Jalapeno
      ARM: dts: qcom: add Alfa Network AP120C-AC
      ARM: dts: qcom: ipq4019: add SDHCI VQMMC LDO node

Samuel Pascua (2):
      ARM: dts: qcom: msm8974-klte: add support for GPU
      ARM: dts: qcom: msm8974-klte: add support for display

Vinod Koul (9):
      dt-bindings: arm: qcom: Document SDX55 platform and boards
      ARM: dts: qcom: sdx55: Add pincontrol node
      ARM: dts: qcom: sdx55: Add reserved memory nodes
      ARM: dts: qcom: sdx55: Add spmi node
      ARM: dts: qcom: sdx55-mtp: Add pm8150b pmic
      ARM: dts: qcom: sdx55: Add rpmpd node
      ARM: dts: qcom: Add PMIC pmx55 dts
      ARM: dts: qcom: sdx55-mtp: Add pmx55 pmic
      ARM: dts: qcom: sdx55-mtp: Add regulator nodes

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
 arch/arm/boot/dts/Makefile                         |   6 +-
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  12 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   8 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |   8 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |  10 +-
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |   4 +-
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     |  10 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts   |  28 ++
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts       |  27 ++
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi      | 254 +++++++++++
 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts        | 214 +++++++++
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |  18 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts    |   4 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      |  10 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |   8 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts    |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi      |  10 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |  90 +++-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   2 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi           |  12 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  31 +-
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |  16 +-
 arch/arm/boot/dts/qcom-msm8660-surf.dts            |   4 +-
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |   8 +-
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts   |  14 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  32 +-
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 115 ++++-
 .../boot/dts/qcom-msm8974-sony-xperia-amami.dts    |  14 +-
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |  18 +-
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   |  16 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  43 ++
 arch/arm/boot/dts/qcom-msm8974pro.dtsi             |   5 +
 arch/arm/boot/dts/qcom-pmx55.dtsi                  |  84 ++++
 arch/arm/boot/dts/qcom-sdx55-mtp.dts               | 251 ++++++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  | 505 +++++++++++++++++++++
 38 files changed, 1757 insertions(+), 144 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
 create mode 100644 arch/arm/boot/dts/qcom-pmx55.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55.dtsi
