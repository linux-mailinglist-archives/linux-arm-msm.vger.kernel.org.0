Return-Path: <linux-arm-msm+bounces-87829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1311CFCF5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 10:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A4443002B8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 09:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604FA326957;
	Wed,  7 Jan 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brSDKPhY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyoHiZw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087D326920
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779039; cv=none; b=pJ6vm2C4rYlSWNuuAOwsEj5GsLJCZ7NvJChODpPJBuQh2IPdJx1yS/ekdeXup/jJJxzg4ARYqHokK0T2/Bg3bxyumdBTqGSnPlOqY9w6+JZGtIUwqnAAJNGpn3M+shYM/DKazFqmnynBEZ4j43AfND1genRGDWoj4zEmzcMEZoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779039; c=relaxed/simple;
	bh=PHR9cjR2LfkJwaJ1Ww/GoV2R1RC5ssU8Xkxynjw4SCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYBG7GicHDjTOrAFLLbTCjKB79FHjBgyNvCgInKDHdr9KVFPVSnHUh/S3pTf10aC12Ry/rimzq9V2NTOBSc41gPkV/NJouNRtPhkPtPhnfmPg9Y7DzE8QV4lgdPX+S2GKF6kIK7vvyvANgR9DtQo2Xp47Wjypkp01DCtlESABXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brSDKPhY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyoHiZw7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tXHH2379374
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 09:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2i1KRiPrGnh4D4V6w8OHvKnnJ/w2uRSe8N/TBLImhw=; b=brSDKPhYWf/hJAQS
	Cmf3rKpkqQ0AvfB+j0yILipCosgLDn4urxbvzZxYbXc/uNQDFIumIHBz/u55MDbj
	TXsbvir5J2lbKs0VReI1Vk/X262B6jsAmkDU1+0El14Z2RLUqS9q5D7/YgCxgqw0
	fHOSkkYm1OIDLBKMmlhNBZOaIidznYanQf+WP2MLXXluzKaKZqigN/xbiAn77ZNU
	/hhtfDcm+j+6LYpG95qM1Y9lGw8V50Dp30WJ29aHWyFCVAiSSw6A7B+5Qizpxzfo
	AoTAV2NpXkUIJw18MRjdayBaNbXseGIyJQUzqI0X8liwtL+KP6GqbRV3u5WyKIkU
	l7pvRw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rhrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 09:43:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b895b520a2so1917157b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 01:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779036; x=1768383836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2i1KRiPrGnh4D4V6w8OHvKnnJ/w2uRSe8N/TBLImhw=;
        b=LyoHiZw7v0/fGObTW5178KHugKHYTOVrwFD5GJeMyGIrfO8n4nNDtPhT8929rdTUK3
         4q8NNrfPMtaaoD07uFKAzcVmHXlTAgP8pI39G12YhEAbST3WpWSCS1zuBPNl5thmgDGo
         G+/CCbJkWd7XVbOdn894KA+RDiEi/dJ/N1gz6elSU8xFdx4dy2xWIWQrtw0FWdj8NSJB
         VQFdeHvSgNdRzwWvYppIVL+v9ok12zVtwbvyWSOEkn88D9s5KrGXOPGn7BaKgp2BOptD
         iURz03O5/RmvvKzG39/lpCl562CcqE0UJkK4L1GJPFpwnlVVzrJTlgQNsIx/3GcFI0cT
         cFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779036; x=1768383836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2i1KRiPrGnh4D4V6w8OHvKnnJ/w2uRSe8N/TBLImhw=;
        b=TI1x7vgx5VjiUw08G4izTdMOhJY/SzLMCFFgYw3F4qQjRUA9Sa7aDydu8vDC+rkzIV
         0Y5XAcjJVRo6HeKkwKx6AQlnfMA+LnH2q1g6j5aOrva7gkvG10biV0HESolyCdp1CvXD
         Ec3HxcigfWV94Ln99jzo7TIJl5uWny9Fb0F/MdNg58aYmDDf+D1r2RQzA1Mhl/5gHcGc
         StkCMWcjx1ZU+I8BRJyG8t93ifAc5rzQJOeVkcVIvt0giRj2JgYHVXc3DBDFAFv3vDIm
         4c/9+EZ07nKxE8MyfZmwxqWsC7n1kfN8/RTpznrYUtGomLeSFkVKCp7UW8fDoLdEfS3V
         KtaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHEbai9xvrommcLFcnJOZGlvapTdPH74lF/EQ86cuK1PnrOb3R1OzFaT7GDCqmJVVwFXsZnGe67TeVEEhu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzort93mxxZa9xmFerkEvwr2MQFXGPh6pvRlNV93aMHFc3K6FN/
	s1b0p7lo4Hk6cR7UnOLZEr3XxMLAFleYCobFlYfACetJes2bh/GFe+u6f7U0s9ob10/j/pfTzaI
	ukbqRWsNd2b4Meka4NqGdgVzIghmYE3wr4ZDX8ioT/JL5Puj1VgXCI6C4DTQ0ch8wGJPp
