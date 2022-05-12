Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4295249CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 12:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352501AbiELKAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 06:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352417AbiELKA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 06:00:27 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BB422EA77
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:25 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id t5so5546819edw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E5YORnDcbWOJgrpTz/qSCG6/YYMuC3Z8T9fT4bh9Wds=;
        b=tag+9P2t6thmYxjj7J1BOojXQX1tCri+O11NqGILYUOWqcJ6jw3hpWb5QYILy+FXSY
         nVdSdVSlhuTRTt/G0wrrozxzJJYIocRWYwpQ2yl3pMhtK5TED1puBrNRuH/6tI5yd093
         znrmOPCCYUkJ5S+QP4BKUibf0nHpXYo6Abif6Qu8Ut+slVG7r1CIJBW6c1SIhWMX4CsA
         WIk7F4HqLztUuuHN7zEk55VZZQXN49NeZUYwY83ti4PMfp55YgIOPxoFzEcRpJK5jUte
         WWjvXkp1lmDFlmppaHxmRRnKPPRqeslms0nimycPHaZylLR2EkJaESCw8YHQUeCG5uI2
         nmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E5YORnDcbWOJgrpTz/qSCG6/YYMuC3Z8T9fT4bh9Wds=;
        b=pBLzyEILnWn2/ItYXoVzuUCzaeFWYe7a88DTvhp/E56EE18PSC/bleAnjQFQVCTmmc
         2cJrnUuXKPU7dNDZRjUNht71NcZAB+Z+7wM1NHKtf+Jq2vJGtic0SkwfdK+K/qxdLcyn
         jftl7frbtPWp/gyGU7TqTcavQ+jqO6d//0FVO/0GSogb4BJ14mqf1nUObYKVIJcpoAjH
         qhNcQ3ZzDJaRlU1c06Y2iygLan4ahmfAZWe/rDcY9Oi6ma0XNJiDijCnSoWeWiXtAbxn
         Z08BXs5tcQIuK3QUQhejYz4dGHmvUQST7Q+zhGn3Y0evxhLqOTTpCmMg3GPhP4tY27ep
         PfFg==
X-Gm-Message-State: AOAM533li6svYbq8CDCiI26/r8QmO/AVRXRQOkI39IAA+IN+CWOeg31p
        2UHxInWP2qTmKS9qDfFK2yxjrQ==
X-Google-Smtp-Source: ABdhPJwazH+uuaXS24OcpT4IwHOvZL8EGifCrtq+KeCqc3EgGbj2G01XYvk7XHbqVVh8hkxFIwYzaQ==
X-Received: by 2002:aa7:c306:0:b0:428:414d:e216 with SMTP id l6-20020aa7c306000000b00428414de216mr33733082edq.394.1652349621242;
        Thu, 12 May 2022 03:00:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/12] dt-bindings: remoteproc: qcom,adsp: simplify interrupts
Date:   Thu, 12 May 2022 11:59:58 +0200
Message-Id: <20220512100006.99695-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
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

Interrupts between variants differ only with presence of last optional
interrupt, so the constraints can be simplified.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 46 ++++++++-----------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 6e1fdfe91043..0b2db36e5d14 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -72,11 +72,23 @@ properties:
 
   interrupts:
     minItems: 5
-    maxItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
     minItems: 5
-    maxItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   resets:
     minItems: 1
@@ -317,19 +329,9 @@ allOf:
     then:
       properties:
         interrupts:
-          items:
-            - description: Watchdog interrupt
-            - description: Fatal interrupt
-            - description: Ready interrupt
-            - description: Handover interrupt
-            - description: Stop acknowledge interrupt
+          maxItems: 5
         interrupt-names:
-          items:
-            - const: wdog
-            - const: fatal
-            - const: ready
-            - const: handover
-            - const: stop-ack
+          maxItems: 5
 
   - if:
       properties:
@@ -347,21 +349,9 @@ allOf:
     then:
       properties:
         interrupts:
-          items:
-            - description: Watchdog interrupt
-            - description: Fatal interrupt
-            - description: Ready interrupt
-            - description: Handover interrupt
-            - description: Stop acknowledge interrupt
-            - description: Shutdown acknowledge interrupt
+          minItems: 6
         interrupt-names:
-          items:
-            - const: wdog
-            - const: fatal
-            - const: ready
-            - const: handover
-            - const: stop-ack
-            - const: shutdown-ack
+          minItems: 6
 
   - if:
       properties:
-- 
2.32.0

