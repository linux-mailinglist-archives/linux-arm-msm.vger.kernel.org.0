Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC51F665769
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 10:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbjAKJ2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 04:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238143AbjAKJ1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 04:27:21 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AF665FC
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:26:43 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v2so3386925wrw.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhVOOJdeRvnuSiz68zPh9oSWD5qRJTw08mRDGl7Mg9c=;
        b=m72ky2jW1IZmBjSeQqGkNV4atR0AEKhU20RvG8WD8si4aK4UahuDkmbMmWl0NJkLWr
         pYEJ1BGvxxDWP0E3dQQtZrm0b0fzsXqOXRjxXbfu+FycxgXg8JDLbg2Ics8AorVlNAUO
         aa66F2EIs2LXIuYUi+WnzAQwvnDmbD2MLNdqi20iuNBsY5H2AS6l4pCe52VQNKHfgh5U
         CwB3tA91JeA5xUvAwT6IpTFIxGe8ca+JDc6FNQ5iPUP98KnGdx3enFZMkeO5pGnk5wpY
         z8Un2s13/QvMJQ7EF5sDymo/wDpfWRTk9FGK76k+ipzuAsQRkg0pNut/eYnvrymRoryJ
         YRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhVOOJdeRvnuSiz68zPh9oSWD5qRJTw08mRDGl7Mg9c=;
        b=nPaKgWL2XWcb5IVuj/LgSDLxXREr2Qbn2qmIKxFVZugke7pHmp10BhT2L3qzVo5kbc
         D+oiXWP4tydFx47PzyX6DwPFtCOM8t/X9B6RLSd+wZ6U3ecKUR6ag0jCT2qDEh2Nwj5s
         35WHK2QA1axngRfJPn+neJCNwdAkPM+KBnReowps69U8rXRsdIrW0AxERe7qpgiNCIac
         UwMehxPrzy75MRhAhWvBGnnL8nLLp4DSe3uMJYGe/EPObU0lVNLe92KIq+zXiJHXdiqh
         nAKDhrgvgpdQCAyHwfAyQCNA/7ok7M2njifbROWkY5Ggx5ZuusD0OLnc7fwdA0AJM40r
         S+2A==
X-Gm-Message-State: AFqh2krmBrZAo58EDXsemtbe+ueJfBedw1pCRAH2elTdwZSUfpMvv2Dz
        LOV6V+FNDxJdS20J6tkhY6BKKQ==
X-Google-Smtp-Source: AMrXdXsuohtoJKbJgvqRS1RUhc6CAYKdjk7kSA9ROPHTZYCFqar8jLwtNkx/1ka5m+czCKj3jCh0Fg==
X-Received: by 2002:adf:e585:0:b0:2bc:7e9b:ca44 with SMTP id l5-20020adfe585000000b002bc7e9bca44mr6679498wrm.59.1673429202537;
        Wed, 11 Jan 2023 01:26:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4010000000b002bbed1388a5sm7954177wrp.15.2023.01.11.01.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:26:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: interconnect: split SC7280 to own schema
Date:   Wed, 11 Jan 2023 10:26:35 +0100
Message-Id: <20230111092637.17946-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

SC7280 comes with interconnects having and missing IO address space, so
split it from common file for easier maintenance and to fix warnings like:

  sc7280-herobrine-crd.dtb: interconnect: 'reg' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Fix typo in commit msg
2. Add Rb tag
---
 .../bindings/interconnect/qcom,rpmh.yaml      | 12 ----
 .../interconnect/qcom,sc7280-rpmh.yaml        | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index a429a1ed1006..4bdcc014c46b 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -39,18 +39,6 @@ properties:
       - qcom,sc7180-npu-noc
       - qcom,sc7180-qup-virt
       - qcom,sc7180-system-noc
-      - qcom,sc7280-aggre1-noc
-      - qcom,sc7280-aggre2-noc
-      - qcom,sc7280-clk-virt
-      - qcom,sc7280-cnoc2
-      - qcom,sc7280-cnoc3
-      - qcom,sc7280-dc-noc
-      - qcom,sc7280-gem-noc
-      - qcom,sc7280-lpass-ag-noc
-      - qcom,sc7280-mc-virt
-      - qcom,sc7280-mmss-noc
-      - qcom,sc7280-nsp-noc
-      - qcom,sc7280-system-noc
       - qcom,sc8180x-aggre1-noc
       - qcom,sc8180x-aggre2-noc
       - qcom,sc8180x-camnoc-virt
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml
new file mode 100644
index 000000000000..b135597d9489
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on SC7280
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM).
+
+  See also:: include/dt-bindings/interconnect/qcom,sc7280.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-aggre1-noc
+      - qcom,sc7280-aggre2-noc
+      - qcom,sc7280-clk-virt
+      - qcom,sc7280-cnoc2
+      - qcom,sc7280-cnoc3
+      - qcom,sc7280-dc-noc
+      - qcom,sc7280-gem-noc
+      - qcom,sc7280-lpass-ag-noc
+      - qcom,sc7280-mc-virt
+      - qcom,sc7280-mmss-noc
+      - qcom,sc7280-nsp-noc
+      - qcom,sc7280-system-noc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-clk-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interconnect {
+        compatible = "qcom,sc7280-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@9100000 {
+        reg = <0x9100000 0xe2200>;
+        compatible = "qcom,sc7280-gem-noc";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
-- 
2.34.1

