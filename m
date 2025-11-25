Return-Path: <linux-arm-msm+bounces-83296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD28C864E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536EA3AB21C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 17:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EFA32E72E;
	Tue, 25 Nov 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUmBiX5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyQze1Zu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB6C32E6BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092770; cv=none; b=spT+/mT/DHjjv0dJgtK8rmmi0OncVsfLqBgK1+KGPSpJ+uYIEN4N+GM306CDq/pNUx1aDM1a4hUKLEpDpSc7UCPZ1GtJkjbo9/EdtuciTQasyMLkaDZzrgrj4QAvRG99YjqY6DzhmSgqXzQ7FBnWqPD4MLp/xGwwBRPqJPpDQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092770; c=relaxed/simple;
	bh=Qpe4XE+oFu96iyGhRGB2R19aD+NSvO8gRu2cZLM6XWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=perO5CMwyO2Nf5rx/Y+odJIxRZsejlIPea5Hzu1fFkas/Enij/ACGIuLWgCuistcOgIuH1veIgfN8TB+BADMdSLMrBRlB7I9Styx/X2L/4l8IWNmFYxD9p5V/LB/KZACwg4XjtQOsbqL8IKTMpPkjdki9BAoUqt7ifqF8v4+i7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUmBiX5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyQze1Zu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APF7Oxk2726732
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=KUmBiX5HvuclJ4i8
	bnEL8nT4vq5b/zVcOcxbjKLOQQPtSiVeOAT1iZ6LM8w8G2uos2FqJD2ZYYU/9WoH
	E0WADa1TZOSQ2cZy4FBszvG3JbXleKXxEFJ0Fy4AwBr+4CPZeLK7rYYVNe2qeEV/
	HIUEpYGEoxkeGJ/YMS4osdC2WFQJ0op4HfVLGzsPeSCW+Ealq9uhGek35o+3huqh
	8ZqdP7oWTlAmZqr+Pg069QwEsHfUFhUuPeaBZYQa1/Qd07TR+7jjXTk2gxgwZBI4
	1hnUQEvSXVtbIGlpUQASLQYJL91YgQBhYoudgzK/0RbJQx+Agqhze5u+ItK5UW3j
	jM5DlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvsrxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:46:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29848363458so128429355ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092767; x=1764697567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=EyQze1Zu8HWqbiAFmAxvpOhti5u7WhdosDIEclm7HTDAwLZvKdeuuI2k47uCvRFWaY
         CvszqBCGVfN7AFAopKSNsVlNgdKkaQaqT2xXXyzMxriOijvoMIWRPAmoVBiSsmNHiyGb
         aBOhWHv/STRJLPGMko0hQSJ56h8Mo0JRwb7e9sgzM8lGJouM8u2awpxr9r8qw7Vs3rs5
         9mRXu7mRDRpE5ZRM6razhjCEMZPDDrwG/pBO1TCDd/pAmB52tvLGEy921zFOVsX69IQN
         7tXHjh8rtY6/Un/dRbuDJ815rQQ24umJIc7h91+tlUm4q5yqYxPAYlsc30hkd4buvhAV
         OA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092767; x=1764697567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=ZawTasMQMmgT8EcHrXCqJfRSFiK/V0ATKmkwOK56k+Kr+7/RDpMUMohPynbcUXnLfv
         pOv3XRyqQWfaly4lI4n2xwZjc8sun/dQ6kdzqK9Xy0HJNLb3vJsB9MPNppn6ZqZ3dWDJ
         9kXt4kDT+k/4tgGIUoT/lCiEmSSRHDb0iHJ6/zbdgJmo60ADErE0KqduoIOUKYUdTdSN
         8VixuBNY4u233LfUeDYloCjwEZduAahXcaHKKUo0FsQwnnprIZ1Q5wRdioiNlJdVNMiR
         D38/X10eHs1+3dkevaIpGr5nQ/JN306fu+Gj1N25HHqrOdLgEn/FwKwIgrmsEmgP2UoF
         NI6g==
X-Forwarded-Encrypted: i=1; AJvYcCXVp9YM8JTG/CGsyzyTfNw8UTNrARWU0CvWqfM99RplVWaOlQyK4dQigmedhHi46qzIuC17oKPNWMPcWIqm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9UamdULEpHeEckScx7xn6UthCiVtNVpcx34KIMMOCLiColSI3
	a4/dAciULneTcm+Qs/94HnSbviRM/0ZxNOn1zTI7mWAg4hGEOQQim5pxNKvoROXto95JFQoORCL
	pLswzQqXhWWDsCIEtrpboTDrip58ZcOGn8UuCUAggcM2KaAde1xaIRcoP6ixkylmjdvQe
