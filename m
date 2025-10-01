Return-Path: <linux-arm-msm+bounces-75721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E1BB1EAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 00:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24C9C480667
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 22:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CB831280A;
	Wed,  1 Oct 2025 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hj4ciPud"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031FE145355
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356344; cv=none; b=iVgiVoONhqOXjdjjDcv+u52GQRLiWiAw1OAqblWATWyauhWxcP0zH/ZhGDz+M8i6e+NBgY3Df7t89yIhHB5NAxf869/IU3iPbrdJspMU7ghQr0Nsm8NYCXhww5GDW8fVFxq/38bnrfB+7AeSVSOCTZ3ITMUUqp8lxQiywm5FCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356344; c=relaxed/simple;
	bh=MCbqnX73P4uJn/n4jiAlTVZO9e/LGJ1yW50aiT4ZX9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cRS6eeaGN3p5hKgftXszLA7QFViJuPtec8/qwxYz6A1gupOcj3VJ57EuyrBDiFu8BUR35nvnWEL4tP32QmdGj5mt8+zl+hYA9Iv64ZhT8NJkFBJN/ooU8oCotg1WVoeGEWQDRM9ymgeVGZz5dJVME/vF2cuDJD0EtukaOR/mtaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj4ciPud; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcE6Q018009
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 22:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YYQJM1FZM3o
	3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=; b=hj4ciPudSQPTU+U1pI5THoE1fAN
	0Fc3bwT1gTOt3MkyH6+BVYF+ABdncobayX/s5qw6WDfRtpJx76XsqkVgZOxP/PB/
	3pZRr6YfOiy2Xtn/Q5jkGEmL1jfE1uryTv7JUMJ3Byc+S6DUZu6gpiZzzFpakjFS
	3YITEzDydigo3lz9IpMeexwko8f7p5jMBfIfIAN0GQ6SYMQW6oKjTdIIlipG3/ze
	jtz8mWQqYIeAiOJyAaGLWwzZQjC4zZHOjOQXx29uSOfEaySQsD7O/l5+mrZ+orh4
	AZ+GQX9NWSusmaWdV2rC3Mx9YbaW+ZQlMd1TVD8XZS09dKJOmLeNT+KODWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf7hay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 22:05:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so536393a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356340; x=1759961140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYQJM1FZM3o3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=;
        b=qGa+UclQP0Om+xEkyL+MjMGM2b9KnDTAZkY38/oetIrRV4xT7CyqLyxk8QiUR0jRBr
         bG7Wkj5JuErXL9O3rqd9tDwhQmL3NxnO3lXLUG5N+fvMd5sXS0WMgyXE+VwB9vMGsro+
         0Xo0w10+UAPLaZu8GtCEuLVoJJ8chBbRxWJSdtgmFrls8Ei33KCbZkIiGczd6o98vqHo
         N9oOTn4z90s3Ojv/9N/tXGbWwlSz6VxO7H9v5Y8IQSNiE0UI0UuqqYT0HWOYpwYX8K5g
         lgjJN6O9uH3w5Ogyotm52IuJJkrZ8NLD0/zDf+2Yj+AjeoybNq/j4RT25UiEwsDYE17c
         OQcQ==
X-Gm-Message-State: AOJu0YzO7IMt0zbZTz8pNG9n3dE/LyyLoU+o9+jNAYqNAkCUMO8dldbD
	5FnXzaTWnFESO5ZiJf7NREcejxzFUqrSi0J7WutTM9pcoTqrzfF3k7CzFArY06SXT4IgFUzH+/B
	Cn/B9PJzmaaluMx6p02cywtshIS/J/EcktxLT0Xen0IedRmbozWbMQP9U9ogEjVrOvfhX
X-Gm-Gg: ASbGncsuSLjervbpqGNR0//DU8lpU5UkWqr5iin2kzZvj16d427iD0U/F0KDfHIddtB
	QME8nk2pc0xeTGFFrQqfSC5pFwDnVh/rk7bcBER/HXNlf/XwOD5+Vu35I/pLKiciiRE3Vj9f+sx
	EII8OOOqPdXNg6K6KIMZJMwv5UGeNCKKkCM9fLr9UITbdlD5B6izvmVNMrXw0l5jhCByXL5eXd6
	ZcolJd8DlQUZxfLJPaZ+KwMwqdkl6Gu2HpdYbPWhnAu2Py6ro1h8PSTQEFQBFxGgxRsmxqFYIWn
	2hIFN1+E5FQGO4ZPhbmwvOgrhcyUVPKdWdaMLqzs/gO1PAMLx9YI5F+afyCP8qJAN+7It8tfAjy
	l5IRcg6xQk4fUk6xk4zzUjg==
X-Received: by 2002:a17:90b:1b0d:b0:335:28ee:eeaf with SMTP id 98e67ed59e1d1-339a6f6b08dmr6125777a91.29.1759356340441;
        Wed, 01 Oct 2025 15:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnpFbmIm/22XzKrvgj3DpJIIWDvuNtoI8e9ISV9nBUIC51KNVUubMK51OjfPXVbhfl8vYXjw==
X-Received: by 2002:a17:90b:1b0d:b0:335:28ee:eeaf with SMTP id 98e67ed59e1d1-339a6f6b08dmr6125752a91.29.1759356340029;
        Wed, 01 Oct 2025 15:05:40 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:39 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Wed,  1 Oct 2025 15:05:26 -0700
Message-Id: <20251001220534.3166401-3-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lCvyVa2eoMHQ5TO3dVurqFBtLhVaAT6b
X-Proofpoint-GUID: lCvyVa2eoMHQ5TO3dVurqFBtLhVaAT6b
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dda5b5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=e4LYGitkWRZSOGXTHbEA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX9BVUePBT6SeO
 Jk2PvUxLYFcADNlPcdXxtLl1KKaPlguFzgOVBKpwmvkMAyB2TvepUjG7g2ZuYzuie9EYvhAvFkm
 A/QHccBwkvNlzSv3gNsn3wxqnAqz4VNtjtDLTbrVLGtHyWn1ktAZtZ1n6CB9nr5z6lM1MJVXhZb
 28SKE+BVcjcuH3uK93PgyRrE+CR1HAOwtVH/aTCcoqyZwShwAw9d4ay2/ROhXdxwVb+HVGfLzD7
 dis3SKgCSRf0mvQZbUVA5Lb/IOOtzIwLVPG+2fg6feCRCWb1QVBG3rRgCaUUDl6md/D4EpeF0lT
 NNirwLB3KcLfa/4PP1DNOm1RGfq0BXPhD/C3E+pAXd3jInVsgXrsAoQPFWjb5mQGih/jtqnaZLH
 /WMqZQbjvOQ0S2DyCy2SvYr37Zs4Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC, and
the required clkref clock name.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index a1b55168e050..b0ce803d2b49 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-uni-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy
@@ -62,6 +63,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 0
 
@@ -157,6 +160,25 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: aux
+            - const: clkref
+            - const: ref
+            - const: com_aux
+            - const: pipe
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
@@ -165,6 +187,19 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

