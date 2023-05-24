Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6B270FCC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235021AbjEXRjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbjEXRjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:39:06 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F305123
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f60e536250so524745e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684949943; x=1687541943;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUdiazmRReas3vG3ddLXuotctYV99m5P+9uX0pWQHJA=;
        b=XZAAyTm8ZG1+HJI6t9WYauelFdph6TIfhnRRBA7bOzytQlC3MiiLKr5yEyd+Y7/RTe
         rNZ5ecyWnHvTc42akvHYrCnGCaW2hV/Mk0bO4LcQ2nrTbCaQZs9VL6DvBBKECm41N5qb
         UGpKu+fl/optTD/ScvTVEEfsA/S9A7H0YG6f6pOp5rJElumm5HsHiuIFoWk7Eu9w4wTl
         Pw+94+r1WEcHm7jpCyS0rgs+3wscMSFwAlli9cHCkifOSGlDo54dQmvFFnlnI5YMPFuH
         6syjEaSzTv9Yg9yC25+YOv0upf8FCSwr4XKr5N0zOlONCkRBmk9z99/+J6u2Zszgpj5l
         xJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949943; x=1687541943;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUdiazmRReas3vG3ddLXuotctYV99m5P+9uX0pWQHJA=;
        b=MR3aNpqFNr+GrxVffzt2w/nrRxiaY7+9+7Ac2M6m7WQNrN/9pXeiM/9gA0guCEbu0S
         31XBUqqQWmHBJGLETeH1ITai4MuQFwinVABShrl92xDLYaxDMdQzYBQHnmtLs1X2k+fC
         6Hhy/ZXVVHLbUrEulX+IQxU9+cUB9HaOM3bRcCoTm/4U3F2zvLx4W67oKvb/nP7LqUwl
         CW9i0QeIiXPtI3DoYpxHnH7JhwOSLjVe2Wj/tlNVfEo708hLq5Gv/gwseiFYjmU12JEU
         nkLjmTyVLrvFikEukpCJ0mKI/s2ZFX7ynFqSeNroSlZtqVh4oF6eQayfVVYE5PFgtGoL
         XfNw==
X-Gm-Message-State: AC+VfDz4HVY6TOvXTF6lAdxircVYxgI66wH4CnQuBEK2MhkhPX/thv/X
        fBWWGETlkPQ5C+Ng2DTJDOu8tw==
X-Google-Smtp-Source: ACHHUZ7ngyUzDcJFnhxEoAarDKO6vNXiqrRnu7zg5YvCCW6a1GO6V6OaydgAEMrhV9ljsxP9LllPMw==
X-Received: by 2002:a05:600c:210f:b0:3f6:774:fdc with SMTP id u15-20020a05600c210f00b003f607740fdcmr69058wml.18.1684949942767;
        Wed, 24 May 2023 10:39:02 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l17-20020a7bc451000000b003f4fb5532a1sm2993053wmi.43.2023.05.24.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:39:02 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH 0/6] Enable PMI8998 charger on supported devices
Date:   Wed, 24 May 2023 18:38:51 +0100
Message-Id: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtLbmQC/x2NSw6DMAwFr4K8rlvIB4VepeoiJC54QYrsClVC3
 L2hy9G80dtBSZgU7s0OQhsrv0uF7tJAmmOZCDlXBtMa23rjcF04DEPAamUiwfxR7Ix33tg+kbV
 QyzEq4SixpPlsNS/B+Vt/dZhpOwer0Iu//9vH8zh+LWJlgYYAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=YGtBZP3UKFjT8lr8Yu2Xa5Vz/k5eXAr/qTvIzGi9mNc=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkbku1yH9sUmoAOGWBGCdyQ5A+bzHOwUGjv6Ym6
 4C/xhsHnu6JAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZG5LtQAKCRAFgzErGV9k
 tnNGD/4hPKy220IelrEs5dOhOE7Fi/SWbHQc8cBmN1kdb/HB3kBPaWaVu48EtHbtnORFQm4McAL
 gCQeffYFSmg+P85Sl6cm/tQ6uQORd3zBv7nU4tSn9td+rClldtDfVh2r7umhscpKYvL0XN7pqHk
 d8lgLPWE139Yj1Zl1+04YBBYnHn6PeW2O0fdp6TU5Z9e+25DqNonegU3trXrDid4eS2+N0ogV26
 X/mmeVbc8zg83b5UTeiRFv4hC5Wt/tPdCpY2Jq16iW0MW6U6GLc3fsKpFGKMa+oKntNVo6LwPT9
 LrroR7rMQNtQc0McMfPNQ55AzV+UTN2iQOTpL9Kf2noQyhQMgtMZbkhFN18Jy8YRBWECW/3kxMv
 HXSk2GFXoK+5pSfo2JqSU2xlkzaUKqhFhZ0ZSd32g9LCo31zAM1ea0VeGGi6ZyGF3Jb0AxGtkDU
 n3DU3DGqik7VY/0rawXSySCGcYtAiBDK84PMHXygOF+tlLl8tNmvKnxW1j1RQphZZZzkl01Y91g
 a6pRnsuUMWtGZwcfXwSEaM2ickiIUDRD28Nvq013Ehihk8nhqyHbMjOxVqu9KIh8EfQCm4f6WKo
 t34g92qZYOPtIB0Q+Zh8Y65il0DBESVAtTog3Ltq2ERmTXo9LjghR/D+c9VmAsi44IL9bnt0/R6
 V4DXzR8XKIzB36w==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These devices have been fairly heavily validated with the driver and are
known to not explode. Add the pmi8998_charger node to pmi8998 and enable
the charger for the OnePlus 6(T), PocoPhone F1 and SHIFT6mq.

The charger depends on the RRADC for the input voltage and current. The
RRADC was originally disabled by default, but there isn't really a need
for this as it's used by all devices. Let's take the opportunity to
enable it by default.

The associated driver and dt-bindings that this series depends on can be
found here:
https://lore.kernel.org/linux-arm-msm/20230524-pmi8998-charger-v8-0-b87ffcd9864d@linaro.org

---
Caleb Connolly (5):
      dt-bindings: mfd: qcom,spmi-pmic: Document pmi8998 charger
      arm64: dts: qcom: pmi8998: enable rradc by default
      arm64: dts: qcom: pmi8998: add charger node
      arm64: dts: qcom: sdm845-oneplus: enable pmi8998 charger
      arm64: dts: qcom: sdm845-shift-axolotl: enable pmi8998 charger

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable pmi8998 charger

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |  4 ----
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              | 22 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  4 ----
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  2 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |  4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |  4 ++++
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  9 +++++++++
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 15 ++++++++++++---
 9 files changed, 51 insertions(+), 14 deletions(-)
---
base-commit: cc08021afd54862446ef11fd683558a7e57cdc6a

// Caleb (they/them)

