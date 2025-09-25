Return-Path: <linux-arm-msm+bounces-74950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB56B9DA77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D451716C93E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B8F2EACEE;
	Thu, 25 Sep 2025 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S30mFOZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469952EA141
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782007; cv=none; b=QyvDIff3z2MO20ap7QcLnQCmNNSh9f1XCENjSYV4ARpeDeYiO0Z2XlsnleRhEcKOREKe6N5T+o0CCKS+QRjsD9NtGLkNdZ9gKCsW5Gpva4e5PXK01kVFKje6fnMiHNLA+7ua819zpIigAdokmYWW5NSQGpSZCbLbZEFOaqqDS5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782007; c=relaxed/simple;
	bh=PmOpw/EYlFkARbCMNbiM/N6wPtAmStKVwZu0bN0uBRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7dDoeCiB/r6gMqFouAkn5GcV/5vrnba3KbbpwV04hhkRVCev5BxUz6XyizFi5ea227T9/wJAVrPWJjJSKHji17IElK9CVMyNO3a7ROdE/CQMe5xzzQtreyEcYeoytGy7YM19cVUHA2tnmLuwOHAvdvSp1WQqRk9L558OU0KBlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S30mFOZ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0oZ5h017456
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syumanWrZUjcI1O0TLXpaU3G8S6LULiW8Zo6+Nj/zZI=; b=S30mFOZ5lBppECRy
	+o52cfbcpC0Benzf0gaJwshuBiIWMbCxEsipRn0fqfV+iYcw4IquAiQ32I4RnXrG
	2mYfjjKIvOGAzF9T3KSOepHicvtuv6B7rdohC4KlpIkjSwNNcSrAzKuJsJrYr9bh
	0TI5ovuUF7n3UCUom2HebnPxnKCI6c6o3kfVnl8ts6JRl4K4IE59LyCYdZpi6UXY
	NjM8ZDqHSHF6jpDN5VE15RHtxYylNbY69LJac/iKzBEz63+TeB5J3VqoBYx4TVhL
	76OTyaGdluNrmbs7rANrIdD7RojB/1N0pspjZ5kkw3JTw0O1D9U+E3mfG/YQ2Gzq
	cMUYgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0c53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2697c4e7354so16546365ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782004; x=1759386804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syumanWrZUjcI1O0TLXpaU3G8S6LULiW8Zo6+Nj/zZI=;
        b=sKLbJeBDOp859DBIPArpmdQDPv+basnDa5YEjKjq3Hot8qbyqWJt1xnxGiVHWb9t0+
         T/Fr2nszlWqVvsN3Uv97s2xfMzwCYKBO9khLnmgjdYEUR2x9Iy5JIbPRYxBaxryM8YJ/
         r8IbUt3Pd/060JElXxJkWGuXel5h00nyw820PTsFUsJoMEMJ2zvOe40og94A+jJpIDFl
         p6aa0HYat6myRr38MeN+oA2v10mkDwEADZnBPQgxtZt898wbkCv7AHJgYRYrGrQBQlw2
         vC5YfN2azGPrNlYBBI9WiyZLARbHy+sSwbaJlHK4POnp4Uo/biiQ7IneNM2WDTboWCNw
         uFjg==
X-Gm-Message-State: AOJu0Yw3Pu3nBv2VXyFJEfg12oFKIZVYqfGwqX3i9qlvp2Y/HfT18BQA
	PKaEvEB+Bn+t7GRQAiAWIEbrJ56U5E2R+seeNo96WxlpRXn9w+vS2wlpkzAAnLE/52PZylMgCLg
	mL0PdrNu6kCXbfkzRuuX0kbUAOAQ3Q4W5spEYrjpm4RBMqo08Lmdrd/r5LVjDE2VJ3VOk
X-Gm-Gg: ASbGncscf5JEijIWITb5PK3kVLQZM0pDa5LPdx8jW4Ig2RwPnFtW1KJvE/qjz0O7tc5
	FRReAmKPSiho8zSyLNpe8GNBnoyL5jNLm46Xe86gE5LaAsDzuQmwUkr1sg+qvGHjEmSIG5gOFno
	vDGUpxjiwvaM4v3D24c3qsWMOA2nqVJVgcToS6h3y8TSTOPjG5GTM821wk2HaIqeg1fF7KLdYJ6
	ScYWaDYdiERpXbAlxs2+IrLJHpxAAHdore4plsaWLHAUZYe6XGNACtlWaOzlygwukprHC30CuhB
	bkZxz72inTDOYTujhWJN8JBzAS3WimAljNWEj18mVQs34UE8aIiYIGzhQbC8TUz9A/9ymP+969h
	u/cStSnZj+yQydunwffGkwOJpn5+wKI4ndHLrcSAa4HcujG3MvkusMeby23xi
X-Received: by 2002:a17:902:e84b:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-27ed7222952mr15709895ad.29.1758782003815;
        Wed, 24 Sep 2025 23:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIQG96ISdWLineuWqjcbxSqimjfGHXyA1YGV7BUW7KJQWHMJ8Xs+AZ3XZSf3v4NHZOWmZ2zg==
X-Received: by 2002:a17:902:e84b:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-27ed7222952mr15709655ad.29.1758782003388;
        Wed, 24 Sep 2025 23:33:23 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:23 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:09 +0530
Subject: [PATCH 01/24] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-1-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: K-7rewnR3UGw-TLwnM0ZpkGMfLH6SdHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX8rsSIynxPx9n
 9q8JW/kkokiJq33hXA2oEqXuWULuzmbe+gtFYU2HxndLe9FiNARxZ1cI2OkwzOGR1TFOFamesq0
 nZClP31/xPSv+VbYnHptX54BTPiwfWPJzNa2LPOCMlZfOXIaqzXSyRfAB/1+gpnIGltHLP4bBPU
 kopKzMrbSnkHSCGwxH1iB6nOMxhChzj30vn61OSW0qVpIm1wpI+mj1F6dqxPds964LGqmQtEmYz
 7OzjnhIDy+uUiSQHvVQwpaN7w8XXRVr2xKFSKybla7Hs0okU2QvvuAblkdZR3kCBrZocfWSUoqf
 B/PJcA+A2t/R4ik6VNYfxFAGuSSpaptkcTLMBa5ZvKqo9otYsEIYyng27cx7Gu5m1V/DzPe/Hud
 izVOmmZn
X-Proofpoint-GUID: K-7rewnR3UGw-TLwnM0ZpkGMfLH6SdHD
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e235 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KVNckf8Hb-gWPUCTgC0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Document Glymur SoC bindings and Compute Reference Device
(CRD) board id

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9fcc4d12f4e3baa001099b6e154af7..b529a8e097a35c10e0008124467d8f6038071308 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - qcom,glymur-crd
+          - const: qcom,glymur
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.34.1


