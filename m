Return-Path: <linux-arm-msm+bounces-66467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDF0B10672
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1059AE6CE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984CF2D3A74;
	Thu, 24 Jul 2025 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIucVM/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4D02BE653
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349370; cv=none; b=T4bT5aHOhBBMuyjO04vm8bd8llKykBAPHZC3KECd8y0PzxzcUnngvz+AbgU5DUl97KelouYu8Y4MPwnZGNuuudUBUkhf7szmRWbzQi8N6/t2Doqu4bckd4Fe2iLPsFAbLCDSC/3YRbIVpIyDZZa1GbAMSP00cjfXVxDoAIhzNCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349370; c=relaxed/simple;
	bh=ftsZHYmSTdNDK1xhNA6An+wsxiIuArfv5EbhQ/0rruY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7YG9RLeg/FobnvYJ9iBZzvdHYTDx0ALsbPGCnB33X4Ksoua5TuKemU8KFNJEDK93saIYE/HmVbfWRE4RcSinz09psFk6GYa1LGd+70VAl9o2IayeUa+2uJKRC5j6uWDKpTWuuu4HtxuZZNQNDbMi+ud0wWmpPInMoiU2Kh7Ckk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIucVM/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9J1nl022078
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvkVBusXf/9P1C7z7mb5VbEpYZmMjVfPSXxMRPvLOH4=; b=BIucVM/kUQWEii66
	xqWW/TORZA7g4z1+XKY+bg8t7JUMxSGU+lNQhJL6o6PecB6iFs6QupNmAK7L/3lm
	uINr3ZOqwUXT/w+++Ic+MsPhz08/IHrMlAeLZm4486nf6RmQaLTpfhiQJ43HlQjC
	NpN+OZmVK1dRLUEp2il3Hc2vhrjw7LB0qFmw9zX7WgN1zeH3G7h1+s3VZEm6DBFM
	MLgbsWkfXT84re59R2/uH925FHNgiYiIuE44b+ifG2wmaG0EwMWTaTEIU+iTRp5N
	X6Guw/N7KZs7pGjX//0Qeq3VctmJHGzR9bz9SVQAftWHSfnH/d9btlFuJ+YE52/M
	XTHRuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kjut4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235c897d378so8507325ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349366; x=1753954166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvkVBusXf/9P1C7z7mb5VbEpYZmMjVfPSXxMRPvLOH4=;
        b=DLaN7imH5luy7T/dpHY7Ghm6YLK7YOsoCJhmskDsEgY71DzO/8fqjfGmDSmrfC3290
         1MvcDvX1QCsifr4TnH7uS33P+HE+hwLlRArlAnmoJpya38xO69Gqga+UbrQpZOdgSzn6
         kQp5Uezy12VVkNEUJZaMDsI3h0GBnK8rSfjl/zsvfY72j72CIjyd4nNubFDAOMm7XIlJ
         0aUmbK8yyUKUlZ57bjYFp2s3ePnlkLUL7lKTFoheAluw479UOp1AyOfd0ae0fGa4GWGf
         x14U/mXo0M2r9TrL5gLMx038rQyEsrJ419vJvkU7GzUHS8PlrRfUdqhwzRYcbo5XOa76
         nczw==
X-Gm-Message-State: AOJu0YwxOjkGrbEu20pgJ8g/izwixOyz9SuXXZO4rNSpjW42kL9vKfyN
	egTjHgdUM7CMlampZU/73K2DYRBmZV7huhm6Z/e2eJbNfawrDQZxlbGUfhivXNoBqgHd2XbuQfw
	qCgYyH1HWoiNh7kOAoLUOj15LvCyYsO9kk5Z8WF8NtX9K2yFuI+vgDaR9/mHqYR5XoMaq
