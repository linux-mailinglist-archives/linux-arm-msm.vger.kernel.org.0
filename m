Return-Path: <linux-arm-msm+bounces-64940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE796B052CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BC84E422A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFF82D8779;
	Tue, 15 Jul 2025 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QKCdeKuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E66275B03
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563969; cv=none; b=GH2nZnnjao24OfJbCkLkViBRM95loC8285hr7EHcRKaLP/i+f+dN53ggFOIlvSBisp+m7ukysTxG27/G+d8Ne4MtoIRNNvhVFDMEDjj7JLAq/ka5N+PGVvioW0MUV0/R4E9XA0warU7n88udn8RdOUP+d6okC4yHXGdzN0VkLOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563969; c=relaxed/simple;
	bh=VwfqHpso1OiiAuM6DJpcct+RzKRoptkbJ13YmmDEfKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7LveLxnZxXrETax+jpRbHyQ9fxY5IFq0Mf0ZCO+atU0wLNJHWtTNCCBlr+vBlSOeB81/oouMD0zHfSFKa3KUeVh/W5hr0yZaQI8W85tK08CrwuT8ucVzRLG4mAdueStW0fc1oK51Kls603b7NOHsbW0t+Tf8Uqu/P81b2wVsGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QKCdeKuu; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso9972373a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563963; x=1753168763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebfTDkzvLDE5Yl15rpM3HQGy6bi4xkSd/6v+gonqIYk=;
        b=QKCdeKuuzotPPCj5KDzkusXsnAtpRpwUCYrJTga9tmAmxzef+mFeYMcJ4ziPXpPM9w
         eHhrKtzx+lS8kbQU9XNGhPvbLTpHxpEGqE9lh7IQZ7EJ3w4zHaMOuQVO/Qcct4x2LY9U
         LUuOjl8qbkQASOEqceDpRH8SIPJi1p10k8nSkBSDW7iC3FoAuAyrq2x6NEHJSn+D9pzW
         PgMZ7qFI6ZsNEHnbB2NNTXglrj+vXYz/aQLrH2XCwcgmT/XUqA9eRywWRiOsWHPZkyQh
         fuvrkiJjbHcNVdH/LP1wx5XrPaBZkyl+i9u1208u/YpXDh7IKKyIGxrsQuFEorEm6+6d
         6wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563963; x=1753168763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebfTDkzvLDE5Yl15rpM3HQGy6bi4xkSd/6v+gonqIYk=;
        b=VJUBjhrT2K9aw02eMRr+bJjcsD/4A9mi8GOBHNciHg9SU+ir3Ctym9o1Bgg1cfqv7w
         kxIx+kUGxYcJFViYA20YD758TCUiG9PQC1vx1J2LwCOG2o3fMq2/YGmqkzFn4Jfz41hY
         WjmGkyzWHTjm2Oei1x5gGKk2iYr8U/KrmbRn0/MajbxvlSbimJHmqc/H10XgDUljajhj
         qKHOYKEazMVe34IxD2YvifyXEHVEyxaoBrI3Hd3Kh6ieoalYjAIdRPj7P3PWD/97E06F
         lCR/aP9FIERJn40LH+29KVKih3s4lOjDqZNb+Q5GyCUT4g8jHig/7QK7x/u2x1pg1t1I
         Br2A==
X-Forwarded-Encrypted: i=1; AJvYcCXY/XV9nhLeO43hhmQNdxyEYNBWBj+78rK4kqMF0RMG+Mj3F7wnm6SmGWBBnSa3wQWcTfkDImFaWHA46zXi@vger.kernel.org
X-Gm-Message-State: AOJu0YxyysSyJGok2pipmjxa7rijuXCZdt+5Qvuosgk/niQAsS4pjmRd
	XW8pLVfV291+QdjHJc/5fd1gvRkE44xZIsT4sE8qMUIznzikB7Gwete1CC7HJ1BA3+E=
