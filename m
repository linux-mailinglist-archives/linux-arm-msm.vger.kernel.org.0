Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01B85E9AE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbiIZHqn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234232AbiIZHp1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:45:27 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C1E1A04E
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:48 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a10so6516179ljq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3GXQWttPp3n7DIchb/S3VWu+926YkdVhtIHuqvLTY9w=;
        b=C9RsXftCYcAt4KYkaPBQVlGWkQm/fSMxf11gAaTIIefTNxc7tmVY7ey20EtxVDjJUu
         jEnRbKcMavnrRhIFgGtA3ePvS6Cn7gO0XiDu6myl9BLnwsCyRNw/LFRhl1+9SFDvREB8
         JzPItMdCM1Td45I/kWF3iKK17RGgjrMEXInbxw0F0/Mq0uhQaJ7YpRjuUQcAq1QKgM3M
         kklC1tjcs+XdIF79ZVPv41Rc9qJxai+TfwWG1ZNJzrJ29CSP4lvu7FEkIbHAgotl43Uy
         LyqathELTgQPpO8AX2w4XaXru0FLzwTMHEOrCr31Y2ePdFAhcfBuJF+iNHcl/78egW+W
         OyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3GXQWttPp3n7DIchb/S3VWu+926YkdVhtIHuqvLTY9w=;
        b=MZvtPop7UclcUlwVeKNPLL8RYLdtzAu/yWpS9nOx/qem6lEBHGS9Wuv2eCuMi0vTNb
         M8vbJ9ScTP80a7DM0SISV23VK6YRsPnuXSBCReWIQFFOiae7AMcBJeCRcfnvDaH4/YMg
         XKL6xcomWNoAzrg05p2tRCtUie1mUnLo3RJQBxqXcOQ3vUM+jn0Nuq1YLV7adt15sP64
         i2jKLzVxEsNEvWSsyfrQHpKuKRMqcm68dPaB30sig1a1fkIclJXlO/yVmXKvnyKyzCFO
         h+J0Efe2DAMnGTaYPaExmnudPt4B9U8BIyK5ZBJphR/gQAdYEx+XeyAdxEZPBxEgErOz
         Zriw==
X-Gm-Message-State: ACrzQf0+kBGW3WPZp1zKh1u55B+t5DkgdmI/kWLjQeD8n5k6+ygKYPEn
        ezq8whj03Td7cJtXcaYOx+ulwQ==
X-Google-Smtp-Source: AMsMyM6nQKJs9uypaFfzhOSIBfJ/YNzXip9xTDKPPXsztj+7Y/F9i7UeLfxPvPAPVIfl9nqvO0Mmow==
X-Received: by 2002:a05:651c:a05:b0:26c:5010:39ce with SMTP id k5-20020a05651c0a0500b0026c501039cemr6855594ljq.53.1664178286478;
        Mon, 26 Sep 2022 00:44:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:45 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 12/33] dt-bindings: pinctrl: qcom,ipq6018: fix indentation in example
Date:   Mon, 26 Sep 2022 09:43:54 +0200
Message-Id: <20220926074415.53100-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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
---
 .../pinctrl/qcom,ipq6018-pinctrl.yaml         | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 111eb5b60e8a..fc00158069b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -141,21 +141,21 @@ additionalProperties: false
 
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

