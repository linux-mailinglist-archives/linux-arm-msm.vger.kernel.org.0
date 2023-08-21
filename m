Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5227820CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbjHUAZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjHUAZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D442A1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b962535808so45207171fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577536; x=1693182336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEbvmaIurG+6Mij2R4BdBj5E2cSt8yX9PK0EjQaA8S4=;
        b=ZRsSENn60CNjQo0Npc207j90WCFn8GIgKzKgxgWybWY4zmYMRwhpahGkQrHiR0v9eW
         yscWP4SB2O2OU20PQFxs54SzDDbX8LeXsC6j0ltmO361QGv6Z22039T1j6aBNpTSSvns
         JegkjKuHl3FF9r+RpGOx8Fu2kcu9dFq+xDAglJGxj9+KhLSCohY16Sz+hyqPOPqVSDpw
         QboyUP/89ZNHVRurUghDSVpgXsWMOQVTIB7o2T45hV3Yyn1oT/3iGasFJuSdZL4CyN7x
         f2VAKotjwsdyGwMGPZS8Bf7bqUKOgPHe+dS3PkS547dCfxOW3UZNOh43apLktsACbE4E
         eliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577536; x=1693182336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEbvmaIurG+6Mij2R4BdBj5E2cSt8yX9PK0EjQaA8S4=;
        b=FwmUG6OrYjqYscTBshcbLtPbHSF5xhrW6MpRTpf3dEMR+b8nqf7kY4x+gdlXXFccZO
         ycq5PhUNDBXM1YRxbFqXykwVQXlJXd79fEbfhWbI7bT1oeEbuipEJ3v74Sn60+iL2gS5
         HID6k3OqzLXfmJcaERgY2qlk/ZfT3LWa5m9wlrx+Vh8GK95buMtVvv1n8BoCWqdGfK4I
         8Mv1MCNibsSzX4sxiXLIEQisawFq8/MlE/RxWYOEVnOOZLFwXRfN4es9ZGscCrtagUxX
         YbpshX9VQmMZhEcZAiqv0eR1RqxzWVB3yD5yD6dvzpFEF+ILva9+i2q2Kg32guBM3DCW
         t/ow==
X-Gm-Message-State: AOJu0Yybt1cTdrHoWTYxJs40uYjckx3NGqAAkN9Lg0PalSDV7hqatPlt
        c+pvLqyPEFxyhifUw4TjNW+CBQ==
X-Google-Smtp-Source: AGHT+IH2TLA5eAwtc+QqDfSvcLBXW+oCUCt186ZZc0tI9aFuib9qxbba8DiMww84wen7n3z6/BM0tA==
X-Received: by 2002:a2e:c42:0:b0:2b8:3a1e:eec9 with SMTP id o2-20020a2e0c42000000b002b83a1eeec9mr3206278ljd.36.1692577536557;
        Sun, 20 Aug 2023 17:25:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 00/16] phy: qcom-qmp-usb: convert to newer style of bindings
Date:   Mon, 21 Aug 2023 03:25:19 +0300
Message-Id: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewing several patchsets for newer platforms made it clear that
having two styles of QMP PHY bindings causes confusion. Despite binding
documents having notes telling that old bindings should be used for
older platforms, it is too easy to attempt adding new platform with
older QMP PHY binding. Thus let's have just a single documented style of
bindings.

Proposed merge strategy: immutable branch with binding and PHY patches,
which can also be merged into Bjorn's dts-for-6.7

Changes since v1:
 - Split large patchset into smaller parts
 - Rebased on phy/next
 - Reworked bindings to follow the common standard rather than blindly
   moving the PHY contents.

Dmitry Baryshkov (16):
  dt-bindings: phy: migrate QMP USB PHY bindings to
    qcom,sc8280xp-qmp-usb3-uni-phy.yaml
  phy: qcom-qmp-usb: simplify clock handling
  phy: qcom-qmp-usb: rework reset handling
  phy: qcom-qmp-usb: make QPHY_PCS_MISC_CLAMP_ENABLE access conditional
  phy: qcom-qmp: move PCS MISC V4 registers to separate header
  phy: qcom-qmp-usb: populate offsets configuration
  arm64: dts: qcom: ipq6018: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: ipq8074: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: msm8996: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sdm845: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sm8150: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sm8250: switch USB QMP PHY to new style of bindings
  arm64: dts: qcom: sm8350: switch USB QMP PHY to new style of bindings
  ARM: dts: qcom-sdx55: switch USB QMP PHY to new style of bindings
  ARM: dts: qcom-sdx65: switch USB QMP PHY to new style of bindings

 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 287 ------------------
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |  53 +++-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi        |  41 ++-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi        |  35 +--
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  35 +--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  76 ++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  40 ++-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  39 +--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  39 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  39 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  38 +--
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  39 +--
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h   |  17 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 225 +++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   8 -
 15 files changed, 352 insertions(+), 659 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h

-- 
2.39.2

