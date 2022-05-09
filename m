Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51264520385
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 19:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbiEIR0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 13:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239573AbiEIRZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 13:25:29 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95EB252DDC
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 10:21:31 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w123so5366853oiw.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N35Ir9E8DGSuWRcbt99whkgJGIRqwVMksMu33eucadY=;
        b=IDI5FjNad6y7UkOaUUVwSKfBdyh6B2CuRTrBI/4LtmUWzaqT237l3hjhI6C2/EiXkz
         5gGJx1E54iibcR3qKXKgw25SwuaLbRqsyeWjWfy6NgzPEv2cv67W34bq6MaVqoAiZQfZ
         GJmkQ/v9rvhLV977v0ltDekv2PccB/IO/wWGcPIvo6YZbfq/R6lGeht8i7nOEsWl91GG
         bqXxdNsszqIGNx+lB5NcSObEzObIyMbC4/1lSgvnxqNQYR41M0KAHpGMkzqehlWrbTNQ
         loIBEn861SBem/395bKr9Dlo5gdUnRTkPgDMAtrx4mwZZDmZJfo/EhWsYFA31LSdofXH
         bbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N35Ir9E8DGSuWRcbt99whkgJGIRqwVMksMu33eucadY=;
        b=FnEmTEjEiNA3mZnH/wzC0mLqQ+om6F3G9o7dDflyFpnLFL1xNz24MPMIjTPqbIzgUF
         9lciZQ4gvo0VQZm4EU35+yF5kIDFA0BvQb2exxW05MhrEITISj7OVWfm+aEQzVSCIjLj
         cv7FGOrF3LbV1KufF4leXu4wQmsZoypS1tNTIjm2kKZDglY3GkZHrMhoZiiuFlqeXGRW
         ql8WB+YzqXrfKOM6a1X8DJvcBaGEwFuOZQkWH3KDSyVmFJjAA506oTw7ejPFOr2NfjL8
         f3c4zF6G8GaKIqQjCXnewwWqLhskt8hpY7tvo9q6VmMsql8q3HzmeQbwoHsMenRo0wV4
         mn+w==
X-Gm-Message-State: AOAM531x8Af2q0314WIMZ+0iYECarM2i/ezWT3oX54DOE4jcadrzz/Ps
        kSmL2H3y7i1ayn2icpHAudiEbMXiVLaRWw==
X-Google-Smtp-Source: ABdhPJwFGpIEwr84Dnl+6VrU6PABH3PocVX6qMg8fTBJAetQXbJ/BHq5Cb8xoHfV+eWghHx7CYoGrA==
X-Received: by 2002:a05:6808:ec5:b0:2f9:a7fb:4dfb with SMTP id q5-20020a0568080ec500b002f9a7fb4dfbmr11313071oiv.156.1652116890942;
        Mon, 09 May 2022 10:21:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m13-20020a9d400d000000b006060322126bsm4784141ote.59.2022.05.09.10.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 10:21:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jack Matthews <jm5112356@gmail.com>,
        Rayyan Ansari <rayyan@ansari.sh>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm ARM DT updates for v5.19
Date:   Mon,  9 May 2022 12:21:25 -0500
Message-Id: <20220509172125.313259-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.19

for you to fetch changes up to fb5e339fb1bc9eb7f34b341d995e4ab39c03588e:

  ARM: dts: qcom: msm8974-FP2: Add supplies for remoteprocs (2022-05-03 14:17:08 -0500)

----------------------------------------------------------------
Qualcomm ARM DT updates for v5.19

This contains a long overdue overhaul of the MSM8974 DeviceTrees,
aligning the style, structure and naming with what we've learned since
the introduction of this platform.

On top of this the Sony Rhine platform gained I2C masters, NFC and
pstore support and the Fairphone 2 gained touchscreen support.

For the new SDX65 platform reserved-memory nodes, rpmpd, SPMI, CPU
clocks, SDHCI controller, SMMU and TCSR mutex was added. As was the
initial DeviceTree for the related PMX65 PMIC.

MSM8226 gained VADC and RTC support and support for the ASUS ZenWatch 2
was added.

----------------------------------------------------------------
Ansuel Smith (1):
      ARM: dts: qcom: add syscon and cxo/pxo clock to gcc node for ipq8064

Dmitry Baryshkov (1):
      ARM: dts: qcom: msm8974: Drop flags for mdss irqs

Jack Matthews (1):
      ARM: dts: qcom: pm8226: add node for RTC

Konrad Dybcio (23):
      ARM: dts: qcom-*-sony*: Mention SONY board names in DT filenames
      ARM: dts: qcom-msm8974: Remove properties that are always overriden
      ARM: dts: qcom-msm8974*: Fix UART naming
      ARM: dts: qcom-msm8974*: Fix I2C labels
      ARM: dts: qcom-msm8974: Fix up mdss nodes
      ARM: dts: qcom-msm8974: Fix up SDHCI nodes
      ARM: dts: qcom-msm8974*: Rename msmgpio to tlmm
      ARM: dts: qcom-apq8074-dragonboard: Use &labels
      ARM: dts: qcom-msm8974-fp2: Use &labels
      ARM: dts: qcom-msm8974-lge-nexus5: Use &labels
      ARM: dts: qcom-msm8974-klte: Use &labels
      ARM: dts: qcom-msm8974-{"hon","am"}ami: Commonize and modernize the DTs
      ARM: dts: qcom-msm8974-castor: Use &labels
      ARM: dts: qcom-msm8974pro: Use &labels
      ARM: dts: qcom-msm8974pro-*: Use the 8974pro name in DT filenames
      ARM: dts: qcom-msm8974: Convert ADSP to a MMIO device
      ARM: dts: qcom-msm8974: Sort and clean up nodes
      ARM: dts: qcom-msm8974*: Enable IMEM unconditionally
      ARM: dts: qcom-msm8974*: Consolidate I2C/UART/SDHCI
      ARM: dts: qcom-msm8974*: Clean up old GPIO declarations
      ARM: dts: qcom-msm8974-rhine: Add NFC and enable I2C hosts
      ARM: dts: qcom-msm8974-rhine: Add pstore node
      ARM: dts: qcom-msm8974*: Remove unnecessary include

