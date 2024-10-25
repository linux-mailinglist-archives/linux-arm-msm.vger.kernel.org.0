Return-Path: <linux-arm-msm+bounces-35895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1F9B0719
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A441F215B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C039520BB2F;
	Fri, 25 Oct 2024 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q6NzFwWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BCA202648
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868643; cv=none; b=Won4IyGIrIiwEitVxGj3CRjf8mYJHTmAP9JeTow680UEkVuFabB2HeMY0L8N7i/krO/fuYyXfwb/rJ3Kmm+iEcmwLGuwDWhPv6Z7+GJTm9Uzo8qygzvZ/VxuSSW7yyUfphgOF7OTqbrG0sX+WrRjoDc87WFWVHwyRj0Prz7V5Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868643; c=relaxed/simple;
	bh=K6SFWYrpwEdGXfbTRxIp+bUuYSEnFHhS7eK1DCdiKpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXt0b+BrsDG2VoaBAEp2D39o91aEOAGgwEF/rQaEWkGeVGB+y4oQpItNiMgBOv7Qmy1BTbTu8tHXfypcm4scNlUYqMKaYIp1k4/O4TYlaxW9n9Zodx/1PFYVn3+IW/l48T9IHqlRLjv/QOQTyt5OE8Q4b2lQRxPj5bn4eDglDyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q6NzFwWV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f7606199so2716535e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868638; x=1730473438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/ubzKFzAkEIzZOSQ0IepYs8ZlZr4pPSGALUzhJEXK0=;
        b=Q6NzFwWVwk9AvzmvWI3uOLeaLXnf+TYb7LrgdhTVTAwDHco9NYG3Xni2fUoW3y2YoZ
         4yCD10ErQNqXPfoHMAGeV+wLq0Yn4DRljfw2A1hQldBAEgRfm+OxKr9jpY0otDKMDSwu
         TegJIDmPE84TADrIW4UJx39I6WnXMiEJeB//CUBY2/pF/ZP6uyeFdyHpbg7RCqSP28Id
         uT8VC+Kr9Pl1qwtPjPgXp5GHNeXxdqMpn1JEExs6mskVE8sBf93uCyKeB+Zel2Y11iAP
         EonZ1MePCBiwFfpgCzBqM1Vf3+8CVD9KdIkdh/0ygT2g9hXNzTILfg3IW01giZxafd4U
         q7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868638; x=1730473438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/ubzKFzAkEIzZOSQ0IepYs8ZlZr4pPSGALUzhJEXK0=;
        b=C5u/TO+Xpdpc7zT5HbQ2r//lkhjeQ8Q/SuVD9aD2Ozf83luUnKVHx7X/uvbzsW5QNf
         TRdj11bMBpyar8vH3goFBawCtGi19nAZmG7c5Z5NBLBfwkxtHZ3uOqBHGGNm16qafBjG
         uG9qqPwnDb5t2KQkUZifmh+7b6KQxObJNhHy4+TQCBgG9FLjkrJfOzuRweCUmeLa63BR
         ahlbpqugJDAnj0/T7I27i9a6b+AE9snKUMBM27eXQtXb6ins+U2zP+fomyHyC+87QyCh
         hMp9ByzvZPbQ0O/Qhhg1OkNCCDH9KZTsaRFbu0qgv5mrWpSbA7/htoLQri+nGicMpxZn
         LFkQ==
X-Gm-Message-State: AOJu0YwDAe9TUt6UcMGJp6bS0VLVEmXSmSGyQT5XDq5BTjiWvtUt5HS8
	SWbXmtyMxsccf8GXG4n/nQd/tqrDTd0ZFihIP1uhsEHmTFXK3xaGdcgktIAm7EU=
