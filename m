Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B67514EDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378172AbiD2PQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378197AbiD2PQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:16:43 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86705D4C4F
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:19 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id dk23so16039539ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQi0DOXBFPjAV8nVfsEI5OyAGb7iRPNqL8WA0HHoYYo=;
        b=lKUPKkowXeHzT0Ta2KasThXbya7EFtctvOWcyGz5iwDiqINSSbxHap2PKm+/B9j3eS
         Ij7rnYLwrjrqQL5zCcpR/12PhxU6TPsXW9DDKLE+9SJ003FrFSA4tw/jrNsnwFiIvJwT
         cyHO6mVoc+EocyUXyh5Rs9m+yz3Qc9ZAlhkmfktW5doBHs7Z3GyMVcLE49AYoZdBNUnw
         xBK0dEbo/0uM0L/OFR5xb9sq2BK1FIP0ihGkY7afSyNF71Rka3c8kLTiLXRifZtJG6iE
         Pq4emV4PIVcxd1BycfaihyUt0UwWTuH8An7LAEZGgyX98tWkv9GSdBsKw0eG17GajR2Y
         Tj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQi0DOXBFPjAV8nVfsEI5OyAGb7iRPNqL8WA0HHoYYo=;
        b=kum5X0mIkSGG8eUlAFZ/rvV7Zx4bPl0s+v3hrsHm6hiVbplB2UzgwsSc+f4UJs7WId
         243uVMkub9qJmPLFo5w81TwX7BCbjDhE95D+8jd2K5dLGOosrzh4c6qfrzgUpdfFx85M
         mHSyc9O+XUEbznnfXmaI4Df8OwqNjFUjZDYyWXQTYK3LOqIHW3Jvh7vLCEjvhjpnGFMb
         kETTcpCcIDb5/mvT4vV2tzyzI6x52i+BQeNU2qEwS66+AFTv2VJc3Qb9B46Sku3lBQH9
         OSENjf2WHN1Vzlm6l3JTxD3GhUO2H+8U5qgZzkuDmfmv0TxyrdXAndMPbnQLbjob0vSl
         sgiA==
X-Gm-Message-State: AOAM532VwIFILvk8w9peu7fZnCN3SToFj4AO06gfZ36tAxxmo5Wy5Nvf
        mZh0TK/nfjV9hdTDrt0X0cjT7A==
X-Google-Smtp-Source: ABdhPJyiyPakItBCJpcb5vAA9BUIq2lU3LRgIu9Ty3XZQnr+dQcNqoKX4OYcyka0YZu3YtgKamPqZQ==
X-Received: by 2002:a17:907:6d9d:b0:6da:7d4c:287f with SMTP id sb29-20020a1709076d9d00b006da7d4c287fmr35626405ejc.741.1651245197955;
        Fri, 29 Apr 2022 08:13:17 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:17 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 5/9] dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
Date:   Fri, 29 Apr 2022 17:12:43 +0200
Message-Id: <20220429151247.388837-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
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

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SM8350 SoCs.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
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
2.32.0

