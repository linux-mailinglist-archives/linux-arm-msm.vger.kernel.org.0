Return-Path: <linux-arm-msm+bounces-52210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5BCA6BD74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35A95179D8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3199C1DA61B;
	Fri, 21 Mar 2025 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rqXRScU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15B71D5166
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568353; cv=none; b=qp/gUB4toBgStTA8sLFV+DLw+FLoHHj1Rf6VXvtMzyg4mi8MofTOh3gF6sAWcdLJHb9B4qlgnKV+w4RTf1JvOddwhmraY8HVT+7MqMObhpGxsRm9dvkqp1pmxHUhhzofyeyr+/c+Qa7kF0KR3gpNdixmnRVp82lZ8KVLZXbvLrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568353; c=relaxed/simple;
	bh=GLAsUw1OONraXoc4O2AxkqLiMT4MdPKRGHr5nbrSBI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yy9zS3abRH0XdyRPIqXgZxcrpmzsbfd4gyvmox9tCR0NGdnq1UIoP4yFPpntZy3uspGiJalCL824ySLqv7naD06WNOgJd7AINuCH+nURCU/qJwwPBcVN4v48tNg6+I0nUywxzjfGNN2IFBy4uiuW6eylNNSsnloMXx/p7lh4Lpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rqXRScU2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac298c8fa50so378171466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742568349; x=1743173149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHERlL971lhRhRNPhw773ZN7phaB0MazKYjf9mnRkOo=;
        b=rqXRScU2DtXHdaciscHnD6KSOKHbxpgIVAGJgAVdUyoF627tNp+VP0sjIqJ9I74l1a
         fYdxqhF2wgbIxtXKgDtPcqZ78D5opVnyAE7wy2d3s3KfWYlvprimXVmrOadae74kxiiq
         9ojxWKaJD4PoBvNHZsjXE5O8yZZNPjcAkkJLPrXsJbNTDd5gvl+itlUxDeizIlTRWvA/
         H3qSvveniv5qWc3UNGiJMCdKNCnod2mVjiI9oTZ2fVE/TdI4iRK9UGg0U1IpbL1F4J96
         cf4qPO/XL31S+QQ8m09L1N0VpDj2SrWcwo0KMb3ctG3wxIXtzr9bVhseh/x26ddvSY8e
         1AQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568349; x=1743173149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHERlL971lhRhRNPhw773ZN7phaB0MazKYjf9mnRkOo=;
        b=Q8ovLPeBGF7M+eJkDiYI1/n4cEsKyBohAMbugt6adSs02N5FcISCCC93szu2/iCSPr
         ffNrltomNfQxHzlRJpGrbibR/Y53Ytj75hs7qx5/rx0F0YrBv2b+1fAPmbmvqBOHc/l8
         Ak/IPtEzfqp3Mbus51eScN4MaQ3o6uaFJ0cjtyXTxPfJ+1Pzh4IHh9+2rBZMNueVl8+Q
         cgD8TdPmUbjWoUAKWrmLay72X9BssfWcXb2GKp2q+dYx3S3mvTUnKGdwy5HYGufY6rL7
         /tdWTKPBOuD1CmfjQOHyErgmwstC1fziqB4GpYZEVDeUvm+32J2ZsZKaY7w14kGRqTwy
         k2HA==
X-Forwarded-Encrypted: i=1; AJvYcCW4rHiRqcJLnrWYcP6ZaFxg0UHgA/6cGnrXsduEtbrPsUuaZK6RTuARic3pN0vm8Vls7WdkKTz6RFC4WLju@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+W0iFNYG9ATxF+M1XGoyr1WhrHeGe4OSeJQefuOk6YdHIDfFH
	v8rod1sdDEUPtsfQgzJR/XpN7gyA+vzriAW5IU0b5KyZMp021S2N/QxYHnGM0PQaT1i3SEvbafs
	J
