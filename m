Return-Path: <linux-arm-msm+bounces-36025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921C9B1973
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5F71F22215
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5F11D7E26;
	Sat, 26 Oct 2024 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/nks01r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F451D6199
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957638; cv=none; b=FXKEJkrnumNGPPaNYEvENVqaW+XuWt8LJss2ynwxEB72Ooz1x4C4B0mvqqZuKddAMWVzdUvj545zlU/p10c4cw1KdR67mMYdb4wEhTI+qzG0w2qZsjXeoA4Hrz6gPC65U5mb6oUIXls++7OxW57PMmzUHpaiucGvJJ/yF7v6SmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957638; c=relaxed/simple;
	bh=doO/a916moGA8DWgcEw9MEXPijwB7ll6ZA8YQOQZTOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grvVl826MZiJkMMlha2Osvu0O72BI6zxrSFq2l9ZSU1B+OJmEVmcdBKoi01hRgBNa5Tww6drkPRePZ2Q4JoMMMqgHUIEr8SRTKcn34GZdjRrx0idlVg2/UNVOXh1U9lCvjWdZc5yqr4Bn7kAQv/x+opOASl49KW7B1kkGhiRBnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/nks01r; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3377360e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957634; x=1730562434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=I/nks01rt4uKqm9ujGRN7tIVYMXJFHT0fihzBj3aawH58WwcXkZC9o5wy6lqEXrQ47
         BJ+00zEJVlXBhR42BlsxPtcsGrbEF89hcIXBBZdv55OPm2BV25iCTjEmOHnMpZrARZHl
         m7InZ9rHCILYBYQ1aRmv81OP9Lyi0QRBgy3NAH4L16h5h4DIrHpJ5K4K5xgzbChaz2ip
         cR8RTdicwdpUBy5m18qBxFhFHVIiBbJvmTnBc6q0yNMoW4OIBhWrcKIFMJbLLdDWndEU
         ZskZQJhfJQjfR1+GiZJ9z3D/dLzy4iOhakeZRPC/ig3jPLUaGXGI6ickmOZFdRoXN1aH
         7y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957634; x=1730562434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=MZkm8lY2EfZQAz961n8fpiG/3b9a12j406jtAK6ib8wE9OqGRbB1VgHYtvklopmwwd
         tDQ70S4SxR5RJKfbXWJTZYhoW68uwQAafOa1INxvy6whCcTRHPpwdqDuBej8OJjJwfD/
         uahDG95NQhxCIzq05bRfOMWPphlzdC91vNqTbwNeF/3Y018C5XE+MGgSQQOTTcBekknH
         oa4cw9v5NfouGbtVSaDejZ3vgWXsUW/XjzJXqvU+IQBlJAZses0FVlJWohLX3yV7RMhF
         GjAUbguOtanPhbVf5yl/z1KRgNft2pAnGw4z67QpNJiR96sB7K3j28PRBCSaB+O17yTH
         HtBw==
X-Gm-Message-State: AOJu0Yy2LnVpgCWAwBMQjs/jjAzTI3NZbuS7HfNTWbNbzfe7bflEsk6o
	wBpLFfRpXsOiviA9wLSunZ1+DSxvyCj0in8ECCr5+We0E7AdnzZPgUBnNoSUQlY=
X-Google-Smtp-Source: AGHT+IExMTwc2jTz/5yXV/5dGn+or8rSg/sckS6KeLN5yxU3nkuHgmWDOmFPRL84ysfpl81AyMn87A==
X-Received: by 2002:a05:6512:318d:b0:539:f65b:401 with SMTP id 2adb3069b0e04-53b34c463d9mr903885e87.57.1729957634384;
        Sat, 26 Oct 2024 08:47:14 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7cf4sm532188e87.184.2024.10.26.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:47:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 18:47:03 +0300
Subject: [PATCH v4 05/11] dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-sar2130p-clocks-v4-5-37100d40fadc@linaro.org>
References: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
In-Reply-To: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
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
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ73wf+2XaraKbcpddGfJTvt+qMC231yarFzI
 MOKrPI+1oCJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0O9wAKCRAU23LtvoBl
 uKnEEAC2FgG1oWLGXVi5s+pt9FVUYcleKOsm7F+xtrqocWbj4FnYfR08EYdKb40qiXEE2g+Hw0u
 SPJIrbXeiojLv4/oXe9DA8ZWk2IQF4wkqLgx8cU2etwNNBS077/Pie2sLMhYjdpU5TEX7CLj9d0
 ByTX2VwR/h/rVXOivo6k3JrksbQAhVhkwG8s+OLG9D3A3VtIt2wnFlso2D6yY8rog/5IwrlHjy/
 rOnos48D+1wes3UtyEn84ZBmI+yi2XgE92V+RiX84J78J5qXqRddQM47qKJTywhYBfnvBdMaMX+
 mT5VEb94oepTmCA97Sp6lfS8MaVr42YzqLJH4IktPLyiuUySWd5vXYyUdBRFvytnhtmmpYu1sGu
 U++A2MSAkHLr5ACC8Jhlu0JOxVHjG//tnq+cOXMw1dtq8nUuBxX5MV9lqx/njKZZB/KWQJ97y/U
 4L/n62q5ds9Ucxg6INZ1zmnZg9DpeJD3A5P+Kry9PdGjmi9SlYZbYwHBSeScV/DgD4+p6cfiJ9T
 dG8akoV678RgJOWvV1xi2JS4JMf6R0Gri+I7SlLC3A3Djjqmx4LBh9hettJOYxUVCFgbjPnLofu
 5oNIfXARMKGDO7xGymPKRwgrtUu0DiC0EfXgAx0saWYfBZNvQOakmoE5rKaWmTWKcUmqj4fzAh7
 0h5cxoJgL4hdgQQ==
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


