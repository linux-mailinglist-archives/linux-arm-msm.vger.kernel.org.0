Return-Path: <linux-arm-msm+bounces-65285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42185B079AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B9E1887BA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276232F49F1;
	Wed, 16 Jul 2025 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtDk9F8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D5285079
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679241; cv=none; b=Jg07YZ9557hs4c34cBMsyhj45NBvLckXqb6zkwJjg06lI9HPqd57OlPAzXXUiFuZxUAx4qhU6Y1a0pKESUcPxrTvZvvXbETR2JY8k8+hzfojgLbo1in4cRxn2a8XkEOR/CnQUPNCX4O70pv0foPLgVfgw7lARilgmxwJjYVyIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679241; c=relaxed/simple;
	bh=FHbMUWIwDLjzzDs7EACZx+RwtXAev+AhH2JinKmvF9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Eqgq0XLPaNu8kns0aaNXhcI4pswHuLOGPyG/h0pTR/kvlWGt63QocLNEBhKBp4Ym2xp6I4lRkPQ5z9wckKowoxx0c2iMUueKeGBZUfy+hul/0ibiImYs5ojjQyA1a8rqwd7t3nfPRlCfd4JTzC7yyTMxcsbh/85vexqsM+NWGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtDk9F8P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD5XF8007290
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bH6uNs2EMbe
	7CtZfXiVtThZ2PeSVgjpvGZz47v2mqpE=; b=jtDk9F8PHMl9kNWkKwMSmXcULF+
	PUJpskpLrHiP5JfJTBa9vy8RPQ86XDjZYX2apQWb9vIw+IDGmmBtyE4BTyIUBCaX
	P+30Jrac+YckoyjfoBi9QDjmd1ABQBhxed6P8Mpt7voOnt65a3bkRf/p8BPiGhGb
	Wk06ACWBxQ85RVvKBhAFUjLJSJSFImZkht3cbEQv7nj6aUo1kBUmaL0Pg4817yb5
	cCk5jVzhph66+XXMqIrLppd9xuzauJK+VzSFqU/BnGUeFp9az3sFEt0SHRFaA4j/
	N7hqxiEcMYHxH4ZfeKQhM5SpWGRtyKvkSHjUhNZVxB1tdW745Ql1ntP+uzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5vp19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74ad608d60aso32662b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679237; x=1753284037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH6uNs2EMbe7CtZfXiVtThZ2PeSVgjpvGZz47v2mqpE=;
        b=baKOpJsx/WwnB4v4w/g78NO1J1VAvodBWaVvcMecMtk2U7ywl+UN/57Cnm7n4rp8kQ
         mtipso5iDsNJhYWB+8gHqBmowELgV4rICi/8vz1Rom9a/fat4CFqBkUgAzC2KSXdaLBy
         W4pJ0JVtil+Cws1hpvMlTWJIedEkHwYBmygfQkjJPZtUcWWQ/zwPisEodMyhwIOOzMW5
         kHfDpIkP5876ztwJZQgDdmHRbumaDpblSsWLB5K4bBmkf1BNs/IYXEHyzPewpHFeQij3
         Rx8ePY4ElhRCYIMYyj80Q7KxtXKN3ygumFIK0Qi1pJJWv56Qfq6uipWTdi68kLieOMfR
         2IbA==
X-Forwarded-Encrypted: i=1; AJvYcCXXzD6un8DJMSFr3zsxFRAAL/tRK+oWgOLrcYbJysNHTBczY9YWenjRXWF8oZNUfXvKadtqpiFftSIf6Nle@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh7N7HZaYz/I2ioFn1/gRDSFj5lRkltXPuXUJW1my5oiPz7Cmd
	qaLzip1Iw7U7RTrzV8e8HSEJKRdvPHzKj9B26vz7F14NMLjDXWHW1PzP8znEg5npvwB1oMWOijM
	gJuvUT46iyZNwINMozO/m/4BqkJ1IJdOWxs7u01oaqQw9nJQQJWZQagg8yY5jJ1atAUfH
