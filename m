Return-Path: <linux-arm-msm+bounces-83295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E2C864DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080783AD11C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 17:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1415F32BF42;
	Tue, 25 Nov 2025 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEf9bH8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJmCDVFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CBF32E157
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092765; cv=none; b=I2VGAa7Im9T1TKctkwvg0ZktRpZkWoHWn61pX3KjCpgVZCmf2NHGcVB33HnrKnSiLheyPg+Nzisr5hBuca6+GBVX8WpvldVMQ/LKJMBvaIkbNvvW7YjZZkSutLr7/TIfcXwMl4RBkt2jCzYIcToGYL6mLrUgcrB2KS8dchmRkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092765; c=relaxed/simple;
	bh=QB9w6GItLzkzTjnMslUQk/qUdLLWQ/g1w/Yu5LpO24U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0vRlCFqAJdXQF3epqeyT6p/T3wEKtInzIW9zmfFAMo4xk4Ypc2qCLlnrCX5Lvsr4Y4INWdz7+SyS/ciZStIgn8lG2EXJpQbBlDJUQkmSBbrThVx9Pe120+G2xwHnwKp14OCQRpJq36Lx/M+SpDHqMLCBl7Um1t7s7cmNaM0+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEf9bH8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJmCDVFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APE0Y3M3706640
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hu7+AU6I854TY5SzAzcPxolOI3mbfryvszTpQkIyAPA=; b=DEf9bH8oeUlPfciZ
	6AgjdWsl06JheXIttrJL2TKB9Ipc28X44uOYDWkwKJF/PLntbVlUMpq/ARU2a6OO
	/lQ7VN0S98+SpUIq0Dee4xkxyx1K2iBHNsvtOdqLLAonLB3qe/SUH8jR1zI7L2Nt
	R9H/vR1voFA/++C2I8lVVkphnRSPk84wJqBQJ+9iBDwO6P77FoLvgJLZ+9V6iV9F
	xcV2bq7iSZ+SwbfpUvIJGRREaUT6SJ15qFcNOc6F+hZVs+mXV5VunEadY3ICGEjR
	DPTHYIF/qxfXxUKIY5PWfB5aBLROPBz/lTzZwpRHs8HwXxCYCd2O496BsnFEpRnf
	60Hh8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufrq2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:46:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982dec5ccbso122929655ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 09:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092761; x=1764697561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hu7+AU6I854TY5SzAzcPxolOI3mbfryvszTpQkIyAPA=;
        b=LJmCDVFP4PCMWTkI1v4TLlKHzmq8QfjLeh1mu22eOCcrzkURIXx+R0ff6daGSi8xW+
         hldR/ZJSVztKONDMuoZIpR2Ys2JZqocMQS7xVIAmPvsEfXeBolMGZf5ThUMQkEAsp4IY
         KpWNtF0NFgNGhBW2HJLNhkDRfPsL/KwVzPIazyZRx567KKOnpzVfc3/tM6irOZFCMffg
         8NHatXvlQqg16oi5bqV3k//x4gDHtA62oJ/+q5XCoGcrnd1N6leeHUXPEvvq9O8ZPdtD
         Gu8S96xyV6O81JoV481noJsclJKdfye9VrAnU0ly6ZIK8aQhDSW3FKqVvr55T/8xIBsR
         AFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092761; x=1764697561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hu7+AU6I854TY5SzAzcPxolOI3mbfryvszTpQkIyAPA=;
        b=TiwaMdbYVF2EWHcBeF9wJPJJeTcsY7zQsGwz7Ls/PMUIOMR2m3x60MlhTSd5UqhXLv
         sDx8JzJbRRSxjfMYsgndO1U3Fos1ikNG908wHDwuEBQq8qCWp4Vhg78JBfRi9vPUq4i2
         u9E9Q70tUH+Uk9OIpZe94hAN2FUnyQ2Gnwu0I0Zsy+37GY+7rmlvqOmla/+4svBAvJ9S
         Kbh+xdxs9iRAApy5b00RebChWxxN9kWf4yQQoT/OtC0Gb9TYki4wvcvIiE0+GqeTu6AZ
         xkQi08qsm9FTHdZQvyBzBR4rA7YUI0WKOnFI+oSc7tndZyByuD13v57JJC4EOeRX7KQR
         dxgg==
