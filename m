Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0B855EC7FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbiI0PgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbiI0Pf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:35:29 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF415BC96
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a3so16258493lfk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zT8UiKfr/gDYKXXmUq9gzvaa31odxuTetUkxcN0CAdY=;
        b=DHkh3+rfWDLj9xqBqCSVgZPfFfVInHbZY1HtqHWIqtKRQuWdUn6Ug9Mf1Fc8eeXpRB
         LlzPs4GXNjgv7WT0p8n/rkx9XyGt1DKlQ9qAov9xmMiuHBZ/WfRy38lte9sowUvVYmMg
         4ezZ83YhJ1XRm8iXk1vyzo9T8hG8d1HdakHPEGqvmFQUTtV6qckvrZZdiluvODOibCiZ
         B97rW3uHF3avwXUYV7BZOaa79/LVpKBoCJtOGpz+vT6nyRL7pzWKyK+J7AnZgPNu/0WB
         E2LPTJwcd3+pEe82GdTCAUpG/0icXnxVCZPp5KP7Fwn71x3xv2NN+CbFf1p0T3GZvKQg
         ISVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zT8UiKfr/gDYKXXmUq9gzvaa31odxuTetUkxcN0CAdY=;
        b=JR7u1fHPlNU8KPUmLuGhwHuf/e8Ot1twSmndsKUxvReW3SnwttcHHGZojHfZS6L9ZC
         ZGNdV2gRcSUKNCixQ2E2d8pfSz5WBQf9s/4QCyFny4KhlA6BYQk1AfxNbgOdA3n8oKVp
         Jssi6RHGt3C3+RnC7H6kGzvH/rwcKStGqytqgNhwjr++5cAsfYNQsvyTlA9jSFUXx+xf
         sC+c6zvtsZEE6QHfsuEeTFkOwW5WxVQvQ4kDlum8ITc6aMaf9XNnlV9U+S6SqETHlAGK
         s8s5M9QuZ3ktchL2twiDOMDcQFge4Df+Vpxjnbwy0Nl23vsl4pVkwYFJLFwTc2tI1Wr9
         TlVw==
X-Gm-Message-State: ACrzQf3rmRo/7dus1X3hBd0rZn7s/LGhlj6F49KKQVzFtcWrxzlcySVP
        sximbUn1nJGcnEVHm7VHvGP/Cw==
X-Google-Smtp-Source: AMsMyM5ndeaosLA18SrxmnXKuCCidCU1ADTJ5RGu+mFznyfEjsJHDSqLoY8E6fIjbaRozpesqo4owg==
X-Received: by 2002:a05:6512:12d6:b0:49f:48d4:a1c4 with SMTP id p22-20020a05651212d600b0049f48d4a1c4mr11509856lfg.52.1664292905442;
        Tue, 27 Sep 2022 08:35:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:35:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 08/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix matching pin config
Date:   Tue, 27 Sep 2022 17:34:25 +0200
Message-Id: <20220927153429.55365-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
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

The LPASS pin controller follows generic pin-controller bindings, so
just like TLMM, should have subnodes with '-state' and '-pins'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../qcom,sc8280xp-lpass-lpi-pinctrl.yaml      | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
index fb3ad6c0d80e..edf38c774514 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
@@ -43,9 +43,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sc8280xp-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sc8280xp-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sc8280xp-lpass-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -130,4 +138,21 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&lpi_tlmm 0 0 18>;
+
+        dmic01-state {
+            dmic01-clk-pins {
+                pins = "gpio16";
+                function = "dmic1_clk";
+            };
+
+            dmic01-clk-sleep-pins {
+                pins = "gpio16";
+                function = "dmic1_clk";
+            };
+        };
+
+        tx-swr-data-sleep-state {
+            pins = "gpio0", "gpio1";
+            function = "swr_tx_data";
+        };
     };
-- 
2.34.1

