Return-Path: <linux-arm-msm+bounces-35898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA89B0724
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 854292849C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEBA20F3CA;
	Fri, 25 Oct 2024 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OhTB/rAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495F20D4EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868649; cv=none; b=qi8KofYwD+m0lr4LJAHh1T0L5lczEaIyw7wR+80YBJe/MuTBLcp1bPUPtWcoRtDSV4hdStIXQr03LjBHZLQBwuE8iBae/IYZ7weptoZWw1HSkf4ccMJkOY5FoHyCgzH/NGrOdDI/ICuhjDQRIcyvePmJRvtqnEqqQzqyBs+ZPJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868649; c=relaxed/simple;
	bh=doO/a916moGA8DWgcEw9MEXPijwB7ll6ZA8YQOQZTOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WewON3O8MMoI1aPX0/ml9x/kwFya2iwsFZkUguWAR5x9GYgueYPM/9F4Rz5BU9iRm+o7AydA4d6GhOjhUFcSeOWweTq9AULqlhMk1IzPDSuVOlg+UXxTs6EkiUxlPYkoif1kpuLIOtPTNwM9N9qjs9udphauCT4DyT4mJN3t7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OhTB/rAx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2266807e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868645; x=1730473445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=OhTB/rAxSlK9XXUYM1OYQUCdI/bidx8s4kkD54bRq7tD/CpM0fuMuURXMSrluHls2/
         HxgHWn22+6QKvUWT72QTXNe9cNVed4yZ82ChW6k4YkhDWrM27JINRww9ldHPWKFOgTi2
         5oCmjdirMk1VmtnoqjHQfz+SxLkq2FlJnNsI8FJWm20QPfrhMP/pKSawiXkqmuyvz3AK
         qlmrvK3KIcGHOnMAkYDCsyrxY01ycf/IdY5xeom9YAq8xcttZS8S35+RxbIDT1bBU4Ue
         pssuR4kTQKWstLyx2HRU4M9u10OyjT4eScWial8kCyAMHpEMZ2KuP5d9HgHNAFPTlPlC
         dCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868645; x=1730473445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=OIDJAUlXMEEe7iOtoZ0cpmQ2zG3f39RoLmjsTYg0qNOGU7nThBS8eB2jHYY7W7KLBW
         q4HLdkG3rn+4PvHWk3Rxnq+oZmgLUjAq89Otjw+1Jr+0ayp9gdXiXlALBUOkfgQ+FsAW
         q4HaEvn3S7Y2aoLTFFiRfTYhObYyk/ACLdGAJzePZpF4jbFzkwklsF89GDP4ZSfXt0QM
         CBa2ILdkz1v3CaxOInF0CvKwXn9RvCylyVan8Cg7aZmZOaJeidyWnmuCOt/ZfM5ir+xS
         pN3C6sb4ch4Xwiy/dDhd5jxyUS1ZH+TlIz0+Udt5PKlP5Ff+cMGv0qxs4s4hQdlCzUkd
         wiFw==
X-Gm-Message-State: AOJu0YwUFrNvQBrFHg+OATHrx7k4dZhhtWYr/hw/j6DM62gh5EraqgGk
	nZQfo+msvSpO4fcL1GqLMXufecXDkhUurk0LIlYkUU41hJcZoTvThpoZB31ka8Q=
X-Google-Smtp-Source: AGHT+IGtY1qTkN15xcNE0g0BfiJop+L6FB6xIVMg1QDWDxk47fxYONTxiCffT+2S+uNDPx5qh5Mcew==
X-Received: by 2002:a05:6512:159d:b0:530:e323:b1d0 with SMTP id 2adb3069b0e04-53b1a2f4d2dmr5736485e87.9.1729868643167;
        Fri, 25 Oct 2024 08:04:03 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:04:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:03:39 +0300
