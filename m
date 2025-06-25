Return-Path: <linux-arm-msm+bounces-62350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 828D9AE7C4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11794A35A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211482DAFD5;
	Wed, 25 Jun 2025 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xysRaBZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D53529A9F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842841; cv=none; b=TGCxVKuUHGzthANCIZexX7XEKMwXQW2qrpAmasz6TLcVhVKAybRKI1uKh9kW+oxNja3pnJwfABUdCOS4lPTVyhRAAkY6n2pm80s64Z2I7W2tOvcS85mX92yEGb/210e0lxqAncA4bRxUmCNqv/JWDUs/9GkjsSl+PtQBb2b+Pug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842841; c=relaxed/simple;
	bh=54t9W8bEFcos9T5d7Eu0wZ/vWvWROai7eof2tEZ2Zl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfWL0H6Q4HGI5k7b5THO6tW8jf3G5l9/9YRI0sOm93ctbmjxPyD79t7m8tv2BycOOcq+t6WsUMbX33MUcNFLkFdmrmUBO5zx4RSXud2OgJEb53DRgWbSIqMUFWAtMfY2GYmOI/3FjRVTlpmw6+YwpYW+McMnHDhfpksNYhgsYPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xysRaBZH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so637513a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842837; x=1751447637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDMeZfqbgmS9DRg6GUCqAw8Pfufq7fFLwuxZEey/WEM=;
        b=xysRaBZHGIPK7kA85WOZHUaECkK+XwFZgo9Ez7F3Of62l4586uU/G2JiedPAklDU+T
         C0Zh66QMxB5rBbuDDrg5sFg95+WFVXzaceqipYSvruT2SI9vsQd5o2yQ+WsqZ+XXs+kI
         VSDbUUODoDdB9+AKkqQV/RxtdEGlgR/gmUxP4Dl05yd7LnJr3sSFNU6rtLCZaMkstMSy
         bbgfjunffXH/TjQPb7vxsbnvz1IlToN6g97VEHZOdmkG3mL2cCkJxqbu/OrpEoW9v+sd
         ZB0HdPlq3IuzJKK58rz9YyDnPNzMca7dfxzrPZrkOKPG52pPYQj3bWmUCdYffmXdNg5p
         sVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842837; x=1751447637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDMeZfqbgmS9DRg6GUCqAw8Pfufq7fFLwuxZEey/WEM=;
        b=pVP4fMzZxYDTmyxo03L+bzIdpxqoh5FK1wEEqjFc9TqYuwSk6lQ+aVWorFj95u5i6r
         xI7vYdAUnx53LySROQ7VyQtNwi88b1HLIQT7yTOfpRYgCCIItB4LolIwxHlFXmUVY/oS
         hjOM4dhEaugaQep20a5U6eQwKzOUamnKYQPIZJu21C/1VtZjwvUuWyFaIsVhH3s0dm/A
         Oy5AGZGXSnWj+BIsSCvJYuMSWH3iOYJoDVTLCZ4+dpVAnJ3LfJHrChHHeO+TF7c4ShHd
         2pFue1ndPhEBahDOIt974cw/RPELsZ4BLK+5Wx0Q6aJqLKa+Jzw6qyxP7CgLFxsZNwuM
         fuXw==
X-Forwarded-Encrypted: i=1; AJvYcCXoyO5036R302J8N9zcbfvgHKmGPNbkdFcjn6kiD5YMXEzbFHikuCQpeHVp4enYrxVg2OMaQD5RTtgqkeW4@vger.kernel.org
X-Gm-Message-State: AOJu0YzSug+A8wyDawQ0iCoNhtgwYIjcy4hEVe92p7G3lQq7kNpCExOM
	kYIee2tozQw2W+nF6svAc31VQbZMyu5dold/1EpK/RcWoDm99ZwVgKkQSEGQnGVAgXU=
X-Gm-Gg: ASbGncuQmGDvFDt+f72m2Y4vWmWFpt9KLBwOx4DEs9PWxglVBFRRmlry7Hkvkv/UoBC
	/n0Y0GX3agEXizUxTKVfoOsCpsKvs1N0jOWvymmAgoLlczhA71e/fhctKC7Ynq6rlSeqp42jZNc
	Li3WcBbxDqOu4CAMNN1EQrUF1OCqnJpzjRFoqtlyGSyE63VuIlPbUv3JNXSKspG49P3JXq0TwGr
	zwd+gVpGAMOl2MUiVz6CL0xVKn3vg21sug/ylgTNlye/o74eYXyYFsgkJYVveLi50vy6Wswplkd
	CzF/Dn7lJhdF8jSyDKyfeiLfA1avwxUlsgqjirr+viyRD4ujhPkFEt29OwPqvEDP0NgFkGYHJj7
	9FGFhfJSpws1AB9S3+qjHW/NJfTbeah6M