X-Gm-Gg: AY/fxX7NU3YVBtGIh6Rratk+jP9qCMeAVpYOcEV/sqVxiv60yuHp12E17Qs+GWJ4/Ze
	RG5xJ5C+jat1eAEAXd8X1jdvLj90ojVDyTMh5cowlUoifk+DgKKbh3ApKqEG9VgP4lbc0x2FAv0
	VPK8py9gycMY5Eaze9nRCMr0meP09uHWCbttdC0aQP8AvYjnjdLM7lkEZt7+wUQTSwq5+s4WztP
	hx0ricxuXMXTQ6oKD4c0h4LCn/7RUcqbJW5x6yTYclj4kpIuNpvVtr2A2WkVeKTKYeKiZO6zphe
	IiPDjM+GIBcXyhYSp7woagV8YGYGHpobXB7H04enq275hePN/832fPVhfLRgXkxhua5pRVJj3EI
	1Wm1ayLGu424hIWjnlquUxNW07uT7WyQLCg==
X-Received: by 2002:a05:6a00:4305:b0:7b9:7f18:c716 with SMTP id d2e1a72fcca58-81b7eb28136mr1875665b3a.1.1767779035784;
        Wed, 07 Jan 2026 01:43:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGReT0Ao5bYnnyv1SHQu62L/LC7HN0YYIysBe16F298SkWzSul3y+K58RJkn0L3o9k16sKPLg==
X-Received: by 2002:a05:6a00:4305:b0:7b9:7f18:c716 with SMTP id d2e1a72fcca58-81b7eb28136mr1875646b3a.1.1767779035301;
        Wed, 07 Jan 2026 01:43:55 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:54 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:08 +0530
Subject: [PATCH v3 05/11] dt-bindings: clock: qcom: Add support for CAMCC
 for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-5-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e2adc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M9E809UxJf-Bpjq6rgYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX8cYFFYxcY2w1
 EHOUK14XAPKk93VI8TJgbJizfE5vCn0nQfL3+XBXSm+i3UXJbWJp8Xrg2XfbERJFuQFsjsTFHAN
 469ptlY73d+B+1aInE6ibuShV/beglPXWIP5wKq4kB174+iovynbombPpJ3R/lfrPQ69Ike2iVx
 8hAqYLzBnaLlpJNOjKYFINQwJWDtBeCBEpaaAbbN5tdeOam6+6pzFyYP2jwFCEWCHQS13QrJ0B8
 ZyNebCoQO/1UJffJhjAM85Z9iTSUdFUbqpvxz1fn3u1cUgLFvUT/sYaptNQ4uBhdopDvu5hioS7
 hkzt3Utn32XZs5kkUxbHK8p1LXl2BtYvksoSfJLvR689RS7PHD43faS2b1TkRAe66DH8uSGsmlz
 MapsXoBDr8D9E7+xdM7y5woF0dxroJOeRMSMBTATUS5KrNBNf1LmheP/qRvTLaQJUUpT59WrDd+
 VQ2H3Kwf88gQAibD5wg==
X-Proofpoint-GUID: jeseOK1zaifqNU8Q4TJkBSvJlgsT142C
X-Proofpoint-ORIG-GUID: jeseOK1zaifqNU8Q4TJkBSvJlgsT142C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078

Update the compatible and the bindings for CAMCC support on Kaanapali
SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


