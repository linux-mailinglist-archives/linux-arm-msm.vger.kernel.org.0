Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D9D6001EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiJPRE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiJPRDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:03:51 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDB243E6A
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:34 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id a24so6508345qto.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oehwU97ABv70/uUNvHBwihFGC0abyOEOuiqZj3ZF8Gc=;
        b=wjZozghd2baNKJ1g3I065/vo7PHRk/obE5/8q66FOXMxkZdwVmmCXejkx+yC5qVApu
         2R8UE/Ip+uHMFOTZ7ZJGRA+XNYmROqRo1ctdXwHy10tzCG3fp5cNm7YMZs3pcl9nAAyA
         KrdLpPIflg2RsgodSz0yqVXIKjoS79ZevlPYPJoRWnqe3uyEIhpp7O8c0UX9URPXiM34
         dBfMdgPGa+yASL61yeG5TOfg3Dnv+iNdFoYzKM81qV2S8dsEoYT8efT6mwBojX9BpUlc
         CwzaL1nQmMKLtkAymE5kxJgIc06jXJooHs+UfFwk8nFymdGG6qw/27I+MeXeFgs2wN/u
         b6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oehwU97ABv70/uUNvHBwihFGC0abyOEOuiqZj3ZF8Gc=;
        b=6fXpikxs1obRcped/xxGu0PhxSszRqYxrXYpXAxAz+E+RBY3OjeNkuJJOohSBXFZbN
         W9MDREz5PK6df2tE5/9nUnDb7U4G7L2BVLrBm2hwLPPjy6vtckBcxAudpqJy7Lx4EfEg
         aKam2wwz6oxhDY/cIL82RJUBRa0sxnNGZkHm6MjvqjoH8/UEIzARS36hKfCsODuP6gzJ
         l/1IiTI1Lec9AsiwAtUNQ0h9KPFeam5U2UE4wblRHo1/n6KUmunPYcvfFKW7cXRslQ4n
         9t1exWOve7DhOmw4zk17kfeVpHUWmVp7XTSKSsKSI1NRaSCAXIdlYpnGTbVkGWsI7xHs
         xm/g==
X-Gm-Message-State: ACrzQf1ppiaScW1ZpxiociuzhegDR7TheTkDxJWKItjlIdBwtd8KxCnR
        SgKZieax/NlqA2PwkXRETMdEXw==
X-Google-Smtp-Source: AMsMyM6uqWpd+/OH48KaK3Fg/7TzIC34pQkuqA7dGEjUH02wa4zwOY+vT+GdfK8kIBRfUkweqZbB6Q==
X-Received: by 2002:ac8:5849:0:b0:39a:8e35:1bfa with SMTP id h9-20020ac85849000000b0039a8e351bfamr5698423qth.573.1665939743621;
        Sun, 16 Oct 2022 10:02:23 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 23/34] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
Date:   Sun, 16 Oct 2022 13:00:24 -0400
Message-Id: <20221016170035.35014-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index 03f1cc783659..cfe4664f6fb3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -128,21 +128,21 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-              compatible = "qcom,msm8953-pinctrl";
-              reg = <0x01000000 0x300000>;
-              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-              interrupt-controller;
-              #interrupt-cells = <2>;
-              gpio-controller;
-              #gpio-cells = <2>;
-              gpio-ranges = <&tlmm 0 0 142>;
-
-              serial_default: serial-state {
-                    pins = "gpio4", "gpio5";
-                    function = "blsp_uart2";
-                    drive-strength = <2>;
-                    bias-disable;
-              };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,msm8953-pinctrl";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 142>;
+
+        serial_default: serial-state {
+            pins = "gpio4", "gpio5";
+            function = "blsp_uart2";
+            drive-strength = <2>;
+            bias-disable;
         };
+    };
-- 
2.34.1

