Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681A6612993
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 10:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiJ3JnL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 05:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiJ3JnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 05:43:07 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7925CD104;
        Sun, 30 Oct 2022 02:43:04 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a14so12099725wru.5;
        Sun, 30 Oct 2022 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=el1uBcYSsOxkuMCXtaqTfOSF/xC4DrDJWOTKK9iaBnE=;
        b=drCnBi96HM4gMyanXFhlxgPpUpI1VrPTRivTIYxnsqGiIiWEEUpFztyC+aIW8I/STw
         U3VazpPaiZ1Zy3kq205EgE95C5oKQ8B9WxMuJdAz86ShW2NXgRHFX94eSIBJ2C9MH+3m
         0XS+87N25UgQ5AcuQVzeUnOFBCsynyRG/jhfQSmlfQVpit2EUtJ2tK16Hc4X34YnNydo
         sq2lgv9mpGD2iuycxduqJxYWMdjB50pZTtuJ9wHh78NBSRWP86JuNK17mrB9l4bBqLfi
         EpxOchkZ7gWb+C6KnM1+iZJqb75SMn91x6mcvywI6UiUqK3w94wDtPUuxa5PcKw5+/DY
         5B2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=el1uBcYSsOxkuMCXtaqTfOSF/xC4DrDJWOTKK9iaBnE=;
        b=UHblTPhZLyrsV7E5MbAhwLjWj2lJOgk11u330Oygw8govWtA3x9XKjY3dqk0DG2jbH
         qgYC+zEHAY0/IjKTMpvJuihhcfnVtMUuyL25MEOrDw7EAK8X7Cb8zGUVrlsyg0XU8ZI/
         s211YGV0pHQfyybu5zwowJMIKy6hEi/N56xRsXsuRpDHPkoUBcTPKWUg+HkptzqH77l5
         pBYaXiqkQDejmg2qlZP46S9DtBWXOpa+0cEU7jJInlQQmPgYErsW/FHwHtdoxJToZOZV
         5cJIBgtQkUWlvT1il0/ZuZ0vSp/1jDfAKenTGislY/h6U3O+FfteJu8V8GYY2t1BvTRF
         4kMw==
X-Gm-Message-State: ACrzQf3nVx24ZAQ52gxAkKmVToeBK1GxCvI7+eI4sQ/xVRjHqyEob9hX
        T0kVhw+DzlQMVukqMBUaHwk=
X-Google-Smtp-Source: AMsMyM7dGn+ozvM9hHqLQm1/2R3zz7vJRKWrvea5EeHkh837XJAHk6cExaKdqoye0BR+zu+i+ef8aA==
X-Received: by 2002:a05:6000:15cd:b0:236:9701:7939 with SMTP id y13-20020a05600015cd00b0023697017939mr4440305wry.248.1667122982531;
        Sun, 30 Oct 2022 02:43:02 -0700 (PDT)
Received: from localhost ([77.78.20.135])
        by smtp.gmail.com with ESMTPSA id z3-20020a5d6403000000b0022ccae2fa62sm3752873wru.22.2022.10.30.02.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 02:43:01 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v5 0/8] Add support for sm6115,4250 and OnePlus Nord N100
Date:   Sun, 30 Oct 2022 11:42:50 +0200
Message-Id: <20221030094258.486428-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes from v4
v4: https://lore.kernel.org/linux-arm-msm/20220919180618.1840194-1-iskren.chernev@gmail.com/
- rebase on next-20221028
- drop merged patches
- add unmerged patches from https://lore.kernel.org/linux-devicetree/20220815100952.23795-1-a39.skl@gmail.com/
- all in all, treat this as a resend

Changes from v3
---------------
v3: https://lore.kernel.org/linux-arm-msm/20220910143213.477261-1-iskren.chernev@gmail.com/
- move qcom,smem to reserved-memory region
- change soc to soc@0
- pad reg addresses to 8 digits
- align pinctrl with latest linux-next
- rename usb labels to align with existing socs
- use named masks for armv8-timer
- order billie2 overrides by label name
- dual license dts(i) files
- dropped merged patches

NOTE: Not done as suggested:
- armv8-timer: I used GIC_CPU_MASK_SIMPLE(4) instead of GIC_CPU_MASK_SIMPLE(8),
  which would have changed the hardcoded mask
- I haven't changed the default state of regulators - there seems to be no
  clear way to do that across the board

Changes from v2
---------------
v2: https://lore.kernel.org/all/20220903174150.3566935-1-iskren.chernev@gmail.com/
- fix ufs bindings to follow sdm845
- drop nvmem, firmware, reserved-range patches (merged)
- add patch that fixes sm6115-dwc3 bindings (4/9)
- add patch that fixes qcom,sm6115-sdhci bindings (5/9)
- add patch that fixes qcom,sm6115-qmp-ufs-phy bindings (6/9)
- drop dynamic reserved memory regions
- drop clock-output-names
- drop frequency for timer
- fix mmc pinctrl regression in v2
- move board clock freqs in relative scope
- fix indentation to please Konrad
- reorder some DT props (reg, status, compatible)

Changes from v1
---------------
v1: https://lore.kernel.org/all/20220901072414.1923075-1-iskren.chernev@gmail.com/
- merge dtsi patches in one
- fix ufs binding (allow ice register)
- fix dt schema issues (to the best of my ability)
- add a few necessary bindings (compats)
- some comments on remaining schema issues after commit msg (patch 7 and 9)

This series adds support for sm6115 (clocks, pinctrl, usb, ufs, sdhc),
sm4250 (mostly empty shell on top of sm6115) and finally basic OnePlus Nord
N100 (codename billie2), including the above mentiond items plus simple
framebuffer.

Adam Skladowski (3):
  dt-bindings: dmaengine: qcom: gpi: add compatible for SM6115
  dt-bindings: arm-smmu: Add compatible for Qualcomm SM6115
  iommu/arm-smmu-qcom: Add SM6115 support

Iskren Chernev (5):
  dt-bindings: ufs: qcom: Add sm6115 binding
  dt-bindings: arm: qcom: Add compatible for oneplus,billie2 phone
  arm64: dts: qcom: sm6115: Add basic soc dtsi
  arm64: dts: qcom: sm4250: Add soc dtsi
  arm64: dts: qcom: sm4250: Add support for oneplus-billie2

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 .../devicetree/bindings/dma/qcom,gpi.yaml     |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |   1 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  26 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 241 +++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |  38 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 854 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |   1 +
 9 files changed, 1170 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115.dtsi

-- 
2.38.1

