Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D7266D49F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 03:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbjAQCwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 21:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbjAQCwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 21:52:33 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA416303E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 18:48:52 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id k16so582219wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 18:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCZtLSeYxlaylMMqCjkYeGrkxr3IGAiBffdyUXZtj3g=;
        b=cRB0EMXo9umVjDVxUdWP9ZfoBeFzSpu+Gg2VOP9H6V0dX+XKKRh972Cwwuf4IUKX7B
         XD89Xhta2vj7Sq6BZ2qI1sk/A9P5tkcc3dYREjlqeDWWQQ6+euH02VbkcvBXFztzxx8C
         OKkEMxZyMXMhJtSY8T5yLDIbpJb2IuyZ22WxsTpku6/i+YmyeUfd8b2NY+7EJ+7967kQ
         ahiHRrmaVHbTvz9NJuGrrX3oZyv53TUQh/AD/rFSKy0RTfp9wtx9mJopPPG3z9WV+2Tg
         DXv2D0EGiDmCkE3/VSrBO9sYl7pBilLIBwUG5emi7SzsZgIST0XdE1AvG8PYKeH2SBv0
         bJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCZtLSeYxlaylMMqCjkYeGrkxr3IGAiBffdyUXZtj3g=;
        b=bdP7BUUcfPColq+y8u23ZmqqevsvuP/PGgItLoTp5JoJJbm6wJh9IRKmlkmwjvCAjJ
         lYYpdt33JoSxAtOxbDwS5YnbsPIaaySSxM9VkbbpkoSrh0YGO6vtcmKmJKqjQysJAE1K
         MSt8wJk8cUc+GaNC/2mwkX7sddFZwwASzENbiE0yJ02biIDIx/rXJUYjeQIt50AR5r2M
         gRRy+cwMxjE0H19vgOP1h7Tb9tBr++HXJtHwPeXtYtUsmccTdAFw2pPZr21wPRXcOYFZ
         IuMaAG698fvTsLzNGnYp8C7ZX+b0wrD53MOvVuinkbY6jM1j+5Z6Dl/FjYrjsWDY/Eko
         y9dA==
X-Gm-Message-State: AFqh2kq6KDVD26SF8uK0GmABlq72AGaT+cpPGWPUUQSdSXQGRPhcH7qI
        wYHsATSCSIQjJCXrpMjbSTAUXA==
X-Google-Smtp-Source: AMrXdXvccvyIUvsC6giGyrmwdGew3D/RCVnxToEiYyH+OAjvMgB2e96qDLlwPJi0Rp0MTefXZfUnYg==
X-Received: by 2002:a05:600c:2309:b0:3da:fb90:3ca4 with SMTP id 9-20020a05600c230900b003dafb903ca4mr1409000wmo.21.1673923732524;
        Mon, 16 Jan 2023 18:48:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b003c6bd12ac27sm39482660wmq.37.2023.01.16.18.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 18:48:52 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, benl@squareup.com,
        shawn.guo@linaro.org, fabien.parent@linaro.org, leo.yan@linaro.org,
        dmitry.baryshkov@linaro.org
Subject: [PATCH v3 3/8] dt-bindings: interconnect: Exclude all non msm8939 from snoc-mm
Date:   Tue, 17 Jan 2023 02:48:41 +0000
Message-Id: <20230117024846.1367794-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
References: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
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

New properties should be defined before the allOf. Move the
patternProperties definition to before the additionalProperties: false in
this file.

Exclude all non msm8939 compats from containing a matching
patternProperties.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/interconnect/qcom,rpm.yaml       | 73 +++++++++++--------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
index 5e6be4e79201e..d9d243c5514b5 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
@@ -62,6 +62,37 @@ properties:
   power-domains:
     maxItems: 1
 
+# Child node's properties
+patternProperties:
+  '^interconnect-[a-z0-9]+$':
+    type: object
+    description:
+      snoc-mm is a child of snoc, sharing snoc's register address space.
+
+    properties:
+      compatible:
+        enum:
+          - qcom,msm8939-snoc-mm
+
+      '#interconnect-cells':
+        const: 1
+
+      clock-names:
+        items:
+          - const: bus
+          - const: bus_a
+
+      clocks:
+        items:
+          - description: Bus Clock
+          - description: Bus A Clock
+
+    required:
+      - compatible
+      - '#interconnect-cells'
+      - clock-names
+      - clocks
+
 required:
   - compatible
   - reg
@@ -108,37 +139,6 @@ allOf:
             - description: Bus Clock
             - description: Bus A Clock
 
-      # Child node's properties
-      patternProperties:
-        '^interconnect-[a-z0-9]+$':
-          type: object
-          description:
-            snoc-mm is a child of snoc, sharing snoc's register address space.
-
-          properties:
-            compatible:
-              enum:
-                - qcom,msm8939-snoc-mm
-
-            '#interconnect-cells':
-              const: 1
-
-            clock-names:
-              items:
-                - const: bus
-                - const: bus_a
-
-            clocks:
-              items:
-                - description: Bus Clock
-                - description: Bus A Clock
-
-          required:
-            - compatible
-            - '#interconnect-cells'
-            - clock-names
-            - clocks
-
   - if:
       properties:
         compatible:
@@ -237,6 +237,17 @@ allOf:
             - description: Aggregate2 USB3 AXI Clock.
             - description: Config NoC USB2 AXI Clock.
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,msm8939-snoc
+    then:
+      patternProperties:
+        '^interconnect-[a-z0-9]+$': false
+
 examples:
   - |
       #include <dt-bindings/clock/qcom,rpmcc.h>
-- 
2.38.1

