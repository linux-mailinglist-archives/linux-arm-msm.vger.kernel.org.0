Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE347E1BED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 09:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjKFI0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 03:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjKFI0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 03:26:08 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3770EBB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 00:26:05 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083740f92dso30985435e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 00:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699259163; x=1699863963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzGjVS3at3n/pceXahgDDyc4wDIPcG+CeU59gILW0pk=;
        b=eu7nr7BNZBZa1vYhF4kfbZPc3+n1+h3j9PotJdXGgC5mri7/4fMTSxtcSFdZ99Cov3
         /efyvyZ00d4dtwIZAMf6qXM5VKQmywPab+Yf3xYbUtbX2+XfLBToz3Y/txA2nhM9Ntau
         zGzmnzXg+3cJ1AP9JUjYVLKZf6/nR+w+F19a2hxx/RVXJpdT7WpRerlTp0dqAh7QEU4S
         2i+kAItYqs2rREVMvOfr0BQS8en/HA8BVaaWYWceXNmROylQO68fYTP7iT6H6f1jD9YK
         7AwWyF05mWwKV0JuvkIjkVWrAb+0z3Tu2gF3XsmQdkoDGOzysM84RRgNP5BvXMsDGoo9
         CF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699259163; x=1699863963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzGjVS3at3n/pceXahgDDyc4wDIPcG+CeU59gILW0pk=;
        b=i5OUMMDQPgwMkv89kQp4viUKIRRPComKGJb/NbZmBmaYZDeOe3MNaT9djISw3jWFgX
         9DkglFXc+wL35+NuaxFggFwt/B8AYCIeaAVNjzp8Fvx98Z51v9RU76QKeQ9GPNWOefBV
         rg1AbZFy8Vhg7wHxCRYYzQnVF18B29JHUxQRsEVMZ97ttAIda8/HbKmZOiKF0Pcic6mI
         8slYD2ZlodnurCHuF3XydhTz3rrLXcgKChWO7RK9obSO1IK9HM5xoWsNsbaiKOxASQcG
         tvH4jhorSrlQE5euZWkYXBBEcFi6AF3ddioDwiMY82SRnrZ6PW6LDS95B2st5+tZyH2E
         lpHA==
X-Gm-Message-State: AOJu0YwoFsa/pGDhAJlrUqa08oVPyAAWFlwvLmgY8vhrbTRAP+tLesEy
        ODSUYz5ae2lXdR55RY+aerMpPg==
X-Google-Smtp-Source: AGHT+IF7C31a5WM+VZ+uvoLdLSiSFIYj8rXzlVpV1Kzkgq6j9ZnnLUV76kBcSiBsHEMgUIQrkkgEOA==
X-Received: by 2002:a05:600c:1c93:b0:408:3c8a:65ec with SMTP id k19-20020a05600c1c9300b004083c8a65ecmr22569134wms.8.1699259163552;
        Mon, 06 Nov 2023 00:26:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id az25-20020a05600c601900b004095874f6d3sm11610663wmb.28.2023.11.06.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 00:26:03 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 06 Nov 2023 09:25:54 +0100
Subject: [PATCH v3 01/11] dt-bindings: clock: qcom: document the SM8650
 TCSR Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-topic-sm8650-upstream-clocks-v3-1-761a6fadb4c0@linaro.org>
References: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
In-Reply-To: <20231106-topic-sm8650-upstream-clocks-v3-0-761a6fadb4c0@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O0iRHbcXKAwCJ7jZa5qhP1VrxlTsAWl2qMZ84eG0xCU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlSKMUhE0FeGV5TZRKpvr8snwgH6GKXojuJKhv4bJw
 8IpfkAyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUijFAAKCRB33NvayMhJ0WBLD/
 wJxX3bHf9PtHF/5N4U9Dl07OJRCboIgElmtX7fiWAcEVCehJ4zSjjoyfDJgWzoROXNlNzvWM4BfuEb
 IO1l6SMdh0bzw/+atOst5bup8fcibYAmtLf94mGKIb7qtUmx1YbI4Wwp/4cf6VshEEdZ7bmH4q2yYj
 DCoNNPhgd69xH9Bz3KF7L2cFXfV+gkf/wjaopkyRIZj8ZoGVskmUwD8JYHwbDMpN9y32el+UsDu4GD
 L2zP/4/mLfxTF/Vtr/SnqZEvk5Z+MUhLTRbXRKPJ8HO1a1GhHg/TCNUgjHl8v1v5/zidwuXm+a8q/6
 F2Imk37XKN3DOPYELea+v9FzTzU5lIDpiK2OCvL9PP3vlyDxrOmav5GlsY8t1XteNWK8/xHMoiOPgD
 4SgLMglwxTSNw6mfnzjBgNxpnfTzjBzFFUd6Q0oF8c4V01PmnYE1a0Z1SH2rjvezgNyENh/KqVjMmm
 8jUqFVSJNsROWu/RMDfimt3Q2DcBwwFmkgJCxIi/JHqkyh9S6a6a6UloYIArv8n2lx31Wlc6Fnd+hl
 7BGIAZsOie4O9swAOE6fKbdYSOANwixpqI7JgklVLq4lbVKdaL8qqxo8aGUg3Snk0iGY1i0vDxgMBN
 zqZrjoc44Vmkx7jybJgqHWeZ1WLVcLjdiLibwEfe6lmVhKxbTeWlj/4F2eew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings documentation for the SM8650 TCSR Clock Controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml    |  8 ++++++--
 include/dt-bindings/clock/qcom,sm8650-tcsr.h           | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1bf1a41fd89c..af16b05eac96 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -13,12 +13,16 @@ description: |
   Qualcomm TCSR clock control module provides the clocks, resets and
   power domains on SM8550
 
-  See also:: include/dt-bindings/clock/qcom,sm8550-tcsr.h
+  See also:
+  - include/dt-bindings/clock/qcom,sm8550-tcsr.h
+  - include/dt-bindings/clock/qcom,sm8650-tcsr.h
 
 properties:
   compatible:
     items:
-      - const: qcom,sm8550-tcsr
+      - enum:
+          - qcom,sm8550-tcsr
+          - qcom,sm8650-tcsr
       - const: syscon
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,sm8650-tcsr.h b/include/dt-bindings/clock/qcom,sm8650-tcsr.h
new file mode 100644
index 000000000000..b2c72d492f1f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8650_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8650_H
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

