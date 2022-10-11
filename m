Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCC785FB999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiJKRaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbiJKR26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:28:58 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E5276960
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:14 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id d142so5434602iof.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4v3rWmyeef5JmOnVo6r9YlCtFJ8e9lc8kXdpJaYHmg=;
        b=Rks5ls100LiEVHlxgZs/VOWGATMo9YWTZ6bfnR4IO6Pcbfq8vOXA6xd8Aut366CAIc
         FYsoJ0cjRzQ833qp9CPlqZPgFoaXMcBB7l9nBmOqR5rbKpRt+QcF3HEvyxqJK0pNzYk1
         0SpID22WNPTldGMXM476yNAoStYs63k50WGwXoXMTV6X9LLwUttgdglFDL0dp8FjWhrj
         gKzyLQTKdgbhDy1ixlAJVOB2/EBqvmV/BvDCzCtmB+YV1iRrCVv8mKCCXifnqRPCQRBz
         XkNhnZVpopooG+WPef+157pagE8ZMaGngIIgOQBVVMkWIAH1CYWQW+P5BJOQZt/Pcf1A
         oVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4v3rWmyeef5JmOnVo6r9YlCtFJ8e9lc8kXdpJaYHmg=;
        b=Ajbnt2Z/4N0b7RR7wJxNkOIZ2JPNgqt3BZ6E+GXEuEO2b5u1LiTXFGLs30ZwB57AqQ
         ahzxiEbFNc2G9YiPzjuiXY37iamBfu8xUmrGcEKlL7zXSDC0seW0vXwdN8NLIHVcz2i/
         PflPtqkIzHHElBgA6Fl43FeXQu3DUOIzaD3erSXIDLxKKqz8utZqBA+lTsM7qfWY0Sh4
         vWDm0ajxy7zBCNgo2bL1Do+jPwGmzTxz8qPdMgMaLEcqBaADY3yL0obD9XA+/yHqZ8Wt
         fnoD5aZAmSaGMGzZdYKJR5/TBafpCuswyzCIRSzv3koQGkswGP2uqFUaSaQ81mWcmIKH
         rMQg==
X-Gm-Message-State: ACrzQf1VTgsnbLmw8bDnymtkp2m3ID/O1B6wfSPgDchP1G4tLjNyxiSg
        tzQuXB3j3ygZF0hk7NVryszcwEGDvrCeSg==
X-Google-Smtp-Source: AMsMyM52gSdSHCzWg1Z13hisz3eWIrXp6jfN30ERB482u08Oe4wsYrWTdnJEZvTkyEdTXgEN7jWAIg==
X-Received: by 2002:a05:620a:240d:b0:6ce:7f55:1191 with SMTP id d13-20020a05620a240d00b006ce7f551191mr16723265qkn.644.1665509200621;
        Tue, 11 Oct 2022 10:26:40 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:39 -0700 (PDT)
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
Subject: [PATCH v2 22/34] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:46 -0400
Message-Id: <20221011172358.69043-23-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...c8280xp-pinctrl.yaml => qcom,sc8280xp-tlmm.yaml} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sc8280xp-pinctrl.yaml => qcom,sc8280xp-tlmm.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
index 886d4e76af44..4efde29c36a2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SC8280XP TLMM block
@@ -10,8 +10,7 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
 description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SC8280XP platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm SC8280XP SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,10 +24,10 @@ properties:
 
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
 
@@ -39,7 +38,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
       - patternProperties:
@@ -47,7 +46,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sc8280xp-tlmm-state:
     type: object
     description:
-- 
2.34.1

