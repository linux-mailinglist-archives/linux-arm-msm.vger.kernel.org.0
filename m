Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06785B5421
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbiILGTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbiILGTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:19:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E576B28E3A
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id o2so10987005lfc.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qxAFFeV9Jghea1krVGY5BQK+UR1GkKeREC8WB6H5B2c=;
        b=gTdROqGrrSl+2/wJzwvxlczeW+rqBSo9O5tBZh5AMCfufYpHRu1eptMa2gvOexkH8G
         HUqG4NBpOoNAEYe+GXhJp035hZEjfPiFHZBKJlHDvqoAuxTtk5M+4K1JUUtQjoGlmaTb
         VHUfRvTnlzyw/n+Mmev6p/pPh0VGS5XDn9xDY1nDzk0gRpZebTGG9Q1Fpm3Z/cbsXNZV
         YQ8GEMs+OE5ccWatvCHnJefz6e06Gia1ZHzhzQQUsJtVsgF0aKjPKRpoxhnRlZU3bho9
         V8hvIHpY1Bi8MItUeuzWhbfFdd5R6LFF4C5fX0Nb0ytbWreOhkrnovbBchnwFGwkhGUF
         QWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qxAFFeV9Jghea1krVGY5BQK+UR1GkKeREC8WB6H5B2c=;
        b=ptH2u17tYu7oHlZPIMI+6Yz1yhPusZ8DSUAkOzZtaaNAPS1AyX/YGW2fN7940HB1Qa
         9g9OOLB6hwBDbgbXAJEFIdD6wOMC4ohz1PD23D4kkUnmPGGFIO43Qe83C9hcaowWGpyt
         OeIELGNC2wcdjDDB47oDURNF8Cid7qDe/xnCrZZvR4/3zAV9QKwKy1nKAW10zEplE75I
         cCeCdAqIZFs/zRtJEUxt9KfPh6SlhclAfHTWzeAHMXs3IoMkfd4jc4wAq3ApVIMvE4aJ
         CK3hxd6sKuH7JpaEr5bj8iuKhfKkwVmjmjS8WluJtcPhJaf+TMVPULTPeLiTGl2xrAJg
         du4w==
X-Gm-Message-State: ACgBeo15Nn/ySAeJDrfQG5xD3kYw08acmClN+Yl8SS5Z3Y4pYSAKqGmC
        BBQLW2dfLa21XRFj0pFE4DVZfg==
X-Google-Smtp-Source: AA6agR4yo2Oq6q/w+fQcJQJ371CJ+xnE/8UWXETJpk5WRuihsK1HiT2e9lawhz8pPDGJ/Xi8mdW6LA==
X-Received: by 2002:a05:6512:6cc:b0:48d:acaa:8a66 with SMTP id u12-20020a05651206cc00b0048dacaa8a66mr9041345lff.272.1662963492830;
        Sun, 11 Sep 2022 23:18:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:12 -0700 (PDT)
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
Subject: [PATCH v2 15/40] dt-bindings: pinctrl: qcom,sm8250-pinctrl: fix indentation in example
Date:   Mon, 12 Sep 2022 08:17:21 +0200
Message-Id: <20220912061746.6311-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index bccc83f22aae..c44d02d28bc9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -141,18 +141,18 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        pinctrl@1f00000 {
-                compatible = "qcom,sm8250-pinctrl";
-                reg = <0x0f100000 0x300000>,
-                      <0x0f500000 0x300000>,
-                      <0x0f900000 0x300000>;
-                reg-names = "west", "south", "north";
-                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 180>;
-                wakeup-parent = <&pdc>;
-        };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@1f00000 {
+            compatible = "qcom,sm8250-pinctrl";
+            reg = <0x0f100000 0x300000>,
+                  <0x0f500000 0x300000>,
+                  <0x0f900000 0x300000>;
+            reg-names = "west", "south", "north";
+            interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-ranges = <&tlmm 0 0 180>;
+            wakeup-parent = <&pdc>;
+    };
-- 
2.34.1

