Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E270965C770
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 20:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbjACT0S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 14:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239026AbjACTZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 14:25:59 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC3715F17
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 11:24:10 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so24323676wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 11:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNI2i3/QTr9mwnzcqdEPuyaMkTpSlzmqI4PslyM1ul8=;
        b=qxSx5Fdwyf6bGTwoSuKdFNu4We3RKaOJPn7Ac30vum4PG/t47eHgGpXzJL6FD+IB2A
         oyyTrURLu0BvXc3L+5p9gWWHmLUNITzTdzM/aLaEa6MEJtVNvxfgeGKLjSJ6Vb3jw+Jo
         6EOQj7WuyEN7C09aPrZKqlk4u9XymrPmpQ/1LxSQ9UcvAKpc4Reeoa3Ea75GTAUXYqc/
         GUOZNri9v01AYlnh3UNoFQtEMftB5URL524PL/tOpEpka/ZrD3LbsvRg1SGY11rgm4y/
         cF4elqJpQdEtS17VqAY6bNBp64yKBtsVx8Nim3onJJq91WV/9T25MhjPl/+BnuKZFAxY
         VqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNI2i3/QTr9mwnzcqdEPuyaMkTpSlzmqI4PslyM1ul8=;
        b=iHMYCcPqMxj4X6qnkMRAlpyR4YJTYTpbSZi0LRNGNOyo/Y7pdLYCC9Qeoa7lk1impd
         45dKkGdIdQuvjtSZDdK8WCCIOSSCPRRqKQ7fIJXicXYRNiwVb/GEvdcVumLzlV8HuvBH
         Hs0fCy850ncTDNgyJo0mCyiSKAg8W4cChcMIIOglZbOtSsbuHGhf3ttSV6hvCnr0EPow
         T6i56CZKzHI8xaSzv6hPFGJTlk5cGIFyVXk9RNnfWvgKYnzyRWPxMM1BtN7bNAa7XLe7
         MMw8GUOhD5MVqPIxxFZukRyDcRKWqUHasTPBLeLeC4HRsSxRTxDNcnPIev7ASghx/CH+
         NEjQ==
X-Gm-Message-State: AFqh2kolwyObPJ0cqHFAlE8cJYC40pSdBRLYGCsQuq+4KY4xa7P3NSVK
        WCZMvV5x6g5w4y6Dy2mZlQj31A==
X-Google-Smtp-Source: AMrXdXuqrH46ThsHvmVdCI+/tUXQjRojKpHrtlChbtGv9OLDKNAUKqs8rJfbW8EBGNiYp0b8sQzBRA==
X-Received: by 2002:a05:600c:3495:b0:3c6:e62e:2e74 with SMTP id a21-20020a05600c349500b003c6e62e2e74mr32353682wmq.15.1672773848985;
        Tue, 03 Jan 2023 11:24:08 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l42-20020a05600c1d2a00b003cfbbd54178sm70803660wms.2.2023.01.03.11.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 11:24:08 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/4] dt-bindings: clock: Add SM8550 TCSR CC clocks
Date:   Tue,  3 Jan 2023 21:21:55 +0200
Message-Id: <20230103192158.1155197-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103192158.1155197-1-abel.vesa@linaro.org>
References: <20230103192158.1155197-1-abel.vesa@linaro.org>
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

Add bindings documentation for clock TCSR driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml      | 55 +++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8550-tcsr.h  | 18 ++++++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
new file mode 100644
index 000000000000..2b72ab82041a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on SM8550
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on SM8550
+
+  See also:: include/dt-bindings/clock/qcom,sm8550-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm8550-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    clock-controller@1fc0000 {
+      compatible = "qcom,sm8550-tcsr", "syscon";
+      reg = <0x1fc0000 0x30000>;
+      clocks = <&rpmhcc RPMH_CXO_PAD_CLK>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm8550-tcsr.h b/include/dt-bindings/clock/qcom,sm8550-tcsr.h
new file mode 100644
index 000000000000..091cb76f953a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+
+/* TCSR CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_UFS_PAD_CLKREF_EN					3
+#define TCSR_USB2_CLKREF_EN					4
+#define TCSR_USB3_CLKREF_EN					5
+
+#endif
-- 
2.34.1

