Return-Path: <linux-arm-msm+bounces-74873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4AB9D29A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5062E7F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761B12E88B3;
	Thu, 25 Sep 2025 02:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1wDHdzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714BE2E7657
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767341; cv=none; b=cK/yRkqeGIkItjj2Cu3WfzuSupgk9uMzYVjelWKzvVi4x5e7G/CrVrw4/13iu1fMr8WTRxxRGM3S59zaVcU0AO2JENH34GqGUIIfHD6ziEsiIgjLtEsu9RQVz4tKYBe7s1ZOl6MydGJmPenyTgsdYZhQr3ghrcOkEkdT7GTjfx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767341; c=relaxed/simple;
	bh=Li7Axgqj1Qyy3uX3oX9irsrd0UwAJw/MhTIJL1ssmMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HroWcvUKa/mcmABRXwm1UG9DxgY8o75hzVbOZhfRz2gU/wEuEU3mkYofIIpH92NERKiRDalEnegklaH9LYyPCnLuJCaV4kO+q5ZWArLsL6WaW3dcQ1OQynQLHkMtFCukGUierIMTOn4/5Ze7K9aXCVR25YbWA2ej+xZF9a0hK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1wDHdzW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1WArC001919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NkSIvXe2PoZ
	kc0A70JhcEzpgbRLO6/8AmGazVnh8Tx0=; b=J1wDHdzWsDKpAy1PIx5WXXmAS5l
	4Y0MZfOTMAW/u23Ac2cX6SBTPZtKF6dEFNSo5/UzFw0jNDmNce8SdXUyBrDEBSJS
	Xpn8rrAoyStypUmA6i3vfWrphgI84b8QR04b6T4HwTwUcTU+xtdUstAjnDkzziuw
	Q3REK25run5gZ0vvVpC+LgUsarJth8J+UPeuoLQrwU/zBXdqJMoOdkIo50Ii8yJQ
	IBPE580NzBnclsiLED4mjk2qVKMpm5W5PMrzz5hdxWX8L3Y68SVq6nVpjrlJWX+Y
	OGcqqWgiUHWFu0uUJ2500C8RYAfCgkpZHCa74xrpVpL14+d17sX68SKupXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pep5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec2211659so512098a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767337; x=1759372137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkSIvXe2PoZkc0A70JhcEzpgbRLO6/8AmGazVnh8Tx0=;
        b=i/kNS3BYWt9YingITAqmlHs/uTcgBW9rnx4uAQH6JSHxak2SCFT5T6okRV1rLtfcuB
         fMX/MKnFtm1/CRDzz45XVJ/gR0xSOraoyc8OoRnqx/ZWEWMOXDyRoN1bZBz+AnbbNhV1
         DjmmNUvRTKG3y+0pAFF4Ug/iDE0EblgRLZKuWFxvJN475NHzEdPCbb3VcSAxM1hpoYaG
         emBColG+rFLkHk/Ur9jD8o4cOswuRjJ57pM3UsUcrjQVwA5+70wJWlVX6A/8/Kmbrxia
         ShF22tK2UTrl4UaJPWEs4OVz5Ha6k3o4OUYrFAe5PVtrJOHa7EGUuoatyzZkixI8+UPv
         GGdQ==
X-Gm-Message-State: AOJu0Yw0QSUwCEVHdtoJIS/AgK7o3IvS7sClgw7M0BADB3cNr2DSyCGr
	A7nYWgElhqwDpaVA90PBTY9DN1q/EYAivEuETT+yuMcwrQdEaEnoJSufSpcMCtbLbtVLO9657vB
	S+jWjhzVcW6bM4S5ZdhJow/ycoeTY3MTnNYjw7r0kg7m45d/ATXU3m3XE8UmTz+36F9qe
X-Gm-Gg: ASbGncuXAhrpze8roHE4of5Ct0psCraLxErvO9GpW8D9jx22t+Dvkab4u9mBYfF8XM9
	wEdTjhi5xMPW/519svhIzWEpF6z9DxE5zFXRmNKSqaZYjNy4MjiCjWMSPkEtGzuDgATN8/rSnGC
	xmI1yOxuQv0Skfs2EA4XLN/rT87UPiitqTOGIBQURK/baRGGNBKbGri4aXNYKeoCfm2YlRKiBPQ
	wYpGs/bHy5awJdGS7GJcBT9YphXcSi/55N79HgufN41uKILgRiDcz5qkydIQOcom2+2AnT1Zy8q
	+1+Wn0XB3B4TdYq19Ejb7VeR40dScnhvOv0EKhFM2N2eYUUQgVufTHoSNhlPO2yXEaywhwRQYfE
	T7cWk5Gw7AUjAJ+QB
X-Received: by 2002:a17:90a:e705:b0:32e:7270:94a1 with SMTP id 98e67ed59e1d1-3342a2b94aamr2128086a91.17.1758767337018;
        Wed, 24 Sep 2025 19:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU67qmxExDZGHwTuZe0bg+hJ3mFuAKodDprKDYzQgHWUaEECh5/A/FMklWCasb9xyD1Ojlog==
X-Received: by 2002:a17:90a:e705:b0:32e:7270:94a1 with SMTP id 98e67ed59e1d1-3342a2b94aamr2128050a91.17.1758767336533;
        Wed, 24 Sep 2025 19:28:56 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:55 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Wed, 24 Sep 2025 19:28:42 -0700
Message-Id: <20250925022850.4133013-3-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YJAyhtInafvOb4vxyM9A2fYvUfI16eLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX3I7Fa+laMgwC
 esnEQafdijKZbrPlVfEktnyilKTBEugSP9dxYskk0P7EK1RDdKY98JBvCFbH6gmnjjwrcwHW65X
 JNHJm1V0oFJtKT3lOJNU3hObjz++D6Dz4PnhVpD0rpoEyQYtdv9yD6reBTamKvoUSdrb+vGhB1p
 U4QvLUry7hz3NfEAj31UBKYX3yol+4isRG9p4fR98OR60ynVm3uqQIoxlO1LdrGGbkYG4X31WIw
 MZ4Pt1u3A5qXz6kpasTMLZ5zCcKokED0Vj99rYuBTG2caOrDyexGwm6a83pkgMzFiyJ7ft1bUH6
 I53M/D6264IzO89dMe0w+aPe8iMmA9R+ZwAzsna3T3CVE8mbZjSKa1BS2hPxuC1VV99/3TJIT7h
 U+XKpXtn
X-Proofpoint-ORIG-GUID: YJAyhtInafvOb4vxyM9A2fYvUfI16eLX
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4a8ea cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=e4LYGitkWRZSOGXTHbEA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

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