X-Gm-Gg: ASbGncs39LQjGemvZ3uRgBL0Wt/p3bhRoXbH2YO8L5JU69mjQYCAEyK1GTY3cTQ8R7V
	AQhYL38XOZYtrJ7Ht86sTosBxVI0j3KLPZb4PavMrJNPauGz4aaf09+7SzELly8I3JG9tsAPWmK
	wovlmzrzDENbRPOZsHAv3bMnfNdeD9BqPvLt09IaEgWQFNpyScR58cic88AmWSXyDqkcZklimDq
	bKKlbE+eInYLMz637vomLNDj0pIPndhyPU2CL2i+cyMjMNAGlJ5jkcOHmtmbbCbrR8qJH/Wi4N3
	yPB5tMRdemJEQ3QuUiQJ4g2qArIStxSurpLgY5W51lm4OU0dYqjjvzVGQSn9QivAQ1MFK3fsYjC
	FIg7h0In8J8LBcBWUFTQm7WnTXKhO+XPwbA==
X-Received: by 2002:a17:902:f647:b0:262:cd8c:bfa8 with SMTP id d9443c01a7336-29b6bf35a2dmr205850155ad.34.1764092766836;
        Tue, 25 Nov 2025 09:46:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+KSJB2xWtxVZ8oAlfa5za4pbJa3L620mPjdtau84L8l44CqGBLK2ZdHQZmtGTniP8opeA4A==
X-Received: by 2002:a17:902:f647:b0:262:cd8c:bfa8 with SMTP id d9443c01a7336-29b6bf35a2dmr205849675ad.34.1764092766316;
        Tue, 25 Nov 2025 09:46:06 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:46:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:15 +0530
Subject: [PATCH v2 06/11] dt-bindings: clock: qcom: Add Kaanapali video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-6-fb44e78f300b@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Av2SR-r__hsGZSzi2eok0QCnMW-43rp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX+jBJNEAWeoqS
 DVP9XeBkh+t0oCVntbu3WzaVQS3BEEAG15DjhZCwiPLxWlA4QRIfJIBUF5vocnZOClZZ3IbIp0r
 1amvGb1/7k1NjT35nAFzhuJ0Vsk2gJSKGDH/T7OXQVQzGN8pcb3A6KsXjrvtvOVVFNaljMktuNl
 uEpW3pkIYQo0Mbl2w9+Gk2zxU0cyfwui54EjHQni7xlHP3rUUNGlqIO8LWTKXEuTnrgixfJ5apk
 XYv5TWHnOl7xUnKaahqpmMTYrmBX1Rp2qn490uaccdgkuEIn8GZzqiZ0QxRmvjhtEulb/J+2q30
 f0rYTcuUVcJu7HmmH2uUQwlQtGVpvurfX1Bpfzb9un0arBc8BTNJAp/+Lm8J8ui/14Yng7N93ST
 KpSoPpMFLhL0hmz0w4BtQn0X+aQDqQ==
X-Proofpoint-GUID: Av2SR-r__hsGZSzi2eok0QCnMW-43rp9
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=6925eb5f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_xnZC5tmkvlqoiR1VIgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148

Add device tree bindings for the video clock controller on Qualcomm
Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b31bd833552937fa896f69966cfe5c79d9cfdd21..e6beebd6a36ee1ce213a816f60df8a76fa5c44d6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -22,6 +23,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
@@ -61,6 +63,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..cc0d41b895c92e1d0b84067093d2d7220c671a91
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0_VPP1_CLK					8
+#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
+#define VIDEO_CC_MVS0A_CLK					10
+#define VIDEO_CC_MVS0A_CLK_SRC					11
+#define VIDEO_CC_MVS0A_FREERUN_CLK				12
+#define VIDEO_CC_MVS0B_CLK					13
+#define VIDEO_CC_MVS0B_CLK_SRC					14
+#define VIDEO_CC_MVS0B_FREERUN_CLK				15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_SHIFT_CLK				19
+#define VIDEO_CC_PLL0						20
+#define VIDEO_CC_PLL1						21
+#define VIDEO_CC_PLL2						22
+#define VIDEO_CC_PLL3						23
+#define VIDEO_CC_SLEEP_CLK					24
+#define VIDEO_CC_TS_XO_CLK					25
+#define VIDEO_CC_XO_CLK						26
+#define VIDEO_CC_XO_CLK_SRC					27
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0A_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS0_VPP1_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0C_GDSC					4
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_VPP0_BCR					2
+#define VIDEO_CC_MVS0_VPP1_BCR					3
+#define VIDEO_CC_MVS0A_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS0C_BCR					6
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
+#define VIDEO_CC_XO_CLK_ARES					9
+
+#endif

-- 
2.34.1


