Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF3260024C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbiJPRXj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiJPRXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:23:03 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD25B33405
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:50 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id d13so5451773qko.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR0uEMXM+VrjGRr3ZFiuAh6rMg7dC5fdvkVqkE+E16M=;
        b=V50UGpTsUJplx5g4WSm5Gy9xgDyGwMm97Hwi+1A5DHnS6+CiI8PLhmBD+KP9y1Wh41
         b+S+/X2PLym77W+6xx5YdEVwibbPKYmRIHbFTVLVP16URU6BwesKs+Bi68MbOXVibFFt
         bVR0LFz1OtXSREMSkbZIBzKzFAt3yI25EmO+QeaMJdGn68Cu/K0ouXKACRO0YDjRhojK
         YqeSBRtna/PrLCen563eT+ETPkH8oftFbfD/0v6V0gB8X+/+r6a1LyvBknA+20Gycuam
         6Y5kjwj9+frTj1yf6QsNQ7fblKawnR4X30l++w8O4K32dAo1wYfOxkqJ6VaaIul3PBhq
         7K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR0uEMXM+VrjGRr3ZFiuAh6rMg7dC5fdvkVqkE+E16M=;
        b=BcRzvEkOptOjASBhUtImigixqbS90n1XMjpkJZWQu54GLuSuwy9brSayz/2VmxuoZA
         H2aubeRdbbceEHrbQZzRGduwKIrvjwz4Uz3+JCkyHblraw2hBmXFnt4o4ySUkZn+odE3
         Yt7hYEcQRjcAzUx6FQ+PvdERigZsDZHApQnr5HN2pO5dBy/tYB88Dq8GKHLgL23EFhFg
         pE6NolyNs83NH29hr7zYdz8oQCKxgCYGjIP5wD7XeBcq07bch/4CdmtX+abT0ikUK2M8
         wiCWDCDzxwKhW80+lyoOx98VCOFJLMkhXH7ALWKgs3vRQZGDw0BI6L9ydKMRNuVJ2vSB
         DV+Q==
X-Gm-Message-State: ACrzQf3T7XRucLct83IWdIBnfF0lyRjEmvLSI28HhvLjJ6EzUdZZat4g
        BxDEEog4J/M63z6HjIhZq3vElg==
X-Google-Smtp-Source: AMsMyM6FPIrTcRyiSQrei+34nYOFp7EJgTfLgOsH7YUUKOHShtJd2nWrqZmkcV0udKlHqrqHZeipvg==
X-Received: by 2002:a05:620a:4388:b0:6ee:8796:e390 with SMTP id a8-20020a05620a438800b006ee8796e390mr5122084qkp.289.1665940968587;
        Sun, 16 Oct 2022 10:22:48 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 12/17] dt-bindings: pinctrl: qcom,sm8250: use common TLMM pin schema
Date:   Sun, 16 Oct 2022 13:22:07 -0400
Message-Id: <20221016172212.49105-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema for pin mux and config
already brings requirement of function for gpio pins and the definition
of drive-strength.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>

---

Changes since v2:
1. Drop drive-strength, reword commit msg.
2. Add tags.
---
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index d7d8e5d3b659..9447b79655e2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -64,6 +64,7 @@ patternProperties:
     if:
       type: object
     then:
+      $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
       properties:
         pins:
           description:
@@ -99,18 +100,12 @@ patternProperties:
                   tsif0_en, tsif0_error, tsif0_sync, tsif1_clk, tsif1_data, tsif1_en,
                   tsif1_error, tsif1_sync, usb2phy_ac, usb_phy, vsense_trigger ]
 
-        drive-strength:
-          enum: [2, 4, 6, 8, 10, 12, 14, 16]
-          default: 2
-          description:
-            Selects the drive strength for the specified pins, in mA.
-
         bias-pull-down: true
 
         bias-pull-up: true
 
         bias-disable: true
-
+        drive-strength: true
         output-high: true
 
         output-low: true
@@ -118,16 +113,6 @@ patternProperties:
       required:
         - pins
 
-      allOf:
-        - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-        - if:
-            properties:
-              pins:
-                pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
-          then:
-            required:
-              - function
-
       additionalProperties: false
 
 allOf:
-- 
2.34.1

