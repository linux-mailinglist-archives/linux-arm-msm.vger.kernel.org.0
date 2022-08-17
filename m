Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 755A359722A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 17:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240464AbiHQPBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 11:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240491AbiHQO7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED829C2D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d14so19308441lfl.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ylRikkO/bjiVr6cfpMQukwsajH9gmB7MCgQxpA3FZjg=;
        b=hXZ0c44OpCsGxovQZvqFrg6ZtkwO/t14H0ceAUtHqDHCqa8KJW2DuUN+ymtRMFnCSF
         DrMmUqVb4J35TvO+V0/pm/EBJADrXBNyYrgiL+v+1BxDvmQOQ3Oybbyt8+WF28ow+98C
         Uf6sTm62sTlS+YhFzUxmSSy3SDw/YxG44I9kR5drEBkpfmU5cwSF7O44q88OkiXuPtK3
         03pHrBbajebhA7eGM4O/jHMsCmXTp1tz/dDDyv//NOdKZH/Agn+MgIlKQJ2z/anlIuum
         8eG8a//VRxrWUM7udWAI51Gpfz0JImj2oMZ+MhjOE1sLNt4PCE615tefqX0RZhxPBJh8
         DETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ylRikkO/bjiVr6cfpMQukwsajH9gmB7MCgQxpA3FZjg=;
        b=mTuLNKPTocjsPGLwd9PkX2kbeKJHNDcHmLxHvjafdlvAvA3hQjvDZ5rBUjsCohM8Yl
         8ckNDxI/hQA6YZY0ZCmHhP2fgYjQ51DGBsJ3IA41PMPklLzFmia8zAF1iKaT+/1upB4+
         JSR8+3Qub+Wo2y5eRhxmRoLoXDy+i/Fg9uiWgDXFQ4DPGU9kZwYPJGCW9LTKDjrGTAkt
         QajEXmdwXSiRGcfmQeMLBjxBZ57G8RxKXIUylrbvUDUvXTOWd8GxNSOo+ihVdT3r8kMt
         NzQ/MlogX63okWo6gEYOITn7mtG6DZIrQPfCqf0lx/WtcN6lTTwf2cad45FY8iL9E0rd
         w1Vw==
X-Gm-Message-State: ACgBeo0AyF1iR/xUFHF8yyRrNdF154UruIS1G+UJPw6PqiQwvNYpSIOb
        V26dP5eOKyGswb3oVAvqX4FDyw==
X-Google-Smtp-Source: AA6agR4/Eymr0jqqYU2V2c9aS8hPcF8kSYC/oTFZTs6JgCeJlO5CFkyAC4ShXv8ozeVNTbqzWz+zAA==
X-Received: by 2002:a05:6512:3f92:b0:48c:ffd4:a05c with SMTP id x18-20020a0565123f9200b0048cffd4a05cmr8497777lfa.284.1660748351207;
        Wed, 17 Aug 2022 07:59:11 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 03/17] dt-bindings: hwlock: qcom-hwspinlock: add support for MMIO on older SoCs
Date:   Wed, 17 Aug 2022 17:58:47 +0300
Message-Id: <20220817145901.865977-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Older Qualcomm SoCs have TCSR mutex registers with 0x80 stride, instead
of 0x1000.  Add dedicated compatibles for such case.  Unfortunately the
binding started using a generic "qcom,tcsr-mutex" compatible without
specifying the SoC part, thus it looks now quite inconsistent.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If anyone ever says "I want a generic compatible because I am sure all
devices are compatible", that's one more argument they are wrong. :)
---
 .../bindings/hwlock/qcom-hwspinlock.yaml          | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 1c7149f7d171..de98b961fb38 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -15,9 +15,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sfpb-mutex
-      - qcom,tcsr-mutex
+    oneOf:
+      - enum:
+          - qcom,sfpb-mutex
+          - qcom,tcsr-mutex
+      - items:
+          - enum:
+              - qcom,apq8084-tcsr-mutex
+              - qcom,ipq6018-tcsr-mutex
+              - qcom,msm8226-tcsr-mutex
+              - qcom,msm8974-tcsr-mutex
+              - qcom,msm8994-tcsr-mutex
+          - const: qcom,tcsr-mutex
 
   reg:
     maxItems: 1
-- 
2.34.1

