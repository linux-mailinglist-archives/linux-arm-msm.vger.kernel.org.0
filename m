Return-Path: <linux-arm-msm+bounces-63612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12670AF88FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D45B4A6A8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C71327A909;
	Fri,  4 Jul 2025 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iCW4CU+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079227A90A
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613441; cv=none; b=dKeEl0jBnI8+eWWSjCCXmfqJyvZ/oHPzAkMP8HFRhsurbdQNHKHkyCtPMNequwRZPLXFSq86VNI/1xOrduWLXMhxkhaYjCo7dCSjBZPUhaA/S7ji52tgoHxLhBA6HDL8ZAQAfoVwQ46c1r3Kt1bI/xzDFnHuedoc6sBysdMvUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613441; c=relaxed/simple;
	bh=t7mPf8uqahClXJVKF+hDnCgXFyphNbFRDnkpDdMylRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNVZ5tF4/Le7Ewai2UWgDk/UqkmLbHy7xdymkre76CAAlqdx6i7CrvkoX/BUBgdX5Q7BVV+BvlP7078KL4k3D25GOdH8MjlreAGqOnA4M9cwFNj781vltMvTiwh/Xk6UBFk6AJwvJMR1IPsGzjMLPTMEh9bvuD5kjKjfIWsoDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iCW4CU+r; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so3825990a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613437; x=1752218237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r10jbyYGoXaCHt6t2Nj/OZGD+eEusDL2onZb9S8TbO8=;
        b=iCW4CU+rFbyb5Rkd0f4YGaRsln6TMhDnL899U5zTIvJAwGBnJ75HEp8zTx/HgoFRWQ
         sErEFYT4BnZrUHq7JXo7u4DfN2Rk/eBIDpDioGxIX04Iv8KDHPb/047PEAQIKQk4I3m8
         6xykx8Nf78OcInjBlsK5jO1liX5xJiPDdmMBPAfw9LsXeUldYGtqYeEmU+MDCbEzSEoY
         ukYozKuAEbXkynKNQt1FtAOPhfa7lggOha1MtQsUji9m7ZlVCbQ8tWlDEpeSXq29yJs5
         zmb0H3MkIHsrgUucFyueYP7ecsP2VTEmfgmM7f3Ll0FM9drWD61R9EA+CDvQtXToOLzh
         4Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613437; x=1752218237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r10jbyYGoXaCHt6t2Nj/OZGD+eEusDL2onZb9S8TbO8=;
        b=bVgWNCT6W2msweP2duAIjJK3O89zFc8a9uSBl2MM+CBCNjNX8gc84i3SdPelxBWU7A
         l8wCDQBHL5POSIg29CiMs9gv5FUYDkopnP5BqwjCUbRg9Rjpm1snC1EmeeMJ6aR1fjU7
         jj1h25xDg69YJIJg71Ro7XSlvRpHMHGuo0WA3f8Qbi4n6Do5vDO496jg2exIFiVxTJ/x
         XFO4KQSmeJT13Ua2Ea/+KLlAgvwQIyIhPGwhgyGupOm5sr4p7iu9Zzdy6dD+R2KdszR7
         d+LAYjLo1QkFC4BXYvdXQTuR/MvNimxeWwZS4LQnnSyK7sGrAbzpFMamsXD8pYROeW2q
         mShA==
X-Forwarded-Encrypted: i=1; AJvYcCWm59YIF5w+CmBSczLaZSLY+A2Z2inEgiUa8sXazj2WE/1MEk//NAFyT1k1qvlJQMbLnPtkkJQ+73mM95is@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jfMKmi6TFeo0qGDEXwAQtA8hgUo2OQJ9XKe72Q26Ghesk+tr
	NmxUShT8zXqp4hrAoBUC7mQF4ThwnGg2gZ5gRF63Lb2crrpGoKWJmm4H2bQycJhaoIvThet4w/N
	e/Wsv
X-Gm-Gg: ASbGnct4ngzBmYE4sQ3xwSHe0RqU0tfUiXdSAmtXVFa0/7vUfdtIAh3VHMw5Q/pGLwG
	5/cE/Uply8xyaWEVBQ7BXUG58DwAAtNkCbP9TSUrdGJdCKt7AzqWPs95S1qpX62ehiROpwoQsuP
	OP/vaOwO0SH6TNqP23G/PG5IJhA1YL8app3PuFp3ZZOzM08fbEEXicxJYOh9Aj6XOkBugEDh9GC
	5bBlis+HvD2wEpjvxbv51hvxqKjiXoYMSGkRGkm01BV0vE+UxBj/xFjsMGtNra6ijbxYIzA4mBj
	GI8ajJ8k6G5fcPmtfKafNcBF0w8yHuEKzxO6//UCiQESpXb43y7PB/tS7MTekdCltlabJctfVhj
	sIm2S+hX0siZhzG66HhE/R+hAaVgMR3aN
