Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A1F644440
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 14:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiLFNNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 08:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbiLFNNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 08:13:20 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133D6114E
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 05:13:18 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id b2so6050926eja.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 05:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X49GRzjJhXbqmB1hs+2urUm1MVIZuKqOwRmIImQS47k=;
        b=Sk/EAHvgaPaKPaq3f6GgtvesKQKbknHQ3rMC7kNAwoEjUwh9ltn4YgQoNdIcImudfv
         7KZviIrWk1cMvdgoFQd27ULKwdIz/qjN1kxelQau+3w5UhD15z+GRnlp4DN6de/otAVy
         72kwMYIoz44WAvGtMKps6RPjAXj4aO0M1SIeDJo5WzzbS2cZjF+kor1bJKNVY3OswxPK
         Lp3PVQD7L3vuSr1T7jHvGVpgyn9kRBF+r6zT/SWIQ89i3NgrIWAeZIvutfRtPOepumh4
         aLgt1pvoByLcrR+Dx29wq4iGEcL3ezfnZ81mq3apF/glTquaPidz/p/iLz9b3GBDzL3I
         83dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X49GRzjJhXbqmB1hs+2urUm1MVIZuKqOwRmIImQS47k=;
        b=CVMiDWiBhtM3bYUwUgpCHCP8q/plrrrDJ172g7b/b3Kb0Bga+WQOdRMF7DAF2Cfcma
         ACL2BfO0H3nvMGKUKBzayLLiZVavfSsxxz5beKmOVnCOFtDVvf0BQqMODN6A39WF5LPo
         iL1XifwiZJlGDloCBV0C1h3HvdFt4QV0EhS11fCQrKWgTF3HWfeTb3KbkJeVZu1taIFI
         9Ssjh2kFjb8vg2y3DKEozMrm4wgdfOnUniVvQLLLtEDDX+3lu28qbCyvLdbwKS9yMka+
         gz9KOtXyx2TlW3BYUfivTqrgBsUlANxx3/q5f5Ie8QwYQUqk+8r7uJefIkvqf+i+/Ddu
         TTew==
X-Gm-Message-State: ANoB5plhpJx2fxDVgKgWV9ScNGokPUj9m4SUde+2DopL+YBRH6TJf9nh
        bbKl6P7Sq9T/RrYdodNdo1mc0A==
X-Google-Smtp-Source: AA0mqf5QQNbBlCkDVK/0B0Qx1XoVgtbccZYuRljgxZ7gAilOWo539hXArD5fRqnt8aEsVk2V3q6fOw==
X-Received: by 2002:a17:906:4a0c:b0:7c0:e306:fe72 with SMTP id w12-20020a1709064a0c00b007c0e306fe72mr9877028eju.243.1670332396533;
        Tue, 06 Dec 2022 05:13:16 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b007b8a8fc6674sm7345775ejh.12.2022.12.06.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:13:15 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 00/10] arm64: dts: Add base device tree files for SM8550
Date:   Tue,  6 Dec 2022 15:12:42 +0200
Message-Id: <20221206131252.977369-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds the base device tree files and MTP board support
for the Qualcomm SM8550 SoC, including the clock, pinctrl, smmu,
regulators, interconnect, cpufreq, and qup nodes.

The SM8550 is the latest Qualcomm Mobile Platform.
See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/Snapdragon-8-Gen-2-Product-Brief.pdf

The v5 of this patchset is here:
https://lore.kernel.org/all/20221205230342.494923-1-abel.vesa@linaro.org/

Here is a branch where the entire support has been merged:
https://git.codelinaro.org/linaro/qcomlt/linux/-/commits/topic/sm8550/next

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (3):
  dt-bindings: arm: qcom: Document SM8550 SoC and boards
  arm64: dts: qcom: Add base SM8550 dtsi
  arm64: dts: qcom: Add base SM8550 MTP dts

Neil Armstrong (7):
  arm64: dts: qcom: Add pm8010 pmic dtsi
  arm64: dts: qcom: Add PM8550 pmic dtsi
  arm64: dts: qcom: Add PM8550b pmic dtsi
  arm64: dts: qcom: Add PM8550ve pmic dtsi
  arm64: dts: qcom: Add PM8550vs pmic dtsi
  arm64: dts: qcom: Add PMK8550 pmic dtsi
  arm64: dts: qcom: Add PMR735d pmic dtsi

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/pm8010.dtsi          |   84 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi          |   59 +
 arch/arm64/boot/dts/qcom/pm8550b.dtsi         |   59 +
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi        |   59 +
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi        |  194 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi         |   55 +
 arch/arm64/boot/dts/qcom/pmr735d.dtsi         |  104 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  404 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 3534 +++++++++++++++++
 11 files changed, 4559 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550ve.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550.dtsi

-- 
2.34.1

