Return-Path: <linux-arm-msm+bounces-64939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A553B052D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7931881C52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70B8272806;
	Tue, 15 Jul 2025 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yoSKjm9r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0127603A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563965; cv=none; b=Wbrb5/1rXto1Ntbg2T/fLHZAdAjHhp+vCfK8GY7lYmzN8yo8Snt23HYFPOMD79wotNL3QfQZwIlG6sLg8WHkS71cDqXDxB+RXQ2EitvriFys+ICafFlCZPMQF7/PNPU+SRzaCsevpKJLMWy+EnJHX4x+UXK+POWyCM/B/thJw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563965; c=relaxed/simple;
	bh=CtlJuptn1iL4IKBp0RtnlJ33d5bOL7hNwbE9KGg32hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tl6At54hetAyQEwL3sLV9KyjrkrwncswHBloCiBqEOjxqUcPP/TteGwbvpDXWXxmCNmgSJS5Y/FxZFKtWshyiLyPFcnHcWPGAjvnmMahbN4y9F20jOtdB4WSNrbbKgW9bCRvYPQ1dXfgm/PZACcnHPJH9HHqPK77gX+sOg10F7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yoSKjm9r; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so7823136a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563960; x=1753168760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Elg4FLgRXQQbbxiu3aQgurp8VMDU0VAh8zp0Pr6xRrE=;
        b=yoSKjm9rG5eHUY5CrsG+2WoKdkO/9yAOHIcRG2oNYCXrvNoTffAeYAfs76fa+UhNfu
         qx9JaxaIcZW0PWvUbTxkgsRVYVOe8nwGEeEmZ8MPuEQh0yj8ndQEiZlafI5GnrxdlD5g
         oZkhsE88CjRAfV55BpSXccWZ3L5+OVTm92w66L9W4dDEF9+shNhRuk6ZABdqEHXYfScU
         0K59Ykhiaxz6HZECMT4CJlZISsqNQkHawsxLJTiAaYF0lRbk2HlUQzq7b23tzXkzCZfp
         6KOMfkVWaeNeNv6VP3PpFyzB5yWrolp5PtIRcGbzozYfi+u8+Tctt8w4CXfrOtgPEdZJ
         hzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563960; x=1753168760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Elg4FLgRXQQbbxiu3aQgurp8VMDU0VAh8zp0Pr6xRrE=;
        b=NJY1K6Yunc/AFvr+C4HweS0YXUm1EcQtxsGCTzbyxuW5VcUsupMjmSLnh4/7GX5ePS
         GXDqCncLImKHE/7a9Ox7QuUxwgpm0vcCQ0vgaO8M9lgQ1WVwY98NvH7z351fOI5rHSAH
         jpRieA4HP+ytsYMecGzdpZTsT1933aUWiUdQ4biJkHzrAVjngUHFMrys2sP2JTlkjnPU
         G+3cW96uIUbJQwvtV1eTiGMUc8YOzszmJjz/HfL9C/Mkm008za+bCvZTsSVWiIupXBwV
         JIjudqkvldZ+j05AHa2lKFJNGP9WMUwUijUd7wNkaL7fgF2TZZ7Yww8Mf9hv1t68sMhD
         i2fg==
X-Forwarded-Encrypted: i=1; AJvYcCXbDbhd+jvRK0SQU0xRrgN31Tt7seClJNu3TYHp7QG/HEZsMb7Q40WqvuH40pwsIpuoBQWHcUr0JySTKYYS@vger.kernel.org
X-Gm-Message-State: AOJu0YzXayiHqn97GLsG7DzVYorkeQ6aO0OUN2yS9oQeJa7p4ajMKW5K
	kLAPpUnE7hem/ZjIedBBtyj0dONfv48LIHsizVyvNNKVUeVo8gV4p2/UxtJdz9wcJPU=
X-Gm-Gg: ASbGnctIwQWOfCSxpuvRfYTTjD5fjUVkeAYDfo3g9QHf70sUfKTbF8scBYHlFsw1TJW
	qxX6D2IZSRORvJhlhOmMaQ+740eiKd4L/1Q3g1ZsqhL/eYrBVnHUOgBYehc+MALfo69gqcQykgW
	DKdPQpRYozZfClbat70bFj2hqIvX1dGlwE/0VKEhO5uyADn+1yMIBv2fkA/r0xEYtRoe0vhBq97
	SD7bxTey+0z76rZz0VadjIXCAqrUlWIK6HeVtip1bwWMw1lQcri4cfXtL9AFqLctgKU891swttP
	/bDUAOGvMjfNfVNoemyD/PHnN8mkGzpj0O34vSjoKFU2fV4lSVtcKRW887xwaw0RrC4mX+oulg6
	XhFNvyc0NAijTmOBDLS8kpvLCRSrCgnRgonOWqqOc4jd3J9ThZU2UtHoI
X-Google-Smtp-Source: AGHT+IHwifhTTMNtst73yrck3jQLdM0eBYspiEOGN9kQIJsXdaux1M0kB4WKiXb0CgqiPDeQZyMpZg==
X-Received: by 2002:a05:6402:909:b0:609:9115:60f8 with SMTP id 4fb4d7f45d1cf-611e847f9e0mr12887313a12.21.1752563959742;
        Tue, 15 Jul 2025 00:19:19 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:19:04 +0200
Subject: [PATCH v3 04/11] dt-bindings: clock: qcom: document the Milos
 Camera Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-clocks-v3-4-18f9faac4984@fairphone.com>
References: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
In-Reply-To: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=6948;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=CtlJuptn1iL4IKBp0RtnlJ33d5bOL7hNwbE9KGg32hU=;
 b=AjNYOuq7bNFCFQfTRhkyoPaakLnKf9M0GisflI0r5v7+Jg+IMTRYDS1v3b2d48al7Q2NOGXe2
 XiR6eNijeZHCmwpg3b2hrOO7D8uwmxUKQXsH0xno1xWD5xEOmIolPGp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Camera Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.50.1


