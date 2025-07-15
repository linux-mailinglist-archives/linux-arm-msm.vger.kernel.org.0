Return-Path: <linux-arm-msm+bounces-64943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A872B052D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F07893AA943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B80E2D9EEF;
	Tue, 15 Jul 2025 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nbwXRoAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4762D8DAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563973; cv=none; b=XRayGiFNMeEEzf1x+ECI78C7PH1zVbAuZmKF3uv+/nGCSAKP5MukcycCd4jDU+CYaT2D+xykFHfVPLXFSJ8tV/10jzhKryet2bfa/jNj/Kjyp17UB2lexpMXTT+nfQoq5dG6xIfuNPiZHTSTOAnfNjvDxM4QV7q3fn1Ak42huN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563973; c=relaxed/simple;
	bh=Dj7sJeN7IOMWaxLq6ehLlqQkX01AbHnqO+NBstsBfoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NyxQTMjbO0eu6L41OyHrHGBy744pizZj8qSgnt1sq16F+qBrCXXfzcvJ5TMs/DHGi1v3mP8yD0E5b3WpPoQgPykdnbgYjFECJkH+Vlmcr+yThAIWKOVMmpM8KNJgpW06R/fv+Ueat1ciNXxS1aZqcBHueYeQT/n5VkfQY3BaEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nbwXRoAb; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso9480986a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563966; x=1753168766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5E4pO8p5egnj+urqAyIweuvaL8G96FfO79rMHUS8W8=;
        b=nbwXRoAbS+lHS3h5pLvtGWLCDm30GsWLy7buhZUKmmnzhTJUju6m5uCG9GlPMQb3lY
         3w7NiIRHsOen4pvImuH+8USfK1MMhtbnA/vIdiqlQ5pp5i7OAdZDC7f+YL0zEzrskQp5
         iWQ+cvVPuf3jmA6/qQrgQ2l3rgvIAEmhhVAX62U1V3MutRSmq4vfY0Qj0tBEG6BU8hrt
         usoHxcVX3uxGuMlyexGdaIr5kKIfyQdD6A0KnwwF+jsC8zPf/4zUgv4jncGuSnSypmKE
         ZIqemAjM7zsJxXxZ4RRgFMJPe7bz3palxhHUAwwI9y898bBVdvO6du4H7+NwEuNO9COX
         vOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563966; x=1753168766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5E4pO8p5egnj+urqAyIweuvaL8G96FfO79rMHUS8W8=;
        b=h3rlxWlkSN56ud3R6kM4ObJYjX/83CS/0XyUVOKTuGLQCWKXfOLVT2YbkIzz2yLPc5
         pOAhBX/srzSlsY200aARvlxPfg371e9EA6/w6jj8Rk2hsemF7Oxp5p5eYhpxb8P5XiLT
         MOCUXWMTf0LHQ3ps6YFtEDdvnJIuszOybZhAr8xoa7oPtgscmJi3Q8HyeFB3FM8PuWVR
         L3xGDqWsEbReVnrcxoccD+K7ChVgoDgm0JYF+xbooyLJIIHHr0rivV3D3ZUqRcJLb6gE
         D1nXlP1S5FS0cK7W9ezUZkVu6IeIV335YIlGV7r4O5oyBKZDLyG9xhQB9i/yQgLF+VLO
         X+rw==
X-Forwarded-Encrypted: i=1; AJvYcCVboBscBgEBb6lkR3g3IPh0UhaEVwif1otb13Zax0Iv9gMYkhgyfVsJR3Pfx7YScxoRh2dJw5uFJXRfgC2d@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSqcx7YAov7Lb6+Z0bSLSNmF9V6Ltqgv+dQ+4SuAt7lVrnyWa
	zKdtBU/p17NGzG9MLovlv57NQzudJTulmV98c3hlpttgbCzMIa2f5MnvibuJtjV7bd8=
X-Gm-Gg: ASbGncvSPd5kSnBjsyQnQRO0RRFE4wdo/qvdoKkhNY1indcrerJ1V646KYtxY9rMqMc
	tBTReSrjznYSHW+lfatRh03pFh3d+hwLlVqK9rAadc1r5Rkou0754KacOiLnLHt16uJQzx8PoXT
	1B+V9botWp4TvhRTrrUcnBCDH7c9j3qvjc6tm32tQRoAALpPGSUBK7nvI4nqzbUlqoqDXN6Uhgk
	mO6xpNN7DgneMNSaioxXRPdR46A0U380tbWh3YymCwp1qiOmi7soZw8CO0kxhGzFj5fEWqJCvGr
	ok1S1OTTp0dN0Y6g19IpW59anWNgxOEhgz6XGZv8DXEN7h8M89CIE5Q5niDmv8EYaM/Wsy/dzQ3
	Og4jdNdWTv9QBabeCU343+7TZStaV+vofh+4aRC9lFzN87ENlVg/yTNtclED56I2IBn0=
X-Google-Smtp-Source: AGHT+IFM/MkD8xwykZKz531GWjehmFKVZTOEfKFLvrwVBI0R1l1MW9Yb4+xhBU2yAumwc4Gpx7aMgQ==
X-Received: by 2002:a05:6402:40ce:b0:608:3f9c:c69d with SMTP id 4fb4d7f45d1cf-611e851653emr14396269a12.33.1752563966261;
        Tue, 15 Jul 2025 00:19:26 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:19:08 +0200
Subject: [PATCH v3 08/11] dt-bindings: clock: qcom: document the Milos GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-clocks-v3-8-18f9faac4984@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=3408;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Dj7sJeN7IOMWaxLq6ehLlqQkX01AbHnqO+NBstsBfoA=;
 b=xnUcse+3mwGuObLkcgB8oveGCpUBnXQvIJoE94ldQlI1Y72gZ0PXQMrQirMqejysjEQAdh/zB
 9kV+kZjRayfA5dz34+1qfRUfI3MlwQ092yEkaDftAZVywVuok0Se4PK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Graphics Clock
Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.50.1


