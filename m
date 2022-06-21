Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420045539E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 20:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352415AbiFUS5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 14:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352293AbiFUS5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 14:57:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC222A27E
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 11:56:58 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id q15so7987954wmj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 11:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ruCtX16/9aMNCe9aHrNaoYuLjA2cdIvRTGTl8yQdAMY=;
        b=BIAPnfQu5vekah1gE3Fxlkj2HEd0Aid1SHxRsiYdlHrt5SVogi/M+WoI9BecCttcd7
         WMS0I1/KhxXhWAD3DSfEyq3Fc0tWK769Db+H88RtDqNXCbLMQjK9JAycEAPRRkt1BP29
         RubXefQDMdYi18R8C9byl6J0AQZHe4SNonk6k6UJaFKF1F8vYDYqwI9xizpaKeMwLLpt
         6r82dT75GnvfOS3XjFZctq9vOB1ARizD6ZDDUvlPVuiJAEfcn0tA3FsOnjWAN3OwyxbP
         m0TO9A1Ss7LH8LHUvwXdXVFml52/2ycjNiiu32MoIvKGizjMm/Fwl8SGXx0HnGvnWvXp
         cfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ruCtX16/9aMNCe9aHrNaoYuLjA2cdIvRTGTl8yQdAMY=;
        b=yFA1tYMfiNP1azgVvPGImVUo9dW/T8+Ifat282Ube+qPSxkOGiZvRGLlKScuEeFzL6
         vJT9ikT5YcyrW7uz2UlvuahIHvpmk2CnSJKYV4fUIQmatvbky0DexqlAv68mD7j1FdIr
         hGPIywCbxdeCiMgL1ptYVFzO2aAtlMpQPsUqHOhJ8Fy2GJ6NpnPnJWoSmp1DFTGu+tpZ
         4wS2uG9TBO/bOZp38JaCm5LnXIvCPJLcDyYhWPSzMAuV6AuYoSn/5Bi5GL+CaKG27uzU
         Yir6CFHnABrWmtQY9x12hnd+0BXx09VR1GaJ7xqD64DJoYXuUrhIfz578z1ojAQg2JTs
         P/Bw==
X-Gm-Message-State: AJIora+0d8E51sQv4Ays+lBAw6nspL9Ho/rHYa7nHxOZFbsy3vugB1cR
        pLIKFdviWANpqYXLyMF8xBnIDw==
X-Google-Smtp-Source: AGRyM1taVNZ3tvbztEikZDwRU5uqq6K3i3ElxLlgGYTFtxOGHWpZrNWcvC9KW9asM2DcktUsKdyVGQ==
X-Received: by 2002:a05:600c:2f90:b0:39e:ee0d:6419 with SMTP id t16-20020a05600c2f9000b0039eee0d6419mr22907305wmn.59.1655837817456;
        Tue, 21 Jun 2022 11:56:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f6-20020a1c6a06000000b003a0231af43csm294903wmc.48.2022.06.21.11.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 11:56:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Kumar Gala <galak@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: document qcom,msm-id and qcom,board-id
Date:   Tue, 21 Jun 2022 20:56:48 +0200
Message-Id: <20220621185649.37391-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621185649.37391-1-krzysztof.kozlowski@linaro.org>
References: <20220621185649.37391-1-krzysztof.kozlowski@linaro.org>
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

The top level qcom,msm-id and qcom,board-id properties are utilized by
bootloaders on Qualcomm MSM platforms to determine which device tree
should be used and passed to the kernel.

