Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CA21E02E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 23:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388217AbgEXVGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 17:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388202AbgEXVG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 17:06:28 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BB8C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:27 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id l1so12546260qtp.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IB735CxnLdulpWhY5dVCVlHnjZEUj+47Z7loFw0bHLc=;
        b=afegZJP77KSu+LmrLUf+eCMqlJypfVqSkrH8f3euV1CGZ5WuywPBReDBbp8/2MWEMb
         +zJjuFPf9RVzCMg0angUKn9U6lupAsSIQm92WTYRB1n9ozOHtRzjeNzTtuxds5vLHB2h
         IN0qSVLKeNm/owbAHgx71qST9loLJnWv2uXDKWuBfI7AvRkgSKWoDzRH90Hwow8J2uoK
         pAeC0zK0410Qpmj9qrSh6UIv0NGt0eLCXzmQ9bsBDr/YatarefYesBPmLGmlooBi9Gsc
         YZma+3XVp9QEbT47iLGeSNLsDulP8tLMtf+XHLnkYBvoa6fHvYUi/qt/juIybvDbti7y
         EBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IB735CxnLdulpWhY5dVCVlHnjZEUj+47Z7loFw0bHLc=;
        b=sqZ4Fht583P6uhHd50idLo7NVaGuI/Z9FRmPwwdjwj8YdFpgcwgmqhdY0b8JRAwRy+
         TQQ4PhSkSF+rydXox8UF6tET9isKuNd+Af6/1avebZY4fYGSi65EWvUI2ymk1qqL1Qm5
         lWmp0SQC4uNn6/oQ2ZTLempwbzhIZPigsybesxgyVCfs9o4U/CEaohD5e4TyJ9loId06
         PKDeNg1IJzEczyc2R+zAS2W6fJsQcyHDi06RY6Zspv4Ir5A2+jwsJuqAmtyeyCi2NrlU
         Qvn338R+RbqEfvu0iqBY1ingeBdhOweT4QsF/sqFXBZ3EbaFhZFaM/sgHgInlD4zLSXZ
         Oo3w==
X-Gm-Message-State: AOAM53147CNm6zymk+1YfeDuec/6C5smPj1rK/hJCFfBdy1cN5MO1sZ5
        ahiw0w0XwIdMYB0NUiZynibhBr71gj8=
X-Google-Smtp-Source: ABdhPJzm337i7AHVG8c2KaAAOBpmSSoD0D+hRZRsAXhyZSd7oibA7DcfFbEF4y8GebXWmC6GpxbGaQ==
X-Received: by 2002:ac8:3529:: with SMTP id y38mr11483010qtb.315.1590354386108;
        Sun, 24 May 2020 14:06:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g51sm4401769qtb.69.2020.05.24.14.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:06:25 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH 05/10] dt-bindings: clock: Introduce SM8150 QCOM Graphics clock bindings
Date:   Sun, 24 May 2020 17:06:06 -0400
Message-Id: <20200524210615.17035-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200524210615.17035-1-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SM8150 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 include/dt-bindings/clock/qcom,gpucc-sm8150.h | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h

diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8150.h b/include/dt-bindings/clock/qcom,gpucc-sm8150.h
new file mode 100644
index 000000000000..e7cac7fe9739
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sm8150.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8150_H
+
+/* GPU_CC clock registers */
+#define GPU_CC_AHB_CLK				0
+#define GPU_CC_CRC_AHB_CLK			1
+#define GPU_CC_CX_APB_CLK			2
+#define GPU_CC_CX_GMU_CLK			3
+#define GPU_CC_CX_QDSS_AT_CLK			4
+#define GPU_CC_CX_QDSS_TRIG_CLK			5
+#define GPU_CC_CX_QDSS_TSCTR_CLK		6
+#define GPU_CC_CX_SNOC_DVM_CLK			7
+#define GPU_CC_CXO_AON_CLK			8
+#define GPU_CC_CXO_CLK				9
+#define GPU_CC_GMU_CLK_SRC			10
+#define GPU_CC_GX_GMU_CLK			11
+#define GPU_CC_GX_QDSS_TSCTR_CLK		12
+#define GPU_CC_GX_VSENSE_CLK			13
+#define GPU_CC_PLL1				14
+#define GPU_CC_PLL_TEST_CLK			15
+#define GPU_CC_SLEEP_CLK			16
+
+/* GPU_CC Resets */
+#define GPUCC_GPU_CC_CX_BCR			0
+#define GPUCC_GPU_CC_GFX3D_AON_BCR		1
+#define GPUCC_GPU_CC_GMU_BCR			2
+#define GPUCC_GPU_CC_GX_BCR			3
+#define GPUCC_GPU_CC_SPDM_BCR			4
+#define GPUCC_GPU_CC_XO_BCR			5
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif
-- 
2.26.1

