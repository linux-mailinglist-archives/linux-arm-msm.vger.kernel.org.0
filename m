Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A54D52FDA0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244960AbiEUPOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244849AbiEUPOq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:14:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3D5554AB
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:44 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u23so18814281lfc.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VVarr+wlKczHhvGEneB7r7hNaYtZ6ivj5K80jWk2asc=;
        b=M5JifwsdzwyPZNDYQXt7O1u2MS26aMbhQtbIfnz0TQygy4PIsAulCxiUiievMny7iw
         3A8tw6jmyzHUmU1cFavoVKCnALBvgir5J8bAoIg9no3+Ls0N/AN1KsoBLFh6DIoN62mU
         fZeoXve/OmK7n6RrXNTxuV6xdMdHkQRrBGoKX2BaVoZvKV/fboSAA63Ka+ZswOR4hm0y
         Nvhc5gSX7W/nFdPNuVLWocUtaxPCXEzozdpie3SQrtgdLnZpgTaaf6dNnc4H2BbWS57s
         JUE4up2E0mi0uAp2KCO8kc1+4hIIZ4NdJlOlZYKchW6w5IHl2/SjKcScRnpYQ5EYX0FE
         Hb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VVarr+wlKczHhvGEneB7r7hNaYtZ6ivj5K80jWk2asc=;
        b=iibKlaWOKxhFh7Y9jUMm8a2VBjbspHWI0yd9HHgftuz1IGJpn20FLrkF4Tk3KWQ2YO
         0ENWvcKxmDHoqlamJBpr3kLlejQeo74I5fMUmuoWmA2aF3UMplocG91/DkrlTjiE7jDq
         YYdrsa54lyKyqQ2VplN7b5T1qrIhYGgKRnaItGm5UHjleitsbbrZUSTt4o7ukglf1QKl
         SbPPBI0wXjs6bZQ/xDsZnS+aBVQNgNhDSZ9ILsyOEGYiz/1XveCh5o5Oi5wfEEBrNNmF
         QoqyjrUtv51ZlvTna1HpmLPTLiNFAQNjAT5w/gH+iZZS2a+9CnC5ZclEGGdf4uPJYUc4
         DzAg==
X-Gm-Message-State: AOAM531Ircfmpvx4yAuCze6nckNSW1vNdM2NbYa+r9HcA0J8+LwLKwki
        ZBS3yTxXr6u1iiLrQ8mdGgyQ1Q==
X-Google-Smtp-Source: ABdhPJyKjpnNSczdV//dV5+10vvmiTK5sRfHgh4MMuiNVNHGy0sYHByFthv2ZcYEQaFThVg6fhh9lg==
X-Received: by 2002:a05:6512:1045:b0:473:bded:116c with SMTP id c5-20020a056512104500b00473bded116cmr10368348lfb.390.1653146083375;
        Sat, 21 May 2022 08:14:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e7a16000000b0024f3d1daedfsm716849ljc.103.2022.05.21.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:14:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 2/4] dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node
Date:   Sat, 21 May 2022 18:14:35 +0300
Message-Id: <20220521151437.1489111-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split tsens properties to the child node of the gcc. This follows the
lead of ipq8064 (which also uses a separate node for tsens) and makes
device tree closer to other platforms, where tsens is a completely
separate device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-apq8064.yaml      | 40 ++++++++++++++-----
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index bd7b04c75e50..3cf404c9325a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -23,13 +23,25 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,gcc-apq8064
-      - qcom,gcc-msm8960
+    oneOf:
+      - items:
+          - enum:
+              - qcom,gcc-apq8064
+              - qcom,gcc-msm8960
+          - const: syscon
+      - enum:
+          - qcom,gcc-apq8064
+          - qcom,gcc-msm8960
+        deprecated: true
+
+  thermal-sensor:
+    description: child tsens device
+    $ref: /schemas/thermal/qcom-tsens.yaml#
 
   nvmem-cells:
     minItems: 1
     maxItems: 2
+    deprecated: true
     description:
       Qualcomm TSENS (thermal sensor device) on some devices can
       be part of GCC and hence the TSENS properties can also be part
@@ -39,31 +51,39 @@ properties:
 
   nvmem-cell-names:
     minItems: 1
+    deprecated: true
     items:
       - const: calib
       - const: calib_backup
 
   '#thermal-sensor-cells':
     const: 1
+    deprecated: true
 
 required:
   - compatible
-  - nvmem-cells
-  - nvmem-cell-names
-  - '#thermal-sensor-cells'
 
 unevaluatedProperties: false
 
 examples:
   - |
     clock-controller@900000 {
-      compatible = "qcom,gcc-apq8064";
+      compatible = "qcom,gcc-apq8064", "syscon";
       reg = <0x00900000 0x4000>;
-      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-      nvmem-cell-names = "calib", "calib_backup";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-      #thermal-sensor-cells = <1>;
+
+      thermal-sensor {
+        compatible = "qcom,msm8960-tsens";
+
+        nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+        nvmem-cell-names = "calib", "calib_backup";
+        interrupts = <0 178 4>;
+        interrupt-names = "uplow";
+
+        #qcom,sensors = <11>;
+        #thermal-sensor-cells = <1>;
+      };
     };
 ...
-- 
2.35.1

