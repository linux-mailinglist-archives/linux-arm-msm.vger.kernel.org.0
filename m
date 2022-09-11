Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F246E5B4DB4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiIKLMO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiIKLMM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:12:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EC932B99
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:09 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a8so10314315lff.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WuNuBKTLriSBOY3KzJZlVDULqq0LYp0F6kHtXN1EUic=;
        b=JRVUwSOVnd3I2XhJVPfw5ZXXfOBdv1fHnkR2UdcVEgvbqgjvgVcyoxPjDFx9sUD4PT
         8eSCCWyBGTDgQK53BeTrbwokhrk5dJmAkiwuZ73toHD62VHTeteJi/LhdrhtY50uYvBU
         ol74O8Lxw6Rh+bvp7JOfFnJcQfqVD6GXOrMToa0DJk/WwzGbFE8T7+EumKyKJhSMdLgm
         JJp2Nc6xiEfRNxwCNvQZiD+ek+YTBvNC7tO/G76NKsOUnuUqAQNq/F2dXO7OTWGlizdo
         b/QNvsnFpmJPRJqvB9wWYwsF9D6RNWhKuvwXsrtgXtKfhKaMl+RJgxzjJyECCJKvTd5G
         Y6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WuNuBKTLriSBOY3KzJZlVDULqq0LYp0F6kHtXN1EUic=;
        b=rR2dquBAGoG5dHqrWheHGiOHJrnQiZLbaiOqkg06nVblU41PmFbZe2SUfuhUlLQiM1
         5nn1kfu3eJODzeKLHZ/1jIL8Nt7qB52OUDIqEgG4lFiKT1FgBeXer/mN2xux7+3aEbwq
         yInxtp3l3cbWh++D3frljtDiruRH7CoCoDv1E03sOt/ft9yTwTnhl8U6SGTER/kj/C9F
         3cUu2ITjCFFYglYgGPxCOO+4JOZMiLpxv7Rhw/XlLAmKeL1V4Ujn1XUpHcClTLyLzarO
         Ew0t2jm2RtSUO4HGYM/WVuHjtLs3pJTxs8pgRcXlSPkehWnniux7YmQywCp7x6THWjEr
         YG3w==
X-Gm-Message-State: ACgBeo3Ps0k9ncMYE9zx90bxNKvPs5v1ti0UazxwIgPG1plKPEyhX8JV
        cAx9zoQFUMpLsO3ZKP8iLxhzRA==
X-Google-Smtp-Source: AA6agR6n3KRWcd5ghmh4ehITymhk7BjNz8BbyRpDkNRt2KauvnkCpwjY1w0Vmw+d/+xowTwzmTzzPg==
X-Received: by 2002:a05:6512:2302:b0:492:ce48:1bab with SMTP id o2-20020a056512230200b00492ce481babmr6680085lfu.266.1662894728127;
        Sun, 11 Sep 2022 04:12:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/40] dt-bindings: pinctrl: qcom,sm6115-pinctrl: fix indentation in example
Date:   Sun, 11 Sep 2022 13:11:23 +0200
Message-Id: <20220911111200.199182-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