X-Gm-Gg: ASbGncud9HDNBCKrd47YG1VngLn2tIM7MjVP+Szn6SH/DGvMK2Vo7HVCadEzxaZ3Y0A
	mDgzruacfETp4wb/782l57dJ5BQ3FI/7ssLOSPijz3Zr1YA30nPXWYuoJ7NEip6Bx7P/OxcOmSc
	ze8hSldE574dJwpjKfYlesCjrkFtgK+LcYl9qtKqKuPpqIhdE/V/xbS4B7+IeSeFzaLIhC8BOtH
	PNqRIRdwZwkrpIb27fiKNs1sXXghKG/BtnijuP+N6Z/QSJ5+4fiLHJ/eaVnUoXO1cCLWrqCag+1
	kjFP7SwTfmVoZEWgdfGdYXgBLE9ZghD0NWjzNsjlo+F7O19DQMUNVtj2TTeckJovAD6ETj66rtD
	JzryH3mYWLxi3Rcq2Dyn68tsgc0cm
X-Google-Smtp-Source: AGHT+IFqAX43/zq/hujHzHnH37P90RVIE+VluZyGm3/YhAvwrRM7pYjzxeNBMWHwFGfVNM0d7l7R3w==
X-Received: by 2002:a17:907:7f8c:b0:ac3:cad2:9e53 with SMTP id a640c23a62f3a-ac3f28053b3mr412540766b.55.1742568349002;
        Fri, 21 Mar 2025 07:45:49 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb648acsm168092466b.98.2025.03.21.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:45:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Mar 2025 15:44:59 +0100
Subject: [PATCH 1/3] dt-bindings: clock: add SM6350 QCOM video clock
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-sm6350-videocc-v1-1-c5ce1f1483ee@fairphone.com>
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
In-Reply-To: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

From: Konrad Dybcio <konradybcio@kernel.org>

Add device tree bindings for video clock controller for SM6350 SoCs.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    | 27 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 340c7e5cf98024dedad6d7db4fea10e9f8077419..5f7738d6835c4ba999402e163fc85a07e3a47a5a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,sm6350-videocc.h
     include/dt-bindings/clock/qcom,videocc-sc7180.h
     include/dt-bindings/clock/qcom,videocc-sc7280.h
     include/dt-bindings/clock/qcom,videocc-sdm845.h
@@ -26,6 +27,7 @@ properties:
       - qcom,sc7180-videocc
       - qcom,sc7280-videocc
       - qcom,sdm845-videocc
+      - qcom,sm6350-videocc
       - qcom,sm8150-videocc
       - qcom,sm8250-videocc
 
@@ -87,6 +89,24 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6350-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Video AHB clock from GCC
+            - description: Board XO source
+            - description: Sleep Clock source
+        clock-names:
+          items:
+            - const: iface
+            - const: bi_tcxo
+            - const: sleep_clk
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/qcom,sm6350-videocc.h b/include/dt-bindings/clock/qcom,sm6350-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..2af7f91fa023bed469bbb2c071d93383dba29441
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6350-videocc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM6350_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM6350_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_PLL0			0
+#define VIDEO_PLL0_OUT_EVEN             1
+#define VIDEO_CC_IRIS_AHB_CLK		2
+#define VIDEO_CC_IRIS_CLK_SRC		3
+#define VIDEO_CC_MVS0_AXI_CLK		4
+#define VIDEO_CC_MVS0_CORE_CLK		5
+#define VIDEO_CC_MVSC_CORE_CLK		6
+#define VIDEO_CC_MVSC_CTL_AXI_CLK	7
+#define VIDEO_CC_SLEEP_CLK		8
+#define VIDEO_CC_SLEEP_CLK_SRC		9
+#define VIDEO_CC_VENUS_AHB_CLK		10
+
+/* GDSCs */
+#define MVSC_GDSC			0
+#define MVS0_GDSC			1
+
+#endif

-- 
2.49.0


