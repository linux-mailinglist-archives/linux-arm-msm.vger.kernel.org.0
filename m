Return-Path: <linux-arm-msm+bounces-74839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E507B9CEDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B53901BC3D83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1332D94B0;
	Thu, 25 Sep 2025 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YknGhvU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD712D8396
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761557; cv=none; b=V/Po02ikOtj5ni8fhPuGoWeNt0Az+SQjVFkn8FOrS/+ek5Q8aaTUcszqqdm+lJLXLd4uSB6KWoGB9uXY/5slAoGSiZx85jjAVgyRlgRIsdrnxX5lQbsbnCvbnUK55Ga/wi/VKzNmjLe3uSmKZ4p5QUFXl5M1BBlMeQAGKl/DOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761557; c=relaxed/simple;
	bh=hRao4UrERcNdb8WEbncfpT8mndQ9UcxF3KEWBpC5u2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n37yva0YY5YMki/UHGrWl2WbLLll/3Y/46xwmT8rnOnb0lvr6OmoKx6dEr5F+H9DsPtV2QWGI0evf6pBNwczZbMkxLVYBIEal9EWdNv+AfNHdy8QKE2sjvB6m+cEdyfM4/Etfh+gfTbbBSPcvQbXfwS45Pe1EgIGbPlFsRl7k4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YknGhvU2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XFns025105
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xn4sEHzNAa+
	rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=; b=YknGhvU2ad4B5JZ51NAbfxbq5CP
	B+J0ADTRSvaUnyAE2Gcf5XEivQcaFbrm6sd8D3am9X2WkrHM1cHcqILtRCigmr0p
	6h7PjnUNdR104FzHy3g6quV9LhDHEwXcAMr/DTy6o1K5CM3JYkwp2SQc/eFb3slP
	HB1IMrWHSO1XLBdQubqvW1C1iHUiehrLFGvyjlqtw6oEsTyizlIg94E1Z4EhWIHk
	aREXCHASackBMHLWFU8Ij7o+QAFxNLqMH58RP7UScN4TN5BfGb4fCbegMZJe6cjf
	zJuegYMpa429dvlImEKhZBkbzhcX11w4n+2Yv2PjE5y6YzeeHdTi+SIceNw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv1683h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eca7298d9so7903165ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761554; x=1759366354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xn4sEHzNAa+rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=;
        b=LqAlUInHgLEr9r/huFmXZdfsp+1r2F58C4pXxbwJRYX1I2Iq5dLKYWWN9n9B3eKkJe
         V45mL+MoPLutcEJZV+lPDf55qXaBM7gn2f3GDZgNfr8gVq9Uan5REyvmJuvM8mIdFzyR
         OOxdSW8T6VWN2Jh1xoLlm1LgIiaMitpqmTE+xhYlhxgHZUviLANq9L8AvzMLK9uTYFh6
         W0HvObBS4PHI0xjurxgwQKfMuQymwHhXaaootNx6BPn1RQty6fSc23iwHikJqu97BbTn
         W0OIR/co677N7hXL5rK9PsFhmsAXCSOWuVoVACLbV1rY1jhMR/4D3NLcTK0ksSwmyDCm
         8ZXQ==
X-Gm-Message-State: AOJu0Yxhmzerqbr+cN6vNj+xWhWZqyXr69NoJ22SefiJagny7LdqDgrN
	C5lmp880K3mQorukGIculLEmFwXlfP/z/086JRATpnnnaBbSE8MdR7dFjwaBkHAQ8Ce6BN4pV6l
	RtlQPtmdf39so81BWxEUzBMG2iUYOOPw5xpPo2o8xRzmAkNSZUAjN9oxyuUHcjAyeEua9
X-Gm-Gg: ASbGncs+IWV0Ejf3jbKaHFVhdcRlkwSGiA8V/2+Ng2amf+qLHi+SWOPdaqMuLavb1oN
	laXH4nOgs5nOmQjbGhH8bvsl8MeiHluwjZ/WZdg9czZDVQr1pArcc2olkYIz1bMbc1e5vBxnuOA
	dI6HuiTWc5sCyIV4k8+sSqr+QAUoLwwB+sAF1jxQfEkDo0i27NESKZzAuSZZ/mwShVQl4+clWSy
	kn4fKtvqJ4LBWjQWYTve5eSve3d7MwN1KdIAaXtEf0Rx0ipcWL2kWnOYxfbzqBRlKkhV6160DdN
	D/IUoVb0M6PhT22Wb79KZFSfDLxWd8B6gahjVwdJAuGlxo2SH9Sex6cKNSz8p5aM3ePlHbP4Y0J
	BrwFkP4WwRiPV9NBW
X-Received: by 2002:a17:903:946:b0:271:49f:eaf5 with SMTP id d9443c01a7336-27ed4a30d16mr18646415ad.30.1758761554087;
        Wed, 24 Sep 2025 17:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0BLBhfqoLRlN6qFMkJxr7vlacqg8A7EpkzWtOHvCyZqAcmJHOiOE6WNsUjzSArIKZUFj+xQ==
X-Received: by 2002:a17:903:946:b0:271:49f:eaf5 with SMTP id d9443c01a7336-27ed4a30d16mr18646155ad.30.1758761553655;
        Wed, 24 Sep 2025 17:52:33 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:33 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Wed, 24 Sep 2025 17:52:19 -0700
Message-Id: <20250925005228.4035927-2-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: TtQSt7oht77UlKPS_-JUuBRKwqsoLAxQ
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d49253 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tYbxrAoMRz_Rh0uxvwoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX1VyJQAvuzh8W
 qZ1OJ8qMu3oE+4RjDscw69xYGw2IJKGbg/NoA7f43kaDb/h1XXEX0ltsoMY23fq8T1RnJg5Eva0
 mKMknvjalCpwcqIL76VtgYnFY0ivBqZotlHU44zNZFibWpnh/GiyZI09tuUEYHXK3kEYOjE3Ypz
 yfO6WZ+xHXrw6X3nJkbcYKsuxEV3DbJymz+gqrggLafNr3XV1ZAJij/3Qe5pb2v4+WUpkCg6/HG
 mwD+52pIR78fUNdXEGr3032Ieoi76Qb23GcjMpHl0wBEdkYo+IN9HJ0fgxVTBSVNZfDdYoBkWHK
 tDCHHgmk7Z1lGXLfIFo9M5kOrTaTUk+MvlSRXi0t3VrJprrE8tcgMayoSJv7pQPakjTMjY/QA05
 gxtavWkS
X-Proofpoint-ORIG-GUID: TtQSt7oht77UlKPS_-JUuBRKwqsoLAxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..2f1f41b64bbd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-dp-phy
       - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
@@ -46,7 +47,7 @@ properties:
       - const: ref
       - const: com_aux
       - const: usb3_pipe
-      - const: cfg_ahb
+      - enum: [cfg_ahb, clkref]
 
   power-domains:
     maxItems: 1
@@ -63,6 +64,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -109,6 +112,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sc7180-qmp-usb3-dp-phy
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -128,6 +132,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +147,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

