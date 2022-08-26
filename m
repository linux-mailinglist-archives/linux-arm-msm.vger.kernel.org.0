Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800995A27E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 14:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344307AbiHZMgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 08:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343947AbiHZMfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 08:35:55 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9517BC3F5F
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 05:35:52 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k9so1692664wri.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=O/Lx2MkqBrAhaHiPTvS464mpFRQpG/kYU6veErIutKY=;
        b=e7yZB4GefIJDZESuXbkAhv46mvE1UmvkaMYB3FWHxuEzLjUlg80Qw/2O84HlGeSIf3
         8KP4uC1LzKqxgtum98z8M/+4efMa8wnxsHPIDujcY6rcXDOCPsCIAWNzysmSxzie5LXn
         zp4asZdSVB6TCmwz0AHkZN0U+TjgPww7bfwBYCh+7/V85C7hRbc3vgSYLZsJ2cduuZN+
         iRAyhnKK0nM5TM5okhXfyY7Os85Vw45qkL27BkVDHluZuYwLw2PAJFic7P039GLTxX4H
         OnSTxjZqTzXn6/YYu9G1ZXJME5YXR3gStORfk+Yt85OPVXlvxclcpvFybvW5nnww1vmr
         CzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=O/Lx2MkqBrAhaHiPTvS464mpFRQpG/kYU6veErIutKY=;
        b=ztDc9UVfXSf9LVC/NFrgegtoyKDzidvy8JLjAX9Qb066vrwwy0deMUZyfy0WXJOD4L
         nl5qrKNZOu0pXDU2WQNCWv/ks3OGmEvnYaRNWDWtNZNTPJBTXTsFSrY/93mLcxUBrHAI
         xTbDV1Bu7ZC1N5s1rK6PL3ShdidEL1ND9Ql/4qDCzON1osdzNTLWZTNSt6/rCETc6eVM
         Z/zNAmVs9s44GUz+Nw6i660lyYnyEq0Isi/eI/kRvv5zm32MKv6g0kmUYGO9OCikg9qn
         wXw8bPups3op8zHkC8Dzg4FXRKvu1EcvGfBRJhRK6RMXy2drF21MZr5YUuV9rtY2rcia
         oM1g==
X-Gm-Message-State: ACgBeo2IDPa5MyVLmxPR9B+mIAQyv07ALBpUt3sbNiVqpCyPsIiqdfiu
        l0LG7KW//w9SP001cYJ4ZOceNQ==
X-Google-Smtp-Source: AA6agR4xySxtsS4JDK9bqBYTRiftUFtnOxjFFlPS52QHj8asS/p3oWUI9wKEGBdtqajqEXnIEaA8vA==
X-Received: by 2002:a5d:6c6f:0:b0:225:3cbf:eab7 with SMTP id r15-20020a5d6c6f000000b002253cbfeab7mr4878176wrz.264.1661517350888;
        Fri, 26 Aug 2022 05:35:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q62-20020a1c4341000000b003a3442f1229sm8359839wma.29.2022.08.26.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 05:35:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/1] arm64: dts: qcom: pwm: Drop PWM reg dependency
Date:   Fri, 26 Aug 2022 13:35:47 +0100
Message-Id: <20220826123547.3392457-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826123547.3392457-1-bryan.odonoghue@linaro.org>
References: <20220826123547.3392457-1-bryan.odonoghue@linaro.org>
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

Drop the reg dependency from the qcom PWM description.

The PWM driver doesn't depend on the reg so we should drop the dependency
and remove the pwm@reg from the nodename.

Fixes: e79a1385ab74 ("arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
 arch/arm64/boot/dts/qcom/pm8350c.dtsi                     | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 65cbc6dee545e..2a5bafe0660a0 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -92,6 +92,10 @@ properties:
     type: object
     $ref: /schemas/regulator/regulator.yaml#
 
+  pwm:
+    type: object
+    $ref: /schemas/leds/leds-qcom-lpg.yaml#
+
 patternProperties:
   "^adc@[0-9a-f]+$":
     type: object
@@ -117,10 +121,6 @@ patternProperties:
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
 
-  "pwm@[0-9a-f]+$":
-    type: object
-    $ref: /schemas/leds/leds-qcom-lpg.yaml#
-
   "^rtc@[0-9a-f]+$":
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index e0bbb67717fec..f28e71487d5c7 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -30,9 +30,8 @@ pm8350c_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
-		pm8350c_pwm: pwm@e800 {
+		pm8350c_pwm: pwm {
 			compatible = "qcom,pm8350c-pwm";
-			reg = <0xe800>;
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
-- 
2.37.1

