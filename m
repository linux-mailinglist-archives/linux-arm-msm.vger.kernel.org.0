Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBB2601D07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbiJQXCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbiJQXBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:01:41 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFDD80483
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:26 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id x13so7655277qkg.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckAqRWeHF1bK7ElWb8y3OZX2IqijWRZJQ9nMTXZx2Fs=;
        b=SElRBsMIDrAlNqcmW4cadqzu3Cc1xvGYmPCwPdgFpAVoXp5kWj16OsFZ6sCYhb4OTO
         V7pq37ItGodVAgwmeZvEnqUxodNVsxyLoNyyXMQFVP+8+/pPlFjN51Z+UQqp4KdJYFKJ
         MgRTcBE+vXQyIxnATlJFGf5Pj0kZW6T0EeFRnRJyHrN2jWN5oLZQLGtAWBt+6sj4PkVZ
         KtEfj8ibc4zZUlhCf6yiiS/wvZl2i5BvYDAARyMdR+Uzoc4S+fk95rstcyZsRlgir7V/
         NDwfkt3d49flh15lsLZbLoXbdIdXPXypT5lR53ke6udUFnMB2ujlIyBDKciB0JZ89sDN
         sqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckAqRWeHF1bK7ElWb8y3OZX2IqijWRZJQ9nMTXZx2Fs=;
        b=Mwr3ZJLYJ+lGde1B6YHL6x5RBwOIP/VzVMp0uRlbEriSfmki5L8EhNk+0iflzTcrY2
         dJcdUa9hjUhR/9KUN87sEBcpX5eSSAESI2Dqr5GfgKZEN7B/sxhbhLMAsCVTCfqs5TsN
         1D5Iu2IE+uLHUak7Uobk0V+2+XSGerF7bVFLLsoAt4t9VHxuXol6+IYcwK+RzlsbWqWc
         rWPJtcAtPWQBNJ6T4F2R/0HJq3PruW70YMfgxgIAPVITxy5uIuWIcLEfgUq4KiUbRueF
         YPVY1ymeLv7FogCRfViKnkV4vYs9IAahIwj3fgXlkJFCyUotMB8rX8vipBo76i4PFUl2
         sByA==
X-Gm-Message-State: ACrzQf1DA+7JJpRfXCHmy8appqJ0pQAmB5gkYHO8mtDHtqWwCqNrxG3c
        mwDKXs5LbRix4kgcm03IU8dTyA==
X-Google-Smtp-Source: AMsMyM6Ta2BKaTj1ZsdFdvWUIX3Ma3rx0gCJ9FfzTYrhjHRPPv4IayEpE3wIOJqYvoBMVd8g08sqyg==
X-Received: by 2002:a05:620a:2293:b0:6ee:94a6:5cd4 with SMTP id o19-20020a05620a229300b006ee94a65cd4mr9042142qkh.537.1666047666476;
        Mon, 17 Oct 2022 16:01:06 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:05 -0700 (PDT)
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
Subject: [PATCH v3 16/33] dt-bindings: pinctrl: qcom,mdm9607-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 18:59:55 -0400
Message-Id: <20221017230012.47878-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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
quotes and rename file to match compatible (to match coding
convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Stephan Gerhold <stephan@gerhold.net>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...9607-pinctrl.yaml => qcom,mdm9607-tlmm.yaml} | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,mdm9607-pinctrl.yaml => qcom,mdm9607-tlmm.yaml} (93%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml
index 5a9002a83423..a0a12171b6d0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,mdm9607-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,mdm9607-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. MDM9607 TLMM block
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. MDM9607 TLMM block
 maintainers:
   - Konrad Dybcio <konrad.dybcio@somainline.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  MDM9607 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm MDM9607 SoC.
 
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
 
@@ -39,20 +38,20 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-mdm9607-tlmm-state"
       - patternProperties:
           ".*":
             $ref: "#/$defs/qcom-mdm9607-tlmm-state"
 
-'$defs':
+$defs:
   qcom-mdm9607-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
-- 
2.34.1

