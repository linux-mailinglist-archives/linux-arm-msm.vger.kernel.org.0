Return-Path: <linux-arm-msm+bounces-35204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 815699A6334
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A207A1C21FAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7411E8838;
	Mon, 21 Oct 2024 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h1/RFOCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8735D1E6DFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506656; cv=none; b=YzcfCgJ+Vz8lM7nin399md1gjfPqMSvyoumbHrDxIoonbo3/r8PDko6eUKOyV9S60qdCa30O1H1q7bMWDMUiOcUfB5XMcMXuW2J41HtGQRxqA94+Uj80dmEDJEW5SkHjbu9dLZa0cUTZKxuUgJyvTJKWmdHtHuEi9JVkWvKeYyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506656; c=relaxed/simple;
	bh=doO/a916moGA8DWgcEw9MEXPijwB7ll6ZA8YQOQZTOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oB5vyXNi1GqezPGEREZxUwg3dt/CF7zTOEwqxZz1pxMgqN54p+ff+Y3rVlRv+gDFecq6PJGsrT8EVtfmDEB7c4PI9zNnYBNsy6gqI+El4WNVERkfMYaxiMlXdTEYZu2LEewpsmjGAt0QCPXKbUBUwnjY6whlOFONI0xomqfZmNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h1/RFOCz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso42406551fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506652; x=1730111452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=h1/RFOCzbxynFRqfP5K+3z7c3B1YMoPStuInpTzE9lq1jAr9IDV9kOqVo48KNkYXSM
         yRNBq6BbPunQBKwBjyyaxHCnFRY+2ZQ7rOO5GRXjg9UdfPjgAxN7sESXvkU5U5bQGW5K
         jelSMWCfRx+0cou3/TvcfJN4uiHqzrXUg2nnPPOMfJAGJurlPjv172idU3B4oYkEavYn
         TDTYVG0jzZynYkhgoXUyZDyusMnOyvmTr5efuXUWp7hnYSjH/QVHoLm4HMJ1PgXiM5JQ
         DnuzTnaGueNS8WWn9uu5y52a/iW9ubdKqY7M4viVDrXlvYsRapDWIr0nrDLqsZUXWKyn
         oP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506652; x=1730111452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et/ChhQ8OUXatHb7KnUo7g0jzZYAGHhogo25hpK7iKY=;
        b=LL/q6WAZH6yuGN+9t17HESFJZqVx+K0x4eGuobcKsfpW6sG0zM8HA0oZVZSkIS+vRX
         cLEeJL3GmYv82mSubnowi7pN99A6Y10LFOSW1dRDPd1JP7AZwjN9noQdUy0y68Zfk6xZ
         wZ6heSwmyC4ceO1lA0v9W5pRCd6em5cIlfSSdRU3IHX3iLpxEEPxAPBIC/TLdLcUZ6MY
         gyA+fWld3I6YeNWqIjKNISU8eq26tjZ0XL2XjQyJtojNS8CGKafnKMRE/U++Xo5g60Cx
         WzSc7Y8ZhhmH5FTje3sVYpA4lp1ko1OaJxPLFj7LZhFFgHBOfEUead+2/NDsxKlQRiPf
         jujQ==
X-Gm-Message-State: AOJu0YwhEiDj1GN9JMlHYVw8h6QVIfSNH/eWKtbFkC7S8K8Cm+x1bOr6
	/rMjHqRKYqzOBIdZZONkWdUyke6jTH/2d6njyDl7/JhI9S9LLzROsv6uekbabId7TanPf4qngf4
	jO90=
X-Google-Smtp-Source: AGHT+IFnXVc3zww/9Bwgx01ER/80V7b+Hc49LFcqeghffWPhxleFU/Gsp8YDNT3SBRkWm4gbuB4jDQ==
X-Received: by 2002:a2e:a58a:0:b0:2fb:8774:4412 with SMTP id 38308e7fff4ca-2fb87744ebamr37617711fa.24.1729506652515;
        Mon, 21 Oct 2024 03:30:52 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1217bsm4522711fa.112.2024.10.21.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:30:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:30:33 +0300
Subject: [PATCH v2 05/11] dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-clocks-v2-5-383e5eb123a2@linaro.org>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
In-Reply-To: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3379;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=U8SwElc6O/aMG3Pi0A0hWuxY5S0AlYAxeI/Vjj5b5Qw=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi1L/h8pidXOrdbdTp2rabjVoe4fKBc4k0O+V
 HCNo87DkbuJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYtSwAKCRAU23LtvoBl
 uCOtD/9ZpX5OqfpNXWnpqzt7yAhpvutOp5A4EKNXyBT63syo3Ua0OhWmoTQBqdN9LoUwK7ABmSl
 /USS1alZlabbl0Er6KXv14lApaopc8rZWZ+6vnT+onBtWvClqWdvIXWxTS0r3aq2UBR8ALSbrx2
 FrAfOXLyyrIhyRgwK2dnJF030Xt29A6KgdeKG4AWVfJoO+zZEr7WXbnf+43UoFz9wK3PGZPovpr
 Xu5ZrUoPcARN+47obtgC86EWzSSYeFE8lftyPHlLQvzdG8N5u0S3sU4NPT/KqbsNIxamYEGm+Ic
 LdRV1Q8rVXh1INKaGcuI3JI49Y5yem165E0KYu/Hm0B1EvYuCyEjqlrFQcKOJge5Qzbp9pEPFAx
 8ZW8xpitkxrusgmJl0AZwvZpIKZgova8rz86GTaw3705quDcE/qJU2RfHISBes3d8XQQLCYIcbC
 d/dskYsuPk9hiReK3Zodb1yatArWROdgp1hRLbYQni+SCbEZ9eeYYgzpuNhYjEsMbCobHscC0al
 hFuploI1r6nRJA3gfNeOUdp3BMGg2iDQZ6GBHWoyDWrzbDqNqQugbefGYH6UU9Jsqh6p36MGgSJ
 ZHCR17SBenMqbhB7w9mhAKtuB0xzU3aUrYKDKRjfzeWKJUla+lzvQf0hzVLT26Hnps1+ejF+ei/
 ZHpj+jnGNSyVZRw==
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


