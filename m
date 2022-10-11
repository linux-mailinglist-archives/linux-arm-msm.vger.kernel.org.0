Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DC25FB970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiJKR2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiJKR1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:27:21 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCD958504
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:44 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id de14so9381302qvb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoKPLdIpY8TSLpZdcYtoGE+wwd6ojWybuYPiXVO8xDg=;
        b=z4l8VwDN6GVWUjS5UAU5ybnJjoyUx141Hpj5xNqaXtl+eUnsMrIGbLx5SGY5p2M09B
         yEEU7phd7dIInShBwMSArMQQ7YsF+xn8PuOuY+QXdLv4WB25JtuX64gyqN17T4srkV+0
         BaPUuH4jor50tCD4QxPpM/Hq/upDp+ujxMUiuWHBXLGQFZgOAISiJ1OyZhHtsoAS4wWn
         oKeZxATX4lZukv7uvTAvoNuxlWf0AeHcolnl7IZaHV/fefvCQ4mIl5w+WgxBDXOsshrC
         +dN9evKDA7wgADHj2b6R5/TNLWBtMS7QlGWeN622wSUGvNBfMfrEGPN9IXA9y1LJ3bGn
         y0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoKPLdIpY8TSLpZdcYtoGE+wwd6ojWybuYPiXVO8xDg=;
        b=nmKXhBU5vw2MDzM7RtYg8HllLTSnaWAciwdgf+mLJK3S7zjHnYjuGIkjpn63/to41a
         7gzNxIYsGOjZ1J5YiPHMNzUFDWOdRJLpYabtreShrBIwoCJkjN0dGQXhsenSaXkK8uNN
         IHTt+GF2U0AD9bVSDuWMAnZ02hjFYmjuN6wJeaMQu8iLDAZ3QufqGCwiTmvGMOR2cWvK
         J+c0S7yGOM9c3xRY4d4OvxlkTJLEHBKYA+Bqqcknz/nv3k5qj681mpVeWayfq7tKdsTM
         I1tyYdqxRcYBeRddZ0M9aTbbi6yTiyoBsbqrSWGdKDYMF2J+ykQ4CEwiAX0OdOz/HmsW
         yOqQ==
X-Gm-Message-State: ACrzQf3LvZxv7IFSceAr3ujT5HBBGd/TWygCJTHMnUU9pi9LJLJL0EJw
        53+wvhAeSaHa903C9x41GxVCiQ==
X-Google-Smtp-Source: AMsMyM7df1sxA1e4YvknVWDxLeK1jeAO/2yX3vqTDRyWOrDlxPzj16tlsHKu69fqjkdAn2czwDwRmw==
X-Received: by 2002:a05:6214:ca8:b0:4b1:85c1:4de6 with SMTP id s8-20020a0562140ca800b004b185c14de6mr20102519qvs.13.1665509203580;
        Tue, 11 Oct 2022 10:26:43 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 24/34] dt-bindings: pinctrl: qcom,sm6125-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:48 -0400
Message-Id: <20221011172358.69043-25-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), drop redundant minItems, use double quotes
consistently, drop redundant quotes and rename file to match compatible
(to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...125-pinctrl.yaml => qcom,sm6125-tlmm.yaml} | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sm6125-pinctrl.yaml => qcom,sm6125-tlmm.yaml} (93%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
index 50f721d5f843..e1dd54a160d5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
@@ -1,16 +1,15 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sm6125-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6125-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies, Inc. SM6125 TLMM block
 
 maintainers:
   - Martin Botka <martin.botka@somainline.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the SM6125 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM6125 SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -20,21 +19,20 @@ properties:
     const: qcom,sm6125-tlmm
 
   reg:
-    minItems: 3
     maxItems: 3
 
   reg-names:
     items:
-      - const: "west"
-      - const: "south"
-      - const: "east"
+      - const: west
+      - const: south
+      - const: east
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
   gpio-reserved-ranges: true
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -46,7 +44,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sm6125-tlmm-state"
       - patternProperties:
-- 
2.34.1

