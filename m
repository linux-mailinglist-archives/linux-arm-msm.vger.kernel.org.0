Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A905E6C52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 21:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbiIVT5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 15:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbiIVT5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 15:57:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F102E7E3B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:57:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s6so16456690lfo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bYzFDpsBX2kTeJEZsPEKL8j9cV/QL84TV4CpBdT6eXg=;
        b=rmXKiFtZirzjsxJjmylXBux+KqqiN36gtjB2CBsG+xmfUwv1bSnJjQwTxRzKgEcrLj
         5ZxARW1T/BkTeu86wsqrJsplaMYVKV/oXPNNGltUPuA7B/PdadvkQKpo4wHu/3cwpTSd
         Foobht00t016zEwKnJnR0UUyh+7t+O9Fr2FMmdRhCgX7HE/+efLiDhGKTd0qXNZ/FWZS
         JXEiwQiH1DUnpcGjb1MqlJvywVUC1+zKol8HTDV1VRe48ssa+djCfJmCN+1DFU1f+4zF
         4P1QGxSl3ItYgVCADnaIZo4IxbGVYg18PC8XUEW3vmATY3aDdVRNZWuYku4iCdl7mNEt
         4RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bYzFDpsBX2kTeJEZsPEKL8j9cV/QL84TV4CpBdT6eXg=;
        b=RfB64v5AsJZcvAQYYw7vqUlCJWRBFNZfOb23vl7mJwhxKQ9T5y0a5q1mejnDMQm+mO
         Vh3dApJvRjvp4i/Gu3H+dHUtuTtQ2cqrUfQvJWXxeOlbTwrzl1NfEkRrBj9SjucGLBDx
         6vYb8O6a6EtANvY2bI8Rbk41mSO411tmtrWtxuaSYYRCUE57KxrCG+bcvJ3p2ub9Gpf5
         qFladZblfDfYmXkUb+c1Z6Um4fQEpurx7eNebruV8k+x1WGHdMfxAYBswrxZkfF4HBst
         M+54f46o7aa2NxrdKqorcbhmSTC61a03HVAeHtHn+TBLjngfIJI6UQXBFlfd/8s7AqfM
         iVMw==
X-Gm-Message-State: ACrzQf0bf95+OArZHj2kMvzTwQ1lgIkNpKeNpJNty1sJ00AJ/LPzwfg9
        DO1qVDKNfgjBDXRCMJo2GLYKZw==
X-Google-Smtp-Source: AMsMyM5QobcXnMnPR2vghwmw5psuStIob8dfahNPEwyw92OcSVCeiJ02jK76bpj64Uti2P028ShFuA==
X-Received: by 2002:a05:6512:2303:b0:49b:ec39:c4ab with SMTP id o3-20020a056512230300b0049bec39c4abmr1877739lfu.512.1663876620291;
        Thu, 22 Sep 2022 12:57:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:56:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/12] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: fix matching pin config
Date:   Thu, 22 Sep 2022 21:56:42 +0200
Message-Id: <20220922195651.345369-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

The LPASS pin controller follows generic pin-controller bindings, so
just like TLMM, should have subnodes with '-state' and '-pins'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../qcom,sc7280-lpass-lpi-pinctrl.yaml        | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index 624e14f00790..1daeca62625d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -37,9 +37,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sc7280-lpass-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sc7280-lpass-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sc7280-lpass-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -116,4 +124,21 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+        dmic01-state {
+            dmic01-clk-pins {
+                pins = "gpio6";
+                function = "dmic1_clk";
+            };
+
+            dmic01-clk-sleep-pins {
+                pins = "gpio6";
+                function = "dmic1_clk";
+            };
+        };
+
+        tx-swr-data-sleep-state {
+            pins = "gpio1", "gpio2", "gpio14";
+            function = "swr_tx_data";
+        };
     };
-- 
2.34.1

