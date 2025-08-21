Return-Path: <linux-arm-msm+bounces-70041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DCB2EC11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 05:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B211CC1FF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 03:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED6B214204;
	Thu, 21 Aug 2025 03:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCHRZkIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35272E7BDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755747422; cv=none; b=CmYNTVdZWOSfRxyCq+6QVOIQgpaBxWzREDf8vY9zK7WfUi93GPEraIuo9MG7QvB9r+9eIyCrssXa9AxhMR0YDnwzD92F1tG+qG4tcyVabNYsPveSEKxOURR724DGZv+oqg/LB1yTQaY69/wj9x8qodycHzH/8GWyXnZQhrFYQD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755747422; c=relaxed/simple;
	bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEcIx0PM5xt/90aiJuM/emo/aAAniv6wyzN8yta+nwMTZwV08spzgUWoCG12JC+5z1aOeq3Uy6PcsjRFJKGhbHILRAb9jFLR8EcsFVDpJUB96+KCHr0vN9YyJ41dyAxce5VbXOBNNDT/VeyWv9Rtt36ZFWRZ1mdVCbvUh6thOII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCHRZkIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KHiF2P008766
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=; b=HCHRZkIerCrMIhrc
	87VO+DoEZ6hB0/0EeyyvC3X4A3eGq5t6RZDk2aw6QOCt1EYvaT+EYWhiM+LE0bnu
	jGRnHpleK5IPrsILfVxEfQS/se6idJMqUK5LNd2LqAc4VEPdMBr5fIOYepvh4vFm
	IfeNnzpzz0MptC2e+sOnQXXVxQZ3UwrZnXXwR4Z5qkYQZ/cnm6eI43agHp+pX0oY
	h+tJggu38AV589419Hk2pHHVeP2lHPart0Q64cTCF/oQgXcd1bCn2ifYDBbzySZZ
	mBQueGiLaiPADakgYGThtmIIjGyAfOShcr05MHC/EmlEF9mM7NDomKZPPvZ4iLqB
	60PumQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a3wky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:37:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4741e1cde6so422021a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 20:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755747419; x=1756352219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=;
        b=fsbNH7tO2a1MBbYMqr7uANOEPAYlbgnaIzg4Iq7m6q2RA7x3j/1VGMDTmxcbDC5NC5
         vrAqk2/AipotVlUSKwsrpirx0QPqCT4XLOcCgB1oypSfoFjDTBFoBXsKzxOBJFs7GB7v
         l8SWhDRayoDgHtQTKpgqqqiFvHLlQGi3Rc3sG4hyPlOgmkevI9o3jhGPwSJ2ojYphzM2
         ypcOibYp3pDW3lfr7Ayvj5vo6tJrJp1NgsQfdKTaJYEtCRLYp5Q3R7zSrBPJdu7udZ1W
         wYIfu9x6hW8CwzULMIZ90BmVIW0bz/qzr0F8NmwbiDbJOGLLEpIRvFGL1fKL0KibWIbh
         LR+A==
X-Gm-Message-State: AOJu0YxN7HMF/VtA4eA3/HTvrtkOpITxjYhmROE9rQuo+AWC48ZHeVYf
	dJxUPDBqtqx/DfbA8iZVwa2903+C+HuMe4PtcfJPktWXHQPc2BJHJxzcv+fLf4/0NjnqZ+BB6RL
	yKnW25fPRkfuKbxvE5ZyubH0+uUKvU37iR6kUOC58MWqzUoEH10aOfXhtuf/RNpg7ba1M
X-Gm-Gg: ASbGncsCJp8s2QMTaeXotyWIHe46d+iOMaJ0yWoqyObWjsHWBOd2nxbDKVlHMXHNsDC
	pGI06KVgfErCUFFG/XczNAlOHY2swnf713IxGoehyarBg42Vi1urVIzlCWC1VwDteZanYM0NLVK
	duYOmtMQhNV75qD88SPTB+UT2OqbJG27tLESLWP1YdUU+dnTouas5fB7anBCz9ogPys58toK16M
	AzRWP1PLicvsqg0gEzW1G0KkR67A+LI9lngvsHIJh0yMvbaxvzYD9njpar4J5Kuuf6JSl5Gc3Fa
	njYIy4OejCDop+Vra4C56w5VOWm/6AmCtNhVkfrOYqqonoqrjitBLrJx/9QRDJtLQp+MpQI=
X-Received: by 2002:a05:6a20:939d:b0:238:f875:6261 with SMTP id adf61e73a8af0-243308a4f58mr1229006637.23.1755747419161;
        Wed, 20 Aug 2025 20:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRCZqNHbcoR5WRlRmiFsb0AFvSf5jLDkfv0v1YD2XuyCm5lD5AFBOU5mVx8s9zqhkJarHeSw==
X-Received: by 2002:a05:6a20:939d:b0:238:f875:6261 with SMTP id adf61e73a8af0-243308a4f58mr1228977637.23.1755747418755;
        Wed, 20 Aug 2025 20:36:58 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:36:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:35:56 +0800
Subject: [PATCH v8 1/6] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-1-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747401; l=1231;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
 b=mOoNvDKKUBqUis++AdmyjQhAhpayazMlyAI7h/rxX74lbKBENchjmD48LzidbrrwemcyCDR8E
 ikJa/jGaKlYCBVOdRSYFe87K0ezatz8sbGSHwxJljoVUp4+/RX7rYnL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a6945c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5ixSZjX4nqodb9qzXsEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: HLX4eRAXZe-DkdMH-rkhpRCp1jC9_UWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwBMzIZSbecw0
 O+NdlDaK2JfK90uX6+t4amFL+tbGkOm/yhzU1PgHvfiO+UO3JZVaTFHsgC5cMamTyrgurTdfivA
 Q32he/prQQMoPscYt0ti5HHEimS5QjOXBRjLU5JiT2V9G7CsNb6H9HiOLLGEsxu/EbjL1OuL+Dm
 uQf8Y8//43fPuWOli7GcDa1Sw7AzsDHiG/YK5C+XLlP3w+rsXSHSbO025FrC1I1aR70/XDEttwC
 7DLHEzkzZX0AWUSuqUj+OEh2owi8H1P/YERleg25pVhzKxT9W+qwwQ9RdQiu4gL5MOx2lfmDMf7
 gE43xQeptNjaCTMAYZkvyIGRb/l60qP6d95EvOjbt2dw/uGw332qbByapgxvNnOTVWGzQ1EKidN
 DeIuP1t7i+NcjpZ13k06j1ZD4GPopA==
X-Proofpoint-GUID: HLX4eRAXZe-DkdMH-rkhpRCp1jC9_UWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1


