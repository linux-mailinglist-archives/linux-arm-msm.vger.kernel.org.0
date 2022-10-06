Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948345F66C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiJFMtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbiJFMso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:48:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86552A486A
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu25so2556831lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LyA5ur/cjYl/rS8sbHU8B880cL6AnWpQA9/6F60GO2Q=;
        b=lNEyOtR8VwR2YBK9NC46199zcpjZKHb97/qXQaPn1BnzKRGZNmQeL4lJdQT1XgA3JK
         xWvZzuMz2Kq3Rm7Y3b8qE6duEOLmszKPy/IRDUYqWW5Gdu3i7hOMEVmnchcZD7mwrLQw
         w1SCCzt3YDSVivQSC1eNhE4fgA7YdAlGglCFRorUZoh718uVvvt3MTq5XjBR78y4mBJL
         ASBYcDMg9z3vnoWrZVOSmcxQTxy6ZfTuG1Z/prfkD/6hLdX+pzpJAqjqe75744ntYqBD
         BjIvMo1LPtDoabO0gz9XD1sPquJF7U5AEVcQhY3dzPBLG65XnVBYqeNxAQHV817YE2yV
         Ocdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LyA5ur/cjYl/rS8sbHU8B880cL6AnWpQA9/6F60GO2Q=;
        b=sXtSbU7Lj6TelIQP3Y+zU6QOfVZeX5TadJ5yybTDLxAYQDWqfu8dDwzmNinS3LmYjP
         nZvDdHu70/FriGlxizUQWirwl1knrj14qFuT0LzbZbT8VTvK6nCmJC63CA2rTTYPwr4+
         /r9pevifZTnhccB9FsF3OnukepF7MJCKSBd4XyP4za0SCNJ7EbSuivdxTCZbWjc9gFr/
         otQrJW4UMdMM40VQU2X4v0sToUfLQuonozh0LAVQTLeJWtWGjGqCws9O1O5EHo7J5W8n
         eUNWq5d1MXcFd/+1P69U6LkbwR/fJsaFA+JijFmsOiUKohbo4JM00BdToYg9ADz+BCIY
         +Arg==
X-Gm-Message-State: ACrzQf1HeDDRxASLqDn4SlCwuKiddr7IeVGEaEYwPGWToGpnLpQgqqfc
        CBSkj7/Z2S7YLT2zN4HyFjf7aw==
X-Google-Smtp-Source: AMsMyM6B61CafXduV6Z+VjbP+I4iwuAAJ52afC3DIhHi6VROIxDA3uejys8XMP97fnX9x7qdR5MKzg==
X-Received: by 2002:a05:6512:3c90:b0:4a2:5168:b410 with SMTP id h16-20020a0565123c9000b004a25168b410mr1867681lfv.163.1665060448310;
        Thu, 06 Oct 2022 05:47:28 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:27 -0700 (PDT)
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
Subject: [PATCH v4 23/34] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
Date:   Thu,  6 Oct 2022 14:46:48 +0200
Message-Id: <20221006124659.217540-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
index a0e3c61fffe4..19d16cc9d749 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -137,21 +137,21 @@ additionalProperties: false
 
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

