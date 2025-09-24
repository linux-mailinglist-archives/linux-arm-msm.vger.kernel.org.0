Return-Path: <linux-arm-msm+bounces-74789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F9B9CBAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE73A1B2780C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BDC2C0283;
	Wed, 24 Sep 2025 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILvBvQzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826128AAEE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758220; cv=none; b=aWdr5YUlbIVEmr2HMij8VHN0FF1bIz5Drrvmcoz7Kuf57Abv5wf6ynJp38FQSw+zxBoRy2IKeXaTJrJxxe9Sm9nSnltUrLRuhs4vqYrnH7AI3FJIm+LOvTfXsOmGwWeo2mNuhebIrgjttJE0lS8azSVM79TrZ0n5V+TkrSlsUWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758220; c=relaxed/simple;
	bh=27EUuT1PJMJMY0HYUwj2rqelLFu5tY+Xg5dShO1aD4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jVXHz9NV3YCoAhEFzgFwNViQUwLrRvRKeRkSrVk/L29yIyW7cyKXRYrUdLee9puj2IZSaWQOwgaOM18bSrG+7Lq0KFeCLnzNlrQi5Gf4mXfGUl0cTtOXiXQcB7qnzJ4X7S6QNRbTJL5kb7QSfKzkRQLf0vW9AJguB4nrUmicQao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILvBvQzD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODCR4Y023441
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJEE5mkM8VRYrT5n8DkRmcckkaultqJjWLyD42H8UpY=; b=ILvBvQzDs7M8iopP
	5CJpI/jAY3aajvg1U+5qwMuqTtitdZcyfOQl+Bf2sp9soIbL2Hq/hcUSyrr+ejcH
	cYfWTigKbAxE17AwyuZr90KsoslinW0qU3GCoJ0rrwrPuOg6BtVdqd307TL19S3P
	gFmRt2JPUBd4gHpXZI58eGoVQFflhsWS8fkTlGyvctLGTP1BayT2x+ZP93TXEzhO
	mZIJAPEZm0NnQRfP+ZBLx7urKzC5iC06fkXRX+qKSZH9p4IxFKnwEwceolRnephb
	1ZtV90XPq6qwLloA3ucXIIEmkJWDLsU7Lon/t/M/VpgOPrTyTklGWJGwvxuT70CY
	LBoFKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadn88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272b7bdf41fso3759475ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758216; x=1759363016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJEE5mkM8VRYrT5n8DkRmcckkaultqJjWLyD42H8UpY=;
        b=DaL+rHqUyoMcR9ownFU60KGWhiKWIBb2lxLN5+2HeAeph+thtYyg0rTU/tKXv1Djw8
         lU5boHEzafLOSpZzHf99EVHLuBl2zh5gRtlJfdhH2NeF1Xy21qn/Fv39JSzSewdPAbhW
         +qdp9OCJ4YySGQM85jkUfVpXZPFPxU/er/c+pOZ6drZaNcHdOEacAS3mP2WlvTnLHMyl
         ZrksU0pV07dnfsElLtSG2q1o/DeHZLPlxmzkLozez8xhuopxXXr7ARnhLmLsf1ZaC/HZ
         gjUZ7WSLKCJHmCbquWg4s/EOan03eaM/MhRZ/6eQIBD6Q8/hKyEaH9NATYIL/sGp8a+m
         v7Zg==
X-Gm-Message-State: AOJu0YzB4BN/t9HygG+GtRZpdxMLIRb9x909wL2c2iG/omWW44G2FQzV
	Gj/+5d4/ojMCwdNwkLm/raLid+zgiImfz0mnv20yiIME+/ieLIrbwkARMvsBFFWGbjNA5Aavcy9
	oAsM2EcsjX7Wuba8+Kul5fvECbeNJTbmPf32SivLwd1DCyrZ+/UsIoKeZJz1x03CvSMNH
X-Gm-Gg: ASbGnctj74370jnf6gYB3qUQASj9QePU0pc0/kiASANxHlAhwljXOG4zvv2ZlXrKMnJ
	6m0SrYkavJq+vo7l9jJIsFeKOEK+5BkqP6TsmuxwO9fHsttHkAv5iQTyny4SxT278F57E6+vuys
	PJdR7FNAbFKlEryOIJ07g92OXtN8mS6Dq977erOfK81l5+cZTYGFQwOIL4wVzf7okag1naHP/jk
	mjptZziX3wIJ1vNVYM5VWwH/DPeRvunIQ0KOW9WUAvnFI+Tt9WSGfl96CmAi9G0GAR12BleS+/G
	WjmjIk2Joz3d8Z9q2Jy2H/k0xj0ysPyNcUQdaC0fPiRMP8CRRgBVt1lbGqM7eAcOcAXF/wrHg9/
	edfPrXQOKSmSvZTY=
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr14184385ad.59.1758758215780;
        Wed, 24 Sep 2025 16:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJWQg6ccd13z7nuVk7VSbi1XJrSuF73yhddJx5KdOBXS/U2OU/vJpWRcXmqMM/HeYcdhJqBQ==
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr14184115ad.59.1758758215234;
        Wed, 24 Sep 2025 16:56:55 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:54 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:42 -0700
