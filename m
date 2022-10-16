Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD3986001D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbiJPRD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiJPRD2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:03:28 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EC743314
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:28 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id 8so5448021qka.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZcOmZ2L/AY2ngXzMGSS8fxC9MeWWKAVxvGQK0RtVF0=;
        b=bPOrG2MdPWHoZorZJGOKrvXKfrxcyNhZRom7TzDXpQRtFAfsL+zwsdypP5LJdlyUpT
         G4BYPaT1GGxn5S+AxwacbTundQVufWUfs5fM85Y3G9Z6UXNTDIzz8yp0DY2pUuUienfN
         9+xq5k+u8JPfx1HowHlV5p1YIFKdYdj9h/hWKak6x0IuX0XCk4ivxinpZS7LmIFYZ1ZD
         133BK+i2oCriUo8EGonNpgvuBjalmkuh3EXIOy89EICERonRdLi82kVNdkSkTeG+paMN
         ea77fFGOMdAsZ2LQIdKLKDUO5yVrs1ftRoNcXCZ8b5QMbfqJmtqCct5TLoot/Cyq6hh4
         LnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZcOmZ2L/AY2ngXzMGSS8fxC9MeWWKAVxvGQK0RtVF0=;
        b=3fy0mAUaTIgWCJ40yhiyywpluH4QkHQg4k5iGmvXLTMgspacYUlJd4XmPBTafTlGJ7
         vOmM3Y+BV3EWASRLAh4ojiPBhn3vXwLndWuFr+HRhylPRdloX0fv2W2qyQsgTZ+e+6i8
         6Dq0gYmmnnuD5jVQ/UFAHbusxzAl9sdC7vjSsdqHo8u1kMZWbT4HK/UHLttf9BvEAkMr
         /ntpjudYaZeweUZedHOTZtm0FxCf5VO+PlR8nnWccUZDuR62+fnaXl3o4iXO1Fm3vPVo
         Ol4J5I9cjJYcbf6dCEC9/z29qQOy+4hINZV6Mw+I4IV3dblxwCI8+Nqqzl4Q0jfSzCgf
         vWKQ==
X-Gm-Message-State: ACrzQf0qqNw0oWiKw5LF0PnTdX+tK9mrYsxk9CG0wZXqQao2s8/uwPFm
        lZ+6spU7JjTW18fIfh5Uh/dowA==
X-Google-Smtp-Source: AMsMyM7TG1x9pdw1lS1x4xzvnZFWIU46udNweVWcRxSJWucJL5w5MqTCkqgNB0FkfPYOhSg8HNHdeA==
X-Received: by 2002:a05:620a:4107:b0:6ee:ce95:1d15 with SMTP id j7-20020a05620a410700b006eece951d15mr5105653qko.266.1665939747790;
        Sun, 16 Oct 2022 10:02:27 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:27 -0700 (PDT)
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
Subject: [PATCH v5 25/34] dt-bindings: pinctrl: qcom,mdm9607: fix indentation in example
Date:   Sun, 16 Oct 2022 13:00:26 -0400
Message-Id: <20221016170035.35014-26-krzysztof.kozlowski@linaro.org>
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
 .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index 57a4fed55de7..a37b358715a3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -120,14 +120,14 @@ patternProperties:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-          compatible = "qcom,mdm9607-tlmm";
-          reg = <0x01000000 0x300000>;
-          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-          gpio-controller;
-          gpio-ranges = <&msmgpio 0 0 80>;
-          #gpio-cells = <2>;
-          interrupt-controller;
-          #interrupt-cells = <2>;
-        };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,mdm9607-tlmm";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        gpio-ranges = <&msmgpio 0 0 80>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.34.1