Krzysztof Kozlowski (10):
      ARM: dts: qcom: align SPI NOR node name with dtschema
      ARM: dts: qcom: rename WCNSS child name to bluetooth
      ARM: dts: qcom: ipq4019: align dmas in SPI/UART with DT schema
      ARM: dts: qcom: ipq4019: align clocks in I2C with DT schema
      ARM: dts: qcom: msm8660: disable GSBI8
      ARM: dts: qcom: msm8974-lge-nexus5: move gpio-keys out of soc
      ARM: dts: qcom: msm8974-samsung-klte: move gpio-keys out of soc
      ARM: dts: qcom: do not use underscore in node name
      ARM: dts: qcom: sdx55: do not use underscore in BCM node name
      ARM: dts: qcom: sdx55: remove wrong unit address from RPMH RSC clocks

Kuldeep Singh (4):
      ARM: dts: qcom: mdm9615: User generic node name for DMA
      ARM: dts: qcom: apq8064: User generic node name for DMA
      ARM: dts: qcom: ipq4019: User generic node name for DMA
      ARM: dts: qcom: ipq8064: User generic node name for DMA

Luca Weiss (8):
      dt-bindings: arm: qcom: Document asus,sparrow device
      ARM: dts: qcom: Add support for ASUS ZenWatch 2
      ARM: dts: qcom: msm8974-FP2: We're msm8974pro
      ARM: dts: qcom: msm8974-FP2: Add mmc* aliases
      ARM: dts: qcom: msm8974: Add missing license headers
      ARM: dts: qcom: msm8974-FP2: Add support for touchscreen
      ARM: dts: qcom: msm8974-FP2: Configure charger
      ARM: dts: qcom: msm8974-FP2: Add supplies for remoteprocs

Rayyan Ansari (1):
      ARM: dts: qcom: pm8226: Add VADC node

Rohit Agarwal (12):
      ARM: dts: qcom: sdx65: Add support for A7 PLL clock
      ARM: dts: qcom: sdx65: Add support for APCS block
      ARM: dts: qcom: sdx65: Add spmi node
      ARM: dts: qcom: sdx65-mtp: Add pmk8350b and pm8150b pmic
      ARM: dts: qcom: Add PMIC pmx65 dts
      ARM: dts: qcom: sdx65-mtp: Add pmx65 pmic
      ARM: dts: qcom: sdx65: Add rpmpd node
      ARM: dts: qcom: sdx65-mtp: Add regulator nodes
      ARM: dts: qcom: sdx65: Add reserved memory nodes
      ARM: dts: qcom: sdx65: Add support for SDHCI controller
      ARM: dts: qcom: sdx65: Enable ARM SMMU
      ARM: dts: qcom: sdx65: Add support for TCSR Mutex

Stephen Boyd (1):
      ARM: dts: qcom: sdx55: Remove ipa interconnect node

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm/boot/dts/Makefile                         |   13 +-
 arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts    |  294 +++
 ...dts => qcom-apq8064-sony-xperia-lagan-yuga.dts} |    0
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   16 +-
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     |  582 +++---
 arch/arm/boot/dts/qcom-apq8084.dtsi                |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |    4 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      |    4 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |    2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi      |    4 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   42 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi           |    2 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   12 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |    4 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                |    9 +
 arch/arm/boot/dts/qcom-msm8660.dtsi                |    1 +
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts   |  409 -----
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 1052 +++++------
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |  908 ----------
 .../boot/dts/qcom-msm8974-sony-xperia-amami.dts    |  435 -----
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |  723 --------
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   |  484 -----
 .../dts/qcom-msm8974-sony-xperia-rhine-amami.dts   |   13 +
 .../dts/qcom-msm8974-sony-xperia-rhine-honami.dts  |    7 +
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  457 +++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 1916 +++++++++++---------
 .../arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts |  432 +++++
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |  813 +++++++++
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  608 +++++++
 arch/arm/boot/dts/qcom-msm8974pro.dtsi             |   32 +-
 arch/arm/boot/dts/qcom-pm8226.dtsi                 |   41 +
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |    2 +-
 arch/arm/boot/dts/qcom-pmx65.dtsi                  |   32 +
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |    9 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               |  221 +++
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |  193 +-
 38 files changed, 4966 insertions(+), 4815 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts
 rename arch/arm/boot/dts/{qcom-apq8064-sony-xperia-yuga.dts => qcom-apq8064-sony-xperia-lagan-yuga.dts} (100%)
 delete mode 100644 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
 delete mode 100644 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
 delete mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
 delete mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
 delete mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-honami.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
 create mode 100644 arch/arm/boot/dts/qcom-pmx65.dtsi
