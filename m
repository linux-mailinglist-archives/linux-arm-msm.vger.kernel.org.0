Return-Path: <linux-arm-msm+bounces-63614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E8AF8903
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABBF654454E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E5E27F16C;
	Fri,  4 Jul 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SmXO1TgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7427CCCD
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613447; cv=none; b=DrxkU0B5gk1Qfe0+IRjEgrACiQxis217lQH/ZbYssRxETusjetXgfkNfHB5FMYg0/RpPM1egMPerzijpZL89F96rOj2A0AO383CJpInqjilsSHKnveckj285Tjh5m5qXIcBPp68AexeNJAvKQx4D9bobQVG/jX7q+lybLdmdrus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613447; c=relaxed/simple;
	bh=6MvXChn9H9cw/bMi6FXB2mO40dee5aW/+uTFO1/0HK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3c37DYNXAkH0gC0AyAUkYQP8qg4vnJTZILsu7fdbLtZla5yXxdCQerelyCOvHgKH1wbGbBiPEEad0nTixPMDULZJIk2NW59tJLP9NGg06+t9ov+N3iAIhpvlhb+9SaoLkujySn88mXr39zBopAaqAIf00WQPMn3rCwFgytqwu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SmXO1TgQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so123016966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 00:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613440; x=1752218240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1sXB8vBl3/wRvxnvKTI5nzO+o6yvo13WXmmYW72+RA=;
        b=SmXO1TgQtPId6rdFBEMdXGSEQNnRudSGAXXdlo12PYCT4K1Ty6IMHyk8nzW8Ceahvy
         ji+QsZZ4cWw4MyOBt5ZM+65H4R8kEJZoXN5AiOs/UNSHtCd3PCK/NUM4YDsRJmO1VWDQ
         d7MtLIhlpgaZod8kTIBa+uzoDwauQ+rnIzQVa2UYeyzlyrPHl19VxQvVdcQTdgXsamkf
         CiybtYHJHWl6O64utIFJ7fIg2oZREU4bNRGzhRYNt6CRXSZZ6WZoZlJoIeqpm2MmGGJj
         qXdTq8gMlSBWiAcUyyOwb7bR0IjPNCR4JZTuXRyf5dCTFRLQKw5+K0WoKgipq47H2u1/
         TsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613440; x=1752218240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1sXB8vBl3/wRvxnvKTI5nzO+o6yvo13WXmmYW72+RA=;
        b=tD7RLHiNCm4hj8PCEH3aCOhf8Ws/AfnSRWx601O94a6bIazktiaEBfA2+eXpRrWLUO
         Tv87IvFbtp3tut0z4p4jmOnVOFCK4IxbhdQjHpEtOvC1tlb9bxCtFKduq5kbOVLf04iq
         xUSDxlVBHEDuusoDczjkYfaKDohkLKcfFZy/116OwsAGiZqOr1+rrS3hmdKjmkW7Wome
         cy+KB0PG5QSv69lFKQ8rMlHpKFhndKoqP85SN5ccCP0mHkip2OwyWwQgPFQofo1aNVRp
         VLb6DyVxGz1JKagSwGM2sOBWhGKkn75H+hJq31yFb+m2rCj57EiNm+f2rSaFUI+QU3TD
         H1LA==
X-Forwarded-Encrypted: i=1; AJvYcCVZwX8uvoSWXxLv2/XL3gLesVKyuQLIToQzidj0wnwb77xNpSoviacFrynRramVsKWZy6HBCVvIVRgfBVAC@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzdc44I43zyeOE1g6QkSdmfNyzfaRt3uHsDmrpJJHvXuWrzL2
	XQ6/7PQe3nhrqV15o2M0IXZYEYacZTLOS/cmfB8pHtSQXFVL0MpTZOBeUbo0XaDgKsU=
