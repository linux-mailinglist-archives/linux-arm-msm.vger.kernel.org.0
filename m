Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2DC5B53FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiILGSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiILGSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:20 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50AA29CA9
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:08 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i26so13132119lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ozqjcsR32neOzHv2L/2DOKBG63rqHKYUg3f24PJLOOc=;
        b=HRXfYKOKYFo928QWTJ3XEeNmTLfXNxtR/ON4IvkVbjcN2wLb8jBCHmxgVK2bIH+8U4
         JLBAdj5mQHCnpyskwRIu/VmQAcGkVCJjQNYYxMO9kPn73S8X9Ieeav7pmBRHGOMvM7Bs
         COPnYkj5ggVLHo5DVdGM0fyxdRlD61E5cKhIxmtoQAJRAURxh8kHGpujtgiwZFmzsqNj
         u/PIRrv7ne0/H8f6rM+Az/m5beHkqfCi1/m5mrcNCP5idGwfj5GqS1DE9SHlDU74zPoz
         lNDwjZFnf1veGs4hNVh2azL7A7+pB9IBnxl2fyZo/tEoKWPDiXRNkzvoY9U33H0Fh26U
         ViFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ozqjcsR32neOzHv2L/2DOKBG63rqHKYUg3f24PJLOOc=;
        b=mtjPjWVV6uOlS5NeS1XKoZ4ByP7StXDjT5e5Y521XvoFqwE/lUGUvLHTRv8vXcAohI
         AJ5sQTDiLcJMUG5bWlqZiYVAXsDqjf7ULTcgX6VI3Vc9K2jZecGzycJ3uJBPLKb0Qwms
         t+CcXNLp89oTCQUXFO9plOsqDnLCQAcEMIIRnJcHqb2BxWpNdjaFO5WonqDKcMyI8uRQ
         bwSEowU+yDneWsIVF3xRyAJqX4//iK9Dmd2gB/psuTMW+vU2hT58j3f4gDtd/StsMGYW
         Ym+LzSiZ9p+rLc60kA3Y2wimOxRFd+7JXGXbDaJPtMWXG0zn7hjVdIvKilXnNGsMgeXr
         xa9w==
X-Gm-Message-State: ACgBeo05BEWgMkEG28QX/fZJ5GwOat+T120K08+jwVVkudZovsrxlWpp
        HYoUWPX0VmJKwjzbGzQrPs2FXin0YrCqkg==
X-Google-Smtp-Source: AA6agR5vkTc5bkDXc5Fm76W7X9SzYXQM9MwiJVKojNzC/A4IpZJDSLBmWCYARjlCcfu3cz7vOxslGA==
X-Received: by 2002:a05:6512:3f18:b0:492:ed03:1aa8 with SMTP id y24-20020a0565123f1800b00492ed031aa8mr9230762lfa.515.1662963488072;
        Sun, 11 Sep 2022 23:18:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 11/40] dt-bindings: pinctrl: qcom,sm6375-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:17 +0200
Message-Id: <20220912061746.6311-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required:

  sdc1-clk-pins: 'function' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Another question is whether 'function' should be disallowed for such
pins?
---
 .../bindings/pinctrl/qcom,sm6375-tlmm.yaml           | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 50f0ca5ab7e7..dbd91d6b63b3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -54,7 +54,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -120,7 +119,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-6])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