The commit b32e592d3c28 ("devicetree: bindings: Document qcom board
compatible format") from 2015 was a consensus during discussion about
upstreaming qcom,msm-id and qcom,board-id fields.  There are however still
problems with that consensus:
1. It was reached 7 years ago but it turned out its implementation did
   not reach all possible products.

2. Initially additional tool (dtbTool) was needed for parsing these
   fields to create a QCDT image consisting of multiple DTBs, later the
   bootloaders were improved and they use these qcom,msm-id and
   qcom,board-id properties directly.

3. Extracting relevant information from the board compatible requires
   this additional tool (dtbTool), which makes the build process more
   complicated and not easily reproducible (DTBs are modified after the
   kernel build).

4. Some versions of Qualcomm bootloaders expect these properties even
   when booting with a single DTB.  The community is stuck with these
   bootloaders thus they require properties in the DTBs.

Since several upstreamed Qualcomm SoC-based boards require these
properties to properly boot and the properties are reportedly used by
bootloaders, document them.

Link: https://lore.kernel.org/r/a3c932d1-a102-ce18-deea-18cbbd05ecab@linaro.org/
Co-developed-by: Kumar Gala <galak@codeaurora.org>
Signed-off-by: Kumar Gala <galak@codeaurora.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/qcom.yaml         | 123 ++++++++++++++++++
 include/dt-bindings/arm/qcom,ids.h            |  30 +++++
 2 files changed, 153 insertions(+)
 create mode 100644 include/dt-bindings/arm/qcom,ids.h

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 6c38c1387afd..05b98cde4653 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -403,6 +403,129 @@ properties:
               - qcom,sm8450-qrd
           - const: qcom,sm8450
 
+  # Board compatibles go above
+
+  qcom,msm-id:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 8
+    items:
+      items:
+        - description: |
+            MSM chipset ID - an exact match value consisting of three bitfields::
+             - bits 0-15  - The unique MSM chipset ID
+             - bits 16-31 - Reserved; should be 0
+        - description: |
+            Hardware revision ID - a chipset specific 32-bit ID representing
+            the version of the chipset.  It is best a match value - the
+            bootloader will look for the closest possible match.
+    deprecated: true
+    description:
+      The MSM chipset and hardware revision use by Qualcomm bootloaders.  It
+      can optionally be an array of these to indicate multiple hardware that
+      use the same device tree.  It is expected that the bootloader will use
+      this information at boot-up to decide which device tree to use when given
+      multiple device trees, some of which may not be compatible with the
+      actual hardware.  It is the bootloader's responsibility to pass the
+      correct device tree to the kernel.
+      The property is deprecated - it is not expected on newer boards
+      (starting with SM8350).
+
+  qcom,board-id:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 8
+    items:
+      oneOf:
+        - maxItems: 2
+          items:
+            - description: |
+                Board ID consisting of three bitfields::
+                  - bits 31-24 - Unused
+                  - bits 23-16 - Platform Version Major
+                  - bits 15-8  - Platform Version Minor
+                  - bits 7-0   - Platform Type
+                Platform Type field is an exact match value.  The
+                Platform Major/Minor field is a best match.  The bootloader will
+                look for the closest possible match.
+            - description: |
+                Subtype ID unique to a Platform Type/Chipset ID.  For a given
+                Platform Type, there will typically only be a single board and the
+                subtype_id will be 0.  However in some cases board variants may
+                need to be distinguished by different subtype_id values.
+        # OnePlus uses a variant of board-id with four elements:
+        - minItems: 4
+          items:
+            - const: 8
+            - const: 0
+            - description: OnePlus board ID
+            - description: OnePlus subtype ID
+    deprecated: true
+    description:
+      The board type and revision information.  It can optionally be an array
+      of these to indicate multiple boards that use the same device tree.  It
+      is expected that the bootloader will use this information at boot-up to
+      decide which device tree to use when given multiple device trees, some of
+      which may not be compatible with the actual hardware.  It is the
+      bootloader's responsibility to pass the correct device tree to the
+      kernel
+      The property is deprecated - it is not expected on newer boards
+      (starting with SM8350).
+
+allOf:
+  # Explicit allow-list for older SoCs. The legacy properties are not allowed
+  # on newer SoCs.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8026
+              - qcom,apq8094
+              - qcom,apq8096
+              - qcom,msm8992
+              - qcom,msm8994
+              - qcom,msm8996
+              - qcom,msm8998
+              - qcom,sdm630
+              - qcom,sdm632
+              - qcom,sdm845
+              - qcom,sdx55
+              - qcom,sdx65
+              - qcom,sm6125
+              - qcom,sm6350
+              - qcom,sm7225
+              - qcom,sm8150
+              - qcom,sm8250
+    then:
+      properties:
+        qcom,board-id: true
+        qcom,msm-id: true
+    else:
+      properties:
+        qcom,board-id: false
+        qcom,msm-id: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - oneplus,cheeseburger
+              - oneplus,dumpling
+              - oneplus,enchilada
+              - oneplus,fajita
+    then:
+      properties:
+        qcom,board-id:
+          items:
+            minItems: 4
+    else:
+      properties:
+        qcom,board-id:
+          items:
+            maxItems: 2
+
 additionalProperties: true
 
 ...
diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
new file mode 100644
index 000000000000..eaf86c18650f
--- /dev/null
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Linaro Ltd
+ * Author: Krzysztof Kozlowski <krzk@kernel.org> based on previous work of Kumar Gala.
+ */
+#ifndef _DT_BINDINGS_ARM_QCOM_IDS_H
+#define _DT_BINDINGS_ARM_QCOM_IDS_H
+
+/* qcom,msm-id */
+#define QCOM_ID_APQ8026				199
+#define QCOM_ID_MSM8916				206
+#define QCOM_ID_MSM8994				207
+#define QCOM_ID_MSM8996_3_0			246
+#define QCOM_ID_APQ8016				247
+#define QCOM_ID_MSM8216				248
+#define QCOM_ID_MSM8116				249
+#define QCOM_ID_MSM8616				250
+#define QCOM_ID_MSM8998				292
+#define QCOM_ID_SDM845				321
+
+/* qcom,board-id */
+#define QCOM_BOARD_ID(a, major, minor) \
+	(((major & 0xff) << 16) | ((minor & 0xff) << 8) | QCOM_BOARD_ID_##a)
+
+#define QCOM_BOARD_ID_MTP			8
+#define QCOM_BOARD_ID_DRAGONBOARD		10
+#define QCOM_BOARD_ID_SBC			24
+
+#endif /* _DT_BINDINGS_ARM_QCOM_IDS_H */
-- 
2.34.1