X-Forwarded-Encrypted: i=1; AJvYcCWfD+WltAZgw6xM/hpjaKgFon3ObZ0wY/UHl6iJd5EgM3Fzv+9FY/R4KxgPLBg/qdpOFbLJhyNp4n0Ac5Sc@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmWRwq69yqb1QFXl5VM6fFkGbAUy1STMa1DYdk2U1jR7pyONb
	heOCTVwKbvWxlVHEg75rFV66LA4Y0Zauwz72fBAwAoBJjK+IDW/yfs8m3q1Sv+E87vO2lU4H4D/
	FXzgqIl1dGIvfqFBe6GpMCjaMQMbK0IFkiuTZv0CxEVpH140xXaVF4KUUECxIWrfbuJqMep4fco
	tH
X-Gm-Gg: ASbGnctn/QWCtOpxL6P9NuqvTc6gH/xvJ+6mre16t6ZmBKA61afVF9u0G/Y6HLv8bVy
	ON+6BTiBxxsOcDXvj/1jWidMvpIPeLdbRMPXDbb+VcE6f9dAAyx4BdzVRj8cu0zEMxwtX1fyIt5
	7z9SWpZlFTxvQ6hGWFLWtzOZXlXOG+AE5fgrgm+8Op+T0PxewLUzJfeRLTTW/fvzfWQUylfPwFI
	DgjxZPrc1YGZSsx//n6p1M5NXnjf/D4HcJXdkPWk89xEIllDHcfUNafh2LL6YxjzfwJvNyzOotU
	y+BBvL64H9s8k6toWJ80JUaZL2QvvFSlYoGGwZxrp6l+IebaabZ53VGyBhwWkfhaDrS6uhjAzVt
	ndrqCChBcz6tjTGSh6XFdjbYR/l7K/ejjfA==
X-Received: by 2002:a17:902:e551:b0:295:3eb5:6de1 with SMTP id d9443c01a7336-29b6c684abbmr215567075ad.34.1764092760554;
        Tue, 25 Nov 2025 09:46:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFmbrVkNvxy+JWLbbhRBu7yzTr/BJtLSX2k+9t4RGy+JOkYspSB9gI2tta5j9dygtWzJcOdA==
X-Received: by 2002:a17:902:e551:b0:295:3eb5:6de1 with SMTP id d9443c01a7336-29b6c684abbmr215566745ad.34.1764092760003;
        Tue, 25 Nov 2025 09:46:00 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:59 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:14 +0530
Subject: [PATCH v2 05/11] dt-bindings: clock: qcom: Add support for CAMCC
 for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6925eb59 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M9E809UxJf-Bpjq6rgYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX4sFQZLSbxT+z
 MQZLKJ8+RtcWOUiJNdKau6LKGAt4JFKWD8euCkVY9K7VGlhkRE+7BFvbxMqSTiqdMEigV0Y3TLQ
 lT0fTyjoMLn8P41Hdce/UZ4dRclEN7wLyQm0CYi0nYoZmw6yYHottSJbVPN6iRIEE7g3OZKOLDk
 7Xkdp8h95fVEsz3hs3d9AbhtSgHykPTdSwJgOUqez5YQLGVSjToEYMAJOP/oqtct/TiR1GB+Gvi
 /3opX4aQRvg7aKYUnhZr0iiefXJQ2SqQFpCTn/qTLjaXGosFre5rqKoeCzYGHoZv6ADwXHdqfL2
 FhcnApD028YAiqWDm4gyDNl0K+1Tb+K7bLTMKG3ntpi0OCkb5DI6oXJyf+slZliGidHB7hKdD7g
 jDg20/TA+Gt65TNaQ47dcGyUCOwdbw==
