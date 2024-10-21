Return-Path: <linux-arm-msm+bounces-35201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4A9A6327
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC24AB24CF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DC41E6DC0;
	Mon, 21 Oct 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vcn1nYNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BFC1E503D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506650; cv=none; b=YQFyiVAL4vK9MJTbWyYo3nxHxRESNnwmpNVYlyFuKCMYtcG2s2/0agU4rApFR1aUFAG/NIxlG2e9zsLCBuMYFGqYCbKgO9d5+cPj9e4wvm9a5XmjMST33rgqDaqbBTshV6YuXaH9ol4rdgTpjwseXsWFRceqgwq23Co5Fh4QxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506650; c=relaxed/simple;
	bh=ORb8/nHkTIQDP8GoghDVsqc7bR6H7F6H2agygUhtm0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2QNsu0OAu9PfGKRpBUSRKN9bdztopMEv5m1UYU5Lusd143RiNj6wWNH1Dh25GHbpuv9Vw3Uq6R9Kh9HnaAPP0jcPWCioWMSZONowWrdefubkTNhGBTG6pFJW0jCIC5Ose8RFDF87Oz4PNGq9QB8VGpbJ5yq7iCxy+FCEgF8T+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vcn1nYNB; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso39901771fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506645; x=1730111445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwqVZYMfjRmLaKFsffHirBv4i4Ayt1buPnsClbgYHZE=;
        b=vcn1nYNBg0Fr0IBYr69IWpUulb49qHiCsTFW4R/tc9wEnJDeApMcw6NnApDrk9eTwX
         zO9fkdJok8ldj3D8dF31k5VDrLkoWmduHKTCHoSbv0AQDvq0TmgzPgtfvQbxO9AmcE4r
         C/vpToo8DIvAUOezrP8b0CenQSsv97xQWKH98L0vREjiYL7V6JlPSRG9cln9/6AuY+Zv
         inXaWgKR78exx/W6HIldMC+Bq5ZuvdlxqXafRd5xjCZVrwKTlxamUycVc/9ks6E82dO8
         HWxJThBIKxp/g06XRo/+T9Mp8r1fuQ2P4b2uaFX7f1HXuqulQfN0Nc5+5IyjrCJd/oth
         Cb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506645; x=1730111445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwqVZYMfjRmLaKFsffHirBv4i4Ayt1buPnsClbgYHZE=;
        b=okT2JpABho0TfUp0l1Ql06Ep6IKJTQICRNp73mEUYEkX4Ah1KocguWpIDMV+ftQcIj
         Cqg7zCyp9MHFQWxSuNis3GnsVlR92UEoq1a4+XBrmvE+Pyr6yFhYOjLld9JKZ7LWIiml
         bY/sqRS0H2lf1S9uZUPjqdc07noUG1Dn7lds1NVPWMIevaV7orZbRQpcoHc1k7lN8qA+
         POrJY1+snHf4eoawX7Ojx/P4SqQOHYqvPvWACFFN0ei3nnlCsMXqbYcv7NLT3ScJaPJ0
         AvV9YY+OVqtf6I4q4h+l6mmxXH+ybZrPCeuxVPEMbK9sy32tHmHjwZEo0jSbgrc7cNsu
         HcCg==
X-Gm-Message-State: AOJu0YxzoFUEZI2KHf7gfLoz63lfaZ1Z0rmPsncoHZnekEGHi/vD9aZ/
	hqJRtOdp9uL5dp//DbiaOLBIp11U8W8kXCCuFnYe/hJwhn9MSs/iMeM4zIeU1iw=
X-Google-Smtp-Source: AGHT+IFklD3wWVUDw8+9ly0PGSeveRZTU9LcMe1DBiAPZVt+vs/BOZ3yqk2h6b0oB5e0Lnjjry80yA==
X-Received: by 2002:a2e:719:0:b0:2f3:b71a:1e91 with SMTP id 38308e7fff4ca-2fb82eafb21mr40822621fa.17.1729506644985;
        Mon, 21 Oct 2024 03:30:44 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1217bsm4522711fa.112.2024.10.21.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:30:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:30:30 +0300
Subject: [PATCH v2 02/11] dt-bindings: clock: qcom: document SAR2130P
 Global Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-clocks-v2-2-383e5eb123a2@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9612;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ORb8/nHkTIQDP8GoghDVsqc7bR6H7F6H2agygUhtm0Y=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi1KU58sGeR0dWa2NIva6C7ak8A+PIjOCFlvV
 LlpKX/ekA2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYtSgAKCRAU23LtvoBl
 uInHD/4+CEgjfzFEFlMwCBimxFBHU1nHkiSDOJSnC9SPTHybmqLw2xbggU+twjjDQaNj236nIpi
 9/nYTLmGkzxRHji2AHeFJhWRMgddJbGYHU0/bmqPv7v3oBVPFFfWHkLgX3MQ5nrIjzOeI8quwpy
 aZo/a2caTh93W39XM5Ag2903G7t09XOUnEjNN1TAGQR0XC73+ke6fjXd2uVTGjHEZ1EXE591X4r
 B4YPrtXTRkluQbSmVlTGbKaK3E9B4zaegIzmkhxF4ZvTgRxBHi0w3yJiPOqEKAWZqVsEtSPnID9
 FvMKV/J0hJWvUKuogOwVktDsTyl0mXStlFeyRZb77smhXJVhZ5UUdB11AX5xcMbLIhGRMlOciAi
 frU+TuPFlHy0FLtJ8NonRfVc5AYbxuV1B9XfxNAgorocaYAKQJUXgtshPvQa7fZReuH/rTkJpnG
 Agmf7cZh/sI9knJ0GT4N01ezfxJ9GRL7sUP5XCdSH/Kj9cixVhboHP5lfGqS2uX3QONWLPNQkv6
 irC/FQxTzU5M+1WBgnKEPFJKBPHPQtHt2qv3dOyduSjk/1ZMH4qRdkEEVS/lnUN8xlK8S861Q8O
 fX9j3+MjMpg8ljncUspc0c99la2OIokx5WLhdF5nQLcTrS11au4W+JQCa9eIJmTPZCpwFzr6L5i
 3atlMUmaz0E/buw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add bindings for the Global Clock Controller (GCC) present on the
Qualcomm SAR2130P platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,sar2130p-gcc.yaml          |  65 ++++++++
 include/dt-bindings/clock/qcom,sar2130p-gcc.h      | 181 +++++++++++++++++++++
 2 files changed, 246 insertions(+)

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
index 0000000000000000000000000000000000000000..b22701922136a3db1684baf97a84dd258985d1ab
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sar2130p-gcc.h
@@ -0,0 +1,181 @@
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
+
+#endif

-- 
2.39.5


