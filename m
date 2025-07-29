Return-Path: <linux-arm-msm+bounces-66958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20874B147BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 07:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A99C1AA26EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190B02405EB;
	Tue, 29 Jul 2025 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k70S/omx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF423E324
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767777; cv=none; b=Ow31mWh6hptotGFAciaI83XKztRlvggSw4FoNUcwB0IrFGp3I3pRJQqEmfvC+UGVSdFuZ6MRQ/xs3X+LXJym7aTX+ySQrcF5Dden8koMsHPzcSv7idnzE3IpqAslpsVH+RQ/masLeOc/j1BoKPUi0Cp+d3D0udXCVft9EusXucA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767777; c=relaxed/simple;
	bh=+wJgt/MZzfS8zX94B7YslhfyO7jaHuU3tElYwRHGIX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CrZqv+aTdk9S0lFqcrsOj5ZW0Nz1HLaa6QC9lVcFxYeM4EPN3iOKo5ZbSZjdiqEYs6nxiVqEdAT0sSzo+YL3lx1sRpAcEQPSPsoxEiMce8FmUB1/nWaqjUaGebR9RDEh2T3NR1FBGXaeemcaidGiXIxACAlCupg9YyXok/wwbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k70S/omx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLGvQq027638
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDFklMpNhOXJhUUzrt6WRg7BRReJ4cQT/Ou85+l3lNw=; b=k70S/omxwDDGZS3t
	IfyiJFu0OVn/kVwtI9c6iuBmWVLicjUtxP/te1cbY30lVzURDepa0wZflYlEte7r
	IQAUTQNZR4z5115R8odLC9bDn3XzbnKpPuQJC3qKt/INAmNoyJCdelu50l7MT9rr
	Lzb0RjYnq1dyRosA9qVMzgAeTfpCRKBAps76dK4QmMv6Wf/AG9sM63+xgJYtDwRy
	vsxVOyRq4G/LMaFsOE+gSKAjHjf9iXCFX12Sga3IbhPJJpDG1hLY0OX0PIvBW9+J
	2/AeTO0KOKZeGlte8HFgOedWNzn530xKpUZOi7u8/udy10gu08DaXq2T/xJIJnmf
	bO/rxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860env4nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2403c86ff97so18233745ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767774; x=1754372574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDFklMpNhOXJhUUzrt6WRg7BRReJ4cQT/Ou85+l3lNw=;
        b=DJg4HjBvPyqq0vT1vn66KFDnxTgbmK9Nr//2BFFh8jsTC2/71vxA7uAog0OF/zGhdE
         AkRKFqeocf5sn0ff+X+2e3nw1sY6faG5xBWcdzlsnJjaZnQ9ngf+irS0x7Sd++XuYxxI
         rTHCzxfoMcXDV5pkPgX2fhx+9gM6z3ZMblWlejCjXbHXiQQktGwk9JshtVzwmZbChvsA
         9YJPQyXtR0IOCr/YuQAYXT24CfPw/9nGEE1L3qsQVarHzwffnTcs5HiqiZgYzRgB8y7W
         mTVObaE+qz/8RbaMhji7VyIm/yW2gXIfPFoeZt1+oe6TH9NqfOAUpT0cRhqiHmlI4nSs
         ICuA==
X-Gm-Message-State: AOJu0YxS7xkkhHSSWBq9bk1Htf+w2zKhIoOPRxa3RlumIWIqCzEEf3ei
	GuSnkFFD1uYb0RZRai5SPRtk5Ay/JPpgxOF35Ed1csUSwrcGB2EUZsi0kOhiPiSRuKJ9pdSZW3S
	LrXPJs8OzMwe0i07cycwn4s3a9a6eSn1rnTEOnqX9Kp1SO95JcXTV2C33hg/QRaluaVGh
X-Gm-Gg: ASbGncvpow5K7TPzttMMXiNnnLhBeAt+lNRS509x928HvcdVlSRyjsf5Q57xyrS+HPf
	UuCgWH+ksJrqE8ZmKqAeD8rqC1g7QPsrrHGQbYGlQKiR8vlXQqgclQG3Hr8DNHfHKzhscEAeWT5
	Wl4FiqPEaRIrSmerRl20XyRtgeTnDyNRxUxBH3aGDKz41BJdQdPL5wBnJjVkZiX/cXi/avxZbY1
	FkxnHuChfpNlvQiycLuoMdMeSGG/f4O+W9XzumEEBPXl/JSIb3Y5LIpFrKT+J0/6eVWZqDsTPoi
	/EGCtWzb67QmAJnWsp2TsF3Hxo8YoEPrMpOgKkpAWTflaLiivGiVGfH0VzAXW5K+
X-Received: by 2002:a17:903:22c1:b0:240:2610:a057 with SMTP id d9443c01a7336-2402610a284mr76973805ad.0.1753767773571;
        Mon, 28 Jul 2025 22:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuyijweDxrMiwgBqN/idRldkyPp8drzrqj6AfWgmXdWv7KrRn2IrpZsZxZOMXJWFqdnEi80g==
X-Received: by 2002:a17:903:22c1:b0:240:2610:a057 with SMTP id d9443c01a7336-2402610a284mr76973435ad.0.1753767772540;
        Mon, 28 Jul 2025 22:42:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:42:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:36 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: BWBKoktrZWMlank-97USridIfqRanQZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX7yc/30uNX9Oo
 45GhSNU/Wbdb9hph5yFIlJSn0TRgMdhnrJapfkoVI1ffeL7jkx6r+nvMVmpCYKM3g+ogKKx898S
 lt6ytrb6tj186ek3ORCw0d9uQNx8fHuvwPWuZ1/QJPvTWD9/pTZboTYueTlRjaZKBiGlVMdH75n
 cyPKd2PoQTAdkDvrJsrvLU5MrDOgteDPDhUhFZCocLgWLDRUaIspKdVaNTo3XG9gkC6Mnjh517N
 7MgL9tg22c8KtZaKTjoUwCfLUMLCirr8u9P8srXrQ4nB9ryZRZ6HCNZmr+IypuwLGguNqKpTYNC
 g7SpbtDV2RiYo2/FgRDEJfUHlNTnt3SwbvSmlgeG4UdwuUaEtI9U+ye14WW2l33wn0AQZyznCIx
 YrFfLOfRLSjCWmNyNstcGw4NJnhiCK7s1UpNewIYFza46Uv6JS2lS0Q64r9ahdYEPcCAbCXS
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=68885f5e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=NoBSHRPQAjGLFGKXj-wA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: BWBKoktrZWMlank-97USridIfqRanQZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290041

Add bindings documentation for the Glymur TCSR Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e8682de83fb16acaa35448545f77ce77..9fbf8883678245b20d99c13cd1a7cd8c0feee11b 100644
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


