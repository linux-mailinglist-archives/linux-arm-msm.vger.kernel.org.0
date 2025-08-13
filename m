Return-Path: <linux-arm-msm+bounces-68910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0CB24368
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 09:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC5D4880F40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 07:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3445E2DEA7D;
	Wed, 13 Aug 2025 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSWPPfEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947FA2EA47E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071767; cv=none; b=X2FN3tSqKIXaQ6F2XL0JDzppNewFWsIrg/c9dFI7xmSBgbcZxi832P4nfDyEWnL+OHt+JqocEN95Zfi/44DR524jJW5ZiqJkDnlpriY1rbLr8GYpJNQV9XAwh4BzTLDfTExDFNSgUm9o5JSH1DRe10YegJ68wYl2Oy4Bww/Nqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071767; c=relaxed/simple;
	bh=sHf7vbULTz2C/ybAwmFsk/gb/8n1wIkojTIqqM9GJ2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tz6KbPc0oCDjtk/YaAoANQ2botpqc3C0PnQcEl2ovbpeFnu1uwlK7OTJTGuJVsyafTQrYiCn55IRmOgWaVOaIA+DKv6/wck4PekxtTe81Dnbox+QPZOf00EzSrznIH8lADXNR+tg6G4iJ0gDIaUrCrSSYBWiQWBBkfSv/Ol17kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSWPPfEs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mSan015796
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUsD0dVnhmqkRsajdXDAuWEgzh80GlwERn+EBG0yzc4=; b=VSWPPfEsZhieDTOx
	To8YnaE13MmNjVCN3ulAKV6jKfDBHs+tvKwn6z0RsLGwjr1olOGwihF67pjLMlAm
	pYT2UqTEAXReCQK6KNHclJ00TROfOGtH17Z21I69vj8TP0omGeGh8Gu6mHX0fdWY
	JkOJWE4MaZptPVlN+S75I43XrJYMrbega7JfX0tlIu54m7sJUM7YHdro3viXiYfi
	i7AMUPOgwkrRBPL2g9DL4HwPnB5osjvKzQUhzxw+vqGUXUlOCb/h09H8eABdQz9h
	QNDjsfxoT9bPhiZA6ORqzbxh/AtvC+abKphmpCA1zsyR3z7fr9T33uEucsRBkjCA
	i3d/dQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbe5gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:56:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74b29ee4f8bso6498656b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071764; x=1755676564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUsD0dVnhmqkRsajdXDAuWEgzh80GlwERn+EBG0yzc4=;
        b=CrDmpZkHu/CQat1YFe2yZsCB4KvQPCVfv+v32HshLT8pGs9rH1jFUXttQ6XOR0rjem
         0V2SqybYc4VjGhHAIMJrotjeCcpjfShStp3+KLaELaUF58rlxpcvLIcO3cJgh1qS8GDR
         VFgdWVexLSF5lNprDovdj4mHSnWW5m07P6OiOsTI1ewJckLF+6PkSPaiS7L/c2ZmRcWt
         2d3D+7U+JLylclVLtNp6ilxNUHz5IIyyFoZqp+ShAmZc8A3BS5aN5UUdeun/bDyQnMYk
         nk0iishpINljJVJ0Y5RuwRkUiu9YXWbqPVapQkrryWobko0wSk+zxlQCHUF8lMXczunD
         iq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYFkWtf3Gr7Eoymj5R9cPZFwGjjOtDobBwp96HGYqWvPFYsVII8/PfObQmgpGhBJs5ZruuccUDiQDPU002@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeyjNQZzrJ68QiDNhqe0Ajs1+SiIbbnCs23p/HAN6byWn3Wdv
	b8fIb8SsEctlRuF/juvZC+LYQlULg+1oQWZqk3E64rU6CQbx+/iDQexVuAZoL+tNtVuvfeONP3u
	6ZCb0xg1k4bWnFQcr1uIICVF8FQfQBEJ4XtBp9IEV0H82uW68p0oYq0tpB/S+90d7ZYkf
X-Gm-Gg: ASbGncsrEOGHtIW56JmDh2PnFrbtaPOEv7oe2sv6ohWSP5Kv3z5NX+a9ESKW6D/uc6O
	PO4PRTc5CjKGHsR6lRLLC7ptJy8LCztOzpBQDYjwH4XXesMcXiXmP345MVzWxYenJ/5WDgqHIvM
	RyisJg6Ni90xDMvQNd69eSI3uRdp9OL2D/HRa04QRORQR55borz5LIwzj1TNEO3kDQptRSQg1mG
	efHp7VDmh0bnVIqN76ekcz9/NTHc9RXsfEEHj4XfRobSb9+H/+9oLK8IRNPIrrp6lryvNj4CnlY
	l4OqcDGIADXIvnh7+Gvj7wo0LIrnEdC0d8rUeJyJ3NaxZ3BGcmjMA0h8+ZRC3vQF
X-Received: by 2002:a05:6a00:2396:b0:76b:f1c0:224b with SMTP id d2e1a72fcca58-76e20fd02b7mr3433305b3a.23.1755071763973;
        Wed, 13 Aug 2025 00:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERFxv9gFWTq8pe8BgE9fFX8Kld5lCGhSgqJZoo2m38yCdBawTCYOPwqUMppj5BB8hBCFL8Dw==
X-Received: by 2002:a05:6a00:2396:b0:76b:f1c0:224b with SMTP id d2e1a72fcca58-76e20fd02b7mr3433259b3a.23.1755071763502;
        Wed, 13 Aug 2025 00:56:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm31395754b3a.65.2025.08.13.00.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:56:03 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:25:18 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c4514 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=NoBSHRPQAjGLFGKXj-wA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX/p3sd3g/rumr
 puZM0lBhH4c5u1Q3LE/gmdGgWWDxyhe5vtzXAtjZJS5dVaB42ke5U2nlCxUa4zPOkoOpVUCGpMB
 D9qhCjaRxn8jFM01cxqFJASaMGuSYhB6czQlNEyi8ioQd5GTjgIhaGb0eZYOfr2t3eCDQdGCIFY
 DUu5sKCPVFHQAZeiHZnDuiMBlYj0io4FAEgBNPrd/jRnVot/IuwyPfAuVY+G7MX27NkxVdUn9rA
 DoBPz0JL56UBggguxdRLOjOi1muoOo1s/35cygdrK5FGMORy01xh34oUvhVa5QeI57jqzOjL0OI
 a9BTeypKq3SARetI2+f3yNAuVhG1/okVVsYlG5kRpdRePVVjSXEi32UQC6T2PgBkeTJiwWWiWo3
 kEBTL0w3
X-Proofpoint-ORIG-GUID: jV-tOl_92M3zF5_M9tq-Npg2Sxrm8433
X-Proofpoint-GUID: jV-tOl_92M3zF5_M9tq-Npg2Sxrm8433
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
this to the TCSR clock controller binding together with identifiers for
the clocks.

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
index 0000000000000000000000000000000000000000..72614226b113bb60f1e430fc18e13c46c8b043d3
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
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


