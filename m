Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57A62906F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 16:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394957AbgJPONS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 10:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408687AbgJPONJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 10:13:09 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6C8C061755
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:13:09 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d3so3125209wma.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kTQ3e0/LCgzSJvFHZrL2OGlp6ZdNfQa4Pg2C/+kTcwM=;
        b=R2miFc+dHSOeJn+GWdVmFd1PNMaUs4TRLGiuuq0bc0W5ZeLPfTqsQaHeecTY6IYZVN
         sWo6Y9ifZoOoz+lpITqOLH4P7ZxXM8/ZuuJ7jRdBIKRugH+kWVIQwUNMLT5zM3B1cbNJ
         0S7dTDkw8qJ9AtOXYRctgiuWCWBfIpRHaFxj2n37fxg7qahFLo4jvcpfvvursM+savMY
         mwohah0vNifIl0HD2i6rsJ9JsyZNJPlZdY1iA34h9Zs8+3d0zQwakf6ntdD6srEvwMyr
         AvWrN4buyrz+ihkpikAnbay2nCJV3WHOZNnBUK9/VLu1iPC4BshC1X1TrBT+NgNCQL7R
         CEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kTQ3e0/LCgzSJvFHZrL2OGlp6ZdNfQa4Pg2C/+kTcwM=;
        b=PiJBkwya9CqvhM09h46awn6DbmIl4cqv/eJETCPHNxQEG48UI3VWgYfUbyXTriblKl
         42kbr0juYkAuA/B2L1t94sOGABFnXu3Rf1YS9vwUqRM6LCb76gOBLtMrioa7z/ViMRj3
         5NcpuFt/P/4OhukLJy3CKCkvb2uglE9BjdcnvjrQnxtfd9nFPbXmwim1JHCsAUnI8LQB
         xJw/LviFqLNhHz2SuCusje1taFYoTKGq6RTMeK+s26ALK2G8qgO1xIwSF6YWD2qXUsVv
         E06e+3iXUwreKZWlDbvE6cHYKaMvmpmcO/OlBEYLLtvYSelLeiw8zMUpwXDt9vCkW5mw
         7TmQ==
X-Gm-Message-State: AOAM532Sa7wkEmrqGAIRO9KDnKgekJWognDmkFdJT4GdOD9xctPSbljz
        Tt4l3HUZXKN7w1YaRpQbkqENLIeJHCitHA==
X-Google-Smtp-Source: ABdhPJzCKNElQ1NUCwurtrIer3IcqYwogjtuBu/BUkEzeFBe0go/Ce/o/Vn71L7fm569CEFwgXsPNw==
X-Received: by 2002:a1c:3cc3:: with SMTP id j186mr4323340wma.155.1602857577712;
        Fri, 16 Oct 2020 07:12:57 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id p9sm2982284wma.12.2020.10.16.07.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:12:56 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/4] dt-bindings: clock: Add support for LPASS Always ON Controller
Date:   Fri, 16 Oct 2020 15:12:39 +0100
Message-Id: <20201016141241.5839-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Always ON Clock controller is a block inside LPASS which controls
1 Glitch free muxes to LPASS codec Macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/clock/qcom,aoncc-sm8250.yaml     | 58 +++++++++++++++++++
 .../clock/qcom,sm8250-lpass-aoncc.h           | 11 ++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
new file mode 100644
index 000000000000..c40a74b5d672
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,aoncc-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for LPASS Always ON Clock Controller on SM8250 SoCs
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell.
+  See include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h for the full list
+  of Audio Clock controller clock IDs.
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-aon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: Glitch Free Mux register clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    clock-controller@3800000 {
+      #clock-cells = <1>;
+      compatible = "qcom,sm8250-lpass-aon";
+      reg = <0x03380000 0x40000>;
+      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "core", "bus";
+    };
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
new file mode 100644
index 000000000000..f5a1cfac8612
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
+#define _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
+
+/* from AOCC */
+#define LPASS_CDC_VA_MCLK				0
+#define LPASS_CDC_TX_NPL				1
+#define LPASS_CDC_TX_MCLK				2
+
+#endif /* _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H */
-- 
2.21.0

