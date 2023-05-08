Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBC96FB285
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234402AbjEHOX1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbjEHOX0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:26 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA6B40D2
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:22 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30639daee76so2931558f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555800; x=1686147800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=jm6ITbZ1P+tdnQXhXBxuu3cR7MkjIt1YHJvm7713IBVspHyYrWsf3M7jF79RMdGxy9
         GYgTm6y5wsFDXJ5AfhBJbvpv7o2F5st/VoKGcaT947tMNuQqaE8QFCweqXFEe/NjHQpr
         hBq+nXsKCqn90itFmPoXILXLqj3Efv3A5kwRscOs64a7o1cSH7ttyMf+80LENwF28b/D
         +Tv27kxQFG3/pNq6zHen63Tn7GC3vZejwLnQfbpLZqNhbl6e+zJRF84L0vXGXosJFmWq
         FkXbl4Dfdal7G/a701vJjISDhX5IeGkp+zhjC60mjnsVCJrj2E+AEUu52UOj1/3f6Gsg
         r/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555800; x=1686147800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=UyXox/F8BOhjJ/KwjwpO46n3wblrGYAciZe39qOlpgYEAWZmYA+nywTpi6QrM+G8R8
         fn8IBjlQEr8HHc3I8sU/QGh5/wew9X2XhQ7iVytVpAJx/f51tMA3bqYBnG2InY5f51y2
         2kuviOM6rh3GwWhfYHJZa0IOze7UQdylJbmd81KYRWpQFj5Xyqhld3cUETTG40tq1jCv
         Xg8ma//u7cyBJy1mYZxILaYLUYQVQXYjpG3Ke41vJbk/VeTYETM1maA8QEVg1n/Uf5P6
         QKHJfr5PqJraB9MUJ1VI2/T2ZY7mp23STdRPRQBoWo9C4pLfvoJ0wnFlTGe6mXObRBvU
         dC0w==
X-Gm-Message-State: AC+VfDwbkJKYLUaIiiuY6i5ihC3+yGZJvgv5d4y+zMbN45Crx5yy0ck6
        HhpeJDfguBgsQF0RYiaHXG7Iog==
X-Google-Smtp-Source: ACHHUZ6GJqhDLxKzQJPL/eRzV7X1ET6w4rdL7vu0j+wOBIrmG1cT8RowQOlUc8VyyTvAr26BBCQ1BA==
X-Received: by 2002:a5d:61ce:0:b0:306:30ea:a072 with SMTP id q14-20020a5d61ce000000b0030630eaa072mr7858965wrv.53.1683555800805;
        Mon, 08 May 2023 07:23:20 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 02/13] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark regulator-*-microamp required
Date:   Mon,  8 May 2023 15:22:57 +0100
Message-Id: <20230508142308.1656410-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The VBUS driver needs to know the regulator-min-microamp and
regulator-max-microamp so they should both be marked as required.

regulator.yaml defines those two dependencies so include regulator.yaml.

We need to change from additionalProperties: false to
unevaluatedProperties: false.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/regulator/qcom,usb-vbus-regulator.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 7a3b59f836092..89c564dfa5db5 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,6 +14,9 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
+allOf:
+  - $ref: regulator.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,8 +29,10 @@ properties:
 required:
   - compatible
   - reg
+  - regulator-min-microamp
+  - regulator-max-microamp
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -37,6 +42,8 @@ examples:
         pm8150b_vbus: usb-vbus-regulator@1100 {
             compatible = "qcom,pm8150b-vbus-reg";
             reg = <0x1100>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <3000000>;
         };
      };
 ...
-- 
2.39.2

