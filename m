Return-Path: <linux-arm-msm+bounces-71192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34506B3ADC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2B2583309
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4045E2D23B6;
	Thu, 28 Aug 2025 22:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXaf2jas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB32C374B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421308; cv=none; b=FhaR6zYZyxc0YY51b9m77petTrudd0dEDX9l0esLRkP/DawOInY4RPfOoeHX99dWYpMPRH4Q+dMhE8C8zVYsAULpiDu0RppaqJin9GGlJZJsFTp6pC7SMlPs7voic2Uqz3q+LRgv9a10pKKMtxPD7Qv+nllLyrHwo7x97IaiCos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421308; c=relaxed/simple;
	bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPuAfAKKBh2zSD/CkHgdF7SVd8tm0KNua2ctQCmHnRzYL2Z+McA5P36v9jo1aQ9+iPKIIMDiCQXPYjZ/zpWioEcbqNsEP6g9PDlUNzfOnBfgluUsYzS+pdPeqCjRVESSvMIFMdz8V68sRz6AZGLZcSIIV2X2l229uf70ujk/cno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXaf2jas; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWdZN025049
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=; b=pXaf2jaspyHIpMVn
	hprMkRQd/uIY90UJjgr9VTuftKB0btKHUysmgjAwaiq93j1kE3rbFPserZ/I9nyP
	S2XzYdTTjsXZ1r2pMYhqCXx6+vEKtYS62K+yQHT1wsjKQpPDxnS8SV0grGr50Gig
	qa8BqpVRp3+4b7w6hqVQt4w7lRnys6oVGvZnOIdE8nQzlcrfhi97RtMIZLymuaHf
	z6rv3rfPmw3lRsgxGFd1bBaTmsOHDdEO4W7fTd6e/fJQHydOfNxKvAXcJjunsxmi
	60AOOjWIgF04sqyZTogUj9KPeCUuPAvvPVBVWcC35KQv8n6FCmQmu73d0U3ppHe0
	Zb+0zQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615sy8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2d2cbbf9cso41398981cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421305; x=1757026105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=;
        b=SXJKFDYaMFJl1ljECDY0V5epAiRLYAlCYNKqF1nD7vPXcmjxMwvHrPQsxqlRrlH3Yb
         p5791oASPzWcbFgixp56uCGTe5JWxxPhhcxXDt+PaIE09yIyhlixDjhynqNhOIZdaxY+
         O9OnF/1/quElLaifOHAwntLwOYuzzVH6dXZ+1OTU6XqenDhQ1HuOJ0YOeWGmXglbhv6p
         0/NQP28PpmyrWIUBa/VXTq2mwgBV9NO+9uhFT1/eqdtUuBr5Yr9ah6nHY03XakEh2Q0c
         MnLD1GGbpD06C1Q+tp6gAQqI/xlzfyNNeBRyr7ADCyCOGufZ9o3q8Akzy8+V4+dCKw4t
         I0Zg==
X-Gm-Message-State: AOJu0Yz5lqrfNMP4pJzGxfOZEu4m/1aNiF3fYpuet6h36FuU/XsyQI3z
	HqCu2QsYBST+CplnuyRnxb7oWysccIUjSoX0Zm1jynsfzY7K6z6QG6EiSe6FXHeWGpfa3A6jw2D
	MmMZeVnWk6LlE+qCEdKzlGRdZiSaVFzzyn44zD+fDdsg2wZR2EVeyizYGEC62GvD8Deoy