X-Gm-Gg: ASbGncu1QiGLQXhLfr884hAUPKq7YM4NIFKZ6pFMJvyIxBKOE/KvWubXQFZSfMU7gcD
	7ADuSjiG4FwU7IKHiNsHBTEhmWBZrYLQ6qSrDc9GGyML3DviYcAzXbhchmXT0vH2tRp3Gxir3kv
	CFtLKg7U7kZA0HdCqpF8E7G5p5r2HhMf5WFPeuQ0XCMMS3yk9k4I3PF+hHHCqIoBGTMOkun8Zd8
	PDDD52qt8o7AKxLPsvMbnHhTkIu6NHGpRJTWwK2roVoX8lLUwqfPCwNAc/XECTjk44fVdoHD2kL
	hVL75JfaEG4scrBVIFePe1Bc3syoqcfBNUgkcgrZS+LHoM2hvEak0WM/LXBUb3FfKS8zP7rXKBA
	rQeuf87M0qJKwLqWv3KzCBj2O09PG2G5j
X-Google-Smtp-Source: AGHT+IElGLpw/u7952nbwD/YHmIWG7YWO0q16mfXFREPrpS7P/6EixfLzQCLQjp2GkgXcZ69/84xZw==
X-Received: by 2002:a17:907:da4:b0:ae3:f3c1:a5dd with SMTP id a640c23a62f3a-ae3fbde9e6emr143426766b.61.1751613440012;
        Fri, 04 Jul 2025 00:17:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:17:00 +0200
Subject: [PATCH v2 08/11] dt-bindings: clock: qcom: document the Milos GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-8-9e47a7c0d47f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=3341;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6MvXChn9H9cw/bMi6FXB2mO40dee5aW/+uTFO1/0HK0=;
 b=/xAwuNTLRmHK6EPxC+GJ43TUvwHnah0RYfMF18VBovpLoRUZooLVsqyMQz+itbNVyv5Yvt8GT
 K6hEBHBvvsWDIeZvxaA/WDCktMvInLZQtKgJiphyVI2y9FX21VBYcJx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Graphics Clock
Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,milos-gpucc.h       | 56 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 02968632fb3af34d6b3983a6a24aa742db1d59b1..44380f6f81368339c2b264bde4d8ad9a23baca72 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,milos-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
@@ -25,6 +26,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,milos-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
diff --git a/include/dt-bindings/clock/qcom,milos-gpucc.h b/include/dt-bindings/clock/qcom,milos-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ff1925d409fcf3a0930bdb01f06b13218b0e3fe
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_MILOS_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0						0
+#define GPU_CC_PLL0_OUT_EVEN					1
+#define GPU_CC_AHB_CLK						2
+#define GPU_CC_CB_CLK						3
+#define GPU_CC_CX_ACCU_SHIFT_CLK				4
+#define GPU_CC_CX_FF_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_DEMET_CLK					9
+#define GPU_CC_DEMET_DIV_CLK_SRC				10
+#define GPU_CC_DPM_CLK						11
+#define GPU_CC_FF_CLK_SRC					12
+#define GPU_CC_FREQ_MEASURE_CLK					13
+#define GPU_CC_GMU_CLK_SRC					14
+#define GPU_CC_GX_ACCU_SHIFT_CLK				15
+#define GPU_CC_GX_ACD_AHB_FF_CLK				16
+#define GPU_CC_GX_AHB_FF_CLK					17
+#define GPU_CC_GX_GMU_CLK					18
+#define GPU_CC_GX_RCG_AHB_FF_CLK				19
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				20
+#define GPU_CC_HUB_AON_CLK					21
+#define GPU_CC_HUB_CLK_SRC					22
+#define GPU_CC_HUB_CX_INT_CLK					23
+#define GPU_CC_HUB_DIV_CLK_SRC					24
+#define GPU_CC_MEMNOC_GFX_CLK					25
+#define GPU_CC_RSCC_HUB_AON_CLK					26
+#define GPU_CC_RSCC_XO_AON_CLK					27
+#define GPU_CC_SLEEP_CLK					28
+#define GPU_CC_XO_CLK_SRC					29
+#define GPU_CC_XO_DIV_CLK_SRC					30
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_FF_BCR						3
+#define GPU_CC_GMU_BCR						4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_RBCPR_BCR					6
+#define GPU_CC_XO_BCR						7
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+#endif

-- 
2.50.0