Subject: [PATCH 1/9] dt-bindings: clock: qcom: document Kaanapali DISPCC
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mmclk-v1-1-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=5962;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MZ7pT/zHCTj4GLSlo+0Qr1VnVwjrOBMwlzKiEU+IMYY=;
 b=0fP1HwPThy+lD1iokHsFgCTin7xsW2/8SVdo2n7kMIlxkRAKB5HbDnxgRGtPkEo+a8ep+dKGT
 hZORM4ikJO8BOCyO+Piyq0EcbuNxH/HZNGBBMFeZ6nCDK0S4OhBRsnL
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: HPUKxwP3gCAgrqbCLTKNZts0G33XtkPb
X-Proofpoint-ORIG-GUID: HPUKxwP3gCAgrqbCLTKNZts0G33XtkPb
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d48549 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1bJ6dZNBIeh337jv8YMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX6KeUIuYMRbxO
 v+4tA558lgRvnv4We42uHisJ31+3X/T7326daWDw41GwXgDp4KhDi/B7VJupVThs5NgrSDaRZIn
 3UdG029K5mT9zHvjaArzzMO1eJwWt5cJgiYu7JSJLn1o+qfhqklg96NAn7mAcKRjUyKlMRBDCP0
 zB4ejUhRCxaMCleM8aUVkkU1JoR4gqvFUhSaTBHrEvY7emZ0HuY/NHJWQljC+mvxuVibK5mZC3A
 wL7Ai1r5zNi8jnMcTqjGqxFXX2y4LPw9lgLMLGHsBAmWpsNf4x/JDIhm6SLx2FNFgukjaPLQWCt
 VlOygGassvAKHcdudxRM2Od6pANHwUAU1hwgNMvhDMw6r7cKZFg4tYNaGcABLgtXgq3fc6qahcM
 01Novw23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Taniya Das <taniya.das@oss.qualcomm.com>

Document device tree bindings for display clock controller for
Qualcomm Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   2 +
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  | 109 +++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 30e4b4631575..591ce91b8d54 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8550, SM8650, SM8750 and few other platforms.
 
   See also:
+  - include/dt-bindings/clock/qcom,kaanapali-dispcc.h
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
   - include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -23,6 +24,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-dispcc
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-dispcc.h b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
new file mode 100644
index 000000000000..05146f9dfe07
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-dispcc.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_KAANAPALI_H
+
+/* DISP_CC clocks */
+#define DISP_CC_ESYNC0_CLK					0
+#define DISP_CC_ESYNC0_CLK_SRC					1
+#define DISP_CC_ESYNC1_CLK					2
+#define DISP_CC_ESYNC1_CLK_SRC					3
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
+#define DISP_CC_MDSS_AHB1_CLK					5
+#define DISP_CC_MDSS_AHB_CLK					6
+#define DISP_CC_MDSS_AHB_CLK_SRC				7
+#define DISP_CC_MDSS_AHB_SWI_CLK				8
+#define DISP_CC_MDSS_AHB_SWI_DIV_CLK_SRC			9
+#define DISP_CC_MDSS_BYTE0_CLK					10
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				11
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				12
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				13
+#define DISP_CC_MDSS_BYTE1_CLK					14
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				15
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				16
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				17
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				18
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				19
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				20
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				21
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				22
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			23
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			24
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				25
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			26
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				27
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			28
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		29
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				30
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				31
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				32
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				33
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				34
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			35
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			36
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			40
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		41
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				43
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				44
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				45
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				46
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			47
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			48
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			50
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			52
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				53
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				54
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				55
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				57
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			58
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			59
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				60
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			61
+#define DISP_CC_MDSS_ESC0_CLK					62
+#define DISP_CC_MDSS_ESC0_CLK_SRC				63
+#define DISP_CC_MDSS_ESC1_CLK					64
+#define DISP_CC_MDSS_ESC1_CLK_SRC				65
+#define DISP_CC_MDSS_MDP1_CLK					66
+#define DISP_CC_MDSS_MDP_CLK					67
+#define DISP_CC_MDSS_MDP_CLK_SRC				68
+#define DISP_CC_MDSS_MDP_LUT1_CLK				69
+#define DISP_CC_MDSS_MDP_LUT_CLK				70
+#define DISP_CC_MDSS_MDP_SS_IP_CLK				71
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				72
+#define DISP_CC_MDSS_PCLK0_CLK					73
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				74
+#define DISP_CC_MDSS_PCLK1_CLK					75
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				76
+#define DISP_CC_MDSS_PCLK2_CLK					77
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				78
+#define DISP_CC_MDSS_VSYNC1_CLK					79
+#define DISP_CC_MDSS_VSYNC_CLK					80
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				81
+#define DISP_CC_OSC_CLK						82
+#define DISP_CC_OSC_CLK_SRC					83
+#define DISP_CC_PLL0						84
+#define DISP_CC_PLL1						85
+#define DISP_CC_PLL2						86
+#define DISP_CC_SLEEP_CLK					87
+#define DISP_CC_XO_CLK						88
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+#endif

-- 
2.25.1


