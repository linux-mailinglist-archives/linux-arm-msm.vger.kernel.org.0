Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDF8671E64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjARNwH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjARNvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:51:42 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0F533446
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:23:01 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id mg12so10858404ejc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd5f8hzZm5qMEoqR4g+4cAWjwGfAnZ3T8KmzKwoOA5o=;
        b=WsBANPIb/MSdauDOF3I1Cwh7/TeK7qJ7AeqGW3ZSNUpH8GfOH/c3JFn2WMxTRj2Z3T
         BK0Nh81P6QcLQFzaW9A5aAnV53te9rmMSyqgNs1Kd5sU2un5YEbBWO59Zsu8bi/aE3EF
         KpSJk3qJ3+kpfCsj4Xf8DvGW+t0vkNIazvkqspeW5oa081KI4JdvUPLQDP0fptUibCNV
         Ul/9yQRGToJfmrERGayAr0sMZJ5kbZ5t2IcA6naE03IUoED9r6g5iBttjsTI4WCtiQk+
         B03lzUsWoPhWoqevcJZ4t/XyYIXnnVRyexuwPraWyDjI0q+QtoFLZCWNkHUEzyEGcVb+
         L5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd5f8hzZm5qMEoqR4g+4cAWjwGfAnZ3T8KmzKwoOA5o=;
        b=DTfxB9UaIZ7TJDl41KQvOGHvzZasf1WE3VkeqH+wkSFPcbg0X6ZSQum14a0yELs5Ne
         sbDPYDEUKL8k4zkalyVD60EqlHQWjvu0T2pu5BlEobtNrGXst9J79ReX1c8MABNWVYRF
         5edBWPHusTxJ1JQ4xYprqFuCcVMEChUnY8A+i0+mT5DPuKBxtrHhUHrqDWCIL3nZ1Ssx
         iZFoi+95H3LCMk77Pz3BOqt5p7iqrRl+pP50NnFg1oY3c+N0HgQnQQVu7xhAlBLt1S7y
         s+Rb5ECf7JzbiwrK0OXNrbJfmui8PtLrRizRIMRYyZpDNtF50xIus7anYxv+Oa8eq8BZ
         yTDA==
X-Gm-Message-State: AFqh2koiLvWoEacBTJrV6Z0+kA/SVVW4aBMI8x00KAKvNldpzbC+lGci
        2EN0cBXxP4DiGW3s3YZ1h6YkAg==
X-Google-Smtp-Source: AMrXdXujj5F9K3yswBHwGPwac2uPaJDZZt4vRzzKOpqsN79uy1jIzXyd9Ml4Gc5huOXZpaqZkejJbw==
X-Received: by 2002:a17:906:5a5f:b0:86f:3c6b:f7c6 with SMTP id my31-20020a1709065a5f00b0086f3c6bf7c6mr7134674ejc.64.1674048179800;
        Wed, 18 Jan 2023 05:22:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14633831ejh.0.2023.01.18.05.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:22:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: mailbox: qcom: correct the list of platforms using clocks
Date:   Wed, 18 Jan 2023 15:22:50 +0200
Message-Id: <20230118132254.2356209-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
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

The schema incorrectly lists some of the platforms in the statement
requiring clocks/clock-names. Correct this by moving platforms not
requiring additional clocks to the separate clause.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ecc286ab49ef..5f7770036fed 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -72,15 +72,7 @@ allOf:
         compatible:
           enum:
             - qcom,msm8916-apcs-kpss-global
-            - qcom,msm8994-apcs-kpss-global
-            - qcom,msm8996-apcs-hmss-global
-            - qcom,msm8998-apcs-hmss-global
             - qcom,qcs404-apcs-apps-global
-            - qcom,sc7180-apss-shared
-            - qcom,sdm660-apcs-hmss-global
-            - qcom,sdm845-apss-shared
-            - qcom,sm6125-apcs-hmss-global
-            - qcom,sm8150-apss-shared
     then:
       properties:
         clocks:
@@ -124,6 +116,24 @@ allOf:
           items:
             - const: pll
             - const: xo
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,msm8994-apcs-kpss-global
+            - qcom,msm8996-apcs-hmss-global
+            - qcom,msm8998-apcs-hmss-global
+            - qcom,sc7180-apss-shared
+            - qcom,sdm660-apcs-hmss-global
+            - qcom,sdm845-apss-shared
+            - qcom,sm6125-apcs-hmss-global
+            - qcom,sm8150-apss-shared
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
   - if:
       properties:
         compatible:
-- 
2.39.0