X-Google-Smtp-Source: AGHT+IGKLu+ZcPIfOAS49Bop+bWMLALyO3lQJazVKZq/ku7P5yxBuqmElq9Zmi0aR2dMjcAyyVh5bg==
X-Received: by 2002:a17:907:1c07:b0:ae0:bf99:6c5d with SMTP id a640c23a62f3a-ae3f8355cc1mr188038066b.26.1751613436582;
        Fri, 04 Jul 2025 00:17:16 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:16:56 +0200
Subject: [PATCH v2 04/11] dt-bindings: clock: qcom: document the Milos
 Camera Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-4-9e47a7c0d47f@fairphone.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
In-Reply-To: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=6881;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=t7mPf8uqahClXJVKF+hDnCgXFyphNbFRDnkpDdMylRg=;
 b=O8bLzf10IQhIFAWR0P3RawOhMsYVe2wIl3FeuAx1A4/yXiylJ76q04d6gtbRGpCArUf8ix48F
 MdIIdnjrQs1AAT6RhUnoHXgU5UFseSqSWm9hlWrI+mmSBEZnJTXhHc/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Camera Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-camcc.yaml           |  51 ++++++++
 include/dt-bindings/clock/qcom,milos-camcc.h       | 131 +++++++++++++++++++++
 2 files changed, 182 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f63149ecf3e1b98e60dba27093737ec84b66a899
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on Milos.
+
+  See also: include/dt-bindings/clock/qcom,milos-camcc.h
+
+properties:
+  compatible:
+    const: qcom,milos-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Camera AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    clock-controller@adb0000 {
+        compatible = "qcom,milos-camcc";
+        reg = <0x0adb0000 0x40000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_CAMERA_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,milos-camcc.h b/include/dt-bindings/clock/qcom,milos-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..21925dca9a20c9525c3800885e2d1357ab7b4661
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-camcc.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_MILOS_H
+
+/* CAM_CC clocks */
+#define CAM_CC_PLL0						0
+#define CAM_CC_PLL0_OUT_EVEN					1
+#define CAM_CC_PLL0_OUT_ODD					2
+#define CAM_CC_PLL1						3
+#define CAM_CC_PLL1_OUT_EVEN					4
+#define CAM_CC_PLL2						5
+#define CAM_CC_PLL2_OUT_EVEN					6
+#define CAM_CC_PLL3						7
+#define CAM_CC_PLL3_OUT_EVEN					8
+#define CAM_CC_PLL4						9
+#define CAM_CC_PLL4_OUT_EVEN					10
+#define CAM_CC_PLL5						11
+#define CAM_CC_PLL5_OUT_EVEN					12
+#define CAM_CC_PLL6						13
+#define CAM_CC_PLL6_OUT_EVEN					14
+#define CAM_CC_BPS_AHB_CLK					15
+#define CAM_CC_BPS_AREG_CLK					16
+#define CAM_CC_BPS_CLK						17
+#define CAM_CC_BPS_CLK_SRC					18
+#define CAM_CC_CAMNOC_ATB_CLK					19
+#define CAM_CC_CAMNOC_AXI_CLK_SRC				20
+#define CAM_CC_CAMNOC_AXI_HF_CLK				21
+#define CAM_CC_CAMNOC_AXI_SF_CLK				22
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				23
+#define CAM_CC_CAMNOC_RT_AXI_CLK				24
+#define CAM_CC_CCI_0_CLK					25
+#define CAM_CC_CCI_0_CLK_SRC					26
+#define CAM_CC_CCI_1_CLK					27
+#define CAM_CC_CCI_1_CLK_SRC					28
+#define CAM_CC_CORE_AHB_CLK					29
+#define CAM_CC_CPAS_AHB_CLK					30
+#define CAM_CC_CPHY_RX_CLK_SRC					31
+#define CAM_CC_CRE_AHB_CLK					32
+#define CAM_CC_CRE_CLK						33
+#define CAM_CC_CRE_CLK_SRC					34
+#define CAM_CC_CSI0PHYTIMER_CLK					35
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				36
+#define CAM_CC_CSI1PHYTIMER_CLK					37
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				38
+#define CAM_CC_CSI2PHYTIMER_CLK					39
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				40
+#define CAM_CC_CSI3PHYTIMER_CLK					41
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				42
+#define CAM_CC_CSIPHY0_CLK					43
+#define CAM_CC_CSIPHY1_CLK					44
+#define CAM_CC_CSIPHY2_CLK					45
+#define CAM_CC_CSIPHY3_CLK					46
+#define CAM_CC_FAST_AHB_CLK_SRC					47
+#define CAM_CC_GDSC_CLK						48
+#define CAM_CC_ICP_ATB_CLK					49
+#define CAM_CC_ICP_CLK						50
+#define CAM_CC_ICP_CLK_SRC					51
+#define CAM_CC_ICP_CTI_CLK					52
+#define CAM_CC_ICP_TS_CLK					53
+#define CAM_CC_MCLK0_CLK					54
+#define CAM_CC_MCLK0_CLK_SRC					55
+#define CAM_CC_MCLK1_CLK					56
+#define CAM_CC_MCLK1_CLK_SRC					57
+#define CAM_CC_MCLK2_CLK					58
+#define CAM_CC_MCLK2_CLK_SRC					59
+#define CAM_CC_MCLK3_CLK					60
+#define CAM_CC_MCLK3_CLK_SRC					61
+#define CAM_CC_MCLK4_CLK					62
+#define CAM_CC_MCLK4_CLK_SRC					63
+#define CAM_CC_OPE_0_AHB_CLK					64
+#define CAM_CC_OPE_0_AREG_CLK					65
+#define CAM_CC_OPE_0_CLK					66
+#define CAM_CC_OPE_0_CLK_SRC					67
+#define CAM_CC_SLEEP_CLK					68
+#define CAM_CC_SLEEP_CLK_SRC					69
+#define CAM_CC_SLOW_AHB_CLK_SRC					70
+#define CAM_CC_SOC_AHB_CLK					71
+#define CAM_CC_SYS_TMR_CLK					72
+#define CAM_CC_TFE_0_AHB_CLK					73
+#define CAM_CC_TFE_0_CLK					74
+#define CAM_CC_TFE_0_CLK_SRC					75
+#define CAM_CC_TFE_0_CPHY_RX_CLK				76
+#define CAM_CC_TFE_0_CSID_CLK					77
+#define CAM_CC_TFE_0_CSID_CLK_SRC				78
+#define CAM_CC_TFE_1_AHB_CLK					79
+#define CAM_CC_TFE_1_CLK					80
+#define CAM_CC_TFE_1_CLK_SRC					81
+#define CAM_CC_TFE_1_CPHY_RX_CLK				82
+#define CAM_CC_TFE_1_CSID_CLK					83
+#define CAM_CC_TFE_1_CSID_CLK_SRC				84
+#define CAM_CC_TFE_2_AHB_CLK					85
+#define CAM_CC_TFE_2_CLK					86
+#define CAM_CC_TFE_2_CLK_SRC					87
+#define CAM_CC_TFE_2_CPHY_RX_CLK				88
+#define CAM_CC_TFE_2_CSID_CLK					89
+#define CAM_CC_TFE_2_CSID_CLK_SRC				90
+#define CAM_CC_TOP_SHIFT_CLK					91
+#define CAM_CC_XO_CLK_SRC					92
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_CAMNOC_BCR					1
+#define CAM_CC_CAMSS_TOP_BCR					2
+#define CAM_CC_CCI_0_BCR					3
+#define CAM_CC_CCI_1_BCR					4
+#define CAM_CC_CPAS_BCR						5
+#define CAM_CC_CRE_BCR						6
+#define CAM_CC_CSI0PHY_BCR					7
+#define CAM_CC_CSI1PHY_BCR					8
+#define CAM_CC_CSI2PHY_BCR					9
+#define CAM_CC_CSI3PHY_BCR					10
+#define CAM_CC_ICP_BCR						11
+#define CAM_CC_MCLK0_BCR					12
+#define CAM_CC_MCLK1_BCR					13
+#define CAM_CC_MCLK2_BCR					14
+#define CAM_CC_MCLK3_BCR					15
+#define CAM_CC_MCLK4_BCR					16
+#define CAM_CC_OPE_0_BCR					17
+#define CAM_CC_TFE_0_BCR					18
+#define CAM_CC_TFE_1_BCR					19
+#define CAM_CC_TFE_2_BCR					20
+
+/* CAM_CC power domains */
+#define CAM_CC_CAMSS_TOP_GDSC					0
+
+#endif

-- 
2.50.0


