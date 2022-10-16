Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB3036001BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiJPRDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiJPRCY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:02:24 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2527737418
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:05 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id y10so6239656qvo.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHZJZjDRT8VSINr1zvl8ZAL+ANGH6ni5ppJFZWcAbNk=;
        b=um6Q4xkt9sqmhxBRUHcktcQFvnbl85FwQO/IasMbFzc2QCL7J7ssqzS1Lq5CiX15XO
         91/vK1eB/lYeGpbN70U/p/61bxzLgRIlcTAoum8eT6lFsnAOH+YXdpEV5nmzYYAajtUM
         oznUiChIuO6xcxxi2HjxvW+/BFDtkqTZ+IhZpavtqrPitrfp19XK1nFg6ACJqnp4gzmi
         qWDn4QoZcxGl18iNp/G7tlMuV70xY1saVL39x131Sa/DpT12LNcxmY/+/j+u0yhxuFAB
         zoLgbLPikHmkU8kIH0sNVEIR8E38etu8Mv5Oo36FzJxikevKTKKYjDiQVLtBBjSuKnRR
         Qtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHZJZjDRT8VSINr1zvl8ZAL+ANGH6ni5ppJFZWcAbNk=;
        b=D8Qph+2+B4JQynnVVBrgT9GSl48oimvLxBpX+z3fJ2K6rtXQUoSf6dzBygUZAHQ2ES
         l5x4GhUZitBh89kg4WzjCxTf4XWB6QdmCla5iHoUeVplcfrZpZQ9b8pi3f7JxiyQY5Yw
         bAduqWA4+lTsIcCqT/Ih91bY4FuayTERiqwRV5unxUi6+cfFmTEkUl8R4xe2CeILOKVi
         yd6hpAmKweiDXSnvFlDj3hd0CYusd9zOeqFOHoHAo0nmgMZqsgj5j7VEQE3t6SHKqlFq
         8gns/fAwDyFWs8rFghfPP/j8X5qW+KL8P5i03bw2zkqC8B3QqttIUL5R/+nQl6OfH8rE
         DuMw==
X-Gm-Message-State: ACrzQf2MfbnMo3DpUQd07W54YeHpoq8c5xyS5UybouSVkO0b4l7B62u1
        e+XEtXvVrqpVGZwaCUZdrsR7Jg==
X-Google-Smtp-Source: AMsMyM6ZhYybuSqckOijTYeXauKNgW9SE0V18nG07ranbo1pGd4fTO0HtN9bxIKTJvy5Pq4j0uwJ1A==
X-Received: by 2002:a0c:9a0d:0:b0:4b1:982e:96d4 with SMTP id p13-20020a0c9a0d000000b004b1982e96d4mr5590932qvd.114.1665939717911;
        Sun, 16 Oct 2022 10:01:57 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:57 -0700 (PDT)
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
Subject: [PATCH v5 13/34] dt-bindings: pinctrl: qcom,ipq6018: fix indentation in example
Date:   Sun, 16 Oct 2022 13:00:14 -0400
Message-Id: <20221016170035.35014-14-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,ipq6018-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 6c6b14d1efea..2b9638dbd31d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -111,21 +111,21 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-              compatible = "qcom,ipq6018-pinctrl";
-              reg = <0x01000000 0x300000>;
-              interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-              interrupt-controller;
-              #interrupt-cells = <2>;
-              gpio-controller;
-              #gpio-cells = <2>;
-              gpio-ranges = <&tlmm 0 0 80>;
-
-              serial3-state {
-                      pins = "gpio44", "gpio45";
-                      function = "blsp2_uart";
-                      drive-strength = <8>;
-                      bias-pull-down;
-              };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,ipq6018-pinctrl";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 80>;
+
+        serial3-state {
+            pins = "gpio44", "gpio45";
+            function = "blsp2_uart";
+            drive-strength = <8>;
+            bias-pull-down;
         };
+    };
-- 
2.34.1