X-Google-Smtp-Source: AGHT+IE9AHEDymC0PuikF4ZjHPnT6dSZTcZjCP5aRXzFak1348j3YbAorryC2K2ViIx29EuLVOcctg==
X-Received: by 2002:a05:6512:15a3:b0:539:8d67:1b1b with SMTP id 2adb3069b0e04-53b1a31db7amr5896771e87.26.1729868637710;
        Fri, 25 Oct 2024 08:03:57 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:03:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:03:36 +0300
Subject: [PATCH v3 02/11] dt-bindings: clock: qcom: document SAR2130P
 Global Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-clocks-v3-2-48f1842fd156@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9806;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=K6SFWYrpwEdGXfbTRxIp+bUuYSEnFHhS7eK1DCdiKpQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NS/grSQp1uWK4XeOQ0HsiMtFRjpyv0pUTOp
 X973/7zx5mJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzUgAKCRAU23LtvoBl
 uDT7D/9CfywPSPhcamqAggS3yZHFHarRTwGEQMUSzJf7SB0hBFUJNNvpkjqssICN3TryeMxdh7L
 x8MZBxGTMHHoXlplepRvXnI8D1EXC311h3vqLE7rIqUhfFlnlE+b2p+CDlf4mBlb9LGOieXAS6B
 dv73PZQripNX0BngC4PBX6QfQ3Dngecok7UIbd3jL9mWiYX9IETXg1y4v0D1hPHb5liLvYLDPdV
 2WBdcE3nB4RszL1giLRRGZkUSXt1f4XpkisHVUcX13BsfcAQmEBIGzpy3Ru1U+Pi9sPLC1hRfam
 uuslRPRFhFE3lfyv2dyNTb0EzITa9HYjpU3rlp6HTwdQunbwg7HDS2NW+sfUjRC4eD+7K8JXnFG
 BkPUkrPpksZGs2/oT3QfgQcnebk5FzhJ+W3okpwPhfQTnqXQWwFPZ1viFhMXZLnsRHYVDZwClpi
 iHUrssv/ALpxD4dOwjKngay00k8MKNO+5T3S289C/H4AZDKjp9diRrJYt1mQXM2B7EeLXqj4Sd/
 G587T3ch4WB6aJZWxrJyS0Ewxlicx2fCz231PJ6RemzU4/O1e9FHSK8cDXMKVNNVxjaZFC4Fm/L
 PrLRV3G5MLnNm4u6tucD1HZZ9yJxA/9WnrmqZMvZZh02NHPsA/QIkSnIS+OLKm7tKBUniBpVdXn
 44ClkFePESLGm1g==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add bindings for the Global Clock Controller (GCC) present on the
