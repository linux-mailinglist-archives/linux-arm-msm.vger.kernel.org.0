Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A8A687ECD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjBBNia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjBBNi3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:38:29 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222F188CD3
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:38:28 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o36so1421978wms.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2GNH5vdMMAxeW3/q88hsHEut53C5OA4g89R8Sa30oA=;
        b=sHeLh7rejmRl+Gs2HPwza9sBAUoFpbJedUDKUDHSvVf62Tt9ocWNLHxaEhcWrift9c
         WXietGBQxmTdvzLyoc8L7B3aVXpk7Rm6he0GNmhG6CQEN3iwwIMbR1SxYZ1t0CFfWwF0
         Sr5WK/9m8siRIGJebaEnnl7PchVOqiGUqRzzW+5pmOrlHwqNeLuAK4zoNiCHnaTqnDru
         bnSf9zC402o9bfX4a4QfzUo2befObSYEKoDcevtFqKuStcTtd0POLq1OgDDV45qbPz0H
         BIQZrkO64QCVPHYv0C8YBFMtmmKBrHs2vrVJpgFYMO7lHbiCPqiIQqBK2x2vNAxFlhsX
         rjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2GNH5vdMMAxeW3/q88hsHEut53C5OA4g89R8Sa30oA=;
        b=2sPv4my64A5TDjEifsXcveP/GUQ3mQLFhM86IJ2+0crjBf/QHm2ClBL3LREFatLqXY
         D+mhynQ3i+1eN1hEOyPMn5E0Bd6eygeJ+43OJYWLgHf5KS63Q5xvSfcY6vfVIB1jMatV
         ofF9gQZ+kXgZBQzTHfqP2p6Yp6ILv/ut/itCtoiqAX6rC9XatwMo5R4zRDnQS52S1uv0
         j7uBRBG8YZytZagy3RwpvAg7CVqwCxLqZq6e69P8iITa5uSAP6t7PI0nans0VcOHmno/
         cGoQBFGoinNVAkoEW7DduNXH8v+ZX3wDcRDuial5vrPE64jiPVYt5yF76sOxX8RAyDqS
         E3Aw==
X-Gm-Message-State: AO0yUKVihmPZWZCJzj4xlWlDOsoyZEihSErSR9g6R+PVQtQfvvh0ZJFO
        zgtYF2lJAvSpwS7Wlp0o9X+jiA==
X-Google-Smtp-Source: AK7set/pSxSbtteJLy+n0jBpDdMHf8zvoXMVU/bki2S6y/dGnUgfpt3devM6jAVBRRAIgjX33ZWNLQ==
X-Received: by 2002:a05:600c:5113:b0:3df:9858:c02e with SMTP id o19-20020a05600c511300b003df9858c02emr1920935wms.3.1675345106716;
        Thu, 02 Feb 2023 05:38:26 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c364a00b003daf7721bb3sm4672657wmq.12.2023.02.02.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:38:26 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [RFC v3 0/7] sm8550: Add support for eUSB2 repeater
Date:   Thu,  2 Feb 2023 15:38:09 +0200
Message-Id: <20230202133816.4026990-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds support for the eUSB2 repeater found in pmic PM8550B,
used along with SM8550. Since there is no dedicated generic framework
for eUSB2 repeaters, the most appropriate subsystem to model it is the
generic phy. This patchset also adds support for such repeater to the
eUSB2 PHY found in SM8550. Basically, the eUSB2 PHY will have its own
"phy" which is actually a repeater.

This patchset is based on the following patchset:
https://lore.kernel.org/all/?q=20230126131415.1453741-1-abel.vesa%40linaro.org

Changes since v2:
 * moved the bindings qcom,spmi-pmic patch before the repeater schema
   patch in order to avoid the repeater schema validation failure due to
   phy pattern property not being found in qcom,spmi-pmic schema

Changes since v1:
 * the repeater driver is implemented now as a PHY rather than adding
   a new generic framework for USB repeaters

Abel Vesa (5):
  dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
  dt-bindings: phy: Add qcom,snps-eusb2-repeater schema file
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add phy related properties
  phy: qcom: Add QCOM SNPS eUSB2 repeater driver
  arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node

Neil Armstrong (2):
  phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater
  arm64: dts: qcom: pm8550b: Add eUSB2 repeater node

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     |   9 +
 .../phy/qcom,snps-eusb2-repeater.yaml         |  48 +++
 arch/arm64/boot/dts/qcom/pm8550b.dtsi         |   6 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |   8 +
 drivers/phy/qualcomm/Kconfig                  |   9 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 278 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    |  18 +-
 9 files changed, 380 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c

-- 
2.34.1