X-Gm-Gg: ASbGncspYBREgfwuPw83V30cQtv2lZtCYUBVMqjdK32ZQ1DJEZ9zlHmDEUhx4v8NKcQ
	jkiUq6kbHLGWBRS45w7EmuJM0FRAltIq2B5oz1JYZGTUWjEM+uU/G+Whd7BUCIGVE8/UeX00zPN
	HUI9F2e0IH9mqBbHTbteSWEJNRt50Hintp9en+EcNxPeXEKs1zhqYqq0URf+x6wMpNl/A3JQD5c
	jhTC7OaF8I5oWdd9szqRYlzK+pRTl6rzmsyRCaw1mBDcbvfDjF7eG60XHwTUQaEN/mrJr2k/jaL
	Yx0OnKxfiC1DOJah6xEF270wgakU+J4PfSy0NZqI4vKaHGSE/rAkIFJVPDZPSNeBum/+pKF5qRr
	c7TFITGSelqQO22UVOoknsgynKvCV9elWfNUcaVNgd7bH8ptRhafWyAeuKcN0
X-Received: by 2002:a05:6a21:6daa:b0:234:98ee:daae with SMTP id adf61e73a8af0-23812457aa5mr4461477637.21.1752679236028;
        Wed, 16 Jul 2025 08:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBtaZlHU0tQo2Ac+UAKtWkfyPrldBaiGlgpbsQEnA2s8MxScmuw65VlcnWVn6PGRrM3sdiZw==
X-Received: by 2002:a05:6a21:6daa:b0:234:98ee:daae with SMTP id adf61e73a8af0-23812457aa5mr4461416637.21.1752679235516;
        Wed, 16 Jul 2025 08:20:35 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:35 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clock: qcom: Add bindings documentation for the Glymur TCSR
Date: Wed, 16 Jul 2025 20:50:12 +0530
Message-Id: <20250716152017.4070029-3-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6877c345 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NoBSHRPQAjGLFGKXj-wA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: dPkNBW9yblloLaKdXUNRzXkZpbqQufyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX4+VvQAELqqUW
 k4CCm5xmYbH2DKtAA7b3WJlPRBNCaCUXn46R2ce90A1uJY8L5UGFQjQkRWI6vDbuJUmZYNxCh74
 iDKrva6+OMRkUP2sHQCrOIttSRgoOdblAIU/S5ZwapBx3VV4nVxU2xX1zWz8w4IROHAwIEFBUVY
 +jNG1OPu+DwmsIMowUXeCZAKbUhxVPrRYgFAItQ+/L+nYyw24T1s3gIookQp/JZWGk/un8Vmu+m
 ImU/biy4d2dNwm7mYGqOOgf1EnAwLUVrQ/wOlrU5NOF0l+KahR1zZKcujL1NY3aW+d6UhGujW+Q
 4cZFgI1ZH6vwkDLPB41+FQhbUhzIMGqwF7ghOpvAZCS2ik57SBVhuNBRcOEg2yhb4CyOd+9wg0q
 W4pbmXf4TxxXeIzYXLfD7Cd9C90Z1X8kNkEfCp8NRV+2RCskqmY7Ma3NOmVallSTP44620YB
X-Proofpoint-ORIG-GUID: dPkNBW9yblloLaKdXUNRzXkZpbqQufyW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

The Glymur TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
this to the TCSR clock controller binding together with identifiers for
the clocks

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |  3 +++
 .../dt-bindings/clock/qcom,glymur-tcsrcc.h    | 24 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-tcsrcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e868..9fbf88836782 100644
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
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
diff --git a/include/dt-bindings/clock/qcom,glymur-tcsrcc.h b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h
new file mode 100644
index 000000000000..72614226b113
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-tcsrcc.h
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