X-Gm-Gg: ASbGncuPMUQ4Ozy846cZxMjU4HEujSyO94tVas+Djd8S59XKSp6WeXW51LyZUQudLNU
	x9OqGz8/kXm+GTFK+JatnUMDTXPbTUomdAy+mjCMLZAG9nhOlREVv42JZPgW7eheka18fYxxB+Y
	aKsi6ydISfnUnrlQHrXj6qKJGC0gJPc7rqskhPk9Km6RcnC5WpbxROfBb+aHdiyl/kY7ALqvL4K
	7HDoA8e/cWr9B0b/ONhMZgZvsn8Sf7YvfjwTPAqvqCPNakQB7W+Hl+61lxEzLNsDNuVqny4iI9r
	HVToeHzPKJYR647zRp77yCuOV1QgBHK+z2p/mSUbe1JHbKBFcJFTm5JPqbIOTZFSI65TS4lH32T
	LUsTGlnSwkoEIMWkaoqjZeOB3+XQey+vkrhIG4RaP9OBVK6imc8mjgd/uW8pTw4Uguog=
X-Google-Smtp-Source: AGHT+IEzpO8yKzIUGGcqpv4AyMmLOO1LD+6dixvbi6e7JoxzmvCMWqqgGXUWVssoCXhI7a8Q2toY+g==
X-Received: by 2002:a05:6402:51cf:b0:612:3d0c:a728 with SMTP id 4fb4d7f45d1cf-6123d0cacb0mr5469396a12.12.1752563963165;
        Tue, 15 Jul 2025 00:19:23 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:19:06 +0200
Subject: [PATCH v3 06/11] dt-bindings: clock: qcom: document the Milos
 Display Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-clocks-v3-6-18f9faac4984@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=5229;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VwfqHpso1OiiAuM6DJpcct+RzKRoptkbJ13YmmDEfKc=;
 b=c3lyzuLhuyT7u6O7LbLbOaKmyQ/j6fC4TJ3WvxMwxlfjFw0nie4El1Y+0sbnOoRII1w+nRQ1B
 LfPnfuVjsQZATWWns6vTx+MRAOIIgC6YL6oo6G4IHS2MORyCERClw4x
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Display Clock
Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-dispcc.yaml          | 63 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,milos-dispcc.h      | 61 +++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..94908804756b29bab228fd539c365945bd6b401a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on Milos.
+
+  See also: include/dt-bindings/clock/qcom,milos-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,milos-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Display's AHB clock
+      - description: GPLL0 source from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    clock-controller@af00000 {
+        compatible = "qcom,milos-dispcc";
+        reg = <0x0af00000 0x20000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+                 <&mdss_dsi0_phy 0>,
+                 <&mdss_dsi0_phy 1>,
+                 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,milos-dispcc.h b/include/dt-bindings/clock/qcom,milos-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c70f23f32f0ad637b25244d2bed1f17cdeffd69c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-dispcc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_MILOS_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_MDSS_ACCU_CLK					1
+#define DISP_CC_MDSS_AHB1_CLK					2
+#define DISP_CC_MDSS_AHB_CLK					3
+#define DISP_CC_MDSS_AHB_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_CLK					5
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				6
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				7
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				8
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				9
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				10
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				11
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				12
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				13
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			14
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			15
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				16
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			17
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				18
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			19
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		20
+#define DISP_CC_MDSS_ESC0_CLK					21
+#define DISP_CC_MDSS_ESC0_CLK_SRC				22
+#define DISP_CC_MDSS_MDP1_CLK					23
+#define DISP_CC_MDSS_MDP_CLK					24
+#define DISP_CC_MDSS_MDP_CLK_SRC				25
+#define DISP_CC_MDSS_MDP_LUT1_CLK				26
+#define DISP_CC_MDSS_MDP_LUT_CLK				27
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				28
+#define DISP_CC_MDSS_PCLK0_CLK					29
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				30
+#define DISP_CC_MDSS_RSCC_AHB_CLK				31
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				32
+#define DISP_CC_MDSS_VSYNC1_CLK					33
+#define DISP_CC_MDSS_VSYNC_CLK					34
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				35
+#define DISP_CC_SLEEP_CLK					36
+#define DISP_CC_SLEEP_CLK_SRC					37
+#define DISP_CC_XO_CLK						38
+#define DISP_CC_XO_CLK_SRC					39
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+#endif

-- 
2.50.1


