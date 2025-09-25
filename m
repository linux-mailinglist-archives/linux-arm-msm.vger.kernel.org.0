Return-Path: <linux-arm-msm+bounces-74840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AEB9CEF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E081E1BC3E40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ED92DAFCC;
	Thu, 25 Sep 2025 00:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxNcja/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF752D839D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761559; cv=none; b=pNOZ94BtqtS3NOZloyRVCMnkf8rcCN3WpdF7ha3C1lfJl78r5bpvGKCcrW7APHYDJHVAnfsXnDb5uYDurtqcx3n6JrEK7b55byciIGduv3ljDQ+F4+kOw8HHXxH2te664XOOQLIQZmKhnuXq8OskJ/8PXRYcEDJPyaoH5tfI4KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761559; c=relaxed/simple;
	bh=Li7Axgqj1Qyy3uX3oX9irsrd0UwAJw/MhTIJL1ssmMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eDdK5+RQ3VgsvMBYeLa9Tj69cADZcQQDJJ1r2TLK8gBTqSpJY5V9w1loDpAk8kmtMg+1ktTAdfpdhKWF0MC6Mn1Z1opU6xslVjFQVO0/S2kPkM5lwq4ZGGc7xFOO44EBLsN3Or2Xc6Rxtx8ixPacLSAnesz8IyGRTF1L2Wft8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxNcja/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD36fC027759
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NkSIvXe2PoZ
	kc0A70JhcEzpgbRLO6/8AmGazVnh8Tx0=; b=fxNcja/fF5TShCb/P5DbtfyILXs
	03XEYEGvzjC6BpBdXmWb6MPyBEkx2yTfbWNRZjypJ39s7Qiz72R579j80w+FjnhK
	atUKHcw7fxURRVB3lJYM2CClhJsDeWUhaSU0vPg2v1SKgVj/JOWB/RE5L9dHQpSQ
	eclIUBhytoH6a7OBIqWRuJNoxanSBgz3FjMD/lcbPwIGO9Uhhf1DeqSlqRMnbNpw
	4c6A7kAkCiSCzC2X6oKi5SfLUoOTuOaK1dzNj4BespaRQjVO8B5DDWhAdHQOL3rM
	dbJMwobrL9MfWo8N0S4XHwmtSHLS/95qfB4nvWKf0F96TCr7nDWc3Ccrr+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxjnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2697c4e7354so14093105ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761555; x=1759366355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkSIvXe2PoZkc0A70JhcEzpgbRLO6/8AmGazVnh8Tx0=;
        b=tEahA9EAbyw+Haei6CRJc6/a7dmGuHcGaIUIVCP8CtheRf5VVKBtz7WgaWVDkIQGaz
         haaVEfY9yWrSddMVn1r48FfQZKkd6hb+k5YhqoKHD33EDS8GRFmdGuWcn8e2OCEkf92g
         9eW/c54RxJ5VAXRw+Lm+wwG2fxgcL6wh+sGbJlW1mz5EWefWsvvt20yAE1i0hEDZXhnm
         R/m6CPP9Wsm/LD++Xq182IfA2SvXeeSQKUtDna/Dp/nT+D5lTjClG4EWyAT3iH19rmuv
         GsE+8wpazP9gxus5iT7JhPGSQ5AUDeynhg/bdNAFBW9gF3+vD5ElfWSKyzqNupDi7c94
         UALQ==
X-Gm-Message-State: AOJu0YxZ6On1jf4hgQ6vrJ2mOD/IuMr02mImOIJbfsd8gIn/WlL18Lh3
	FjBD4ee9PfxXg1+94FRAHGdq3E08KxBOGUec1Y4/dQS+iv8an0GNcFoWP9sT1UPGboWPrWgfcwJ
	dmQsrEGp5Mu84dxD//IboPmAgOdZdpf8CuE0mP93PUMn+FVUTxQrAKKdMv74CNFENW979
X-Gm-Gg: ASbGncvqoiT30rbJSBMkes8goiNlKxsY0wcDpgl7Rcwtf2lDjK6cM+jiZFaGmY12UKs
	eDOzKHWtFE9OBE1DFZJxd25LvlPiXwTEX9mDm09aoWbpfbcMtYj8Uy4En+agPqkHDBGCEgBakZP
	+zI0AieQU0xBmiBoLo7/rgXmaNP9aXn7Wf312KkUZ45NEyy6Ubv8cBO0k0bHG7I/lamTHoz6zcQ
	5lxvheEG85NtN5nHcxA9aR4IHKk+VMeK05bWbdp6+trKLJDO5iG9a8pVai8rP0aAfqWHmAn/RiE
	vfeoEvbHH/EtIhd85WmXB5KF6fJ3lyTnO4OrcdNen99Eggbkvm5AmQxlSFyVy/e5fNTM3s+24F1
	lJfes1UxSFFC1YMB1
X-Received: by 2002:a17:902:db11:b0:27c:3690:2c5d with SMTP id d9443c01a7336-27ed6780b92mr10331155ad.0.1758761555442;
        Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD71bqcxeydKwo12qj/CeiC45HSksvyE7WjcM/YRZ+SXEC1DBAWRjoO9AkKTUboK+ohtAoJQ==
X-Received: by 2002:a17:902:db11:b0:27c:3690:2c5d with SMTP id d9443c01a7336-27ed6780b92mr10330885ad.0.1758761555019;
        Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:34 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Wed, 24 Sep 2025 17:52:20 -0700
Message-Id: <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d49254 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=e4LYGitkWRZSOGXTHbEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ol5aAwY7xbEaOXFeSA2uNiZYcuPHlvQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX8MZ/gWC36Wjy
 rVKfXKEm3e23NpMhNE3AMDmyQU34bvRTCmOWruI9AxrymuKsbiKf8EiulU5zNM/pMPnu9uhp8FK
 P5cJzAxmoR4hr3wLWbiEf1Kkf08FHAWAkIwNpO6/zxjpoNRGpRlwJAIhLoU98Tgwre8izUhS4v6
 lcIXBoN/PKXMxjmDZeNHmQAGZLQ1NaJJdO5ASOJ/pTBZI31DHgXldYegtjkXy1xcLwHzCUFs//7
 NksYL5zfvG33LEj83t/VNGlz4C2Vu3z8IPoOnSeRL14Xf1CGjXpnPL24ikuAifff3JoX5wBQJs0
 LrqParNyMafF8Z8ksyuVVJ16s3MntTtnlU7fFdhQOEmi6ea3B/fZQvGSs07l8I+8F+DOZ1YZ//f
 LiZLozkz
X-Proofpoint-GUID: ol5aAwY7xbEaOXFeSA2uNiZYcuPHlvQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.

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