Qualcomm SAR2130P platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,sar2130p-gcc.yaml          |  65 ++++++++
 include/dt-bindings/clock/qcom,sar2130p-gcc.h      | 185 +++++++++++++++++++++
 2 files changed, 250 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sar2130p-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sar2130p-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9a430bbd872aebf765a6a0f36c09fdc2301ffefb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sar2130p-gcc.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sar2130p-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on sar2130p
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and
+  power domains on sar2130p.
+
+  See also: include/dt-bindings/clock/qcom,sar2130p-gcc.h
+
+properties:
+  compatible:
+    const: qcom,sar2130p-gcc
+
+  clocks:
+    items:
+      - description: XO reference clock
+      - description: Sleep clock
+      - description: PCIe 0 pipe clock
+      - description: PCIe 1 pipe clock
+      - description: Primary USB3 PHY wrapper pipe clock
+
+  protected-clocks:
+    maxItems: 240
+
+  power-domains:
+    maxItems: 1
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
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    gcc: clock-controller@100000 {
+        compatible = "qcom,sar2130p-gcc";
+        reg = <0x100000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&sleep_clk>,
+                 <&pcie_0_pipe_clk>,
+                 <&pcie_1_pipe_clk>,
+                 <&usb_0_ssphy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
+
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sar2130p-gcc.h b/include/dt-bindings/clock/qcom,sar2130p-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..69d2dd2538a64148ca05027f8b615527c3b966cc
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sar2130p-gcc.h
@@ -0,0 +1,185 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SAR2130P_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SAR2130P_H
+
+/* GCC clocks */
+#define GCC_GPLL0						0
+#define GCC_GPLL0_OUT_EVEN					1
+#define GCC_GPLL1						2
+#define GCC_GPLL9						3
+#define GCC_GPLL9_OUT_EVEN					4
+#define GCC_AGGRE_NOC_PCIE_1_AXI_CLK				5
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				6
+#define GCC_BOOT_ROM_AHB_CLK					7
+#define GCC_CAMERA_AHB_CLK					8
+#define GCC_CAMERA_HF_AXI_CLK					9
+#define GCC_CAMERA_SF_AXI_CLK					10
+#define GCC_CAMERA_XO_CLK					11
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				12
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				13
+#define GCC_DDRSS_GPU_AXI_CLK					14
+#define GCC_DDRSS_PCIE_SF_CLK					15
+#define GCC_DISP_AHB_CLK					16
+#define GCC_DISP_HF_AXI_CLK					17
+#define GCC_GP1_CLK						18
+#define GCC_GP1_CLK_SRC						19
+#define GCC_GP2_CLK						20
+#define GCC_GP2_CLK_SRC						21
+#define GCC_GP3_CLK						22
+#define GCC_GP3_CLK_SRC						23
+#define GCC_GPU_CFG_AHB_CLK					24
+#define GCC_GPU_GPLL0_CLK_SRC					25
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				26
+#define GCC_GPU_MEMNOC_GFX_CLK					27
+#define GCC_GPU_SNOC_DVM_GFX_CLK				28
+#define GCC_IRIS_SS_HF_AXI1_CLK					29
+#define GCC_IRIS_SS_SPD_AXI1_CLK				30
+#define GCC_PCIE_0_AUX_CLK					31
+#define GCC_PCIE_0_AUX_CLK_SRC					32
+#define GCC_PCIE_0_CFG_AHB_CLK					33
+#define GCC_PCIE_0_MSTR_AXI_CLK					34
+#define GCC_PCIE_0_PHY_RCHNG_CLK				35
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				36
+#define GCC_PCIE_0_PIPE_CLK					37
+#define GCC_PCIE_0_PIPE_CLK_SRC					38
+#define GCC_PCIE_0_SLV_AXI_CLK					39
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				40
+#define GCC_PCIE_1_AUX_CLK					41
+#define GCC_PCIE_1_AUX_CLK_SRC					42
+#define GCC_PCIE_1_CFG_AHB_CLK					43
+#define GCC_PCIE_1_MSTR_AXI_CLK					44
+#define GCC_PCIE_1_PHY_RCHNG_CLK				45
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				46
+#define GCC_PCIE_1_PIPE_CLK					47
+#define GCC_PCIE_1_PIPE_CLK_SRC					48
+#define GCC_PCIE_1_SLV_AXI_CLK					49
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				50
+#define GCC_PDM2_CLK						51
+#define GCC_PDM2_CLK_SRC					52
+#define GCC_PDM_AHB_CLK						53
+#define GCC_PDM_XO4_CLK						54
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				55
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				56
+#define GCC_QMIP_GPU_AHB_CLK					57
+#define GCC_QMIP_PCIE_AHB_CLK					58
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK				59
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				60
+#define GCC_QMIP_VIDEO_LSR_AHB_CLK				61
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				62
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				63
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				64
+#define GCC_QUPV3_WRAP0_CORE_CLK				65
+#define GCC_QUPV3_WRAP0_S0_CLK					66
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				67
+#define GCC_QUPV3_WRAP0_S1_CLK					68
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				69
+#define GCC_QUPV3_WRAP0_S2_CLK					70
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				71
+#define GCC_QUPV3_WRAP0_S3_CLK					72
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				73
+#define GCC_QUPV3_WRAP0_S4_CLK					74
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				75
+#define GCC_QUPV3_WRAP0_S5_CLK					76
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				77
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				78
+#define GCC_QUPV3_WRAP1_CORE_CLK				79
+#define GCC_QUPV3_WRAP1_S0_CLK					80
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				81
+#define GCC_QUPV3_WRAP1_S1_CLK					82
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				83
+#define GCC_QUPV3_WRAP1_S2_CLK					84
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				85
+#define GCC_QUPV3_WRAP1_S3_CLK					86
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				87
+#define GCC_QUPV3_WRAP1_S4_CLK					88
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				89
+#define GCC_QUPV3_WRAP1_S5_CLK					90
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				91
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				92
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				93
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				94
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				95
+#define GCC_SDCC1_AHB_CLK					96
+#define GCC_SDCC1_APPS_CLK					97
+#define GCC_SDCC1_APPS_CLK_SRC					98
+#define GCC_SDCC1_ICE_CORE_CLK					99
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				100
+#define GCC_USB30_PRIM_MASTER_CLK				101
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				102
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				103
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			104
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		105
+#define GCC_USB30_PRIM_SLEEP_CLK				106
+#define GCC_USB3_PRIM_PHY_AUX_CLK				107
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				108
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				109
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				110
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				111
+#define GCC_VIDEO_AHB_CLK					112
+#define GCC_VIDEO_AXI0_CLK					113
+#define GCC_VIDEO_AXI1_CLK					114
+#define GCC_VIDEO_XO_CLK					115
+#define GCC_GPLL4						116
+#define GCC_GPLL5						117
+#define GCC_GPLL7						118
+#define GCC_DDRSS_SPAD_CLK					119
+#define GCC_DDRSS_SPAD_CLK_SRC					120
+#define GCC_VIDEO_AXI0_SREG					121
+#define GCC_VIDEO_AXI1_SREG					122
+#define GCC_IRIS_SS_HF_AXI1_SREG				123
+#define GCC_IRIS_SS_SPD_AXI1_SREG				124
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_1_BCR						8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_PHY_BCR					13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PDM_BCR						16
+#define GCC_QUPV3_WRAPPER_0_BCR					17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUSB2PHY_PRIM_BCR					19
+#define GCC_QUSB2PHY_SEC_BCR					20
+#define GCC_SDCC1_BCR						21
+#define GCC_USB30_PRIM_BCR					22
+#define GCC_USB3_DP_PHY_PRIM_BCR				23
+#define GCC_USB3_DP_PHY_SEC_BCR					24
+#define GCC_USB3_PHY_PRIM_BCR					25
+#define GCC_USB3_PHY_SEC_BCR					26
+#define GCC_USB3PHY_PHY_PRIM_BCR				27
+#define GCC_USB3PHY_PHY_SEC_BCR					28
+#define GCC_VIDEO_AXI0_CLK_ARES					29
+#define GCC_VIDEO_AXI1_CLK_ARES					30
+#define GCC_VIDEO_BCR						31
+#define GCC_IRIS_SS_HF_AXI_CLK_ARES				32
+#define GCC_IRIS_SS_SPD_AXI_CLK_ARES				33
+#define GCC_DDRSS_SPAD_CLK_ARES					34
+
+/* GCC power domains */
+#define PCIE_0_GDSC						0
+#define PCIE_0_PHY_GDSC						1
+#define PCIE_1_GDSC						2
+#define PCIE_1_PHY_GDSC						3
+#define USB30_PRIM_GDSC						4
+#define USB3_PHY_GDSC						5
+#define HLOS1_VOTE_MM_SNOC_MMU_TBU_HF0_GDSC			6
+#define HLOS1_VOTE_MM_SNOC_MMU_TBU_SF0_GDSC			7
+#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC				8
+#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC				9
+
+#endif

-- 
2.39.5


