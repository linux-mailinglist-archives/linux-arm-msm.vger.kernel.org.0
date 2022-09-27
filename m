Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111845ECB38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbiI0Rkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbiI0Rjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:39:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8B91E76A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:45 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 10so16810365lfy.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V7CgKVZozN4gM1PrgaoGvydsZwQHsP11i4E2EPmWkyA=;
        b=dEOKL+wWe/Aw9sSzag+qu9MFnocb/XMY+eGIuCnILtn2BizL8+rUADH1Hw5KJacbOe
         DjpvpNuXr48hAqoScYbUVEbjlcxGZesPG0e6VjG57g+6G2RmGiE3ZbIgQZiJzkNQwugQ
         0TZA2vSN0EVITXBq/61kobUwmw07d57uCXJg3vz8Wcp2+VTvVQ7ZZdnIEBZJhQW51AeH
         ueU8Sa6Pam0Fks7WZrtmqYehaqcrteUQfmuAMgJWT5AhKC0Ya+Xxdnf37CRmj49NhvSz
         BxwiY8QW5Mo+97NE83U48HvfT4JBlwsqj+dX1WZDt8kTSYWR6YGkkN8EfjTL+3GmtEKU
         cEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V7CgKVZozN4gM1PrgaoGvydsZwQHsP11i4E2EPmWkyA=;
        b=LseNBXZnBSTBvZF9MXBYjfd0vK2gYYxvPxdATYUDFLNeH6aSg41QU9XiH2fVHHFayK
         atKGAvjpFRw62IUIlxTX2HN+J24JIAo8LrPoJQJDUDHSXVacRuN3wPbQUjfkOXIaTeVz
         39oRWBrkguRRnSlh4kkJNm4yaL/oBcEPQ9OvTy6LrTlFv/ZrSuC/MRQWbC4IrO4kFdq0
         vsCMJZXFjz5F4t+UfXdfi6s2uJm39fGBkUWcOPLEB1Xz+lqyXIwKPKhTUkBKyD5GOCEy
         Nz+O//1mJsEAs+YsvSG1YDqa04nkNCZXTgPYZN3imNP7mQRQ0OB8MOtS3tjfMru6MFTK
         bq9w==
X-Gm-Message-State: ACrzQf0rcfk9QSDYpTggV2q2rD3GN8xMdQkAyq7i4DYxwDJy6IlusejF
        o455Z7bTUWxJnChhvhg54SMM/cwRN7XFTQ==
X-Google-Smtp-Source: AMsMyM7DbsH+9dz6FoGCnZavDkqRUQQwL/q2LOVUFNKPd62F6Z71ux9keqWAt5VNcw87RzZ4mQDdmg==
X-Received: by 2002:a05:6512:1287:b0:49e:f94f:eb72 with SMTP id u7-20020a056512128700b0049ef94feb72mr12499012lfs.376.1664300325264;
        Tue, 27 Sep 2022 10:38:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:44 -0700 (PDT)
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
Subject: [PATCH v3 21/34] dt-bindings: pinctrl: qcom,msm8953: fix matching pin config
Date:   Tue, 27 Sep 2022 19:36:49 +0200
Message-Id: <20220927173702.5200-22-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8953-pinctrl.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index d4da558cde54..c162796ab604 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -44,9 +44,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8953-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8953-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8953-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -163,7 +171,7 @@ examples:
               #gpio-cells = <2>;
               gpio-ranges = <&tlmm 0 0 142>;
 
-              serial_default: serial-pins {
+              serial_default: serial-state {
                     pins = "gpio4", "gpio5";
                     function = "blsp_uart2";
                     drive-strength = <2>;
-- 
2.34.1

