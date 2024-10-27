Return-Path: <linux-arm-msm+bounces-36065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCF9B1BBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8627FB21084
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22B952F9B;
	Sun, 27 Oct 2024 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgi3mnhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90A51016
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992303; cv=none; b=E+XE53eHYJIZYiNUM4LlDSvu/5b7mGaKmkl/WtAYErVvu4ljMAckEGNIbYwvtA+pohcz1LC3AYVYBL3tUZndahNw6hUtP8fIQXFZB0CTzvu0JHlBunWlsIkedBPls+B7e7D87oeBBA6zmKu7gHz/RGgQfsbfxacFwUWxcJxNg9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992303; c=relaxed/simple;
	bh=doO/a916moGA8DWgcEw9MEXPijwB7ll6ZA8YQOQZTOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ez7PYvXeR4fT6ETJQLh7tgPKITq9HicEcUNLaDjRly/JNEfdR3ICeCpC2RuZ39y+eCC7IC5ABf0O8AcsQXHkedWDpR5kFfWQBBcwzGiUrNDmb/7UmDS7fabDBo8E1761KVYs+ApomTvjDA7yuOXpPKRCbwIwDgeqmB8ASnljc1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgi3mnhw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a097aa3daso2862951e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992299; x=1730597099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=wgi3mnhwVaPXPMA11+CAdu8rOTwW4wvScoeF82EaG5ECjwWrxXCu1wAHM0g/7xlWoA
         DHZNi5op3Q38ll6XdX4QoF4cXmuWZAn1OcF4OsExSRLDOjmS83ifv7JqhHfM+AQnIPTU
         d620Nfyjd304d8S1sNfVJQQ1Toewz3nm3qKuFDstSKEJaKeo1Qkl9IiNMQHHQAuO1k4d
         ceYjstRhUZRgYq0jvYPbvIxl2JhfgLmGoI+oJBT68ZCg8qn91Z46we9SdGBpLdVy7rQj
         0JrOmF19/yZowZbV/Mx1MfB+8jaxkjh+dQQBWQ4Vzhh4hZJNL+y+XJ/XoOXh+DfNN3Uf
         dizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992299; x=1730597099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=ialWrDfmQjBVOwazQIRyKEoC5dwCxfL/S7OThKpKEkNtIGfDcxYUU6A1DdneiFe6J+
         B/cbn5K/d4KJDrInLZMEl4E8xBpsAMPmxjEvZkPwVG5SSvw9sCvyhTj+B/2Kz548Hc8l
         FyxGTOnf5cX6gYIzjmNcwSvQ649keitYP2W7z1qZOfCRj1iaDTVq/nR45YRYZXRAU+9u
         VeJGE1Wj+KC+ezQycmh/qw0PgPXKKKJqD8Hc8g/ze7MMnNMBVFpJWA/XGzGs5Kuqq8HG
         +tnbUEifJ3xgwEvl2gCXvoZ83U/4h9vABi6mlq0GHVuY/4f0lQD+a2PJsOdJYYIm+0eF
         +cdg==
X-Gm-Message-State: AOJu0YxyvEFzolvG8cIAmT4yazoD8u+P9Z70tELjVhztWr8Pkqc+Rr38
	tFYYTFURr2k0pxPYxKWszOZ9TXPSp4ypg89R+3cyuSDx/Hm4qmDi+v+rpGS+7l8=
X-Google-Smtp-Source: AGHT+IHsRVPjD/E11Uqr+cMEgM8u/M/dTdtwe+rvBcQsOJV7ru3n6v2GsksLlTiX5Eng0AmMi16bVw==
X-Received: by 2002:a05:6512:3f14:b0:535:6942:29ea with SMTP id 2adb3069b0e04-53b348bc297mr1299188e87.11.1729992299403;
        Sat, 26 Oct 2024 18:24:59 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:44 +0200
Subject: [PATCH v5 05/11] dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-5-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
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
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZgsQbsVKVjdFCTdM6nFZD57lWnH/Q151qhG
 lFdcmwBuaWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WYAAKCRAU23LtvoBl
 uJftD/sFD3xVTR2/ZACrmsKC1XdHKc/GkKSRW1wDnWkhYuAsCZKI7wXxxd2Or/E3fHAPnYOWXl2
 4jYgp4jwUVYnpe1G0C1Q16FuUS+0UhdNm8Oq8fa9R/djnUY8/bo8eWk8S9citK7zsGRCBKNMFjH
 ww/mvv3bAhBaay1enIzhIpJTgH82ZmneB5YLkY38KudG/ci3LASMrL93kSACrX00176vD5BhW+H
 pl03383aFXaf5VZE7GXESyRwHOU7PWRR+aFY1+W9viy18hpcEnRxk4HEjpW/RePaDTeqcRST9fq
 uh8v9261iaycNk0F0w24c+P5EZbnxQ7jY8PQRJYYuxAzhCn/ZMv2Cly1j2xXsZOooyJOv7YrR9g
 dsaA9NPFbtW2vgd23yTm4fNVf7KtA/stSfsZVWviek5RfKVVekFJu9OQKZWGhMQVu0u0KI2wFmA
 kfTcwOMKw3A3uefOkWuUkyQwXIasNcAkMJ7v0Dd2UqG+tcAFWsBN80zrwa41MfIYHxC/M9gpWti
 T9qnw+NzfAj+5zlaQWWYDPk1pEHM1UG8pZcifcGDW1BfrE+E0CZzYc8qPOtpUsatRkvLTKUTbt9
 dY1IKraJ9ojo+VG6q/pMUPQv/0uaBO2+8x64ZV23rTl6yjVqnY/h2PVh4Norlob2+qeDtKCLzVm
 7LIpi+lXsYEClkw==
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