X-Gm-Gg: ASbGncuPkEARBNEOzTsMAPU7tcvO5GfV/Z/Q8W/Niw6ePe8Ay2QPyEuLpizMdf7N0o6
	deyj2RBW6eMNlVF555SAylQ1MsPPJYehx5PuGiJ+k2Ruc57YUSXmHj+sg6ROcxIHpZvhGSfpMZQ
	/dE7BHc+2s1FZXP5454KW92oAnPYfDiwLZIaB9duxffglzq7HQV+zgz0o7KkP/OFuj0vSO1Keg1
	uPiYnTBGPenoDOoXS99zprGHtKbNA6XKfbTJxN2xwf5kzeYORxlg3XiuJG1C2fm1mRUMCc2SbPz
	bWC+6bFDQky+vLcVZbKsWqqKWS3XdIS1jrQIwH9TSjRG7kQeYQv1pWzHppXs8tINfTjS5xkVLrY
	K1g3iCJzqeHzdoDs0+qx7nr3AWIUODwUu9ztRfXXG51I6j/iYJ1Zu
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id d75a77b69052e-4b2aab8aca4mr318535251cf.73.1756421304834;
        Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOaOKIaf2gQXbFaTcYE3UUBr+6LweGy7t6jUudPKOzD+KugsPTc/esP3MeyEzVnJtBeiF1jw==
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id d75a77b69052e-4b2aab8aca4mr318534781cf.73.1756421304194;
        Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:16 +0300
Subject: [PATCH v7 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-3-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyweOQwCO+rx4f83aSf6TE5GnLajMRr4KfVn
 ESULxvnJhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1ZIRB/0SZBALvHgk3Yngot00vR5KhYi3qn2VB8YGMhU3sZV2nNCmtZdtrchmslJIRsHamS8NXeB
 ptLOSexHR7ZBf5yE4YERhMP4347hHPbisVx29VgP+kyu3htD4qNYwSvjMGQdlUbFQL0/6wiG3pE
 OtpkGZI/eHq4V/aA49PoUNRWXb/VUwE/UkxgrmImOSl9sku5HgXGyIMhrwspV772n2hry8aKlcU
 kYpYKniZxW2YreAZMtdFX7Io/brm2aTpZgpvmCJ9+zjqO9KKJx8uFT+gRBgi4XA6QaF+35KgQG4
 Yp8231dT3UaO6dt+1/ZlTyoGML5+dXWEdnzlJPiSxbtsDnqk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX2rdr8yD6LfNC
 Dt8ETbSF/XSwHnITqC4LR7qWw/Jgzut92n8556KsGtDqAHlgzqNggTD7AgcN9pVNh9PdusV4Ab0
 t+2M9ZK/hvU5UUTk6s7Ht+H4ZoYJgI+nubV/2LWS+0uijs4BQjsIw9Yo2DLigT320DxZUmJquwh
 g2e6uDtdh+Ow01rFrXJXeRsFBuSa9jkYJIIPqTKHb1iS4sqTH6vAR+N4ccusabYIzAeC+8Wq0W3
 RZ+lhwpzr1VJlfIBbAUCLvufeH54JoOuc0obYdOdUmkarp8K99mFzplwfkXk/3tCLRkK6rO64aC
 xcllK3HTcET/QNMkJevW/SC3Udb56VNN1/r3O7FubC0eQJP51dc0Xtakv8VT1jXTShtLJqNSy/Z
 aPap4Kjz
X-Proofpoint-GUID: vgcFF0-nRYYKddwMK2-7cQI2G08Betjq
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0dcb9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QYKTPsKsHukT_2dPOMMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: vgcFF0-nRYYKddwMK2-7cQI2G08Betjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
controller as compatible with SM8350.

Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0f814aa6f51406fdbdd7386027f88dfbacb24392..a18183f7ec21ac0d09fecb86e8e77e3e4fffec12 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde9b0fc5af11aad1fcee860939c66f..c5d209019124da3127285f61bf5a27d346a3d8a1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -61,7 +61,8 @@ patternProperties:
     additionalProperties: true
     properties:
       compatible:
-        const: qcom,sm7150-dp
+        contains:
+          const: qcom,sm7150-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -378,7 +379,8 @@ examples:
         };
 
         displayport-controller@ae90000 {
-            compatible = "qcom,sm7150-dp";
+            compatible = "qcom,sm7150-dp",
+                         "qcom,sm8350-dp";
             reg = <0xae90000 0x200>,
                   <0xae90200 0x200>,
                   <0xae90400 0xc00>,

-- 
2.47.2