X-Proofpoint-ORIG-GUID: EjNocM-m528O-2e0b0-7uaLGrxNy5_Lw
X-Proofpoint-GUID: EjNocM-m528O-2e0b0-7uaLGrxNy5_Lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148

Update the compatible and the bindings for CAMCC support on Kaanapali
SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +
 .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
 3 files changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..3ec9bf4d82ad3b0fbb3e58fe312a416b3580c30c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -15,6 +15,8 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,kaanapali-camcc.h
+    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
@@ -22,6 +24,8 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-cambistmclkcc
+      - qcom,kaanapali-camcc
       - qcom,sm8450-camcc
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc
@@ -63,6 +67,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cambistmclkcc
+              - qcom,kaanapali-camcc
               - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ddb083b5289ecc5ddbf9ce0b8afa5e2b3bd7ccad
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
+
+/* CAM_BIST_MCLK_CC clocks */
+#define CAM_BIST_MCLK_CC_DEBUG_CLK				0
+#define CAM_BIST_MCLK_CC_DEBUG_DIV_CLK_SRC			1
+#define CAM_BIST_MCLK_CC_MCLK0_CLK				2
+#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				3
+#define CAM_BIST_MCLK_CC_MCLK1_CLK				4
+#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				5
+#define CAM_BIST_MCLK_CC_MCLK2_CLK				6
+#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				7
+#define CAM_BIST_MCLK_CC_MCLK3_CLK				8
+#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				9
+#define CAM_BIST_MCLK_CC_MCLK4_CLK				10
+#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				11
+#define CAM_BIST_MCLK_CC_MCLK5_CLK				12
+#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				13
+#define CAM_BIST_MCLK_CC_MCLK6_CLK				14
+#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				15
+#define CAM_BIST_MCLK_CC_MCLK7_CLK				16
+#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				17
+#define CAM_BIST_MCLK_CC_PLL0					18
+#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				19
+#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			20
+#define CAM_BIST_MCLK_CC_SLEEP_CLK				21
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,kaanapali-camcc.h b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..58835136b356a558f001fa8ff74a42ae698734bf
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				6
+#define CAM_CC_CAMNOC_RT_AXI_CLK				7
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				8
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				9
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				10
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				12
+#define CAM_CC_CAMNOC_XO_CLK					13
+#define CAM_CC_CCI_0_CLK					14
+#define CAM_CC_CCI_0_CLK_SRC					15
+#define CAM_CC_CCI_1_CLK					16
+#define CAM_CC_CCI_1_CLK_SRC					17
+#define CAM_CC_CCI_2_CLK					18
+#define CAM_CC_CCI_2_CLK_SRC					19
+#define CAM_CC_CORE_AHB_CLK					20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CRE_AHB_CLK					22
+#define CAM_CC_CRE_CLK						23
+#define CAM_CC_CRE_CLK_SRC					24
+#define CAM_CC_CSI0PHYTIMER_CLK					25
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				26
+#define CAM_CC_CSI1PHYTIMER_CLK					27
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				28
+#define CAM_CC_CSI2PHYTIMER_CLK					29
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				30
+#define CAM_CC_CSI3PHYTIMER_CLK					31
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				32
+#define CAM_CC_CSI4PHYTIMER_CLK					33
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				34
+#define CAM_CC_CSI5PHYTIMER_CLK					35
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				36
+#define CAM_CC_CSID_CLK						37
+#define CAM_CC_CSID_CLK_SRC					38
+#define CAM_CC_CSID_CSIPHY_RX_CLK				39
+#define CAM_CC_CSIPHY0_CLK					40
+#define CAM_CC_CSIPHY1_CLK					41
+#define CAM_CC_CSIPHY2_CLK					42
+#define CAM_CC_CSIPHY3_CLK					43
+#define CAM_CC_CSIPHY4_CLK					44
+#define CAM_CC_CSIPHY5_CLK					45
+#define CAM_CC_DRV_AHB_CLK					46
+#define CAM_CC_DRV_XO_CLK					47
+#define CAM_CC_FAST_AHB_CLK_SRC					48
+#define CAM_CC_GDSC_CLK						49
+#define CAM_CC_ICP_0_AHB_CLK					50
+#define CAM_CC_ICP_0_CLK					51
+#define CAM_CC_ICP_0_CLK_SRC					52
+#define CAM_CC_ICP_1_AHB_CLK					53
+#define CAM_CC_ICP_1_CLK					54
+#define CAM_CC_ICP_1_CLK_SRC					55
+#define CAM_CC_IFE_LITE_AHB_CLK					56
+#define CAM_CC_IFE_LITE_CLK					57
+#define CAM_CC_IFE_LITE_CLK_SRC					58
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				59
+#define CAM_CC_IFE_LITE_CSID_CLK				60
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				61
+#define CAM_CC_IPE_NPS_AHB_CLK					62
+#define CAM_CC_IPE_NPS_CLK					63
+#define CAM_CC_IPE_NPS_CLK_SRC					64
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				65
+#define CAM_CC_IPE_PPS_CLK					66
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				67
+#define CAM_CC_JPEG_CLK						68
+#define CAM_CC_JPEG_CLK_SRC					69
+#define CAM_CC_OFE_AHB_CLK					70
+#define CAM_CC_OFE_ANCHOR_CLK					71
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				72
+#define CAM_CC_OFE_CLK_SRC					73
+#define CAM_CC_OFE_HDR_CLK					74
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				75
+#define CAM_CC_OFE_MAIN_CLK					76
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				77
+#define CAM_CC_PLL0						78
+#define CAM_CC_PLL0_OUT_EVEN					79
+#define CAM_CC_PLL0_OUT_ODD					80
+#define CAM_CC_PLL1						81
+#define CAM_CC_PLL1_OUT_EVEN					82
+#define CAM_CC_PLL2						83
+#define CAM_CC_PLL2_OUT_EVEN					84
+#define CAM_CC_PLL3						85
+#define CAM_CC_PLL3_OUT_EVEN					86
+#define CAM_CC_PLL4						87
+#define CAM_CC_PLL4_OUT_EVEN					88
+#define CAM_CC_PLL5						89
+#define CAM_CC_PLL5_OUT_EVEN					90
+#define CAM_CC_PLL6						91
+#define CAM_CC_PLL6_OUT_EVEN					92
+#define CAM_CC_PLL6_OUT_ODD					93
+#define CAM_CC_PLL7						94
+#define CAM_CC_PLL7_OUT_EVEN					95
+#define CAM_CC_QDSS_DEBUG_CLK					96
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				97
+#define CAM_CC_QDSS_DEBUG_XO_CLK				98
+#define CAM_CC_SLEEP_CLK					99
+#define CAM_CC_SLOW_AHB_CLK_SRC					100
+#define CAM_CC_TFE_0_BAYER_CLK					101
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				102
+#define CAM_CC_TFE_0_CLK_SRC					103
+#define CAM_CC_TFE_0_MAIN_CLK					104
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				105
+#define CAM_CC_TFE_1_BAYER_CLK					106
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				107
+#define CAM_CC_TFE_1_CLK_SRC					108
+#define CAM_CC_TFE_1_MAIN_CLK					109
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				110
+#define CAM_CC_TFE_2_BAYER_CLK					111
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				112
+#define CAM_CC_TFE_2_CLK_SRC					113
+#define CAM_CC_TFE_2_MAIN_CLK					114
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				115
+#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				116
+#define CAM_CC_XO_CLK_SRC					117
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_TFE_0_GDSC					2
+#define CAM_CC_TFE_1_GDSC					3
+#define CAM_CC_TFE_2_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_TFE_0_BCR					5
+#define CAM_CC_TFE_1_BCR					6
+#define CAM_CC_TFE_2_BCR					7
+
+#endif

-- 
2.34.1


