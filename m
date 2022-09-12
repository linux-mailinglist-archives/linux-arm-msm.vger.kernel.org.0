Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4F5E5B53E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiILGSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiILGSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:03 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7340827B1F
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:00 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id y18so9311001ljh.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9Ga8X9++qfiAWh6BldRFQQXZ+w/+Bj3hqeXHqr2J+Og=;
        b=MkBeGITuxFq8B3+KVWBocBoRpwWOeyxi8nZNPC8gDPapMrUfABNQNHYoT6po/jKQ5+
         e1VTrtMkTuqcE905n9OiwleCv6rFy/3aaV0PFkzgCEQ8+37T8AskyCus6SVBPGArFshL
         qUPVYA6/44Rkfh+VVsK3cGvG+wTnn0QvvWutx1Ss2+PP+DvMsDtoU00GkgtTLIJQMJSp
         GMTHvYzGdrNLQeGge7FahsKMZgUKKQNTevza9SC/Swenraqm18KtZXRCzac7s0mn4kJe
         L0RR1CdvuIPBQj+wZ4HMWMDG/3WazUFHZg6xJ7f3S4EdCI2P42jvoLqaYtBhFkge5z6N
         WhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9Ga8X9++qfiAWh6BldRFQQXZ+w/+Bj3hqeXHqr2J+Og=;
        b=uaPGsACbdTYBxfWunnGgM1iy9ReK7zsd/5xMIAwf536Xy17iYL4W/RhYTY8IrCXw8A
         qMe2fZqdgMSNZq8Ztt6nzMZIFRQAX8LApygQEKQ5jCDAC1jlBlsi6OYLict5ygnEwv2+
         Rsi3dnH8YCPVKc2ukmdKugJRc49BR1hZ5+ah/9v21B/a27qrWfUUxM8gBO24AVIy5CPh
         /irHKa7+BDXKL5vlx6kgon8SMvBHOp2944a0ZgdjJxN/92vs9HJvSUsqBpI4kyvvvrEd
         L0O3Kbze8JeRF/6Y9zPEx8uVbD4VdsVlliI14XUGsj+lPxFzhgLeIcMx5XvA/VRqKdtB
         P82g==
X-Gm-Message-State: ACgBeo3hB/ZgJsYjUOgiIWdKIwy2II2FXgeBbv1XWLKUMptGQvVakrDT
        Sjf9xUbw97gK6Q5WTY88ziFwVw==
X-Google-Smtp-Source: AA6agR7QhocX1THln9X3pKtbHqBNFAiz5uUKM16iZZhYB3tXzCoHbb7kshkUQUZ50OlscMKuzjhY/g==
X-Received: by 2002:a2e:a801:0:b0:261:91a3:bc44 with SMTP id l1-20020a2ea801000000b0026191a3bc44mr7194605ljq.497.1662963478460;
        Sun, 11 Sep 2022 23:17:58 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:17:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/40] dt-bindings: pinctrl: qcom,sm6115-pinctrl: fix indentation in example
Date:   Mon, 12 Sep 2022 08:17:09 +0200
Message-Id: <20220912061746.6311-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 80 +++++++++----------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
index 28b29bf714b4..e39fbb36d8c1 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
@@ -150,44 +150,44 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@500000 {
-                compatible = "qcom,sm6115-tlmm";
-                reg = <0x500000 0x400000>,
-                        <0x900000 0x400000>,
-                        <0xd00000 0x400000>;
-                reg-names = "west", "south", "east";
-                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 114>;
-
-                sdc2_on_state: sdc2-on-state {
-                        clk-pins {
-                                pins = "sdc2_clk";
-                                bias-disable;
-                                drive-strength = <16>;
-                        };
-
-                        cmd-pins {
-                                pins = "sdc2_cmd";
-                                bias-pull-up;
-                                drive-strength = <10>;
-                        };
-
-                        data-pins {
-                                pins = "sdc2_data";
-                                bias-pull-up;
-                                drive-strength = <10>;
-                        };
-
-                        sd-cd-pins {
-                                pins = "gpio88";
-                                function = "gpio";
-                                bias-pull-up;
-                                drive-strength = <2>;
-                        };
-                };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@500000 {
+        compatible = "qcom,sm6115-tlmm";
+        reg = <0x500000 0x400000>,
+              <0x900000 0x400000>,
+              <0xd00000 0x400000>;
+        reg-names = "west", "south", "east";
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 114>;
+
+        sdc2_on_state: sdc2-on-state {
+            clk-pins {
+                pins = "sdc2_clk";
+                bias-disable;
+                drive-strength = <16>;
+            };
+
+            cmd-pins {
+                pins = "sdc2_cmd";
+                bias-pull-up;
+                drive-strength = <10>;
+            };
+
+            data-pins {
+                pins = "sdc2_data";
+                bias-pull-up;
+                drive-strength = <10>;
+            };
+
+            sd-cd-pins {
+                pins = "gpio88";
+                function = "gpio";
+                bias-pull-up;
+                drive-strength = <2>;
+            };
         };
+    };
-- 
2.34.1

