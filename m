Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160BF6C7593
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjCXCZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjCXCZS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE8411666
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id k37so456706lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4EHu4g4QU7EBCUNP4/kfBGYPPyOMibiZN9FLA8lfOI=;
        b=hGenPXFRiPc/ybQCd7gYjYLvnCZDyMCvZ9kr04It7E7+unCq8UjOkk89RctiP770Xe
         hyT1utLr2llhINSmBBxUs89TNF+Gb4pCS/xeBGsbpxlmFaOCl4zK7eT91qXJ6p2zVNa0
         kSV/kSh1xP8rAHbL1ysIyAJiFHXwjNIFtckCVWkwktso7yOIQxKMQaShMxJkKzoK72c+
         MrzK14AgJWFDrk1KpTPBltEMRxrrh+dKB8RMADaOv9iWWHahDoc+xdy5iVQBp/wlyaEf
         crmvutqbwnOZ2li0E5GL8Zk7XOYPK2UejpN1KzaMsu1DpbvVQpL3THg9O/hUIO83QYuS
         XHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4EHu4g4QU7EBCUNP4/kfBGYPPyOMibiZN9FLA8lfOI=;
        b=7EahrCKSsYxm6HG3P9blPxvpEYN+z6TDsFPaHkg7Z2O8Gx5K3DEuStkNbdhS9U6PVS
         jfy7TGkVw7vw+r/WfZPRz65g6oT+pKlRO304Eq/sHe8ek0IpSMK7eeyHAtWCbrJ6OMnP
         V9QuzFf5YrSh1RCEpck2l+dIVsBtY47wnAYtGXjpIfor/ONFm1h1UdGz9qm9VY/FdJpZ
         aR9RvzY18kcaFaKsdlXU4R9vdM8rIFD7hkXKXbWvfZPRypnkWY1GmZrSVzq1sdYjkiiD
         YcQpJ0/iuC6+eWKNKKCtsdDySN9gIzSWsCW00b6TYiI+QSI4C3P7va6exVz11dfProgk
         yXTw==
X-Gm-Message-State: AAQBX9fBB1iZOkpnDBsDY48swk9/DH/R7UIriUSn2p/tQvagLfnhrTC5
        g8HyBYhsf0yt6gCAwSrhkPVallXapv0sEWan4uNelQ==
X-Google-Smtp-Source: AKy350bEF0dydDWJPmj9mRPOm9Tt20Yx9HiCR1uB4Hn/l0cr1hw+oI88pMXt0Tn0G5xX+MSa7NO/Lg==
X-Received: by 2002:ac2:488b:0:b0:4e9:bdd0:b667 with SMTP id x11-20020ac2488b000000b004e9bdd0b667mr209821lfc.0.1679624715415;
        Thu, 23 Mar 2023 19:25:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 00/41] phy: qcom-qmp: convert to newer style of bindings
Date:   Fri, 24 Mar 2023 05:24:33 +0300
Message-Id: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewing several patchsets for newer platforms made me understand that
having two styles of QMP PHY bindings causes confusion. Despite binding
documents having notes telling that old bindings should be used for
older platforms, it is too easy to attempt adding new platform with
older QMP PHY binding. Thus let's have just a single documented style of
bindings.

To facilitate this, migrate all the bindings, extend QMP PHY drivers
with offset tables and update DTS files.

Dependencies: [1], [2], [3]:

[1] https://lore.kernel.org/linux-arm-msm/20230323144726.1614344-1-dmitry.baryshkov@linaro.org
[2] https://lore.kernel.org/linux-arm-msm/20230324021651.1799969-1-dmitry.baryshkov@linaro.org
[3] https://lore.kernel.org/linux-arm-msm/20230324001752.1768505-1-dmitry.baryshkov@linaro.org


Dmitry Baryshkov (41):
  dt-bindings: phy: migrate QMP USB PHY bindings to
    qcom,sc8280xp-qmp-usb3-uni-phy.yaml
  dt-bindings: phy: migrate combo QMP PHY bindings to
    qcom,sc8280xp-qmp-usb43dp-phy.yaml
  dt-bindings: phy: migrate QMP UFS PHY bindings to
    qcom,sc8280xp-qmp-ufs-phy.yaml
  dt-bindings: phy: migrate QMP PCIe PHY bindings to
    qcom,sc8280xp-qmp-pcie-phy.yaml
  phy: qcom-qmp-usb: make QPHY_PCS_MISC_CLAMP_ENABLE access conditional
  phy: qcom-qmp: move PCS MISC V4 registers to separate header
  phy: qcom-qmp-usb: populate offsets configuration
  phy: qcom-qmp-ufs: populate offsets configuration
  phy: qcom-qmp-pcie: populate offsets configuration
  arm64: dts: qcom: ipq6018: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: ipq8074: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: msm8996: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sdm845: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sm8150: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sm8250: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sm8350: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of
    bindings
  arm64: dts: qcom: msm8996: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8350: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: ipq6018: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: ipq8074: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: msm8998: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: sc7280: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sdm845: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8150: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8250: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8450: switch PCIe QMP PHY to new style of bindings
  ARM: dts: qcom-sdx55: switch USB QMP PHY to new style of bindings
  ARM: dts: qcom-sdx65: switch USB QMP PHY to new style of bindings
  ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings

 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 299 -------------
 .../phy/qcom,msm8996-qmp-ufs-phy.yaml         | 244 -----------
 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 394 ------------------
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 276 ------------
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 213 ++++++++--
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  94 ++++-
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 236 ++++++++++-
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 124 +++++-
 arch/arm/boot/dts/qcom-sdx55.dtsi             |  57 +--
 arch/arm/boot/dts/qcom-sdx65.dtsi             |  29 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  63 ++-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         | 123 +++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  57 +--
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  77 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  55 +--
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  90 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 174 +++-----
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  17 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  18 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 153 +++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 211 ++++------
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  60 +--
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 110 ++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  84 ++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h   |  17 +
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  10 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 122 +++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   8 -
 28 files changed, 1316 insertions(+), 2099 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h

-- 
2.30.2

