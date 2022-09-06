Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E825AE7D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 14:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240087AbiIFMV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 08:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239784AbiIFMTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 08:19:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2388719B2
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 05:17:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w8so17022604lft.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2dRasoeQYKD9lUuxkX3Pwyaj6+42wbyoBHrZ4mafH0E=;
        b=ugvZDhjwi+o/CKjP/IouRer9hsKQE/IShwDJWX2GVCE0PsTYTc8kggr3pxLqnmLddt
         6lm897j+lI3p2SvZIESDsd7EVSlDuQaFn+mSAy5zMux387PBcHci3kEobDhY7RkLEjJ1
         zJTC2yoRRCGzJMxTwoRztiMfSYDv6Kdd22WUOFGBkqH0/FcRf1cBg/e/Lw5Jcw/w7m1B
         UBJ+VSCJnNVnm6dQVEdzzu3GquO0DRL002Mj+0EO6MNNGFBSzB+tF5pkV0eAVPTOavvN
         YrIZxDgFHe88J0d7DNGy981BzjJE6dd68PguQT/6koo30iWg8sI0AtwbGyBDeveJpKMZ
         aW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2dRasoeQYKD9lUuxkX3Pwyaj6+42wbyoBHrZ4mafH0E=;
        b=xv6QNNT7yHXfbAEm184xVl10Ig8C+4uk7vsclt4xvF0S0CrheDZ/Foum8Sac7Tl38f
         963nUiUfW1ERE3kwkwSvVuhjpPSM/dleU4VH9VzkEIXqXiOqIpVKenH2mIHWVMTMbBd2
         fcVAcNre4+3XUYAsBzaI0MuDlBzPGwsSF591+8vpl0V89P6uSqWCVbxsZdJmCpShG5BN
         YbX8m2sVIhvcCUQ+CYK0D651pNBeziGbDi5+Y7FWsEqPeVyVcJJS0zVv++oVnOibpBBW
         myYwQYWNe6O+rE1K/vtBr+ZF44Nl5eyhKXCnHsrxqveCjZypnXPndQNpAIpuyz3Csgde
         f/UQ==
X-Gm-Message-State: ACgBeo3NvRf62vnGTS2PRZvQtqZV3ZHDrYwIaosHK2Dpt87RYs2uauuf
        pL5fS9coF1EBXZam1+knT1QgVQ==
X-Google-Smtp-Source: AA6agR5uRpN2fHqICsz6h6L0l+NvT3OMWQHWviqg02DAMxCixLCtyjK14itmG3vaM0ZZDnwo4510og==
X-Received: by 2002:ac2:5d6e:0:b0:494:8b61:f778 with SMTP id h14-20020ac25d6e000000b004948b61f778mr9182527lft.568.1662466634204;
        Tue, 06 Sep 2022 05:17:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:17:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/12] dt-bindings: soc: qcom: apr: add missing properties
Date:   Tue,  6 Sep 2022 14:16:55 +0200
Message-Id: <20220906121655.303693-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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

The APR bindings were not describing all properties already used in DTS:
1. Add qcom,glink-channels, qcom,smd-channels and qcom,intents (widely
   used).
2. Add power-domains for MSM8996.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 61b010793fca..9d8ab28b7ea6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -20,6 +20,9 @@ properties:
       - qcom,apr-v2
       - qcom,gpr
 
+  power-domains:
+    maxItems: 1
+
   qcom,apr-domain:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 3, 4, 5, 6, 7]
@@ -52,6 +55,26 @@ properties:
         2 = Audio DSP Domain
         3 = Application Processor Domain
 
+  qcom,glink-channels:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Channel name used for the communication
+    items:
+      - const: apr_audio_svc
+
+  qcom,intents:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      List of (size, amount) pairs describing what intents should be
+      preallocated for this virtual channel. This can be used to tweak the
+      default intents available for the channel to meet expectations of the
+      remote.
+
+  qcom,smd-channels:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Channel name used for the communication
+    items:
+      - const: apr_audio_svc
+
   '#address-cells':
     const: 1
 
@@ -141,6 +164,30 @@ required:
   - compatible
   - qcom,domain
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,gpr
+    then:
+      properties:
+        power-domains: false
+
+  - if:
+      required:
+        - qcom,glink-channels
+    then:
+      properties:
+        qcom,smd-channels: false
+
+  - if:
+      required:
+        - qcom,smd-channels
+    then:
+      properties:
+        qcom,glink-channels: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

