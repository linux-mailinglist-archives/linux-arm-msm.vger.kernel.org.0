Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181F757C0BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 01:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiGTXQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 19:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiGTXQq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 19:16:46 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736CD66AFF
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:16:45 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id x185so12823938oig.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtUXjWr3nvEpuUJ9HGQXmhmB9khI9IHogmZuxZSRVaY=;
        b=ts55i+bya+LPIvtTxAebkZURdWOpACmPRus9H6iabf50nkTd3D9FtU6bZ7zZeYaDP5
         qr2KMDAVinLggd6OpcsL7kWFCxh+JqGgQ8dmYdOTpUYAyvFWhLw0sWdAzTxFE1JsZyjr
         XoWvjWzAvL04sTmTFgiS+UH3GxKwBeLJBPtk6lgIXZcO90+XsTubfAMttNPXK3FX3Zw9
         AYfdgx274vq7gt0IahHf9xCJpM4DU6APbmSfWTLpjX9bmiBlmBYmqXdJaFd7PpUoAp9c
         NvH7l4kW2DWi2/z1e0k6dGGfvixTG+XAwDCkJx8ZGI0PTAU8bgtKZqkhhNhdXIej2neD
         H2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtUXjWr3nvEpuUJ9HGQXmhmB9khI9IHogmZuxZSRVaY=;
        b=sNUVwEAaiVpZUI8UWd5/HLKeihOSm431mTczRSKgy5HmKTBVrA5l+YuxIwHdkT8LQX
         qDU14oRQ3+rIyWDCvXl5qeedqIOQ1b/EuGV8IoQF7Lcr7UqbYoMoRiMwORpWHmtSUK/4
         VBFqPv7HFGK+uOoWVb4Bt92OI41tg20Nqe91KxAnMMw7AF97TkyENo0MgQ+NZTo+g2KA
         wLPNlqiQ29PdveGDcndCumQV2IJxoMUtrM6cfzBr6DeAHCx0/VcQ/B+oYPXidH80rJaB
         eQmwdJ8f61VVaOQTaeAXdWiTIAJuJEMO/27fMn8sgBCu5StVo2bFK07AKdPEWCaSw/Ej
         Arsg==
X-Gm-Message-State: AJIora9flsvCwz0bUDWxnZAvOYbZ47D7nqXeU94zzQGDW2m5CIn3uBsH
        wzQ168UnupuJaEBDQ3Oyc6X4CA==
X-Google-Smtp-Source: AGRyM1tGH/c7OcUAx4BB+ccgxatJGuV2dvkH5U3vgII9ikg8UIEB9KL2glsuEXDmqGB63X1IHHTQiA==
X-Received: by 2002:a05:6808:f92:b0:33a:441e:979b with SMTP id o18-20020a0568080f9200b0033a441e979bmr3476215oiw.220.1658359004729;
        Wed, 20 Jul 2022 16:16:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t6-20020a056871054600b0010d645d9f1asm125515oal.1.2022.07.20.16.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:16:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        Steev Klimaszewski <steev@kali.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Stefan Hansson <newbie13xd@gmail.com>,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [GIT PULL] More Qualcomm ARM64 DTS updates for v5.20