X-Google-Smtp-Source: AGHT+IE7ooPrQL/6cIG3At5M/uLWpwMiPmNYzKivvlwa8s+OaW0o78r8gXhnDqjzpDoteXXG+Lb7Jw==
X-Received: by 2002:a17:907:d5a5:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-ae0bf154af5mr200684266b.38.1750842837339;
        Wed, 25 Jun 2025 02:13:57 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0bf33b108sm106422566b.115.2025.06.25.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:13:47 +0200
Subject: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip Interconnect in Qualcomm SM7635 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-icc-v1-1-8b49200416b0@fairphone.com>
References: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
In-Reply-To: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842835; l=8682;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=54t9W8bEFcos9T5d7Eu0wZ/vWvWROai7eof2tEZ2Zl0=;
 b=+Q32DRtxbNr2uBXuELRfjUdwl4eKz+OBvEQ4psFS0JEAjjzGqlxbFe/0FkSgWk2bg2D72VL7V
 GXvWDZM/wx2CJmxFKK7Urt2Xv4fWUYpNUQREbvRHgty3F0XBNE6Oirj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the RPMh Network-On-Chip Interconnect of the SM7635 platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/interconnect/qcom,sm7635-rpmh.yaml    | 136 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,sm7635-rpmh.h    | 141 +++++++++++++++++++++
 2 files changed, 277 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm7635-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm7635-rpmh.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6373399542d5728b4a4097876d2c4dffc4482038
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm7635-rpmh.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,sm7635-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on SM7635
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also:: include/dt-bindings/interconnect/qcom,sm7635-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm7635-aggre1-noc
+      - qcom,sm7635-aggre2-noc
+      - qcom,sm7635-clk-virt
+      - qcom,sm7635-cnoc-cfg
+      - qcom,sm7635-cnoc-main
+      - qcom,sm7635-gem-noc
+      - qcom,sm7635-lpass-ag-noc
+      - qcom,sm7635-mc-virt
+      - qcom,sm7635-mmss-noc
+      - qcom,sm7635-nsp-noc
+      - qcom,sm7635-pcie-anoc
+      - qcom,sm7635-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm7635-clk-virt
+              - qcom,sm7635-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm7635-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm7635-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre UFS PHY AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm7635-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm7635-aggre1-noc
+              - qcom,sm7635-aggre2-noc
+              - qcom,sm7635-pcie-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7635-gcc.h>
+
+    interconnect-0 {
+        compatible = "qcom,sm7635-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@16e0000 {
+        compatible = "qcom,sm7635-aggre1-noc";
+        reg = <0x016e0000 0x16400>;
+        #interconnect-cells = <2>;
+        clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,sm7635-rpmh.h b/include/dt-bindings/interconnect/qcom,sm7635-rpmh.h
new file mode 100644
index 0000000000000000000000000000000000000000..d963780ddb540825672bc411eb106a298003b09f
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,sm7635-rpmh.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_SM7635_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_SM7635_H
+
+#define MASTER_QUP_1				0
+#define MASTER_UFS_MEM				1
+#define MASTER_USB3_0				2
+#define SLAVE_A1NOC_SNOC			3
+
+#define MASTER_QDSS_BAM				0
+#define MASTER_QSPI_0				1
+#define MASTER_QUP_0				2
+#define MASTER_CRYPTO				3
+#define MASTER_IPA				4
+#define MASTER_QDSS_ETR				5
+#define MASTER_QDSS_ETR_1			6
+#define MASTER_SDCC_1				7
+#define MASTER_SDCC_2				8
+#define SLAVE_A2NOC_SNOC			9
+
+#define MASTER_QUP_CORE_0			0
+#define MASTER_QUP_CORE_1			1
+#define SLAVE_QUP_CORE_0			2
+#define SLAVE_QUP_CORE_1			3
+
+#define MASTER_CNOC_CFG				0
+#define SLAVE_AHB2PHY_SOUTH			1
+#define SLAVE_AHB2PHY_NORTH			2
+#define SLAVE_CAMERA_CFG			3
+#define SLAVE_CLK_CTL				4
+#define SLAVE_RBCPR_CX_CFG			5
+#define SLAVE_RBCPR_MXA_CFG			6
+#define SLAVE_CRYPTO_0_CFG			7
+#define SLAVE_CX_RDPM				8
+#define SLAVE_GFX3D_CFG				9
+#define SLAVE_IMEM_CFG				10
+#define SLAVE_CNOC_MSS				11
+#define SLAVE_MX_2_RDPM				12
+#define SLAVE_MX_RDPM				13
+#define SLAVE_PDM				14
+#define SLAVE_QDSS_CFG				15
+#define SLAVE_QSPI_0				16
+#define SLAVE_QUP_0				17
+#define SLAVE_QUP_1				18
+#define SLAVE_SDC1				19
+#define SLAVE_SDCC_2				20
+#define SLAVE_TCSR				21
+#define SLAVE_TLMM				22
+#define SLAVE_UFS_MEM_CFG			23
+#define SLAVE_USB3_0				24
+#define SLAVE_VENUS_CFG				25
+#define SLAVE_VSENSE_CTRL_CFG			26
+#define SLAVE_WLAN				27
+#define SLAVE_CNOC_MNOC_HF_CFG			28
+#define SLAVE_CNOC_MNOC_SF_CFG			29
+#define SLAVE_NSP_QTB_CFG			30
+#define SLAVE_PCIE_ANOC_CFG			31
+#define SLAVE_WLAN_Q6_THROTTLE_CFG		32
+#define SLAVE_SERVICE_CNOC_CFG			33
+#define SLAVE_QDSS_STM				34
+#define SLAVE_TCU				35
+
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_GEM_NOC_PCIE_SNOC		1
+#define SLAVE_AOSS				2
+#define SLAVE_DISPLAY_CFG			3
+#define SLAVE_IPA_CFG				4
+#define SLAVE_IPC_ROUTER_CFG			5
+#define SLAVE_PCIE_0_CFG			6
+#define SLAVE_PCIE_1_CFG			7
+#define SLAVE_PRNG				8
+#define SLAVE_TME_CFG				9
+#define SLAVE_APPSS				10
+#define SLAVE_CNOC_CFG				11
+#define SLAVE_DDRSS_CFG				12
+#define SLAVE_IMEM				13
+#define SLAVE_PIMEM				14
+#define SLAVE_SERVICE_CNOC			15
+#define SLAVE_PCIE_0				16
+#define SLAVE_PCIE_1				17
+
+#define MASTER_GPU_TCU				0
+#define MASTER_SYS_TCU				1
+#define MASTER_APPSS_PROC			2
+#define MASTER_GFX3D				3
+#define MASTER_LPASS_GEM_NOC			4
+#define MASTER_MSS_PROC				5
+#define MASTER_MNOC_HF_MEM_NOC			6
+#define MASTER_MNOC_SF_MEM_NOC			7
+#define MASTER_COMPUTE_NOC			8
+#define MASTER_ANOC_PCIE_GEM_NOC		9
+#define MASTER_SNOC_GC_MEM_NOC			10
+#define MASTER_SNOC_SF_MEM_NOC			11
+#define MASTER_WLAN_Q6				12
+#define SLAVE_GEM_NOC_CNOC			13
+#define SLAVE_LLCC				14
+#define SLAVE_MEM_NOC_PCIE_SNOC			15
+
+#define MASTER_LPASS_PROC			0
+#define SLAVE_LPASS_GEM_NOC			1
+
+#define MASTER_LLCC				0
+#define SLAVE_EBI1				1
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_ICP			1
+#define MASTER_CAMNOC_SF			2
+#define MASTER_MDP				3
+#define MASTER_VIDEO				4
+#define MASTER_CNOC_MNOC_HF_CFG			5
+#define MASTER_CNOC_MNOC_SF_CFG			6
+#define SLAVE_MNOC_HF_MEM_NOC			7
+#define SLAVE_MNOC_SF_MEM_NOC			8
+#define SLAVE_SERVICE_MNOC_HF			9
+#define SLAVE_SERVICE_MNOC_SF			10
+
+#define MASTER_CDSP_PROC			0
+#define SLAVE_CDSP_MEM_NOC			1
+
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define SLAVE_ANOC_PCIE_GEM_NOC			3
+#define SLAVE_SERVICE_PCIE_ANOC			4
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_A2NOC_SNOC			1
+#define MASTER_APSS_NOC				2
+#define MASTER_CNOC_SNOC			3
+#define MASTER_PIMEM				4
+#define MASTER_GIC				5
+#define SLAVE_SNOC_GEM_NOC_GC			6
+#define SLAVE_SNOC_GEM_NOC_SF			7
+
+
+#endif

-- 
2.50.0


