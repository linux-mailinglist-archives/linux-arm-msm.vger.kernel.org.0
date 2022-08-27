Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5BA5A383B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Aug 2022 16:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiH0O4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Aug 2022 10:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbiH0O4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Aug 2022 10:56:47 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A395E2AE3D
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:56:45 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so2251155wms.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8ePOaK7LqyICB7cNgln3+XlsOSVfW+pl/bxSdIX+eoc=;
        b=MhzCD+l35fxOSqY7Uq2xIGpyfuDU0VKLDnLVR3ACbEdZUKq/5ak13O4ziprC0clieg
         xkY5z//OJSLcUtf7TBWAQNL/8HlohpnEhpXunuBnSfTnSgeBKux4JZbiy2thfoVeup9+
         PaH9IN4A3FoNXCcnszLH82aWYzlCoZQ62mFkfYuznZnK+0hc7Hk96t/wSkb8UwSa3H3A
         S+K4pAbZRO30E5Xj6SrQ7ABeXTDDF6WWOPDabqvOPwhvpMEm/xlNxkdux9T9nVchnVBb
         jyoikOgwB3QpuEl8Ks3I9MlM8Gtwzf7qiZCnL5d155TEC3h+d4rtR2799idS0cCSqhJQ
         NF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8ePOaK7LqyICB7cNgln3+XlsOSVfW+pl/bxSdIX+eoc=;
        b=r9DFb5+mEvy0S1Cba90qiH6xPY3OeWYmOA6WIVgeFGko63IbtMBpv128Px76uenHFZ
         57m27i4Pw5bF1CuwD9+Abx38vpuYZ+59PTY85go9DuR9PPCE3b72a/NomKFWrjytdvn1
         xaJGVT49TAn0O0BSWF6UwI3O+IbaBa28/K3RF9McTZdKMcmuNXnCZXlN66Qh4NjgmTT/
         WCW/lB4/7J1+RBjPo+6mJQmKb9G8FXFZjA48eVzlg1TXhej2MzI1Fu7DIf79p2tfaaxd
         EETMCJYqEuHj0VyCqkWLVpQXwG242PQHdpGuXdYnfHAT3yC5ZBTYZVa2fPxnEb4+8dLj
         Lg6g==
X-Gm-Message-State: ACgBeo0hMlFkAT0jqcsftBJBpUdJ0+vihXCsJFZ0Fm2GjxBuH10rk2I2
        KxKU9+2JNLQ3qVJDVQ4vzGS+5Q==
X-Google-Smtp-Source: AA6agR7GbiZJHx0DnHSI3C8AScZ1J7DRgnwNCSojtqqzloKGIrGswWgE+9OjEceX0dRT8L2VoSmGNQ==
X-Received: by 2002:a05:600c:4e0f:b0:3a5:e065:9b50 with SMTP id b15-20020a05600c4e0f00b003a5e0659b50mr2519900wmq.35.1661612204279;
        Sat, 27 Aug 2022 07:56:44 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m186-20020a1c26c3000000b003a5e7435190sm3407395wmm.32.2022.08.27.07.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 07:56:43 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: spmi: Drop PWM reg dependency
Date:   Sat, 27 Aug 2022 15:56:39 +0100
Message-Id: <20220827145640.3530878-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220827145640.3530878-1-bryan.odonoghue@linaro.org>
References: <20220827145640.3530878-1-bryan.odonoghue@linaro.org>
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

The PWM node is not a separate device and is expected to be part of parent
SPMI PMIC node, thus it obtains the address space from the parent. One IO
address in "reg" is also not correct description because LPG block maps to
several regions.

Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
-- 
2.37.1

