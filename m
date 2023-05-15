Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8B6702E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242363AbjEONgz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242071AbjEONgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:36:51 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3112619BA
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:50 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f42c86543bso48583875e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157808; x=1686749808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=mbOsaDjwvLU1gQhnguNDd6Y+NMujueBfPyS4GfaQqZu2BAqEbmpQ3PlMCQb1smjIfD
         eKrTqbfpvkcH4g8ZSBdireNIAzN8V3YMt+RkFt3Oktp7yIwJMXTX1CR7aIXKkZNniwFU
         ATNDaP6a9QK5eqJlnQuUau5kpF1XD6CIJhV4CCdbw5CSpvZvlTBvBWAUVcx9MLJsSqKw
         d7xhCVh8PfFb+Mzt2a7lnJrLISCcL7Q0uKC+jrsYUf2IBoHp6C0x47LkgusdgswPzu0C
         lWvW81LLhkEeJqFQiB37aefiMIfsOsxMN5jC784XaAL7p17iEPw3We4s3ZBWUXzPWPLj
         PgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157808; x=1686749808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mot1s4oJJqHfzgUo3NAC8eaCnGWNaTZ4CyGiPVoRb5c=;
        b=FS0CsMdY5/itJpE3V7RySmhw3naRGAgMsC67q6K8b0t5njOPWQdnRunrUh+TGJmw1I
         vIkky4QZ1OpdRb+0ltfHVWsOil0UglfV6ht6o5C1h4XfQZGDMQzTpfd/Lfdg3zA+WkUL
         niBVt79m1igqKg2o6izTHfWvYTPSdWOo3XIyMq95aB9WCpnK4W1eCPFTdugisoz13nCv
         ctA6vOKu6yFbeQj86Ci3x5lWWsxqnkkvVc5rukXgZDY732hJ1XFA4+SI3XsedvV9Ggri
         vo9NBOeiluSPktbzRywqoH+QnIdB7TRIReCUQwTGWEP4M46IdAHn3gO2ipgrWBwmE8HB
         QV6w==
X-Gm-Message-State: AC+VfDww5x2Z8ATFOAQIj/G12I3SQpqBhFwNbf/dmMtlh1vR1NKxTMIj
        6JP/1kM7EwpEM+UTtEqARhViGw==
X-Google-Smtp-Source: ACHHUZ6FxAxMf2hSCFP77wi/MI2KoxiAZd5LsErPujcgOK9VlnTgmut2Jab5lIVWOWJu8ZVjlDYk5A==
X-Received: by 2002:a05:6000:120a:b0:306:4054:6e41 with SMTP id e10-20020a056000120a00b0030640546e41mr27429877wrx.53.1684157808633;
        Mon, 15 May 2023 06:36:48 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:48 -0700 (PDT)
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
Subject: [PATCH v8 02/11] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark regulator-*-microamp required
Date:   Mon, 15 May 2023 14:36:34 +0100
Message-Id: <20230515133643.3621656-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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

