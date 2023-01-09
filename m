Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDD1661BA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233542AbjAIAwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbjAIAwN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:52:13 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E1AE009
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:52:12 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bf43so10679404lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRjxdsWRXRn34n1kNd3FPBG4TITtRbeRKhKGOQYRjQU=;
        b=UaCsa7vlg6HwKDvx3bmcqbs8zn3bkRqX2r63HM+gXRUkiT/8gFw2K5dW3u+BV0FrOh
         Mcl2yKNfpzXGOKBRfCEZt/LvjrEg/419mFei8rp2oCg+Y7EIt/KCKLT4cIACNzMILK+X
         rFdRN5zgqX+hUNH7d49700V9zgrOSztZT1OTYreeUqxS4N0AK4o+EH3nwpPK3Lz2c5N5
         LbHBsTGsN0HddpYNYthoyxwQBtDNfk7A/iP91CXzJctMLTDh59TlQJLnxjHylO10n7pz
         jzPwdfmhZuwR2FmF/gYNlJS3MHBx6MfvlcebujnyjA+lZ6NtsDf2jZyC9l/G9JWV/stE
         CyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRjxdsWRXRn34n1kNd3FPBG4TITtRbeRKhKGOQYRjQU=;
        b=w5H//5r8gyu8djoE3dWxjA89lhHy9gtHbI9duMOtA+7EjT7a0/w/9t87sB+f6pfFm3
         ztMnjwHtAWaxh2hWWG0ziRyrDfd7J3FoD0lf4Sys8NaCetmZ3ECHnq744XiBRyFjYYp+
         uVS17pzz46/jUWaNB+ClCNWGZpfiYcgMtrbcYAo9yk2rAfjVAeiXNZ5BUmqFCtBEJq6e
         tN9Wu26I6R88R5vKTKMBD+pHXGZXlefqctcIKrqnyoe06k2IEy5/JnTlI+vGdH1yYKZU
         +bvxpq3OJ8yDHT403OClMgju5VcDTfXP1C2RLTnpxc0AM7vBCEPLG8RytjdQt1L7GQVi
         FGcw==
X-Gm-Message-State: AFqh2krZc8ar9BXMcxP10PDz/K7jfOZtU9lV37S1x3Ln3bXLLe5M0G3F
        jc5URap6p+chZcK18wLUVqgyZw==
X-Google-Smtp-Source: AMrXdXu/bAG52j5GhALN9SWJDIDfnXS+/cm5+RWjoJqRKAOXamu5iKup3KuWTF6nBppnX90onAGXWg==
X-Received: by 2002:a05:6512:24e:b0:4b5:82f1:7f3d with SMTP id b14-20020a056512024e00b004b582f17f3dmr27004555lfo.58.1673225531321;
        Sun, 08 Jan 2023 16:52:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b00494643db68fsm1317493lfc.81.2023.01.08.16.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:52:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: display/msm: add core clock to the mdss bindings
Date:   Mon,  9 Jan 2023 02:52:06 +0200
Message-Id: <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add (optional) core clock to the mdss bindings to let the MDSS driver
access harware registers before MDP driver probes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731..0647fc5a7d94 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -45,17 +45,11 @@ properties:
 
   clocks:
     minItems: 1
-    items:
-      - description: Display abh clock
-      - description: Display axi clock
-      - description: Display vsync clock
+    maxItems: 4
 
   clock-names:
     minItems: 1
-    items:
-      - const: iface
-      - const: bus
-      - const: vsync
+    maxItems: 4
 
   "#address-cells":
     const: 1
@@ -69,6 +63,30 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+oneOf:
+  - properties:
+      clocks:
+        minItems: 3
+        maxItems: 4
+
+      clock-names:
+        minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+  - properties:
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: iface
+          - const: core
+
 required:
   - compatible
   - reg
-- 
2.39.0