Date:   Wed, 20 Jul 2022 18:16:43 -0500
Message-Id: <20220720231643.2114565-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit abf61f7e66c15e00f40ca7e10367f4149639bc57:

  arm64: dts: qcom: sc8280xp: fix DP PHY node unit addresses (2022-07-08 17:03:03 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.20-2

for you to fetch changes up to be497abe19bf08fba549dd236624e7bb90597323:

  arm64: dts: qcom: Add support for Xiaomi Mi Mix2s (2022-07-20 13:08:42 -0500)

----------------------------------------------------------------
More Qualcomm ARM64 DTS updates for v5.20

Related to SDM845, the Xiaomi Mi Mix2s is introduced, the DB845c on
SDM845 gains support for the second GPI DMA controller and has the GENI
I2C and SPI instances wired up to their respective GPI DMA controller.

QCS404 USB controller and PHY assignment is corrected and IPQ8074 gains
APCS definition to handle outgoing IPC interrupts.

Lastly a range of Devicetree validation issues are addressed.

----------------------------------------------------------------
Bhupesh Sharma (2):
      arm64: dts: qcom: qrb5165-rb5: Fix 'dtbs_check' error for lpg nodes
      arm64: dts: qcom: qrb5165-rb5: Fix 'dtbs_check' error for led nodes

Bjorn Andersson (4):
      arm64: dts: qcom: sc8280xp: Add lost ranges for timer
      arm64: dts: qcom: sdm845: Fill in GENI DMA references
      arm64: dts: qcom: sdm845-db845c: Enable gpi_dma1
      arm64: dts: qcom: sdm845-db845c: Specify a i2c bus clocks

Dmitry Baryshkov (9):
      arm64: dts: qcom: sdm845: rename DPU device node
      arm64: dts: qcom: sc7180: rename DPU device node
      arm64: dts: qcom: sm8250: rename DPU device node
      arm64: dts: qcom: sc7180: split register block for DP controller
      arm64: dts: qcom: sc7180: drop #clock-cells from displayport-controller
      arm64: dts: qcom: sc7280: split register block for DP controller
      arm64: dts: qcom: sc7280: drop #clock-cells from displayport-controller
      arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
      arm64: dts: qcom: sc7280: drop unused clocks from eDP node

Johan Hovold (5):
      arm64: dts: qcom: sc8280xp: fix usb_1 ssphy irq
      arm64: dts: qcom: sc8280xp: fix USB clock order and naming
      arm64: dts: qcom: sc8280xp: fix USB interrupts
      arm64: dts: qcom: sc7280: reorder USB interrupts
      arm64: dts: qcom: reorder USB interrupts

Krzysztof Kozlowski (18):
      dt-bindings: arm: qcom: fix Alcatel OneTouch Idol 3 compatibles
      dt-bindings: arm: qcom: fix Longcheer L8150 compatibles
      dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
      dt-bindings: arm: qcom: fix MSM8994 boards compatibles
      dt-bindings: arm: qcom: add missing MSM8916 board compatibles
      dt-bindings: arm: qcom: add missing MSM8994 board compatibles
      dt-bindings: arm: qcom: add missing SM8150 board compatibles
      dt-bindings: arm: qcom: add missing SM8250 board compatibles
      dt-bindings: arm: qcom: add missing SM8350 board compatibles
      dt-bindings: vendor-prefixes: add Shift GmbH
      dt-bindings: arm: qcom: add missing MSM8998 board compatibles
      dt-bindings: arm: qcom: add missing MSM8992 board compatibles
      dt-bindings: arm: qcom: add missing QCS404 board compatibles
      dt-bindings: arm: qcom: add missing SDM630 board compatibles
      dt-bindings: arm: qcom: add missing SDM636 board compatibles
      dt-bindings: arm: qcom: add missing SDM845 board compatibles
      dt-bindings: arm: qcom: add missing SM6125 board compatibles
      dt-bindings: arm: qcom: add missing SM6350 board compatibles

Kuogee Hsieh (1):
      arm64: dts: qcom: sc7280: delete vdda-1p2 and vdda-0p9 from both dp and edp

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sc8280xp: Fix PMU interrupt

Marijn Suijten (2):
      arm64: dts: qcom: sm6350: Replace literal rpmhpd indices with constants
      arm64: dts: qcom: msm8998: Make regulator voltages multiple of step-size

Molly Sophia (2):
      dt-bindings: arm: qcom: Add Xiaomi Mi Mix2s bindings
      arm64: dts: qcom: Add support for Xiaomi Mi Mix2s

Parikshit Pareek (1):
      arm64: dts: qcom: sc8280xp: fix the smmu interrupt values

Robert Marko (3):
      arm64: dts: qcom: ipq8074: add APCS node
      arm64: dts: qcom: ipq8074: add #size/address-cells to DTSI
      arm64: dts: qcom: ipq8074: add interrupt-parent to DTSI

Srinivasa Rao Mandadapu (1):
      arm64: dts: qcom: sc7280: Move wcd specific pin conf to common file

Steev Klimaszewski (2):
      arm64: dts: qcom: sc8280xp: add missing 300MHz
      arm64: dts: sdm850: Remove unnecessary turbo-mode

Stefan Hansson (1):
      dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices

Sumit Garg (1):
      arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment

 Documentation/devicetree/bindings/arm/qcom.yaml    | 111 ++-
 .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml       |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   3 -
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |   5 -
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  12 +
 .../qcom/msm8998-sony-xperia-yoshino-poplar.dts    |  10 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  10 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 +-
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   |  64 ++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  |  61 --
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   2 -
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |   3 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  34 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  40 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   6 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 762 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  92 ++-
 arch/arm64/boot/dts/qcom/sdm850.dtsi               |   1 -
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  22 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  20 +-
 24 files changed, 1131 insertions(+), 151 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
