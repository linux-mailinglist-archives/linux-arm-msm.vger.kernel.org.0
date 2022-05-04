Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62396519F53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 14:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349508AbiEDMbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 08:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343701AbiEDMbN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 08:31:13 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF48E24BE4
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 05:27:36 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l18so2556330ejc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rOsJ9Zrz7rA4F/2ineOAizsi6mknMU/UXeuWBA/JKfA=;
        b=ex8kem+iMsB7lynxxLS0isrLXRCXn7UElJ9YtAdVWhG3YETj2znfHJNuhd+4PiCQsr
         YyT+d4ypfWsIN5M0t99Y0TJBf4Zqc2hgxgdutQhftX+om/1pb5h8JH/1+IY7dId+0Kd8
         tePmbXEEY8/RZqNfUunXLVvSm7Bdq6xc3PsOkOA6580z2UIlnu2QiMAVN9SKMmF2TNNB
         +eoWeeAWxm+w0D/Nx3d8a6NBzP/r7oN3S1MZduGmD3emxVA+dhbEnkh8v0jDbk3Mmeo9
         3bj0TeLIoqH89+3QrknGuekC26maQqKMnNdpU4ANqD0Siudc5c/vrCTuhNTToWeh5+ek
         5ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rOsJ9Zrz7rA4F/2ineOAizsi6mknMU/UXeuWBA/JKfA=;
        b=TysW6BU6Knzxlkzle1+bD64QVvnTDnOoBpZp7r2mFhBW8hY0kblTlJW0tLphV0DFpX
         OcMELzYaeda16s2haHyFi0knXXZB5qrocmfxAwwJcmE8D8+7KUZV1nMdyItwwLAlmuuR
         07VzM3JsOZoE5CX/bfcRaOgtmB9Piz12kND+P/I0ddmHLTqdfCjf7lO6uXtEjG41/fQC
         lfTAmgH6HL6ihsC+xhXUbsQKdWLqcm1Ap/4AZnhSEJoh4L7iZJPJteI8MS4R7NHaK6We
         eR4R5BoVgUphXRcdfwsS2sBz1xLQ/MQ/CIAn0x2xwqLYe3dNLUu1xz5h9/krWpekKU4o
         pE9g==
X-Gm-Message-State: AOAM531XJBnckAk+mtWtcg5HbqQnxHOR+DSW6wb5IE69UNPrWqqb7Bpy
        m72HCdjYC/1kLZgYc8NGKQyEaw==
X-Google-Smtp-Source: ABdhPJzR9Q6YRcydSb7FLp9kMPAUoUqwZlyHvgfmJEbkR7A4tgB30G8VcwD5C2LHXPce4siaW9TVBA==
X-Received: by 2002:a17:906:2989:b0:6f3:a215:8426 with SMTP id x9-20020a170906298900b006f3a2158426mr20195877eje.725.1651667255328;
        Wed, 04 May 2022 05:27:35 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id mm30-20020a170906cc5e00b006f3ef214e06sm5675557ejb.108.2022.05.04.05.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 05:27:34 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Dmitry Baryshkov <dmityr.baryshkov@linaro.org>
Subject: [PATCH v3 3/6] dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
Date:   Wed,  4 May 2022 14:27:22 +0200
Message-Id: <20220504122725.179262-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504122725.179262-1-robert.foss@linaro.org>
References: <20220504122725.179262-1-robert.foss@linaro.org>
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

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SM8350 SoCs.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmityr.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml |  2 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h | 52 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 9ebcb1943b0a..4090cc7ea2ae 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -20,6 +20,7 @@ description: |
     dt-bindings/clock/qcom,gpucc-sm6350.h
     dt-bindings/clock/qcom,gpucc-sm8150.h
     dt-bindings/clock/qcom,gpucc-sm8250.h
+    dt-bindings/clock/qcom,gpucc-sm8350.h
 
 properties:
   compatible:
@@ -31,6 +32,7 @@ properties:
       - qcom,sm6350-gpucc
       - qcom,sm8150-gpucc
       - qcom,sm8250-gpucc
+      - qcom,sm8350-gpucc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8350.h b/include/dt-bindings/clock/qcom,gpucc-sm8350.h
new file mode 100644
index 000000000000..d2294e0d527e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sm8350.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8350_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8350_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK			0
+#define GPU_CC_CB_CLK			1
+#define GPU_CC_CRC_AHB_CLK		2
+#define GPU_CC_CX_APB_CLK		3
+#define GPU_CC_CX_GMU_CLK		4
+#define GPU_CC_CX_QDSS_AT_CLK		5
+#define GPU_CC_CX_QDSS_TRIG_CLK		6
+#define GPU_CC_CX_QDSS_TSCTR_CLK	7
+#define GPU_CC_CX_SNOC_DVM_CLK		8
+#define GPU_CC_CXO_AON_CLK		9
+#define GPU_CC_CXO_CLK			10
+#define GPU_CC_FREQ_MEASURE_CLK		11
+#define GPU_CC_GMU_CLK_SRC		12
+#define GPU_CC_GX_GMU_CLK		13
+#define GPU_CC_GX_QDSS_TSCTR_CLK	14
+#define GPU_CC_GX_VSENSE_CLK		15
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK	16
+#define GPU_CC_HUB_AHB_DIV_CLK_SRC	17
+#define GPU_CC_HUB_AON_CLK		18
+#define GPU_CC_HUB_CLK_SRC		19
+#define GPU_CC_HUB_CX_INT_CLK		20
+#define GPU_CC_HUB_CX_INT_DIV_CLK_SRC	21
+#define GPU_CC_MND1X_0_GFX3D_CLK	22
+#define GPU_CC_MND1X_1_GFX3D_CLK	23
+#define GPU_CC_PLL0			24
+#define GPU_CC_PLL1			25
+#define GPU_CC_SLEEP_CLK		26
+
+/* GPU_CC resets */
+#define GPUCC_GPU_CC_ACD_BCR		0
+#define GPUCC_GPU_CC_CB_BCR		1
+#define GPUCC_GPU_CC_CX_BCR		2
+#define GPUCC_GPU_CC_FAST_HUB_BCR	3
+#define GPUCC_GPU_CC_GFX3D_AON_BCR	4
+#define GPUCC_GPU_CC_GMU_BCR		5
+#define GPUCC_GPU_CC_GX_BCR		6
+#define GPUCC_GPU_CC_XO_BCR		7
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC			0
+#define GPU_GX_GDSC			1
+
+#endif
-- 
2.34.1

