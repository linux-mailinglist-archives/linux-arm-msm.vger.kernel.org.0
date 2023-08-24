Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8F4787A23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243672AbjHXVUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbjHXVT6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:19:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1542B1BC9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:19:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso372931e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692911994; x=1693516794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTzbpQhifk1BKKUlbC708++llGqrCxcRyQyiVjC0krk=;
        b=uucc4Bg5IErKfIdTfyGLsCoMRNTQNRw/na+HgrouDIySI0Hd1nuMYGgVT80Wug9G5B
         qgCD910RwbxM88mjD6gtmtpLgS5SiTG8scBiUmcpyam5Drvz1m/vQy6gHRLCrATjqoFg
         C6BA/Wa+e+U3qSvgGxvZhXZ9iHH3XiDSxvuF0Hs7EFHC01PxnI2U48JRO+/H/tyupuPW
         dgi3oNLcuozqS8SX75R9s05JSp8qtjbHcFDQPYjzmvkRyHcSUzawM1bc2bzrjJwmagKH
         NmduGrXGpCBiGxRkb/15YFfC4V2ay+y4Bg9fMnq/vMaUL6V8coGyjMzTppCpeIaPaHZ3
         cCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911994; x=1693516794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTzbpQhifk1BKKUlbC708++llGqrCxcRyQyiVjC0krk=;
        b=WFrH4YTSsuWw7xVLDcUuQL6ZL3mpU6HRpvAjbymi2jyze+ujXTyeWiXFt2Pu+KRCIT
         xLM51g0dAriDKEQieXPML9CT0SEZ6onKoF5flad7viJoF6M7YQ8IsLx36nc+2mJwJhOT
         0JHi4ESi6fU4cK1SPje4pQUaqFvGf37SeRYmbDhtaQkp0dH2mUhRceStrOUrBwc2nrm8
         t2rTzhQ0qc3/JHpHngT5d2l5zQVckRJnifhO799lfQrDpS4PrY3LYklSnP8ZxfyTZOle
         C916OjBMayVmCOBLVQAW6ooStmCcHAbowQrj89On4Ih/BbZwQWJvdEJMylvIrk6/zUG5
         oggg==
X-Gm-Message-State: AOJu0Yx8QzIStnY6ON+Yls/af6lieJzvsKM3Dsaqw0At+T2voQltnncc
        4vc1qzpBeT/9oD/4cy+OrtIamA==
X-Google-Smtp-Source: AGHT+IHn0Ik6Nnr229/0R2nkLFvuJscxkIzG6VVS7EQljGN8KogWCOdH4ntHGcm/mZ4IWy+bdkftHw==
X-Received: by 2002:a05:6512:1310:b0:500:96dd:f95b with SMTP id x16-20020a056512131000b0050096ddf95bmr4582608lfu.59.1692911994250;
        Thu, 24 Aug 2023 14:19:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:19:53 -0700 (PDT)
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
Subject: [PATCH v3 00/16] phy: qcom-qmp-usb: convert to newer style of bindings
Date:   Fri, 25 Aug 2023 00:19:36 +0300
Message-Id: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Changes since v2:
 - Added maxItems to qcom,ipq9574-qmp-usb3-phy / clocks so that the
   clocks array size is always properly constrained (Krzysztof)
 - Dropped rogue PCIe PHY chunk from msm8998 patch.

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
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |  55 +++-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi        |  41 ++-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi        |  35 +--
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  35 +--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  76 ++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  40 ++-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  35 +--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  39 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  39 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  38 +--
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  39 +--
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h   |  17 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 225 +++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   8 -
 15 files changed, 352 insertions(+), 657 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v4.h

-- 
2.39.2

