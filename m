Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA9F781E1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjHTOZU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjHTOZT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:19 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A6E2724
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9a2033978so39800191fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541238; x=1693146038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZErwlA4SFN8xfjVsMunxZG98CnjarXI1zZZ0seeqKw=;
        b=OP1L0IY4u4/WD+sJmJ9BJ2SexgWSc5MU+6CEIbY2hCohje3zO5DwsCoMUi4rB00D8b
         bMRLP2FvPJpbPFaOo8Eo/dYfs6Khz3zp97MPbRf9OLzVIUMeaxQYnrd/nzVxjfJD132g
         2NvjP1dZIuLrTLpsLJtm1f965b60mkuOLokov5EOScPRNL6XLDv1jQPMg2CvYxd7JeFc
         M/yqJdIeJ13Vu+v3/u0KttYPUHnnY5VOM5ciawSJRdcKh8mGesM/ef5EKIfGMgyHAYkt
         TsvgQpjeDGvrefIBXWNQYd/giK3QPgvd9G1RBuyo82v/kx6S0BPe8HXGlzwruQ0TPNQy
         jvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541238; x=1693146038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZErwlA4SFN8xfjVsMunxZG98CnjarXI1zZZ0seeqKw=;
        b=SsIKReQqAUS1/Y0q/3lAuQzNXbjqjqfBQbuXdrP1Vwk7KnQJp+JO4noDIlZA9OSMQU
         zkXL4WabPm5JcZqLJS3Q90w/6SeGcCpjsgux4SQJUGO9Vne79IGsqF6AChZZM94YzAD9
         D9pb7IjkuVJDfIOcMwy6fVXTMHFz+kTPagqVxqMuT+6hKh4RA9wc5p1Ws5qJ5yZnZmX3
         /+9qlkZWU1U5IF/6aMZCOA7AgUoVkGaC6z7Yy2yhH8bfDJhGFAXFS/s929aTC86WnkQw
         okNpeNZtw4Y45P6Eu+LBYtArUXFHOc+2LSJJ9WMMrNM+I9Hpla682ageAvswCTEsUmZa
         Kn4w==
X-Gm-Message-State: AOJu0YywujH2/LThOf4x82kYBSfdzEr++WJuDnw344S/41XUzx1oxsHP
        RhY79E9EgmMrYlAyB9e+SoIZjg==
X-Google-Smtp-Source: AGHT+IElG4nucCOvM5CCM85FbztFMgI5vXiqPZG+KdMHS7Y0CEAAzQvGn8ISivtd3uAGP7DWhCP9Wg==
X-Received: by 2002:a2e:9dcd:0:b0:2b6:e105:6174 with SMTP id x13-20020a2e9dcd000000b002b6e1056174mr2971711ljj.47.1692541237207;
        Sun, 20 Aug 2023 07:20:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:36 -0700 (PDT)
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
Subject: [PATCH v3 00/18] phy: qcom-qmp-pcie: convert to newer style of bindings
Date:   Sun, 20 Aug 2023 17:20:17 +0300
Message-Id: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
 - Split away patches for sm8150 PHYs. Add missing driver bits to enable
   PCIe PHY support on sm8150 (were submitted by Bhupesh in May 2022,
   only DT bits were merged)
 - Fixed v5.20 offsets merged earlier. Fixed merge conflict due to their
   addition
 - Fixed clocks / clock-names alignment in ipq8074.dtsi / sc7280.dtsi
   (Konrad)
 - Fixed PHY DT names and resource address for sc8180x (Konrad)

Changes since v1:
 - Split large patchset into smaller parts
 - Rebased on phy/next

Dmitry Baryshkov (18):
  dt-bindings: phy: migrate QMP PCIe PHY bindings to
    qcom,sc8280xp-qmp-pcie-phy.yaml
  dt-bindings: phy: qcom,qmp-pcie: describe SM8150 PCIe PHYs
  phy: qcom-qmp-pcie: drop ln_shrd from v5_20 config
  phy: qcom-qmp-pcie: keep offset tables sorted
  phy: qcom-qmp-pcie: simplify clock handling
  phy: qcom-qmp-pcie: populate offsets configuration
  phy: qcom-qmp-pcie: support SM8150 PCIe QMP PHYs
  arm64: dts: qcom: ipq6018: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: ipq8074: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: msm8998: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: sc7280: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sc8180x: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: sdm845: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8150: add ref clock to PCIe PHYs
  arm64: dts: qcom: sm8150: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8250: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8450: switch PCIe QMP PHY to new style of bindings
  ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings

 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 278 +++---------------
 .../phy/qcom,msm8998-qmp-pcie-phy.yaml        |  97 ++++++
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  36 ++-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi        |  31 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  32 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  67 ++---
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  30 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  40 +--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi         | 148 ++++------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  71 ++---
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  70 ++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 112 +++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  82 +++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 177 ++++++-----
 14 files changed, 537 insertions(+), 734 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml

-- 
2.39.2