X-Gm-Gg: ASbGncsfykaAZMALjpSPaZ2LZUv9UFzorQ+MW0fBTFPKUoSZwGCMimVSbLL4ZYWJeB2
	nBNO2BD9VyX9uq5/C2ipSW4FZw13HBa8G88P5SjWYc5byguhHnN/FJyi2BSIY3S39+zpl+qaeAD
	JTmZaZnmvXwKrxc9GvxdzMw7h41z5nYXdfa3EOf8V5KVcEpklW0q0m8mwSVEcPSC7mGjG/1KQQP
	cjrglKnBaWaq2laFXaNtQOnk9yJ1ImvnvPNLB6BDRMbuzDTyj2k70J+gRuW99KP3JpzHwuUXHBr
	lT3hm7rTSyVTV7AZFa53zB16L7qjRoJVLbtOMLjvviJhh+nn8g/7f1X2AO6iwRgZ
X-Received: by 2002:a17:903:1b68:b0:234:a44c:18d with SMTP id d9443c01a7336-23f98152403mr103406675ad.22.1753349366481;
        Thu, 24 Jul 2025 02:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESV1RftWuUfUb7+nHHJvX8znKt+IEEEX2BUkusf0xIjZFIwajv/dH7ner8urS8MeOxKxAZjA==
X-Received: by 2002:a17:903:1b68:b0:234:a44c:18d with SMTP id d9443c01a7336-23f98152403mr103406105ad.22.1753349365935;
        Thu, 24 Jul 2025 02:29:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f8a0sm11276505ad.24.2025.07.24.02.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:29:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:59:10 +0530
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-glymur_clock_controllers-v2-2-ab95c07002b4@oss.qualcomm.com>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
In-Reply-To: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfX0t8j5TT6uDi4
 PFlpBTRxQqr7593jEQJTbgRTBA30CEyuDgir6s5IO9Li7FXLM81CrZCDFM2cU1NvGCqD6qgVmP9
 j1P6twYwbXq75pRHcqbQIpeHSEci4CHEw/pMt6/vA6s5UJKIecHKDIqHvXvdGFr9l1y5im/8fqC
 v1pPo2ZPuDhCidU36obFqjPW9+CWaJ5UmE/lROlHAKMrn3E2fZpP8m1eqiRbHxkGy2GYeBBvdLK
 M/I7bm7GhOKmuiSTwvbFhe7+K/Z0Eu9z8kzncKzqJZMEoiLUuw/snlkqscpTGxKGT1r7aNRYW2h
 ZkH96RzcB72lRYpkl4AaHFv32jW0Tjtzm5fvfycbAVj1sMy+QCWUfDzD0WpQQ7T+h2IRrn4gbRT
 +J4ylassiGSPadZVKf8hj+jEknj6ZgDpQ3GvJW2qblpaelZ45YLweu8gCCUHZqay9Idwwuns
X-Proofpoint-ORIG-GUID: yQDOXHrneWK7TTaWf1siNIQDlI62QIXz
X-Proofpoint-GUID: yQDOXHrneWK7TTaWf1siNIQDlI62QIXz
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=6881fcf7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=NoBSHRPQAjGLFGKXj-wA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240070

Add documentation to support the Glymur Clock Controller, which is
necessary to provide a complete description of the clock control module.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 2ed7d59722fc7e1e8ccc3adbef16e26fc44bf156..2c992b3437f29b38d9c73e3c600f2c55e0b8ae98 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -8,12 +8,14 @@ title: Qualcomm TCSR Clock Controller on SM8550
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm TCSR clock control module provides the clocks, resets and
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -22,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
new file mode 100644
index 0000000000000000000000000000000000000000..cba5e545a751816fc92d25abb4e61f1b8f4aae7a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+
+/* TCSR_CC clocks */
+#define TCSR_EDP_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_PCIE_2_CLKREF_EN					2
+#define TCSR_PCIE_3_CLKREF_EN					3
+#define TCSR_PCIE_4_CLKREF_EN					4
+#define TCSR_USB2_1_CLKREF_EN					5
+#define TCSR_USB2_2_CLKREF_EN					6
+#define TCSR_USB2_3_CLKREF_EN					7
+#define TCSR_USB2_4_CLKREF_EN					8
+#define TCSR_USB3_0_CLKREF_EN					9
+#define TCSR_USB3_1_CLKREF_EN					10
+#define TCSR_USB4_1_CLKREF_EN					11
+#define TCSR_USB4_2_CLKREF_EN					12
+
+#endif

-- 
2.34.1