Subject: [PATCH v3 05/11] dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-clocks-v3-5-48f1842fd156@linaro.org>
References: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
In-Reply-To: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3379;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=U8SwElc6O/aMG3Pi0A0hWuxY5S0AlYAxeI/Vjj5b5Qw=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NTltGGykly5DZ7ohu+6Sy0FnciNQ9ys7G1K
 I/GA3gowEuJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzUwAKCRAU23LtvoBl
 uAyBD/9n5aFPGXGGrvd4VTK+ArYu1hNwnakVHkgvI2tCYpiMs9PMPY2b97yCz94brmzscDLgDFP
 u6ggwrCA0eYoHy+0VQSAJO07Q5yqW/YvsUzBMnMUl68YWfWPnBjYMpASaFrA3jKyVPFshfi+aiU
 Vzmq7eZqna4h0hAELcg/12O+1U9eZ30BN3T0+VcvzOE1MfzQ0QZ8prDF9ky9Si3DyoA9Au041s3
 s6IQ+w6zL4fSKTbeAGUfGEPpvTcGoTl5nCradIVS107dYo8vBVxYGwWanikJlfItCPDabSidJp/
 svtlGGwMuvCLTbIxtYpXLBx0IcBN7YWIcQN57RScGpCmEdUML4ukD6xIPgWkEFBZvgaVkJJMZab
 erwxsDn5D98NSTFnIL0m5bSuSGENZFterU86YzanetFf/WYMHFGbukeQikceOqKDtmUIXCLId2w
 uqwf82PfZcv+d+xWX5tbZEMDNeGyExsvMKzMl4umIAxPQqyC6ejG0lItesV37/zQibbQnqXFj2l
 kO2xqXsaqVql3hh2VU13e56pKgxaIDn1jnRObMgU2yqprTE+1wipdeddJBStA64ghvkYYaEbkcI
 9/4WZzLtP6mrq3q0uOqwAhxu6KAuL7RtXapzgQGkMlH5sfaTy6sfhapPSCiz8nSNd2AZlmHLbAM
 n1FZbI9fxJr68Zw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Expand qcom,sm8450-gpucc bindings to include SAR2130P.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 ++
 include/dt-bindings/clock/qcom,sar2130p-gpucc.h    | 33 ++++++++++++++++++++++
 include/dt-bindings/reset/qcom,sar2130p-gpucc.h    | 14 +++++++++
 3 files changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index b9d29e4f65ded538c0ac8caae5acb541c9f01f41..5c65f5ecf0f387f30ae70a8f2b25d292f6092133 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
@@ -24,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
       - qcom,sm8475-gpucc
diff --git a/include/dt-bindings/clock/qcom,sar2130p-gpucc.h b/include/dt-bindings/clock/qcom,sar2130p-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..a2204369110a585394d175193dce8bf9f63439d2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sar2130p-gpucc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SAR2130P_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SAR2130P_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK				0
+#define GPU_CC_CRC_AHB_CLK			1
+#define GPU_CC_CX_FF_CLK			2
+#define GPU_CC_CX_GMU_CLK			3
+#define GPU_CC_CXO_AON_CLK			4
+#define GPU_CC_CXO_CLK				5
+#define GPU_CC_FF_CLK_SRC			6
+#define GPU_CC_GMU_CLK_SRC			7
+#define GPU_CC_GX_GMU_CLK			8
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		9
+#define GPU_CC_HUB_AON_CLK			10
+#define GPU_CC_HUB_CLK_SRC			11
+#define GPU_CC_HUB_CX_INT_CLK			12
+#define GPU_CC_MEMNOC_GFX_CLK			13
+#define GPU_CC_PLL0				14
+#define GPU_CC_PLL1				15
+#define GPU_CC_SLEEP_CLK			16
+
+/* GDSCs */
+#define GPU_GX_GDSC				0
+#define GPU_CX_GDSC				1
+
+#endif
diff --git a/include/dt-bindings/reset/qcom,sar2130p-gpucc.h b/include/dt-bindings/reset/qcom,sar2130p-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..99ba5f092e2a43fb7b7b2a9f78d9ac4ae0bfea18
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,sar2130p-gpucc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_RESET_QCOM_GPU_CC_SAR2130P_H
+#define _DT_BINDINGS_RESET_QCOM_GPU_CC_SAR2130P_H
+
+#define GPUCC_GPU_CC_GX_BCR			0
+#define GPUCC_GPU_CC_ACD_BCR			1
+#define GPUCC_GPU_CC_GX_ACD_IROOT_BCR		2
+
+#endif

-- 
2.39.5


